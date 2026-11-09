using System.Collections.Generic;

namespace Eight.Firmness.Services.Calibration.Landing;

public sealed record LandingStepResult(IReadOnlyList<LandingAction> Actions, CalibrationRunOutcome Outcome, string Phase, int? CurrentBagId, int BagsCompleted, string? Error);
