using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Eight.Capybara.AdjustableBase;
using Eight.Capybara.AdjustableBase.Bases;
using Eight.Capybara.DeviceApi;
using Eight.Capybara.Observability;
using Eight.DeviceApiClient;
using Eight.DeviceProtocol;
using Microsoft.Extensions.Logging;

namespace Eight.Capybara.DeviceAPI.Handlers;

public class AdjustableBaseController : RequestController
{
	private record GetRssiResult(string MacAddress, short Rssi);

	private readonly ILogger<AdjustableBaseController> logger;

	private readonly IAdjustableBaseProvider adjustableBaseProvider;

	private readonly IStatsd statsd;

	public AdjustableBaseController(ILogger<AdjustableBaseController> logger, IAdjustableBaseProvider adjustableBaseProvider, IStatsd statsd)
	{
		this.logger = logger;
		this.adjustableBaseProvider = adjustableBaseProvider;
		this.statsd = statsd;
	}

	[FunctionHandler("bedframe/setangle")]
	public Task<Response> SetAngle([SerializedRequestArg] SetAngleRequest args)
	{
		return Task.FromResult(SetAngleInternal(args));
	}

	private Response SetAngleInternal([SerializedRequestArg] SetAngleRequest args)
	{
		var (response, frame) = GetAdjustableBase();
		if ((object)response != null)
		{
			return response;
		}
		if (args.FeedRate > 100.0 || args.FeedRate < 0.0)
		{
			return Utils.CreateFailure("Request Feed Rate is invalid, must be between 30 and 100 inclusive", "BadRequest");
		}
		if (args.TorsoAngle < 0.0 || args.TorsoAngle > 60.0)
		{
			return Utils.CreateFailure("Request Torso angle is invalid, must be between 0 and 60 inclusive", "BadRequest");
		}
		if (args.LegAngle < 0.0 || args.LegAngle > 45.0)
		{
			return Utils.CreateFailure("Request Leg angle is invalid, must be between 0 and 45 inclusive", "BadRequest");
		}
		logger.LogInformation("Setting Frame Angle: {@Args}", args);
		if (!(frame is TransientErrorFrame transientErrorFrame))
		{
			if (!(frame is MovementSensorFrame))
			{
				if (!(frame is FailedFrame failedFrame))
				{
					if (!(frame is SynchronizedAdjustableBase frame2))
					{
						if (frame is ISplitBase)
						{
							throw new ClassifiedException("Frame is configured as split, synchronous commands not supported", "BadRequest");
						}
						return Utils.CreateFailure("Currently Not Connected to Adjustable Base", "OfflineAccessory");
					}
					if (args.SnoreMitigation == true)
					{
						double? torsoAngle = args.TorsoAngle;
						if (torsoAngle.HasValue)
						{
							double valueOrDefault = torsoAngle.GetValueOrDefault();
							switch (args.Side)
							{
							case Side.Left:
								frame2.SetMitigationAngle(valueOrDefault, null, args.FeedRate, args.IgnoreMovementSensor);
								break;
							case Side.Right:
								frame2.SetMitigationAngle(null, valueOrDefault, args.FeedRate, args.IgnoreMovementSensor);
								break;
							default:
								frame2.SetMitigationAngle(valueOrDefault, valueOrDefault, args.FeedRate, args.IgnoreMovementSensor);
								break;
							}
							goto IL_036a;
						}
					}
					frame2.SetTorsoAngle(args.TorsoAngle, args.FeedRate, args.IgnoreMovementSensor).SetLegAngle(args.LegAngle, args.FeedRate, args.IgnoreMovementSensor);
					goto IL_036a;
				}
				if (args.TorsoAngle == 0.0 && args.LegAngle == 0.0)
				{
					failedFrame.HomeAndRebootFrame(default);
					return Utils.CreateResponse("Wiating for frame to home and reboot");
				}
				return Utils.CreateFailure("Movemnet sensor triggered on frame, must return to flat to process further commands", "FailedFrame");
			}
			return Utils.CreateFailure("Movemnet sensor triggered on frame, must clear error to process further commands", "MovementSensorFrame");
		}
		if (args.TorsoAngle == 0.0 && args.LegAngle == 0.0)
		{
			transientErrorFrame.HomeAndRebootFrame(default);
			return Utils.CreateResponse("Wiating for frame to home and reboot");
		}
		return Utils.CreateFailure("Frame is currently in a bad state, must return to flat to process further commands", "TransientErrorFrame");
		IL_036a:
		return BuildRequestFrameResponse(frame);
	}

