using System;
using System.Buffers.Binary;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Eight.Capybara.Config;
using Eight.Firmness.Models;
using Eight.Firmness.Models.Telemetry;
using Eight.Firmness.Protocol;
using Eight.Firmness.Services;
using Eight.Firmness.Services.Calibration;
using Eight.Lsp.Protocol;
using Eight.Lsp.Protocol.Models;
using Eight.Lsp.Subsystems.Models;
using Eight.Lsp.Subsystems.Services.Connection;
using Eight.Lsp.Subsystems.StateMachine;
using Eight.Lsp.Subsystems.StateMachine.States;
using Microsoft.Extensions.Logging;

namespace Eight.Firmness.StateMachine.States;

public class FirmnessReadyState(ILogger<FirmnessReadyState> logger, IFirmnessStateFactory stateFactory, IDeviceConnection connection, IPodConfigurationManager<FirmnessConfiguration> configManager, BalloonOptions options, FirmwareInfo firmwareInfo) : ReadyStateBase(logger, stateFactory, connection, firmwareInfo)
{
	private readonly ConcurrentQueue<FirmnessRequest> requests = new ConcurrentQueue<FirmnessRequest>();

	private readonly TimeSpan tickInterval = TimeSpan.FromMilliseconds(50L, 0L);

	private readonly IFirmnessStateFactory firmnessStateFactory = stateFactory;

	private readonly SemaphoreSlim deviceWriteLock = new SemaphoreSlim(1, 1);

	private bool handedOffToCalibration;

	protected override string DeviceType => "Balloon";

	public bool CalibrationHandoffPending { get; private set; }

	public FirmnessDeviceState DeviceState { get; private set; } = new FirmnessDeviceState();

	public FirmnessTarget? StoredTargetFirmness
	{
		get
		{
			if (connection.Side != Side.Left)
			{
				return configManager.Configuration?.RightTargetFirmness;
			}
			return configManager.Configuration?.LeftTargetFirmness;
		}
	}

	public DeviceMode ConfiguredMode => ((connection.Side != Side.Left) ? configManager.Configuration?.RightTargetMode : configManager.Configuration?.LeftTargetMode).GetValueOrDefault();

	public ToleranceBands? StoredToleranceBands
	{
		get
		{
			if (connection.Side != Side.Left)
			{
				return configManager.Configuration?.RightToleranceBands;
			}
			return configManager.Configuration?.LeftToleranceBands;
		}
	}

	public BalloonTelemetryProfile? StoredTelemetryProfile
	{
		get
		{
			if (connection.Side != Side.Left)
			{
				return configManager.Configuration?.RightTelemetryProfile;
			}
			return configManager.Configuration?.LeftTelemetryProfile;
		}
	}

	public void MakeRequest(FirmnessRequest request)
	{
		requests.Enqueue(request);
	}

	public void RequestCalibration(IReadOnlyList<int>? bags, CalibrationDeflateMethod? method = null)
	{
		CalibrationHandoffPending = true;
		MakeRequest(new StartCalibrationRequest(bags, method));
	}

	public Task<byte[]> GetDeviceCalibrationAsync(CancellationToken cancellation)
	{
		return RunDeviceWrite(() => connection.SendCustomCommandWithResponse(96, CalibrationProtocolEncoder.EncodeGetCalibration(), options.CommandTimeout, cancellation), cancellation);
	}

	public Task ApplyBagCalibrationAsync(IReadOnlyList<BagCalibrationSetting> bags, uint? saveAtUnixSeconds, CancellationToken cancellation)
	{
		return RunDeviceWrite(async () =>
		{
			foreach (BagCalibrationSetting item in bags.OrderBy((BagCalibrationSetting b) => b.BagId))
			{
				await connection.SendCustomCommand(96, CalibrationProtocolEncoder.EncodeSetBagCalibration((byte)item.BagId, (float)item.A, (float)item.B, (float)item.ResolvedCi, (float)item.ResolvedAl, (float)item.ResolvedCl), options.CommandTimeout, cancellation);
			}
			if (saveAtUnixSeconds.HasValue)
			{
				uint valueOrDefault = saveAtUnixSeconds.GetValueOrDefault();
				await connection.SendCustomCommand(96, CalibrationProtocolEncoder.EncodeSaveCalibrationToFlash(valueOrDefault), options.CommandTimeout, cancellation);
			}
			logger.LogInformation("Wrote calibration for {BagCount} bag(s) on {Side}, persisted={Persisted}", bags.Count, connection.Side.ToLowerString(), saveAtUnixSeconds.HasValue);
		}, cancellation);
	}

