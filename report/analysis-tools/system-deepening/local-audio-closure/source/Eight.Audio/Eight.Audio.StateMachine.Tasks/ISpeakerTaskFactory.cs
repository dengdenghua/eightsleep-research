using Eight.Audio.Models;
using Eight.Audio.Player;
using NodaTime;

namespace Eight.Audio.StateMachine.Tasks;

public interface ISpeakerTaskFactory
{
	IPlayerTask CreateLoadingTask(IPlayer player, PlayRequest playRequest);

	IPlayerTask CreatePlayTask(IPlayer player, PlayRequest playRequest);

	IPlayerTask CreatePauseTask(IPlayer player);

	IPlayerTask CreatePauseTask(IPlayer player, Duration duration);

	IPlayerTask CreateResumeTask(IPlayer player);

	IPlayerTask CreateVolumeTask(IPlayer player, int volume);

	IPlayerTask CreateStopTask(IPlayer player, StopMethod stopMethod);

	IPlayerTask CreateSeekTask(IPlayer player, SeekRequest request);

	IPlayerTask CreateRestoreTask(IPlayer player, bool keepCurrentVolume);

	IPlayerTask CreateRestoreTask(IPlayer player, PlayRequest playRequest);

	IPlayerTask CreateDelayedResumeTask(IPlayer player, Duration duration);
}
