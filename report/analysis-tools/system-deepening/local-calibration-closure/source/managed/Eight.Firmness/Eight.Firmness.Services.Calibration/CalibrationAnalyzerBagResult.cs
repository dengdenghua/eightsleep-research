using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace Eight.Firmness.Services.Calibration;

public sealed record CalibrationAnalyzerBagResult([property: JsonPropertyName("bag_id")] int BagId, [property: JsonPropertyName("success")] bool Success, [property: JsonPropertyName("a")] float? A, [property: JsonPropertyName("b")] float? B, [property: JsonPropertyName("b_std")] float? BStd, [property: JsonPropertyName("b_cv")] float? BCv, [property: JsonPropertyName("b_cv_warning")] string? BCvWarning, [property: JsonPropertyName("deflate_intercept")] float? DeflateIntercept, [property: JsonPropertyName("r_squared")] float? RSquared, [property: JsonPropertyName("data_points")] int DataPoints, [property: JsonPropertyName("overshoot_points")] int OvershootPoints, [property: JsonPropertyName("overshoot_values")] IReadOnlyList<float>? OvershootValues, [property: JsonPropertyName("deflate_multiplier_low")] float? DeflateMultiplierLow, [property: JsonPropertyName("deflate_intercept_low")] float? DeflateInterceptLow, [property: JsonPropertyName("error")] string? Error);
