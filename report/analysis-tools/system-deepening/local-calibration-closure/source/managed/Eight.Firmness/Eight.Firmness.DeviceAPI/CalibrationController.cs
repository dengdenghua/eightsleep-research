using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using Eight.Capybara.DeviceApi;
using Eight.DeviceApiClient;
using Eight.DeviceProtocol;
using Eight.Firmness.Models;
using Eight.Firmness.Services.Calibration;
using Eight.Firmness.StateMachine;
using Eight.Firmness.StateMachine.States;
using Eight.Lsp.Protocol;
using Eight.Lsp.Protocol.Exceptions;
using Eight.Lsp.Subsystems.Models;
using Eight.Lsp.Subsystems.StateMachine;
using Microsoft.Extensions.Logging;
using NodaTime;
using PeterO.Cbor;

namespace Eight.Firmness.DeviceAPI;

public class CalibrationController(ILogger<CalibrationController> logger, IFirmnessProvider provider, ICalibrationRunStore runStore, IClock clock) : RequestController
{
	private readonly ILogger<CalibrationController> logger = logger;

	private readonly IFirmnessProvider provider = provider;

	private readonly ICalibrationRunStore runStore = runStore;

	private readonly IClock clock = clock;

	private static Response NotOperational(Side side, ISubsystemState? state)
	{
		return FirmnessDeviceStatus.Classify(side, state) ?? FirmnessDeviceStatus.NotReady(side);
	}

	[FunctionHandler("calibration/start")]
	public Task<Response> Start([SerializedRequestArg] CalibrationStartArgs args)
	{
		string text = StartArgumentError(args);
		if (text != null)
		{
			return Task.FromResult(Utils.CreateFailure(text, "BadRequest"));
		}
		ISubsystemState currentState = provider.GetCurrentState(args.Side);
		if (!(currentState is FirmnessReadyState firmnessReadyState))
		{
			if (currentState is CalibratingState)
			{
				return Task.FromResult(Utils.CreateFailure($"Calibration is already running on {args.Side}", "BadRequest"));
			}
			return Task.FromResult(NotOperational(args.Side, currentState));
		}
		logger.LogInformation("[calibration] Start requested for {Side}, bags [{Bags}], method {Method}", args.Side, (args.Bags == null) ? "default" : string.Join(',', args.Bags), args.Method?.ToString() ?? "default");
		firmnessReadyState.RequestCalibration(args.Bags, args.Method);
		return Task.FromResult(Utils.CreateResponse(new
		{
			success = true,
			method = (args.Method?.ToString() ?? "default")
		}));
	}

	internal static string? StartArgumentError(CalibrationStartArgs args)
	{
		CalibrationDeflateMethod? method = args.Method;
		if (method.HasValue)
		{
			CalibrationDeflateMethod valueOrDefault = method.GetValueOrDefault();
			if (!Enum.IsDefined(valueOrDefault))
			{
				return $"method {(int)valueOrDefault} is not one of pulse, landing, landingOnly";
			}
		}
		int[] array = args.Bags ?? Array.Empty<int>();
		foreach (int num in array)
		{
			if ((num < 0 || num > 4) ? true : false)
			{
				return $"bagId {num} is outside 0..4";
			}
		}
		return null;
	}

	[FunctionHandler("calibration/status")]
	public Task<Response> Status([SerializedRequestArg] CalibrationSideArgs args)
	{
		ISubsystemState currentState = provider.GetCurrentState(args.Side);
		Response result;
		if (currentState is CalibratingState calibratingState)
		{
			result = Utils.CreateResponse(new CalibrationStatusResponse(calibratingState.GetStatus(), null));
		}
		else
		{
			result = ((!(currentState is FirmnessReadyState)) ? NotOperational(args.Side, currentState) : Utils.CreateResponse(new CalibrationStatusResponse(null, runStore.GetLatestRecord(args.Side))));
		}
		return Task.FromResult(result);
	}

	[FunctionHandler("calibration/cancel")]
	public Task<Response> Cancel([SerializedRequestArg] CalibrationSideArgs args)
	{
		ISubsystemState currentState = provider.GetCurrentState(args.Side);
		if (!(currentState is CalibratingState calibratingState))
		{
			if (currentState is FirmnessReadyState)
			{
				return Task.FromResult(Utils.CreateFailure($"Firmness device {args.Side} is not currently calibrating", "BadRequest"));
			}
			return Task.FromResult(NotOperational(args.Side, currentState));
		}
		logger.LogInformation("[calibration] Cancel requested for {Side}", args.Side);
		return Task.FromResult(Utils.CreateResponse(new CalibrationStatusResponse(calibratingState.Cancel(), null)));
	}

