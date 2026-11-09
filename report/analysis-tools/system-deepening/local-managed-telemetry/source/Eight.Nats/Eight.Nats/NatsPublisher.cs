using System;
using System.Threading;
using System.Threading.Channels;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using NATS.Client.Core;
using NATS.Client.JetStream;
using NATS.Client.JetStream.Models;

namespace Eight.Nats;

public class NatsPublisher(ILogger<NatsPublisher> logger, TimeProvider timeProvider, NatsOpts? options = null, string? streamName = null, int capacity = 1000) : INatsPublisher, IAsyncDisposable
{
	private readonly record struct PublishItem(string Subject, object? Data);

	private readonly TimeProvider timeProvider = timeProvider;

	private readonly NatsOpts options = options ?? NatsOpts.Default;

	private readonly string? streamName = streamName;

	private readonly Channel<PublishItem> channel = Channel.CreateBounded<PublishItem>(new BoundedChannelOptions(capacity)
	{
		FullMode = BoundedChannelFullMode.DropOldest,
		SingleReader = true,
		SingleWriter = false
	});

	private NatsConnection? connection;

	private NatsJSContext? jetStream;

	private Task? processingTask;

	private CancellationTokenSource? processingCts;

	private bool disposed;

	private DateTime lastNotConnectedWarning = DateTime.MinValue;

	private TaskCompletionSource connectionLost = new TaskCompletionSource();

	private int consecutiveReconnectFailures;

	private static readonly TimeSpan NotConnectedLogInterval = TimeSpan.FromMinutes(1L);

	private const int MaxReconnectFailures = 10;

	public bool IsConnected
	{
		get
		{
			NatsConnection? natsConnection = connection;
			if (natsConnection == null)
			{
				return false;
			}
			return natsConnection.ConnectionState == NatsConnectionState.Open;
		}
	}

	public Task WhenConnectionLost => connectionLost.Task;

	public async Task ConnectAsync(CancellationToken cancellationToken = default(CancellationToken))
	{
		if (jetStream != null)
		{
			return;
		}
		if (connection != null)
		{
			await connection.DisposeAsync();
			connection = null;
		}
		logger.LogInformation("Connecting to NATS JetStream server at {Url}", options.Url);
		connection = new NatsConnection(options);
		connection.ConnectionDisconnected += (object? _, NatsEventArgs _) =>
		{
			Interlocked.Increment(ref consecutiveReconnectFailures);
			logger.LogWarning("NATS connection disconnected, will attempt reconnection");
			return ValueTask.CompletedTask;
		};
		connection.ReconnectFailed += (object? _, NatsEventArgs _) =>
		{
			int num = Interlocked.Increment(ref consecutiveReconnectFailures);
			logger.LogError("NATS reconnection failed ({Failures}/{Max})", num, 10);
			if (num >= 10)
			{
				logger.LogError("NATS connection considered permanently lost after {Failures} consecutive failures", num);
				connectionLost.TrySetResult();
			}
			return ValueTask.CompletedTask;
		};
		connection.ConnectionOpened += (object? _, NatsEventArgs _) =>
		{
			Interlocked.Exchange(ref consecutiveReconnectFailures, 0);
			logger.LogInformation("NATS connection opened");
			return ValueTask.CompletedTask;
		};
		await connection.ConnectAsync();
		jetStream = new NatsJSContext(connection);
		processingCts = CancellationTokenSource.CreateLinkedTokenSource(cancellationToken);
		processingTask = ProcessChannelAsync(processingCts.Token);
		lastNotConnectedWarning = DateTime.MinValue;
		logger.LogInformation("Connected to NATS JetStream server");
	}

	public async ValueTask PublishAsync<T>(string subject, T data, CancellationToken cancellationToken = default(CancellationToken))
	{
		if (jetStream == null)
		{
			LogNotConnectedThrottled();
		}
		else
		{
			await channel.Writer.WriteAsync(new PublishItem(subject, data), cancellationToken);
		}
	}

