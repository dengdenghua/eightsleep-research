using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;

namespace Eight.Firmness.Services.Calibration;

public static class CalibrationMath
{
	public static double[] Diff(IReadOnlyList<double> values)
	{
		double[] array = new double[values.Count];
		if (array.Length != 0)
		{
			array[0] = double.NaN;
		}
		for (int i = 1; i < values.Count; i++)
		{
			array[i] = values[i] - values[i - 1];
		}
		return array;
	}

	private static (int Low, int High) CenteredWindow(int i, int window, int n)
	{
		int num = window / 2;
		int num2 = window - 1 - num;
		return (Low: Math.Max(0, i - num), High: Math.Min(n - 1, i + num2));
	}

	public static double Median(IReadOnlyList<double> values)
	{
		double[] array = (from v in values.Where(double.IsFinite)
			orderby v
			select v).ToArray();
		if (array.Length == 0)
		{
			return double.NaN;
		}
		int num = array.Length / 2;
		if (array.Length % 2 != 1)
		{
			return (array[num - 1] + array[num]) / 2.0;
		}
		return array[num];
	}

	public static double Mean(IReadOnlyList<double> values)
	{
		double num = 0.0;
		int num2 = 0;
		foreach (double value in values)
		{
			if (double.IsFinite(value))
			{
				num += value;
				num2++;
			}
		}
		if (num2 != 0)
		{
			return num / (double)num2;
		}
		return double.NaN;
	}

	public static double Max(IReadOnlyList<double> values)
	{
		double num = double.NaN;
		foreach (double value in values)
		{
			if (double.IsFinite(value) && (double.IsNaN(num) || value > num))
			{
				num = value;
			}
		}
		return num;
	}

	public static double Std(IReadOnlyList<double> values)
	{
		double[] array = values.Where(double.IsFinite).ToArray();
		if (array.Length == 0)
		{
			return double.NaN;
		}
		double mean = array.Sum() / (double)array.Length;
		return Math.Sqrt(array.Sum((double v) => (v - mean) * (v - mean)) / (double)array.Length);
	}

	public static int Argmax(IReadOnlyList<double> values)
	{
		int result = 0;
		double num = double.NegativeInfinity;
		for (int i = 0; i < values.Count; i++)
		{
			if (double.IsFinite(values[i]) && values[i] > num)
			{
				num = values[i];
				result = i;
			}
		}
		return result;
	}

	public static double Quantile(IReadOnlyList<double> values, double q)
	{
		double[] array = (from v in values.Where(double.IsFinite)
			orderby v
			select v).ToArray();
		if (array.Length == 0)
		{
			return double.NaN;
		}
		if (array.Length == 1)
		{
			return array[0];
		}
		double num = q * (double)(array.Length - 1);
		int num2 = (int)Math.Floor(num);
		int num3 = (int)Math.Ceiling(num);
		if (num2 == num3)
		{
			return array[num2];
		}
		return array[num2] + (num - (double)num2) * (array[num3] - array[num2]);
	}

	public static double[] RollingMedian(IReadOnlyList<double> values, int window, int minPeriods = 1)
	{
		int count = values.Count;
		double[] array = new double[count];
		List<double> list = new List<double>(window);
		for (int i = 0; i < count; i++)
		{
			var (num, num2) = CenteredWindow(i, window, count);
			list.Clear();
			for (int j = num; j <= num2; j++)
			{
				if (double.IsFinite(values[j]))
				{
					list.Add(values[j]);
				}
			}
			array[i] = ((list.Count >= minPeriods) ? Median(list) : double.NaN);
		}
		return array;
	}

