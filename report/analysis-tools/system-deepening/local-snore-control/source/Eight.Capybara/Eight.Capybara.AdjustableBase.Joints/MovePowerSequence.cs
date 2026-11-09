using System;

namespace Eight.Capybara.AdjustableBase.Joints;

public class MovePowerSequence
{
	private readonly double targetAngle;

	private readonly double targetPower;

	private double lastPower;

	private const double MinimumRampPower = 50.0;

	public MovePowerSequence(MoveRequest moveRequest, MovementDirection direction)
	{
		targetAngle = moveRequest.TargetAngle;
		targetPower = Math.Max(moveRequest.FeedRate, (direction == MovementDirection.Up) ? 20 : 10);
		lastPower = Math.Min(50.0, targetPower);
	}

	public double GetNextPower(double? currentAngle)
	{
		if (!currentAngle.HasValue)
		{
			return lastPower;
		}
		if (Math.Abs(targetAngle - currentAngle.Value) > 10.0)
		{
			if (lastPower < targetPower)
			{
				double val = Math.Max(lastPower, lastPower + 10.0);
				lastPower = Math.Min(val, targetPower);
			}
		}
		else if (lastPower > 50.0)
		{
			double val2 = Math.Min(lastPower, lastPower - 10.0);
			lastPower = Math.Max(50.0, val2);
		}
		return lastPower;
	}

	public double GetLastPower()
	{
		return lastPower;
	}
}
