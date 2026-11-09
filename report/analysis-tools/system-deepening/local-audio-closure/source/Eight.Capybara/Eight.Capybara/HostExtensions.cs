using System;
using Eight.Audio;
using Eight.Capybara.AutoPairing;
using Eight.Capybara.Ble;
using Eight.Capybara.Ble.Characteristics;
using Eight.Capybara.DBus;
using Eight.Capybara.DeviceApi;
using Eight.Capybara.Extensions;
using Eight.Capybara.Firmness;
using Eight.Cavia;
using Eight.DBus;
using Eight.DeviceApiClient;
using Eight.Firmness.Extensions;
using Eight.Firmness.Models;
using Eight.Firmness.Services;
using Eight.Lsp.Subsystems.Models;
using Eight.Nats.Extensions;
using Eight.Nats.State;
using Eight.Wifi;
using Eight.Wifi.Scan;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using NodaTime;
using Serilog;
using Serilog.Events;
using Serilog.Formatting.Json;

namespace Eight.Capybara;

public static class HostExtensions
{
	private static IHostBuilder ConfigureCapybara(this IHostBuilder hostBuilder, IPod3Hardware podHardware, Eight.Wifi.NetworkManager nm, WifiDevice wifiDevice)
	{
		return hostBuilder.ConfigureServices((HostBuilderContext context, IServiceCollection services) =>
		{
			services.AddSingleton(podHardware);
			services.AddSingleton<IAdapterProvider, AdapterProvider>();
			services.AddSingleton<IBluetoothHealthProbe, BluetoothHealthProbe>();
			services.AddSingleton(wifiDevice);
			services.AddSingleton((IServiceProvider sp) => sp.GetRequiredService<IPod3Hardware>().HardwareInfo);
			services.AddSingleton((IServiceProvider sp) => sp.GetRequiredService<IPod3Hardware>().Buttons);
			services.AddHostedService<CapybaraWorker>();
			services.AddHostedButtonService();
			services.AddHostedService<FrankMonitor>();
			services.AddHostedService<BleHealthMonitorService>();
			services.AddLeakMonitoring();
			services.AddStatsd();
			services.AddPairingServices();
			services.RegisterHandlers(fullFeatures: true);
			services.AddDeviceAPIService(podHardware.HardwareInfo.DeviceCertificateChainPem);
			services.AddPodConfigurationManager();
			services.AddDBus();
			services.AddAdjustableBase();
			services.AddSpeaker();
			services.AddBleCommunication();
			services.AddFirmnessServices();
			services.PostConfigure((BalloonOptions options) =>
			{
				options.DeviceId = podHardware.HardwareInfo.DeviceId.Raw;
				string text = (options.MachineSection = MachineConfig.ResolveSectionKey(context.Configuration, podHardware.HardwareInfo.Label.HwRev));
				IConfigurationSection section = context.Configuration.GetSection(text + ":firmness:usbPortConfig");
				if (section.Exists())
				{
					UsbPortConfig usbPortConfig = new UsbPortConfig();
					section.Bind(usbPortConfig);
					options.UsbPortConfig = usbPortConfig;
				}
				string[] array = context.Configuration.GetSection(text + ":firmness:usbRoots").Get<string[]>();
				if (array != null && array.Length > 0)
				{
					options.UsbRoots = array;
				}
			});
			services.AddNatsPublisher();
			services.AddNatsMonitoring();
			services.AddAccessoryMetrics();
			services.AddDeviceStatePlane();
			services.AddDeviceStateKey("frank.frozen.priming", "frank", "frozen", (DeviceStateEnvelope env) => PrimingStateMapper.Map(env.Payload), PrimingReadBody.Fallback, null, (bool frankIsFresh) => (!frankIsFresh) ? PrimingReadBody.Fallback : PrimingReadBody.FrozenUnavailable);
			services.AddDeviceStateKey("frank.frozen.cap", "frank", "frozen", (DeviceStateEnvelope env) => CapStateMapper.Map(env.Payload), CapReadBody.Fallback);
			services.AddSingleton((IServiceProvider sp) => Dac.Create(sp.GetRequiredService<ILogger<Dac>>()));
			services.AddSingleton((IServiceProvider _) => DeviceSpecialization.FromPath("/persistent/deviceinfo"));
			services.AddSingleton<IFirmnessGate, SpecializationFirmnessGate>();
		});
	}