	public async ValueTask PublishAsync(string subject, ReadOnlyMemory<byte> data, CancellationToken cancellationToken = default(CancellationToken))
	{
		if (jetStream == null)
		{
			LogNotConnectedThrottled();
		}
		else
		{
			await channel.Writer.WriteAsync(new PublishItem(subject, data.ToArray()), cancellationToken);
		}
	}

	public async Task ResetAsync()
	{
		logger.LogInformation("Resetting NATS connection");
		processingCts?.Cancel();
		if (processingTask != null)
		{
			try
			{
				await processingTask;
			}
			catch (OperationCanceledException)
			{
			}
		}
		if (connection != null)
		{
			await connection.DisposeAsync();
		}
		connection = null;
		jetStream = null;
		processingTask = null;
		processingCts?.Dispose();
		processingCts = null;
		consecutiveReconnectFailures = 0;
		connectionLost = new TaskCompletionSource();
	}

	private void LogNotConnectedThrottled()
	{
		DateTime utcNow = DateTime.UtcNow;
		if (!(utcNow - lastNotConnectedWarning < NotConnectedLogInterval))
		{
			lastNotConnectedWarning = utcNow;
			logger.LogWarning("Cannot publish: not connected to NATS JetStream");
		}
	}

	private async Task ProcessChannelAsync(CancellationToken cancellationToken)
	{
		if (streamName != null)
		{
			await WaitForStreamAsync(streamName, cancellationToken);
		}
		await foreach (PublishItem item in channel.Reader.ReadAllAsync(cancellationToken))
		{
			if (jetStream == null || connection == null)
			{
				continue;
			}
			if (connection.ConnectionState != NatsConnectionState.Open)
			{
				logger.LogDebug("Skipping publish to {Subject}: connection not open", item.Subject);
				continue;
			}
			try
			{
				byte[] data;
				if (item.Data is byte[] array)
				{
					data = array;
					goto IL_01a8;
				}
				if (item.Data != null)
				{
					data = CborSerializer.Serialize(item.Data);
					goto IL_01a8;
				}
				logger.LogWarning("Skipping publish to {Subject}: null data", item.Subject);
				continue;
				IL_01a8:
				PubAckResponse pubAckResponse = await jetStream.PublishAsync(item.Subject, data, null, null, null, cancellationToken);
				pubAckResponse.EnsureSuccess();
				logger.LogTrace("Published message to {Subject}, seq={Sequence}", item.Subject, pubAckResponse.Seq);
			}
			catch (Exception exception)
			{
				logger.LogWarning(exception, "Failed to publish message to {Subject}", item.Subject);
			}
		}
	}

	private async Task WaitForStreamAsync(string name, CancellationToken cancellationToken)
	{
		logger.LogInformation("Waiting for JetStream stream {Stream} to be available...", name);
		while (!cancellationToken.IsCancellationRequested)
		{
			try
			{
				await jetStream.GetStreamAsync(name, null, cancellationToken);
				logger.LogInformation("JetStream stream {Stream} is available, starting to publish", name);
				break;
			}
			catch (NatsJSApiException ex) when (ex.Error.Code == 404)
			{
				logger.LogDebug("Stream {Stream} not yet available, retrying in 2s...", name);
				await Task.Delay(TimeSpan.FromSeconds(2L), timeProvider, cancellationToken);
			}
			catch (OperationCanceledException)
			{
				throw;
			}
			catch (Exception exception)
			{
				logger.LogWarning(exception, "Error checking for stream {Stream}, retrying in 2s...", name);
				await Task.Delay(TimeSpan.FromSeconds(2L), timeProvider, cancellationToken);
			}
		}
	}

	public async ValueTask DisposeAsync()
	{
		if (disposed)
		{
			return;
		}
		disposed = true;
		channel.Writer.TryComplete();
		processingCts?.Cancel();
		if (processingTask != null)
		{
			try
			{
				await processingTask;
			}
			catch (OperationCanceledException)
			{
			}
		}
		processingCts?.Dispose();
		processingCts = null;
		if (connection != null)
		{
			logger.LogInformation("Disconnecting from NATS JetStream server");
			await connection.DisposeAsync();
			connection = null;
			jetStream = null;
		}
	}
}
