using System;

namespace Eight.Capybara.AdjustableBase.Joints;

public class PowerSequence
{
	private static readonly double MaxSpeed = 5.0;

	private double lastPower;

	public PowerSequence(int startingPower)
	{
		lastPower = startingPower;
	}

	public double GetNextPower(double? lastSpeed)
	{
		if (!lastSpeed.HasValue)
		{
			return lastPower;
		}
		if (lastSpeed <= 1.5)
		{
			lastPower += 5.0;
			return lastPower;
		}
		if (lastSpeed > MaxSpeed)
		{
			lastPower = Math.Max(lastPower * 0.8, 8.0);
		}
		return lastPower;
	}

	public double GetLastPower()
	{
		return lastPower;
	}
}
