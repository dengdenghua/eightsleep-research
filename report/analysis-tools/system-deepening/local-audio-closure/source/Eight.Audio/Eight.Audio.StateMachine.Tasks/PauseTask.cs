using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.Player;
using Eight.Capybara.Config;
using NodaTime;

namespace Eight.Audio.StateMachine.Tasks;

public sealed class PauseTask(IClock clock, ISpeakerTaskFactory taskFactory, IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager, IPlayer player, Duration? duration) : IPlayerTask
{
	private readonly IClock clock = clock;

	private readonly IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager = podConfigurationManager;

	private readonly IPlayer player = player;

	private readonly Duration? duration = duration;

	private readonly ISpeakerTaskFactory taskFactory = taskFactory;

	public Task<(bool, IPlayerTask?)> TryComplete(CancellationToken cancellation)
	{
		if (!player.Paused)
		{
			player.Pause();
		}
		podConfigurationManager.Pause(clock);
		Duration? duration = this.duration;
		if (duration.HasValue)
		{
			return Task.FromResult((true, taskFactory.CreateDelayedResumeTask(player, this.duration.Value)));
		}
		return Task.FromResult<(bool, IPlayerTask)>((true, null));
	}
}
