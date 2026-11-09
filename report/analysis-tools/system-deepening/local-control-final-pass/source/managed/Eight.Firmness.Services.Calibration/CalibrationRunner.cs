using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Threading;
using System.Threading.Tasks;
using Eight.Firmness.Models;
using Eight.Firmness.Models.Telemetry;
using Eight.Firmness.Models.Telemetry.Enhanced;
using Eight.Firmness.Protocol;
using Eight.Firmness.Services.Calibration.Landing;
using Eight.Lsp.Protocol;
using Eight.Lsp.Protocol.Exceptions;
using Eight.Lsp.Subsystems.Models;
using Eight.Lsp.Subsystems.Services.Connection;
using Microsoft.Extensions.Logging;
using PeterO.Cbor;

namespace Eight.Firmness.Services.Calibration;

public sealed class CalibrationRunner(Side side, IDeviceConnection connection, CalibrationOptions options, BalloonOptions balloonOptions, CalibrationAnalyzerRunner analyzer, ICalibrationRunStore runStore, ILogger logger)
{
	private sealed record LandingEntryState(uint SettleWindowMs, byte TelemetryProfile, bool ProfileChanged, IReadOnlyDictionary<int, EntryCompensation> Compensation, IReadOnlyDictionary<int, float> StoredB, IReadOnlySet<int> SeparateLowSegment);

	private CalibrationRunStateMachine? stateMachine;

	private CalibrationCsvWriter? csvWriter;

	private string? runDirectory;

	private string? runId;

	private IReadOnlyList<int> runBags = Array.Empty<int>();

	private DateTimeOffset runStartedAt;

	private CalibrationRunStatus? lastStatus;

	private CalibrationGhostResult? lastGhostResult;

	private bool cancelRequested;

	private bool finalizing;

	private PressureTelemetry? lastSeenTelemetry;

	private DateTimeOffset lastSeenTelemetryAt;

	private readonly LandingTelemetry landingTelemetry = new LandingTelemetry();

	private LandingRunStateMachine? landing;

	private LandingEntryState? landingEntry;

	private DateTimeOffset landingStartedAt;

	private bool landingTimedOut;

	private IReadOnlyList<string> pulseWarnings = Array.Empty<string>();

	private IReadOnlyList<LandingFitResult>? landingFits;

	private string? previousCalibrationHex;

	private readonly List<string> writeWarnings = new List<string>();

	private readonly HashSet<int> landingCompensated = new HashSet<int>();

	private CalibrationDeflateMethod runMethod;

	private const int LandingSendAttempts = 2;

	private static readonly TimeSpan LandingNominalBagDuration = TimeSpan.FromMinutes(5L);

	public bool IsCalibrating => stateMachine != null;

	private bool UsesLanding => runMethod != CalibrationDeflateMethod.Pulse;

	private bool LandingOnly => runMethod == CalibrationDeflateMethod.LandingOnly;

	public void OnPressureTelemetry(PressureTelemetry telemetry)
	{
		if (UsesLanding)
		{
			landingTelemetry.AddPressure(telemetry);
		}
	}

	public void OnEnhancedTelemetry(EnhancedTelemetryDocument document)
	{
		if (UsesLanding)
		{
			landingTelemetry.AddEnhanced(document);
		}
	}

	public CalibrationRunStatus? GetStatus()
	{
		return lastStatus;
	}

	public CalibrationRunStatus Start(DateTimeOffset now, int bagCount, IReadOnlyList<int>? bags = null, CalibrationDeflateMethod? method = null)
	{
		if (stateMachine != null)
		{
			return lastStatus;
		}
		IReadOnlyList<int> readOnlyList;
		if (bags == null || bags.Count <= 0)
		{
			readOnlyList = options.EffectiveBags;
		}
		else
		{
			List<int> list = new List<int>();
			list.AddRange(bags.Distinct());
			IReadOnlyList<int> readOnlyList2 = new _003C_003Ez__ReadOnlyList<int>(list);
			readOnlyList = readOnlyList2;
		}
		runBags = readOnlyList;
		cancelRequested = false;
		finalizing = false;
		lastSeenTelemetry = null;
		lastGhostResult = null;
		landing = null;
		landingEntry = null;
		landingTimedOut = false;
		landingFits = null;
		previousCalibrationHex = null;
		writeWarnings.Clear();
		landingCompensated.Clear();
		pulseWarnings = Array.Empty<string>();
		runMethod = method ?? options.DeflateMethod;
		stateMachine = new CalibrationRunStateMachine(options, runBags, options.EffectiveLargeBags, bagCount, now);
		runStartedAt = now;
		(runId, runDirectory) = runStore.CreateRun(side, now);
		runStore.SaveRecord(runDirectory, new CalibrationRunRecord(runId, side, now, null, CalibrationRunState.Running, runBags, "trace.csv", 0L, Array.Empty<string>(), null, null, null, null, runMethod));
		lastStatus = new CalibrationRunStatus(CalibrationRunOutcome.Running, "Setup", (runBags.Count > 0) ? new int?(runBags[0]) : ((int?)null), 0, runBags.Count, 0, TimeSpan.Zero, TimeSpan.Zero, Array.Empty<string>(), null);
		logger.LogInformation("[calibration][{Side}] Starting run {RunId} for bags [{Bags}]", side.ToLowerString(), runId, string.Join(',', runBags));
		return lastStatus;
	}

