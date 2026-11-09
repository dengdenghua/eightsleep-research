namespace Eight.Firmness.Models.Telemetry;

public record BagState(int BagId, double SetpointKpa, double CurrentPressureKpa, BagFsmState FsmState, byte SafetyReason, byte FaultReason)
{
	public override string ToString()
	{
		return $"Bag {BagId}: {FsmState}, Setpoint={SetpointKpa:F2}kPa, Current={CurrentPressureKpa:F2}kPa, Safety={SafetyReason}, Fault={FaultReason}";
	}
}
