namespace Eight.Firmness.Models.Telemetry.Nats;

public record BagStateNatsData(double SetpointKpa, double CurrentPressureKpa, BagFsmState FsmState, byte SafetyReason, byte FaultReason);