	protected override async Task Initialize(CancellationToken cancellation)
	{
		await FetchHardwareInfo(cancellation);
		await LoadAndApplyStoredTargetFirmness(cancellation);
		await ReapplyStoredToleranceBands(cancellation);
		await ReapplyStoredTelemetryProfile(cancellation);
	}

	protected override async Task<ISubsystemState?> RunMonitorLoop(TaskCompletionSource<ISubsystemState> stateChangeTcs, CancellationToken cancellationToken)
	{
		using PeriodicTimer timer = new PeriodicTimer(tickInterval);
		while (await timer.WaitForNextTickAsync(cancellationToken) && !cancellationToken.IsCancellationRequested && !stateChangeTcs.Task.IsCompleted)
		{
			ISubsystemState subsystemState = await RunTick(cancellationToken);
			if (subsystemState != null)
			{
				return subsystemState;
			}
		}
		return null;
	}

	protected override void OnPacketReceived(Packet packet, ProtocolContext context)
	{
		try
		{
			if (packet.Cmd == 89)
			{
				PressureTelemetry pressureTelemetry = TelemetryParser.ParsePressureTelemetry(packet.Payload);
				DeviceState = DeviceState with
				{
					PressureTelemetry = pressureTelemetry
				};
			}
			else if (packet.Cmd == 91)
			{
				CurrentTelemetry currentTelemetry = TelemetryParser.ParseCurrentTelemetry(packet.Payload);
				DeviceState = DeviceState with
				{
					CurrentTelemetry = currentTelemetry
				};
			}
			else if (packet.Cmd == 90)
			{
				ControlStateTelemetry controlTelemetry = TelemetryParser.ParseControlTelemetry(packet.Payload);
				DeviceState = DeviceState with
				{
					ControlTelemetry = controlTelemetry
				};
			}
			else if (packet.Cmd == 93)
			{
				HealthTelemetry healthTelemetry = TelemetryParser.ParseHealthTelemetry(packet.Payload);
				DeviceState = DeviceState with
				{
					HealthTelemetry = healthTelemetry
				};
			}
		}
		catch (Exception ex)
		{
			logger.LogWarning(ex, "Failed to process telemetry packet for {Side}: {Error}", connection.Side.ToLowerString(), ex.Message);
		}
	}

	private async Task LoadAndApplyStoredTargetFirmness(CancellationToken cancellation)
	{
		_ = 1;
		try
		{
			FirmnessConfiguration configuration = configManager.Configuration;
			if (configuration != null)
			{
				FirmnessTarget firmnessTarget = ((connection.Side == Side.Left) ? configuration.LeftTargetFirmness : configuration.RightTargetFirmness);
				DeviceMode mode = ((connection.Side == Side.Left) ? configuration.LeftTargetMode : configuration.RightTargetMode).GetValueOrDefault();
				if (firmnessTarget != null)
				{
					logger.LogInformation("Restoring target firmness for {Side}: {Target}", connection.Side.ToLowerString(), firmnessTarget);
					await SendFirmnessCommand(firmnessTarget, cancellation);
				}
				logger.LogInformation("Setting mode for {Side}: {Mode}", connection.Side.ToLowerString(), mode.ToDisplayName());
				await SendModeCommand(mode, cancellation);
			}
		}
		catch (Exception exception)
		{
			logger.LogWarning(exception, "Failed to load stored target firmness for {Side}", connection.Side.ToLowerString());
		}
	}

	private async Task FetchHardwareInfo(CancellationToken cancellation)
	{
		try
		{
			HardwareInfo hardwareInfo = await connection.GetHwInfo(cancellation);
			(string? Revision, int BagCount) tuple = HardwareRevisionHelper.ParseRevisionAndBagCount(hardwareInfo.Label, logger);
			string item = tuple.Revision;
			int item2 = tuple.BagCount;
			DeviceState = DeviceState with
			{
				HardwareInfo = hardwareInfo,
				BagCount = item2,
				FirmwareInfo = firmwareInfo
			};
			logger.LogInformation("Fetched hardware info for {Side}: {Label}, revision: {Revision}, bag count: {BagCount}", connection.Side.ToLowerString(), hardwareInfo.Label, item ?? "unknown", item2);
			logger.LogInformation("Firmware info for {Side}: CRC 0x{Crc:X8} (from bootloader)", connection.Side.ToLowerString(), firmwareInfo.Crc);
		}
		catch (Exception exception)
		{
			logger.LogWarning(exception, "Failed to fetch hardware info for {Side}", connection.Side.ToLowerString());
		}
	}

