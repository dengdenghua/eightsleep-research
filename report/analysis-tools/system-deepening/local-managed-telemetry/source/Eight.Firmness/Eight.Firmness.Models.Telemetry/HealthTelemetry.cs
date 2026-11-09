using System.Collections.Generic;
using System.Linq;

namespace Eight.Firmness.Models.Telemetry;

public record HealthTelemetry(string Type, int Version, long Timestamp, uint DeviceTimestampMs, List<SolenoidTemp> SolenoidTemps, double Pump0TempC, double Pump1TempC, double AmbientTempC, double AmbientHumidityPct, ushort Pump0Rpm, ushort Pump1Rpm)
{
	public override string ToString()
	{
		string value = string.Join(", ", SolenoidTemps.Select((SolenoidTemp s) => s.ToString()));
		return $"Type={Type}, Version={Version}, Timestamp={Timestamp}, DeviceMs={DeviceTimestampMs}\n    Solenoids: [{value}]\n    Pumps: pump0={Pump0TempC:F1}°C pump1={Pump1TempC:F1}°C\n    Pump RPMs: pump0={Pump0Rpm} pump1={Pump1Rpm}\n    Ambient: {AmbientTempC:F1}°C, {AmbientHumidityPct:F0}% RH";
	}
}
