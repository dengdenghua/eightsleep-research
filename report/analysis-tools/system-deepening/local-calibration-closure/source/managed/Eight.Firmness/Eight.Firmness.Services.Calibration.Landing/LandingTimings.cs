using System;
using System.Collections.Generic;

namespace Eight.Firmness.Services.Calibration.Landing;

public sealed record LandingTimings
{
	public IReadOnlyList<LandingStep> Steps { get; init; } = new _003C_003Ez__ReadOnlyArray<LandingStep>(new LandingStep[4]
	{
		new LandingStep(7.25, 0.45),
		new LandingStep(3.95, 0.35),
		new LandingStep(2.35, 0.3),
		new LandingStep(1.05, 0.15)
	});

	public TimeSpan SteadyHold { get; init; } = TimeSpan.FromSeconds(8L);

	public TimeSpan SteadyWindow { get; init; } = TimeSpan.FromMilliseconds(500L, 0L);

	public TimeSpan SettleTimeout { get; init; } = TimeSpan.FromSeconds(180L);

	public TimeSpan PreBaseline { get; init; } = TimeSpan.FromSeconds(2L);

	public TimeSpan Baseline { get; init; } = TimeSpan.FromSeconds(1L);

	public TimeSpan DeflateWait { get; init; } = TimeSpan.FromSeconds(8L);

	public TimeSpan Freeze { get; init; } = TimeSpan.FromMilliseconds(6500L, 0L);

	public TimeSpan Rest { get; init; } = TimeSpan.FromSeconds(1L);

	public TimeSpan TelemetryStale { get; init; } = TimeSpan.FromSeconds(10L);

	public double CeilingKpa { get; init; } = 12.0;

	public double SeedFactor { get; init; } = 1.1;

	public double ShortSeedStep { get; init; } = 1.05;

	public int ShortRetries { get; init; } = 2;

	public double MaxSeedA { get; init; } = 3.0;

	public double AdaptiveResidualKpa { get; init; } = 0.05;

	public TimeSpan CloseDwell { get; init; } = TimeSpan.FromMilliseconds(500L, 0L);

	public TimeSpan EdgeTolerance { get; init; } = TimeSpan.FromMilliseconds(100L, 0L);

	public TimeSpan StopSampleLead { get; init; } = TimeSpan.FromMilliseconds(50L, 0L);

	public double StopTargetToleranceKpa { get; init; } = 0.02;
}
