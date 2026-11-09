namespace Eight.Firmness.Models.Telemetry;

public enum BagFsmState : byte
{
	Off,
	Steady,
	Inflate,
	Deflate,
	HoldOpen,
	Safety,
	Fault,
	Oscillation
}
