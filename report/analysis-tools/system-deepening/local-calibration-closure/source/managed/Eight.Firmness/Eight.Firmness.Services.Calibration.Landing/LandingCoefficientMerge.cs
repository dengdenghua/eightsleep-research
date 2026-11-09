using System.Collections.Generic;
using System.Linq;
using Eight.Firmness.Models;

namespace Eight.Firmness.Services.Calibration.Landing;

public static class LandingCoefficientMerge
{
	public static (List<BagCalibrationCoefficients> Coefficients, List<(int BagId, string Reason)> Skipped) Merge(CalibrationAnalyzerResult pulse, IReadOnlyList<LandingFitResult> landing, CalibrationOptions options)
	{
		Dictionary<int, LandingFitResult> dictionary = landing.ToDictionary((LandingFitResult f) => f.BagId);
		List<BagCalibrationCoefficients> list = new List<BagCalibrationCoefficients>();
		List<(int, string)> list2 = new List<(int, string)>();
		foreach (CalibrationAnalyzerBagResult bag in pulse.Bags)
		{
			dictionary.TryGetValue(bag.BagId, out var value);
			string text = SkipReason(bag, value);
			if (text != null)
			{
				list2.Add((bag.BagId, text));
				continue;
			}
			float num = (float)value.A.Value;
			float num2 = (float)value.Ci.Value;
			BagCalibrationCoefficients item = new BagCalibrationCoefficients(bag.BagId, num, bag.B.Value, num2, num, num2);
			string text2 = CalibrationCoefficientValidator.Validate(new _003C_003Ez__ReadOnlySingleElementList<BagCalibrationCoefficients>(item), options);
			if (text2 != null)
			{
				list2.Add((bag.BagId, text2));
			}
			else
			{
				list.Add(item);
			}
		}
		return (Coefficients: list, Skipped: list2);
	}

	private static string? SkipReason(CalibrationAnalyzerBagResult bag, LandingFitResult? fit)
	{
		if (!bag.B.HasValue)
		{
			string error = bag.Error;
			if (error == null)
			{
				return "no inflate overshoot, so no b";
			}
			return "no b: " + error;
		}
		if ((object)fit == null)
		{
			return "no landing fit";
		}
		object obj;
		if (!fit.Success)
		{
			obj = fit.Error;
			if (obj == null)
			{
				return "landing fit failed";
			}
		}
		else
		{
			obj = null;
		}
		return (string?)obj;
	}
}
