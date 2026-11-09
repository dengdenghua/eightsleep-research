using System;
using System.Collections.Generic;
using System.Linq;
using Eight.Firmness.Models.Telemetry;
using Eight.Firmness.Models.Telemetry.Enhanced;
using Eight.Firmness.Protocol;

namespace Eight.Firmness.Services.Calibration.Landing;

public sealed class LandingRunStateMachine
{
	private enum Phase
	{
		Seed,
		SettleStart,
		Settling,
		PreBaseline,
		AwaitDeflate,
		Freeze,
		BagDone,
		Restore,
		Done
	}

	private readonly LandingTimings timings;

	private readonly IReadOnlyList<int> bags;

	private readonly int bagCount;

	private readonly int reps;

	private readonly IReadOnlyDictionary<int, EntryCompensation> entry;

	private readonly IReadOnlyList<ToleranceBinConfig> bins;

	private readonly float binMinKpa;

	private readonly float binWidthKpa;

	private readonly DateTimeOffset startedAt;

	private readonly Dictionary<int, double> seed = new Dictionary<int, double>();

	private readonly List<LandingTrial> trials = new List<LandingTrial>();

	private readonly List<string> warnings = new List<string>();

	private Phase phase;

	private DateTimeOffset phaseStartedAt;

	private CalibrationRunOutcome outcome;

	private string? error;

	private int bagIndex;

	private int rep = 1;

	private int stepIndex;

	private int repsThisBag;

	private bool extraRepRun;

	private int shortRetries;

	private double target;

	private double tolerance;

	private uint? steadySinceMs;

	private bool steadyBefore;

	private double baseline;

	private double moveTarget;

	private uint markMs;

	private DateTimeOffset trialStartedAt;

	private LandingMechanism mechanism;

	private double? stopKpa;

	private double? deflateMs;

	private bool inflateLeaked;

	public IReadOnlyList<LandingTrial> Trials => trials;

	public IReadOnlyList<string> Warnings => warnings;

	public bool IsDone => phase == Phase.Done;

	public LandingRunStateMachine(LandingTimings timings, IReadOnlyList<int> bags, int bagCount, int reps, IReadOnlyDictionary<int, EntryCompensation> entry, ControlLoopConfig config, DateTimeOffset startedAt)
	{
		this.timings = timings;
		this.bags = bags;
		this.bagCount = bagCount;
		this.reps = reps;
		this.entry = entry;
		bins = config.ToleranceBins;
		binMinKpa = config.ToleranceMinKpa;
		binWidthKpa = config.ToleranceBinWidthKpa;
		this.startedAt = startedAt;
		phaseStartedAt = startedAt;
		repsThisBag = reps;
	}

	public IReadOnlyList<LandingFitResult> Fits()
	{
		List<LandingFitResult> list = new List<LandingFitResult>();
		list.AddRange(bags.Select((int b) => LandingFit.Fit(trials, b)));
		return new _003C_003Ez__ReadOnlyList<LandingFitResult>(list);
	}

	public LandingStepResult Advance(DateTimeOffset now, ILandingTelemetryView telemetry, bool cancelRequested)
	{
		List<LandingAction> actions = new List<LandingAction>();
		Phase phase = this.phase;
		if ((uint)(phase - 7) > 1u)
		{
			string text = (cancelRequested ? null : Guard(now, telemetry));
			if (cancelRequested || text != null)
			{
				outcome = (cancelRequested ? CalibrationRunOutcome.Cancelled : CalibrationRunOutcome.Failed);
				error = text;
				this.phase = Phase.Restore;
			}
		}
		while (Step(now, telemetry, actions))
		{
		}
		return new LandingStepResult(actions, (this.phase == Phase.Done) ? outcome : CalibrationRunOutcome.Running, Describe(), (bagIndex < bags.Count) ? new int?(bags[bagIndex]) : ((int?)null), bagIndex, error);
	}