	public async Task AbandonAsync(int bagCount, string reason, TimeSpan limit)
	{
		if (!IsCalibrating || finalizing)
		{
			return;
		}
		using CancellationTokenSource budget = new CancellationTokenSource(limit);
		logger.LogWarning("[calibration][{Side}] Run abandoned: {Reason}", side.ToLowerString(), reason);
		if (landing == null && (object)landingEntry == null)
		{
			await SafeShutdownBestEffort(budget.Token);
		}
		else
		{
			await SendLandingRestoreBestEffort(bagCount, budget.Token);
			await RestoreLandingEntryAsync(budget.Token);
		}
		IReadOnlyList<string> readOnlyList = pulseWarnings;
		IReadOnlyList<string> readOnlyList2 = landing?.Warnings ?? Array.Empty<string>();
		int num = 0;
		string[] array = new string[readOnlyList.Count + readOnlyList2.Count];
		foreach (string item in readOnlyList)
		{
			array[num] = item;
			num++;
		}
		foreach (string item2 in readOnlyList2)
		{
			array[num] = item2;
			num++;
		}
		await FinalizeAsync(CalibrationRunState.Failed, new _003C_003Ez__ReadOnlyArray<string>(array), "abandoned: " + reason, budget.Token);
	}

	public CalibrationRunStatus? Cancel()
	{
		cancelRequested = true;
		return lastStatus;
	}

	public async Task Tick(DateTimeOffset now, PressureTelemetry? latestTelemetry, int bagCount, CancellationToken cancellation)
	{
		if (stateMachine == null)
		{
			return;
		}
		if ((object)latestTelemetry != null && (object)latestTelemetry != lastSeenTelemetry)
		{
			lastSeenTelemetry = latestTelemetry;
			lastSeenTelemetryAt = now;
			if (landing == null && !LandingOnly)
			{
				RecordTelemetry(latestTelemetry);
			}
		}
		if (landing != null)
		{
			await TickLanding(now, bagCount, cancellation);
			return;
		}
		if (LandingOnly)
		{
			await StartLandingAsync(now, bagCount, cancellation);
			return;
		}
		TimeSpan? telemetryAge = (((object)lastSeenTelemetry == null) ? ((TimeSpan?)null) : new TimeSpan?(now - lastSeenTelemetryAt));
		Dictionary<int, double> gaugePressureByBagKpa = BuildGaugeDictionary(lastSeenTelemetry);
		CalibrationStepResult result;
		try
		{
			result = stateMachine.Advance(now, gaugePressureByBagKpa, telemetryAge, cancelRequested);
		}
		catch (Exception ex)
		{
			logger.LogError(ex, "[calibration][{Side}] State machine threw — safing device directly", side.ToLowerString());
			await SafeShutdownBestEffort(cancellation);
			await FinalizeAsync(CalibrationRunState.Failed, Array.Empty<string>(), ex.Message, cancellation);
			return;
		}
		lastStatus = (UsesLanding ? AsFirstStage(result.Status) : result.Status);
		try
		{
			foreach (CalibrationAction action in result.Actions)
			{
				await SendAction(action, bagCount, cancellation);
			}
		}
		catch (Exception ex)
		{
			logger.LogError(ex, "[calibration][{Side}] Failed to send a device command mid-run — safing directly", side.ToLowerString());
			await SafeShutdownBestEffort(cancellation);
			await FinalizeAsync(CalibrationRunState.Failed, result.Status.Warnings, ex.Message, cancellation);
			return;
		}
		if (result.Status.Outcome != CalibrationRunOutcome.Running && !finalizing)
		{
			CalibrationRunState calibrationRunState = ToRunState(result.Status.Outcome);
			if (calibrationRunState != CalibrationRunState.Completed || !UsesLanding)
			{
				await FinalizeAsync(calibrationRunState, result.Status.Warnings, result.Status.Error, cancellation);
				return;
			}
			pulseWarnings = result.Status.Warnings;
			await StartLandingAsync(now, bagCount, cancellation);
		}
	}

	private static CalibrationRunState ToRunState(CalibrationRunOutcome outcome)
	{
		return outcome switch
		{
			CalibrationRunOutcome.Completed => CalibrationRunState.Completed, 
			CalibrationRunOutcome.Cancelled => CalibrationRunState.Cancelled, 
			_ => CalibrationRunState.Failed, 
		};
	}

	private async Task StartLandingAsync(DateTimeOffset now, int bagCount, CancellationToken cancellation)
	{
		try
		{
			TimeSpan timeout = balloonOptions.CommandTimeout;
			IReadOnlyDictionary<int, float> storedB = await RecordPreviousCalibrationAsync(timeout, cancellation);
			if (LandingOnly)
			{
				List<int> list = runBags.Where((int b) => !storedB.ContainsKey(b)).ToList();
				if (list.Count > 0)
				{
					throw new InvalidOperationException("landingOnly keeps each bag's stored b, but bags [" + string.Join(',', list) + "] are not calibrated; run method landing instead. Nothing was changed");
				}
			}
			ControlLoopConfig config = await ReadLandingConfigAsync(timeout, cancellation);
			RefuseUnusableCompensation(config);
			await PinSettleWindowAsync(timeout, cancellation);
			uint boardWindow = config.DeflateSettleTimeMs ?? 240;
			bool flag = config.TelemetryProfile == 0;
			Dictionary<int, EntryCompensation> entry = config.Bags.ToDictionary((BagCompensationConfig b) => b.BagId, (BagCompensationConfig b) => new EntryCompensation(b.DeflateMultiplier, b.InflateOffsetKpa, b.DeflateIntercept));
			landingEntry = new LandingEntryState(boardWindow, config.TelemetryProfile, flag, entry, storedB, SeparateLowSegments(config));
			if (flag)
			{
				await connection.SendCustomCommand(83, ControlLoopEncoder.EncodeTelemetryProfile(BalloonTelemetryProfile.Both), timeout, cancellation);
			}
			await connection.SendCustomCommand(84, new byte[1] { DeviceMode.Demo.ToByte() }, timeout, cancellation);
			landingTelemetry.ResetCeiling();
			landing = new LandingRunStateMachine(new LandingTimings(), runBags, bagCount, options.LandingReps, entry, config, now);
			landingStartedAt = now;
			logger.LogInformation("[calibration][{Side}] Landing stage for bags [{Bags}] x {Reps} reps (board window {Window} ms)", side.ToLowerString(), string.Join(',', runBags), options.LandingReps, boardWindow);
		}
		catch (Exception ex)
		{
			logger.LogError(ex, "[calibration][{Side}] Could not start the landing stage", side.ToLowerString());
			await RestoreLandingEntryAsync(CancellationToken.None);
			await FinalizeAsync(CalibrationRunState.Failed, pulseWarnings, "landing stage: " + ex.Message, cancellation);
		}
	}