	public static double[] RollingMean(IReadOnlyList<double> values, int window, int? minPeriods = null)
	{
		int num = minPeriods ?? window;
		int count = values.Count;
		double[] array = new double[count];
		for (int i = 0; i < count; i++)
		{
			(int Low, int High) tuple = CenteredWindow(i, window, count);
			int item = tuple.Low;
			int item2 = tuple.High;
			double num2 = 0.0;
			int num3 = 0;
			for (int j = item; j <= item2; j++)
			{
				if (double.IsFinite(values[j]))
				{
					num2 += values[j];
					num3++;
				}
			}
			array[i] = ((num3 >= num) ? (num2 / (double)num3) : double.NaN);
		}
		return array;
	}

	public static double[] FillNa(IReadOnlyList<double> values, double fill)
	{
		return values.Select((double v) => (!double.IsFinite(v)) ? fill : v).ToArray();
	}

	public static (double Slope, double Intercept, double RSquared) LinRegress(IReadOnlyList<double> x, IReadOnlyList<double> y)
	{
		int count = x.Count;
		double num = 0.0;
		double num2 = 0.0;
		double num3 = 0.0;
		double num4 = 0.0;
		for (int i = 0; i < count; i++)
		{
			num += x[i];
			num2 += y[i];
			num3 += x[i] * x[i];
			num4 += x[i] * y[i];
		}
		double num5 = (double)count * num3 - num * num;
		double num6 = ((num5 == 0.0) ? 0.0 : (((double)count * num4 - num * num2) / num5));
		double num7 = (num2 - num6 * num) / (double)count;
		double num8 = num2 / (double)count;
		double num9 = 0.0;
		double num10 = 0.0;
		for (int j = 0; j < count; j++)
		{
			double num11 = num6 * x[j] + num7;
			num9 += (y[j] - num11) * (y[j] - num11);
			num10 += (y[j] - num8) * (y[j] - num8);
		}
		double item = ((num10 == 0.0) ? 0.0 : (1.0 - num9 / num10));
		return (Slope: num6, Intercept: num7, RSquared: item);
	}

	public static IReadOnlyList<int> OutlierIqrMask(IReadOnlyList<double> values, double iqrMultiplier)
	{
		int[] array = Enumerable.Range(0, values.Count).ToArray();
		if (values.Count < 4)
		{
			return array;
		}
		double num = Quantile(values, 0.25);
		double num2 = Quantile(values, 0.75);
		double num3 = num2 - num;
		double lower = num - iqrMultiplier * num3;
		double upper = num2 + iqrMultiplier * num3;
		List<int> list = new List<int>();
		list.AddRange(array.Where((int i) => values[i] >= lower && values[i] <= upper));
		return new _003C_003Ez__ReadOnlyList<int>(list);
	}

	public static double RoundTo(double value, int digits)
	{
		if (!double.IsFinite(value))
		{
			return value;
		}
		int num = ((!(value < 0.0)) ? 1 : (-1));
		int num2 = Math.Min(100, digits + 25);
		string text = Math.Abs(value).ToString("F" + num2.ToString(CultureInfo.InvariantCulture), CultureInfo.InvariantCulture);
		int num3 = text.IndexOf('.', StringComparison.Ordinal);
		string s = text.Substring(0, num3) + text.Substring(num3 + 1, digits);
		string text2 = text;
		int num4 = num3 + 1 + digits;
		string text3 = text2.Substring(num4, text2.Length - num4);
		double num5 = double.Parse(s, CultureInfo.InvariantCulture);
		int num6 = ((text3.Length > 0) ? (text3[0] - 48) : 0);
		int num7;
		if (text3.Length > 1)
		{
			text2 = text3;
			num7 = (text2.Substring(1, text2.Length - 1).Any((char c) => c >= '1' && c <= '9') ? 1 : 0);
		}
		else
		{
			num7 = 0;
		}
		bool flag = (byte)num7 != 0;
		bool flag2 = num6 > 5 || (num6 >= 5 && (flag || num5 % 2.0 == 1.0));
		return (double)num * (num5 + (double)(flag2 ? 1 : 0)) / Math.Pow(10.0, digits);
	}
}
