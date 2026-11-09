using System;
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
using Eight.Lsp.Subsystems.Models;
using Eight.Lsp.Subsystems.StateMachine;
using Microsoft.Extensions.Logging;

namespace Eight.Firmness.DeviceAPI;

public class FirmnessController(ILogger<FirmnessController> logger, IFirmnessProvider provider, IDynamicModeProvider dynamicModeProvider, IFirmnessGate gate) : RequestController
{
	private readonly ILogger<FirmnessController> logger = logger;

	private readonly IFirmnessProvider provider = provider;

	private readonly IDynamicModeProvider dynamicModeProvider = dynamicModeProvider;

	private readonly IFirmnessGate gate = gate;

	private (Response?, ISubsystemState?) GetDevice(Side side)
	{
		ISubsystemState currentState = provider.GetCurrentState(side);
		Response response = FirmnessDeviceStatus.Classify(side, currentState, Utils.CreateFailure($"Calibration is running on {side}; firmness cannot be read or changed until the run finishes", "BadRequest"));
		if ((object)response == null)
		{
			return (null, currentState);
		}
		return (response, null);
	}

	[FunctionHandler("firmness/get")]
	public Task<Response> GetFirmness([SerializedRequestArg] GetTelemetryArgs args)
	{
		var (response, subsystemState) = GetDevice(args.Side);
		if ((object)response != null)
		{
			return Task.FromResult(response);
		}
		if (!(subsystemState is FirmnessReadyState firmnessReadyState))
		{
			return Task.FromResult(FirmnessDeviceStatus.NotReady(args.Side));
		}
		FirmnessDeviceState deviceState = firmnessReadyState.DeviceState;
		PressureTelemetry pressureTelemetry = deviceState.PressureTelemetry;
		ControlStateTelemetry controlTelemetry = deviceState.ControlTelemetry;
		if ((object)pressureTelemetry == null || pressureTelemetry.Sensors.Count < 4)
		{
			return Task.FromResult(Utils.CreateFailure($"No pressure telemetry available for {args.Side} side", "AccessoryInitialization"));
		}
		if ((object)controlTelemetry == null)
		{
			return Task.FromResult(Utils.CreateFailure($"No control telemetry available for {args.Side} side", "AccessoryInitialization"));
		}
		if ((object)deviceState.HardwareInfo == null || (object)deviceState.FirmwareInfo == null)
		{
			return Task.FromResult(FirmnessDeviceStatus.StartingUp(args.Side));
		}
		FirmnessHardwareInfo hwInfo = new FirmnessHardwareInfo(deviceState.HardwareInfo.Label, deviceState.HardwareInfo.Revision, deviceState.HardwareInfo.SerialNumber, deviceState.HardwareInfo.PartNumber, deviceState.HardwareInfo.Sku);
		FirmnessFirmwareInfo fwInfo = new FirmnessFirmwareInfo($"0x{deviceState.FirmwareInfo.Crc:X8}");
		string mode = firmnessReadyState.ConfiguredMode.ToDisplayName();
		return Task.FromResult(Utils.CreateResponse(FirmnessTelemetryBuilder.Build(controlTelemetry, firmnessReadyState.StoredTargetFirmness, hwInfo, fwInfo, mode, dynamicModeProvider.GetDynamicModeEnabled(args.Side))));
	}

