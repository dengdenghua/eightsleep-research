using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace Eight.Firmness.Services.Calibration;

public sealed record CalibrationAnalyzerResult([property: JsonPropertyName("success")] bool Success, [property: JsonPropertyName("csv_file")] string CsvFile, [property: JsonPropertyName("bags")] IReadOnlyList<CalibrationAnalyzerBagResult> Bags);