	private void RefuseUnusableCompensation(ControlLoopConfig config)
	{
		Dictionary<int, BagCompensationConfig> live = config.Bags.ToDictionary((BagCompensationConfig b) => b.BagId);
		List<int> list = runBags.Where((int bag) => !live.TryGetValue(bag, out var value) || !float.IsFinite(value.DeflateMultiplier) || value.DeflateMultiplier <= 0f || !float.IsFinite(value.InflateOffsetKpa) || !float.IsFinite(value.DeflateIntercept)).ToList();
		if (list.Count > 0)
		{
			throw new InvalidOperationException("bags [" + string.Join(',', list) + "] report no usable live compensation (a must be finite and above 0, b and ci finite); nothing was changed");
		}
	}

	private IReadOnlySet<int> SeparateLowSegments(ControlLoopConfig config)
	{
		return (from b in config.Bags
			where runBags.Contains(b.BagId) && (b.DeflateMultiplierLow != b.DeflateMultiplier || b.DeflateInterceptLow != b.DeflateIntercept)
			select b.BagId).ToHashSet();
	}

	private async Task<IReadOnlyDictionary<int, float>> RecordPreviousCalibrationAsync(TimeSpan timeout, CancellationToken cancellation)
	{
		byte[] raw = await connection.SendCustomCommandWithResponse(96, CalibrationProtocolEncoder.EncodeGetCalibration(), timeout, cancellation);
		previousCalibrationHex = Convert.ToHexString(raw);
		if (runDirectory != null)
		{
			try
			{
				await File.WriteAllTextAsync(Path.Combine(runDirectory, "calibration-before.hex"), previousCalibrationHex + "\n", cancellation);
			}
			catch (Exception exception)
			{
				logger.LogWarning(exception, "[calibration][{Side}] Could not write calibration-before.hex", side.ToLowerString());
			}
			SaveRunningRecord();
		}
		return CalibratedBags(raw);
	}

	internal static IReadOnlyDictionary<int, float> CalibratedBags(byte[] raw)
	{
		Dictionary<int, float> dictionary = new Dictionary<int, float>();
		try
		{
			CBORObject cBORObject = CBORObject.DecodeFromBytes(raw);
			if (cBORObject.ContainsKey("bags") && cBORObject["bags"].Type == CBORType.Array)
			{
				int num = 0;
				foreach (CBORObject value in cBORObject["bags"].Values)
				{
					if (value.Type == CBORType.Map && value.ContainsKey("c") && value["c"].Type == CBORType.Boolean && value["c"].AsBoolean() && value.ContainsKey("b") && value["b"].IsNumber && float.IsFinite((float)value["b"].AsDouble()))
					{
						dictionary[num] = (float)value["b"].AsDouble();
					}
					num++;
				}
			}
		}
		catch (CBORException)
		{
		}
		return dictionary;
	}

	private void SaveRunningRecord()
	{
		if (runDirectory != null && runId != null)
		{
			runStore.SaveRecord(runDirectory, new CalibrationRunRecord(runId, side, runStartedAt, null, CalibrationRunState.Running, runBags, "trace.csv", 0L, Array.Empty<string>(), null, null, null, null, runMethod, previousCalibrationHex));
		}
	}

	private async Task<ControlLoopConfig> ReadLandingConfigAsync(TimeSpan timeout, CancellationToken cancellation)
	{
		ControlLoopConfig config = ControlLoopConfigParser.Parse(await connection.SendCustomCommandWithResponse(83, ControlLoopEncoder.EncodeReadConfig(), timeout, cancellation));
		List<int> list = runBags.Where((int b) => b < 0 || b >= config.Bags.Count).ToList();
		if (list.Count > 0)
		{
			throw new InvalidOperationException($"board reports compensation for {config.Bags.Count} bags; bags [{string.Join(',', list)}] have none");
		}
		return config;
	}

	private async Task PinSettleWindowAsync(TimeSpan timeout, CancellationToken cancellation)
	{
		try
		{
			await connection.SendCustomCommand(83, ControlLoopEncoder.EncodeDeflateSettleTime(240u), timeout, cancellation);
		}
		catch (DeviceCommunicationException ex) when (((Func<bool>)delegate
		{
			// Could not convert BlockContainer to single expression
			ResponseCode? responseCode = ex.ResponseCode;
			return (responseCode.HasValue && responseCode.GetValueOrDefault() - 1 <= ResponseCode.Nak) ? true : false;
		}).Invoke())
		{
			throw new InvalidOperationException("landing calibration needs balloon firmware >= 0.2.43.0 (the board refused the 0x53/0x0E settle window)", ex);
		}
	}

