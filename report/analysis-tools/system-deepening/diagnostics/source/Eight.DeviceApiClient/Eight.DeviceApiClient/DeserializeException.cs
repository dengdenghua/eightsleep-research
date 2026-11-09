using System;

namespace Eight.DeviceApiClient;

public class DeserializeException : Exception
{
	public DeserializeException(string message, Exception inner)
		: base(message, inner)
	{
	}
}