	private string? Guard(DateTimeOffset now, ILandingTelemetryView telemetry)
	{
		if (telemetry.MaxGaugeKpa >= timings.CeilingKpa)
		{
			return $"gauge pressure reached {telemetry.MaxGaugeKpa:F2} kPa (ceiling {timings.CeilingKpa} kPa)";
		}
		foreach (int bag in bags)
		{
			BagFsmState? bagFsmState = telemetry.FsmState(bag)?.State;
			bool flag;
			if (bagFsmState.HasValue)
			{
				BagFsmState valueOrDefault = bagFsmState.GetValueOrDefault();
				if (valueOrDefault - 5 <= BagFsmState.Steady)
				{
					flag = true;
					goto IL_00d7;
				}
			}
			flag = false;
			goto IL_00d7;
			IL_00d7:
			if (flag)
			{
				return $"bag {bag} is in {telemetry.FsmState(bag).Value.State.ToString().ToUpperInvariant()}: the board has stopped " + "controlling it (a failed pressure sensor, overpressure, overcurrent or overtemperature). Check debugfirmness/get for the reason and power-cycle the control box before calibrating";
			}
		}
		DateTimeOffset dateTimeOffset = telemetry.LatestSampleReceivedAt ?? startedAt;
		if (!(now - dateTimeOffset > timings.TelemetryStale))
		{
			return null;
		}
		return $"no timed pressure samples for {(now - dateTimeOffset).TotalSeconds:F0} s: is the enhanced telemetry profile on?";
	}

	private bool Step(DateTimeOffset now, ILandingTelemetryView telemetry, List<LandingAction> actions)
	{
		switch (phase)
		{
		case Phase.Seed:
			actions.Add(AllOff());
			foreach (int bag in bags)
			{
				seed[bag] = Math.Min(timings.MaxSeedA, (double)entry[bag].A * timings.SeedFactor);
				actions.Add(Compensation(bag));
			}
			return Enter((bags.Count > 0) ? Phase.SettleStart : Phase.Restore, now);
		case Phase.SettleStart:
			return StartSettle(now, actions);
		case Phase.Settling:
			return Settle(now, telemetry);
		case Phase.PreBaseline:
			if (now - phaseStartedAt >= timings.PreBaseline)
			{
				return Move(now, telemetry, actions);
			}
			return false;
		case Phase.AwaitDeflate:
			return AwaitDeflate(now, telemetry, actions);
		case Phase.Freeze:
			if (now - phaseStartedAt >= timings.Freeze)
			{
				return Record(now, telemetry, actions);
			}
			return false;
		case Phase.BagDone:
			return NextBag(now);
		case Phase.Restore:
			actions.Add(AllOff());
			foreach (int bag2 in bags)
			{
				actions.Add(new LandingAction.SetCompensation(bag2, entry[bag2].A, entry[bag2].B, entry[bag2].Ci));
			}
			if (outcome == CalibrationRunOutcome.Running)
			{
				outcome = CalibrationRunOutcome.Completed;
			}
			return Enter(Phase.Done, now);
		default:
			return false;
		}
	}

	private bool StartSettle(DateTimeOffset now, List<LandingAction> actions)
	{
		int bag = bags[bagIndex];
		target = timings.Steps[stepIndex].FromKpa;
		tolerance = Math.Clamp(DepartureBand(target), 0.05, 0.15);
		steadySinceMs = null;
		trialStartedAt = now;
		actions.Add(Only(bag, target));
		return Enter(Phase.Settling, now);
	}

