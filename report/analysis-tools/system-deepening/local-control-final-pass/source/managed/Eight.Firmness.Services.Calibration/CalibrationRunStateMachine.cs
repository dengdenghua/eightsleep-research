using System;
using System.Collections.Generic;
using System.Linq;
using Eight.Firmness.Models;

namespace Eight.Firmness.Services.Calibration;

public sealed class CalibrationRunStateMachine
{
	private enum Phase
	{
		Setup,
		PurgeOpening,
		Purging,
		PurgeClosing,
		PurgeSettle,
		BagSetup,
		InflateSegmentOpening,
		InflatePumping,
		InflateHoldOpening,
		InflateHold,
		InflateSegmentCheck,
		DeflatePulseOpening,
		DeflatePulseWaiting,
		DeflateHoldOpening,
		DeflateHold,
		DeflateSegmentCheck,
		DrainOpening,
		Draining,
		DrainSettle1,
		DrainSettle2,
		VentPulseOpening,
		VentPulseWaiting,
		CeilingVentOpening,
		CeilingVenting,
		ShutdownStart,
		Done
	}

	private enum CeilingCheck
	{
		Safe,
		StaleVent,
		Confirmed
	}

	private static readonly TimeSpan ValveSettle = TimeSpan.FromSeconds(1L);

	private readonly CalibrationOptions options;

	private readonly IReadOnlyList<int> bags;

	private readonly HashSet<int> largeBags;

	private readonly int totalBagCount;

	private readonly DateTimeOffset startedAt;

	private readonly List<string> warnings = new List<string>();

	private Phase phase;

	private Phase afterVentPhase = Phase.Done;

	private DateTimeOffset phaseStartedAt;

	private CalibrationRunOutcome outcome;

	private string? error;

	private bool shutdownEmitted;

	private int bagIndex = -1;

	private int inflateSegments;

	private int deflateSegments;

	private bool reachedInflateStopThisSegment;

	private DateTimeOffset? currentBagStartedAt;

	private readonly List<TimeSpan> completedBagDurations = new List<TimeSpan>();

	public bool IsDone => phase == Phase.Done;

	private int? CurrentBagId
	{
		get
		{
			if (bagIndex < 0 || bagIndex >= bags.Count)
			{
				return null;
			}
			return bags[bagIndex];
		}
	}

	private bool InPressureDrivenPhase
	{
		get
		{
			Phase phase = this.phase;
			if ((uint)(phase - 6) <= 9u || (uint)(phase - 20) <= 1u)
			{
				return true;
			}
			return false;
		}
	}

	private bool InDeflateSide
	{
		get
		{
			Phase phase = this.phase;
			if ((uint)(phase - 11) > 4u)
			{
				if (this.phase == Phase.VentPulseOpening || this.phase == Phase.VentPulseWaiting)
				{
					return afterVentPhase == Phase.DeflateSegmentCheck;
				}
				return false;
			}
			return true;
		}
	}

	public CalibrationRunStateMachine(CalibrationOptions options, IReadOnlyList<int> bags, IReadOnlyList<int> largeBags, int totalBagCount, DateTimeOffset startedAt)
	{
		this.options = options;
		this.bags = bags;
		HashSet<int> hashSet = new HashSet<int>();
		foreach (int largeBag in largeBags)
		{
			hashSet.Add(largeBag);
		}
		this.largeBags = hashSet;
		this.totalBagCount = totalBagCount;
		this.startedAt = startedAt;
		phaseStartedAt = startedAt;
	}

