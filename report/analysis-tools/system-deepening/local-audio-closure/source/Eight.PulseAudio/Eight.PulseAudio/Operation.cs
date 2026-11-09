using System;

namespace Eight.PulseAudio;

public sealed class Operation : IDisposable
{
	private readonly ILockProvider provider;

	private unsafe readonly pa_operation* pointer;

	private bool disposed;

	internal unsafe Operation(ILockProvider provider, pa_operation* pointer)
	{
		this.provider = provider;
		this.pointer = pointer;
	}

	public unsafe void Dispose()
	{
		if (disposed)
		{
			return;
		}
		disposed = true;
		using (provider.Lock())
		{
			PulseAudio.pa_operation_unref(pointer);
		}
	}
}
