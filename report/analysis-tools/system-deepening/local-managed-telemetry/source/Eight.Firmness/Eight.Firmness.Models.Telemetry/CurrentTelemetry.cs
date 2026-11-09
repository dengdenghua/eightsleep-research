using System.Collections.Generic;
using System.Linq;
using Eight.Nats;

namespace Eight.Firmness.Models.Telemetry;

public record CurrentTelemetry(string Type, int Version, long Timestamp, uint DeviceTimestampMs, ushort Frequency, List<double> V12Ma, List<double> V5Ma, List<double> SolenoidMa, List<double> PumpMa) : ITelemetryPacket
{
	public int SampleCount => V12Ma.Count;

	public override string ToString()
	{
		string value = string.Join(", ", V12Ma.Select((double v) => $"{v:F2}"));
		string value2 = string.Join(", ", V5Ma.Select((double v) => $"{v:F2}"));
		string value3 = string.Join(", ", SolenoidMa.Select((double v) => $"{v:F2}"));
		string value4 = string.Join(", ", PumpMa.Select((double v) => $"{v:F2}"));
		return $"Type={Type}, Version={Version}, Timestamp={Timestamp}, Frequency={Frequency}Hz\n    V12=[{value}]mA\n    V5=[{value2}]mA\n    Solenoid=[{value3}]mA\n    Pump=[{value4}]mA";
	}
}