	private async Task TickLanding(DateTimeOffset now, int bagCount, CancellationToken cancellation)
	{
		if (!landingTimedOut && now - landingStartedAt > options.LandingMaxDuration)
		{
			landingTimedOut = true;
		}
		LandingStepResult result;
		try
		{
			result = landing.Advance(now, landingTelemetry, cancelRequested || landingTimedOut);
		}
		catch (Exception ex)
		{
			logger.LogError(ex, "[calibration][{Side}] Landing stage threw — safing directly", side.ToLowerString());
			await SendLandingRestoreBestEffort(bagCount, CancellationToken.None);
			await FinishLandingAsync(CalibrationRunState.Failed, "landing stage: " + ex.Message, cancellation);
			return;
		}
		lastStatus = LandingStatus(now, result);
		try
		{
			foreach (LandingAction action in result.Actions)
			{
				await SendLandingAction(action, cancellation);
			}
		}
		catch (Exception ex)
		{
			logger.LogError(ex, "[calibration][{Side}] Failed to send a device command in the landing stage — safing directly", side.ToLowerString());
			await SendLandingRestoreBestEffort(bagCount, CancellationToken.None);
			await FinishLandingAsync(CalibrationRunState.Failed, ex.Message, cancellation);
			return;
		}
		if (result.Outcome != CalibrationRunOutcome.Running)
		{
			CalibrationRunState state = ToRunState(result.Outcome);
			string error = result.Error;
			if (landingTimedOut && !cancelRequested)
			{
				state = CalibrationRunState.Failed;
				error = $"landing stage exceeded {options.LandingMaxDuration}";
			}
			await FinishLandingAsync(state, error, cancellation);
		}
	}

	private async Task FinishLandingAsync(CalibrationRunState state, string? error, CancellationToken cancellation)
	{
		LandingRunStateMachine machine = landing;
		landing = null;
		await RestoreLandingEntryAsync(CancellationToken.None);
		WriteLandingCsv(machine.Trials);
		landingFits = LandingFit.GateOnWindow(machine.Fits(), landingEntry?.SettleWindowMs ?? 240);
		foreach (LandingFitResult landingFit in landingFits)
		{
			logger.LogInformation("[calibration][{Side}] Landing fit bag {Bag}: {Result}", side.ToLowerString(), landingFit.BagId, landingFit.Success ? $"a={landingFit.A} ci={landingFit.Ci} R²={landingFit.RSquared} sd={landingFit.ResidualSd} n={landingFit.N}" : landingFit.Error);
		}
		IReadOnlyList<string> readOnlyList = pulseWarnings;
		IReadOnlyList<string> warnings = machine.Warnings;
		int num = 0;
		string[] array = new string[readOnlyList.Count + warnings.Count];
		foreach (string item in readOnlyList)
		{
			array[num] = item;
			num++;
		}
		foreach (string item2 in warnings)
		{
			array[num] = item2;
			num++;
		}
		await FinalizeAsync(state, new _003C_003Ez__ReadOnlyArray<string>(array), error, cancellation);
	}

	private async Task SendLandingAction(LandingAction action, CancellationToken cancellation)
	{
		TimeSpan timeout = balloonOptions.CommandTimeout;
		LandingAction.SetSetpoints setSetpoints = action as LandingAction.SetSetpoints;
		if ((object)setSetpoints == null)
		{
			LandingAction.SetCompensation setCompensation = action as LandingAction.SetCompensation;
			if ((object)setCompensation != null)
			{
				landingCompensated.Add(setCompensation.BagId);
				await SendLandingCommandAsync($"set bag {setCompensation.BagId} compensation (0x53/0x09)", () => connection.SendCustomCommand(83, ControlLoopEncoder.EncodePressureCompensation((byte)setCompensation.BagId, setCompensation.A, setCompensation.B, setCompensation.Ci), timeout, cancellation), cancellation);
			}
		}
		else
		{
			await SendLandingCommandAsync("set setpoints (0x52)", () => connection.SendCustomCommand(82, CalibrationProtocolEncoder.EncodeSetpoints(setSetpoints.Kpa), timeout, cancellation), cancellation);
		}
	}

	private async Task SendLandingCommandAsync(string what, Func<Task> send, CancellationToken cancellation)
	{
		int attempt = 1;
		while (true)
		{
			try
			{
				await send();
				break;
			}
			catch (Exception ex) when (IsTransient(ex, cancellation) && attempt < 2)
			{
				logger.LogWarning("[calibration][{Side}] {What} failed ({Error}); retrying", side.ToLowerString(), what, ex.Message);
			}
			catch (Exception ex2) when (!cancellation.IsCancellationRequested)
			{
				string text = ((attempt > 1) ? $" (after {attempt} attempts)" : "");
				throw new InvalidOperationException(what + ": " + ex2.Message + text, ex2);
			}
			attempt++;
		}
	}

	private static bool IsTransient(Exception ex, CancellationToken cancellation)
	{
		if ((!(ex is TimeoutException) && !(ex is DeviceTimeoutException)) || 1 == 0)
		{
			if (ex is OperationCanceledException)
			{
				return !cancellation.IsCancellationRequested;
			}
			return false;
		}
		return true;
	}