	public CalibrationStepResult Advance(DateTimeOffset now, IReadOnlyDictionary<int, double>? gaugePressureByBagKpa, TimeSpan? telemetryAge, bool cancelRequested)
	{
		List<CalibrationAction> actions = new List<CalibrationAction>();
		if (outcome == CalibrationRunOutcome.Running && phase != Phase.CeilingVenting && phase != Phase.ShutdownStart && phase != Phase.Done)
		{
			if (cancelRequested)
			{
				outcome = CalibrationRunOutcome.Cancelled;
				error = "Calibration aborted by the operator";
				phase = Phase.ShutdownStart;
			}
			else if (now - startedAt > options.MaxRunDuration)
			{
				outcome = CalibrationRunOutcome.Failed;
				error = $"Calibration aborted: the run exceeded its {options.MaxRunDuration.TotalMinutes:F0}-minute " + "limit. A bag is probably leaking or a valve is stuck.";
				phase = Phase.ShutdownStart;
			}
		}
		int num = 0;
		do
		{
			if (++num > 10000)
			{
				throw new InvalidOperationException("CalibrationRunStateMachine exceeded its instant-transition guard — likely a phase loop bug.");
			}
		}
		while (!Step(now, gaugePressureByBagKpa, telemetryAge, actions) && phase != Phase.Done);
		return new CalibrationStepResult(actions, BuildStatus(now));
	}

