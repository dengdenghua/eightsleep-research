namespace Eight.Firmness.Services.Calibration;

public abstract record CalibrationAction
{
	public sealed record DisableControlLoop : CalibrationAction;

	public sealed record SetPumpPower(byte PumpId, byte SpeedPercent) : CalibrationAction;

	public sealed record SetPumpEnabled(byte PumpId, bool Enabled) : CalibrationAction;

	public sealed record PinSolenoidOpeningProfile(SolenoidOpeningConfig Config) : CalibrationAction;

	public sealed record SetSolenoid(int BagId, SolenoidDirection Direction, SolenoidValveState State) : CalibrationAction;

	public sealed record CloseAllSolenoids(int TotalBagCount) : CalibrationAction;
}
