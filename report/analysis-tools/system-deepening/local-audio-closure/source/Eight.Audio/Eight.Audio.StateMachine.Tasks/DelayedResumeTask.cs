using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.Player;
using Eight.Capybara.Config;
using NodaTime;

namespace Eight.Audio.StateMachine.Tasks;

public sealed class DelayedResumeTask(IClock clock, ISpeakerTaskFactory taskFactory, IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager, IPlayer player, Duration duration) : IPlayerTask
{
	private readonly IClock clock = clock;

	private readonly IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager = podConfigurationManager;

	private readonly ISpeakerTaskFactory taskFactory = taskFactory;

	private readonly IPlayer player = player;

	private readonly Duration duration = duration;

	private readonly Instant startTime = clock.GetCurrentInstant();

	private readonly CancellationTokenSource taskCancellationSource = new CancellationTokenSource();

	public Task<(bool, IPlayerTask?)> TryComplete(CancellationToken cancellation)
	{
		if (taskCancellationSource.IsCancellationRequested)
		{
			return Task.FromResult<(bool, IPlayerTask)>((true, null));
		}
		if (clock.GetCurrentInstant() > startTime + duration)
		{
			return Task.FromResult((true, taskFactory.CreateResumeTask(player)));
		}
		return Task.FromResult<(bool, IPlayerTask)>((false, null));
	}

	public IPlayerTask Cancel()
	{
		return new CancelTask(() =>
		{
			taskCancellationSource.Cancel();
			return Task.CompletedTask;
		}, Duration.FromMilliseconds(250L));
	}
}