	private bool Step(DateTimeOffset now, IReadOnlyDictionary<int, double>? gauge, TimeSpan? age, List<CalibrationAction> actions)
	{
		switch (phase)
		{
		case Phase.Setup:
		{
			actions.Add(new CalibrationAction.DisableControlLoop());
			actions.Add(new CalibrationAction.SetPumpPower(0, options.PumpPower));
			actions.Add(new CalibrationAction.SetPumpPower(1, options.PumpPower));
			SolenoidOpeningConfig solenoidOpeningConfig = options.SolenoidOpeningConfig;
			if ((object)solenoidOpeningConfig != null)
			{
				actions.Add(new CalibrationAction.PinSolenoidOpeningProfile(solenoidOpeningConfig));
			}
			Enter(Phase.PurgeOpening, now);
			return false;
		}
		case Phase.PurgeOpening:
			foreach (int bag in bags)
			{
				actions.Add(new CalibrationAction.SetSolenoid(bag, SolenoidDirection.Deflate, SolenoidValveState.Open));
			}
			Enter(Phase.Purging, now);
			return false;
		case Phase.Purging:
			return WaitFor(now, options.PurgeDuration, Phase.PurgeClosing);
		case Phase.PurgeClosing:
			actions.Add(new CalibrationAction.CloseAllSolenoids(totalBagCount));
			Enter(Phase.PurgeSettle, now);
			return false;
		case Phase.PurgeSettle:
			return WaitFor(now, ValveSettle, Phase.BagSetup);
		case Phase.BagSetup:
			if (bagIndex >= 0)
			{
				DateTimeOffset? dateTimeOffset = currentBagStartedAt;
				if (dateTimeOffset.HasValue)
				{
					DateTimeOffset valueOrDefault = dateTimeOffset.GetValueOrDefault();
					completedBagDurations.Add(now - valueOrDefault);
				}
			}
			bagIndex++;
			if (bagIndex >= bags.Count)
			{
				Enter(Phase.ShutdownStart, now);
				return false;
			}
			inflateSegments = 0;
			deflateSegments = 0;
			reachedInflateStopThisSegment = false;
			currentBagStartedAt = now;
			Enter(Phase.InflateSegmentOpening, now);
			return false;
		case Phase.InflateSegmentOpening:
		{
			int value7 = CurrentBagId.Value;
			if (inflateSegments >= SegmentsUp(value7) || ThresholdReached(value7, options.StopInflateKpa, up: true, gauge, age))
			{
				Enter(Phase.DeflatePulseOpening, now);
				return false;
			}
			actions.Add(new CalibrationAction.SetSolenoid(value7, SolenoidDirection.Inflate, SolenoidValveState.Open));
			actions.Add(new CalibrationAction.SetPumpPower(options.PumpId, options.PumpPower));
			actions.Add(new CalibrationAction.SetPumpEnabled(options.PumpId, Enabled: true));
			reachedInflateStopThisSegment = false;
			Enter(Phase.InflatePumping, now);
			return false;
		}
		case Phase.InflatePumping:
		{
			int value10 = CurrentBagId.Value;
			TimeSpan timeSpan3 = (IsLarge(value10) ? options.InflateDurationLarge : options.InflateDurationSmall);
			switch (CheckCeiling(value10, gauge, age))
			{
			case CeilingCheck.Confirmed:
				CloseInflateAndStopPump(actions, value10);
				BeginCeilingVent(value10, now);
				return false;
			case CeilingCheck.StaleVent:
				CloseInflateAndStopPump(actions, value10);
				BeginVentPulse(now, Phase.InflateSegmentCheck);
				return false;
			default:
			{
				double? num = FreshGauge(value10, gauge, age);
				if (num.HasValue)
				{
					double valueOrDefault2 = num.GetValueOrDefault();
					if (valueOrDefault2 >= options.StopInflateKpa)
					{
						reachedInflateStopThisSegment = true;
						CloseInflateAndStopPump(actions, value10);
						Enter(Phase.InflateHoldOpening, now);
						return false;
					}
				}
				if (now - phaseStartedAt >= timeSpan3)
				{
					CloseInflateAndStopPump(actions, value10);
					Enter(Phase.InflateHoldOpening, now);
					return false;
				}
				return true;
			}
			}
		}
		case Phase.InflateHoldOpening:
			Enter(Phase.InflateHold, now);
			return false;
		case Phase.InflateHold:
		{
			int value12 = CurrentBagId.Value;
			switch (CheckCeiling(value12, gauge, age))
			{
			case CeilingCheck.Confirmed:
				BeginCeilingVent(value12, now);
				return false;
			case CeilingCheck.StaleVent:
				BeginVentPulse(now, Phase.InflateSegmentCheck);
				return false;
			default:
			{
				double? num2 = FreshGauge(value12, gauge, age);
				if (num2.HasValue)
				{
					double valueOrDefault3 = num2.GetValueOrDefault();
					if (valueOrDefault3 >= options.StopInflateKpa)
					{
						reachedInflateStopThisSegment = true;
					}
				}
				return WaitFor(now, options.HoldDuration, Phase.InflateSegmentCheck);
			}
			}
		}
		case Phase.InflateSegmentCheck:
		{
			int value = CurrentBagId.Value;
			inflateSegments++;
			bool flag = reachedInflateStopThisSegment || ThresholdReached(value, options.StopInflateKpa, up: true, gauge, age);
			if (!flag && inflateSegments < SegmentsUp(value))
			{
				Enter(Phase.InflateSegmentOpening, now);
				return false;
			}
			if (!flag)
			{
				warnings.Add($"Bag {value}: inflate hit its {SegmentsUp(value)}-segment cap without reaching {options.StopInflateKpa} kPa");
			}
			Enter(Phase.DeflatePulseOpening, now);
			return false;
		}
		case Phase.DeflatePulseOpening:
		{
			int value11 = CurrentBagId.Value;
			if (deflateSegments >= SegmentsDown(value11) || ThresholdReached(value11, options.StopDeflateKpa, up: false, gauge, age))
			{
				Enter(Phase.DrainOpening, now);
				return false;
			}
			actions.Add(new CalibrationAction.SetSolenoid(value11, SolenoidDirection.Deflate, SolenoidValveState.Open));
			Enter(Phase.DeflatePulseWaiting, now);
			return false;
		}
		case Phase.DeflatePulseWaiting:
		{
			int value4 = CurrentBagId.Value;
			TimeSpan timeSpan = (IsLarge(value4) ? options.DeflatePulseLarge : options.DeflatePulseSmall);
			if (now - phaseStartedAt < timeSpan)
			{
				return true;
			}
			actions.Add(new CalibrationAction.SetSolenoid(value4, SolenoidDirection.Deflate, SolenoidValveState.Closed));
			Enter(Phase.DeflateHoldOpening, now);
			return false;
		}
		case Phase.DeflateHoldOpening:
			Enter(Phase.DeflateHold, now);
			return false;
		case Phase.DeflateHold:
		{
			int value3 = CurrentBagId.Value;
			switch (CheckCeiling(value3, gauge, age))
			{
			case CeilingCheck.Confirmed:
				BeginCeilingVent(value3, now);
				return false;
			case CeilingCheck.StaleVent:
				BeginVentPulse(now, Phase.DeflateSegmentCheck);
				return false;
			default:
				return WaitFor(now, options.HoldDuration, Phase.DeflateSegmentCheck);
			}
		}
		case Phase.DeflateSegmentCheck:
		{
			int value14 = CurrentBagId.Value;
			deflateSegments++;
			bool flag2 = ThresholdReached(value14, options.StopDeflateKpa, up: false, gauge, age);
			if (!flag2 && deflateSegments < SegmentsDown(value14))
			{
				Enter(Phase.DeflatePulseOpening, now);
				return false;
			}
			if (!flag2)
			{
				warnings.Add($"Bag {value14}: deflate hit its {SegmentsDown(value14)}-segment cap without dropping to {options.StopDeflateKpa} kPa");
			}
			Enter(Phase.DrainOpening, now);
			return false;
		}
		case Phase.DrainOpening:
		{
			int value13 = CurrentBagId.Value;
			actions.Add(new CalibrationAction.SetSolenoid(value13, SolenoidDirection.Deflate, SolenoidValveState.Open));
			Enter(Phase.Draining, now);
			return false;
		}
		case Phase.Draining:
		{
			int value9 = CurrentBagId.Value;
			TimeSpan timeSpan2 = (IsLarge(value9) ? options.DrainLarge : options.DrainSmall);
			if (now - phaseStartedAt < timeSpan2)
			{
				return true;
			}
			actions.Add(new CalibrationAction.SetSolenoid(value9, SolenoidDirection.Deflate, SolenoidValveState.Closed));
			Enter(Phase.DrainSettle1, now);
			return false;
		}
		case Phase.DrainSettle1:
			return WaitFor(now, ValveSettle, Phase.DrainSettle2, () =>
			{
				actions.Add(new CalibrationAction.CloseAllSolenoids(totalBagCount));
			});
		case Phase.DrainSettle2:
			return WaitFor(now, ValveSettle, Phase.BagSetup);
		case Phase.VentPulseOpening:
		{
			int value8 = CurrentBagId.Value;
			actions.Add(new CalibrationAction.SetSolenoid(value8, SolenoidDirection.Deflate, SolenoidValveState.Open));
			Enter(Phase.VentPulseWaiting, now);
			return false;
		}
		case Phase.VentPulseWaiting:
		{
			int value6 = CurrentBagId.Value;
			if (now - phaseStartedAt < options.VentPulse)
			{
				return true;
			}
			actions.Add(new CalibrationAction.SetSolenoid(value6, SolenoidDirection.Deflate, SolenoidValveState.Closed));
			Enter(afterVentPhase, now);
			return false;
		}
		case Phase.CeilingVentOpening:
		{
			int value5 = CurrentBagId.Value;
			actions.Add(new CalibrationAction.SetSolenoid(value5, SolenoidDirection.Deflate, SolenoidValveState.Open));
			Enter(Phase.CeilingVenting, now);
			return false;
		}
		case Phase.CeilingVenting:
		{
			int value2 = CurrentBagId.Value;
			if (now - phaseStartedAt < options.CeilingDrain)
			{
				return true;
			}
			actions.Add(new CalibrationAction.SetSolenoid(value2, SolenoidDirection.Deflate, SolenoidValveState.Closed));
			outcome = CalibrationRunOutcome.Failed;
			if (error == null)
			{
				error = $"Calibration aborted: bag {value2} exceeded the {options.MaxGaugeKpa} kPa ceiling.";
			}
			Enter(Phase.ShutdownStart, now);
			return false;
		}
		case Phase.ShutdownStart:
			if (!shutdownEmitted)
			{
				actions.Add(new CalibrationAction.SetPumpEnabled(0, Enabled: false));
				actions.Add(new CalibrationAction.SetPumpEnabled(1, Enabled: false));
				actions.Add(new CalibrationAction.CloseAllSolenoids(totalBagCount));
				shutdownEmitted = true;
				if (outcome == CalibrationRunOutcome.Running)
				{
					outcome = CalibrationRunOutcome.Completed;
				}
			}
			phase = Phase.Done;
			return true;
		case Phase.Done:
			return true;
		default:
			throw new InvalidOperationException($"Unhandled calibration phase: {phase}");
		}
	}