	private (Response?, IFrame2?) GetAdjustableBase()
	{
		IFrame2 frame = adjustableBaseProvider.TryGetCurrentAdjustableBase();
		if (!(frame is NotConnectedFrame))
		{
			if (!(frame is InitializingFrame) && !(frame is SetupFrame) && !(frame is RebootingFrame))
			{
				if (!(frame is NullFrame))
				{
					if (frame is DebugFrame)
					{
						return (Utils.CreateFailure("Frame is in debug mode, unable to take any actions", "DebugFrame"), null);
					}
					return (null, frame);
				}
				return (Utils.CreateFailure("No Associated Adjustable Base", "UnknownAccessory"), null);
			}
			statsd.Increment("adjustableBase.movement.initializing");
			return (Utils.CreateFailure("Initializing Adjustable Base", "AccessoryInitialization"), null);
		}
		statsd.Increment("adjustableBase.movement.notConnected");
		return (Utils.CreateFailure("Frame is not connected", "OfflineAccessory"), null);
	}

	private RequestFrame BuildRequestFrame(IFrame2 frame)
	{
		return RequestFrame.FromFrame(frame);
	}

	private Response BuildRequestFrameResponse(IFrame2 frame)
	{
		return Utils.CreateResponse(BuildRequestFrame(frame));
	}

	[FunctionHandler("bedframe/setsplitangle")]
	public Task<Response> SetSplitAngle([SerializedRequestArg] SetSplitAngleRequest args)
	{
		throw new NotImplementedException("Split Base is not implemented and needs help");
	}

	[FunctionHandler("bedframe/getframe")]
	public Task<Response> GetFrame()
	{
		var (response, frame) = GetAdjustableBase();
		if ((object)response != null)
		{
			return Task.FromResult(response);
		}
		if (frame is IExpiringFrame { Expired: not false })
		{
			return Utils.CreateFailureResult("Currently Not Connected to Adjustable Base", "OfflineAccessory");
		}
		if (!(frame is TransientErrorFrame))
		{
			if (!(frame is MovementSensorFrame))
			{
				if (frame is FailedFrame)
				{
					return Utils.CreateFailureResult("Frame Failed to initialize, unable to process requests", ((FailedFrame)frame).LeftFailure ? "FailedFrameLeft" : "FailedFrame");
				}
				return Task.FromResult(BuildRequestFrameResponse(frame));
			}
			return Utils.CreateFailureResult("Movement Sensor Triggered on Frame, please return to flat to process further commands", "MovementSensorFrame");
		}
		return Utils.CreateFailureResult("Frame is in a bad state, please return to flat to process further commands", "TransientErrorFrame");
	}

	[FunctionHandler("bedframe/getrssi")]
	public async Task<Response> GetRssi()
	{
		var (response, frame) = GetAdjustableBase();
		if ((object)response != null)
		{
			return response;
		}
		GetRssiResult getRssiResult;
		if (!(frame is AbstractAdjustableBase abstractAdjustableBase))
		{
			if (!(frame is IExpiringFrame { HardwareInfo: var hardwareInfo } expiringFrame))
			{
				if (!(frame is FailedFrame { HardwareInfo: var hardwareInfo2 } failedFrame))
				{
					if (!(frame is TransientErrorFrame { HardwareInfo: var hardwareInfo3 } transientErrorFrame))
					{
						if (frame is MovementSensorFrame { HardwareInfo: var hardwareInfo4 } movementSensorFrame)
						{
							string macAddress = hardwareInfo4?.MacAddress ?? "unknown";
							getRssiResult = new GetRssiResult(macAddress, await movementSensorFrame.GetRssi(default));
						}
						else
						{
							getRssiResult = null;
						}
					}
					else
					{
						string macAddress = hardwareInfo3?.MacAddress ?? "unknown";
						getRssiResult = new GetRssiResult(macAddress, await transientErrorFrame.GetRssi(default));
					}
				}
				else
				{
					string macAddress = hardwareInfo2?.MacAddress ?? "unknown";
					getRssiResult = new GetRssiResult(macAddress, await failedFrame.GetRssi(default));
				}
			}
			else
			{
				string macAddress = hardwareInfo?.MacAddress ?? "unknown";
				getRssiResult = new GetRssiResult(macAddress, await expiringFrame.GetRssi(default));
			}
		}
		else
		{
			string macAddress = abstractAdjustableBase.HardwareInfo.MacAddress;
			getRssiResult = new GetRssiResult(macAddress, await abstractAdjustableBase.GetRssi(default));
		}
		GetRssiResult getRssiResult2 = getRssiResult;
		if ((object)getRssiResult2 == null)
		{
			return Utils.CreateFailure("Unable to get RSSI in current state", "BadRequest");
		}
		return Utils.CreateResponse(getRssiResult2);
	}

