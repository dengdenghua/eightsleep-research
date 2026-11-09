using System;
using System.IO;
using Eight.Capybara.AutoPairing;
using Eight.Capybara.DeviceAPI.Handlers;
using Eight.DBus;
using Eight.DeviceApiClient;
using Eight.Firmness.Extensions;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace Eight.Capybara.Extensions;

public static class HandlerExtensions
{
	public static IServiceCollection RegisterAlarmsController(this IServiceCollection serviceCollection)
	{
		return serviceCollection;
	}

	public static IServiceCollection RegisterRemoteConnectivityController(this IServiceCollection serviceCollection)
	{
		serviceCollection.AddSingleton((IServiceProvider s) => new RemoteConnectivityService(s.GetRequiredService<ILogger<RemoteConnectivityService>>(), "remote-connectivity-api.8slp.net", new FileInfo("/run/dac/ssh_key"), s.GetRequiredService<IPairingMode>()));
		serviceCollection.AddScopedController<RemoteConnectivityController>();
		return serviceCollection;
	}

	public static IServiceCollection RegisterBedFrameController(this IServiceCollection serviceCollection)
	{
		serviceCollection.AddScopedController<AdjustableBaseController>();
		serviceCollection.AddScopedController<DebugAdjustableBaseController>();
		return serviceCollection;
	}

	public static IServiceCollection RegisterLeakController(this IServiceCollection serviceCollection)
	{
		serviceCollection.AddScopedController<LeakController>();
		return serviceCollection;
	}

	public static IServiceCollection RegisterPairingController(this IServiceCollection serviceCollection)
	{
		serviceCollection.AddPairingServices();
		serviceCollection.AddScopedController<PairingController>();
		return serviceCollection;
	}

	public static IServiceCollection RegisterSpeakerController(this IServiceCollection serviceCollection)
	{
		serviceCollection.AddScopedController<SpeakerController>();
		serviceCollection.AddScopedController<DebugSpeakerController>();
		return serviceCollection;
	}

	public static IServiceCollection RegisterHandlers(this IServiceCollection serviceCollection, bool fullFeatures)
	{
		if (fullFeatures)
		{
			serviceCollection.RegisterAlarmsController();
			serviceCollection.RegisterBedFrameController();
			serviceCollection.RegisterSpeakerController();
			serviceCollection.RegisterFirmnessController();
			serviceCollection.RegisterLeakController();
			serviceCollection.AddScopedController<DebugNetworkingController>();
		}
		serviceCollection.RegisterRemoteConnectivityController();
		serviceCollection.RegisterPairingController();
		return serviceCollection;
	}
}
