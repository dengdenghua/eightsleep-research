using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;

namespace Eight.Firmness.Services.Calibration;

public static class CalibrationAnalyzer
{
	private sealed record RecoveryInfo(double PBefore, double PAfter);

	private sealed record InflationOvershoot(double PPeak, double PShelf, double Overshoot);

	private sealed record Table(IReadOnlyList<string> Columns, IReadOnlyDictionary<string, double[]> Data, int Rows);

	private sealed record CalibrationPoints(IReadOnlyList<double> PBefore, IReadOnlyList<double> PAfter, IReadOnlyList<InflationOvershoot> Overshoots);

	private const double MinRSquared = 0.7;

	private const double MinACoefficient = 0.8;

	private const double MaxACoefficient = 3.0;

	private const double MinBCoefficient = -2.0;

	private const double MaxBCoefficient = 2.0;

	private const double MaxAbsInterceptKpa = 2.0;

	private const int MinDataPoints = 5;

	private const double MinValidPressureKpa = 0.15;

	private const double RecoveryWindowS = 0.4;

	private const double OvershootShelfS = 1.0;

	private const double MedianFilterS = 0.25;

	private const double InflationWindowS = 1.0;

	private const double DerivativeThresholdKpaS = 2.0;

	private const double MaxStableSlopeKpaS = 0.1;

	private const double MinInflationSlopeKpaS = 0.01;

	private const double MinPressureDiff = 0.05;

	private const double OutlierIqrMultiplier = 1.0;

	private const double MinPositiveSlopeFraction = 0.3;

	private const double MinOvershootKpa = 0.05;

	private static Table LoadCsv(string csvPath)
	{
		string[] array = (from line in File.ReadAllLines(csvPath)
			where line.Length > 0
			select line).ToArray();
		if (array.Length < 2)
		{
			throw new InvalidOperationException("CSV has no data rows");
		}
		string[] columns = array[0].Split(',').Select(Unquote).ToArray();
		int rows = array.Length - 1;
		Dictionary<string, double[]> dictionary = columns.ToDictionary((string c) => c, (string _) => new double[rows]);
		for (int num = 1; num < array.Length; num++)
		{
			string[] array2 = array[num].Split(',');
			for (int num2 = 0; num2 < columns.Length; num2++)
			{
				string text = ((num2 < array2.Length) ? Unquote(array2[num2]) : "");
				double num3;
				if (text.Length != 0)
				{
					num3 = (double.TryParse(text, NumberStyles.Float, CultureInfo.InvariantCulture, out var result) ? result : double.NaN);
				}
				else
				{
					num3 = double.NaN;
				}
				dictionary[columns[num2]][num - 1] = num3;
			}
		}
		List<string> list = new List<string> { "Timestamp_UTC", "Sample_Rate_Hz" };
		int num4 = columns.Count((string c) => c.StartsWith("Pressure_S", StringComparison.Ordinal));
		for (int num5 = 0; num5 < num4; num5++)
		{
			list.Add($"Pressure_S{num5}");
		}
		List<string> list2 = list.Where((string c) => !Enumerable.Contains(columns, c)).ToList();
		if (list2.Count > 0)
		{
			throw new InvalidOperationException("Missing required columns: [" + string.Join(", ", list2.Select((string m) => "'" + m + "'")) + "]");
		}
		return new Table(columns, dictionary, rows);
		static string Unquote(string field)
		{
			string text2 = field.Trim();
			if (text2.Length >= 2 && text2[0] == '"')
			{
				if (text2[text2.Length - 1] == '"')
				{
					string text3 = text2;
					return text3.Substring(1, text3.Length - 1 - 1);
				}
			}
			return text2;
		}
	}

