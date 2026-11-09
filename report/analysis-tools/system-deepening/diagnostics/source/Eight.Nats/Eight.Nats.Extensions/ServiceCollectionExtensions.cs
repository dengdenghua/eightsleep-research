using System;
using Eight.DeviceApiClient;
using Eight.Nats.DeviceAPI;
using Eight.Nats.Metrics;
using Eight.Nats.Monitoring;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Extensions.Logging;
using NATS.Client.Core;
using NodaTime;

namespace Eight.Nats.Extensions;

public static class ServiceCollectionExtensions
{
	public static IServiceCollection AddNatsPublisher(this IServiceCollection services)
	{
		services.AddSingleton((IServiceProvider sp) =>
		{
			IConfiguration requiredService = sp.GetRequiredService<IConfiguration>();
			string url = requiredService["nats:url"] ?? throw new InvalidOperationException("nats:url configuration is required");
			string streamName = requiredService["nats:streamName"];
			return new NatsPublisher(sp.GetRequiredService<ILogger<NatsPublisher>>(), sp.GetRequiredService<TimeProvider>(), new NatsOpts
			{
				Url = url,
				ConnectTimeout = TimeSpan.FromSeconds(10L)
			}, streamName);
		});
		services.AddSingleton((Func<IServiceProvider, INatsPublisher>)((IServiceProvider sp) => sp.GetRequiredService<NatsPublisher>()));
		services.AddHostedService<NatsHostedService>();
		return services;
	}

	public static IServiceCollection AddFleetMetrics(this IServiceCollection services)
	{
		services.TryAddSingleton((IClock)SystemClock.Instance);
		services.TryAddSingleton(TimeProvider.System);
		services.AddSingleton((IServiceProvider sp) =>
		{
			string url = sp.GetRequiredService<IConfiguration>()["nats:url"] ?? throw new InvalidOperationException("nats:url configuration is required");
			return new NatsCoreMetricsTransport(new NatsOpts
			{
				Url = url,
				Name = "capybara-metrics",
				ConnectTimeout = TimeSpan.FromSeconds(2L)
			});
		});
		services.AddSingleton((Func<IServiceProvider, IMetricsTransport>)((IServiceProvider sp) => sp.GetRequiredService<NatsCoreMetricsTransport>()));
		services.AddSingleton((IServiceProvider sp) =>
		{
			string text = sp.GetRequiredService<IConfiguration>()["nats:metricsSubject"];
			return new NatsFleetMetrics(sp.GetRequiredService<ILogger<NatsFleetMetrics>>(), sp.GetRequiredService<IClock>(), sp.GetRequiredService<TimeProvider>(), sp.GetRequiredService<IMetricsTransport>(), string.IsNullOrWhiteSpace(text) ? "metrics" : text);
		});
		services.AddSingleton((Func<IServiceProvider, IFleetMetrics>)((IServiceProvider sp) => sp.GetRequiredService<NatsFleetMetrics>()));
		services.AddHostedService((IServiceProvider sp) => sp.GetRequiredService<NatsFleetMetrics>());
		return services;
	}

	public static IServiceCollection AddNatsMonitoring(this IServiceCollection services)
	{
		services.AddSingleton((Func<IServiceProvider, INatsMonitoringClient>)((IServiceProvider sp) => new NatsMonitoringClient(sp.GetRequiredService<IConfiguration>()["nats:monitoringUrl"] ?? throw new InvalidOperationException("nats:monitoringUrl configuration is required"))));
		services.AddScopedController<DebugNatsController>();
		return services;
	}
}
