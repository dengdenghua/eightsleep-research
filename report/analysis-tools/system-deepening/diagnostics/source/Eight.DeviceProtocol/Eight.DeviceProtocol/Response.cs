using System;
using MessagePack;

namespace Eight.DeviceProtocol;

[MessagePackObject(true)]
public record Response(Guid Id, ReadOnlyMemory<byte>? Payload, Error? Exception);
