using System;
using System.Threading.Tasks;
using NodaTime;

namespace Eight.Capybara.AdjustableBase.Joints;

internal class MovingState : State
{
	private readonly IClock clock;

	private readonly Action<string> log;

	protected readonly IJointBaseAdapter adapter;

	private readonly PowerSequence powerSequence = new PowerSequence(8);

	private readonly double target;

	private Instant? startedAt;

	private readonly Duration maxDuration = Duration.FromMinutes(3L);

	private readonly AverageSpeedSnoring averageSpeedSnoring = new AverageSpeedSnoring();

	private double? lastPower;

	private readonly double trackingAngle;

	public double CurrentPower => powerSequence.GetLastPower();

	public MovingState(IClock clock, Action<string> log, IJointBaseAdapter adapter, double target, double trackingAngle)
	{
		this.clock = clock;
		this.log = log;
		this.adapter = adapter;
		this.target = target;
		this.trackingAngle = trackingAngle;
	}

	public override async Task<State> Next(JointStateUpdate currentState)
	{
		Instant? instant = startedAt;
		if (!instant.HasValue)
		{
			startedAt = currentState.Timestamp;
		}
		Instant currentInstant = clock.GetCurrentInstant();
		instant = startedAt;
		if (currentInstant - instant > maxDuration)
		{
			await adapter.Stop(default);
			return new CompletedState();
		}
		if (lastPower.HasValue && currentState.Angle == target && !currentState.IsMoving)
		{
			return new CompletedState();
		}
		averageSpeedSnoring.AppendSample(new PositionInstance(currentState.Timestamp, (short)currentState.Ticks));
		double power = powerSequence.GetNextPower(averageSpeedSnoring.Value);
		log($"=====> POWER {power} SPEED: {averageSpeedSnoring.Value}");
		double? num = lastPower;
		if (!num.HasValue || lastPower != power)
		{
			await adapter.MoveToAngle(target, power, default);
			adapter.SetLastUpdatedAngle(trackingAngle);
			num = lastPower;
			if (!num.HasValue)
			{
				await Task.Delay(1000);
			}
			averageSpeedSnoring.Reset();
		}
		lastPower = power;
		return this;
	}
}
