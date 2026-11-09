using System;
using System.Buffers;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace Eight.PulseAudio;

public sealed class Stream : IDisposable
{
	internal unsafe readonly pa_stream* Pointer;

	private readonly ILockProvider lockProvider;

	internal readonly GCHandle Handle;

	private readonly ContextSubscription contextSubscription;

	private bool disposed;

	internal pa_cvolume volume;

	private uint? sinkIndex;

	public bool Paused { get; private set; }

	internal unsafe Stream(ILockProvider lockProvider, ContextSubscription contextSubscription, pa_stream* pointer)
	{
		this.lockProvider = lockProvider;
		Pointer = pointer;
		this.contextSubscription = contextSubscription;
		Handle = GCHandle.Alloc(this);
	}

	internal unsafe pa_stream_state_t GetState()
	{
		ThrowIfDisposed();
		return PulseAudio.pa_stream_get_state(Pointer);
	}

	public unsafe void Connect(bool startPaused)
	{
		ThrowIfDisposed();
		int num;
		using (lockProvider.Lock())
		{
			PulseAudio.pa_stream_set_state_callback(Pointer, (delegate* unmanaged[Cdecl]<pa_stream*, void*, void>)(&StreamRunningCallback), (void*)lockProvider.Pointer);
			Paused = startPaused;
			num = PulseAudio.pa_stream_connect_playback(Pointer, null, null, startPaused ? pa_stream_flags_t.PA_STREAM_START_CORKED : pa_stream_flags_t.PA_STREAM_NOFLAGS, null, null);
			while (true)
			{
				pa_stream_state_t state = GetState();
				if (state != pa_stream_state_t.PA_STREAM_CREATING && state != pa_stream_state_t.PA_STREAM_READY)
				{
					Utils.ThrowPulseAudioException(PulseAudio.pa_stream_get_context(Pointer));
					break;
				}
				if (state == pa_stream_state_t.PA_STREAM_READY)
				{
					break;
				}
				lockProvider.WaitForSignal();
			}
		}
		if (num != 0)
		{
			Dispose();
			Utils.ThrowPulseAudioException(PulseAudio.pa_stream_get_context(Pointer));
		}
		UpdateSinkInputInfo();
		SetSinkVolume();
	}

	public unsafe void Flush()
	{
		using (lockProvider.Lock())
		{
			PulseAudio.pa_stream_flush(Pointer, null, null);
		}
	}

	public unsafe void UpdateSinkInputInfo()
	{
		using (lockProvider.Lock())
		{
			pa_context* c = PulseAudio.pa_stream_get_context(Pointer);
			uint idx = PulseAudio.pa_stream_get_index(Pointer);
			PulseAudio.pa_context_get_sink_input_info(c, idx, (delegate* unmanaged[Cdecl]<pa_context*, pa_sink_input_info*, int, void*, void>)(&SinkInputInfoCallback), (void*)GCHandle.ToIntPtr(Handle));
			lockProvider.WaitForSignal();
			lockProvider.Accept();
		}
	}

	public unsafe void Pause()
	{
		ThrowIfDisposed();
		using (lockProvider.Lock())
		{
			PulseAudio.pa_stream_cork(Pointer, 1, (delegate* unmanaged[Cdecl]<pa_stream*, int, void*, void>)(&StreamSuccessCallback), (void*)GCHandle.ToIntPtr(Handle));
			lockProvider.WaitForSignal();
			Paused = true;
		}
	}

	public unsafe void Resume()
	{
		ThrowIfDisposed();
		using (lockProvider.Lock())
		{
			PulseAudio.pa_stream_cork(Pointer, 0, (delegate* unmanaged[Cdecl]<pa_stream*, int, void*, void>)(&StreamSuccessCallback), (void*)GCHandle.ToIntPtr(Handle));
			lockProvider.WaitForSignal();
			Paused = false;
		}
	}

	[UnmanagedCallersOnly(CallConvs = new Type[] { typeof(CallConvCdecl) })]
	private unsafe static void StreamSuccessCallback(pa_stream* c, int success, void* userdata)
	{
		if (GCHandle.FromIntPtr((nint)userdata).Target is Stream stream)
		{
			stream.lockProvider.Signal(0);
		}
	}

	public unsafe bool RequestedData(out int amount)
	{
		amount = 0;
		if (disposed)
		{
			return false;
		}
		using (lockProvider.Lock())
		{
			amount = (int)PulseAudio.pa_stream_writable_size(Pointer);
			if (amount == -1)
			{
				return false;
			}
			return true;
		}
	}

	public bool WriteData(ReadOnlySequence<byte> data, int bytesRequested, out int bytesWritten, out SequencePosition position)
	{
		ThrowIfDisposed();
		using (lockProvider.Lock())
		{
			if (!TryPrepareBlock(data, bytesRequested, out var block, out position))
			{
				bytesWritten = 0;
				return false;
			}
			bytesWritten = block.Length;
			return TryWriteBlock(block);
		}
	}

