using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Eight.Core;
using Eight.DBus;
using Eight.DBus.Bluez;
using Microsoft.Extensions.Logging;
using NodaTime;
using Tmds.DBus.Protocol;

namespace Eight.Speaker;

public class MinamiSpeaker(ILogger<MinamiSpeaker> logger, Device1 device, Rfcomm rfcomm) : ISpeaker, IDisposable
{
	private static readonly Duration DbusTimeout = Duration.FromSeconds(30L);

	internal const string FallbackSku = "Minami";

	private readonly Device1 device = device;

	private readonly Rfcomm rfcomm = rfcomm;

	private readonly ILogger<MinamiSpeaker> logger = logger;

	private readonly Crc16Ccitt crc = new Crc16Ccitt(InitialCrcValue.Zeros);

	private readonly SpeakerHardwareInfoCache hardwareInfo = new SpeakerHardwareInfoCache(logger, (CancellationToken _) => ReadLinkInfo(logger, device, rfcomm), (CancellationToken _) => Dbus(device.GetAliasAsync()));

	private IDisposable? watcher;

	public event SpeakerConnectedEventHandler? ConnectedChangedEvent;

	private static Task<T> Dbus<T>(Task<T> call)
	{
		return call.WithTimeout(DbusTimeout);
	}

	private static async Task Dbus(Task call)
	{
		await call.WithTimeout(DbusTimeout);
		await call;
	}

	public async Task Connect(CancellationToken cancellationToken)
	{
		await device.Connect(DBusExtensions.BrEdrConnectBudget, cancellationToken);
		watcher?.Dispose();
		watcher = await Dbus(device.WatchPropertiesChangedAsync((Exception? _, PropertyChanges<Device1Properties> changes) =>
		{
			if (changes != null && Enumerable.Contains(changes.Changed, "Connected"))
			{
				if (changes.Properties.Connected)
				{
					rfcomm.Reset();
				}
				ConnectedChangedEvent?.Invoke(this, new SpeakerConnectedEventArgs(changes.Properties.Connected));
			}
		}).AsTask());
		await rfcomm.Initialize(cancellationToken);
	}

	public async Task Disconnect(CancellationToken cancellationToken)
	{
		rfcomm.Reset();
		try
		{
			await Dbus(device.DisconnectAsync());
		}
		catch (DBusException exception)
		{
			logger.LogInformation(exception, "Speaker device already gone during Disconnect; treating as already disconnected");
		}
		catch (TimeoutException exception2)
		{
			logger.LogWarning(exception2, "Speaker Disconnect timed out on D-Bus; treating as already disconnected");
		}
	}

	public async Task<bool> IsConnected(CancellationToken cancellationToken)
	{
		try
		{
			return await Dbus(device.GetConnectedAsync());
		}
		catch (DBusException exception)
		{
			logger.LogInformation(exception, "Speaker device gone while checking connection state; treating as disconnected");
			return false;
		}
		catch (TimeoutException exception2)
		{
			logger.LogWarning(exception2, "Checking speaker connection state timed out on D-Bus; treating as disconnected");
			return false;
		}
	}

	public Task<SpeakerHardwareInfo> GetHardwareInfo(CancellationToken cancellationToken)
	{
		return hardwareInfo.Get(cancellationToken);
	}

	private static async Task<SpeakerHardwareInfo> ReadLinkInfo(ILogger logger, Device1 device, Rfcomm rfcomm)
	{
		string hardwareVersion = GetHardwareVersion(logger, rfcomm).ToString();
		string softwareVersion = ReadSoftwareVersion(logger, rfcomm).ToString();
		return new SpeakerHardwareInfo("Minami", hardwareVersion, softwareVersion, await Dbus(device.GetAddressAsync()));
	}

	internal static string SkuFromAlias(string? alias)
	{
		if (alias == null || !MinamiSpeakerFactory.IsMinamiAlias(alias))
		{
			return "Minami";
		}
		return alias;
	}

	private static int GetHardwareVersion(ILogger logger, Rfcomm rfcomm)
	{
		byte[] array = rfcomm.WriteWithResponse(new byte[3] { 92, 6, 1 }, 4);
		logger.LogTrace("GetHardwareVersion raw response: {Response}", BitConverter.ToString(array));
		return BitConverter.ToInt16(Enumerable.Reverse(array[2..4]).ToArray());
	}

	public int GetSoftwareVersion()
	{
		return ReadSoftwareVersion(logger, rfcomm);
	}

	private static int ReadSoftwareVersion(ILogger logger, Rfcomm rfcomm)
	{
		byte[] array = rfcomm.WriteWithResponse(new byte[3] { 92, 12, 1 }, 4);
		logger.LogTrace("GetSoftwareVersion raw response: {Response}", BitConverter.ToString(array));
		return BitConverter.ToInt16(Enumerable.Reverse(array[2..4]).ToArray());
	}

	public async Task<string> GetMacAddress(CancellationToken cancellationToken)
	{
		return await Dbus(device.GetAddressAsync());
	}

	public async Task<string> GetAlias(CancellationToken cancellationToken)
	{
		return await Dbus(device.GetAliasAsync());
	}

	public Task<bool> WriteFirmware(byte[] firmwareBytes, CancellationToken cancellationToken)
	{
		byte[] array = rfcomm.WriteWithResponseUpTo(new byte[2] { 128, 1 }, 9);
		int num = 0;
		foreach (byte[] item in firmwareBytes.Chunk(128))
		{
			byte[] payload = BuildOTAPayload(item);
			array = rfcomm.WriteWithResponseUpTo(payload, 9);
			logger.LogDebug("OTA payload {PayloadNumber} ({Length} bytes) -> response {Response}", num, item.Length, BitConverter.ToString(array));
			if (array[1] != 144 && array[1] != 146)
			{
				throw new Exception($"Unexpected OTA response on payload {num}: {BitConverter.ToString(array)}");
			}
			if (num % 100 == 0)
			{
				logger.LogInformation("Wrote payload {PayloadNumber}", num);
			}
			num++;
		}
		if (array[1] != 146)
		{
			rfcomm.WriteWithResponseUpTo(BuildOTAPayload(Array.Empty<byte>()), 9);
		}
		rfcomm.WriteWithoutResponse(new byte[2] { 128, 18 });
		hardwareInfo.Invalidate();
		return Task.FromResult(result: true);
	}

	public Task<bool> WriteFirmwareFota(byte[] firmware, uint version, CancellationToken cancellationToken)
	{
		hardwareInfo.Invalidate();
		return new BluetrumFotaUpdater(logger, rfcomm).Update(firmware, version, cancellationToken);
	}

	private byte[] GenerateCRC(Span<byte> data)
	{
		return BitConverter.GetBytes(crc.ComputeChecksum(data));
	}

	private byte[] BuildOTAPayload(byte[] data)
	{
		if (data.Length > 128)
		{
			throw new ArgumentException("Payload for OTA update cannot be greater than 128 bytes");
		}
		return new List<byte> { 128, 17 }.Concat(Enumerable.Reverse(BitConverter.GetBytes(data.Length)[..^1])).Concat(data).Concat(Enumerable.Reverse(GenerateCRC(data)))
			.ToArray();
	}

	public void Dispose()
	{
		watcher?.Dispose();
		rfcomm.Dispose();
	}
}
