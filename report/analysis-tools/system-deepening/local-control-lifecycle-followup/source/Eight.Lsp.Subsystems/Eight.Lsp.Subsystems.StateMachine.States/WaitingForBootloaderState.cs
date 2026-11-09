using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Eight.Lsp.Protocol.Models;
using Eight.Lsp.Subsystems.Infrastructure;
using Eight.Lsp.Subsystems.Models;
using Eight.Lsp.Subsystems.Services.Connection;
using Eight.Lsp.Subsystems.Services.Firmware;
using Microsoft.Extensions.Logging;

namespace Eight.Lsp.Subsystems.StateMachine.States;

public class WaitingForBootloaderState(ILogger<WaitingForBootloaderState> logger, ISubsystemStateFactory stateFactory, IFirmwareManager firmwareManager, IDeviceOptions options, IDeviceConnection connection, IUsbPortRegistry portRegistry, IUsbPortMapper usbPortMapper) : ISubsystemState
{
	private readonly ILogger<WaitingForBootloaderState> logger = logger;

	private readonly ISubsystemStateFactory stateFactory = stateFactory;

	private readonly IFirmwareManager firmwareManager = firmwareManager;

	private readonly IDeviceOptions options = options;

	private readonly IDeviceConnection connection = connection;

	private readonly IUsbPortRegistry portRegistry = portRegistry;

	private readonly IUsbPortMapper usbPortMapper = usbPortMapper;

	public async Task<ISubsystemState> GetNextState(CancellationToken cancellation)
	{
		logger.LogInformation("Waiting for {Side} side bootloader", connection.Side.ToLowerString());
		ISubsystemState result = default;
		object obj;
		int num;
		try
		{
			await firmwareManager.WaitForBootloader(connection, options.MaxBootloaderAttempts, options.BootloaderRetryDelay, options.StateTimeout, cancellation);
			HardwareInfo hardwareInfo = await connection.GetHwInfo(cancellation);
			if (hardwareInfo.PartNumber == 0)
			{
				logger.LogWarning("[{Side}] GetHwInfo returned error or unparseable response (label: {Label}), will retry", connection.Side.ToLowerString(), hardwareInfo.Label);
				await ReleaseCurrentPortAfterFailedProbeAsync();
				result = stateFactory.CreateErrorWaitingState(connection, TimeSpan.FromSeconds(20L));
				return result;
			}
			Side? side = OwnerByPartNumber(hardwareInfo.PartNumber);
			if (side.HasValue)
			{
				Side valueOrDefault = side.GetValueOrDefault();
				if (valueOrDefault != connection.Side)
				{
					HandCurrentPortTo(valueOrDefault, hardwareInfo);
					await connection.Close(cancellation);
					await connection.DisposeAsync();
					result = stateFactory.CreateNotConnectedState(connection.Side);
					return result;
				}
			}
			if (!IsAllowedPartNumber(hardwareInfo.PartNumber))
			{
				string text = connection.Side.ToLowerString();
				logger.LogWarning("[{Side}] Denied peripheral PN {PartNumber} (label: {Label}), denying port", text, hardwareInfo.PartNumber, hardwareInfo.Label);
				DenyCurrentPort();
				await connection.Close(cancellation);
				await connection.DisposeAsync();
				result = stateFactory.CreateNotConnectedState(connection.Side);
				return result;
			}
			byte[] array = LoadFirmwareForHardware(hardwareInfo);
			if (array != null)
			{
				result = stateFactory.CreateCheckingFirmwareState(connection, array);
				return result;
			}
			logger.LogWarning("[{Side}] No firmware configured, booting to existing firmware", connection.Side.ToLowerString());
			result = stateFactory.CreateBootingState(connection);
			return result;
		}
		catch (Exception ex)
		{
			obj = ex;
			num = 1;
		}
		if (num != 1)
		{
			return result;
		}
		Exception ex2 = (Exception)obj;
		logger.LogError(ex2, "Failed to wait for bootloader on {Side} side: {Error}", connection.Side.ToLowerString(), ex2.Message);
		await ReleaseCurrentPortAfterFailedProbeAsync();
		return stateFactory.CreateErrorWaitingState(connection, TimeSpan.FromSeconds(20L));
	}

	private bool IsAllowedPartNumber(int partNumber)
	{
		int[] allowedPartNumbers = options.AllowedPartNumbers;
		if (allowedPartNumbers == null || allowedPartNumbers.Length <= 0)
		{
			return true;
		}
		return Enumerable.Contains(options.AllowedPartNumbers, partNumber);
	}

	private Side? OwnerByPartNumber(int partNumber)
	{
		string[] usbRoots = options.UsbRoots;
		if (usbRoots == null || usbRoots.Length <= 0 || options.SidePartNumbers == null)
		{
			return null;
		}
		foreach (var (value, source) in options.SidePartNumbers)
		{
			if (Enumerable.Contains(source, partNumber))
			{
				return value;
			}
		}
		return null;
	}

	private void HandCurrentPortTo(Side owner, HardwareInfo hwInfo)
	{
		string text = usbPortMapper.ResolveDeviceToUsbPort(Path.GetFileName(connection.DevicePath));
		if (text != null)
		{
			portRegistry.Assign(text, owner);
		}
		logger.LogInformation("[{Side}] {Label} on {UsbPort} belongs to the {Owner} side, handing it over", connection.Side.ToLowerString(), hwInfo.Label, text, owner.ToLowerString());
	}

	private async Task ReleaseCurrentPortAfterFailedProbeAsync()
	{
		await connection.Close(CancellationToken.None);
		await connection.DisposeAsync();
		string text = usbPortMapper.ResolveDeviceToUsbPort(Path.GetFileName(connection.DevicePath));
		if (text != null)
		{
			portRegistry.ReleaseAfterFailedProbe(text, connection.Side);
		}
	}

	private void DenyCurrentPort()
	{
		string fileName = Path.GetFileName(connection.DevicePath);
		string text = usbPortMapper.ResolveDeviceToUsbPort(fileName);
		if (text != null)
		{
			portRegistry.Deny(text);
			logger.LogInformation("[{Side}] Port {UsbPort} permanently denied", connection.Side.ToLowerString(), text);
		}
	}

	private byte[]? LoadFirmwareForHardware(HardwareInfo hwInfo)
	{
		string text = connection.Side.ToLowerString();
		string revision = hwInfo.Revision;
		if (string.IsNullOrEmpty(revision))
		{
			logger.LogWarning("[{Side}] No hardware revision found, cannot select firmware", text);
			return null;
		}
		logger.LogInformation("[{Side}] Detected hardware revision: {Revision}", text, revision);
		string firmwarePathForRevision = options.GetFirmwarePathForRevision(revision);
		if (firmwarePathForRevision == null)
		{
			logger.LogCritical("[{Side}] No firmware mapping found for hardware revision {Revision}", text, revision);
			return null;
		}
		if (!File.Exists(firmwarePathForRevision))
		{
			logger.LogCritical("[{Side}] Firmware file not found at '{Path}' for revision {Revision}", text, firmwarePathForRevision, revision);
			return null;
		}
		logger.LogInformation("[{Side}] Loading firmware from '{Path}' for revision {Revision}", text, firmwarePathForRevision, revision);
		return File.ReadAllBytes(firmwarePathForRevision);
	}
}
