using Eight.Audio.Tracks;

namespace Eight.Audio.Player;

public interface ITrackPlayerFactory
{
	ITrackPlayer Create(ITrack track);
}
