using System;
using System.Collections.Generic;
using Eight.Firmness.Models.Telemetry;

namespace Eight.Firmness.Services.Calibration.Landing;

public interface ILandingTelemetryView
{
	uint? LatestBoardMs { get; }

	DateTimeOffset? LatestSampleReceivedAt { get; }

	double MaxGaugeKpa { get; }

	(BagFsmState State, uint BoardMs)? FsmState(int bagId);

	(double Mean, double Sd, int N) Window(int bagId, uint fromMs, uint toMs);

	GaugeSample? SampleAtOrBefore(int bagId, uint boardMs);

	IReadOnlyList<ValveReport> ValveReports(int bagId, uint sinceMs);
}
