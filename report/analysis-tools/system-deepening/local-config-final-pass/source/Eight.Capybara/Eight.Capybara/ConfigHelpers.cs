using System.Collections.Generic;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;

namespace Eight.Capybara;

public static class ConfigHelpers
{
	public static IHostBuilder DisableConfigurationReload(this IHostBuilder builder)
	{
		return builder.ConfigureHostConfiguration((IConfigurationBuilder c) =>
		{
			c.AddInMemoryCollection(new KeyValuePair<string, string>[1]
			{
				new KeyValuePair<string, string>("hostbuilder:reloadConfigOnChange", "false")
			});
		});
	}
}
