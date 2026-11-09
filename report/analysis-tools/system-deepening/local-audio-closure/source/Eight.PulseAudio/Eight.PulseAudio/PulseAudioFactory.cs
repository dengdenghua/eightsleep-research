using System;
using System.Collections.Generic;
using System.IO.Pipelines;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace Eight.PulseAudio;

public sealed class PulseAudioFactory : IDisposable, IPulseAudioFactory
{
	private readonly ILogger<PulseAudioFactory> logger;

	private readonly IServiceProvider serviceProvider;

	private readonly ThreadedMainLoop mainLoop;

	private bool disposed;

	private ContextSubscription? contextSubscription;

	public unsafe ChannelMap CreateStereoChannelMap()
	{
		using (mainLoop.Lock())
		{
			ChannelMap channelMap = new ChannelMap(default);
			fixed (pa_channel_map* m = &channelMap.Struct)
			{
				PulseAudio.pa_channel_map_init_stereo(m);
			}
			return channelMap;
		}
	}

	public ChannelMap CreateSwappedStereoChannelMap()
	{
		return ChannelMap.SwappedStereo();
	}

	public Context? CreateContext(string name, IEnumerable<KeyValuePair<string, string>> pairs)
	{
		using PropList propList = CreatePropList(pairs);
		return CreateContext(name, propList);
	}

	public Context? CreateContext(string name, PropList propList)
	{
		using (mainLoop.Lock())
		{
			Context context = CreateContextWithPropList(name, propList);
			if (context == null)
			{
				return null;
			}
			while (true)
			{
				pa_context_state_t state = context.GetState();
				if (state == pa_context_state_t.PA_CONTEXT_READY)
				{
					break;
				}
				if (!PulseAudio.PA_CONTEXT_IS_GOOD(state))
				{
					LogContextError(context);
					context.Dispose();
					return null;
				}
				mainLoop.WaitForSignal();
			}
			CreateContextSubscription(context);
			using Operation operation = SubscribeToNotifications(context);
			if (operation == null)
			{
				LogContextError(context);
				context.Dispose();
				return null;
			}
			return context;
		}
	}

	private unsafe Context? CreateContextWithPropList(string name, PropList propList)
	{
		pa_context* pointer = PulseAudio.pa_context_new_with_proplist(PulseAudio.pa_threaded_mainloop_get_api(mainLoop.pointer), name, propList.pointer);
		Context context = new Context(mainLoop, pointer);
		PulseAudio.pa_context_set_state_callback(context.Pointer, (delegate* unmanaged[Cdecl]<pa_context*, void*, void>)(&ContextRunningCallback), (void*)mainLoop.pointer);
		if (PulseAudio.pa_context_connect(context.Pointer, null, pa_context_flags_t.PA_CONTEXT_NOFLAGS, null) != 0)
		{
			context.Dispose();
			logger.LogInformation("Failed to create context");
			return null;
		}
		return context;
	}

	private unsafe Operation? SubscribeToNotifications(Context context)
	{
		return SubscribeToContext(context, pa_subscription_mask_t.PA_SUBSCRIPTION_MASK_SINK_INPUT, null, null);
	}

	private unsafe void LogContextError(Context context)
	{
		int errorCode = PulseAudio.pa_context_errno(context.Pointer);
		PulseAudioError(errorCode);
	}

	[UnmanagedCallersOnly(CallConvs = new Type[] { typeof(CallConvCdecl) })]
	private unsafe static void ContextRunningCallback(pa_context* context, void* data)
	{
		pa_context_state_t pa_context_state_t2 = PulseAudio.pa_context_get_state(context);
		Console.WriteLine($"pulse: context state has changed to {pa_context_state_t2}");
		if (pa_context_state_t2 - 4 <= pa_context_state_t.PA_CONTEXT_AUTHORIZING)
		{
			PulseAudio.pa_threaded_mainloop_signal((pa_threaded_mainloop*)data, 0);
		}
	}

	private void CreateContextSubscription(Context context)
	{
		contextSubscription?.Dispose();
		contextSubscription = new ContextSubscription(context);
		contextSubscription.Subscribe();
	}

