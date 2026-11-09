using System;

namespace Eight.Firmness.Models;

public static class PressureMappings
{
	private static readonly double[] Mappings = new double[11]
	{
		0.0, 0.05, 0.4, 0.9, 1.45, 2.05, 2.65, 3.6, 4.8, 6.8,
		8.5
	};

	public static double GetPressureForLevel(int level)
	{
		if (level < 0 || level > 10)
		{
			throw new ArgumentOutOfRangeException("level", level, "Firmness level must be between 0 and 10");
		}
		return Mappings[level];
	}
}
