using MessagePack;

namespace Eight.DeviceProtocol;

[MessagePackObject(true)]
public record Error(string Message, string? StackTrace, string? Classifier);
