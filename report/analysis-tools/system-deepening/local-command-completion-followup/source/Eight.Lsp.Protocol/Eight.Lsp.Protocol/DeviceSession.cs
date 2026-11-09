using System;
using System.Buffers.Binary;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Eight.Lsp.Protocol.Exceptions;
using Eight.Lsp.Protocol.Models;
using Microsoft.Extensions.Logging;
using PeterO.Cbor;

namespace Eight.Lsp.Protocol;

public class DeviceSession<T> : IDeviceSession, IAsyncDisposable where T : class
{
	private readonly ILogger logger;

	private readonly TimeProvider timeProvider;

	private readonly LspOptions options;

	private readonly T context;

	private readonly Func<int, int, Action<Packet>, Connection> createConnection;

	private Connection? currentConnection;

	private Task? monitoringTask;

	private CancellationTokenSource? monitoringCts;

	private DateTimeOffset lastCommandTime;

	private DeviceState currentState;

	private DateTimeOffset stateValidUntil = DateTimeOffset.MaxValue;

	private readonly object monitoringLock = new object();

	private Connection protocol => currentConnection ?? throw new InvalidOperationException("Not connected");

	public bool Debug => options.Debug;

	public T Context => context;

	public event Action<Packet, T>? PacketReceived;

	public event Action<DeviceState, DeviceState>? StateChanged;

	internal DeviceSession(ILogger logger, TimeProvider timeProvider, LspOptions options, T context, Func<int, int, Action<Packet>, Connection> createConnection)
	{
		this.logger = logger;
		this.timeProvider = timeProvider;
		this.options = options;
		this.context = context;
		this.createConnection = createConnection;
		lastCommandTime = timeProvider.GetUtcNow();
	}

	public void Open(int baudrate, int lengthBytes)
	{
		currentConnection = createConnection(baudrate, lengthBytes, HandleUnsolicitedPacket);
		currentConnection.PortClosed += OnPortClosed;
		currentConnection.Start();
	}

	private void OnPortClosed()
	{
		TransitionToStateAsync(DeviceState.Unknown);
	}

	public void HandleUnsolicitedPacket(Packet packet)
	{
		if (PacketReceived == null)
		{
			logger.LogDebug("[EVENT] cmd=0x{Command:X2}, payload_len={PayloadLength}", packet.Cmd, packet.Payload.Length);
		}
		else
		{
			PacketReceived(packet, context);
		}
	}

	private async Task<byte[]> SendCommand(byte command, byte[] payload, TimeSpan timeout, CancellationToken cancellation)
	{
		lastCommandTime = timeProvider.GetUtcNow();
		Packet packet = await protocol.SendCommand(command, payload, timeout, cancellation);
		if (packet.Payload.Length < 1)
		{
			throw new DeviceCommunicationException("Invalid response: no payload");
		}
		ResponseCode responseCode = (ResponseCode)packet.Payload[0];
		if (responseCode == ResponseCode.BadOffset && packet.Payload.Length >= 5)
		{
			uint value = BinaryPrimitives.ReadUInt32BigEndian(packet.Payload.AsSpan(1, 4));
			throw new DeviceCommunicationException($"Bad offset - sensor expects: 0x{value:X8}", responseCode, value);
		}
		if (responseCode != ResponseCode.Ack)
		{
			throw new DeviceCommunicationException($"Command failed with response code: {responseCode}", responseCode);
		}
		return packet.Payload[1..];
	}

	public async Task<byte[]> SendCustomCommand(byte command, byte[] payload, TimeSpan timeout, CancellationToken cancellation)
	{
		return await SendCommand(command, payload, timeout, cancellation);
	}

	public async Task<DeviceState> GetState(TimeSpan timeout, CancellationToken cancellation)
	{
		byte[] bytes = await SendCommand(1, Array.Empty<byte>(), timeout, cancellation);
		DeviceState deviceState = DeviceStateExtensions.FromProtocolCode(Encoding.ASCII.GetString(bytes).Trim());
		if (deviceState != DeviceState.Unknown)
		{
			stateValidUntil = timeProvider.GetUtcNow().Add(options.StateTimeout);
		}
		return deviceState;
	}

	private static string ParseRevision(ushort raw)
	{
		byte b = (byte)(raw >> 8);
		byte value = (byte)(raw & 0xFF);
		char value2 = (char)(65 + b);
		return $"{value2}{value:X2}";
	}

