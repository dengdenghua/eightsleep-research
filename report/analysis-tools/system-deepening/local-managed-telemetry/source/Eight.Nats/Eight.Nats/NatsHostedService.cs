using System;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace Eight.Nats;

public class NatsHostedService(ILogger<NatsHostedService> logger, TimeProvider timeProvider, NatsPublisher publisher) : BackgroundService
{
	private readonly ILogger<NatsHostedService> logger = logger;

	private readonly TimeProvider timeProvider = timeProvider;

	private readonly NatsPublisher publisher = publisher;

	private static readonly TimeSpan RetryDelay = TimeSpan.FromSeconds(5L);

	protected override async Task ExecuteAsync(CancellationToken cancellation)
	{
		while (!cancellation.IsCancellationRequested && await ConnectWithRetryAsync(cancellation))
		{
			logger.LogInformation("Monitoring NATS connection health");
			Task shutdownTask = Task.Delay(Timeout.InfiniteTimeSpan, timeProvider, cancellation);
			if (await Task.WhenAny(publisher.WhenConnectionLost, shutdownTask) == shutdownTask)
			{
				break;
			}
			logger.LogWarning("NATS connection permanently lost, resetting and reconnecting");
			await publisher.ResetAsync();
			await Task.Delay(RetryDelay, timeProvider, cancellation);
		}
	}

	private async Task<bool> ConnectWithRetryAsync(CancellationToken cancellation)
	{
		int attempt = 0;
		while (!cancellation.IsCancellationRequested)
		{
			attempt++;
			try
			{
				await publisher.ConnectAsync(cancellation);
				logger.LogInformation("NATS connected on attempt {Attempt}", attempt);
				return true;
			}
			catch (OperationCanceledException) when (cancellation.IsCancellationRequested)
			{
				return false;
			}
			catch (Exception exception)
			{
				logger.LogWarning(exception, "Failed to connect to NATS server (attempt {Attempt}), retrying in {Delay}s", attempt, RetryDelay.TotalSeconds);
				await Task.Delay(RetryDelay, timeProvider, cancellation);
			}
		}
		return false;
	}

	public override async Task StopAsync(CancellationToken cancellationToken)
	{
		await base.StopAsync(cancellationToken);
		logger.LogInformation("Stopping NATS hosted service");
	}
}
