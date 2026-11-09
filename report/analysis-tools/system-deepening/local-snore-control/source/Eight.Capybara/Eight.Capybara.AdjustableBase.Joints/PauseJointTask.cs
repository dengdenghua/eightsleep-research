using System.Threading;
using System.Threading.Tasks;
using NodaTime;

namespace Eight.Capybara.AdjustableBase.Joints;

public class PauseJointTask : JointTask
{
	private readonly IClock clock;

	private Instant? Started;

	public PauseJointTask(IClock clock)
	{
		this.clock = clock;
	}

	public override Task<bool> TryComplete(CancellationToken cancellation)
	{
		Instant? started = Started;
		if (!started.HasValue)
		{
			Started = clock.GetCurrentInstant();
			return Task.FromResult(result: false);
		}
		Instant currentInstant = clock.GetCurrentInstant();
		started = Started;
		if (!(currentInstant - started < Duration.FromSeconds(1L)))
		{
			return Task.FromResult(result: true);
		}
		return Task.FromResult(result: false);
	}
}
