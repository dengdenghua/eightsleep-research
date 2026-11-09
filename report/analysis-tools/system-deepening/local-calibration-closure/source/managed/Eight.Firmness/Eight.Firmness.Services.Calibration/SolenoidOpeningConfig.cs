namespace Eight.Firmness.Services.Calibration;

public sealed record SolenoidOpeningConfig(uint RampIntervalMs, byte RampStepPercent, uint HoldMs, byte MaintainPercent);
