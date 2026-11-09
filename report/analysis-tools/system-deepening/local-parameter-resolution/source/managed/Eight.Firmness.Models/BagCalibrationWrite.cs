using System.Collections.Generic;

namespace Eight.Firmness.Models;

public record BagCalibrationWrite(List<BagCalibrationSetting>? Bags, bool Persist)
{
	public List<BagCalibrationSetting> Bags { get; init; } = Bags ?? new List<BagCalibrationSetting>();

	public const int MaxBags = 5;

	public string? Validate()
	{
		if (Bags.Count == 0)
		{
			return "nothing to apply: give at least one bag";
		}
		HashSet<int> hashSet = new HashSet<int>();
		foreach (BagCalibrationSetting bag in Bags)
		{
			if (bag.BagId < 0 || bag.BagId >= 5)
			{
				return $"bagId {bag.BagId} is outside 0..{4}";
			}
			if (!hashSet.Add(bag.BagId))
			{
				return $"bagId {bag.BagId} appears more than once";
			}
			(string, double)[] array = new (string, double)[5]
			{
				("a", bag.A),
				("b", bag.B),
				("ci", bag.ResolvedCi),
				("al", bag.ResolvedAl),
				("cl", bag.ResolvedCl)
			};
			for (int i = 0; i < array.Length; i++)
			{
				(string, double) tuple = array[i];
				var (value, _) = tuple;
				if (!double.IsFinite(tuple.Item2))
				{
					return $"bag {bag.BagId} coefficient {value} must be finite";
				}
			}
		}
		return null;
	}
}