	private void Enter(Phase next, DateTimeOffset now)
	{
		phase = next;
		phaseStartedAt = now;
	}

	private bool WaitFor(DateTimeOffset now, TimeSpan duration, Phase next, Action? onElapsed = null)
	{
		if (now - phaseStartedAt < duration)
		{
			return true;
		}
		onElapsed?.Invoke();
		Enter(next, now);
		return false;
	}

	private void CloseInflateAndStopPump(List<CalibrationAction> actions, int bagId)
	{
		actions.Add(new CalibrationAction.SetPumpEnabled(options.PumpId, Enabled: false));
		actions.Add(new CalibrationAction.SetSolenoid(bagId, SolenoidDirection.Inflate, SolenoidValveState.Closed));
	}

	private void BeginVentPulse(DateTimeOffset now, Phase resumeAt)
	{
		afterVentPhase = resumeAt;
		Enter(Phase.VentPulseOpening, now);
	}

	private void BeginCeilingVent(int bagId, DateTimeOffset now)
	{
		Enter(Phase.CeilingVentOpening, now);
	}

	private CeilingCheck CheckCeiling(int bagId, IReadOnlyDictionary<int, double>? gauge, TimeSpan? age)
	{
		bool flag = !age.HasValue || age > options.MaxTelemetryAge;
		double? num = ((gauge != null && gauge.TryGetValue(bagId, out var value)) ? new double?(value) : ((double?)null));
		if (!num.HasValue | flag)
		{
			return CeilingCheck.StaleVent;
		}
		if (!(num > options.MaxGaugeKpa))
		{
			return CeilingCheck.Safe;
		}
		return CeilingCheck.Confirmed;
	}