	private static List<RecoveryInfo> DetectPressureRecoveries(IReadOnlyList<double> pressure, double derivativeThreshold, int stableWindowSamples, double maxStableSlope, double minPressureDiff = 0.05)
	{
		double[] array = CalibrationMath.Diff(pressure);
		List<RecoveryInfo> list = new List<RecoveryInfo>();
		int num = 0;
		while (num < array.Length - stableWindowSamples)
		{
			if (double.IsNaN(array[num]))
			{
				num++;
				continue;
			}
			if (!(array[num] > derivativeThreshold))
			{
				num++;
				continue;
			}
			int num2 = num;
			if (num2 == 0)
			{
				num++;
				continue;
			}
			int num3 = num2 - 1;
			while (num3 > 0 && !(pressure[num3 - 1] > pressure[num3]))
			{
				num3--;
			}
			double num4 = pressure[num3];
			int i;
			for (i = num2; i < array.Length - 1 && array[i] > 0.05; i++)
			{
			}
			int num5 = i;
			int num6 = Math.Min(num5 + stableWindowSamples, pressure.Count);
			double[] stableRegion = pressure.Skip(num5).Take(num6 - num5).ToArray();
			if (stableRegion.Length < 5)
			{
				num = num6;
				continue;
			}
			IReadOnlyList<int> readOnlyList = CalibrationMath.OutlierIqrMask(stableRegion, 1.0);
			if (readOnlyList.Count < 3)
			{
				num = num6;
				continue;
			}
			double num7;
			if (readOnlyList.Count >= 2)
			{
				double[] x = ((IEnumerable<int>)readOnlyList).Select((Func<int, double>)((int k) => k)).ToArray();
				double[] y = readOnlyList.Select((int k) => stableRegion[k]).ToArray();
				num7 = Math.Abs(CalibrationMath.LinRegress(x, y).Slope);
			}
			else
			{
				num7 = double.PositiveInfinity;
			}
			if (num7 < maxStableSlope)
			{
				int index = num5 + readOnlyList[0];
				double num8 = pressure[index];
				if (num8 > num4 + minPressureDiff)
				{
					list.Add(new RecoveryInfo(num4, num8));
				}
			}
			num = num6;
		}
		return list;
	}

	private static List<InflationOvershoot> DetectInflationOvershoots(IReadOnlyList<double> pressure, IReadOnlyList<double> rawPressure, int inflationWindow, double minSlope, int stableWindow, double minPositiveFraction = 0.3, double minOvershoot = 0.05)
	{
		double[] array = CalibrationMath.Diff(pressure);
		double[] array2 = CalibrationMath.FillNa(CalibrationMath.RollingMean(array, 10), 0.0);
		double[] array3 = CalibrationMath.FillNa(CalibrationMath.RollingMean(array, 5), 0.0);
		List<InflationOvershoot> list = new List<InflationOvershoot>();
		int num = inflationWindow;
		while (num < pressure.Count - stableWindow - 10)
		{
			if (!(array2[num - 1] > 0.001) || !(array2[num] < 0.0))
			{
				num++;
				continue;
			}
			int num2 = num - 1;
			int num3 = Math.Max(0, num2 - inflationWindow);
			double[] array4 = array.Skip(num3).Take(num2 - num3).ToArray();
			int num4 = array4.Count((double v) => v > minSlope);
			if (((array4.Length != 0) ? ((double)num4 / (double)array4.Length) : 0.0) < minPositiveFraction)
			{
				num++;
				continue;
			}
			int num5;
			for (num5 = num; num5 < array3.Length - 1 && array3[num5] < -0.002; num5++)
			{
			}
			int num6 = num5;
			int num7 = Math.Min(num6 + stableWindow, pressure.Count);
			int num8 = Math.Max(0, num2 - 5);
			int num9 = Math.Min(pressure.Count, num2 + 5);
			double[] values = pressure.Skip(num8).Take(num9 - num8).ToArray();
			int index = num8 + CalibrationMath.Argmax(values);
			double num10 = pressure[index];
			double[] array5 = rawPressure.Skip(num6).Take(num7 - num6).ToArray();
			if (array5.Length >= 5)
			{
				double num11 = CalibrationMath.Median(array5);
				double num12 = num10 - num11;
				if (num12 > minOvershoot)
				{
					list.Add(new InflationOvershoot(num10, num11, num12));
				}
			}
			num = num7;
		}
		return list;
	}

