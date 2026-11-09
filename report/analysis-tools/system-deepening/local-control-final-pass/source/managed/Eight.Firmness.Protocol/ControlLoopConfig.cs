using System.Collections.Generic;

namespace Eight.Firmness.Protocol;

public sealed record ControlLoopConfig(byte Version, uint ControlIntervalMs, uint SteadyTimeRequiredMs, uint? DeflateSettleTimeMs, float ToleranceMinKpa, float ToleranceMaxKpa, float ToleranceBinWidthKpa, byte Mode, byte TelemetryProfile, IReadOnlyList<ToleranceBinConfig> ToleranceBins, IReadOnlyList<BagCompensationConfig> Bags);
