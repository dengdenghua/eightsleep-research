using System.Collections.Generic;

namespace Eight.Firmness.Services.Calibration;

public sealed record CalibrationGhostResult(bool GhostRan, bool Matched, IReadOnlyList<CalibrationGhostBagDelta> PerBagDeltas, string? GhostError, long GhostDurationMs, string Authority);