	private void SaveTargetFirmness(FirmnessTarget firmness)
	{
		try
		{
			FirmnessConfiguration configuration = configManager.Configuration;
			if ((object)configuration == null)
			{
				logger.LogWarning("Cannot save target firmness for {Side}: configuration is null", connection.Side.ToLowerString());
				return;
			}
			FirmnessConfiguration configuration2 = ((connection.Side == Side.Left) ? configuration with
			{
				LeftTargetFirmness = firmness
			} : configuration with
			{
				RightTargetFirmness = firmness
			});
			configManager.UpdateConfiguration(configuration2);
			logger.LogDebug("Saved target firmness for {Side}: {Target}", connection.Side.ToLowerString(), firmness);
		}
		catch (Exception exception)
		{
			logger.LogError(exception, "Failed to save target firmness for {Side}", connection.Side.ToLowerString());
		}
	}

	private void SaveTargetMode(DeviceMode mode)
	{
		try
		{
			FirmnessConfiguration configuration = configManager.Configuration;
			if ((object)configuration == null)
			{
				logger.LogWarning("Cannot save target mode for {Side}: configuration is null", connection.Side.ToLowerString());
				return;
			}
			FirmnessConfiguration configuration2 = ((connection.Side == Side.Left) ? configuration with
			{
				LeftTargetMode = mode
			} : configuration with
			{
				RightTargetMode = mode
			});
			configManager.UpdateConfiguration(configuration2);
			logger.LogDebug("Saved target mode for {Side}: {Mode}", connection.Side.ToLowerString(), mode.ToDisplayName());
		}
		catch (Exception exception)
		{
			logger.LogError(exception, "Failed to save target mode for {Side}", connection.Side.ToLowerString());
		}
	}

	private async Task<T> RunDeviceWrite<T>(Func<Task<T>> work, CancellationToken cancellation)
	{
		await deviceWriteLock.WaitAsync(cancellation);
		try
		{
			if (handedOffToCalibration)
			{
				throw new CalibrationRunningException(connection.Side);
			}
			return await work();
		}
		finally
		{
			deviceWriteLock.Release();
		}
	}

	private Task RunDeviceWrite(Func<Task> write, CancellationToken cancellation)
	{
		return RunDeviceWrite(async () =>
		{
			await write();
			return (object?)null;
		}, cancellation);
	}

	private void SaveToConfiguration(string what, Func<FirmnessConfiguration, FirmnessConfiguration> apply)
	{
		try
		{
			FirmnessConfiguration configuration = configManager.Configuration;
			if ((object)configuration == null)
			{
				logger.LogWarning("Cannot save {What} for {Side}: configuration is null", what, connection.Side.ToLowerString());
			}
			else
			{
				configManager.UpdateConfiguration(apply(configuration));
				logger.LogDebug("Saved {What} for {Side}", what, connection.Side.ToLowerString());
			}
		}
		catch (Exception exception)
		{
			logger.LogError(exception, "Failed to save {What} for {Side}", what, connection.Side.ToLowerString());
		}
	}

	public Task ApplyAndPersistToleranceBandsAsync(ToleranceBands bands, CancellationToken cancellation)
	{
		return RunDeviceWrite(async () =>
		{
			await SendToleranceBands(bands, cancellation);
			SaveToleranceBands(bands.MergedOnto(StoredToleranceBands));
		}, cancellation);
	}

	internal async Task ReapplyStoredToleranceBands(CancellationToken cancellation)
	{
		await RunDeviceWrite(async () =>
		{
			ToleranceBands bands = StoredToleranceBands;
			if ((object)bands == null)
			{
				return;
			}
			try
			{
				await SendToleranceBands(bands, cancellation);
				logger.LogInformation("Re-applied {BinCount} stored tolerance bin(s) for {Side}", bands.Bins.Count, connection.Side.ToLowerString());
			}
			catch (Exception exception)
			{
				logger.LogError(exception, "Failed to re-apply stored tolerance bands for {Side}; the board keeps its own defaults", connection.Side.ToLowerString());
			}
		}, cancellation);
	}

