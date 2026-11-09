using System;
using System.Threading;
using System.Threading.Tasks;

namespace Eight.PulseAudio;

public interface IAudioStreamWriter : IDisposable
{
	Task WriteToStream(bool startPaused, ushort? startVolume, CancellationToken cancellationToken);
}
