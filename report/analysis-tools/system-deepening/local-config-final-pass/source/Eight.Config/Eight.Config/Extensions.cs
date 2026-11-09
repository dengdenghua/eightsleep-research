using System;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;

namespace Eight.Config;

public static class Extensions
{
	public static EightEnvironments EightEnvironment(this IConfiguration config)
	{
		string value = config.GetValue<string>("NODE_ENV");
		if (value != null)
		{
			if (value.Equals("production", StringComparison.OrdinalIgnoreCase))
			{
				return EightEnvironments.Production;
			}
			if (value.Equals("staging", StringComparison.OrdinalIgnoreCase))
			{
				return EightEnvironments.Staging;
			}
		}
		return EightEnvironments.Development;
	}

	public static int EightApiPort(this IConfiguration config)
	{
		return config.GetValueTypeOrThrow<int>("api:port");
	}

	public static string AsString(this EightEnvironments environment)
	{
		return environment switch
		{
			EightEnvironments.Development => "development", 
			EightEnvironments.Staging => "staging", 
			EightEnvironments.Production => "production", 
			_ => throw new ArgumentOutOfRangeException("environment", environment, null), 
		};
	}

	public static T EightConfigOrEnvironment<T>(this IConfiguration config, string name, T productionDefault, T stagingDefault) where T : class
	{
		T val = config.GetValue<T>(name);
		if (val == null)
		{
			if (config.EightEnvironment() != EightEnvironments.Production)
			{
				return stagingDefault;
			}
			val = productionDefault;
		}
		return val;
	}

	public static T GetValueTypeOrThrow<T>(this IConfiguration config, string name) where T : struct
	{
		T? value = config.GetValue<T?>(name);
		if (value.HasValue)
		{
			return value.Value;
		}
		throw new EightConfigException("Configuration for '" + name + "' not found.");
	}

	public static T GetRefTypeOrThrow<T>(this IConfiguration config, string name) where T : class
	{
		return config.GetValue<T>(name) ?? throw new EightConfigException(name + " missing in config");
	}

	public static IHostBuilder UseEightConfig(this IHostBuilder builder)
	{
		return builder.ConfigureAppConfiguration((HostBuilderContext hostContext, IConfigurationBuilder configBuilder) =>
		{
			Config.Create(configBuilder);
		});
	}
}