	private async Task SendToleranceBands(ToleranceBands bands, CancellationToken cancellation)
	{
		double? minKpa = bands.MinKpa;
		if (minKpa.HasValue)
		{
			double valueOrDefault = minKpa.GetValueOrDefault();
			minKpa = bands.MaxKpa;
			if (minKpa.HasValue)
			{
				double valueOrDefault2 = minKpa.GetValueOrDefault();
				await connection.SendCustomCommand(83, ControlLoopEncoder.EncodeToleranceRange((float)valueOrDefault, (float)valueOrDefault2), options.CommandTimeout, cancellation);
			}
		}
		foreach (ToleranceBinSetting item in bands.Bins.OrderBy((ToleranceBinSetting b) => b.BinIndex))
		{
			await connection.SendCustomCommand(83, ControlLoopEncoder.EncodeToleranceBin((byte)item.BinIndex, (float)item.ArrivalKpa, (float)item.DepartureKpa), options.CommandTimeout, cancellation);
		}
	}

	private void SaveToleranceBands(ToleranceBands bands)
	{
		SaveToConfiguration($"{bands.Bins.Count} tolerance bin(s)", (FirmnessConfiguration config) => (connection.Side != Side.Left) ? config with
		{
			RightToleranceBands = bands
		} : config with
		{
			LeftToleranceBands = bands
		});
	}

	public Task ApplyAndPersistTelemetryProfileAsync(BalloonTelemetryProfile profile, CancellationToken cancellation)
	{
		return RunDeviceWrite(async () =>
		{
			await SendTelemetryProfile(profile, cancellation);
			SaveTelemetryProfile(profile);
		}, cancellation);
	}

	internal async Task ReapplyStoredTelemetryProfile(CancellationToken cancellation)
	{
		await RunDeviceWrite(async () =>
		{
			BalloonTelemetryProfile? storedTelemetryProfile = StoredTelemetryProfile;
			if (storedTelemetryProfile.HasValue)
			{
				BalloonTelemetryProfile profile = storedTelemetryProfile.GetValueOrDefault();
				if (profile != BalloonTelemetryProfile.LegacyOnly)
				{
					if (!profile.SilencesControlTelemetry())
					{
						try
						{
							await SendTelemetryProfile(profile, cancellation);
							logger.LogInformation("Re-asserted the {Profile} balloon telemetry profile for {Side}", profile, connection.Side.ToLowerString());
							return;
						}
						catch (Exception exception)
						{
							logger.LogError(exception, "Failed to re-assert the balloon telemetry profile for {Side}; the board stays on its legacy-only default", connection.Side.ToLowerString());
							return;
						}
					}
					logger.LogWarning("Refusing to re-assert the stored {Profile} balloon telemetry profile for {Side}: it silences 0x5A and would leave firmness/get with no control telemetry. Clear the telemetry profile for this side in the pod configuration; the board stays on its legacy-only default", profile, connection.Side.ToLowerString());
				}
			}
		}, cancellation);
	}

	private Task SendTelemetryProfile(BalloonTelemetryProfile profile, CancellationToken cancellation)
	{
		return connection.SendCustomCommand(83, ControlLoopEncoder.EncodeTelemetryProfile(profile), options.CommandTimeout, cancellation);
	}

	private void SaveTelemetryProfile(BalloonTelemetryProfile profile)
	{
		SaveToConfiguration($"the {profile} telemetry profile", (FirmnessConfiguration config) => (connection.Side != Side.Left) ? config with
		{
			RightTelemetryProfile = profile
		} : config with
		{
			LeftTelemetryProfile = profile
		});
	}

