using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using Eight.DeviceProtocol;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace Eight.DeviceApiClient;

public class FunctionRoute
{
	private readonly ILogger<FunctionRoute> logger;

	private readonly Type controllerType;

	private readonly MethodInfo methodInfo;

	private readonly IReadOnlyList<Func<Request, object>> paramParsers;

	private readonly Func<Request, object?, Task<Response>> responseSerializer;

	public string Name { get; }

	public FunctionRoute(ILogger<FunctionRoute> logger, string name, Type controllerType, MethodInfo methodInfo, IReadOnlyList<Func<Request, object>> paramParsers, Func<Request, object?, Task<Response>> responseSerializer)
	{
		this.logger = logger;
		Name = name;
		this.controllerType = controllerType;
		this.methodInfo = methodInfo;
		this.paramParsers = paramParsers;
		this.responseSerializer = responseSerializer;
	}

	public Task<Response> InvokeFunction(IServiceProvider provider, Request request)
	{
		return InvokeFunction(provider.GetRequiredService(controllerType), request);
	}

	public async Task<Response> InvokeFunction(object controller, Request request)
	{
		try
		{
			object[] parameters = paramParsers.Select((Func<Request, object> p) => p(request)).ToArray();
			object arg = methodInfo.Invoke(controller, parameters);
			return await responseSerializer(request, arg);
		}
		catch (TargetInvocationException ex)
		{
			if (ex.InnerException is ClassifiedException ex2)
			{
				logger.LogError(ex2, ex2.Message);
				return new Response(request.Id, null, new Error(ex2.Message, ex2.StackTrace, ex2.Classifier));
			}
			logger.LogError(ex.InnerException, "Exception during request processing: {Message}", ex.InnerException.Message);
			return new Response(request.Id, null, new Error(ex.InnerException.Message, ex.InnerException.StackTrace, null));
		}
		catch (ClassifiedException ex3)
		{
			logger.LogError(ex3, "Classied Exception during request processing: {Message}", ex3.Message);
			return new Response(request.Id, null, new Error(ex3.Message, ex3.StackTrace, ex3.Classifier));
		}
		catch (Exception ex4)
		{
			logger.LogError(ex4, "Unhandled Message during request processing: {Message}", ex4.Message);
			return new Response(request.Id, null, new Error(ex4.Message, ex4.StackTrace, null));
		}
	}

	public static FunctionRoute? TryCreate(ILogger<FunctionRoute> logger, ParameterParserFactory parameterParsers, Type handlerType, MethodInfo method)
	{
		ValidateMethod(method);
		FunctionHandlerAttribute functionHandlerAttribute = (FunctionHandlerAttribute)Attribute.GetCustomAttribute(method, typeof(FunctionHandlerAttribute));
		if (functionHandlerAttribute == null)
		{
			return null;
		}
		return new FunctionRoute(logger, "functions." + functionHandlerAttribute.FunctionName, handlerType, method, parameterParsers.GetParameterParsers(method), parameterParsers.GetResponseSerializer(method));
	}

	private static void ValidateMethod(MethodInfo method)
	{
		if (!method.IsPublic || method.IsStatic)
		{
			throw new NotSupportedException("Only public instance methods are supported (" + method.Name + ").");
		}
	}
}