	[FunctionHandler("firmness/set")]
	public Task<Response> SetFirmness([SerializedRequestArg] SetFirmnessArgs args)
	{
		var (response, subsystemState) = GetDevice(args.Side);
		if ((object)response != null)
		{
			return Task.FromResult(response);
		}
		if (!(subsystemState is FirmnessReadyState firmnessReadyState))
		{
			return Task.FromResult(FirmnessDeviceStatus.NotReady(args.Side));
		}
		int[] array = new int[4] { args.Bag0, args.Bag1, args.Bag2, args.Bag3 };
		if (args.Bag4.HasValue)
		{
			int[] array2 = array;
			int num = 0;
			int[] array3 = new int[1 + array2.Length];
			ReadOnlySpan<int> readOnlySpan = new ReadOnlySpan<int>(array2);
			readOnlySpan.CopyTo(new Span<int>(array3).Slice(num, readOnlySpan.Length));
			num += readOnlySpan.Length;
			array3[num] = args.Bag4.Value;
			array = array3;
		}
		if (!array.All((int level) => level >= 0 && level <= 10))
		{
			int value = array.First((int level) => level < 0 || level > 10);
			return Task.FromResult(Utils.CreateFailure($"Firmness level must be between 0 and 10, got {value}", "BadRequest"));
		}
		if (firmnessReadyState.DeviceState.BagCount >= 5 && !args.Bag4.HasValue)
		{
			return Task.FromResult(Utils.CreateFailure($"Firmness device {args.Side} requires 5 bag values but only 4 were provided", "BadRequest"));
		}
		SetFirmnessRequest request = new SetFirmnessRequest(args.Bag0, args.Bag1, args.Bag2, args.Bag3, args.Bag4);
		firmnessReadyState.MakeRequest(request);
		if (args.Mode.HasValue)
		{
			SetModeRequest request2 = new SetModeRequest(args.Mode.Value);
			firmnessReadyState.MakeRequest(request2);
		}
		if (args.Mode.HasValue)
		{
			logger.LogInformation("Set firmness for {Side}: levels [{Levels}] and mode to {Mode}", args.Side, string.Join(", ", array), args.Mode.Value.ToDisplayName());
		}
		else
		{
			logger.LogInformation("Set firmness for {Side}: levels [{Levels}]", args.Side, string.Join(", ", array));
		}
		return Task.FromResult(Utils.CreateResponse(new
		{
			success = true
		}));
	}

	[FunctionHandler("firmness/setmode")]
	public Task<Response> SetMode([SerializedRequestArg] SetModeArgs args)
	{
		var (response, subsystemState) = GetDevice(args.Side);
		if ((object)response != null)
		{
			return Task.FromResult(response);
		}
		if (!(subsystemState is FirmnessReadyState firmnessReadyState))
		{
			return Task.FromResult(FirmnessDeviceStatus.NotReady(args.Side));
		}
		SetModeRequest request = new SetModeRequest(args.Mode);
		firmnessReadyState.MakeRequest(request);
		logger.LogInformation("Set mode for {Side}: {Mode}", args.Side, args.Mode.ToDisplayName());
		return Task.FromResult(Utils.CreateResponse(new
		{
			success = true
		}));
	}

	[FunctionHandler("firmness/pair")]
	public Task<Response> EnableFirmness()
	{
		if (!gate.IsAllowed)
		{
			logger.LogWarning("Rejected firmness/pair: firmness is not available on this device specialization");
			return Task.FromResult(Utils.CreateFailure("Firmness is not available on this device specialization", "UnknownAccessory"));
		}
		provider.Enable();
		return Task.FromResult(Utils.CreateResponse(new
		{
			success = true,
			enabled = true
		}));
	}

	[FunctionHandler("firmness/remove")]
	public Task<Response> DisableFirmness()
	{
		if (provider.GetCurrentState(Side.Left) is CalibratingState || provider.GetCurrentState(Side.Right) is CalibratingState)
		{
			return Task.FromResult(Utils.CreateFailure("Calibration is running; the firmness device cannot be removed until the run finishes or is cancelled", "BadRequest"));
		}
		provider.Disable();
		return Task.FromResult(Utils.CreateResponse(new
		{
			success = true,
			enabled = false
		}));
	}

	[FunctionHandler("firmness/setdynamicmode")]
	public Task<Response> SetDynamicMode([SerializedRequestArg] SetDynamicModeArgs args)
	{
		dynamicModeProvider.UpdateDynamicMode(args.Side, args.Enabled);
		logger.LogInformation("Dynamic mode {Status} for {Side}", args.Enabled ? "enabled" : "disabled", args.Side);
		return Task.FromResult(Utils.CreateResponse(new
		{
			success = true,
			side = args.Side,
			dynamicModeEnabled = args.Enabled
		}));
	}
}
