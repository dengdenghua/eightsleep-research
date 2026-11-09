using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.Player;
using Eight.Capybara.Config;
using NodaTime;

namespace Eight.Audio.StateMachine.Tasks;

public sealed class VolumeTask(IClock clock, IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager, IPlayer player, int volume) : IPlayerTask
{
	private readonly IClock clock = clock;

	private readonly IPlayer player = player;

	private readonly IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager = podConfigurationManager;

	private readonly int volume = volume;

	public Task<(bool, IPlayerTask?)> TryComplete(CancellationToken cancellation)
	{
		player.Volume = volume;
		podConfigurationManager.UpdateVolume(volume, clock);
		return Task.FromResult<(bool, IPlayerTask)>((true, null));
	}
}
