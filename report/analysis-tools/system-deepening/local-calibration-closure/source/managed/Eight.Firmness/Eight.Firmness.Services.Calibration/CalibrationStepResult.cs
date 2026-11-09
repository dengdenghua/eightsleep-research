using System.Collections.Generic;

namespace Eight.Firmness.Services.Calibration;

public sealed record CalibrationStepResult(IReadOnlyList<CalibrationAction> Actions, CalibrationRunStatus Status);
