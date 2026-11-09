using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Eight.Capybara.DeviceApi;
using Eight.DeviceApiClient;
using Eight.DeviceProtocol;
using Eight.Firmness.Models;
using Eight.Firmness.Models.Telemetry;
using Eight.Firmness.Services;
using Eight.Firmness.StateMachine;
using Eight.Firmness.StateMachine.States;
using Eight.Lsp.Protocol.Models;
using Eight.Lsp.Subsystems.Models;
using Eight.Lsp.Subsystems.StateMachine;
using Microsoft.Extensions.Logging;

namespace Eight.Firmness.DeviceAPI;

public class FirmnessDebugController(ILogger<FirmnessDebugController> logger, IFirmnessProvider provider, IDynamicModeProvider dynamicModeProvider) : RequestController
{
	private readonly ILogger<FirmnessDebugController> logger = logger;

	private readonly IFirmnessProvider provider = provider;

	private readonly IDynamicModeProvider dynamicModeProvider = dynamicModeProvider;

	private (Response?, FirmnessReadyState?) GetReadyDevice(Side side)
	{
		ISubsystemState currentState = provider.GetCurrentState(side);
		Response response = FirmnessDeviceStatus.Classify(side, currentState, Utils.CreateFailure($"Calibration is running on {side}; debug telemetry is unavailable until the run finishes", "BadRequest"));
		if ((object)response != null)
		{
			return (response, null);
		}
		if (!(currentState is FirmnessReadyState item))
		{
			return (FirmnessDeviceStatus.NotReady(side), null);
		}
		return (null, item);
	}