	private static CalibrationPoints ExtractCalibrationPoints(Table table, int bagId)
	{
		string text = $"Pressure_S{bagId}";
		List<string> list = (from c in (from c in table.Columns
				where c.StartsWith("Pressure_S", StringComparison.Ordinal)
				orderby int.Parse(c.Split("_S")[1], CultureInfo.InvariantCulture)
				select c).ToList()
			where CalibrationMath.Max(table.Data[c]) > 0.0
			select c).ToList();
		if (list.Count == 0)
		{
			throw new InvalidOperationException("No populated pressure columns found");
		}
		string text2 = list[list.Count - 1];
		double num = CalibrationMath.Mean(table.Data[text2]);
		if (!(num > 50.0) || !(num < 150.0))
		{
			throw new InvalidOperationException($"Atmospheric reference {text2} averages {num.ToString("F2", CultureInfo.InvariantCulture)} kPa, which is " + "not plausible ambient pressure. Gauge pressure would be wrong.");
		}
		if (!table.Columns.Contains(text))
		{
			throw new InvalidOperationException("Column " + text + " not found");
		}
		double num2 = table.Data["Sample_Rate_Hz"][0];
		int window = Math.Max(3, (int)Math.Round(0.25 * num2, MidpointRounding.AwayFromZero) | 1);
		int stableWindowSamples = Math.Max(5, (int)Math.Round(0.4 * num2, MidpointRounding.AwayFromZero));
		int stableWindow = Math.Max(5, (int)Math.Round(1.0 * num2, MidpointRounding.AwayFromZero));
		int inflationWindow = Math.Max(5, (int)Math.Round(1.0 * num2, MidpointRounding.AwayFromZero));
		double derivativeThreshold = 2.0 / num2;
		double maxStableSlope = 0.1 / num2;
		double minSlope = 0.01 / num2;
		double[] source = table.Data[text];
		double[] atmValues = table.Data[text2];
		double[] array = source.Select((double v, int idx) => v - atmValues[idx]).ToArray();
		double[] array2 = CalibrationMath.RollingMedian(array, window);
		int num3 = CalibrationMath.Argmax(array2);
		List<InflationOvershoot> overshoots = DetectInflationOvershoots(array2.Take(num3 + 1).ToArray(), array.Take(num3 + 1).ToArray(), inflationWindow, minSlope, stableWindow);
		List<RecoveryInfo> source2 = (from r in DetectPressureRecoveries(array2.Skip(num3).ToArray(), derivativeThreshold, stableWindowSamples, maxStableSlope)
			where r.PAfter >= 0.15
			select r).ToList();
		return new CalibrationPoints(source2.Select((RecoveryInfo r) => r.PBefore).ToList(), source2.Select((RecoveryInfo r) => r.PAfter).ToList(), overshoots);
	}

	private static (double A, double Intercept, double RSquared) ComputeCalibration(IReadOnlyList<double> pBefore, IReadOnlyList<double> pAfter, double outlierThreshold = 3.5, int maxIterations = 2)
	{
		if (pBefore.Count < 5)
		{
			throw new InvalidOperationException($"Insufficient data points: {pBefore.Count} < {5}");
		}
		double[] x = pBefore.ToArray();
		double[] y = pAfter.ToArray();
		for (int i = 0; i < maxIterations; i++)
		{
			if (x.Length < 5)
			{
				break;
			}
			(double, double, double) tuple = CalibrationMath.LinRegress(x, y);
			double slope = tuple.Item1;
			double intercept = tuple.Item2;
			double[] array = x.Select((double xi, int idx) => Math.Abs(y[idx] - (slope * xi + intercept))).ToArray();
			double num = CalibrationMath.Std(array);
			if (num == 0.0)
			{
				break;
			}
			double limit = outlierThreshold * num;
			int[] array2 = (from t in array.Select((double r, int idx) => (r: r, idx: idx))
				where t.r < limit
				select t.idx).ToArray();
			if (array2.Length == array.Length)
			{
				break;
			}
			x = array2.Select((int idx) => x[idx]).ToArray();
			y = array2.Select((int idx) => y[idx]).ToArray();
		}
		if (x.Length < 5)
		{
			throw new InvalidOperationException($"Too few points after outlier removal: {x.Length} < {5}");
		}
		var (item, item2, item3) = CalibrationMath.LinRegress(x, y);
		return (A: item, Intercept: item2, RSquared: item3);
	}

	private static string? ValidateCalibration(double a, double b, double rSquared, double deflateIntercept)
	{
		if (rSquared < 0.7)
		{
			return $"R^2 too low: {rSquared.ToString("F3", CultureInfo.InvariantCulture)} < {0.7}";
		}
		if (Math.Abs(deflateIntercept) > 2.0)
		{
			return $"deflate intercept out of range: {deflateIntercept.ToString("F4", CultureInfo.InvariantCulture)} kPa, |ci| > {2.0} — gauge pressure is likely wrong " + "(check that the atmospheric reference column was identified)";
		}
		if (a < 0.8 || a > 3.0)
		{
			return $"'a' coefficient out of range: {a.ToString("F3", CultureInfo.InvariantCulture)} not in [{0.8}, {3.0}]";
		}
		if (b < -2.0 || b > 2.0)
		{
			return $"'b' coefficient out of range: {b.ToString("F3", CultureInfo.InvariantCulture)} not in [{-2.0}, {2.0}]";
		}
		return null;
	}

