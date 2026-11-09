namespace Eight.Nats;

public record TelemetryEnvelope<T>(long Ts, string Type, T? Left, T? Right, int? Version = null, ushort? Freq = null) where T : class;
