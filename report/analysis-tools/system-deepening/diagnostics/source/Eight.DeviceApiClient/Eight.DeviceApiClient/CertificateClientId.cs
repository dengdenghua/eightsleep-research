using System;
using System.Text;
using Microsoft.AspNetCore.Http.Connections.Client;

namespace Eight.DeviceApiClient;

public record CertificateClientId(string Pem) : ClientId
{
	public override void AuthenticateConnection(HttpConnectionOptions options)
	{
		byte[] bytes = Encoding.UTF8.GetBytes(Pem);
		options.Headers.Add("X-Ssl-Cert", Convert.ToBase64String(bytes));
	}
}
