using System;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

namespace Eight.Nats.Monitoring;

public sealed class NatsMonitoringClient : INatsMonitoringClient
{
	private readonly HttpClient httpClient;

	public string BaseAddress { get; }

	public NatsMonitoringClient(string baseAddress)
	{
		BaseAddress = baseAddress;
		httpClient = new HttpClient
		{
			BaseAddress = new Uri(baseAddress.EndsWith('/') ? baseAddress : (baseAddress + "/")),
			Timeout = TimeSpan.FromSeconds(5L)
		};
	}

	public async Task<string> GetAsync(string path, CancellationToken cancellation)
	{
		using HttpResponseMessage response = await httpClient.GetAsync(path, cancellation);
		response.EnsureSuccessStatusCode();
		return await response.Content.ReadAsStringAsync(cancellation);
	}
}
