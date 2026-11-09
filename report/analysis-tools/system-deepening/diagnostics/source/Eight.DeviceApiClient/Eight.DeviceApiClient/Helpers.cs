using System;
using System.Linq;
using System.Reflection;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace Eight.DeviceApiClient;

public static class Helpers
{
	public static IServiceCollection AddScopedController<T>(this IServiceCollection services) where T : RequestController
	{
		services.AddScoped<T>();
		services.AddSingleton(DiscoverFunctions<T>);
		return services;
	}

	public static IServiceCollection AddTransientController<T>(this IServiceCollection services) where T : RequestController
	{
		services.AddTransient<T>();
		services.AddSingleton(DiscoverFunctions<T>);
		return services;
	}

	public static RoutesCollection DiscoverFunctions<T>(IServiceProvider services) where T : RequestController
	{
		Type controllerType = typeof(T);
		MethodInfo[] methods = controllerType.GetMethods();
		ParameterParserFactory paramFactory = services.GetRequiredService<ParameterParserFactory>();
		ILogger<FunctionRoute> logger = services.GetRequiredService<ILogger<FunctionRoute>>();
		return new RoutesCollection((from m in methods
			select FunctionRoute.TryCreate(logger, paramFactory, controllerType, m) into r
			where r != null
			select r).ToArray());
	}
}
