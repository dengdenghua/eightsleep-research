using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Eight.Lsp.Protocol.Exceptions;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Logging.Abstractions;

namespace Eight.Lsp.Protocol;

public sealed class Connection(Func<IPhysicalLayer> createPhysicalLayer, int lengthBytes = 1, Action<Packet>? packetHandler = null, ILogger? logger = null, TimeProvider? timeProvider = null) : IAsyncDisposable
{
	private readonly Func<IPhysicalLayer> createPhysicalLayer = createPhysicalLayer;

	private readonly PacketEncoder packetEncoder = new PacketEncoder(lengthBytes);

	private readonly PacketDecoder packetDecoder = new PacketDecoder(lengthBytes, logger);

	private readonly Action<Packet>? packetHandler = packetHandler;

	private readonly ILogger logger = logger ?? NullLogger.Instance;

	private readonly TimeProvider timeProvider = timeProvider ?? TimeProvider.System;

	private readonly ConcurrentDictionary<byte, (TaskCompletionSource<Packet> Tcs, DateTime Deadline)> requests = new ConcurrentDictionary<byte, (TaskCompletionSource<Packet>, DateTime)>();

	private readonly ConcurrentDictionary<byte, SemaphoreSlim> sendGates = new ConcurrentDictionary<byte, SemaphoreSlim>();

	private IPhysicalLayer? physicalLayer;

	private Task? readTask;

	private CancellationTokenSource? cts;

	public bool IsOpen => physicalLayer?.IsOpen ?? false;

	internal IReadOnlyList<KeyValuePair<byte, (TaskCompletionSource<Packet> Tcs, DateTime Deadline)>> PendingRequests => new _003C_003Ez__ReadOnlyArray<KeyValuePair<byte, (TaskCompletionSource<Packet>, DateTime)>>(Enumerable.ToArray(requests));

	public event Action? PortClosed;

	public void Start()
	{
		if (readTask != null)
		{
			throw new InvalidOperationException("Connection is already started. Call Stop() or DisposeAsync() before starting again.");
		}
		physicalLayer = createPhysicalLayer();
		physicalLayer.Open();
		cts = new CancellationTokenSource();
		readTask = ReadLoopAsync(cts.Token);
	}

	private async Task ReadLoopAsync(CancellationToken cancellationToken)
	{
		ErrorBackoffPolicy backoff = new ErrorBackoffPolicy();
		while (!cancellationToken.IsCancellationRequested)
		{
			try
			{
				if (!ProcessOneIteration())
				{
					await Task.Delay(TimeSpan.FromMilliseconds(1.0), timeProvider, cancellationToken);
				}
				else
				{
					backoff.Reset();
				}
			}
			catch (OperationCanceledException)
			{
				break;
			}
			catch (PortClosedException ex2)
			{
				logger.LogWarning("Read loop stopped: {ErrorMessage}", ex2.Message);
				PortClosed?.Invoke();
				break;
			}
			catch (Exception ex3)
			{
				backoff.RecordError();
				logger.LogDebug("Error in read loop: {ErrorMessage} (consecutive errors: {ConsecutiveErrors})", ex3.Message, backoff.ConsecutiveErrors);
				try
				{
					await Task.Delay(backoff.GetDelay(), timeProvider, cancellationToken);
				}
				catch (OperationCanceledException)
				{
					break;
				}
			}
		}
	}

	internal bool ProcessOneIteration()
	{
		CheckTimeouts();
		byte[] array = packetDecoder.TryReceivePacket(physicalLayer);
		if (array == null)
		{
			return false;
		}
		Packet packet = PacketParser.ParsePacket(array);
		logger.LogTrace("[RX] cmd=0x{Command:X2} is_response={IsResponse} payload_len={PayloadLength}", packet.Cmd, packet.IsResponse, packet.Payload.Length);
		if (packet.IsResponse)
		{
			ResolveRequest(packet.Cmd, packet);
		}
		else if (packetHandler != null)
		{
			packetHandler(packet);
		}
		return true;
	}

	private void CheckTimeouts()
	{
		DateTime currentTime = timeProvider.GetUtcNow().UtcDateTime;
		List<KeyValuePair<byte, (TaskCompletionSource<Packet>, DateTime)>> list = new List<KeyValuePair<byte, (TaskCompletionSource<Packet>, DateTime)>>();
		list.AddRange(requests.Where((KeyValuePair<byte, (TaskCompletionSource<Packet> Tcs, DateTime Deadline)> kvp) => currentTime > kvp.Value.Deadline));
		ExpireRequests(new _003C_003Ez__ReadOnlyList<KeyValuePair<byte, (TaskCompletionSource<Packet>, DateTime)>>(list), currentTime);
	}

