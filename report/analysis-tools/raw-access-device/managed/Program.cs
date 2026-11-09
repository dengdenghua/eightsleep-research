using System;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Runtime.ExceptionServices;
using System.Threading.Tasks;
using Eight.Cavia;
using Eight.Config;
using Eight.Core;
using Eight.DBus.Bluez;
using Eight.Wifi;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using NetworkManager.DBus;
using NodaTime;
using Serilog;
using Serilog.Extensions.Logging;
using Tmds.DBus;
using Tmds.DBus.Protocol;

namespace Eight.Capybara;

internal class Program
{
	private static async Task Main(string[] args)
	{
		IConfigurationRoot configuration = LoadConfiguration();
		SerilogLoggerFactory hardwareLoggerFactory = new SerilogLoggerFactory(new LoggerConfiguration().ConfigureCapybaraLogging(configuration).CreateLogger());
		IPod3Hardware podHardware = Pod3Hardware.Init(hardwareLoggerFactory, (Label label) =>
		{
			string sectionKey = MachineConfig.ResolveSectionKey(configuration, label.HwRev);
			IConfigurationSection section = configuration.GetSection(sectionKey);
			if (!section.GetChildren().Any())
			{
				throw new InvalidOperationException($"No machine.json section '{sectionKey}' for hwrev '{label.HwRev}'");
			}
			Console.WriteLine("[pod3] machine.json: hwrev=" + label.HwRev + " resolved=" + sectionKey);
			UartDevice frozenPort = new UartDevice(GetValueOrThrow("frozenPort"));
			string text = GetValue("sensorPort");
			SubsystemConnections item = new SubsystemConnections(frozenPort, (text != null && text.Length > 0) ? new UartDevice(text) : null);
			PortSet portSet;
			switch (label.Generation)
			{
			case HardwareGeneration.H11:
				portSet = new PortSet.H11Ports(new UsbDevice(GetValueOrThrow("topLeftPort")), new UsbDevice(GetValueOrThrow("topRightPort")), new UsbDevice(GetValueOrThrow("bottomLeftPort")), new UsbDevice(GetValueOrThrow("bottomRightPort")));
				break;
			case HardwareGeneration.A17B:
				portSet = new PortSet.A17BPorts(new UsbDevice(GetValueOrThrow("usbAPort")), new UsbDevice(GetValueOrThrow("leftPillowPort")), new UsbDevice(GetValueOrThrow("rightPillowPort")));
				break;
			default:
			{
				string text2 = GetValue("usbAPort");
				portSet = new PortSet.LegacyPorts((text2 != null && text2.Length > 0) ? new UsbDevice(text2) : new UsbDevice("1-1"));
				break;
			}
			}
			PortSet item2 = portSet;
			return (item, item2);
			string? GetValue(string key)
			{
				return section.GetValue<string>(key);
			}
			string GetValueOrThrow(string key)
			{
				return GetValue(key) ?? throw new InvalidOperationException($"machine.json '{sectionKey}' missing required key '{key}' (hwrev {label.HwRev})");
			}
		});
		string rebootRecorderPath = configuration.GetValue<string>("paths:rebootRecorder");
		RunInfoManager runInfoManager = new RunInfoManager(await InitializeHardware(podHardware, rebootRecorderPath, "/deviceinfo"), "/deviceinfo");
		await runInfoManager.WriteRunInfo(default);
		Eight.Wifi.NetworkManager nm = Eight.Wifi.NetworkManager.FromConnection(Tmds.DBus.Connection.System, new WifiProfileFlusher(new LibcFileSync(), hardwareLoggerFactory.CreateLogger<WifiProfileFlusher>()));
		var (wifiDevice, startInPairingMode) = await InitializeConnectivityOrReboot(nm, rebootRecorderPath);
		await Host.CreateDefaultBuilder(args).UseSystemd().ConfigureAppConfiguration((IConfigurationBuilder b) =>
		{
			b.Sources.Clear();
			b.AddConfiguration(configuration);
		})
			.DisableConfigurationReload()
			.ConfigureServices(runInfoManager, podHardware, nm, wifiDevice, startInPairingMode)
			.Build()
			.RunAsync();
	}

	private static async Task<(WifiDevice WifiDevice, bool StartInPairingMode)> InitializeConnectivityOrReboot(Eight.Wifi.NetworkManager nm, string? rebootRecorderPath)
	{
		StartupRebootRecorder recorder = StartupRebootRecorder.Create(rebootRecorderPath);
		while (true)
		{
			try
			{
				WifiDevice wifiDevice;
				using (Tmds.DBus.Protocol.Connection dbusConn = await GetTempDBusConnection())
				{
					Adapter1 bluezAdapter;
					(wifiDevice, bluezAdapter) = await GetAdaptersOrReboot(nm, dbusConn, rebootRecorderPath);
					await bluezAdapter.SetPoweredAsync(value: false).WithTimeout(Duration.FromSeconds(10L));
					await Task.Delay(1000);
					await bluezAdapter.SetPoweredAsync(value: true).WithTimeout(Duration.FromSeconds(10L));
				}
				bool startInPairingMode = !(await nm.HasExistingConnection("700a7a76-2105-4f46-b1b4-c9f3c791c440").WithTimeout(Duration.FromSeconds(30L)));
				await recorder.ResetRebootCount();
				return (WifiDevice: wifiDevice, StartInPairingMode: startInPairingMode);
			}
			catch (TimeoutException ex)
			{
				Console.WriteLine("[capybara] connectivity init timed out (" + ex.Message + ")");
				await recorder.RecordNewReboot();
				int num = await recorder.GetPreviousRebootCount();
				if (num < 5)
				{
					Console.WriteLine($"[capybara] requesting reboot to clear the wedged daemon (attempt {num}/5)");
					await LogindServiceManager.Reboot(default);
					await Task.Delay(TimeSpan.FromMinutes(2L));
				}
				else
				{
					Console.WriteLine("[capybara] connectivity init still timing out after 5 reboots; retrying every 5 minutes without restarting");
					await Task.Delay(TimeSpan.FromMinutes(5L));
				}
			}
		}
	}

