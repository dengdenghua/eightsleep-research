using System;
using System.Threading;
using System.Threading.Channels;
using System.Threading.Tasks;
using Eight.DeviceProtocol;
using Microsoft.AspNetCore.SignalR.Client;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace Eight.DeviceApiClient;

public class Client : BackgroundService
{
	protected readonly HubConnection hubConnection;

	private readonly IRouter router;

	protected readonly ILogger<Client> logger;

	protected readonly Channel<Request> serverRequests = Channel.CreateUnbounded<Request>();

	public Client(HubConnection hubConnection, IRouter router, ILogger<Client> logger)
	{
		this.hubConnection = hubConnection;
		this.router = router;
		this.logger = logger;
		hubConnection.On("Request", async (Request a) =>
		{
			await serverRequests.Writer.WriteAsync(a);
		});
	}

	protected async Task SetupConnection(CancellationToken cancellationToken)
	{
		if (hubConnection.State != HubConnectionState.Disconnected)
		{
			throw new InvalidOperationException("already connected");
		}
		await hubConnection.StartAsync(cancellationToken);
	}

	protected override async Task ExecuteAsync(CancellationToken stoppingToken)
	{
		await SetupConnection(stoppingToken);
		await ProcessRequests(serverRequests.Reader, stoppingToken);
	}

	protected async Task ProcessRequests(ChannelReader<Request> requests, CancellationToken cancellation)
	{
		_ = 2;
		try
		{
			await foreach (Request item in requests.ReadAllAsync(cancellation))
			{
				await ProcessRequest(item, cancellation);
			}
		}
		catch (TaskCanceledException)
		{
		}
		catch (Exception exception)
		{
			logger.LogError(exception, "Unhandled exception while processing server requests.");
			throw;
		}
	}

	private async Task ProcessRequest(Request request, CancellationToken cancellation)
	{
		_ = 1;
		try
		{
			await TrySendResponse(await router.ExecuteRequest(request), cancellation);
		}
		catch (TaskCanceledException) when (cancellation.IsCancellationRequested)
		{
		}
		catch (Exception exception)
		{
			logger.LogError(exception, "Unhandled exception while processing request.");
		}
	}

	private async Task TrySendResponse(Response response, CancellationToken cancellation)
	{
		try
		{
			await hubConnection.InvokeAsync<bool>("Response", response, cancellation);
		}
		catch (TaskCanceledException) when (cancellation.IsCancellationRequested)
		{
		}
		catch (Exception exception)
		{
			logger.LogError(exception, "Unhandled exception while responding to server.");
		}
	}
}
