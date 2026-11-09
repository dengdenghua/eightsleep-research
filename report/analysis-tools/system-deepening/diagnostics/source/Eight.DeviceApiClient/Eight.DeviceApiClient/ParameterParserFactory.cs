using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using Eight.DeviceProtocol;

namespace Eight.DeviceApiClient;

public class ParameterParserFactory
{
	[Serializable]
	[CompilerGenerated]
	private sealed class _003C_003Ec
	{
		public static readonly _003C_003Ec _003C_003E9 = new _003C_003Ec();

		public static Func<Request, object> _003C_003E9__11_0;

		internal object _003CGetRawParameterParser_003Eb__11_0(Request r)
		{
			return r;
		}
	}

	private readonly JsonSerializer serializer;

	public ParameterParserFactory()
	{
		serializer = new JsonSerializer();
	}

	public IReadOnlyList<Func<Request, object>> GetParameterParsers(MethodInfo method)
	{
		return method.GetParameters().Select(GetParameterParser).ToArray();
	}

	public Func<Request, object?, Task<Response>> GetResponseSerializer(MethodInfo method)
	{
		Type returnType = method.ReturnType;
		if (returnType == typeof(Task))
		{
			return VoidSerializer;
		}
		if (!returnType.IsGenericType || !(returnType.BaseType == typeof(Task)))
		{
			throw new NotSupportedException("A function handler must always return a Task.");
		}
		return GetGenericResponseSerializer(returnType);
	}

	private Func<Request, object?, Task<Response>> GetGenericResponseSerializer(Type returnType)
	{
		Type[] genericTypeArguments = returnType.GenericTypeArguments;
		if (genericTypeArguments.Length != 1)
		{
			throw new InvalidOperationException("Unexpected number of generic arguments.");
		}
		if (!(genericTypeArguments[0] == typeof(Response)))
		{
			return GetJsonSerializer(returnType);
		}
		return DirectResponseSerializer;
	}

	private async Task<Response> VoidSerializer(Request request, object? methodResult)
	{
		Task task = (Task)methodResult;
		try
		{
			await task;
			return new Response(request.Id, null, null);
		}
		catch (Exception ex)
		{
			return SerializeException(request, ex);
		}
	}

	private static async Task<Response> DirectResponseSerializer(Request request, object? methodResult)
	{
		Response response;
		try
		{
			response = await (Task<Response>)methodResult;
		}
		catch (Exception ex)
		{
			return SerializeException(request, ex);
		}
		return response with
		{
			Id = request.Id
		};
	}

	private Func<Request, object?, Task<Response>> GetJsonSerializer(Type taskType)
	{
		MethodInfo resultGetter = taskType.GetProperty("Result").GetGetMethod();
		return async (Request request, object? methodResult) =>
		{
			try
			{
				Task resultTask = (Task)methodResult;
				await resultTask;
				object obj = resultGetter.Invoke(resultTask, null);
				byte[] array = serializer.Serialize(obj);
				return new Response(request.Id, array, null);
			}
			catch (Exception ex)
			{
				return SerializeException(request, ex);
			}
		};
	}

	private static Response SerializeException(Request request, Exception ex)
	{
		if (ex is ClassifiedException)
		{
			return new Response(request.Id, null, new Error(FormatExceptionMessage(ex), ex.StackTrace, ((ClassifiedException)ex).Classifier));
		}
		return new Response(request.Id, null, new Error(FormatExceptionMessage(ex), ex.StackTrace, null));
	}

	private static string FormatExceptionMessage(Exception ex)
	{
		return ex.GetType().FullName + ": " + ex.Message;
	}

	private Func<Request, object> GetParameterParser(ParameterInfo parameter)
	{
		FunctionArgAttribute customAttribute = parameter.GetCustomAttribute<FunctionArgAttribute>();
		if (!(customAttribute is SerializedRequestArgAttribute))
		{
			if (!(customAttribute is RawRequestArgAttribute))
			{
				if (customAttribute != null)
				{
					object obj = customAttribute;
					throw new NotSupportedException("Parameter arg " + obj.GetType().Name + " is not supported");
				}
				throw new NotSupportedException("Every function argument should be marked with a FunctionArgAttribute");
			}
			return GetRawParameterParser(parameter);
		}
		return GetSerializedParameterParser(parameter);
	}

	private static Func<Request, object> GetRawParameterParser(ParameterInfo parameter)
	{
		if (!(parameter.ParameterType != typeof(Request)))
		{
			Func<Request, object> func = _003C_003Ec._003C_003E9__11_0;
			if (func == null)
			{
				return _003C_003Ec._003C_003E9__11_0 = (Request r) => r;
			}
			return func;
		}
		throw new NotSupportedException($"Parameter \"{parameter.Name}\" should be of type {typeof(Request).Name} to be marked as [{"RawRequestArgAttribute"}]");
	}

	private Func<Request, object> GetSerializedParameterParser(ParameterInfo parameter)
	{
		return (Request r) => serializer.Deserialize(parameter.ParameterType, r.Payload.Span);
	}
}
