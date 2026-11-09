using System;
using Microsoft.Extensions.Logging;

namespace Eight.PulseAudio;

public sealed class MainLoopLock : IDisposable
{
	private readonly ILogger<MainLoopLock> logger;

	private readonly ThreadedMainLoop pa_ml;

	internal bool Disposed;

	internal unsafe MainLoopLock(ILogger<MainLoopLock> logger, ThreadedMainLoop pa_ml)
	{
		this.logger = logger;
		logger.LogDebug("Locking");
		this.pa_ml = pa_ml;
		PulseAudio.pa_threaded_mainloop_lock(pa_ml.pointer);
		logger.LogDebug("Main loop locked");
	}

	public unsafe void Dispose()
	{
		if (!Disposed)
		{
			Disposed = true;
			PulseAudio.pa_threaded_mainloop_unlock(pa_ml.pointer);
			logger.LogDebug("UnLocking");
		}
	}
}
