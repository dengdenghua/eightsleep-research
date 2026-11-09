namespace Eight.Firmness.Services.Calibration.Landing;

public sealed record LandingFitResult(int BagId, bool Success, double? A, double? Ci, double? RSquared, double? ResidualSd, int N, int Levels, string? Error);
