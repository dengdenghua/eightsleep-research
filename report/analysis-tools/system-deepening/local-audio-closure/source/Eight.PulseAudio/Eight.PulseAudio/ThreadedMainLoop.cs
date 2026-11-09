using System;
using Microsoft.Extensions.Logging;

namespace Eight.PulseAudio;

public sealed class ThreadedMainLoop : IDisposable, ILockProvider
{
	private readonly Func<ILogger<MainLoopLock>> loggerFactory;

	internal unsafe readonly pa_threaded_mainloop* pointer;

	private bool disposed;

	unsafe pa_threaded_mainloop* ILockProvider.Pointer => pointer;

	private unsafe ThreadedMainLoop(Func<ILogger<MainLoopLock>> loggerFactory, pa_threaded_mainloop* mainLoop)
	{
		this.loggerFactory = loggerFactory;
		pointer = mainLoop;
	}

	public unsafe static ThreadedMainLoop Create(Func<ILogger<MainLoopLock>> loggerFactory)
	{
		pa_threaded_mainloop* ptr = PulseAudio.pa_threaded_mainloop_new();
		ThreadedMainLoop threadedMainLoop = new ThreadedMainLoop(loggerFactory, ptr);
		int num = PulseAudio.pa_threaded_mainloop_start(ptr);
		if (num != 0)
		{
			string errorMessage = Utils.GetErrorMessage(num);
			threadedMainLoop.Dispose();
			throw new ArgumentException("Failed to create Main Loop: " + errorMessage);
		}
		return threadedMainLoop;
	}

	internal IDisposable Lock()
	{
		return new MainLoopLock(loggerFactory(), this);
	}

	IDisposable ILockProvider.Lock()
	{
		ThrowIfDisposed();
		return Lock();
	}

	internal unsafe void WaitForSignal()
	{
		ThrowIfDisposed();
		PulseAudio.pa_threaded_mainloop_wait(pointer);
	}

	void ILockProvider.WaitForSignal()
	{
		WaitForSignal();
	}

	unsafe void ILockProvider.Accept()
	{
		PulseAudio.pa_threaded_mainloop_accept(pointer);
	}

	unsafe void ILockProvider.Signal(int signal)
	{
		PulseAudio.pa_threaded_mainloop_signal(pointer, signal);
	}

	public unsafe void Dispose()
	{
		if (!disposed)
		{
			disposed = true;
			if (pointer != null)
			{
				PulseAudio.pa_threaded_mainloop_stop(pointer);
				PulseAudio.pa_threaded_mainloop_free(pointer);
			}
		}
	}

	private void ThrowIfDisposed()
	{
		ObjectDisposedException.ThrowIf(disposed, this);
	}
}