	private bool Settle(DateTimeOffset now, ILandingTelemetryView telemetry)
	{
		int num = bags[bagIndex];
		uint? latestBoardMs = telemetry.LatestBoardMs;
		if (latestBoardMs.HasValue)
		{
			uint valueOrDefault = latestBoardMs.GetValueOrDefault();
			(BagFsmState, uint)? tuple = telemetry.FsmState(num);
			uint num2 = (uint)timings.SteadyWindow.TotalMilliseconds;
			double item = telemetry.Window(num, (valueOrDefault > num2) ? (valueOrDefault - num2) : 0u, valueOrDefault).Mean;
			if (!tuple.HasValue || tuple.GetValueOrDefault().Item1 != BagFsmState.Steady || !(Math.Abs(item - target) <= tolerance))
			{
				steadySinceMs = null;
			}
			else
			{
				latestBoardMs = steadySinceMs;
				if (!latestBoardMs.HasValue)
				{
					steadySinceMs = valueOrDefault;
				}
				else if ((double)(valueOrDefault - steadySinceMs.Value) >= timings.SteadyHold.TotalMilliseconds)
				{
					steadyBefore = true;
					return Enter(Phase.PreBaseline, now);
				}
			}
		}
		if (now - phaseStartedAt >= timings.SettleTimeout)
		{
			steadyBefore = false;
			warnings.Add($"bag {num} rep {rep}: did not settle steady at {target:F2} kPa within {timings.SettleTimeout.TotalSeconds:F0} s; trial kept");
			return Enter(Phase.PreBaseline, now);
		}
		return false;
	}

	private bool Move(DateTimeOffset now, ILandingTelemetryView telemetry, List<LandingAction> actions)
	{
		int num = bags[bagIndex];
		uint valueOrDefault = telemetry.LatestBoardMs.GetValueOrDefault();
		uint num2 = (uint)timings.Baseline.TotalMilliseconds;
		baseline = telemetry.Window(num, (valueOrDefault > num2) ? (valueOrDefault - num2) : 0u, valueOrDefault).Mean;
		moveTarget = Math.Round(baseline - timings.Steps[stepIndex].DeltaKpa, 3, MidpointRounding.AwayFromZero);
		if (!double.IsFinite(moveTarget) || moveTarget <= 0.0)
		{
			outcome = CalibrationRunOutcome.Failed;
			error = $"bag {num}: no step to command from a baseline of {baseline:F3} kPa (no usable pressure samples, or the bag did not fill)";
			return Enter(Phase.Restore, now);
		}
		markMs = valueOrDefault;
		mechanism = LandingMechanism.None;
		stopKpa = null;
		deflateMs = null;
		inflateLeaked = false;
		actions.Add(Only(num, moveTarget));
		return Enter(Phase.AwaitDeflate, now);
	}

