using System.Collections.Generic;
using System.Linq;

namespace Eight.Firmness.Models.Telemetry;

public record PressureSensorData(List<double> PressureKpa, List<double> Temps)
{
	public override string ToString()
	{
		string value = string.Join(", ", PressureKpa.Select((double p) => $"{p:F2}"));
		string value2 = string.Join(", ", Temps.Select((double t) => $"{t:F2}"));
		return $"PressureKpa=[{value}], Temps=[{value2}]";
	}
}
