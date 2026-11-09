namespace Eight.Nats.DeviceAPI;

public record DebugNatsArgs(string Endpoint, int? Offset = null, int? MaxBytes = null);
