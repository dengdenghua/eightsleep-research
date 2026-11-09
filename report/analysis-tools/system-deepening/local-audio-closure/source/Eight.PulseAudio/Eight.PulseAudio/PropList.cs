using System;

namespace Eight.PulseAudio;

public sealed class PropList : IDisposable
{
	private readonly ILockProvider lockProvider;

	internal unsafe readonly pa_proplist* pointer;

	private bool disposed;

	internal unsafe PropList(ILockProvider lockProvider, pa_proplist* proplist)
	{
		pointer = proplist;
		this.lockProvider = lockProvider;
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
			PulseAudio.pa_proplist_free(pointer);
		}
	}
}