	private static CalibrationAnalyzerBagResult AnalyzeBag(Table table, int bagId)
	{
		CalibrationPoints points;
		double bRounded;
		double bStdRounded;
		float? bCv;
		string bCvWarning;
		List<float> overshootValues;
		try
		{
			points = ExtractCalibrationPoints(table, bagId);
			CalibrationAnalyzerBagResult WithB(CalibrationAnalyzerBagResult blank)
			{
				if (points.Overshoots.Count <= 0)
				{
					return blank;
				}
				return blank with
				{
					B = (float)bRounded,
					BStd = (float)bStdRounded,
					BCv = bCv,
					BCvWarning = bCvWarning,
					OvershootPoints = points.Overshoots.Count,
					OvershootValues = overshootValues
				};
			}
		}
		catch (Exception ex)
		{
			return Blank(bagId, ex.Message);
		}
		overshootValues = points.Overshoots.Select((InflationOvershoot o) => (float)CalibrationMath.RoundTo(o.Overshoot, 3)).ToList();
		double num = 0.0;
		double value = 0.0;
		if (points.Overshoots.Count > 0)
		{
			double[] values = points.Overshoots.Select((InflationOvershoot o) => o.Overshoot).ToArray();
			if (values.Length >= 3)
			{
				double[] array = (from i in CalibrationMath.OutlierIqrMask(values, 1.0)
					select values[i]).ToArray();
				if (array.Length != 0)
				{
					values = array;
				}
			}
			num = CalibrationMath.Median(values);
			value = ((values.Length > 1) ? CalibrationMath.Std(values) : 0.0);
		}
		bRounded = CalibrationMath.RoundTo(num, 3);
		bStdRounded = CalibrationMath.RoundTo(value, 3);
		bCv = null;
		bCvWarning = null;
		if (bRounded > 0.0)
		{
			bCv = (float)CalibrationMath.RoundTo(bStdRounded / bRounded, 3);
			if ((double?)bCv > 0.3)
			{
				bCvWarning = "High variance in overshoot measurements";
			}
		}
		if (points.PBefore.Count < 5)
		{
			return WithB(Blank(bagId, $"Insufficient data points: {points.PBefore.Count} < {5}", points.PBefore.Count, points.Overshoots.Count, overshootValues));
		}
		double num2;
		double num3;
		double num4;
		try
		{
			(num2, num3, num4) = ComputeCalibration(points.PBefore, points.PAfter);
		}
		catch (Exception ex2)
		{
			return WithB(Blank(bagId, ex2.Message));
		}
		string text = ValidateCalibration(num2, num, num4, num3);
		return new CalibrationAnalyzerBagResult(bagId, text == null, (float)CalibrationMath.RoundTo(num2, 3), (float)bRounded, (float)bStdRounded, bCv, bCvWarning, (float)CalibrationMath.RoundTo(num3, 4), (float)CalibrationMath.RoundTo(num4, 3), points.PBefore.Count, points.Overshoots.Count, overshootValues, (float)CalibrationMath.RoundTo(num2, 3), (float)CalibrationMath.RoundTo(num3, 4), text);
		static CalibrationAnalyzerBagResult Blank(int bagId2, string error, int dataPoints = 0, int overshootPoints = 0, IReadOnlyList<float>? readOnlyList = null)
		{
			return new CalibrationAnalyzerBagResult(bagId2, Success: false, null, null, null, null, null, null, null, dataPoints, overshootPoints, readOnlyList ?? Array.Empty<float>(), null, null, error);
		}
	}

	public static CalibrationAnalyzerResult AnalyzeCsv(string csvPath, IReadOnlyList<int> bags)
	{
		Table table = LoadCsv(csvPath);
		List<CalibrationAnalyzerBagResult> list = bags.Select((int bagId) => AnalyzeBag(table, bagId)).ToList();
		return new CalibrationAnalyzerResult(list.All((CalibrationAnalyzerBagResult r) => r.Success), csvPath, list);
	}
}
