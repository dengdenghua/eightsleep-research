using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Eight.Lsp.Subsystems.Infrastructure;
using Eight.Lsp.Subsystems.Models;
using Eight.Lsp.Subsystems.Services;
using Eight.Lsp.Subsystems.Services.Connection;
using Microsoft.Extensions.Logging;

namespace Eight.Lsp.Subsystems.StateMachine.States;

public class NotConnectedState(ILogger<NotConnectedState> logger, TimeProvider timeProvider, ISubsystemStateFactory stateFactory, IDeviceConnectionFactory connectionFactory, IDeviceOptions options, IUsbPortMapper usbPortMapper, IPacketHandler packetHandler, IUsbPortRegistry portRegistry, ITtyUsage ttyUsage, Side side) : ISubsystemState
{
	private readonly ILogger<NotConnectedState> logger = logger;

	private readonly TimeProvider timeProvider = timeProvider;

	private readonly ISubsystemStateFactory stateFactory = stateFactory;

	private readonly IDeviceConnectionFactory connectionFactory = connectionFactory;

	private readonly IDeviceOptions options = options;

	private readonly IUsbPortMapper usbPortMapper = usbPortMapper;

	private readonly IPacketHandler packetHandler = packetHandler;

	private readonly IUsbPortRegistry portRegistry = portRegistry;

	private readonly ITtyUsage ttyUsage = ttyUsage;

	private readonly Side side = side;

	public async Task<ISubsystemState> GetNextState(CancellationToken cancellation)
	{
		string[] roots = options.UsbRoots ?? Array.Empty<string>();
		string[] usbPorts = options.UsbPorts.GetValueOrDefault(side, Array.Empty<string>());
		if (roots.Length == 0 && usbPorts.Length == 0)
		{
			return await ParkUnconfiguredSideAsync(cancellation);
		}
		logger.LogInformation("Waiting for {Side} side device to become available", side.ToLowerString());
		string text = null;
		while (text == null && !cancellation.IsCancellationRequested)
		{
			string text2 = ((roots.Length == 0) ? (await DiscoverDevicePathAsync(usbPorts, cancellation)) : (await DiscoverUnderRootsAsync(roots, cancellation)));
			text = text2;
		}
		if (text == null)
		{
			logger.LogWarning("{Side} side device discovery cancelled, retrying in 30 seconds", side.ToLowerString());
			await Task.Delay(TimeSpan.FromSeconds(30L), timeProvider, cancellation);
			return stateFactory.CreateNotConnectedState(side);
		}
		try
		{
			logger.LogInformation("Connecting to {Side} side device", side.ToLowerString());
			IDeviceConnection deviceConnection = connectionFactory.Create(side, text, packetHandler.HandlePacket);
			deviceConnection.Open(options.BootloaderBaudrate);
			logger.LogInformation("Connected to {Side} side, waiting for bootloader", side.ToLowerString());
			return stateFactory.CreateWaitingForBootloaderState(deviceConnection);
		}
		catch (Exception ex)
		{
			logger.LogError(ex, "Failed to connect to {Side} side: {Error}, retrying in 30 seconds", side.ToLowerString(), ex.Message);
			string text3 = usbPortMapper.ResolveDeviceToUsbPort(Path.GetFileName(text));
			if (text3 != null)
			{
				portRegistry.ReleaseAfterFailedProbe(text3, side);
			}
			await Task.Delay(TimeSpan.FromSeconds(30L), timeProvider, cancellation);
			return stateFactory.CreateNotConnectedState(side);
		}
	}

	private async Task<ISubsystemState> ParkUnconfiguredSideAsync(CancellationToken cancellation)
	{
		logger.LogWarning("No USB ports configured for {Side} side — skipping discovery, device unavailable", side.ToLowerString());
		await Task.Delay(Timeout.InfiniteTimeSpan, timeProvider, cancellation);
		return this;
	}

	private async Task<string?> DiscoverDevicePathAsync(string[] usbPorts, CancellationToken cancellation)
	{
		string text = side.ToLowerString();
		foreach (string text2 in usbPorts)
		{
			if (portRegistry.IsDenied(text2))
			{
				logger.LogDebug("Skipping denied port {UsbPort} for {Side}", text2, text);
				continue;
			}
			string text3 = usbPortMapper.ResolveUsbPortToDevice(text2);
			if (text3 != null)
			{
				logger.LogInformation("Device found: {Side} side on {UsbPort} -> {DevicePath}", text, text2, text3);
				return text3;
			}
		}
		logger.LogInformation("No device found for {Side} side on any of [{UsbPorts}], retrying in 30 seconds", text, string.Join(", ", usbPorts));
		await Task.Delay(TimeSpan.FromSeconds(30L), timeProvider, cancellation);
		return null;
	}

	private async Task<string?> DiscoverUnderRootsAsync(string[] roots, CancellationToken cancellation)
	{
		string text = side.ToLowerString();
		Task task = portRegistry.NextHandOffTo(side);
		IReadOnlyList<UsbSerialPort> source = usbPortMapper.ListSerialPorts();
		portRegistry.Retain(source.Select((UsbSerialPort p) => p.Port).ToArray());
		foreach (UsbSerialPort item in from p in source
			where roots.Any((string root) => p.Port.StartsWith(root + ".", StringComparison.Ordinal))
			orderby portRegistry.OwnerOf(p.Port) == side descending, portRegistry.FailedProbes(p.Port)
			select p)
		{
			if (portRegistry.IsDenied(item.Port))
			{
				continue;
			}
			if (portRegistry.OwnerOf(item.Port) != side)
			{
				int? hubPartNumber = item.HubPartNumber;
				if (hubPartNumber.HasValue)
				{
					int valueOrDefault = hubPartNumber.GetValueOrDefault();
					if (!HubLabelNamesThisSide(valueOrDefault))
					{
						continue;
					}
				}
			}
			if (ttyUsage.IsOpenByAnotherProcess(item.DevicePath))
			{
				logger.LogDebug("Skipping {UsbPort} for {Side}: {DevicePath} is open by another process", item.Port, text, item.DevicePath);
			}
			else if (portRegistry.TryClaim(item.Port, side))
			{
				logger.LogInformation("Device found: {Side} side on {UsbPort} -> {DevicePath} (under {Roots})", text, item.Port, item.DevicePath, string.Join(", ", roots));
				return item.DevicePath;
			}
		}
		logger.LogInformation("No device found for {Side} side under [{Roots}], retrying in 30 seconds or on a hand-off", text, string.Join(", ", roots));
		using CancellationTokenSource retry = CancellationTokenSource.CreateLinkedTokenSource(cancellation);
		await Task.WhenAny(Task.Delay(TimeSpan.FromSeconds(30L), timeProvider, retry.Token), task);
		retry.Cancel();
		cancellation.ThrowIfCancellationRequested();
		return null;
	}

	private bool HubLabelNamesThisSide(int hubPartNumber)
	{
		IReadOnlyDictionary<Side, int[]>? sidePartNumbers = options.SidePartNumbers;
		if (sidePartNumbers != null && sidePartNumbers.TryGetValue(side, out int[] value))
		{
			return Enumerable.Contains(value, hubPartNumber);
		}
		return false;
	}
}