	private static string ParseSerial(uint raw)
	{
		Span<byte> span = stackalloc byte[4];
		BinaryPrimitives.WriteUInt32BigEndian(span, raw);
		return Convert.ToHexString(span);
	}

	public async Task<HardwareInfo> GetHwInfo(CancellationToken cancellation)
	{
		byte[] array = await SendCommand(2, Array.Empty<byte>(), TimeSpan.FromSeconds(1.0), cancellation);
		try
		{
			CBORObject cBORObject = CBORObject.DecodeFromBytes(array.AsSpan().TrimEnd(byte.MaxValue).ToArray());
			if (cBORObject == null)
			{
				logger.LogWarning("Failed to decode hardware info: CBOR returned null");
				return HardwareInfo.Error(array, "CBOR decode returned null");
			}
			CBORObject cBORObject2 = cBORObject["hwrev"];
			CBORObject cBORObject3 = cBORObject["devicesn"];
			CBORObject cBORObject4 = cBORObject["pn"];
			CBORObject cBORObject5 = cBORObject["sku"];
			if (cBORObject2 == null || cBORObject3 == null || cBORObject4 == null || cBORObject5 == null)
			{
				logger.LogWarning("Failed to parse hardware info: missing required fields");
				return HardwareInfo.Error(array, "Missing required CBOR fields");
			}
			string text = ParseRevision((ushort)cBORObject2.AsInt64());
			string text2 = ParseSerial((uint)cBORObject3.AsInt64());
			int num = (int)cBORObject4.AsInt64();
			ushort value = (ushort)cBORObject5.AsInt64();
			Span<byte> span = stackalloc byte[2];
			BinaryPrimitives.WriteUInt16BigEndian(span, value);
			string text3 = Convert.ToHexString(span);
			return new HardwareInfo($"{num}-{text3}-{text}-{text2}", text, text2, num, text3, array);
		}
		catch (Exception ex)
		{
			logger.LogWarning("Failed to parse hardware info: {Error}", ex.Message);
			return HardwareInfo.Error(array, ex.Message);
		}
	}

	public async Task<BootloaderInfo> GetBlInfo(CancellationToken cancellation)
	{
		return BootloaderInfo.FromRawData(await SendCommand(3, Array.Empty<byte>(), options.CommandTimeout, cancellation));
	}

	public async Task<FirmwareInfo> GetFwInfo(CancellationToken cancellation)
	{
		byte[] array = await SendCommand(4, Array.Empty<byte>(), TimeSpan.FromSeconds(5.0), cancellation);
		if (array.Length < 32)
		{
			return FirmwareInfo.NoFirmware(array);
		}
		return new FirmwareInfo(BinaryPrimitives.ReadUInt32LittleEndian(array.AsSpan(17, 4)), array.Length, IsValid: true, array);
	}

	private async Task TransitionToStateAsync(DeviceState newState, DeviceState? prevState = null)
	{
		prevState.GetValueOrDefault();
		if (!prevState.HasValue)
		{
			DeviceState value = currentState;
			prevState = value;
		}
		if (newState == prevState)
		{
			return;
		}
		logger.LogInformation("[STATE] {PrevState} -> {NewState}", prevState.Value.ToDisplayName(), newState.ToDisplayName());
		currentState = newState;
		Action<DeviceState, DeviceState> handler = StateChanged;
		if (handler == null)
		{
			return;
		}
		Task.Run(() =>
		{
			try
			{
				handler(newState, prevState.Value);
			}
			catch (Exception exception)
			{
				logger.LogWarning(exception, "StateChanged event handler threw exception");
			}
		});
	}

	public async Task StartFirmware(int lengthBytes, CancellationToken cancellation)
	{
		await SendCommand(16, Array.Empty<byte>(), TimeSpan.FromSeconds(2.0), cancellation);
		await Reconnect(options.HighSpeedBaudrate, lengthBytes, cancellation);
		await WaitForState(DeviceState.Firmware, options.MaxFirmwareAttempts, cancellation);
		await TransitionToStateAsync(DeviceState.Firmware);
		StartMonitoring();
	}