	internal unsafe Operation? CreateOperation(pa_operation* operation)
	{
		if (operation == null)
		{
			return null;
		}
		return new Operation(mainLoop, operation);
	}

	public unsafe PropList CreatePropList(IEnumerable<KeyValuePair<string, string>> pairs)
	{
		using (mainLoop.Lock())
		{
			pa_proplist* proplist = PulseAudio.pa_proplist_new();
			PropList propList = new PropList(mainLoop, proplist);
			foreach (KeyValuePair<string, string> pair in pairs)
			{
				if (PulseAudio.pa_proplist_sets(propList.pointer, pair.Key, pair.Value) != 0)
				{
					Console.WriteLine("Failed to add item to proplist");
				}
			}
			return propList;
		}
	}

	public PulseAudioFactory(ILogger<PulseAudioFactory> logger, IServiceProvider serviceProvider, ThreadedMainLoop mainLoop)
	{
		this.logger = logger;
		this.serviceProvider = serviceProvider;
		this.mainLoop = mainLoop;
		base._002Ector();
	}

	public void Dispose()
	{
		if (!disposed)
		{
			contextSubscription?.Dispose();
			contextSubscription = null;
			mainLoop.Dispose();
			disposed = true;
		}
	}

	private void PulseAudioError(int errorCode)
	{
		logger.LogInformation("PulseAudio Error: {error}", Utils.GetErrorMessage(errorCode));
	}

	public IAudioStreamWriter CreateAudioStreamWriter(Stream stream, PipeReader reader)
	{
		return new AudioStreamWriter(serviceProvider.GetRequiredService<ILogger<AudioStreamWriter>>(), stream, reader);
	}

	public SampleSpec CreateSampleSpec(int bitsPerSample, int sampleRate, int channels, bool isLittleEndian)
	{
		return new SampleSpec(new pa_sample_spec
		{
			format = GetFormat(bitsPerSample, isLittleEndian),
			rate = (uint)sampleRate,
			channels = (byte)channels
		});
	}

	private pa_sample_format_t GetFormat(int bitsPerSample, bool isLittleEndian)
	{
		switch (bitsPerSample)
		{
		case 16:
			if (!isLittleEndian)
			{
				break;
			}
			return pa_sample_format_t.PA_SAMPLE_S16LE;
		case 24:
			if (!isLittleEndian)
			{
				break;
			}
			return pa_sample_format_t.PA_SAMPLE_S24LE;
		}
		throw new NotImplementedException();
	}

	public Stream? CreateStream(Context context, string name, SampleSpec sampleSpec, ChannelMap channelMap, IEnumerable<KeyValuePair<string, string>> entries)
	{
		using PropList propList = CreatePropList(entries);
		return CreateStream(context, name, sampleSpec, channelMap, propList);
	}

	public Stream? CreateStream(Context context, string name, SampleSpec sampleSpec, ChannelMap channelMap, PropList propList)
	{
		using (mainLoop.Lock())
		{
			Stream stream = CreateStreamWithPropList(context, name, sampleSpec, channelMap, propList);
			if (stream == null)
			{
				return null;
			}
			return stream;
		}
	}

	private unsafe Stream? CreateStreamWithPropList(Context context, string name, SampleSpec sampleSpec, ChannelMap channelMap, PropList propList)
	{
		pa_stream* ptr;
		fixed (pa_sample_spec* ss = &sampleSpec.Struct)
		{
			fixed (pa_channel_map* map = &channelMap.Struct)
			{
				ptr = PulseAudio.pa_stream_new_with_proplist(context.Pointer, name, ss, map, propList.pointer);
			}
		}
		if (ptr == null)
		{
			LogContextError(context);
			return null;
		}
		return new Stream(mainLoop, contextSubscription, ptr);
	}

	public unsafe Operation? SubscribeToContext(Context context, pa_subscription_mask_t mask, delegate* unmanaged<pa_context*, int, void*, void> callback, void* userdata)
	{
		pa_operation* operation = PulseAudio.pa_context_subscribe(context.Pointer, mask, callback, userdata);
		return CreateOperation(operation);
	}
}
