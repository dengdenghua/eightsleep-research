using System;
using System.Threading.Tasks;
using Eight.Capybara.DeviceApi;
using Eight.DBus;
using Eight.DeviceApiClient;
using Eight.DeviceProtocol;

namespace Eight.Capybara.DeviceAPI.Handlers;

public class RemoteConnectivityController : RequestController
{
	private readonly RemoteConnectivityService service;

	private readonly IPairingMode pairingMode;

	internal const string PairingRequiredReason = "Pairing mode is not enabled, cannot add authorized keys. Press the pairing button on the device, then retry.";

	public RemoteConnectivityController(RemoteConnectivityService service, IPairingMode pairingMode)
	{
		this.service = service;
		this.pairingMode = pairingMode;
	}

	[FunctionHandler("StartSSH")]
	public async Task<StartSshResponse> StartSsh([SerializedRequestArg] StartSshRequest args)
	{
		if (args.Key != null)
		{
			await service.PrimeLegacyConnectivity(args.Key, default);
		}
		int port = args.Port ?? Random.Shared.Next(1025, 65535);
		return service.RunRemoteConnectivity(port);
	}

	[FunctionHandler("remoteconnectivity/startssh")]
	public Task<StartSshResponse> StartSsh2([SerializedRequestArg] StartSsh2Request args)
	{
		int num = 0;
		if (!args.Port.HasValue || args.Port == 0)
		{
			num = Random.Shared.Next(1025, 65535);
		}
		if (num <= 1024)
		{
			return Task.FromResult(new StartSshResponse(Result: false, num, "Invalid port number supplied"));
		}
		return Task.FromResult(service.RunRemoteConnectivity(num));
	}

	[FunctionHandler("remoteconnectivity/getpublickey")]
	public async Task<GetPublicKeyResponse> GetPublicKey()
	{
		return new GetPublicKeyResponse(await service.GetPublicKey(default));
	}

	[FunctionHandler("remoteconnectivity/addauthorizedkeys")]
	public async Task<Response> AddAuthorizedKeys([SerializedRequestArg] AddAuthorizedKeysRequest args)
	{
		if (!pairingMode.Active)
		{
			return Eight.Capybara.DeviceApi.Utils.CreateFailure("Pairing mode is not enabled, cannot add authorized keys. Press the pairing button on the device, then retry.", "BadRequest");
		}
		await service.AddAuthorizedKeys(args.AuthorizedKeys, args.User, default);
		return Eight.Capybara.DeviceApi.Utils.EmptyResponse();
	}
}
