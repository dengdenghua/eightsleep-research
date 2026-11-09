namespace Eight.Firmness.Services.Calibration;

public sealed record CalibrationAnalyzerRunResult(CalibrationAnalyzerOutcome Outcome, CalibrationAnalyzerResult? Result, string? Error);
