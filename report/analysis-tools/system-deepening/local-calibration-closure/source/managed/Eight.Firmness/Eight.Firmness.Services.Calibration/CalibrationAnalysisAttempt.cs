namespace Eight.Firmness.Services.Calibration;

public sealed record CalibrationAnalysisAttempt(bool Ran, CalibrationAnalyzerResult? Result, string? Error, long DurationMs);
