using System;
using Eight.DeviceApiClient;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace Eight.Capybara.DeviceApi;

public static class DeviceApiExtensions
{
	public static IServiceCollection AddTestDeviceAPIService(this IServiceCollection services, string id)
	{
		AddDeviceAPIClient(services, new TestClientId(id));
		return services;
	}

	public static IServiceCollection AddDeviceAPIService(this IServiceCollection services, string pem)
	{
		AddDeviceAPIClient(services, new CertificateClientId(pem));
		return services;
	}

	private static IServiceCollection AddDeviceAPIClient(IServiceCollection services, ClientId id)
	{
		services.AddSingleton((IServiceProvider sp) =>
		{
			IConfigurationSection section = sp.GetRequiredService<IConfiguration>().GetSection("connections");
			string uriString = section["deviceAPI"] ?? throw new InvalidOperationException("DeviceAPI endpoint not configured");
			bool value = section.GetValue<bool>("allowInsecureTls");
			return ConnectionHelpers.CreateConnection(new ConnectionOptions(new Uri(uriString), id, value), new LoggingOptions(sp.GetRequiredService<ILoggerProvider>(), null));
		});
		services.AddSingleton<ParameterParserFactory>();
		services.AddSingleton(ScopedRouter.Create);
		services.AddHostedService<DeviceAPIService>();
		return services;
	}
}
