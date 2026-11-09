using System;
using System.Collections.Generic;
using System.Linq;
using Eight.Firmness.Services.Calibration;

namespace Eight.Firmness.Models;

public class CalibrationOptions
{
	private static readonly int[] DefaultBags = new int[4] { 0, 1, 2, 3 };

	private static readonly int[] DefaultLargeBags = new int[2] { 0, 3 };

	public int[]? Bags { get; set; }

	public int[]? LargeBags { get; set; }

	public IReadOnlyList<int> EffectiveBags => Distinct(Bags, DefaultBags);

	public IReadOnlyList<int> EffectiveLargeBags => Distinct(LargeBags, DefaultLargeBags);

	public byte PumpId { get; set; }

	public byte PumpPower { get; set; } = 100;

	public TimeSpan InflateDurationSmall { get; set; } = TimeSpan.FromSeconds(4L);

	public TimeSpan InflateDurationLarge { get; set; } = TimeSpan.FromSeconds(6L);

	public TimeSpan HoldDuration { get; set; } = TimeSpan.FromMilliseconds(1500L, 0L);

	public TimeSpan DeflatePulseSmall { get; set; } = TimeSpan.FromMilliseconds(800L, 0L);

	public TimeSpan DeflatePulseLarge { get; set; } = TimeSpan.FromMilliseconds(800L, 0L);

	public double StopInflateKpa { get; set; } = 10.0;

	public double StopDeflateKpa { get; set; } = 0.5;

	public int SegmentsUpLarge { get; set; } = 40;

	public int SegmentsDownLarge { get; set; } = 30;

	public TimeSpan DrainLarge { get; set; } = TimeSpan.FromSeconds(20L);

	public int SegmentsUpSmall { get; set; } = 30;

	public int SegmentsDownSmall { get; set; } = 20;

	public TimeSpan DrainSmall { get; set; } = TimeSpan.FromSeconds(20L);

	public TimeSpan PurgeDuration { get; set; } = TimeSpan.FromSeconds(30L);

	public TimeSpan NominalBagDuration { get; set; } = TimeSpan.FromMinutes(3L);

	public double MaxGaugeKpa { get; set; } = 15.0;

	public TimeSpan VentPulse { get; set; } = TimeSpan.FromSeconds(1L);

	public TimeSpan CeilingDrain { get; set; } = TimeSpan.FromSeconds(60L);

	public TimeSpan MaxTelemetryAge { get; set; } = TimeSpan.FromSeconds(1L);

	public TimeSpan CeilingPollInterval { get; set; } = TimeSpan.FromMilliseconds(50L, 0L);

	public TimeSpan MaxRunDuration { get; set; } = TimeSpan.FromMinutes(40L);

	public SolenoidOpeningConfig? SolenoidOpeningConfig { get; set; } = new SolenoidOpeningConfig(1u, 100, 500u, 70);

	public string NodePath { get; set; } = "node";

	public string AnalyzerScriptPath { get; set; } = "/opt/eight/lib/balloon-analyzer/scripts/analyze-calibration.js";

	public TimeSpan AnalyzerTimeout { get; set; } = TimeSpan.FromMinutes(2L);

	public CalibrationAnalyzerAuthority AnalyzerAuthority { get; set; }

	public string RunDirectory { get; set; } = "/ephemeral/calibration";

	public int RunRetentionCount { get; set; } = 3;

	public float MinCoefficientA { get; set; } = 1.1f;

	public float MaxCoefficientA { get; set; } = 3f;

	public float MinCoefficientB { get; set; } = -2f;

	public float MaxCoefficientB { get; set; } = 2f;

	public float MaxAbsCoefficientCi { get; set; } = 2f;

	public CalibrationDeflateMethod DeflateMethod { get; set; }

	public int LandingReps { get; set; } = 2;

	public TimeSpan LandingMaxDuration { get; set; } = TimeSpan.FromMinutes(45L);

	private static IReadOnlyList<int> Distinct(int[]? configured, int[] fallback)
	{
		List<int> list = new List<int>();
		list.AddRange((configured ?? fallback).Distinct());
		return new _003C_003Ez__ReadOnlyList<int>(list);
	}
}
