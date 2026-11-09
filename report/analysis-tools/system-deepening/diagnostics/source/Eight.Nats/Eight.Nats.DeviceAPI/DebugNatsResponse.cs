namespace Eight.Nats.DeviceAPI;

public record DebugNatsResponse(string Endpoint, int TotalBytes, int Offset, int Length, bool Truncated, string ContentGzipB64);
