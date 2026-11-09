using System;
using System.Collections.Generic;
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

public class ToleranceDebugController(ILogger<ToleranceDebugController> logger, IFirmnessProvider provider) : RequestController
{
	private readonly ILogger<ToleranceDebugController> logger = logger;

	private readonly IFirmnessProvider provider = provider;

	private static Response NotOperational(Side side, ISubsystemState? state)
	{
		return FirmnessDeviceStatus.Classify(side, state) ?? FirmnessDeviceStatus.NotReady(side);
	}

	[FunctionHandler("debugfirmness/gettolerance")]
	public Task<Response> Get([SerializedRequestArg] ToleranceSideArgs args)
	{
		ISubsystemState currentState = provider.GetCurrentState(args.Side);
		if (!(currentState is FirmnessReadyState readyState))
		{
			return Task.FromResult(NotOperational(args.Side, currentState));
		}
		return Task.FromResult(Utils.CreateResponse(StoredState(readyState)));
	}

	private static ToleranceStateResponse StoredState(FirmnessReadyState readyState)
	{
		ToleranceBands storedToleranceBands = readyState.StoredToleranceBands;
		if ((object)storedToleranceBands == null)
		{
			return new ToleranceStateResponse(Tuned: false, null, null, Array.Empty<ToleranceBinSetting>());
		}
		return new ToleranceStateResponse(Tuned: true, storedToleranceBands.MinKpa, storedToleranceBands.MaxKpa, storedToleranceBands.Bins);
	}

	[FunctionHandler("debugfirmness/settolerance")]
	public async Task<Response> Set([SerializedRequestArg] ToleranceSetArgs args)
	{
		ISubsystemState currentState = provider.GetCurrentState(args.Side);
		if (!(currentState is FirmnessReadyState readyState))
		{
			return NotOperational(args.Side, currentState);
		}
		ToleranceBands toleranceBands = new ToleranceBands(args.MinKpa, args.MaxKpa, args.Bins ?? new List<ToleranceBinSetting>());
		string text = toleranceBands.Validate();
		if (text != null)
		{
			return Utils.CreateFailure(text, "BadRequest");
		}
		return await Apply(readyState, args.Side, toleranceBands);
	}

	private async Task<Response> Apply(FirmnessReadyState readyState, Side side, ToleranceBands bands)
	{
		try
		{
			await readyState.ApplyAndPersistToleranceBandsAsync(bands, CancellationToken.None);
		}
		catch (DeviceCommunicationException ex)
		{
			return Refused(side, ex, "tolerance bands");
		}
		logger.LogInformation("[tolerance] {Side} set to {BinCount} bin(s), range {Min} to {Max}", side, bands.Bins.Count, bands.MinKpa, bands.MaxKpa);
		return Utils.CreateResponse(StoredState(readyState));
	}

	private Response Refused(Side side, DeviceCommunicationException ex, string what)
	{
		logger.LogWarning(ex, "[tolerance] {Side} refused a {What} write", side, what);
		if (ex.ResponseCode != ResponseCode.Unsupported)
		{
			return Utils.CreateFailure($"{side} balloon board rejected the {what}: {ex.Message}", "BadRequest");
		}
		return Utils.CreateFailure($"{side} balloon firmware does not support tolerance band configuration", "AccessoryInitialization");
	}
}
