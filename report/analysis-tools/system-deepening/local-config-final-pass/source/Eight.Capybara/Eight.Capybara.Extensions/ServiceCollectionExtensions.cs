using System;
using System.IO;
using System.Threading.Channels;
using Eight.Accessory;
using Eight.Audio;
using Eight.Audio.StateMachine;
using Eight.Bedframe;
using Eight.Capybara.AdjustableBase;
using Eight.Capybara.AdjustableBase.Bases;
using Eight.Capybara.AdjustableBase.Joints;
using Eight.Capybara.Ble;
using Eight.Capybara.Ble.Characteristics;
using Eight.Capybara.Config;
using Eight.Capybara.DBus;
using Eight.Capybara.Hardware.Service;
using Eight.Capybara.Observability;
using Eight.DBus;
using Eight.DeviceApiClient;
using Eight.Firmness.Extensions;
using Eight.Keeson;
using Eight.Nats.Extensions;
using Eight.Nats.Metrics;
using Eight.Speaker;
using Eight.TriMix;
using Microsoft.AspNetCore.SignalR.Client;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Extensions.Logging;
using NodaTime;
using Tmds.DBus.Protocol;

namespace Eight.Capybara.Extensions;

public static class ServiceCollectionExtensions
{
	public static IServiceCollection AddHostedButtonService(this IServiceCollection services)
	{
		return services.AddHostedService((IServiceProvider s) => new ButtonService(s.GetRequiredService<ILogger<ButtonService>>(), s.GetRequiredService<IButtons>(), s.GetRequiredService<Dac>()));
	}

	public static IServiceCollection AddStatsd(this IServiceCollection services)
	{
		services.AddSingleton((IServiceProvider sp) => Channel.CreateUnbounded<MetricDetails>());
		services.AddSingleton((Func<IServiceProvider, IStatsd>)((IServiceProvider sp) => new StatsClient(sp.GetRequiredService<Channel<MetricDetails>>().Writer)));
		services.AddHostedService((IServiceProvider sp) => new StatsdService(sp.GetRequiredService<ILogger<StatsdService>>(), sp.GetRequiredService<HubConnection>(), sp.GetRequiredService<Channel<MetricDetails>>().Reader));
		return services;
	}

	public static IServiceCollection AddAccessoryMetrics(this IServiceCollection services)
	{
		services.AddFleetMetrics();
		services.AddHostedService((IServiceProvider sp) => new AccessoryMetricsReporter(sp.GetRequiredService<ILogger<AccessoryMetricsReporter>>(), sp.GetRequiredService<TimeProvider>(), sp.GetRequiredService<IFleetMetrics>(), sp.GetRequiredService<IAdjustableBaseProvider>(), sp.GetRequiredService<ISpeakerProvider>(), sp.GetRequiredService<IConfiguration>().GetSection("fleetMetrics").Get<AccessoryMetricsOptions>() ?? new AccessoryMetricsOptions()));
		return services;
	}

	public static IServiceCollection AddTriMixController(this IServiceCollection services)
	{
		services.AddSingleton<IAdjustableBaseFactory, AdjustableBaseFactory>();
		return services;
	}

	public static IServiceCollection AddPodConfigurationManager(this IServiceCollection services)
	{
		services.AddSingleton((IClock)SystemClock.Instance);
		services.AddSingleton(TimeProvider.System);
		services.AddSingleton((Func<IServiceProvider, IPodConfigurationManager<AdjustableBaseConfiguration>>)((IServiceProvider sp) => PodConifgurationManager<AdjustableBaseConfiguration>.Create<AdjustableBaseConfiguration>(new FileInfo("/persistent/AdjustableBaseConfiguration.json"), sp.GetRequiredService<ILogger<PodConifgurationManager<AdjustableBaseConfiguration>>>())));
		services.AddSingleton((Func<IServiceProvider, IPodConfigurationManager<SpeakerConfiguration>>)((IServiceProvider sp) => PodConifgurationManager<SpeakerConfiguration>.Create<SpeakerConfiguration>(new FileInfo("/persistent/B12Configuration.json"), sp.GetRequiredService<ILogger<PodConifgurationManager<SpeakerConfiguration>>>())));
		services.AddSingleton((Func<IServiceProvider, IPodConfigurationManager<BleConfiguration>>)((IServiceProvider sp) => PodConifgurationManager<BleConfiguration>.Create<BleConfiguration>(new FileInfo("/persistent/BleConfiguration.json"), sp.GetRequiredService<ILogger<PodConifgurationManager<BleConfiguration>>>())));
		services.AddFirmnessConfiguration("/persistent/R12.json");
		return services;
	}