	public async Task Reboot(CancellationToken cancellation)
	{
		await SendCommand(5, Array.Empty<byte>(), options.CommandTimeout, cancellation);
		await Reconnect(options.BootloaderBaudrate, 1, cancellation);
		await WaitForState(DeviceState.Bootloader, options.MaxBootloaderAttempts, cancellation);
		await TransitionToStateAsync(DeviceState.Bootloader);
	}

	private async Task Reconnect(int baudrate, int lengthBytes, CancellationToken cancellation)
	{
		await StopMonitoringAsync();
		if (currentConnection != null)
		{
			await currentConnection.DisposeAsync();
		}
		await Task.Delay(TimeSpan.FromMilliseconds(100.0), timeProvider, cancellation);
		currentConnection = createConnection(baudrate, lengthBytes, HandleUnsolicitedPacket);
		currentConnection.PortClosed += OnPortClosed;
		currentConnection.Start();
	}

	private async Task WaitForState(DeviceState expected, int maxAttempts, CancellationToken cancellation)
	{
		DeviceState state = DeviceState.Unknown;
		for (int attempt = 1; attempt <= maxAttempts; attempt++)
		{
			cancellation.ThrowIfCancellationRequested();
			try
			{
				state = await GetState(TimeSpan.FromSeconds(1.0), cancellation);
				if (state == expected)
				{
					logger.LogDebug("Device ready in {State} mode", expected.ToDisplayName());
					return;
				}
			}
			catch (OperationCanceledException)
			{
				throw;
			}
			catch (Exception)
			{
				logger.LogDebug("Waiting for {State}... (attempt {Attempt}/{MaxAttempts})", expected.ToDisplayName(), attempt, maxAttempts);
				await Task.Delay(TimeSpan.FromSeconds(1.0), timeProvider, cancellation);
			}
		}
		if (state != expected)
		{
			throw new DeviceTimeoutException($"Failed to detect {expected.ToDisplayName()} after {maxAttempts} attempts", TimeSpan.FromSeconds((double)maxAttempts));
		}
	}

	private async Task StopMonitoringAsync()
	{
		monitoringCts?.Cancel();
		if (monitoringTask != null && !monitoringTask.IsCompleted)
		{
			try
			{
				await monitoringTask.WaitAsync(TimeSpan.FromSeconds(2.0));
			}
			catch (OperationCanceledException)
			{
			}
			catch (TimeoutException)
			{
				logger.LogWarning("Monitoring task did not complete in time");
			}
			catch (Exception ex3)
			{
				logger.LogWarning("Error waiting for monitoring task: {Error}", ex3.Message);
			}
		}
		monitoringCts?.Dispose();
		monitoringCts = null;
		monitoringTask = null;
	}

	public async Task<bool> UpdateFirmware(byte[] firmwareData, int chunkSize, Action<int, int, int, int>? progressCallback, CancellationToken cancellation)
	{
		_ = 3;
		try
		{
			logger.LogInformation("Starting firmware update (size: {Size} bytes)", firmwareData.Length);
			await SendCommand(18, Array.Empty<byte>(), TimeSpan.FromSeconds(30.0), cancellation);
			int totalChunks = (firmwareData.Length + chunkSize - 1) / chunkSize;
			uint offset = 0u;
			Dictionary<uint, int> retryCount = new Dictionary<uint, int>();
			while (offset < firmwareData.Length)
			{
				cancellation.ThrowIfCancellationRequested();
				int length = Math.Min(chunkSize, firmwareData.Length - (int)offset);
				byte[] array = new byte[length];
				Array.Copy(firmwareData, offset, array, 0L, length);
				int chunkNum = (int)(offset / chunkSize) + 1;
				if (progressCallback != null)
				{
					progressCallback(chunkNum, totalChunks, (int)offset, firmwareData.Length);
				}
				else
				{
					logger.LogDebug("Sending chunk {ChunkNum}/{TotalChunks} ({Length} bytes)", chunkNum, totalChunks, length);
				}
				uint? num = await SendFirmwareChunk(offset, array, cancellation);
				if (!num.HasValue)
				{
					offset += (uint)length;
					retryCount.Clear();
					continue;
				}
				if (num != offset)
				{
					logger.LogWarning("Device requested offset correction: 0x{CurrentOffset:X8} -> 0x{CorrectedOffset:X8}", offset, num.Value);
					offset = num.Value;
					retryCount.Clear();
					continue;
				}
				retryCount.TryAdd(offset, 0);
				retryCount[offset]++;
				if (retryCount[offset] >= options.FirmwareChunkMaxRetries)
				{
					throw new FirmwareUpdateException($"Failed to send chunk at offset 0x{offset:X8} after {options.FirmwareChunkMaxRetries} retries", chunkNum, offset);
				}
				logger.LogWarning("Retrying chunk at offset 0x{Offset:X8} (attempt {Attempt})", offset, retryCount[offset] + 1);
				await Task.Delay(TimeSpan.FromMilliseconds(100.0), timeProvider, cancellation);
			}
			logger.LogInformation("Completing firmware update...");
			await SendCommand(20, Array.Empty<byte>(), options.CommandTimeout, cancellation);
			logger.LogInformation("Firmware update completed successfully");
			return true;
		}
		catch (OperationCanceledException)
		{
			logger.LogWarning("Firmware update was cancelled");
			throw;
		}
		catch (Exception ex2) when (!(ex2 is FirmwareUpdateException))
		{
			logger.LogError(ex2, "Firmware update failed: {Error}", ex2.Message);
			return false;
		}
	}