	private bool AwaitDeflate(DateTimeOffset now, ILandingTelemetryView telemetry, List<LandingAction> actions)
	{
		int num = bags[bagIndex];
		IReadOnlyList<ValveReport> readOnlyList = telemetry.ValveReports(num, markMs);
		int num2 = readOnlyList.ToList().FindIndex((ValveReport r) => r.DeflateChanged && r.Deflate != ValveMotion.Closed);
		int num3 = ((num2 < 0) ? (-1) : readOnlyList.ToList().FindIndex(num2 + 1, (ValveReport r) => r.DeflateChanged && r.Deflate == ValveMotion.Closed));
		if (num3 >= 0)
		{
			uint num4 = (uint)timings.CloseDwell.TotalMilliseconds;
			uint boardMs = readOnlyList[num2].BoardMs;
			uint num5 = readOnlyList[num3].BoardMs - num4;
			if (telemetry.LatestBoardMs.GetValueOrDefault() < num5 && now - phaseStartedAt < timings.DeflateWait + timings.CloseDwell + timings.Baseline)
			{
				return false;
			}
			mechanism = LandingMechanism.Deflate;
			string text = DwellInconsistency(readOnlyList, num2, num3, num5);
			uint num6 = (uint)timings.StopSampleLead.TotalMilliseconds;
			GaugeSample? gaugeSample = telemetry.SampleAtOrBefore(num, (num5 > num6) ? (num5 - num6) : 0u);
			if (text != null || num5 <= boardMs)
			{
				warnings.Add($"bag {num} rep {rep} from {target:F2}: stop not placed ({text ?? "close edge inside the dwell"}); trial excluded");
			}
			else if (!gaugeSample.HasValue || (double)(num5 - gaugeSample.Value.BoardMs) > (double)num6 + timings.EdgeTolerance.TotalMilliseconds)
			{
				warnings.Add($"bag {num} rep {rep} from {target:F2}: no sample near the stop; trial excluded");
				deflateMs = num5 - boardMs;
			}
			else
			{
				stopKpa = gaugeSample.Value.Kpa;
				deflateMs = num5 - boardMs;
				double num7 = (moveTarget - (double)entry[num].Ci) / seed[num];
				GaugeSample? gaugeSample2 = ((gaugeSample.Value.BoardMs != 0) ? telemetry.SampleAtOrBefore(num, gaugeSample.Value.BoardMs - 1) : ((GaugeSample?)null));
				bool flag = stopKpa.Value > num7 + timings.StopTargetToleranceKpa;
				bool flag2 = gaugeSample2.HasValue && gaugeSample2.Value.Kpa < num7 - timings.StopTargetToleranceKpa;
				if (flag | flag2)
				{
					warnings.Add($"bag {num} rep {rep} from {target:F2}: stop {stopKpa.Value:F3} does not match the firmware's target {num7:F3} ({(flag ? "stop above it" : $"sample before it already {gaugeSample2.Value.Kpa:F3}")}); trial kept");
				}
			}
			return Freeze(now, readOnlyList, actions);
		}
		bool flag3 = num2 >= 0;
		TimeSpan timeSpan = (flag3 ? (timings.DeflateWait + timings.CloseDwell) : timings.DeflateWait);
		if (now - phaseStartedAt < timeSpan)
		{
			return false;
		}
		mechanism = ((!flag3) ? LandingMechanism.None : LandingMechanism.Deflate);
		return Freeze(now, readOnlyList, actions);
	}

	private string? DwellInconsistency(IReadOnlyList<ValveReport> reports, int open, int closed, uint exitMs)
	{
		uint num = (uint)timings.EdgeTolerance.TotalMilliseconds;
		for (int i = open + 1; i < closed; i++)
		{
			ValveReport valveReport = reports[i];
			if (valveReport.Deflate == ValveMotion.RampingDown && valveReport.BoardMs + num < exitMs)
			{
				return $"ramping down at {valveReport.BoardMs} ms, before the placed stop at {exitMs} ms";
			}
			ValveMotion deflate = valveReport.Deflate;
			bool flag = deflate - 2 <= ValveMotion.Ramping;
			if (flag && valveReport.BoardMs > exitMs + num)
			{
				return $"still open at {valveReport.BoardMs} ms, after the placed stop at {exitMs} ms";
			}
		}
		return null;
	}

	private bool Freeze(DateTimeOffset now, IReadOnlyList<ValveReport> reports, List<LandingAction> actions)
	{
		inflateLeaked = reports.Any((ValveReport r) => r.InflateChanged && r.Inflate != ValveMotion.Closed);
		actions.Add(AllOff());
		return Enter(Phase.Freeze, now);
	}

	private bool Record(DateTimeOffset now, ILandingTelemetryView telemetry, List<LandingAction> actions)
	{
		int num = bags[bagIndex];
		uint valueOrDefault = telemetry.LatestBoardMs.GetValueOrDefault();
		uint num2 = (uint)timings.Rest.TotalMilliseconds;
		(double Mean, double Sd, int N) tuple = telemetry.Window(num, (valueOrDefault > num2) ? (valueOrDefault - num2) : 0u, valueOrDefault);
		double item = tuple.Mean;
		double item2 = tuple.Sd;
		LandingTrial item3 = new LandingTrial(num, rep, target, moveTarget, baseline, stopKpa, deflateMs, item, item2, mechanism, steadyBefore, inflateLeaked, seed[num], trialStartedAt);
		trials.Add(item3);
		if (mechanism == LandingMechanism.Deflate && deflateMs < 400.0 && seed[num] < timings.MaxSeedA && shortRetries < timings.ShortRetries)
		{
			shortRetries++;
			seed[num] = Math.Min(timings.MaxSeedA, seed[num] * timings.ShortSeedStep);
			actions.Add(Compensation(num));
			warnings.Add($"bag {num} rep {rep} from {target:F2}: {deflateMs:F0} ms deflate is window-limited; seed a raised to {seed[num]:F3}, retrying");
			return Enter(Phase.SettleStart, now);
		}
		shortRetries = 0;
		return NextAfterTrial(now, num);
	}

