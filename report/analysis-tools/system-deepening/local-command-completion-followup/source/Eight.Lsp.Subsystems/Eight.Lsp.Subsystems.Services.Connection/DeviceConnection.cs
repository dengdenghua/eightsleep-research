using System;
using System.Threading;
using System.Threading.Tasks;
using Eight.Lsp.Protocol;
using Eight.Lsp.Protocol.Models;
using Eight.Lsp.Subsystems.Models;
using Microsoft.Extensions.Logging;

namespace Eight.Lsp.Subsystems.Services.Connection;

public sealed class DeviceConnection : IDeviceConnection, IAsyncDisposable
{
	private readonly ILogger<DeviceConnection> logger;

	private readonly Side side;

	private readonly string devicePath;

	private readonly DeviceSession<ProtocolContext> protocol;

	public Side Side => side;

	public string DevicePath => devicePath;

	public bool IsConnected => protocol.IsConnected();

	public event Action<DeviceState, DeviceState>? StateChanged;

	public event Action<Packet, ProtocolContext>? PacketReceived;

	internal DeviceConnection(Side side, string devicePath, ILogger<DeviceConnection> logger, DeviceSession<ProtocolContext> protocol, Action<Packet, ProtocolContext>? eventHandler)
	{
		this.side = side;
		this.devicePath = devicePath;
		this.logger = logger;
		this.protocol = protocol;
		if (eventHandler != null)
		{
			protocol.PacketReceived += eventHandler;
		}
		protocol.PacketReceived += OnPacketReceived;
		protocol.StateChanged += OnStateChanged;
	}

	public void Open(int baudrate, int lengthBytes = 1)
	{
		logger.LogInformation("[{Side}] Opening connection to {DevicePath} at {Baudrate} baud", side.ToLowerString(), devicePath, baudrate);
		protocol.Open(baudrate, lengthBytes);
		logger.LogInformation("[{Side}] Connection opened successfully", side.ToLowerString());
	}

	public Task<DeviceState> GetState(TimeSpan timeout, CancellationToken cancellation)
	{
		EnsureConnected();
		return protocol.GetState(timeout, cancellation);
	}

	public Task<HardwareInfo> GetHwInfo(CancellationToken cancellation)
	{
		EnsureConnected();
		return protocol.GetHwInfo(cancellation);
	}

	public Task<FirmwareInfo> GetFwInfo(CancellationToken cancellation)
	{
		EnsureConnected();
		return protocol.GetFwInfo(cancellation);
	}

	public Task<bool> UpdateFirmware(byte[] firmwareData, int chunkSize, Action<int, int, int, int>? progressCallback, CancellationToken cancellation)
	{
		EnsureConnected();
		return protocol.UpdateFirmware(firmwareData, chunkSize, progressCallback, cancellation);
	}

	public Task StartFirmware(int lengthBytes, CancellationToken cancellation)
	{
		EnsureConnected();
		return protocol.StartFirmware(lengthBytes, cancellation);
	}

	public Task Reboot(CancellationToken cancellation)
	{
		EnsureConnected();
		return protocol.Reboot(cancellation);
	}

	public Task SendCustomCommand(byte command, byte[] payload, TimeSpan timeout, CancellationToken cancellation)
	{
		EnsureConnected();
		return protocol.SendCustomCommand(command, payload, timeout, cancellation);
	}

	public Task<byte[]> SendCustomCommandWithResponse(byte command, byte[] payload, TimeSpan timeout, CancellationToken cancellation)
	{
		EnsureConnected();
		return protocol.SendCustomCommand(command, payload, timeout, cancellation);
	}

	private void EnsureConnected()
	{
		if (!IsConnected)
		{
			throw new InvalidOperationException("[" + side.ToLowerString() + "] Device not connected");
		}
	}

	private void OnStateChanged(DeviceState newState, DeviceState prevState)
	{
		logger.LogDebug("[{Side}] State changed: {PrevState} -> {NewState}", side.ToLowerString(), prevState.ToDisplayName(), newState.ToDisplayName());
		StateChanged?.Invoke(newState, prevState);
	}

	private void OnPacketReceived(Packet packet, ProtocolContext context)
	{
		PacketReceived?.Invoke(packet, context);
	}

	public async Task Close(CancellationToken cancellation)
	{
		logger.LogDebug("[{Side}] Closing connection", side.ToLowerString());
		protocol.PacketReceived -= OnPacketReceived;
		protocol.StateChanged -= OnStateChanged;
		await protocol.Close(cancellation);
		logger.LogDebug("[{Side}] Connection closed", side.ToLowerString());
	}

	public async ValueTask DisposeAsync()
	{
		await protocol.DisposeAsync();
	}
}
