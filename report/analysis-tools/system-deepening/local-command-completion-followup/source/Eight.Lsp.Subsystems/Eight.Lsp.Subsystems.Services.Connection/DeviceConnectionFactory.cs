using System;
using Eight.Core;
using Eight.Lsp.Protocol;
using Eight.Lsp.Subsystems.Models;
using Microsoft.Extensions.Logging;

namespace Eight.Lsp.Subsystems.Services.Connection;

public class DeviceConnectionFactory(ILoggerFactory loggerFactory, TimeProvider timeProvider, IPhysicalLayerFactory physicalLayerFactory) : IDeviceConnectionFactory
{
	private readonly ILoggerFactory loggerFactory = loggerFactory;

	private readonly TimeProvider timeProvider = timeProvider;

	private readonly IPhysicalLayerFactory physicalLayerFactory = physicalLayerFactory;

	public IDeviceConnection Create(Side side, string devicePath, Action<Packet, ProtocolContext>? eventHandler)
	{
		ILogger<DeviceConnection> logger = loggerFactory.CreateLogger<DeviceConnection>();
		PrefixedLogger<DeviceConnection> logger2 = new PrefixedLogger<DeviceConnection>(logger, "[" + side.ToLowerString() + "] ");
		ConnectionFactory connectionFactory = new ConnectionFactory(logger2, timeProvider);
		Func<int, int, Action<Packet>, Eight.Lsp.Protocol.Connection> createConnection = (int baud, int lenBytes, Action<Packet> packetHandler) =>
		{
			Func<IPhysicalLayer> createPhysicalLayer = () => physicalLayerFactory.Create(devicePath, baud);
			return connectionFactory.Create(createPhysicalLayer, lenBytes, packetHandler);
		};
		ProtocolContext context = new ProtocolContext
		{
			Side = side.ToLowerString()
		};
		DeviceSession<ProtocolContext> protocol = DeviceSessionFactory.Create(logger2, timeProvider, context, createConnection, new LspOptions());
		return new DeviceConnection(side, devicePath, logger, protocol, eventHandler);
	}
}
