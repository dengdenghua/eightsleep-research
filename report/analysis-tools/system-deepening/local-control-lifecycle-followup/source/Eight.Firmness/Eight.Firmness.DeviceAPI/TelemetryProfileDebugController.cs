using System;
using System.Threading;
using System.Threading.Tasks;
using Eight.Capybara.DeviceApi;
using Eight.DeviceApiClient;
using Eight.DeviceProtocol;
using Eight.Firmness.Models;
using Eight.Firmness.StateMachine;
using Eight.Firmness.StateMachine.States;
using Eight.Lsp.Protocol;
using Eight.Lsp.Protocol.Exceptions;
using Eight.Lsp.Subsystems.Models;
using Eight.Lsp.Subsystems.StateMachine;
using Microsoft.Extensions.Logging;

namespace Eight.Firmness.DeviceAPI;

public class TelemetryProfileDebugController(ILogger<TelemetryProfileDebugController> logger, IFirmnessProvider provider) : RequestController
{
	private readonly ILogger<TelemetryProfileDebugController> logger = logger;

	private readonly IFirmnessProvider provider = provider;

	private static Response NotOperational(Side side, ISubsystemState? state)
	{
		return FirmnessDeviceStatus.Classify(side, state) ?? FirmnessDeviceStatus.NotReady(side);
	}

	[FunctionHandler("debugfirmness/gettelemetryprofile")]
	public Task<Response> Get([SerializedRequestArg] TelemetryProfileSideArgs args)
	{
		ISubsystemState currentState = provider.GetCurrentState(args.Side);
		if (!(currentState is FirmnessReadyState { StoredTelemetryProfile: var storedTelemetryProfile }))
		{
			return Task.FromResult(NotOperational(args.Side, currentState));
		}
		return Task.FromResult(Utils.CreateResponse(new TelemetryProfileStateResponse(storedTelemetryProfile.HasValue, storedTelemetryProfile)));
	}

	[FunctionHandler("debugfirmness/settelemetryprofile")]
	public async Task<Response> Set([SerializedRequestArg] TelemetryProfileSetArgs args)
	{
		ISubsystemState currentState = provider.GetCurrentState(args.Side);
		if (!(currentState is FirmnessReadyState firmnessReadyState))
		{
			return NotOperational(args.Side, currentState);
		}
		if (!Enum.IsDefined(args.Profile))
		{
			return Utils.CreateFailure($"{(int)args.Profile} is not a balloon telemetry profile; expected one of " + string.Join(", ", Enum.GetNames<BalloonTelemetryProfile>()), "BadRequest");
		}
		if (args.Profile.SilencesControlTelemetry())
		{
			return Utils.CreateFailure($"{args.Profile} would stop the {args.Side} balloon board emitting 0x5A, which is the only source " + "of the control telemetry firmness/get reports; use " + $"{BalloonTelemetryProfile.Both} to add the enhanced documents alongside it", "BadRequest");
		}
		try
		{
			await firmnessReadyState.ApplyAndPersistTelemetryProfileAsync(args.Profile, CancellationToken.None);
		}
		catch (DeviceCommunicationException ex)
		{
			logger.LogWarning(ex, "[telemetryprofile] {Side} refused the telemetry profile", args.Side);
			return (ex.ResponseCode == ResponseCode.Unsupported) ? Utils.CreateFailure($"{args.Side} balloon firmware predates the telemetry profile subcommand", "AccessoryInitialization") : Utils.CreateFailure($"{args.Side} balloon board rejected the {args.Profile} telemetry profile: {ex.Message}", "BadRequest");
		}
		logger.LogInformation("[telemetryprofile] {Side} set to {Profile}", args.Side, args.Profile);
		return Utils.CreateResponse(new TelemetryProfileStateResponse(Configured: true, args.Profile));
	}
}
