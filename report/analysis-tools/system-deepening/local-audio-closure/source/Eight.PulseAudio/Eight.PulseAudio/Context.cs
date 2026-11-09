using System;

namespace Eight.PulseAudio;

public sealed class Context : IDisposable
{
	private readonly ILockProvider lockProvider;

	internal unsafe pa_context* Pointer;

	private bool disposed;

	internal unsafe Context(ILockProvider lockProvider, pa_context* pointer)
	{
		this.lockProvider = lockProvider;
		Pointer = pointer;
	}

	internal unsafe pa_context_state_t GetState()
	{
		ThrowIfDisposed();
		return PulseAudio.pa_context_get_state(Pointer);
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
			PulseAudio.pa_context_disconnect(Pointer);
			PulseAudio.pa_context_unref(Pointer);
			Pointer = null;
		}
	}

	private void ThrowIfDisposed()
	{
		ObjectDisposedException.ThrowIf(disposed, this);
	}
}