	private unsafe bool TryPrepareBlock(ReadOnlySequence<byte> data, int length, out Span<byte> block, out SequencePosition position)
	{
		void* ptr = null;
		nuint num = (nuint)length;
		if (PulseAudio.pa_stream_begin_write(Pointer, &ptr, &num) != 0 || ptr == null)
		{
			Utils.ThrowPulseAudioException(PulseAudio.pa_stream_get_context(Pointer));
		}
		Span<byte> span = new Span<byte>(ptr, (int)num);
		data.Slice(0, span.Length).CopyTo(span);
		block = span;
		position = data.GetPosition(block.Length);
		return true;
	}

	private unsafe bool TryWriteBlock(Span<byte> block)
	{
		fixed (byte* data = block)
		{
			PulseAudio.pa_stream_write(Pointer, data, (nuint)block.Length, null, 0, pa_seek_mode_t.PA_SEEK_RELATIVE);
		}
		return true;
	}

	public unsafe void Dispose()
	{
		if (disposed)
		{
			return;
		}
		disposed = true;
		using (lockProvider.Lock())
		{
			PulseAudio.pa_stream_disconnect(Pointer);
			PulseAudio.pa_stream_unref(Pointer);
		}
	}

	private void ThrowIfDisposed()
	{
		ObjectDisposedException.ThrowIf(disposed, this);
	}

	[UnmanagedCallersOnly(CallConvs = new Type[] { typeof(CallConvCdecl) })]
	private unsafe static void StreamRunningCallback(pa_stream* stream, void* data)
	{
		pa_stream_state_t pa_stream_state_t2 = PulseAudio.pa_stream_get_state(stream);
		Console.WriteLine($"pulse: context state has changed to {pa_stream_state_t2}");
		if (pa_stream_state_t2 - 2 <= pa_stream_state_t.PA_STREAM_READY)
		{
			PulseAudio.pa_threaded_mainloop_signal((pa_threaded_mainloop*)data, 0);
		}
	}

	[UnmanagedCallersOnly(CallConvs = new Type[] { typeof(CallConvCdecl) })]
	private unsafe static void SinkInputInfoCallback(pa_context* c, pa_sink_input_info* i, int eol, void* userdata)
	{
		if (GCHandle.FromIntPtr((nint)userdata).Target is Stream stream)
		{
			if (i == null)
			{
				stream.lockProvider.Signal(1);
				return;
			}
			pa_cvolume pa_cvolume2 = i->volume;
			stream.volume = pa_cvolume2;
			stream.sinkIndex = i->sink;
		}
	}

	public unsafe void SetVolume(ushort desiredVolume)
	{
		using (lockProvider.Lock())
		{
			pa_context* c = PulseAudio.pa_stream_get_context(Pointer);
			fixed (pa_cvolume* ptr = &volume)
			{
				pa_channel_map* map = PulseAudio.pa_stream_get_channel_map(Pointer);
				PulseAudio.pa_cvolume_set(ptr, 2u, desiredVolume);
				PulseAudio.pa_cvolume_set_position(ptr, map, pa_channel_position_t.PA_CHANNEL_POSITION_TOP_FRONT_LEFT, desiredVolume);
				PulseAudio.pa_cvolume_set_position(ptr, map, pa_channel_position_t.PA_CHANNEL_POSITION_TOP_FRONT_RIGHT, desiredVolume);
				PulseAudio.pa_context_set_sink_input_volume(c, PulseAudio.pa_stream_get_index(Pointer), ptr, null, null);
			}
		}
	}

	private unsafe void SetSinkVolume()
	{
		uint? num = sinkIndex;
		if (!num.HasValue)
		{
			return;
		}
		using (lockProvider.Lock())
		{
			pa_cvolume pa_cvolume2 = default;
			pa_cvolume* ptr = PulseAudio.pa_cvolume_init(&pa_cvolume2);
			PulseAudio.pa_cvolume_set(ptr, 2u, 65535u);
			pa_channel_map* map = PulseAudio.pa_stream_get_channel_map(Pointer);
			PulseAudio.pa_cvolume_set_position(ptr, map, pa_channel_position_t.PA_CHANNEL_POSITION_TOP_FRONT_LEFT, 65535u);
			PulseAudio.pa_cvolume_set_position(ptr, map, pa_channel_position_t.PA_CHANNEL_POSITION_TOP_FRONT_RIGHT, 65535u);
			PulseAudio.pa_context_set_sink_volume_by_index(PulseAudio.pa_stream_get_context(Pointer), sinkIndex.Value, ptr, null, null);
		}
	}

	public unsafe ushort GetVolume()
	{
		return (ushort)volume.values[0];
	}
}
