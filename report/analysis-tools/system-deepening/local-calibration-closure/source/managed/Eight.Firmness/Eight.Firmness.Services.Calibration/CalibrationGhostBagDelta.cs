using System.Collections.Generic;

namespace Eight.Firmness.Services.Calibration;

public sealed record CalibrationGhostBagDelta(int BagId, IReadOnlyList<CalibrationGhostFieldDelta> Fields);
