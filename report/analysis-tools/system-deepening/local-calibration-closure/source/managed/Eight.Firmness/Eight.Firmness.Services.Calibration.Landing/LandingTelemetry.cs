using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using Eight.Firmness.Models.Telemetry;
using Eight.Firmness.Models.Telemetry.Enhanced;

namespace Eight.Firmness.Services.Calibration.Landing;

public sealed class LandingTelemetry : ILandingTelemetryView
{
	public const uint RetainMs = 120000u;

	private const double MinAmbientKpa = 50.0;

	private readonly Lock gate = new Lock();

	private readonly TimeProvider clock;

	private readonly Dictionary<uint, PressureTelemetry> pressureAwaitingAxes = new Dictionary<uint, PressureTelemetry>();

	private readonly Dictionary<uint, PressureSampleAxes> axesAwaitingPressure = new Dictionary<uint, PressureSampleAxes>();

	private readonly Dictionary<int, List<GaugeSample>> samples = new Dictionary<int, List<GaugeSample>>();

	private readonly Dictionary<int, List<ValveReport>> valves = new Dictionary<int, List<ValveReport>>();

	private EnhancedControlState? control;

	private uint? latestBoardMs;

	private DateTimeOffset? latestReceivedAt;

	private double maxGauge = double.NegativeInfinity;

	public uint? LatestBoardMs
	{
		get
		{
			using (gate.EnterScope())
			{
				return latestBoardMs;
			}
		}
	}

	public DateTimeOffset? LatestSampleReceivedAt
	{
		get
		{
			using (gate.EnterScope())
			{
				return latestReceivedAt;
			}
		}
	}

	public double MaxGaugeKpa
	{
		get
		{
			using (gate.EnterScope())
			{
				return maxGauge;
			}
		}
	}

	public LandingTelemetry(TimeProvider? clock = null)
	{
		this.clock = clock ?? TimeProvider.System;
	}

	public void ResetCeiling()
	{
		using (gate.EnterScope())
		{
			maxGauge = double.NegativeInfinity;
		}
	}

	public void AddPressure(PressureTelemetry telemetry)
	{
		using (gate.EnterScope())
		{
			if (axesAwaitingPressure.Remove(telemetry.DeviceTimestampMs, out PressureSampleAxes value))
			{
				Join(telemetry, value);
			}
			else
			{
				pressureAwaitingAxes[telemetry.DeviceTimestampMs] = telemetry;
			}
		}
	}

	public void AddEnhanced(EnhancedTelemetryDocument document)
	{
		using (gate.EnterScope())
		{
			PressureTelemetry value;
			if (!(document is PressureSampleAxes pressureSampleAxes))
			{
				if (!(document is EnhancedControlState enhancedControlState))
				{
					if (!(document is SolenoidState solenoidState))
					{
						return;
					}
					{
						foreach (ValveState valve in solenoidState.Valves)
						{
							ListFor(valves, valve.BagId).Add(new ValveReport(solenoidState.UptimeMs, valve.DeflateState, valve.DeflateChanged, valve.InflateState, valve.InflateChanged));
						}
						return;
					}
				}
				control = enhancedControlState;
			}
			else if (pressureAwaitingAxes.Remove(pressureSampleAxes.LegacyFirstTimestampMs, out value))
			{
				Join(value, pressureSampleAxes);
			}
			else
			{
				axesAwaitingPressure[pressureSampleAxes.LegacyFirstTimestampMs] = pressureSampleAxes;
			}
		}
	}

	public (BagFsmState State, uint BoardMs)? FsmState(int bagId)
	{
		using (gate.EnterScope())
		{
			EnhancedBagState enhancedBagState = control?.Bags.FirstOrDefault((EnhancedBagState b) => b.BagId == bagId);
			return ((object)enhancedBagState == null) ? (((BagFsmState, uint)?)null) : new (BagFsmState, uint)?(((BagFsmState)enhancedBagState.FsmState, control.UptimeMs));
		}
	}

	public (double Mean, double Sd, int N) Window(int bagId, uint fromMs, uint toMs)
	{
		using (gate.EnterScope())
		{
			if (!samples.TryGetValue(bagId, out List<GaugeSample> value))
			{
				return (Mean: double.NaN, Sd: double.NaN, N: 0);
			}
			List<double> list = (from s in value
				where s.BoardMs >= fromMs && s.BoardMs <= toMs
				select s.Kpa).ToList();
			if (list.Count == 0)
			{
				return (Mean: double.NaN, Sd: double.NaN, N: 0);
			}
			double mean = list.Average();
			double item = ((list.Count > 1) ? Math.Sqrt(list.Sum((double v) => (v - mean) * (v - mean)) / (double)(list.Count - 1)) : 0.0);
			return (Mean: mean, Sd: item, N: list.Count);
		}
	}

