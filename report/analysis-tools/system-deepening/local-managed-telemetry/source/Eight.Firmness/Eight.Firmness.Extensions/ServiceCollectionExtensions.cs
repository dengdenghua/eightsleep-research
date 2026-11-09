using System;
using System.IO;
using Eight.Capybara.Config;
using Eight.Core;
using Eight.Firmness.Models;
using Eight.Firmness.Repositories;
using Eight.Firmness.Services;
using Eight.Firmness.Services.Calibration;
using Eight.Firmness.Services.Commands;
using Eight.Firmness.Services.Telemetry;
using Eight.Firmness.StateMachine;
using Eight.Firmness.StateMachine.States;
using Eight.Lsp.Subsystems.Extensions;
using Eight.Lsp.Subsystems.Services;
using Eight.Lsp.Subsystems.StateMachine;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;

namespace Eight.Firmness.Extensions;

public static class ServiceCollectionExtensions
{
	public static IServiceCollection AddFirmnessServices(this IServiceCollection services, IConfiguration configuration)
	{
		services.Configure<BalloonOptions>(configuration.GetSection("firmness"));
		services.Configure<PostureOptions>(configuration.GetSection("posture"));
		services.Configure<CalibrationOptions>(configuration.GetSection("firmness:calibration"));
		return AddFirmnessServicesCore(services);
	}

	public static IServiceCollection AddFirmnessServices(this IServiceCollection services)
	{
		services.AddOptions<BalloonOptions>().Configure((BalloonOptions options, IConfiguration config) =>
		{
			config.GetSection("firmness").Bind(options);
		});
		services.AddOptions<PostureOptions>().Configure((PostureOptions options, IConfiguration config) =>
		{
			config.GetSection("posture").Bind(options);
		});
		services.AddOptions<CalibrationOptions>().Configure((CalibrationOptions options, IConfiguration config) =>
		{
			config.GetSection("firmness:calibration").Bind(options);
		});
		return AddFirmnessServicesCore(services);
	}

	public static IServiceCollection AddFirmnessServices(this IServiceCollection services, Action<BalloonOptions> configureOptions)
	{
		services.Configure(configureOptions);
		services.AddOptions<PostureOptions>();
		services.AddOptions<CalibrationOptions>();
		return AddFirmnessServicesCore(services);
	}

	private static IServiceCollection AddFirmnessServicesCore(IServiceCollection services)
	{
		services.AddSingleton((IServiceProvider sp) => sp.GetRequiredService<IOptions<BalloonOptions>>().Value);
		services.AddSingleton((IServiceProvider sp) => sp.GetRequiredService<IOptions<PostureOptions>>().Value);
		services.AddSingleton((IServiceProvider sp) => sp.GetRequiredService<IOptions<CalibrationOptions>>().Value);
		services.AddSingleton<CalibrationAnalyzerRunner>();
		services.AddSingleton((Func<IServiceProvider, ICalibrationRunStore>)((IServiceProvider sp) =>
		{
			CalibrationRunStore calibrationRunStore = new CalibrationRunStore(sp.GetRequiredService<CalibrationOptions>(), sp.GetRequiredService<ILogger<CalibrationRunStore>>());
			calibrationRunStore.MarkInterruptedRunsAtStartup();
			return calibrationRunStore;
		}));
		services.AddTransient(typeof(IThrottleLogger<>), typeof(ThrottleLogger<>));
		services.AddSubsystemServices();
		services.AddSingleton<IDeviceCommands, DeviceCommands>();
		services.AddKeyedSingleton<IPacketHandler, TelemetryHandler>("balloon");
		services.TryAddSingleton<IFirmnessGate, AlwaysAllowedFirmnessGate>();
		services.AddSingleton<FirmnessStateFactory>();
		services.AddSingleton((Func<IServiceProvider, ISubsystemStateFactory>)((IServiceProvider sp) => sp.GetRequiredService<FirmnessStateFactory>()));
		services.AddSingleton((Func<IServiceProvider, IFirmnessStateFactory>)((IServiceProvider sp) => sp.GetRequiredService<FirmnessStateFactory>()));
		services.AddSingleton<IFirmnessProvider, FirmnessService>();
		services.AddHostedService((IServiceProvider sp) => (FirmnessService)sp.GetRequiredService<IFirmnessProvider>());
		services.AddSingleton<IFirmnessPresetRepository, FirmnessPresetRepository>();
		services.AddSingleton<Func<string, string>>((string deviceId) => $"/persistent/research-data/{deviceId}/config.json");
		services.AddSingleton<IDynamicModeProvider, DynamicModeService>();
		services.AddHostedService((IServiceProvider sp) => (DynamicModeService)sp.GetRequiredService<IDynamicModeProvider>());
		return services;
	}

	public static IServiceCollection AddFirmnessConfiguration(this IServiceCollection services, string configPath)
	{
		return services.AddSingleton((Func<IServiceProvider, IPodConfigurationManager<FirmnessConfiguration>>)((IServiceProvider sp) => PodConifgurationManager<FirmnessConfiguration>.Create<FirmnessConfiguration>(new FileInfo(configPath), sp.GetRequiredService<ILogger<PodConifgurationManager<FirmnessConfiguration>>>())));
	}
}
