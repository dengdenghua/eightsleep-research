using System;
using System.Threading.Tasks;
using NodaTime;

namespace Eight.Capybara.AdjustableBase.Joints;

internal class PauseState : State
{
	private readonly IClock clock;

	private readonly IJointBaseAdapter adapter;

	private readonly Func<State> resume;

	private readonly Duration pauseDuraction;

	private Instant? started;

	public PauseState(IClock clock, IJointBaseAdapter adapter, Duration pauseDuraction, Func<State> resume)
	{
		this.clock = clock;
		this.adapter = adapter;
		this.pauseDuraction = pauseDuraction;
		this.resume = resume;
	}

	public override async Task<State> Next(JointStateUpdate currentState)
	{
		Instant? instant = started;
		if (!instant.HasValue)
		{
			started = clock.GetCurrentInstant();
			await adapter.Stop(default);
			return this;
		}
		Instant currentInstant = clock.GetCurrentInstant();
		instant = started;
		return (currentInstant - instant < pauseDuraction) ? this : resume();
	}
}
