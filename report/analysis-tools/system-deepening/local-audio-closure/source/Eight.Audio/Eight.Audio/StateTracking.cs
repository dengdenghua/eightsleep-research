using Eight.Audio.Models;
using Eight.Audio.StateMachine.States;

namespace Eight.Audio;

public record StateTracking(PlayerState Status, int Volume, PlaybackSource? PlaybackSource, PlayRequest? PlayRequest, long UpdatedAt)
{
	public static StateTracking CreateDefault()
	{
		return new StateTracking(PlayerState.Ready, 40, null, null, 0L);
	}
}
