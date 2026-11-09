using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;

namespace Eight.Firmness.Services.Calibration.Landing;

public static class LandingFit
{
	public const double MinDeflateMs = 400.0;

	public const int MinPoints = 4;

	public const int MinLevels = 3;

	public const double MinRSquared = 0.98;

	public const double MinA = 1.1;

	public const double MaxA = 3.0;

	public const double MaxAbsCi = 2.0;

	public const uint SettleWindowMs = 240u;

	public static bool IsUsable(LandingTrial trial)
	{
		if (trial.Mechanism == LandingMechanism.Deflate)
		{
			double? stopKpa = trial.StopKpa;
			if (stopKpa.HasValue)
			{
				double valueOrDefault = stopKpa.GetValueOrDefault();
				if (double.IsFinite(valueOrDefault) && trial.DeflateMs.HasValue && trial.DeflateMs >= 400.0)
				{
					return double.IsFinite(trial.RestKpa);
				}
			}
		}
		return false;
	}

	public static LandingFitResult Fit(IEnumerable<LandingTrial> trials, int bagId)
	{
		List<LandingTrial> list = trials.Where((LandingTrial t) => t.BagId == bagId && IsUsable(t)).ToList();
		int num = list.Select((LandingTrial t) => t.FromKpa).Distinct().Count();
		if (list.Count < 4)
		{
			return Failed(bagId, list.Count, num, $"only {list.Count} usable deflates (need {4})");
		}
		if (num < 3)
		{
			return Failed(bagId, list.Count, num, $"usable deflates span {num} levels (need {3})");
		}
		int count = list.Count;
		double num2 = list.Average((LandingTrial t) => t.StopKpa.Value);
		double num3 = list.Average((LandingTrial t) => t.RestKpa);
		double num4 = 0.0;
		double num5 = 0.0;
		double num6 = 0.0;
		foreach (LandingTrial item in list)
		{
			double num7 = item.StopKpa.Value - num2;
			double num8 = item.RestKpa - num3;
			num4 += num7 * num7;
			num5 += num7 * num8;
			num6 += num8 * num8;
		}
		if (num4 <= 0.0)
		{
			return Failed(bagId, count, num, "stop readings do not vary");
		}
		double a = num5 / num4;
		double ci = num3 - a * num2;
		double num9 = list.Sum((LandingTrial t) => Math.Pow(t.RestKpa - (a * t.StopKpa.Value + ci), 2.0));
		double num10 = ((num6 > 0.0) ? (1.0 - num9 / num6) : 0.0);
		double value = Math.Sqrt(num9 / (double)count);
		double num11 = Round(a, 3);
		double num12 = Round(ci, 3);
		double value2 = Round(num10, 5);
		double value3 = Round(value, 3);
		string text = BoundsError(num10, num11, num12);
		return new LandingFitResult(bagId, text == null, num11, num12, value2, value3, count, num, text);
	}

	public static IReadOnlyList<LandingFitResult> GateOnWindow(IReadOnlyList<LandingFitResult> fits, uint boardWindowMs)
	{
		if (boardWindowMs == 240)
		{
			return fits;
		}
		string gate = $"board defaults to a {boardWindowMs} ms deflate settle window, but a/ci were fitted at {240u} ms; " + "flash balloon firmware >= 0.2.43.0";
		List<LandingFitResult> list = new List<LandingFitResult>();
		list.AddRange(fits.Select((LandingFitResult f) => f with
		{
			Success = false,
			Error = ((f.Error == null) ? gate : (gate + "; " + f.Error))
		}));
		return new _003C_003Ez__ReadOnlyList<LandingFitResult>(list);
	}

	private static string? BoundsError(double rSquared, double a, double ci)
	{
		if (!double.IsFinite(rSquared) || !double.IsFinite(a) || !double.IsFinite(ci))
		{
			return $"non-finite fit (a {a}, ci {ci}, R^2 {rSquared})";
		}
		if (rSquared < 0.98)
		{
			return $"R^2 {rSquared.ToString("F4", CultureInfo.InvariantCulture)} < {0.98}";
		}
		if (a < 1.1 || a > 3.0)
		{
			return $"a {a} outside [{1.1}, {3.0}]";
		}
		if (!(Math.Abs(ci) > 2.0))
		{
			return null;
		}
		return $"|ci| {ci} > {2.0}";
	}

	private static double Round(double value, int digits)
	{
		return Math.Round(value, digits, MidpointRounding.AwayFromZero);
	}

	private static LandingFitResult Failed(int bagId, int n, int levels, string error)
	{
		return new LandingFitResult(bagId, Success: false, null, null, null, null, n, levels, error);
	}
}