	private static async Task<Tmds.DBus.Protocol.Connection> GetTempDBusConnection()
	{
		Tmds.DBus.Protocol.Connection connection = new Tmds.DBus.Protocol.Connection(Tmds.DBus.Address.System);
		await connection.ConnectAsync().AsTask().WaitAsync(TimeSpan.FromSeconds(15L));
		return connection;
	}

	private static async Task<LaunchType> InitializeHardware(IPod3Hardware podHardware, string? rebootRecorderPath, string runInfoDirectory)
	{
		Console.WriteLine("[capybara] starting...");
		await InitalizeLed(podHardware).WithTimeout(Duration.FromSeconds(5L));
		await podHardware.BringUpIoBoardUsb();
		await podHardware.SetDeviceEnable(Pod3Device.IOBoard, state: true).WithTimeout(Duration.FromSeconds(5L));
		Console.WriteLine("[capybara] pod HW initialized");
		LaunchType result = default;
		try
		{
			LaunchType launchType;
			if (RunInfoManager.Exists(runInfoDirectory))
			{
				Console.WriteLine("[capybara] run_info present, skipping loopback test");
				launchType = LaunchType.Capybara;
			}
			else
			{
				launchType = await LoopbackTest.Run(podHardware, default);
			}
			await EnableGpioPeripherals(podHardware).WithTimeout(Duration.FromSeconds(10L));
			Console.WriteLine("[capybara] GPIO peripherals enabled");
			HardwareInfo hardwareInfo = podHardware.HardwareInfo;
			Console.WriteLine("[capybara] device config");
			DeviceConfig.ConfigDevice(hardwareInfo, "/persistent");
			Console.WriteLine("Running on " + Environment.MachineName);
			result = launchType;
			return result;
		}
		catch (RebootRequestedException ex)
		{
			StartupRebootRecorder recorder = StartupRebootRecorder.Create(rebootRecorderPath);
			await recorder.RecordNewReboot();
			if (await recorder.GetPreviousRebootCount() < 5)
			{
				await LogindServiceManager.Reboot(default);
			}
			ExceptionDispatchInfo.Capture((ex as Exception) ?? throw ex).Throw();
		}
		return result;
	}

	private static async Task InitalizeLed(IPod3Hardware podHardware)
	{
		await podHardware.SetDeviceEnable(Pod3Device.MainLed, state: true);
		await podHardware.MainLed.Update(new LedState.On(RgbPatterns.Pulsing, Color.Yellow));
	}

	private static async Task EnableGpioPeripherals(IPod3Hardware podHardware)
	{
		await podHardware.RebootFrozen();
		await podHardware.SetDeviceEnable(Pod3Device.FrozenComm, state: true);
		await podHardware.SetDeviceEnable(Pod3Device.SensorPower, state: true);
		await podHardware.SetDeviceEnable(Pod3Device.DebugBlue, state: true);
	}

	private static IConfigurationRoot LoadConfiguration()
	{
		ConfigurationBuilder configurationBuilder = new ConfigurationBuilder();
		bool optional = configurationBuilder.Build().EightEnvironment() == EightEnvironments.Development;
		string currentDirectory = Directory.GetCurrentDirectory();
		string basePath = (Directory.Exists(currentDirectory + "/config") ? (currentDirectory + "/config") : (currentDirectory + "/../config"));
		configurationBuilder.SetBasePath(basePath);
		configurationBuilder.AddJsonFile("default.json", optional: false, reloadOnChange: false);
		configurationBuilder.AddJsonFile("machine.json", optional);
		return configurationBuilder.Build();
	}

	private static async Task<(WifiDevice, Adapter1)> GetAdaptersOrReboot(Eight.Wifi.NetworkManager networkManager, Tmds.DBus.Protocol.Connection connection, string? rebootRecorderPath)
	{
		WifiDevice wifiDevice = await GetAdapterOrDefault(networkManager).WithTimeout(Duration.FromSeconds(30L));
		Adapter1 bluezAdapter = (await new bluezService(connection, "org.bluez").GetAdaptersAsync().WithTimeout(Duration.FromSeconds(10L))).FirstOrDefault();
		StartupRebootRecorder recorder = StartupRebootRecorder.Create(rebootRecorderPath);
		if ((object)wifiDevice != null && bluezAdapter != null)
		{
			return (wifiDevice, bluezAdapter);
		}
		await recorder.RecordNewReboot();
		if (await recorder.GetPreviousRebootCount() < 5)
		{
			await LogindServiceManager.Reboot(default);
		}
		while (true)
		{
			if ((object)wifiDevice == null)
			{
				Console.WriteLine("Could not find wlan0 adapter.");
			}
			if (bluezAdapter == null)
			{
				Console.WriteLine("Could not find hci0 adapter.");
			}
			await Task.Delay(TimeSpan.FromMinutes(1L));
		}
	}

	private static async Task<WifiDevice?> GetAdapterOrDefault(Eight.Wifi.NetworkManager networkManager)
	{
		return await (await networkManager.GetWifiDevices()).ToAsyncEnumerable().FirstOrDefaultAwaitAsync(async (WifiDevice d) => await d.Node.As<IDevice>().GetInterfaceAsync() == "wlan0");
	}
}
