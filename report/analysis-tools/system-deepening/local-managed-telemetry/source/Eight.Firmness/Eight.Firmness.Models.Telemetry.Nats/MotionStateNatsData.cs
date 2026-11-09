namespace Eight.Firmness.Models.Telemetry.Nats;

public record MotionStateNatsData(uint State, float ScoreKpa, uint HoldMs, uint Holds);
