using System.Threading;
using System.Threading.Tasks;

namespace Eight.Audio.Player;

public interface ITrackConsumer
{
	bool Paused { get; }

	int? Volume { get; }

	Task Play(bool startPaused, int? startVolume, CancellationToken cancellationToken);

	void Stop();

	void Pause();

	void Resume();

	void SetVolume(int volume);
}