	[FunctionHandler("calibration/get")]
	public async Task<Response> Get([SerializedRequestArg] CalibrationSideArgs args)
	{
		ISubsystemState currentState = provider.GetCurrentState(args.Side);
		if (!(currentState is FirmnessReadyState firmnessReadyState))
		{
			if (currentState is CalibratingState)
			{
				return Utils.CreateFailure($"Calibration is running on {args.Side}; on-device coefficients cannot be read until the run finishes", "BadRequest");
			}
			return NotOperational(args.Side, currentState);
		}
		FirmnessReadyState firmnessReadyState2 = firmnessReadyState;
		byte[] raw;
		try
		{
			raw = await firmnessReadyState2.GetDeviceCalibrationAsync(CancellationToken.None);
		}
		catch (Exception ex)
		{
			logger.LogError(ex, "[calibration] Failed to read calibration from {Side}", args.Side);
			return Utils.CreateFailure("Failed to read calibration from device: " + ex.Message, "AccessoryInitialization");
		}
		return Utils.CreateResponse(DecodeCalibration(raw));
	}

	private static CalibrationDeviceState DecodeCalibration(byte[] raw)
	{
		string rawHex = Convert.ToHexString(raw);
		if (raw.Length == 0)
		{
			return new CalibrationDeviceState(null, null, null, null, rawHex);
		}
		try
		{
			CBORObject cBORObject = CBORObject.DecodeFromBytes(raw);
			int? version = (cBORObject.ContainsKey("v") ? new int?(cBORObject["v"].AsInt32Value()) : ((int?)null));
			int? bagCount = (cBORObject.ContainsKey("n") ? new int?(cBORObject["n"].AsInt32Value()) : ((int?)null));
			DateTimeOffset? savedAt = (cBORObject.ContainsKey("ts") ? new DateTimeOffset?(DateTimeOffset.FromUnixTimeSeconds(cBORObject["ts"].AsInt64Value())) : ((DateTimeOffset?)null));
			List<CalibrationBagCoefficients> list = null;
			if (cBORObject.ContainsKey("bags") && cBORObject["bags"].Type == CBORType.Array)
			{
				list = new List<CalibrationBagCoefficients>();
				foreach (CBORObject value in cBORObject["bags"].Values)
				{
					list.Add(new CalibrationBagCoefficients(list.Count, (float)value["a"].AsDouble(), (float)value["b"].AsDouble(), value.ContainsKey("ci") ? ((float)value["ci"].AsDouble()) : 0f, value.ContainsKey("al") ? ((float)value["al"].AsDouble()) : ((float)value["a"].AsDouble()), value.ContainsKey("cl") ? ((float)value["cl"].AsDouble()) : 0f, value.ContainsKey("c") && value["c"].AsBoolean()));
				}
			}
			return new CalibrationDeviceState(version, bagCount, savedAt, list, rawHex);
		}
		catch
		{
			return new CalibrationDeviceState(null, null, null, null, rawHex);
		}
	}

	[FunctionHandler("calibration/set")]
	public async Task<Response> Set([SerializedRequestArg] CalibrationSetArgs args)
	{
		ISubsystemState currentState = provider.GetCurrentState(args.Side);
		if (!(currentState is CalibratingState))
		{
			if (!(currentState is FirmnessReadyState firmnessReadyState))
			{
				return NotOperational(args.Side, currentState);
			}
			if (!firmnessReadyState.CalibrationHandoffPending)
			{
				FirmnessReadyState firmnessReadyState2 = firmnessReadyState;
				BagCalibrationWrite write = new BagCalibrationWrite(args.Bags, args.Persist);
				string text = write.Validate();
				if (text != null)
				{
					return Utils.CreateFailure(text, "BadRequest");
				}
				uint? saveAtUnixSeconds = (args.Persist ? new uint?((uint)clock.GetCurrentInstant().ToUnixTimeSeconds()) : ((uint?)null));
				try
				{
					await firmnessReadyState2.ApplyBagCalibrationAsync(write.Bags, saveAtUnixSeconds, CancellationToken.None);
				}
				catch (CalibrationRunningException)
				{
					return Utils.CreateFailure($"Calibration is running on {args.Side}; coefficients cannot be written until the run finishes", "BadRequest");
				}
				catch (DeviceCommunicationException ex2)
				{
					logger.LogWarning(ex2, "[calibration] {Side} refused a coefficient write", args.Side);
					return Utils.CreateFailure($"{args.Side} balloon board rejected the coefficients: {ex2.Message}. " + "Any bag written before the refusal is staged but not saved, and a power cycle clears it.", (ex2.ResponseCode == ResponseCode.Unsupported) ? "AccessoryInitialization" : "BadRequest");
				}
				logger.LogInformation("[calibration] {Side} wrote {BagCount} bag(s), persisted={Persisted}", args.Side, write.Bags.Count, args.Persist);
				return Utils.CreateResponse(new CalibrationSetResponse(write.Bags.Count, args.Persist, write.Bags));
			}
		}
		return Utils.CreateFailure($"Calibration is running on {args.Side}; coefficients cannot be written until the run finishes", "BadRequest");
	}
}
