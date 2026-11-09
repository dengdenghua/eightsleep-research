using System;
using MessagePack;

namespace Eight.DeviceProtocol;

[MessagePackObject(true)]
public record Request(Guid Id, string Type, ReadOnlyMemory<byte> Payload);