	private double? FreshGauge(int bagId, IReadOnlyDictionary<int, double>? gauge, TimeSpan? age)
	{
		if (!age.HasValue || age > options.MaxTelemetryAge || gauge == null || !gauge.TryGetValue(bagId, out var value))
		{
			return null;
		}
		return value;
	}

	private bool ThresholdReached(int bagId, double thresholdKpa, bool up, IReadOnlyDictionary<int, double>? gauge, TimeSpan? age)
	{
		double? num = FreshGauge(bagId, gauge, age);
		if (!num.HasValue)
		{
			return true;
		}
		if (!up)
		{
			return num.Value <= thresholdKpa;
		}
		return num.Value >= thresholdKpa;
	}

	private bool IsLarge(int bagId)
	{
		return largeBags.Contains(bagId);
	}

	private int SegmentsUp(int bagId)
	{
		if (!IsLarge(bagId))
		{
			return options.SegmentsUpSmall;
		}
		return options.SegmentsUpLarge;
	}

	private int SegmentsDown(int bagId)
	{
		if (!IsLarge(bagId))
		{
			return options.SegmentsDownSmall;
		}
		return options.SegmentsDownLarge;
	}

	private TimeSpan OneSegmentFloor(int bagId)
	{
		bool flag = IsLarge(bagId);
		TimeSpan timeSpan;
		if (InDeflateSide)
		{
			timeSpan = (flag ? options.DeflatePulseLarge : options.DeflatePulseSmall);
		}
		else
		{
			timeSpan = (flag ? options.InflateDurationLarge : options.InflateDurationSmall);
		}
		return timeSpan + options.HoldDuration;
	}

	private TimeSpan? DeterministicRemainingInBag(DateTimeOffset now, int bagId)
	{
		return phase switch
		{
			Phase.Draining => (TimeSpan?)(Left(IsLarge(bagId) ? options.DrainLarge : options.DrainSmall) + ValveSettle + ValveSettle), 
			Phase.DrainSettle1 => Left(ValveSettle) + ValveSettle, 
			Phase.DrainSettle2 => Left(ValveSettle), 
			Phase.CeilingVenting => Left(options.CeilingDrain), 
			_ => null, 
		};
		TimeSpan Left(TimeSpan duration)
		{
			if (!(duration > now - phaseStartedAt))
			{
				return TimeSpan.Zero;
			}
			return duration - (now - phaseStartedAt);
		}
	}