	private async Task SendLandingRestoreBestEffort(int bagCount, CancellationToken cancellation)
	{
		_ = 1;
		try
		{
			await connection.SendCustomCommand(82, CalibrationProtocolEncoder.EncodeDisableControlLoop(bagCount), balloonOptions.CommandTimeout, cancellation);
			IReadOnlyDictionary<int, EntryCompensation> source = landingEntry?.Compensation ?? new Dictionary<int, EntryCompensation>();
			foreach (var (num2, entryCompensation2) in source.Where((KeyValuePair<int, EntryCompensation> e) => landingCompensated.Contains(e.Key)))
			{
				await connection.SendCustomCommand(83, ControlLoopEncoder.EncodePressureCompensation((byte)num2, entryCompensation2.A, entryCompensation2.B, entryCompensation2.Ci), balloonOptions.CommandTimeout, cancellation);
			}
		}
		catch (Exception exception)
		{
			logger.LogError(exception, "[calibration][{Side}] Could not restore the control loops and entry coefficients", side.ToLowerString());
		}
	}

	private async Task RestoreLandingEntryAsync(CancellationToken cancellation)
	{
		if ((object)landingEntry == null)
		{
			return;
		}
		try
		{
			await connection.SendCustomCommand(83, ControlLoopEncoder.EncodeDeflateSettleTime(Math.Min(landingEntry.SettleWindowMs, 2000u)), balloonOptions.CommandTimeout, cancellation);
			if (landingEntry.ProfileChanged)
			{
				await connection.SendCustomCommand(83, ControlLoopEncoder.EncodeTelemetryProfile((BalloonTelemetryProfile)landingEntry.TelemetryProfile), balloonOptions.CommandTimeout, cancellation);
			}
		}
		catch (Exception exception)
		{
			logger.LogWarning(exception, "[calibration][{Side}] Could not restore the settle window / telemetry profile", side.ToLowerString());
		}
	}

	private void WriteLandingCsv(IReadOnlyList<LandingTrial> trials)
	{
		if (runDirectory == null)
		{
			return;
		}
		try
		{
			LandingCsvWriter.Write(Path.Combine(runDirectory, "landing.csv"), trials);
		}
		catch (Exception exception)
		{
			logger.LogWarning(exception, "[calibration][{Side}] Failed to write the landing trials CSV", side.ToLowerString());
		}
	}

	private CalibrationRunStatus AsFirstStage(CalibrationRunStatus pulse)
	{
		double num = PulseShare();
		TimeSpan timeSpan = LandingNominalBagDuration * runBags.Count;
		return pulse with
		{
			Outcome = ((pulse.Outcome != CalibrationRunOutcome.Completed) ? pulse.Outcome : CalibrationRunOutcome.Running),
			ProgressPercent = (int)Math.Round((double)pulse.ProgressPercent * num, MidpointRounding.AwayFromZero),
			EstimatedTimeRemaining = pulse.EstimatedTimeRemaining + timeSpan
		};
	}

	private CalibrationRunStatus LandingStatus(DateTimeOffset now, LandingStepResult result)
	{
		double num = PulseShare();
		int num2 = Math.Max(1, runBags.Count);
		int value = ((result.Outcome == CalibrationRunOutcome.Running) ? ((int)Math.Round(100.0 * (num + (1.0 - num) * (double)result.BagsCompleted / (double)num2), MidpointRounding.AwayFromZero)) : 100);
		CalibrationRunOutcome outcome = result.Outcome;
		string phase = result.Phase;
		int? currentBagId = result.CurrentBagId;
		int bagsCompleted = Math.Min(result.BagsCompleted, runBags.Count);
		int count = runBags.Count;
		int progressPercent = Math.Clamp(value, 0, 100);
		TimeSpan elapsed = now - runStartedAt;
		TimeSpan estimatedTimeRemaining = LandingNominalBagDuration * Math.Max(0, runBags.Count - result.BagsCompleted);
		IReadOnlyList<string> readOnlyList = pulseWarnings;
		IReadOnlyList<string> readOnlyList2 = landing?.Warnings ?? Array.Empty<string>();
		int num3 = 0;
		string[] array = new string[readOnlyList.Count + readOnlyList2.Count];
		foreach (string item in readOnlyList)
		{
			array[num3] = item;
			num3++;
		}
		foreach (string item2 in readOnlyList2)
		{
			array[num3] = item2;
			num3++;
		}
		return new CalibrationRunStatus(outcome, phase, currentBagId, bagsCompleted, count, progressPercent, elapsed, estimatedTimeRemaining, new _003C_003Ez__ReadOnlyArray<string>(array), result.Error);
	}

	private double PulseShare()
	{
		if (LandingOnly)
		{
			return 0.0;
		}
		double num = options.NominalBagDuration.TotalSeconds * (double)runBags.Count;
		double num2 = num + LandingNominalBagDuration.TotalSeconds * (double)runBags.Count;
		if (!(num2 > 0.0))
		{
			return 0.5;
		}
		return num / num2;
	}

	private void RecordTelemetry(PressureTelemetry telemetry)
	{
		try
		{
			if (csvWriter == null)
			{
				csvWriter = new CalibrationCsvWriter(Path.Combine(runDirectory, "trace.csv"), telemetry.Sensors.Count, logger);
			}
			csvWriter.WriteSamples(telemetry);
		}
		catch (Exception exception)
		{
			logger.LogWarning(exception, "[calibration][{Side}] Failed to write telemetry to the trace CSV", side.ToLowerString());
		}
	}

