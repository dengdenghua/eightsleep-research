using System;
using System.Reactive.Linq;
using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.StateMachine;
using Eight.Capybara.AdjustableBase;
using Eight.Capybara.Ble;
using Eight.Capybara.Ble.Characteristics;
using Eight.DBus;
using Eight.DeviceApiClient;
using Eight.Nats.State;
using Eight.Wifi;
using Eight.Wifi.Scan;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace Eight.Capybara;

public class CapybaraWorker : BackgroundService
{
	private readonly ILogger<CapybaraWorker> logger;

	private readonly IPod3Hardware podHardware;

	private readonly IAdjustableBaseProvider adjustableBaseProvider;

	private readonly ISpeakerProvider speakerProvider;

	private readonly IBleSecurityProvider bleSecurityProvider;

	private readonly Dac dac;

	private readonly Eight.Wifi.NetworkManager networkManager;

	private readonly WifiDevice wifiDevice;

	private readonly DeviceSpecialization deviceSpecialization;

	private readonly IPairingMode pairingMode;

	private readonly IDeviceStateCache<PrimingReadBody> primingStateCache;

	private readonly IDeviceStateCache<CapReadBody> capStateCache;

	private const bool StartFrozen = false;

	private const bool EnableDebugBLECharacteristics = false;

	public CapybaraWorker(ILogger<CapybaraWorker> logger, IPod3Hardware podHardware, IAdjustableBaseProvider adjustableBaseProvider, ISpeakerProvider speakerProvider, IBleSecurityProvider bleSecurityProvider, Dac dac, Eight.Wifi.NetworkManager networkManager, WifiDevice wifiDevice, DeviceSpecialization deviceSpecialization, IPairingMode pairingMode, IDeviceStateCache<PrimingReadBody> primingStateCache, IDeviceStateCache<CapReadBody> capStateCache)
	{
		this.logger = logger;
		this.podHardware = podHardware;
		this.adjustableBaseProvider = adjustableBaseProvider;
		this.speakerProvider = speakerProvider;
		this.bleSecurityProvider = bleSecurityProvider;
		this.dac = dac;
		this.networkManager = networkManager;
		this.wifiDevice = wifiDevice;
		this.deviceSpecialization = deviceSpecialization;
		this.pairingMode = pairingMode;
		this.primingStateCache = primingStateCache;
		this.capStateCache = capStateCache;
	}

	protected override async Task ExecuteAsync(CancellationToken cancellationToken)
	{
		await RunCapybara(podHardware, adjustableBaseProvider, speakerProvider, bleSecurityProvider, dac, networkManager, wifiDevice, deviceSpecialization, primingStateCache, capStateCache, cancellationToken);
	}

	private static async Task StartFrozenRebooter(IPod3Hardware pod3Hardware, CancellationToken cancellationToken)
	{
		await FrozenRebooter.Create(pod3Hardware).Run(cancellationToken);
	}

	private static async Task StartUsbHubMonitor(IPod3Hardware pod3Hardware, CancellationToken cancellationToken)
	{
		await new UsbHubMonitor(pod3Hardware).Run(cancellationToken);
	}

	private static IObservable<ButtonEvent> GetButtonEvents(IButtons buttons)
	{
		IObservable<ButtonEvent> first = from _ in buttons.Pairing.Throttle(TimeSpan.FromSeconds(5L))
			where _ == ButtonState.Down
			select ButtonEvent.Pairing;
		IObservable<ButtonEvent> second = from _ in buttons.FactoryReset.Throttle(TimeSpan.FromSeconds(10L))
			where _ == ButtonState.Down
			select ButtonEvent.FactoryReset;
		return first.Merge(second);
	}

	private async Task RunCapybara(IPod3Hardware podHardware, IAdjustableBaseProvider adjustableBaseProvider, ISpeakerProvider speakerProvider, IBleSecurityProvider bleSecurityProvider, Dac dac, Eight.Wifi.NetworkManager networkManager, WifiDevice wifiDevice, DeviceSpecialization deviceSpecialization, IDeviceStateCache<PrimingReadBody> primingStateCache, IDeviceStateCache<CapReadBody> capStateCache, CancellationToken cancellationToken = default(CancellationToken))
	{
		NetworkScanner scanner = new NetworkScanner(wifiDevice);
		NetworkStateMonitor networkStateMonitor = new NetworkStateMonitor(wifiDevice, networkManager);
		WifiSetup wifiSetup = new WifiSetup(scanner, networkManager, wifiDevice, networkStateMonitor);
		PollingDeviceState pollingDeviceState = PollingDeviceState.CreateDefault();
		GetButtonEvents(podHardware.Buttons).Subscribe((ButtonEvent e) =>
		{
			Console.WriteLine($"[button] {e}");
			if (e == ButtonEvent.Pairing)
			{
				pairingMode.EnterPairingMode();
			}
			if (e == ButtonEvent.FactoryReset)
			{
				Console.WriteLine("FactoryReset -> Rebooting...");
				LogindServiceManager.Reboot(cancellationToken).GetAwaiter().GetResult();
			}
		});
		SensorStatusHeartbeat sensorStatusHeartbeat = SensorStatusHeartbeat.Create(podHardware);
		SwUpdateProgressMonitor swUpdateProgressMonitor = new SwUpdateProgressMonitor(logger);
		Task task = new LedWorkers(podHardware.MainLed, wifiSetup, pairingMode, pollingDeviceState, sensorStatusHeartbeat, new PrimingStatus(primingStateCache), LedStateExtensions.HeatingColorFor(podHardware.HardwareInfo.Label.Generation)).LedUpdate(cancellationToken);
		Task task2 = StartFrozenRebooter(podHardware, cancellationToken);
		HardwareInfo hardwareInfo = podHardware.HardwareInfo;
		NetworkInfoWorker networkInfoWorker = new NetworkInfoWorker(wifiDevice, FileNetworkInfoWriter.Create());
		ProductInfoProvider productInfoProvider = new ProductInfoProvider(hardwareInfo, networkInfoWorker);
		_003C_003Ey__InlineArray9<Task> buffer = default;
		buffer[0] = pollingDeviceState.Run(cancellationToken);
		buffer[1] = networkInfoWorker.Run(cancellationToken);
		buffer[2] = networkStateMonitor.Run(cancellationToken);
		buffer[3] = BleWorker.BleLoop(logger, productInfoProvider, hardwareInfo.DeviceId, scanner, wifiSetup, pairingMode, adjustableBaseProvider, speakerProvider, dac, primingStateCache, capStateCache, deviceSpecialization, enableDebugCharacteristics: false, networkStateMonitor, bleSecurityProvider, swUpdateProgressMonitor, TimeProvider.System, cancellationToken);
		buffer[4] = task2;
		buffer[5] = sensorStatusHeartbeat.Run(cancellationToken);
		buffer[6] = swUpdateProgressMonitor.Run(cancellationToken);
		buffer[7] = StartUsbHubMonitor(podHardware, cancellationToken);
		buffer[8] = task;
		await Task.WhenAll(buffer);
	}
}
