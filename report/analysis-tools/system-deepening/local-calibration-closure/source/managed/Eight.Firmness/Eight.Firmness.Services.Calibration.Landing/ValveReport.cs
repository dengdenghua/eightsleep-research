using Eight.Firmness.Models.Telemetry.Enhanced;

namespace Eight.Firmness.Services.Calibration.Landing;

public readonly record struct ValveReport(uint BoardMs, ValveMotion Deflate, bool DeflateChanged, ValveMotion Inflate, bool InflateChanged);