	private static Dictionary<int, double>? BuildGaugeDictionary(PressureTelemetry? telemetry)
	{
		if ((object)telemetry == null)
		{
			return null;
		}
		Dictionary<int, double> dictionary = new Dictionary<int, double>();
		List<double> pressureKpa = telemetry.Ambient.PressureKpa;
		double num = pressureKpa[pressureKpa.Count - 1];
		for (int i = 0; i < telemetry.Sensors.Count; i++)
		{
			int key = i;
			List<double> pressureKpa2 = telemetry.Sensors[i].PressureKpa;
			dictionary[key] = pressureKpa2[pressureKpa2.Count - 1] - num;
		}
		return dictionary;
	}

	private async Task SendAction(CalibrationAction action, int bagCount, CancellationToken cancellation)
	{
		TimeSpan timeout = balloonOptions.CommandTimeout;
		if (!(action is CalibrationAction.DisableControlLoop))
		{
			if (!(action is CalibrationAction.SetPumpPower setPumpPower))
			{
				if (!(action is CalibrationAction.SetPumpEnabled setPumpEnabled))
				{
					if (!(action is CalibrationAction.PinSolenoidOpeningProfile pinSolenoidOpeningProfile))
					{
						if (!(action is CalibrationAction.SetSolenoid setSolenoid))
						{
							if (action is CalibrationAction.CloseAllSolenoids a)
							{
								for (int bagId = 0; bagId < a.TotalBagCount; bagId++)
								{
									await connection.SendCustomCommand(81, CalibrationProtocolEncoder.EncodeSolenoidState((byte)bagId, SolenoidDirection.Inflate, SolenoidValveState.Closed), timeout, cancellation);
									await connection.SendCustomCommand(81, CalibrationProtocolEncoder.EncodeSolenoidState((byte)bagId, SolenoidDirection.Deflate, SolenoidValveState.Closed), timeout, cancellation);
								}
							}
						}
						else
						{
							await connection.SendCustomCommand(81, CalibrationProtocolEncoder.EncodeSolenoidState((byte)setSolenoid.BagId, setSolenoid.Direction, setSolenoid.State), timeout, cancellation);
						}
					}
					else
					{
						await connection.SendCustomCommand(81, CalibrationProtocolEncoder.EncodeSolenoidOpeningConfig(pinSolenoidOpeningProfile.Config), timeout, cancellation);
					}
				}
				else
				{
					await connection.SendCustomCommand(80, CalibrationProtocolEncoder.EncodePumpEnable(setPumpEnabled.PumpId, setPumpEnabled.Enabled), timeout, cancellation);
				}
			}
			else
			{
				await connection.SendCustomCommand(80, CalibrationProtocolEncoder.EncodePumpSpeed(setPumpPower.PumpId, setPumpPower.SpeedPercent), timeout, cancellation);
			}
		}
		else
		{
			await connection.SendCustomCommand(82, CalibrationProtocolEncoder.EncodeDisableControlLoop(bagCount), timeout, cancellation);
		}
	}

	private async Task SafeShutdownBestEffort(CancellationToken cancellation)
	{
		_ = 3;
		try
		{
			await connection.SendCustomCommand(80, CalibrationProtocolEncoder.EncodePumpEnable(0, enabled: false), balloonOptions.CommandTimeout, cancellation);
			await connection.SendCustomCommand(80, CalibrationProtocolEncoder.EncodePumpEnable(1, enabled: false), balloonOptions.CommandTimeout, cancellation);
			foreach (int bagId in runBags)
			{
				await connection.SendCustomCommand(81, CalibrationProtocolEncoder.EncodeSolenoidState((byte)bagId, SolenoidDirection.Inflate, SolenoidValveState.Closed), balloonOptions.CommandTimeout, cancellation);
				await connection.SendCustomCommand(81, CalibrationProtocolEncoder.EncodeSolenoidState((byte)bagId, SolenoidDirection.Deflate, SolenoidValveState.Closed), balloonOptions.CommandTimeout, cancellation);
			}
		}
		catch (Exception exception)
		{
			logger.LogError(exception, "[calibration][{Side}] Best-effort safety shutdown also failed", side.ToLowerString());
		}
	}

	private void AddLostLowSegmentWarnings(IReadOnlyList<BagCalibrationCoefficients>? written)
	{
		if ((object)landingEntry == null)
		{
			return;
		}
		HashSet<int> writtenBags = written?.Select((BagCalibrationCoefficients c) => c.BagId).ToHashSet() ?? new HashSet<int>();
		foreach (int item in landingEntry.SeparateLowSegment.Where((int b) => landingCompensated.Contains(b) && !writtenBags.Contains(b)).Order())
		{
			logger.LogWarning("[calibration][{Side}] Bag {Bag}: separate low segment runs as al = a, cl = ci until reboot", side.ToLowerString(), item);
			writeWarnings.Add($"bag {item}: its separate low segment (al, cl) runs as al = a, cl = ci until the board reboots; 0x53/0x09 cannot restore it");
		}
	}

