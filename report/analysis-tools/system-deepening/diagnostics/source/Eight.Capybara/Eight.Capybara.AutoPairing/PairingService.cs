using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Eight.DBus;
using Eight.DBus.Bluez;
using Eight.Wifi;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.Capybara.AutoPairing;

public class PairingService(IDeviceProvider deviceProvider, Eight.Wifi.NetworkManager networkManager, IPairingMode pairingMode, ILogger<PairingService> logger)
{
	private PairingState? currentPairingState;

	private readonly SemaphoreSlim pairingSemaphore = new SemaphoreSlim(1, 1);

	private string? currentTargetDeviceId;

	private string? currentTargetSpecialization;

	private int? currentMinRssi;

	public void EnablePairingMode()
	{
		pairingMode.EnterPairingMode();
	}

	public void DisablePairingMode()
	{
		pairingMode.ExitPairingMode();
	}

	public async Task<string> StartPairingAsync(string? targetDeviceId = null, string? specialization = null, int? minRssi = null, CancellationToken cancellationToken = default(CancellationToken))
	{
		if (!(await pairingSemaphore.WaitAsync(TimeSpan.Zero, cancellationToken)))
		{
			throw new InvalidOperationException("Pairing already in progress");
		}
		try
		{
			currentTargetDeviceId = targetDeviceId;
			currentTargetSpecialization = specialization;
			currentMinRssi = minRssi;
			string pairingId = Guid.NewGuid().ToString("N");
			currentPairingState = PairingState.CreateInitial(pairingId, logger);
			Task.Run(async () =>
			{
				try
				{
					await ExecutePairingProcessAsync(pairingId, cancellationToken);
				}
				finally
				{
					pairingSemaphore.Release();
				}
			}, cancellationToken);
			return pairingId;
		}
		catch (Exception ex)
		{
			logger.LogError(ex, "[pairing] Error scheduling pairing");
			pairingSemaphore.Release();
			throw new InvalidOperationException("Error scheduling pairing", ex);
		}
	}

	public PairingState? GetPairingState()
	{
		return currentPairingState;
	}

	private async Task<Eight.Wifi.NetworkManager.NetworkCredentials> GetNetworkCredentials()
	{
		UpdateState((PairingState state) => state.WithCurrentStep(PairingStep.ReadNetworkCredentials, logger));
		Eight.Wifi.NetworkManager.NetworkCredentials networkCredentials = await networkManager.GetNetworkCredentials();
		if (networkCredentials == null || string.IsNullOrEmpty(networkCredentials.Ssid))
		{
			throw new InvalidOperationException("No WiFi credentials found");
		}
		UpdateState((PairingState state) => state.WithCompletedStep(PairingStep.ReadNetworkCredentials, logger));
		return networkCredentials;
	}

	private async Task WriteWifiCredentials(BleDevice pairingModeDevice, Eight.Wifi.NetworkManager.NetworkCredentials credentials, string? specialization)
	{
		UpdateState((PairingState state) => state.WithCurrentStep(PairingStep.SendNetworkCredentials, logger));
		if (!(await pairingModeDevice.WriteWifiCredentialsAsync(credentials.Ssid, credentials.Password, specialization ?? "pod")))
		{
			throw new InvalidOperationException("Failed to write WiFi credentials to device");
		}
		UpdateState((PairingState state) => state.WithCompletedStep(PairingStep.SendNetworkCredentials, logger));
	}

	private async Task MonitorWifiConnection(BleDevice pairingModeDevice, CancellationToken cancellationToken)
	{
		UpdateState((PairingState state) => state.WithCurrentStep(PairingStep.ValidateConnectivity, logger));
		if (!(await pairingModeDevice.MonitorWifiConnectionAsync(cancellationToken)))
		{
			throw new InvalidOperationException("Device failed to connect to WiFi");
		}
		UpdateState((PairingState state) => state.WithCompletedStep(PairingStep.ValidateConnectivity, logger));
	}

