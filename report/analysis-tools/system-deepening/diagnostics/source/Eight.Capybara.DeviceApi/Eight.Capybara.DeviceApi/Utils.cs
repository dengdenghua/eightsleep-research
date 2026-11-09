using System;
using System.Threading.Tasks;
using Eight.DeviceApiClient;
using Eight.DeviceProtocol;

namespace Eight.Capybara.DeviceApi;

public static class Utils
{
	public static Response CreateFailure(string message, string? classifier)
	{
		return new Response(Guid.Empty, null, new Error(message, null, classifier));
	}

	public static Task<Response> CreateFailureResult(string message, string? classifier)
	{
		return Task.FromResult(CreateFailure(message, classifier));
	}

	public static Response EmptyResponse()
	{
		return new Response(Guid.Empty, null, null);
	}

	public static Task<Response> EmptyResponseResult()
	{
		return Task.FromResult(EmptyResponse());
	}

	public static Response CreateResponse<T>(T payload)
	{
		JsonSerializer jsonSerializer = new JsonSerializer();
		return new Response(Guid.Empty, jsonSerializer.Serialize(payload), null);
	}

	public static Task<Response> CreateResponseResult<T>(T payload)
	{
		return Task.FromResult(CreateResponse(payload));
	}
}
