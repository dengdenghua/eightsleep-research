using System.Collections.Generic;

namespace Eight.Firmness.Models.Telemetry.Nats;

public record CurrentTelemetryData(List<double> V12Ma, List<double> V5Ma, List<double> SolenoidMa, List<double> PumpMa);