	private TimeSpan HonestFloor(DateTimeOffset now, int bagId)
	{
		TimeSpan? timeSpan = DeterministicRemainingInBag(now, bagId);
		if (timeSpan.HasValue)
		{
			return timeSpan.GetValueOrDefault();
		}
		TimeSpan timeSpan2 = (IsLarge(bagId) ? options.DrainLarge : options.DrainSmall) + ValveSettle + ValveSettle;
		if (!InPressureDrivenPhase)
		{
			return timeSpan2;
		}
		return timeSpan2 + OneSegmentFloor(bagId);
	}

	private TimeSpan CurrentBagRemaining(DateTimeOffset now)
	{
		int? currentBagId = CurrentBagId;
		if (currentBagId.HasValue)
		{
			int valueOrDefault = currentBagId.GetValueOrDefault();
			DateTimeOffset? dateTimeOffset = currentBagStartedAt;
			if (dateTimeOffset.HasValue)
			{
				TimeSpan timeSpan = now - currentBagStartedAt.Value;
				TimeSpan timeSpan2 = ((options.NominalBagDuration > timeSpan) ? (options.NominalBagDuration - timeSpan) : TimeSpan.Zero);
				TimeSpan timeSpan3 = HonestFloor(now, valueOrDefault);
				if (!(timeSpan2 > timeSpan3))
				{
					return timeSpan3;
				}
				return timeSpan2;
			}
		}
		return TimeSpan.Zero;
	}

	private TimeSpan EstimatedPerBagDuration()
	{
		if (completedBagDurations.Count <= 0)
		{
			return options.NominalBagDuration;
		}
		return TimeSpan.FromTicks((long)completedBagDurations.Average((TimeSpan d) => d.Ticks));
	}

	private TimeSpan RemainingBagsEstimate()
	{
		int num = bags.Count - (bagIndex + 1);
		if (num <= 0)
		{
			return TimeSpan.Zero;
		}
		return EstimatedPerBagDuration() * num;
	}

	private TimeSpan PurgeRemainder(DateTimeOffset now)
	{
		switch (phase)
		{
		case Phase.Setup:
		case Phase.PurgeOpening:
			return options.PurgeDuration + ValveSettle;
		case Phase.Purging:
			return Left(options.PurgeDuration) + ValveSettle;
		case Phase.PurgeClosing:
			return ValveSettle;
		case Phase.PurgeSettle:
			return Left(ValveSettle);
		default:
			return TimeSpan.Zero;
		}
		TimeSpan Left(TimeSpan duration)
		{
			if (!(duration > now - phaseStartedAt))
			{
				return TimeSpan.Zero;
			}
			return duration - (now - phaseStartedAt);
		}
	}

	private TimeSpan EstimateRemaining(DateTimeOffset now)
	{
		Phase phase = this.phase;
		if ((uint)phase <= 4u)
		{
			return PurgeRemainder(now) + EstimatedPerBagDuration() * bags.Count;
		}
		if (outcome != CalibrationRunOutcome.Running)
		{
			return TimeSpan.Zero;
		}
		return CurrentBagRemaining(now) + RemainingBagsEstimate();
	}

	private CalibrationRunStatus BuildStatus(DateTimeOffset now)
	{
		TimeSpan elapsed = now - startedAt;
		TimeSpan estimatedTimeRemaining = EstimateRemaining(now);
		int num = 1 + bags.Count;
		Phase phase = this.phase;
		bool flag = (uint)phase <= 4u;
		int num2 = ((!flag) ? (Math.Min(bagIndex, bags.Count) + 1) : 0);
		int value = ((outcome != CalibrationRunOutcome.Running) ? 100 : ((int)Math.Round(100.0 * (double)num2 / (double)num, MidpointRounding.AwayFromZero)));
		return new CalibrationRunStatus(outcome, this.phase.ToString(), CurrentBagId, Math.Clamp(bagIndex, 0, bags.Count), bags.Count, Math.Clamp(value, 0, 100), elapsed, estimatedTimeRemaining, warnings, error);
	}
}