	private async Task FinalizeAsync(CalibrationRunState state, IReadOnlyList<string> warnings, string? error, CancellationToken cancellation)
	{
		finalizing = true;
		csvWriter?.Dispose();
		long dropped = csvWriter?.DroppedSampleCount ?? 0;
		csvWriter = null;
		IReadOnlyList<BagCalibrationCoefficients> written = null;
		if (state == CalibrationRunState.Completed && runDirectory != null)
		{
			try
			{
				written = await AnalyzeAndWriteAsync(cancellation);
			}
			catch (Exception ex)
			{
				logger.LogError(ex, "[calibration][{Side}] Analysis/write-back failed", side.ToLowerString());
				error = ((error == null) ? ex.Message : (error + "; analysis/write-back also failed: " + ex.Message));
				state = CalibrationRunState.Failed;
			}
			if (state == CalibrationRunState.Completed && UsesLanding && written == null)
			{
				state = CalibrationRunState.Failed;
				error = "no bag passed; nothing written, the board keeps its calibration";
			}
		}
		AddLostLowSegmentWarnings(written);
		IReadOnlyList<string> readOnlyList = warnings;
		List<string> list = writeWarnings;
		int num = 0;
		string[] array = new string[readOnlyList.Count + list.Count];
		foreach (string item in readOnlyList)
		{
			array[num] = item;
			num++;
		}
		Span<string> span = CollectionsMarshal.AsSpan(list);
		span.CopyTo(new Span<string>(array).Slice(num, span.Length));
		_ = num + span.Length;
		warnings = new _003C_003Ez__ReadOnlyArray<string>(array);
		if (runDirectory != null && runId != null)
		{
			runStore.SaveRecord(runDirectory, new CalibrationRunRecord(runId, side, runStartedAt, DateTimeOffset.UtcNow, state, runBags, "trace.csv", dropped, warnings, error, written, lastGhostResult, landingFits, runMethod, previousCalibrationHex));
			runStore.PruneOldRuns(side);
		}
		MarkTerminal(state, error);
		stateMachine = null;
		landing = null;
		landingEntry = null;
		runDirectory = null;
		runId = null;
		logger.LogInformation("[calibration][{Side}] Run finished: {State}{Error}", side.ToLowerString(), state, (error == null) ? "" : (" (" + error + ")"));
	}

	private void MarkTerminal(CalibrationRunState state, string? error)
	{
		CalibrationRunStatus calibrationRunStatus = lastStatus;
		if ((object)calibrationRunStatus != null && calibrationRunStatus.Outcome == CalibrationRunOutcome.Running)
		{
			CalibrationRunStatus calibrationRunStatus2 = lastStatus with { };
			calibrationRunStatus = calibrationRunStatus2;
			calibrationRunStatus.Outcome = state switch
			{
				CalibrationRunState.Completed => CalibrationRunOutcome.Completed, 
				CalibrationRunState.Cancelled => CalibrationRunOutcome.Cancelled, 
				_ => CalibrationRunOutcome.Failed, 
			};
			calibrationRunStatus2.ProgressPercent = 100;
			calibrationRunStatus2.EstimatedTimeRemaining = TimeSpan.Zero;
			calibrationRunStatus2.Error = error;
			lastStatus = calibrationRunStatus2;
		}
	}

	private async Task<IReadOnlyList<BagCalibrationCoefficients>?> AnalyzeAndWriteAsync(CancellationToken cancellation)
	{
		if (LandingOnly)
		{
			return await WriteCoefficientsAsync(LandingCoefficients(StoredB()), cancellation);
		}
		string csvPath = Path.Combine(runDirectory, "trace.csv");
		bool csharpAuthoritative = options.AnalyzerAuthority == CalibrationAnalyzerAuthority.CSharp;
		CalibrationAnalysisAttempt calibrationAnalysisAttempt = ((!csharpAuthoritative) ? (await RunNodeAttemptAsync(csvPath, cancellation)) : (await RunCSharpAttemptAsync(csvPath, cancellation)));
		CalibrationAnalysisAttempt authoritative = calibrationAnalysisAttempt;
		string authorityLabel = (csharpAuthoritative ? "csharp" : "node");
		calibrationAnalysisAttempt = ((!csharpAuthoritative) ? (await RunCSharpAttemptAsync(csvPath, cancellation)) : (await RunNodeAttemptAsync(csvPath, cancellation)));
		CalibrationAnalysisAttempt calibrationAnalysisAttempt2 = calibrationAnalysisAttempt;
		try
		{
			lastGhostResult = CalibrationGhostComparer.Compare(authorityLabel, authoritative.Result, calibrationAnalysisAttempt2);
		}
		catch (Exception ex)
		{
			logger.LogError(ex, "[calibration][{Side}] Ghost comparison failed", side.ToLowerString());
			lastGhostResult = new CalibrationGhostResult(calibrationAnalysisAttempt2.Ran, Matched: false, Array.Empty<CalibrationGhostBagDelta>(), "ghost comparison threw: " + ex.Message, calibrationAnalysisAttempt2.DurationMs, authorityLabel);
		}
		logger.LogInformation("[calibration][{Side}] {Summary}", side.ToLowerString(), CalibrationGhostComparer.Summarize(lastGhostResult));
		if (!authoritative.Ran || (object)authoritative.Result == null)
		{
			logger.LogWarning("[calibration][{Side}] Analyzer produced no usable fit: {Error}", side.ToLowerString(), authoritative.Error);
			return null;
		}
		List<BagCalibrationCoefficients> passing = (UsesLanding ? LandingCoefficients(authoritative.Result) : PulseCoefficients(authoritative.Result));
		return await WriteCoefficientsAsync(passing, cancellation);
	}

