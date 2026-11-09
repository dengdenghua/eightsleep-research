using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;

namespace Eight.Firmness.Services.Calibration;

public static class CalibrationGhostComparer
{
	private static readonly string[] Fields = new string[14]
	{
		"success", "a", "b", "b_std", "b_cv", "b_cv_warning", "deflate_intercept", "r_squared", "data_points", "overshoot_points",
		"overshoot_values", "deflate_multiplier_low", "deflate_intercept_low", "error"
	};

	public static CalibrationGhostResult Compare(string authority, CalibrationAnalyzerResult? authoritativeResult, CalibrationAnalysisAttempt ghost)
	{
		if (!ghost.Ran || (object)ghost.Result == null)
		{
			return new CalibrationGhostResult(GhostRan: false, Matched: false, Array.Empty<CalibrationGhostBagDelta>(), ghost.Error, ghost.DurationMs, authority);
		}
		if ((object)authoritativeResult == null)
		{
			return new CalibrationGhostResult(GhostRan: true, Matched: false, Array.Empty<CalibrationGhostBagDelta>(), "authoritative analyzer produced no result to compare against", ghost.DurationMs, authority);
		}
		Dictionary<int, CalibrationAnalyzerBagResult> dictionary = ByBagId(authoritativeResult.Bags);
		Dictionary<int, CalibrationAnalyzerBagResult> dictionary2 = ByBagId(ghost.Result.Bags);
		IOrderedEnumerable<int> orderedEnumerable = from id in dictionary.Keys.Union(dictionary2.Keys)
			orderby id
			select id;
		List<CalibrationGhostBagDelta> list = new List<CalibrationGhostBagDelta>();
		foreach (int item in orderedEnumerable)
		{
			dictionary.TryGetValue(item, out var value);
			dictionary2.TryGetValue(item, out var value2);
			List<CalibrationGhostFieldDelta> list2 = new List<CalibrationGhostFieldDelta>();
			CompareField(list2, "success", value?.Success, value2?.Success);
			CompareField(list2, "a", value?.A, value2?.A);
			CompareField(list2, "b", value?.B, value2?.B);
			CompareField(list2, "b_std", value?.BStd, value2?.BStd);
			CompareField(list2, "b_cv", value?.BCv, value2?.BCv);
			CompareField(list2, "b_cv_warning", value?.BCvWarning, value2?.BCvWarning);
			CompareField(list2, "deflate_intercept", value?.DeflateIntercept, value2?.DeflateIntercept);
			CompareField(list2, "r_squared", value?.RSquared, value2?.RSquared);
			CompareField(list2, "data_points", value?.DataPoints, value2?.DataPoints);
			CompareField(list2, "overshoot_points", value?.OvershootPoints, value2?.OvershootPoints);
			CompareSequence(list2, "overshoot_values", value?.OvershootValues, value2?.OvershootValues);
			CompareField(list2, "deflate_multiplier_low", value?.DeflateMultiplierLow, value2?.DeflateMultiplierLow);
			CompareField(list2, "deflate_intercept_low", value?.DeflateInterceptLow, value2?.DeflateInterceptLow);
			CompareField(list2, "error", value?.Error, value2?.Error);
			if (list2.Count > 0)
			{
				list.Add(new CalibrationGhostBagDelta(item, list2));
			}
		}
		bool flag = dictionary.Count == dictionary2.Count && dictionary.Keys.All(dictionary2.ContainsKey);
		return new CalibrationGhostResult(GhostRan: true, flag && list.Count == 0, list, null, ghost.DurationMs, authority);
	}

	private static Dictionary<int, CalibrationAnalyzerBagResult> ByBagId(IReadOnlyList<CalibrationAnalyzerBagResult> bags)
	{
		return (from b in bags
			group b by b.BagId).ToDictionary((IGrouping<int, CalibrationAnalyzerBagResult> g) => g.Key, (IGrouping<int, CalibrationAnalyzerBagResult> g) => g.First());
	}

	private static void CompareField<T>(List<CalibrationGhostFieldDelta> deltas, string field, T authoritative, T ghost)
	{
		if (!EqualityComparer<T>.Default.Equals(authoritative, ghost))
		{
			deltas.Add(new CalibrationGhostFieldDelta(field, Render(authoritative), Render(ghost)));
		}
	}

	private static void CompareSequence(List<CalibrationGhostFieldDelta> deltas, string field, IReadOnlyList<float>? authoritative, IReadOnlyList<float>? ghost)
	{
		if ((authoritative != null || ghost != null) && (authoritative == null || ghost == null || !authoritative.SequenceEqual(ghost)))
		{
			deltas.Add(new CalibrationGhostFieldDelta(field, Render(authoritative), Render(ghost)));
		}
	}

	private static string Render<T>(T value)
	{
		if (value != null)
		{
			if (!(value is IReadOnlyList<float> source))
			{
				if (value is float)
				{
					return ((float)((((object)value) is float) ? ((object)value) : null)).ToString("R", CultureInfo.InvariantCulture);
				}
				return value.ToString() ?? "null";
			}
			return "[" + string.Join(", ", source.Select((float v) => v.ToString("F3", CultureInfo.InvariantCulture))) + "]";
		}
		return "null";
	}

	public static string Summarize(CalibrationGhostResult ghost)
	{
		string text = ((ghost.Authority == "csharp") ? "node" : "csharp");
		if (!ghost.GhostRan)
		{
			return "ghost (" + text + ") did not run: " + ghost.GhostError;
		}
		if (!ghost.Matched)
		{
			string value = string.Join("; ", ghost.PerBagDeltas.Select((CalibrationGhostBagDelta bag) => $"bag {bag.BagId}: " + string.Join(", ", bag.Fields.Select((CalibrationGhostFieldDelta f) => $"{f.Field} auth={f.AuthoritativeValue} ghost={f.GhostValue}"))));
			return $"ghost ({text}) DISAGREED ({ghost.GhostDurationMs}ms): {value}";
		}
		return $"ghost ({text}) matched the authoritative analyzer exactly ({ghost.GhostDurationMs}ms)";
	}
}
