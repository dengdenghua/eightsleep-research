using System.Collections.Generic;
using System.Linq;

namespace Eight.Firmness.Models;

public record ToleranceBands(double? MinKpa, double? MaxKpa, List<ToleranceBinSetting>? Bins)
{
	public List<ToleranceBinSetting> Bins { get; init; } = Bins ?? new List<ToleranceBinSetting>();

	public ToleranceBands MergedOnto(ToleranceBands? stored)
	{
		if ((object)stored == null)
		{
			return this;
		}
		Dictionary<int, ToleranceBinSetting> dictionary = stored.Bins.ToDictionary((ToleranceBinSetting bin) => bin.BinIndex);
		foreach (ToleranceBinSetting bin in Bins)
		{
			dictionary[bin.BinIndex] = bin;
		}
		return new ToleranceBands(MinKpa ?? stored.MinKpa, MaxKpa ?? stored.MaxKpa, dictionary.Values.OrderBy((ToleranceBinSetting bin) => bin.BinIndex).ToList());
	}

	public string? Validate()
	{
		if (!MinKpa.HasValue != !MaxKpa.HasValue)
		{
			return "minKpa and maxKpa must be given together";
		}
		double? minKpa = MinKpa;
		if (minKpa.HasValue)
		{
			double valueOrDefault = minKpa.GetValueOrDefault();
			minKpa = MaxKpa;
			if (minKpa.HasValue)
			{
				double valueOrDefault2 = minKpa.GetValueOrDefault();
				if (!double.IsFinite(valueOrDefault) || !double.IsFinite(valueOrDefault2))
				{
					return "minKpa and maxKpa must be finite";
				}
				if (valueOrDefault < 0.0)
				{
					return "minKpa must not be negative";
				}
				if (valueOrDefault >= valueOrDefault2)
				{
					return $"minKpa ({valueOrDefault}) must be below maxKpa ({valueOrDefault2})";
				}
			}
		}
		if (Bins.Count == 0 && !MinKpa.HasValue)
		{
			return "nothing to apply: give at least one bin, or a minKpa and maxKpa range";
		}
		HashSet<int> hashSet = new HashSet<int>();
		foreach (ToleranceBinSetting bin in Bins)
		{
			if (bin.BinIndex < 0 || bin.BinIndex >= 10)
			{
				return $"binIndex {bin.BinIndex} is outside 0..{9}";
			}
			if (!hashSet.Add(bin.BinIndex))
			{
				return $"binIndex {bin.BinIndex} appears more than once";
			}
			if (!double.IsFinite(bin.ArrivalKpa) || !double.IsFinite(bin.DepartureKpa))
			{
				return $"bin {bin.BinIndex} tolerances must be finite";
			}
			if (bin.ArrivalKpa < 0.0 || bin.DepartureKpa < 0.0)
			{
				return $"bin {bin.BinIndex} tolerances must not be negative";
			}
		}
		return null;
	}
}
