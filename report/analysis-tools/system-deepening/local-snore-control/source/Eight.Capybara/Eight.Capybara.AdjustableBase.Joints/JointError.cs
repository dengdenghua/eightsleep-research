namespace Eight.Capybara.AdjustableBase.Joints;

public enum JointError
{
	None,
	Overload,
	SpikeOverload,
	LowPowerSpikeOverload,
	Broken,
	Stalling,
	MovementSensor,
	LostTickTracking,
	HallMismatch,
	SideSync
}
