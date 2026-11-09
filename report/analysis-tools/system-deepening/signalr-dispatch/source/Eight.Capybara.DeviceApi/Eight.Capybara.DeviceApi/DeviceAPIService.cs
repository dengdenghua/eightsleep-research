using System;
using System.Net.WebSockets;
using System.Threading;
using System.Threading.Channels;
using System.Threading.Tasks;
using Eight.DeviceApiClient;
using Eight.DeviceProtocol;
using Microsoft.AspNetCore.SignalR.Client;
using Microsoft.Extensions.Logging;

namespace Eight.Capybara.DeviceApi;

public sealed class DeviceAPIService : Client
{
	private new readonly Channel<Request> serverRequests = Channel.CreateUnbounded<Request>();

	private TaskCompletionSource connectionClosedSource = new TaskCompletionSource();

	public DeviceAPIService(ILogger<DeviceAPIService> logger, HubConnection hubConnection, IRouter router)
		: base(hubConnection, router, logger)
	{
		DeviceAPIService deviceAPIService = this;
		hubConnection.On("Request", async (Request a) =>
		{
			await deviceAPIService.serverRequests.Writer.WriteAsync(a);
		});
		hubConnection.Closed += (Exception? error) =>
		{
			logger.LogError(error, "device-api connection closed");
			deviceAPIService.connectionClosedSource.SetResult();
			return Task.CompletedTask;
		};
	}

	protected override async Task ExecuteAsync(CancellationToken stoppingToken)
	{
		ProcessRequests(serverRequests.Reader, stoppingToken);
		int millisecondsDelay = Random.Shared.Next(0, 10000);
		await Task.Delay(millisecondsDelay, stoppingToken);
		while (!stoppingToken.IsCancellationRequested)
		{
			try
			{
				connectionClosedSource = new TaskCompletionSource();
				using CancellationTokenSource linkedTokenSource = CancellationTokenSource.CreateLinkedTokenSource(stoppingToken, new CancellationTokenSource(30000).Token);
				await SetupConnection(linkedTokenSource.Token);
				logger.LogInformation("device-api connected");
				await connectionClosedSource.Task.WaitAsync(stoppingToken);
			}
			catch (TaskCanceledException)
			{
				stoppingToken.ThrowIfCancellationRequested();
				millisecondsDelay = Random.Shared.Next(0, 10000);
				logger.LogInformation("device-api connection closed, waiting {Milliseconds} milliseconds before attempting reconnect", millisecondsDelay);
				await Task.Delay(millisecondsDelay, stoppingToken);
			}
			catch (WebSocketException exception)
			{
				millisecondsDelay = Random.Shared.Next(0, 10000);
				logger.LogWarning(exception, "Failed to initialize connection to device-api, waiting {Milliseconds} milliseconds before attempting reconnect", millisecondsDelay);
				await Task.Delay(millisecondsDelay, stoppingToken);
			}
			catch (Exception exception2)
			{
				millisecondsDelay = Random.Shared.Next(0, 10000);
				logger.LogError(exception2, "Failed to initialize connection to device-api, waiting {Milliseconds} milliseconds before attempting reconnect", millisecondsDelay);
				await Task.Delay(millisecondsDelay, stoppingToken);
			}
		}
	}
}
