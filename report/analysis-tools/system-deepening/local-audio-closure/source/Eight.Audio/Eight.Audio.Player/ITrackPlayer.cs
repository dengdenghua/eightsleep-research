using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.Models;
using NodaTime;

namespace Eight.Audio.Player;

public interface ITrackPlayer
{
	bool Paused { get; }

	int? Volume { get; }

	TrackDetails CurrentTrack { get; }

	Task Play(bool startPaused, int? startVolume, CancellationToken cancellationToken);

	void Stop();

	void Pause();

	void Resume();

	void SetVolume(int volume);

	void Seek(Duration position, SeekMode mode);
}