	public GaugeSample? SampleAtOrBefore(int bagId, uint boardMs)
	{
		using (gate.EnterScope())
		{
			if (!samples.TryGetValue(bagId, out List<GaugeSample> value))
			{
				return null;
			}
			for (int num = value.Count - 1; num >= 0; num--)
			{
				if (value[num].BoardMs <= boardMs)
				{
					return value[num];
				}
			}
			return null;
		}
	}

	public IReadOnlyList<ValveReport> ValveReports(int bagId, uint sinceMs)
	{
		using (gate.EnterScope())
		{
			IReadOnlyList<ValveReport> result;
			if (!valves.TryGetValue(bagId, out List<ValveReport> value))
			{
				IReadOnlyList<ValveReport> readOnlyList = Array.Empty<ValveReport>();
				result = readOnlyList;
			}
			else
			{
				List<ValveReport> list = new List<ValveReport>();
				list.AddRange(value.Where((ValveReport r) => r.BoardMs >= sinceMs));
				IReadOnlyList<ValveReport> readOnlyList = new _003C_003Ez__ReadOnlyList<ValveReport>(list);
				result = readOnlyList;
			}
			return result;
		}
	}

	private void Join(PressureTelemetry telemetry, PressureSampleAxes axes)
	{
		List<double> pressureKpa = telemetry.Ambient.PressureKpa;
		bool flag = false;
		for (int i = 0; i < telemetry.Sensors.Count && i < axes.Axes.Count; i++)
		{
			List<double> pressureKpa2 = telemetry.Sensors[i].PressureKpa;
			IReadOnlyList<SampleTime> readOnlyList = axes.Axes[i].Samples;
			List<GaugeSample> list = ListFor(samples, i);
			for (int j = 0; j < pressureKpa2.Count && j < readOnlyList.Count && j < pressureKpa.Count; j++)
			{
				uint? timestampMs = readOnlyList[j].TimestampMs;
				if (!timestampMs.HasValue)
				{
					continue;
				}
				uint valueOrDefault = timestampMs.GetValueOrDefault();
				if (IsReading(pressureKpa[j]) && IsReading(pressureKpa2[j]))
				{
					double num = pressureKpa2[j] - pressureKpa[j];
					Insert(list, new GaugeSample(valueOrDefault, num));
					maxGauge = Math.Max(maxGauge, num);
					flag = true;
					timestampMs = latestBoardMs;
					if (!timestampMs.HasValue || valueOrDefault > latestBoardMs)
					{
						latestBoardMs = valueOrDefault;
					}
				}
			}
		}
		if (flag)
		{
			latestReceivedAt = clock.GetUtcNow();
		}
		Prune();
	}

	private static bool IsReading(double kpa)
	{
		if (double.IsFinite(kpa))
		{
			return kpa >= 50.0;
		}
		return false;
	}

	private static void Insert(List<GaugeSample> list, GaugeSample sample)
	{
		int num = list.Count;
		while (num > 0 && list[num - 1].BoardMs > sample.BoardMs)
		{
			num--;
		}
		list.Insert(num, sample);
	}

	private void Prune()
	{
		uint? num = latestBoardMs;
		if (!num.HasValue)
		{
			return;
		}
		uint valueOrDefault = num.GetValueOrDefault();
		if (valueOrDefault < 120000)
		{
			return;
		}
		uint cutoff = valueOrDefault - 120000;
		foreach (List<GaugeSample> value in samples.Values)
		{
			value.RemoveAll((GaugeSample s) => s.BoardMs < cutoff);
		}
		foreach (List<ValveReport> value2 in valves.Values)
		{
			value2.RemoveAll((ValveReport r) => r.BoardMs < cutoff);
		}
		foreach (uint item in pressureAwaitingAxes.Keys.Where((uint k) => k < cutoff).ToList())
		{
			pressureAwaitingAxes.Remove(item);
		}
		foreach (uint item2 in axesAwaitingPressure.Keys.Where((uint k) => k < cutoff).ToList())
		{
			axesAwaitingPressure.Remove(item2);
		}
	}

	private static List<T> ListFor<T>(Dictionary<int, List<T>> map, int bagId)
	{
		if (!map.TryGetValue(bagId, out List<T> value))
		{
			value = (map[bagId] = new List<T>());
		}
		return value;
	}
}
