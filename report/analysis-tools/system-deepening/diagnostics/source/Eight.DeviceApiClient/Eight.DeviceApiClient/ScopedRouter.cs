using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Eight.DeviceProtocol;
using Microsoft.Extensions.DependencyInjection;

namespace Eight.DeviceApiClient;

public class ScopedRouter : IRouter
{
	private readonly IServiceProvider serviceProvider;

	private readonly IReadOnlyDictionary<string, FunctionRoute> routes;

	public ScopedRouter(IServiceProvider serviceProvider, IReadOnlyDictionary<string, FunctionRoute> routes)
	{
		this.serviceProvider = serviceProvider;
		this.routes = routes;
	}

	public async Task<Response> ExecuteRequest(Request request)
	{
		string type = request.Type;
		if (!routes.TryGetValue(type, out FunctionRoute value))
		{
			return new Response(request.Id, null, new Error("Unknown function \"" + type + "\".", null, "BadRequest"));
		}
		Response result;
		await using (AsyncServiceScope scope = serviceProvider.CreateAsyncScope())
		{
			IServiceProvider provider = scope.ServiceProvider;
			result = await value.InvokeFunction(provider, request);
		}
		return result;
	}

	public static IRouter Create(IServiceProvider serviceProvider)
	{
		return new ScopedRouter(serviceProvider, serviceProvider.GetServices<RoutesCollection>().SelectMany((RoutesCollection c) => c.Routes).ToDictionary((FunctionRoute r) => r.Name));
	}
}