	private async Task ExecutePairingProcessAsync(string pairingId, CancellationToken cancellationToken)
	{
		using (logger.BeginScope("[pairing] {pairingId}", pairingId))
		{
			BleDevice pairingModeDevice = null;
			try
			{
				UpdateState((PairingState state) => state.WithStatus(Status.InProgress, logger));
				UpdateState((PairingState state) => state.WithCurrentStep(PairingStep.IdentifyPairingMode, logger));
				pairingModeDevice = (await FindPairingModeDeviceAsync(cancellationToken)) ?? throw new InvalidOperationException("No device in pairing mode found");
				UpdateState((PairingState state) => state.WithCompletedStep(PairingStep.IdentifyPairingMode, logger));
				string deviceId = pairingModeDevice.DeserializedProductInfo?.DeviceId;
				if (deviceId != null)
				{
					UpdateState((PairingState state) => state.WithPairedDeviceId(deviceId, logger));
				}
				await WriteWifiCredentials(pairingModeDevice, await GetNetworkCredentials(), currentTargetSpecialization);
				await MonitorWifiConnection(pairingModeDevice, cancellationToken);
				UpdateState((PairingState state) => state.MarkAsComplete(logger));
				logger.LogInformation("[pairing] completed successfully");
			}
			catch (OperationCanceledException)
			{
				UpdateState((PairingState state) => state.MarkAsFailed("Pairing process was canceled", logger));
				logger.LogInformation("[pairing] process was canceled");
			}
			catch (Exception ex2)
			{
				Exception ex3 = ex2;
				Exception ex4 = ex3;
				UpdateState((PairingState state) => state.MarkAsFailed("Pairing failed: " + ex4.Message, logger));
				logger.LogError(ex4, "[pairing] failed");
			}
			finally
			{
				pairingModeDevice?.Dispose();
			}
		}
	}

	private void UpdateState(Func<PairingState, PairingState> updateFunc)
	{
		if (currentPairingState != null)
		{
			currentPairingState = updateFunc(currentPairingState);
		}
	}

	private async Task RemovePodDevices(CancellationToken cancellation)
	{
		await foreach (Device1 item in (await deviceProvider.GetExistingDevices()).ToAsyncEnumerable().WhereAwait((Device1 device) => BleDevice.IsTargetDeviceAsync(device, logger, currentMinRssi)))
		{
			await deviceProvider.RemoveDevice(item);
		}
	}

	private Task<BleDevice?> FindPairingModeDeviceAsync(CancellationToken cancellationToken)
	{
		return Utils.DbusRetry(FindPairingModeDeviceAsyncInternal, 2, cancellationToken);
	}

	private async Task<BleDevice?> FindPairingModeDeviceAsyncInternal(CancellationToken cancellationToken)
	{
		await RemovePodDevices(cancellationToken);
		if (!string.IsNullOrEmpty(currentTargetDeviceId))
		{
			logger.LogInformation("[pairing] Looking for specific device ID: {TargetDeviceId}", currentTargetDeviceId);
		}
		IAsyncEnumerable<Device1> source = deviceProvider.ScanDevices(Duration.FromMinutes(3L), cancellationToken).WhereAwait((Device1 device) => BleDevice.IsTargetDeviceAsync(device, logger, currentMinRssi));
		await foreach (Device1 item in source.WithCancellation(cancellationToken))
		{
			BleDevice bleDevice = await BleDevice.TryConnectAndValidateAsync(item, logger, 3, Duration.FromSeconds(3L), cancellationToken);
			if (bleDevice != null)
			{
				if (string.IsNullOrEmpty(currentTargetDeviceId) || !(bleDevice.DeserializedProductInfo?.DeviceId != currentTargetDeviceId))
				{
					return bleDevice;
				}
				logger.LogInformation("[pairing] Device {Address} is {DeviceId}, not the requested {TargetDeviceId}; disconnecting", bleDevice.Address, bleDevice.DeserializedProductInfo?.DeviceId, currentTargetDeviceId);
				await bleDevice.DisconnectAsync();
			}
		}
		return null;
	}
}
