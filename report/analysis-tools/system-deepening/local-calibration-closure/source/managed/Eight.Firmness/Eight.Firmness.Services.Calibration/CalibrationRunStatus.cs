using System;
using System.Collections.Generic;

namespace Eight.Firmness.Services.Calibration;

public sealed record CalibrationRunStatus(CalibrationRunOutcome Outcome, string Phase, int? CurrentBagId, int BagsCompleted, int TotalBags, int ProgressPercent, TimeSpan Elapsed, TimeSpan EstimatedTimeRemaining, IReadOnlyList<string> Warnings, string? Error);
