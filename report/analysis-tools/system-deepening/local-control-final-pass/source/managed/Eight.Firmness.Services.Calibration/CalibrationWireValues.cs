namespace Eight.Firmness.Services.Calibration;

public static class CalibrationWireValues
{
	public const byte PumpEnableDisable = 0;

	public const byte PumpSetSpeed = 1;

	public const byte PumpDisabled = 0;

	public const byte PumpEnabled = 1;

	public const byte SolenoidSetState = 0;

	public const byte SolenoidSetOpeningConfig = 1;

	public const byte SolenoidSetCloseDwellConfig = 2;

	public const byte SolenoidDeflate = 0;

	public const byte SolenoidInflate = 1;

	public const byte SolenoidClosed = 0;

	public const byte SolenoidOpen = 1;

	public const byte CalibrationGet = 0;

	public const byte CalibrationSetBag = 1;

	public const byte CalibrationSave = 2;

	public const byte CalibrationClear = 3;
}
