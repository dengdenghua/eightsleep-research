using System.Collections.Generic;
using System.Linq;
using Eight.Nats;

namespace Eight.Firmness.Models.Telemetry;

public record PressureTelemetry(string Type, int Version, long Timestamp, uint DeviceTimestampMs, ushort Frequency, List<PressureSensorData> Sensors, PressureSensorData Ambient) : ITelemetryPacket
{
	public int SampleCount => Ambient.PressureKpa.Count;

	public override string ToString()
	{
		string value = string.Join("\n    ", Sensors.Select((PressureSensorData s, int i) => $"Sensor {i}: {s}"));
		return $"Type={Type}, Version={Version}, Timestamp={Timestamp}, Frequency={Frequency}Hz, BagSensors={Sensors.Count}\n    {value}\n    Ambient: {Ambient}";
	}
}