	private async Task<uint?> SendFirmwareChunk(uint offset, byte[] data, CancellationToken cancellation)
	{
		byte[] array = new byte[4 + data.Length];
		BinaryPrimitives.WriteUInt32BigEndian(array.AsSpan(0, 4), offset);
		Array.Copy(data, 0, array, 4, data.Length);
		try
		{
			await SendCommand(19, array, TimeSpan.FromSeconds(30.0), cancellation);
			return null;
		}
		catch (DeviceCommunicationException ex) when (ex.ExpectedOffset.HasValue)
		{
			logger.LogDebug("Chunk at offset 0x{Offset:X8} got BAD_OFFSET, device expects 0x{Expected:X8}", offset, ex.ExpectedOffset.Value);
			return ex.ExpectedOffset.Value;
		}
		catch (Exception ex2)
		{
			logger.LogDebug("Chunk at offset 0x{Offset:X8} failed: {Error}", offset, ex2.Message);
			return offset;
		}
	}

	public void StartMonitoring()
	{
		lock (monitoringLock)
		{
			if (monitoringTask == null || monitoringTask.IsCompleted)
			{
				monitoringCts = new CancellationTokenSource();
				monitoringTask = Task.Run(() => MonitorLoopAsync(monitoringCts.Token));
			}
		}
	}

	private async Task MonitorLoopAsync(CancellationToken cancellationToken)
	{
		while (!cancellationToken.IsCancellationRequested)
		{
			try
			{
				if (timeProvider.GetUtcNow() > stateValidUntil && currentState != DeviceState.Unknown)
				{
					logger.LogWarning("[MONITOR] State timeout, transitioning to unknown");
					await TransitionToStateAsync(DeviceState.Unknown);
				}
				try
				{
					DeviceState prevState = currentState;
					currentState = await GetState(TimeSpan.FromSeconds(1.0), cancellationToken);
					if (currentState != prevState)
					{
						await TransitionToStateAsync(currentState, prevState);
					}
				}
				catch (DeviceTimeoutException)
				{
					logger.LogDebug("[MONITOR] get_state timeout");
				}
				await Task.Delay(options.MonitorPollInterval, timeProvider, cancellationToken);
			}
			catch (OperationCanceledException) when (cancellationToken.IsCancellationRequested)
			{
				break;
			}
			catch (Exception ex3)
			{
				logger.LogError(ex3, "[MONITOR] Unexpected error: {Error}", ex3.Message);
				await Task.Delay(TimeSpan.FromSeconds(1.0), timeProvider, cancellationToken);
			}
		}
	}

	public async Task Close(CancellationToken cancellation)
	{
		await StopMonitoringAsync();
		await protocol.StopAsync();
	}

	public bool IsConnected()
	{
		return currentConnection?.IsOpen ?? false;
	}

	public DeviceState GetCurrentState()
	{
		return currentState;
	}

	public async ValueTask DisposeAsync()
	{
		await Close(CancellationToken.None);
		if (currentConnection != null)
		{
			await currentConnection.DisposeAsync();
		}
		GC.SuppressFinalize(this);
	}
}
