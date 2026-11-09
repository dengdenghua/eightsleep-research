using System;
using System.Threading;
using System.Threading.Tasks;
using Eight.Capybara.AutoPairing;
using Eight.DeviceApiClient;
using Microsoft.Extensions.Logging;

namespace Eight.Capybara.DeviceAPI.Handlers;

public class PairingController(PairingService pairingService, ILogger<PairingController> logger) : RequestController
{
	private readonly PairingService pairingService = pairingService;

	private readonly ILogger<PairingController> logger = logger;

	[FunctionHandler("pairing/pair")]
	public async Task<PairingResponse> AutoPairingStart([SerializedRequestArg] PairingRequest args)
	{
		logger.LogInformation("[pairing] starting pairing {args}", args);
		try
		{
			return new PairingResponse(Result: true, await pairingService.StartPairingAsync(args.TargetDeviceId, args.Specialization, args.MinRssi, CancellationToken.None), "Pairing started successfully");
		}
		catch (Exception ex)
		{
			logger.LogError(ex, "[pairing] Error starting pairing");
			return new PairingResponse(Result: false, null, "Error starting pairing: " + ex.Message);
		}
	}

	[FunctionHandler("pairing/status")]
	public Task<PairingStatusResponse> AutoPairingStatus()
	{
		PairingState pairingState = pairingService.GetPairingState();
		if (pairingState == null)
		{
			return Task.FromResult(new PairingStatusResponse(null, "No pairing currently in progress"));
		}
		logger.LogInformation("[pairing] Getting status for pairing ID: {PairingId}", pairingState.PairingId);
		return Task.FromResult(new PairingStatusResponse(pairingState, null));
	}
}