	[FunctionHandler("debugfirmness/get")]
	public Task<Response> GetDebugTelemetry([SerializedRequestArg] DebugGetTelemetryArgs args)
	{
		var (response, firmnessReadyState) = GetReadyDevice(args.Side);
		if ((object)response != null)
		{
			return Task.FromResult(response);
		}
		FirmnessDeviceState deviceState = firmnessReadyState.DeviceState;
		PressureTelemetry pressureTelemetry = deviceState.PressureTelemetry;
		ControlStateTelemetry controlTelemetry = deviceState.ControlTelemetry;
		if ((object)pressureTelemetry == null)
		{
			return Task.FromResult(Utils.CreateFailure($"No pressure telemetry available for {args.Side} side", "AccessoryInitialization"));
		}
		if (pressureTelemetry.Sensors.Count < 4)
		{
			return Task.FromResult(Utils.CreateFailure("Insufficient pressure sensor data", "AccessoryInitialization"));
		}
		if ((object)controlTelemetry == null)
		{
			return Task.FromResult(Utils.CreateFailure($"No control telemetry available for {args.Side} side", "AccessoryInitialization"));
		}
		if (controlTelemetry.Bags.Count < 4)
		{
			return Task.FromResult(Utils.CreateFailure("Insufficient control telemetry bag data", "AccessoryInitialization"));
		}
		if ((object)deviceState.HardwareInfo == null || (object)deviceState.FirmwareInfo == null)
		{
			return Task.FromResult(FirmnessDeviceStatus.StartingUp(args.Side));
		}
		FirmnessHardwareInfo hardwareInfo = new FirmnessHardwareInfo(deviceState.HardwareInfo.Label, deviceState.HardwareInfo.Revision, deviceState.HardwareInfo.SerialNumber, deviceState.HardwareInfo.PartNumber, deviceState.HardwareInfo.Sku);
		DebugFirmwareInfo firmwareInfo = new DebugFirmwareInfo($"0x{deviceState.FirmwareInfo.Crc:X8}", deviceState.FirmwareInfo.Length, Convert.ToHexString(deviceState.FirmwareInfo.RawData));
		string mode = firmnessReadyState.ConfiguredMode.ToDisplayName();
		FirmnessTarget storedTargetFirmness = firmnessReadyState.StoredTargetFirmness;
		double num;
		if (pressureTelemetry.Ambient.PressureKpa.Count <= 0)
		{
			num = 0.0;
		}
		else
		{
			List<double> pressureKpa = pressureTelemetry.Ambient.PressureKpa;
			num = pressureKpa[pressureKpa.Count - 1];
		}
		double atmosphericPressure = num;
		DebugFirmnessBagState bag = BuildDebugBagState(controlTelemetry.Bags[0], storedTargetFirmness?.Bag0 ?? 0, GetGaugePressure(0));
		DebugFirmnessBagState bag2 = BuildDebugBagState(controlTelemetry.Bags[1], storedTargetFirmness?.Bag1 ?? 0, GetGaugePressure(1));
		DebugFirmnessBagState bag3 = BuildDebugBagState(controlTelemetry.Bags[2], storedTargetFirmness?.Bag2 ?? 0, GetGaugePressure(2));
		DebugFirmnessBagState bag4 = BuildDebugBagState(controlTelemetry.Bags[3], storedTargetFirmness?.Bag3 ?? 0, GetGaugePressure(3));
		DebugFirmnessBagState bag5 = null;
		if (controlTelemetry.Bags.Count > 4)
		{
			bag5 = BuildDebugBagState(controlTelemetry.Bags[4], (storedTargetFirmness?.Bag4).GetValueOrDefault(), GetGaugePressure(4));
		}
		DebugPressureTelemetry rawPressureTelemetry = TransformPressureTelemetry(pressureTelemetry, controlTelemetry);
		DebugCurrentTelemetry rawCurrentTelemetry = null;
		if ((object)deviceState.CurrentTelemetry != null)
		{
			rawCurrentTelemetry = TransformCurrentTelemetry(deviceState.CurrentTelemetry);
		}
		DebugControlTelemetry rawControlTelemetry = TransformControlTelemetry(controlTelemetry);
		DebugHealthTelemetry rawHealthTelemetry = null;
		if ((object)deviceState.HealthTelemetry != null)
		{
			rawHealthTelemetry = TransformHealthTelemetry(deviceState.HealthTelemetry);
		}
		return Task.FromResult(Utils.CreateResponse(new FirmnessDebugResponse(bag, bag2, bag3, bag4, bag5, hardwareInfo, mode, dynamicModeProvider.GetDynamicModeEnabled(args.Side), firmwareInfo, rawPressureTelemetry, rawCurrentTelemetry, rawControlTelemetry, rawHealthTelemetry)));
		double GetGaugePressure(int sensorIndex)
		{
			PressureSensorData pressureSensorData = pressureTelemetry.Sensors[sensorIndex];
			double num2;
			if (pressureSensorData.PressureKpa.Count <= 0)
			{
				num2 = 0.0;
			}
			else
			{
				List<double> pressureKpa2 = pressureSensorData.PressureKpa;
				num2 = pressureKpa2[pressureKpa2.Count - 1];
			}
			return num2 - atmosphericPressure;
		}
	}

	[FunctionHandler("debugfirmness/gethardwareinfo")]
	public Task<Response> GetHardwareInfo([SerializedRequestArg] DebugGetTelemetryArgs args)
	{
		var (response, firmnessReadyState) = GetReadyDevice(args.Side);
		if ((object)response != null)
		{
			return Task.FromResult(response);
		}
		HardwareInfo hardwareInfo = firmnessReadyState.DeviceState.HardwareInfo;
		if ((object)hardwareInfo == null)
		{
			return Task.FromResult(FirmnessDeviceStatus.StartingUp(args.Side));
		}
		return Task.FromResult(Utils.CreateResponse(new FirmnessHardwareInfo(hardwareInfo.Label, hardwareInfo.Revision, hardwareInfo.SerialNumber, hardwareInfo.PartNumber, hardwareInfo.Sku)));
	}

	private static DebugFirmnessBagState BuildDebugBagState(BagState bagState, int targetLevel, double gaugePressureKpa)
	{
		BagFsmState fsmState = bagState.FsmState;
		bool flag = fsmState - 2 <= BagFsmState.Steady;
		bool isAdjusting = flag;
		return new DebugFirmnessBagState(gaugePressureKpa, bagState.CurrentPressureKpa, bagState.SetpointKpa, targetLevel, isAdjusting);
	}

