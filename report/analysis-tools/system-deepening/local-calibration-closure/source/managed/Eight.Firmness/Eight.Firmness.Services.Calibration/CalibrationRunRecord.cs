using System;
using System.Collections.Generic;
using Eight.Firmness.Models;
using Eight.Firmness.Services.Calibration.Landing;
using Eight.Lsp.Subsystems.Models;

namespace Eight.Firmness.Services.Calibration;

public sealed record CalibrationRunRecord(string RunId, Side Side, DateTimeOffset StartedAt, DateTimeOffset? FinishedAt, CalibrationRunState State, IReadOnlyList<int> Bags, string CsvFileName, long DroppedSampleCount, IReadOnlyList<string> Warnings, string? Error, IReadOnlyList<BagCalibrationCoefficients>? WrittenCoefficients, CalibrationGhostResult? Ghost = null, IReadOnlyList<LandingFitResult>? LandingFits = null, CalibrationDeflateMethod? Method = null, string? PreviousCalibrationHex = null);