	[FunctionHandler("bedframe/stop")]
	public Task<Response> Stop()
	{
		var (response, frame) = GetAdjustableBase();
		if ((object)response != null)
		{
			return Task.FromResult(response);
		}
		logger.LogInformation("Stopping Frame Movement");
		if (frame is SynchronizedAdjustableBase synchronizedAdjustableBase)
		{
			synchronizedAdjustableBase.StopAll();
			return Task.FromResult(BuildRequestFrameResponse(frame));
		}
		throw new ClassifiedException("Frame is configured as split, synchronous commands not supported", "BadRequest");
	}

	[FunctionHandler("bedframe/remove")]
	public async Task<bool> Remove()
	{
		return await adjustableBaseProvider.TryRemoveCurrentAdjustableBase();
	}

	[FunctionHandler("bedframe/setadjustablebase")]
	public Task<Response> SetAdjustableBase([SerializedRequestArg] string address)
	{
		if (!Regex.Match(address, "^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$").Success)
		{
			return Utils.CreateFailureResult("Invalid Regex", "BadRequest");
		}
		adjustableBaseProvider.SetCurrentAdjustableBase(new Address(address));
		return Utils.EmptyResponseResult();
	}

	[FunctionHandler("bedframe/getavailablebases")]
	public async Task<IReadOnlyList<RequestScanResult>> GetAvilableBases()
	{
		return (await adjustableBaseProvider.ScanAvailableAddresses(default)).Select(RequestScanResult.FromScanResult).ToList();
	}

	[FunctionHandler("bedframe/clearmovementsensor")]
	public async Task<Response> ClearMovementSensor()
	{
		var (response, frame) = GetAdjustableBase();
		if ((object)response != null)
		{
			return response;
		}
		if (!(frame is MovementSensorFrame))
		{
			return Utils.EmptyResponse();
		}
		await ((MovementSensorFrame)frame).ResetFrame(default);
		return Utils.EmptyResponse();
	}

	[FunctionHandler("bedframe/pairfirstfoundbase")]
	public Task<Response> PairFirstFoundBase()
	{
		if (!(adjustableBaseProvider.TryGetCurrentAdjustableBase() is NullFrame))
		{
			return Utils.CreateFailureResult("We already have a paired base", "BadRequest");
		}
		logger.LogInformation("Triggering pair first base found");
		statsd.Increment("adjustableBase.pairfirstfoundbase.started");
		adjustableBaseProvider.TryStartPairFirstFound();
		return Task.FromResult(Utils.CreateResponse("Triggered pair first base found"));
	}

	[FunctionHandler("bedframe/hardwareinfo")]
	public async Task<Response> GetHardwareInfo()
	{
		var (response, frame) = GetAdjustableBase();
		if ((object)response != null)
		{
			return response;
		}
		if (frame != null && (object)frame.HardwareInfo != null)
		{
			return Utils.CreateResponse(RequestFrameHardwareInfo.FromFrameHardwareInfo(frame.HardwareInfo));
		}
		return Utils.CreateFailure("Currently unable to get hardware info", "BadRequest");
	}
}
