using System;
using Microsoft.Extensions.Logging;

namespace Eight.Lsp.Protocol;

public class ConnectionFactory(ILogger logger, TimeProvider timeProvider) : IConnectionFactory
{
	private readonly ILogger logger = logger;

	private readonly TimeProvider timeProvider = timeProvider;

	public Connection Create(Func<IPhysicalLayer> createPhysicalLayer, int lengthBytes, Action<Packet>? packetHandler = null)
	{
		return new Connection(createPhysicalLayer, lengthBytes, packetHandler, logger, timeProvider);
	}
}
