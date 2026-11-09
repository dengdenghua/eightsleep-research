using System;

namespace Eight.Firmness.Services.Calibration.Landing;

public sealed record LandingTrial(int BagId, int Rep, double FromKpa, double TargetKpa, double BaselineKpa, double? StopKpa, double? DeflateMs, double RestKpa, double RestSd, LandingMechanism Mechanism, bool SteadyBefore, bool InflateLeaked, double SeedA, DateTimeOffset StartedAt)
{
	public bool Fired => Mechanism != LandingMechanism.None;
}