	private static IHostBuilder ConfigureCavia(this IHostBuilder hostBuilder, IPod3Hardware podHardware, Eight.Wifi.NetworkManager nm, WifiDevice wifiDevice)
	{
		NetworkScanner scanner = new NetworkScanner(wifiDevice);
		NetworkStateMonitor networkStateMonitor = new NetworkStateMonitor(wifiDevice, nm);
		WifiSetup wifiSetup = new WifiSetup(scanner, nm, wifiDevice, networkStateMonitor);
		return hostBuilder.ConfigureServices((IServiceCollection services) =>
		{
			services.AddSingleton(podHardware);
			services.AddSingleton(wifiSetup);
			services.AddScoped((IServiceProvider sp) => new UsbRetriever(sp.GetRequiredService<ILogger<UsbRetriever>>()));
			services.AddSingleton((IServiceProvider sp) => Dac.Create(sp.GetRequiredService<ILogger<Dac>>()));
			services.AddHostedService<CaviaService>();
			services.RegisterHandlers(fullFeatures: false);
			services.AddDeviceAPIService(podHardware.HardwareInfo.DeviceCertificateChainPem);
		});
	}

	public static IHostBuilder ConfigureServices(this IHostBuilder hostBuilder, IRunInfoManager runInfoManager, IPod3Hardware podHardware, Eight.Wifi.NetworkManager nm, WifiDevice wifiDevice, bool startInPairingMode)
	{
		PairingMode pairingMode = new PairingMode(startInPairingMode);
		hostBuilder.ConfigureServices((IServiceCollection services) =>
		{
			services.AddSerilog((IServiceProvider sp, LoggerConfiguration loggerConfiguration) =>
			{
				loggerConfiguration.ConfigureCapybaraLogging(sp.GetRequiredService<IConfiguration>());
			});
			services.AddSingleton(runInfoManager).AddSingleton((IPairingMode)pairingMode);
			services.AddSingleton(nm);
			services.AddHostedService<SystemdWatchdogService>();
		});
		return runInfoManager.LaunchType switch
		{
			LaunchType.Capybara => hostBuilder.ConfigureCapybara(podHardware, nm, wifiDevice), 
			LaunchType.Cavia => hostBuilder.ConfigureCavia(podHardware, nm, wifiDevice), 
			_ => throw new ArgumentException($"Unknown launch type: {runInfoManager.LaunchType}"), 
		};
	}

	public static LoggerConfiguration ConfigureCapybaraLogging(this LoggerConfiguration loggerConfiguration, IConfiguration configuration)
	{
		IConfigurationSection section = configuration.GetSection("logging");
		loggerConfiguration.MinimumLevel.Is(ParseLogLevel(section["minimumLevel"])).Enrich.FromLogContext().WriteTo.Console(new JsonFormatter(null, renderMessage: true)).ConfigureForNodaTime(DateTimeZoneProviders.Tzdb);
		foreach (IConfigurationSection child in section.GetSection("overrides").GetChildren())
		{
			loggerConfiguration.MinimumLevel.Override(child.Key, ParseLogLevel(child.Value));
		}
		return loggerConfiguration;
	}

	private static LogEventLevel ParseLogLevel(string? level)
	{
		switch (level?.ToLowerInvariant())
		{
		case "verbose":
			return LogEventLevel.Verbose;
		case "debug":
			return LogEventLevel.Debug;
		case "info":
		case "information":
			return LogEventLevel.Information;
		case "warning":
		case "warn":
			return LogEventLevel.Warning;
		case "error":
			return LogEventLevel.Error;
		case "fatal":
			return LogEventLevel.Fatal;
		default:
			return LogEventLevel.Information;
		}
	}
}
