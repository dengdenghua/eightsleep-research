namespace Eight.Firmness.Protocol;

public static class CommandCodes
{
	public const byte DebugEvent = 7;

	public const byte SetPump = 80;

	public const byte SetSolenoid = 81;

	public const byte SetFirmness = 82;

	public const byte ConfigureControlLoop = 83;

	public const byte Calibration = 96;

	public const byte SetMode = 84;

	public const byte PressureTelemetry = 89;

	public const byte ControlTelemetry = 90;

	public const byte CurrentTelemetry = 91;

	public const byte PostureMemsTelemetry = 92;

	public const byte HealthTelemetry = 93;

	public const byte EnhancedTelemetry = 94;
}
