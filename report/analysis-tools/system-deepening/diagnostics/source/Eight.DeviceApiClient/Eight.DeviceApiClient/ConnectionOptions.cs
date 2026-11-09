using System;
using System.Linq;
using System.Net.Security;
using System.Net.WebSockets;
using System.Security.Cryptography.X509Certificates;
using MessagePack.Resolvers;
using Microsoft.AspNetCore.Http.Connections;
using Microsoft.AspNetCore.Http.Connections.Client;
using Microsoft.AspNetCore.SignalR;
using Microsoft.AspNetCore.SignalR.Client;
using Microsoft.Extensions.DependencyInjection;

namespace Eight.DeviceApiClient;

public record ConnectionOptions(Uri Endpoint, ClientId ClientId, bool AllowInsecureTls = false)
{
	private static readonly string[] EightHostSuffixes = new string[2] { ".8slp.net", ".8slp.net.cn" };

	public IHubConnectionBuilder ApplyToBuilder(IHubConnectionBuilder builder)
	{
		return builder.WithUrl(Endpoint, ConfigureHttpConnection).AddMessagePackProtocol((MessagePackHubProtocolOptions cc) =>
		{
			cc.SerializerOptions.WithResolver(CompositeResolver.Create(NativeGuidResolver.Instance, StandardResolver.Instance));
		});
	}

	public void ConfigureHttpConnection(HttpConnectionOptions options)
	{
		options.Transports = HttpTransportType.WebSockets;
		options.SkipNegotiation = true;
		RemoteCertificateValidationCallback validateCertificate = CreateServerCertificateValidator(Endpoint);
		options.WebSocketConfiguration = (ClientWebSocketOptions sockets) =>
		{
			sockets.RemoteCertificateValidationCallback = (AllowInsecureTls ? ((RemoteCertificateValidationCallback)((object _, X509Certificate? _, X509Chain? _, SslPolicyErrors _) => true)) : validateCertificate);
		};
		ClientId.AuthenticateConnection(options);
	}

	internal static bool IsEightHost(string host)
	{
		return EightHostSuffixes.Any((string suffix) => host.Equals(suffix.TrimStart('.'), StringComparison.OrdinalIgnoreCase) || host.EndsWith(suffix, StringComparison.OrdinalIgnoreCase));
	}

	internal static RemoteCertificateValidationCallback CreateServerCertificateValidator(Uri endpoint)
	{
		return (object _, X509Certificate? _, X509Chain? _, SslPolicyErrors sslPolicyErrors) => sslPolicyErrors == SslPolicyErrors.None && IsEightHost(endpoint.Host);
	}
}
