using System.Collections.Generic;
using Eight.Firmness.Models.Telemetry;
using Eight.Firmness.Models.Telemetry.Nats;
using Eight.Nats;

namespace Eight.Firmness.Services.Telemetry;

public struct CurrentSideAccumulator : ISampleAccumulator<CurrentTelemetry, CurrentTelemetryData>
{
	private List<double>? v12Ma;

	private List<double>? v5Ma;

	private List<double>? solenoidMa;

	private List<double>? pumpMa;

	public void AccumulateRange(CurrentTelemetry telemetry, int startIndex, int count)
	{
		if (v12Ma == null)
		{
			v12Ma = new List<double>();
			v5Ma = new List<double>();
			solenoidMa = new List<double>();
			pumpMa = new List<double>();
		}
		v12Ma.AddRange(telemetry.V12Ma.GetRange(startIndex, count));
		v5Ma.AddRange(telemetry.V5Ma.GetRange(startIndex, count));
		solenoidMa.AddRange(telemetry.SolenoidMa.GetRange(startIndex, count));
		pumpMa.AddRange(telemetry.PumpMa.GetRange(startIndex, count));
	}

	public readonly CurrentTelemetryData? Build()
	{
		if (v12Ma == null || v5Ma == null || solenoidMa == null || pumpMa == null)
		{
			return null;
		}
		return new CurrentTelemetryData(v12Ma, v5Ma, solenoidMa, pumpMa);
	}

	public void Reset()
	{
		v12Ma = null;
		v5Ma = null;
		solenoidMa = null;
		pumpMa = null;
	}
}
