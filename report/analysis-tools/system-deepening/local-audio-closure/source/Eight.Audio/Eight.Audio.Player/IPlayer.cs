using System;
using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.Models;
using Eight.Audio.Tracks;
using NodaTime;

namespace Eight.Audio.Player;

public interface IPlayer : IDisposable
{
	bool Paused { get; }

	bool Playing { get; }

	int Volume { get; set; }

	TrackDetails? CurrentTrack { get; }

	PlayRequest PlayRequest { get; }

	Task PlayNext(PlayRequest playRequest, CancellationToken cancellationToken);

	void Stop();

	void Pause();

	void Resume();

	void Seek(Duration position, SeekMode mode);

	void QueueTrack(ITrack track);

	void ClearQueue();
}
