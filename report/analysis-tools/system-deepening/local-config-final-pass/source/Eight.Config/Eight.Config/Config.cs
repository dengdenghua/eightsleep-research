using System;
using System.IO;
using Microsoft.Extensions.Configuration;

namespace Eight.Config;

public static class Config
{
	public static IConfiguration Create(IConfigurationBuilder builder)
	{
		string currentDirectory = Directory.GetCurrentDirectory();
		string text = currentDirectory + "/config";
		if (!Directory.Exists(text))
		{
			int num = currentDirectory.LastIndexOf("/src");
			if (num >= 0)
			{
				text = currentDirectory.Substring(0, num) + "/config";
			}
		}
		builder.AddEnvironmentVariables().SetBasePath(text).AddJsonFile("default.json", optional: false, reloadOnChange: false);
		switch (builder.Build().EightEnvironment())
		{
		case EightEnvironments.Production:
			builder.AddJsonFile("production.json", optional: false, reloadOnChange: false);
			break;
		case EightEnvironments.Staging:
			builder.AddJsonFile("staging.json", optional: false, reloadOnChange: false);
			break;
		case EightEnvironments.Development:
			builder.AddJsonFile("development.json", optional: false, reloadOnChange: false);
			break;
		default:
			throw new ArgumentOutOfRangeException();
		}
		return builder.Build();
	}

	public static IConfiguration Create()
	{
		return Create(new ConfigurationBuilder());
	}
}
