using Eight.Audio.Tracks;
using Eight.PulseAudio;

namespace Eight.Audio.Player;

public interface ITrackConsumerFactory
{
	ITrackConsumer Create(Context context, ITrack source);
}
