namespace Eight.Firmness.Models.Telemetry.Nats;

public record EnhancedBagStateNatsData(float SetpointKpa, float CurrentPressureKpa, uint FsmState, uint SafetyReason, uint FaultReason, float DepartureToleranceKpa, float DeflateRateKpaPerSec, float InflateStopTargetKpa, float DeflateStopTargetKpa, bool? MotionHeld);
