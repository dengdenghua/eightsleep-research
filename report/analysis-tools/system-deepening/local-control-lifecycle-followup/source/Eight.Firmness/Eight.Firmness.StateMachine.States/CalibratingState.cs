using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using Eight.Firmness.Models;
using Eight.Firmness.Models.Telemetry;
using Eight.Firmness.Models.Telemetry.Enhanced;
using Eight.Firmness.Protocol;
using Eight.Firmness.Services.Calibration;
using Eight.Lsp.Protocol;
using Eight.Lsp.Protocol.Models;
using Eight.Lsp.Subsystems.Models;
using Eight.Lsp.Subsystems.Services.Connection;
using Eight.Lsp.Subsystems.StateMachine;
using Eight.Lsp.Subsystems.StateMachine.States;
using Microsoft.Extensions.Logging;

namespace Eight.Firmness.StateMachine.States;

public class CalibratingState(ILogger<CalibratingState> logger, IFirmnessStateFactory stateFactory, IDeviceConnection connection, FirmwareInfo firmwareInfo, int bagCount, IReadOnlyList<int>? requestedBags, CalibrationDeflateMethod? requestedMethod, CalibrationOptions calibrationOptions, BalloonOptions balloonOptions, CalibrationAnalyzerRunner calibrationAnalyzer, ICalibrationRunStore calibrationRunStore) : ReadyStateBase(logger, stateFactory, connection, firmwareInfo)
{
	private readonly TimeSpan tickInterval = TimeSpan.FromMilliseconds(50L, 0L);

	private readonly IFirmnessStateFactory firmnessStateFactory = stateFactory;

	private readonly CalibrationRunner runner = new CalibrationRunner(connection.Side, connection, calibrationOptions, balloonOptions, calibrationAnalyzer, calibrationRunStore, logger);

	private PressureTelemetry? latestPressureTelemetry;

	private static readonly TimeSpan AbandonLimit = TimeSpan.FromSeconds(10L);

	protected override string DeviceType => "Balloon (Calibrating)";

	public CalibrationRunStatus? GetStatus()
	{
		return runner.GetStatus();
	}

	public CalibrationRunStatus? Cancel()
	{
		return runner.Cancel();
	}

	protected override Task Initialize(CancellationToken cancellation)
	{
		runner.Start(DateTimeOffset.UtcNow, bagCount, requestedBags, requestedMethod);
		return Task.CompletedTask;
	}

	protected override void OnPacketReceived(Packet packet, ProtocolContext context)
	{
		if (packet.Cmd == 94)
		{
			try
			{
				if (EnhancedTelemetryParser.Parse(packet.Payload) is EnhancedTelemetryDecodeResult.Decoded decoded)
				{
					runner.OnEnhancedTelemetry(decoded.Document);
				}
				return;
			}
			catch (Exception exception)
			{
				logger.LogWarning(exception, "[calibration][{Side}] Dropped an undecodable 0x5E packet", connection.Side.ToLowerString());
				return;
			}
		}
		if (packet.Cmd != 89)
		{
			return;
		}
		try
		{
			PressureTelemetry telemetry = (latestPressureTelemetry = TelemetryParser.ParsePressureTelemetry(packet.Payload));
			runner.OnPressureTelemetry(telemetry);
		}
		catch (Exception ex)
		{
			logger.LogWarning(ex, "[calibration][{Side}] Failed to parse pressure telemetry: {Error}", connection.Side.ToLowerString(), ex.Message);
		}
	}

	protected override async Task<ISubsystemState?> RunMonitorLoop(TaskCompletionSource<ISubsystemState> stateChangeTcs, CancellationToken cancellationToken)
	{
		using PeriodicTimer timer = new PeriodicTimer(tickInterval);
		ISubsystemState result;
		try
		{
			result = await TickUntilDone(timer, stateChangeTcs, cancellationToken);
		}
		finally
		{
			if (runner.IsCalibrating)
			{
				try
				{
					await runner.AbandonAsync(bagCount, cancellationToken.IsCancellationRequested ? "capybara stopping" : "board link lost", AbandonLimit);
				}
				catch (Exception exception)
				{
					logger.LogError(exception, "[calibration][{Side}] Abandoning the run failed", connection.Side.ToLowerString());
				}
			}
		}
		return result;
	}

	private async Task<ISubsystemState?> TickUntilDone(PeriodicTimer timer, TaskCompletionSource<ISubsystemState> stateChangeTcs, CancellationToken cancellationToken)
	{
		while (await timer.WaitForNextTickAsync(cancellationToken) && !cancellationToken.IsCancellationRequested && !stateChangeTcs.Task.IsCompleted)
		{
			await runner.Tick(DateTimeOffset.UtcNow, latestPressureTelemetry, bagCount, cancellationToken);
			if (!runner.IsCalibrating)
			{
				if (stateChangeTcs.Task.IsCompleted)
				{
					break;
				}
				logger.LogInformation("[calibration][{Side}] Run finished, returning to ready", connection.Side.ToLowerString());
				return firmnessStateFactory.CreateReadyState(connection, firmwareInfo);
			}
		}
		return null;
	}
}
