using System;
using System.Text.Json;
using System.Text.Json.Serialization;
using NodaTime;
using NodaTime.Serialization.SystemTextJson;

namespace Eight.DeviceApiClient;

public class JsonSerializer
{
	private readonly JsonSerializerOptions serializationOptions;

	public JsonSerializer()
	{
		serializationOptions = new JsonSerializerOptions
		{
			PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
			DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull,
			RespectRequiredConstructorParameters = true,
			RespectNullableAnnotations = true
		};
		serializationOptions.Converters.Add(new JsonStringEnumConverter());
		serializationOptions.ConfigureForNodaTime(DateTimeZoneProviders.Tzdb);
	}

	public object Deserialize(Type type, ReadOnlySpan<byte> payload)
	{
		try
		{
			return System.Text.Json.JsonSerializer.Deserialize(payload, type, serializationOptions);
		}
		catch (JsonException ex)
		{
			throw new DeserializeException(ex.Message, ex);
		}
	}

	public byte[] Serialize(object? obj)
	{
		return System.Text.Json.JsonSerializer.SerializeToUtf8Bytes(obj, serializationOptions);
	}
}
