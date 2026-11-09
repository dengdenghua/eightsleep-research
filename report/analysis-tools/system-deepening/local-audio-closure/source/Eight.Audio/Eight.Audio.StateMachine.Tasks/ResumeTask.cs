using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.Player;
using Eight.Capybara.Config;
using NodaTime;

namespace Eight.Audio.StateMachine.Tasks;

public sealed class ResumeTask(IClock clock, IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager, IPlayer player) : IPlayerTask
{
	private readonly IClock clock = clock;

	private readonly IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager = podConfigurationManager;

	private readonly IPlayer player = player;

	public Task<(bool, IPlayerTask?)> TryComplete(CancellationToken cancellation)
	{
		if (player.Paused)
		{
			player.Resume();
		}
		podConfigurationManager.Resume(clock);
		return Task.FromResult<(bool, IPlayerTask)>((true, null));
	}
}
