namespace Eight.Firmness.Protocol;

public sealed record BagCompensationConfig(int BagId, float InflateOffsetKpa, float DeflateMultiplier, float DeflateIntercept, float DeflateMultiplierLow, float DeflateInterceptLow, bool Enabled, float ArrivalToleranceKpa);