	public static IServiceCollection AddAdjustableBase(this IServiceCollection services)
	{
		services.AddTriMixController();
		services.AddSingleton<IAdjustableBaseProvider, AdjustableBaseService>();
		services.AddSingleton((IServiceProvider sp) =>
		{
			TrixMixFirmwareConfiguration[] array = sp.GetRequiredService<IConfiguration>().GetSection("adjustableBase").GetSection("trimix")
				.Get<TrixMixFirmwareConfiguration[]>();
			if (array == null)
			{
				throw new ArgumentNullException("Unable to load trimix controller config");
			}
			return new TriMixUpdater(sp.GetRequiredService<ILogger<TriMixUpdater>>(), array);
		});
		services.AddSingleton((IServiceProvider sp) =>
		{
			KeesonFirmwareConfiguration[] array = sp.GetRequiredService<IConfiguration>().GetSection("adjustableBase").GetSection("keeson")
				.Get<KeesonFirmwareConfiguration[]>();
			if (array == null)
			{
				throw new ArgumentNullException("Unable to load keeson controller config");
			}
			return new KeesonUpdater(sp.GetRequiredService<ILogger<KeesonUpdater>>(), sp.GetRequiredService<IDeviceProvider>(), array);
		});
		services.AddSingleton<IFrameFactory, FrameFactory>();
		services.AddTransient<IJointTaskFactory, JointTaskFactory>();
		services.AddHostedService((IServiceProvider sp) => (AdjustableBaseService)sp.GetRequiredService<IAdjustableBaseProvider>());
		services.AddHostedService((IServiceProvider sp) => new AjustableBaseHeartBeatService(sp.GetRequiredService<ILogger<AjustableBaseHeartBeatService>>(), sp.GetRequiredService<IClock>(), sp.GetRequiredService<IAdjustableBaseProvider>(), new FileInfo("/var/volatile/tmp/AdjustableBase.heartbeat")));
		return services;
	}

	public static IServiceCollection AddDBus(this IServiceCollection services)
	{
		services.AddSingleton<IAdapterProvider, AdapterProvider>();
		services.AddSingleton<IDeviceProvider, DeviceProvider>();
		services.AddKeyedTransient<IMethodHandler, BluezAgent>("bluez-agent");
		services.AddSingleton((IServiceProvider sp) => BleStrikeCounter.Create(sp.GetRequiredService<IConfiguration>().GetValue<string>("paths:bleRecoveryReboot")));
		services.AddSingleton<IBleRecoveryEscalation, BleRecoveryEscalation>();
		services.AddSingleton<BleDiscoveryRecovery>();
		return services;
	}

	public static IServiceCollection AddLeakMonitoring(this IServiceCollection services)
	{
		services.TryAddSingleton((IClock)SystemClock.Instance);
		services.TryAddSingleton(TimeProvider.System);
		services.AddSingleton<LeakStatusProvider>();
		services.AddSingleton((Func<IServiceProvider, ILeakStatusProvider>)((IServiceProvider sp) => sp.GetRequiredService<LeakStatusProvider>()));
		services.AddHostedService<LeakMonitorService>();
		return services;
	}

	public static IServiceCollection AddBleCommunication(this IServiceCollection services)
	{
		services.AddSingleton<ICentralActivity, CentralActivityBeacon>();
		services.AddSingleton<IBleSecurityProvider, BleSecurityService>();
		services.AddHostedService((IServiceProvider sp) => (BleSecurityService)sp.GetRequiredService<IBleSecurityProvider>());
		return services;
	}
}