	private bool NextAfterTrial(DateTimeOffset now, int bag)
	{
		stepIndex++;
		if (stepIndex < timings.Steps.Count)
		{
			return Enter(Phase.SettleStart, now);
		}
		stepIndex = 0;
		rep++;
		if (rep <= repsThisBag)
		{
			return Enter(Phase.SettleStart, now);
		}
		LandingFitResult landingFitResult = LandingFit.Fit(trials, bag);
		double? residualSd = landingFitResult.ResidualSd;
		int num;
		if (residualSd.HasValue)
		{
			double valueOrDefault = residualSd.GetValueOrDefault();
			num = ((valueOrDefault > timings.AdaptiveResidualKpa) ? 1 : 0);
		}
		else
		{
			num = 0;
		}
		bool flag = (byte)num != 0;
		bool flag2 = !landingFitResult.Success && landingFitResult.N < timings.Steps.Count * reps;
		if (!extraRepRun && (flag | flag2))
		{
			extraRepRun = true;
			repsThisBag++;
			warnings.Add($"bag {bag}: {(flag ? $"residual sd {landingFitResult.ResidualSd:F3} kPa" : landingFitResult.Error)}; running one more rep");
			return Enter(Phase.SettleStart, now);
		}
		return Enter(Phase.BagDone, now);
	}

	private bool NextBag(DateTimeOffset now)
	{
		bagIndex++;
		rep = 1;
		stepIndex = 0;
		repsThisBag = reps;
		extraRepRun = false;
		shortRetries = 0;
		return Enter((bagIndex < bags.Count) ? Phase.SettleStart : Phase.Restore, now);
	}

	private double DepartureBand(double kpa)
	{
		if (bins.Count == 0)
		{
			return 0.3;
		}
		double num = ((binWidthKpa > 0f) ? ((double)binWidthKpa) : 1.0);
		int index = Math.Clamp((int)Math.Floor((kpa - (double)binMinKpa) / num), 0, bins.Count - 1);
		return bins[index].DepartureKpa;
	}

	private LandingAction.SetSetpoints AllOff()
	{
		List<float> list = new List<float>();
		list.AddRange(Enumerable.Repeat(-1f, bagCount));
		return new LandingAction.SetSetpoints(new _003C_003Ez__ReadOnlyList<float>(list));
	}

	private LandingAction.SetSetpoints Only(int bag, double kpa)
	{
		float[] array = Enumerable.Repeat(-1f, bagCount).ToArray();
		array[bag] = (float)kpa;
		return new LandingAction.SetSetpoints(array);
	}

	private LandingAction.SetCompensation Compensation(int bag)
	{
		return new LandingAction.SetCompensation(bag, (float)seed[bag], entry[bag].B, entry[bag].Ci);
	}

	private bool Enter(Phase next, DateTimeOffset now)
	{
		phase = next;
		phaseStartedAt = now;
		bool flag = (((uint)(next - 2) <= 3u || next == Phase.Done) ? true : false);
		return !flag;
	}

	private string Describe()
	{
		Phase phase = this.phase;
		if ((uint)(phase - 7) <= 1u)
		{
			return "Landing: restoring";
		}
		if (bagIndex < bags.Count)
		{
			return $"Landing: bag {bags[bagIndex]} rep {rep}/{repsThisBag} from {timings.Steps[Math.Min(stepIndex, timings.Steps.Count - 1)].FromKpa:F2} kPa ({this.phase})";
		}
		return "Landing";
	}
}
