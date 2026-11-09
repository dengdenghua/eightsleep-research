using System.Collections.Generic;
using System.Linq;
using Eight.Firmness.Models.Telemetry;
using Eight.Firmness.Models.Telemetry.Nats;
using Eight.Nats;

namespace Eight.Firmness.Services.Telemetry;

public struct PressureSideAccumulator : ISampleAccumulator<PressureTelemetry, PressureTelemetryData>
{
	private int sensorCount;

	private List<List<double>>? sensorPressures;

	private List<double>? ambientPressures;

	public void AccumulateRange(PressureTelemetry telemetry, int startIndex, int count)
	{
		if (sensorPressures == null)
		{
			sensorCount = telemetry.Sensors.Count;
			sensorPressures = new List<List<double>>(sensorCount);
			for (int i = 0; i < sensorCount; i++)
			{
				sensorPressures.Add(new List<double>());
			}
			ambientPressures = new List<double>();
		}
		for (int j = 0; j < telemetry.Sensors.Count && j < sensorCount; j++)
		{
			sensorPressures[j].AddRange(telemetry.Sensors[j].PressureKpa.GetRange(startIndex, count));
		}
		ambientPressures.AddRange(telemetry.Ambient.PressureKpa.GetRange(startIndex, count));
	}

	public readonly PressureTelemetryData? Build()
	{
		if (sensorPressures == null || ambientPressures == null)
		{
			return null;
		}
		List<PressureSensorNatsData> sensors = sensorPressures.Select((List<double> p) => new PressureSensorNatsData(p)).ToList();
		PressureSensorNatsData ambient = new PressureSensorNatsData(ambientPressures);
		return new PressureTelemetryData(sensors, ambient);
	}

	public void Reset()
	{
		sensorPressures = null;
		ambientPressures = null;
	}
}