	internal void ExpireRequests(IReadOnlyList<KeyValuePair<byte, (TaskCompletionSource<Packet> Tcs, DateTime Deadline)>> expired, DateTime currentTime)
	{
		foreach (KeyValuePair<byte, (TaskCompletionSource<Packet>, DateTime)> item in expired)
		{
			if (requests.TryRemove(item))
			{
				item.Value.Item1.TrySetException(new DeviceTimeoutException($"Command 0x{item.Key:X2} timed out", currentTime - item.Value.Item2, item.Key));
			}
		}
	}

	private void ResolveRequest(byte cmd, Packet packet)
	{
		if (requests.TryRemove(cmd, out (TaskCompletionSource<Packet>, DateTime) value))
		{
			value.Item1.TrySetResult(packet);
		}
	}

	public async Task<Packet> SendCommand(byte command, byte[] payload, TimeSpan timeout, CancellationToken cancellation)
	{
		byte[] packetPayload = new byte[payload.Length + 1];
		packetPayload[0] = command;
		Array.Copy(payload, 0, packetPayload, 1, payload.Length);
		long started = timeProvider.GetTimestamp();
		SemaphoreSlim gate = sendGates.GetOrAdd(command, (byte _) => new SemaphoreSlim(1, 1));
		if (!gate.Wait(0))
		{
			logger.LogInformation("[TX] cmd=0x{Command:X2} queued behind an earlier request with the same opcode", command);
			using CancellationTokenSource queueBudget = new CancellationTokenSource(timeout, timeProvider);
			using CancellationTokenSource queueWait = CancellationTokenSource.CreateLinkedTokenSource(cancellation, queueBudget.Token);
			try
			{
				await gate.WaitAsync(queueWait.Token);
			}
			catch (OperationCanceledException) when (!cancellation.IsCancellationRequested)
			{
				throw new DeviceTimeoutException($"Command 0x{command:X2} timed out waiting for an earlier request with the same opcode", timeout, command);
			}
		}
		TaskCompletionSource<Packet> tcs = new TaskCompletionSource<Packet>(TaskCreationOptions.RunContinuationsAsynchronously);
		DateTime deadline = default;
		try
		{
			TimeSpan remaining = timeout - timeProvider.GetElapsedTime(started);
			if (remaining <= TimeSpan.Zero)
			{
				throw new DeviceTimeoutException($"Command 0x{command:X2} timed out waiting for an earlier request with the same opcode", timeout, command);
			}
			deadline = timeProvider.GetUtcNow().UtcDateTime.Add(remaining);
			requests[command] = (tcs, deadline);
			logger.LogTrace("[TX] cmd=0x{Command:X2} payload_len={PayloadLength}", command, payload.Length);
			packetEncoder.SendPacket(physicalLayer, packetPayload);
			try
			{
				return await tcs.Task.WaitAsync(remaining, cancellation);
			}
			catch (TimeoutException)
			{
				throw new DeviceTimeoutException($"Command 0x{command:X2} timed out", remaining, command);
			}
		}
		finally
		{
			requests.TryRemove(new KeyValuePair<byte, (TaskCompletionSource<Packet>, DateTime)>(command, (tcs, deadline)));
			gate.Release();
		}
	}

	public void Stop()
	{
		cts?.Cancel();
		if (readTask != null && !readTask.IsCompleted)
		{
			try
			{
				readTask.Wait(TimeSpan.FromSeconds(2.0));
			}
			catch (AggregateException)
			{
			}
		}
		cts?.Dispose();
		cts = null;
		readTask = null;
	}

	public async Task StopAsync()
	{
		cts?.Cancel();
		if (readTask != null)
		{
			try
			{
				await readTask.WaitAsync(TimeSpan.FromSeconds(2.0));
			}
			catch (OperationCanceledException)
			{
			}
			catch (TimeoutException)
			{
			}
		}
		cts?.Dispose();
		cts = null;
		readTask = null;
	}

	public async ValueTask DisposeAsync()
	{
		await StopAsync();
		physicalLayer?.Dispose();
		GC.SuppressFinalize(this);
	}
}