	private static DebugPressureTelemetry TransformPressureTelemetry(PressureTelemetry telemetry, ControlStateTelemetry controlTelemetry)
	{
		double num;
		if (telemetry.Ambient.PressureKpa.Count <= 0)
		{
			num = 0.0;
		}
		else
		{
			List<double> pressureKpa = telemetry.Ambient.PressureKpa;
			num = pressureKpa[pressureKpa.Count - 1];
		}
		double atmosphericPressure = num;
		DebugPressureSensorData bag = null;
		if (telemetry.Sensors.Count > 4 && controlTelemetry.Bags.Count > 4)
		{
			bag = ToDebug(telemetry.Sensors[4], controlTelemetry.Bags[4]);
		}
		return new DebugPressureTelemetry(telemetry.Type, telemetry.Version, telemetry.Timestamp, telemetry.Frequency, ToDebug(telemetry.Sensors[0], controlTelemetry.Bags[0]), ToDebug(telemetry.Sensors[1], controlTelemetry.Bags[1]), ToDebug(telemetry.Sensors[2], controlTelemetry.Bags[2]), ToDebug(telemetry.Sensors[3], controlTelemetry.Bags[3]), bag, ToDebugAmbient(telemetry.Ambient));
		DebugPressureSensorData ToDebug(PressureSensorData sensor, BagState bagState)
		{
			double num2;
			if (sensor.PressureKpa.Count <= 0)
			{
				num2 = 0.0;
			}
			else
			{
				List<double> pressureKpa2 = sensor.PressureKpa;
				num2 = pressureKpa2[pressureKpa2.Count - 1];
			}
			double currentPressure = num2 - atmosphericPressure;
			double setpointKpa = bagState.SetpointKpa;
			BagFsmState fsmState = bagState.FsmState;
			bool flag = fsmState - 2 <= BagFsmState.Steady;
			bool isAdjusting = flag;
			return new DebugPressureSensorData(currentPressure, setpointKpa, isAdjusting, sensor.PressureKpa.ToList(), sensor.Temps.ToList());
		}
		static DebugPressureSensorData ToDebugAmbient(PressureSensorData sensor)
		{
			return new DebugPressureSensorData(0.0, 0.0, IsAdjusting: false, sensor.PressureKpa.ToList(), sensor.Temps.ToList());
		}
	}

	private static DebugCurrentTelemetry TransformCurrentTelemetry(CurrentTelemetry telemetry)
	{
		return new DebugCurrentTelemetry(telemetry.Type, telemetry.Version, telemetry.Timestamp, telemetry.Frequency, telemetry.V12Ma.ToList(), telemetry.V5Ma.ToList(), telemetry.SolenoidMa.ToList(), telemetry.PumpMa.ToList());
	}

	private static DebugControlTelemetry TransformControlTelemetry(ControlStateTelemetry telemetry)
	{
		List<DebugBagState> bags = telemetry.Bags.Select((BagState b) => new DebugBagState(b.BagId, b.SetpointKpa, b.CurrentPressureKpa, b.FsmState.ToString(), b.SafetyReason, b.FaultReason)).ToList();
		return new DebugControlTelemetry(telemetry.Timestamp, telemetry.DeviceTimestampMs, telemetry.SchedulerState.ToString(), telemetry.SelectedBagsMask, telemetry.GetSelectedBagIds(), telemetry.NumBagsSteady, telemetry.IsSleeping, bags);
	}

	private static DebugHealthTelemetry TransformHealthTelemetry(HealthTelemetry telemetry)
	{
		List<DebugSolenoidTemp> solenoidTemps = telemetry.SolenoidTemps.Select((SolenoidTemp s) => new DebugSolenoidTemp(s.BagId, s.InflateTempC, s.DeflateTempC)).ToList();
		return new DebugHealthTelemetry(telemetry.Type, telemetry.Version, telemetry.Timestamp, telemetry.DeviceTimestampMs, solenoidTemps, telemetry.Pump0TempC, telemetry.Pump1TempC, telemetry.AmbientTempC, telemetry.AmbientHumidityPct, telemetry.Pump0Rpm, telemetry.Pump1Rpm);
	}
}