	internal async Task<ISubsystemState?> RunTick(CancellationToken cancellation)
	{
		SetFirmnessRequest setFirmnessRequest = null;
		SetModeRequest lastModeRequest = null;
		StartCalibrationRequest calibrationRequest = null;
		FirmnessRequest result;
		while (requests.TryDequeue(out result))
		{
			if (!(result is SetFirmnessRequest setFirmnessRequest2))
			{
				if (!(result is SetModeRequest setModeRequest))
				{
					if (result is StartCalibrationRequest startCalibrationRequest)
					{
						calibrationRequest = startCalibrationRequest;
					}
				}
				else
				{
					lastModeRequest = setModeRequest;
				}
			}
			else
			{
				setFirmnessRequest = setFirmnessRequest2;
			}
		}
		if ((object)calibrationRequest != null)
		{
			logger.LogInformation("[{Side}] Handing off to calibration for bags [{Bags}]", connection.Side.ToLowerString(), (calibrationRequest.Bags == null) ? "default" : string.Join(", ", calibrationRequest.Bags));
			await deviceWriteLock.WaitAsync(cancellation);
			handedOffToCalibration = true;
			deviceWriteLock.Release();
			return firmnessStateFactory.CreateCalibratingState(connection, firmwareInfo, DeviceState.BagCount, calibrationRequest.Bags, calibrationRequest.Method);
		}
		if (setFirmnessRequest != null)
		{
			await OnRequest(setFirmnessRequest, cancellation);
		}
		if (lastModeRequest != null)
		{
			await OnRequest(lastModeRequest, cancellation);
		}
		return null;
	}

	private async Task OnRequest(FirmnessRequest request, CancellationToken cancellation)
	{
		logger.LogDebug("Processing request: {Request}", request);
		if (!(request is SetFirmnessRequest setFirmnessRequest))
		{
			if (request is SetModeRequest setModeRequest)
			{
				SaveTargetMode(setModeRequest.Mode);
				await SendModeCommand(setModeRequest.Mode, cancellation);
			}
		}
		else
		{
			FirmnessTarget firmness = new FirmnessTarget(setFirmnessRequest.Bag0, setFirmnessRequest.Bag1, setFirmnessRequest.Bag2, setFirmnessRequest.Bag3, setFirmnessRequest.Bag4);
			SaveTargetFirmness(firmness);
			await SendFirmnessCommand(firmness, cancellation);
		}
	}

	private async Task SendFirmnessCommand(FirmnessTarget firmness, CancellationToken cancellation)
	{
		try
		{
			int bagCount = DeviceState.BagCount;
			int[] array = firmness.ToArray();
			if (array.Length > bagCount)
			{
				logger.LogInformation("[{Side}] Truncating firmness from {InputCount} to {ExpectedCount} values (hardware has {BagCount} bags)", connection.Side.ToLowerString(), array.Length, bagCount, bagCount);
				array = array[..bagCount];
			}
			else if (array.Length < bagCount)
			{
				throw new ArgumentException($"Expected at least {bagCount} firmness values, got {array.Length}", "firmness");
			}
			float[] array2 = new float[array.Length];
			for (int i = 0; i < array.Length; i++)
			{
				array2[i] = (float)PressureMappings.GetPressureForLevel(array[i]);
			}
			logger.LogInformation("Sending firmness to {Side}: levels [{Levels}] -> pressures [{Pressures}] kPa", connection.Side.ToLowerString(), string.Join(", ", array), string.Join(", ", array2.Select((float p) => p.ToString("F2"))));
			byte[] array3 = new byte[bagCount * 4];
			for (int num = 0; num < bagCount; num++)
			{
				BinaryPrimitives.WriteSingleLittleEndian(array3.AsSpan(num * 4, 4), array2[num]);
			}
			await connection.SendCustomCommand(82, array3, options.CommandTimeout, cancellation);
			logger.LogDebug("Firmness command sent successfully to {Side}", connection.Side.ToLowerString());
		}
		catch (Exception ex)
		{
			logger.LogError(ex, "Failed to send firmness command to {Side}: {Error}", connection.Side.ToLowerString(), ex.Message);
		}
	}

	private async Task SendModeCommand(DeviceMode mode, CancellationToken cancellation)
	{
		try
		{
			logger.LogInformation("Setting mode to {Mode} for {Side}", mode.ToDisplayName(), connection.Side.ToLowerString());
			byte[] payload = new byte[1] { mode.ToByte() };
			await connection.SendCustomCommand(84, payload, options.CommandTimeout, cancellation);
			logger.LogDebug("Mode command sent successfully to {Side}", connection.Side.ToLowerString());
		}
		catch (Exception ex)
		{
			logger.LogError(ex, "Failed to send mode command to {Side}: {Error}", connection.Side.ToLowerString(), ex.Message);
		}
	}
}