	private async Task<IReadOnlyList<BagCalibrationCoefficients>?> WriteCoefficientsAsync(List<BagCalibrationCoefficients> passing, CancellationToken cancellation)
	{
		if (passing.Count == 0)
		{
			logger.LogWarning("[calibration][{Side}] No bag passed calibration validation; nothing written", side.ToLowerString());
			return null;
		}
		string text = CalibrationCoefficientValidator.Validate(passing, options);
		if (text != null)
		{
			throw new InvalidOperationException("Coefficients failed device-bound validation, nothing written: " + text);
		}
		foreach (BagCalibrationCoefficients item in passing)
		{
			await connection.SendCustomCommand(96, CalibrationProtocolEncoder.EncodeSetBagCalibration((byte)item.BagId, item.A, item.B, item.Ci, item.Al, item.Cl), balloonOptions.CommandTimeout, cancellation);
		}
		await connection.SendCustomCommand(96, CalibrationProtocolEncoder.EncodeSaveCalibrationToFlash((uint)DateTimeOffset.UtcNow.ToUnixTimeSeconds()), balloonOptions.CommandTimeout, cancellation);
		logger.LogInformation("[calibration][{Side}] Wrote calibration for {Count} bag(s): [{Bags}]", side.ToLowerString(), passing.Count, string.Join(',', passing.Select((BagCalibrationCoefficients b) => b.BagId)));
		return passing;
	}

	private CalibrationAnalyzerResult StoredB()
	{
		LandingEntryState entry = landingEntry;
		List<CalibrationAnalyzerBagResult> list = runBags.Select((int bag) => new CalibrationAnalyzerBagResult(bag, entry.StoredB.ContainsKey(bag), null, entry.StoredB.TryGetValue(bag, out var value) ? new float?(value) : ((float?)null), null, null, null, null, null, 0, 0, null, null, null, entry.StoredB.ContainsKey(bag) ? null : "not calibrated, so no stored b to keep")).ToList();
		return new CalibrationAnalyzerResult(list.All((CalibrationAnalyzerBagResult b) => b.Success), "", list);
	}

	private static List<BagCalibrationCoefficients> PulseCoefficients(CalibrationAnalyzerResult result)
	{
		return (from b in result.Bags
			where b.Success && b.A.HasValue && b.B.HasValue
			select new BagCalibrationCoefficients(b.BagId, b.A.Value, b.B.Value, b.DeflateIntercept.GetValueOrDefault(), b.DeflateMultiplierLow ?? b.A.Value, b.DeflateInterceptLow.GetValueOrDefault())).ToList();
	}

	private List<BagCalibrationCoefficients> LandingCoefficients(CalibrationAnalyzerResult result)
	{
		(List<BagCalibrationCoefficients> Coefficients, List<(int BagId, string Reason)> Skipped) tuple = LandingCoefficientMerge.Merge(result, landingFits ?? Array.Empty<LandingFitResult>(), options);
		var (result2, _) = tuple;
		foreach (var (num, text) in tuple.Skipped)
		{
			logger.LogWarning("[calibration][{Side}] Bag {Bag} not written: {Reason}", side.ToLowerString(), num, text);
			writeWarnings.Add($"bag {num} not written: {text}");
		}
		return result2;
	}

	private async Task<CalibrationAnalysisAttempt> RunNodeAttemptAsync(string csvPath, CancellationToken cancellation)
	{
		Stopwatch stopwatch = Stopwatch.StartNew();
		try
		{
			CalibrationAnalyzerRunResult calibrationAnalyzerRunResult = await analyzer.RunAsync(csvPath, runBags, cancellation);
			stopwatch.Stop();
			bool flag = calibrationAnalyzerRunResult.Outcome != CalibrationAnalyzerOutcome.NoFit && (object)calibrationAnalyzerRunResult.Result != null;
			return new CalibrationAnalysisAttempt(flag, calibrationAnalyzerRunResult.Result, flag ? null : calibrationAnalyzerRunResult.Error, stopwatch.ElapsedMilliseconds);
		}
		catch (Exception ex)
		{
			stopwatch.Stop();
			logger.LogWarning(ex, "[calibration][{Side}] Node analyzer attempt threw", side.ToLowerString());
			return new CalibrationAnalysisAttempt(Ran: false, null, ex.Message, stopwatch.ElapsedMilliseconds);
		}
	}

	private async Task<CalibrationAnalysisAttempt> RunCSharpAttemptAsync(string csvPath, CancellationToken cancellation)
	{
		Stopwatch stopwatch = Stopwatch.StartNew();
		try
		{
			Task<CalibrationAnalyzerResult> work = Task.Run(() => CalibrationAnalyzer.AnalyzeCsv(csvPath, runBags), cancellation);
			Task task = await Task.WhenAny(work, Task.Delay(options.AnalyzerTimeout, cancellation));
			stopwatch.Stop();
			if (task != work)
			{
				logger.LogWarning("[calibration][{Side}] C# analyzer attempt timed out after {Timeout}", side.ToLowerString(), options.AnalyzerTimeout);
				return new CalibrationAnalysisAttempt(Ran: false, null, $"C# analyzer timed out after {options.AnalyzerTimeout}", stopwatch.ElapsedMilliseconds);
			}
			return new CalibrationAnalysisAttempt(Ran: true, await work, null, stopwatch.ElapsedMilliseconds);
		}
		catch (Exception ex)
		{
			stopwatch.Stop();
			logger.LogWarning(ex, "[calibration][{Side}] C# analyzer attempt threw", side.ToLowerString());
			return new CalibrationAnalysisAttempt(Ran: false, null, ex.Message, stopwatch.ElapsedMilliseconds);
		}
	}
}
