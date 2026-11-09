using System;

namespace Eight.PulseAudio;

internal interface ILockProvider
{
	internal unsafe pa_threaded_mainloop* Pointer { get; }

	internal IDisposable Lock();

	internal void WaitForSignal();

	internal void Signal(int signal);

	internal void Accept();
}
