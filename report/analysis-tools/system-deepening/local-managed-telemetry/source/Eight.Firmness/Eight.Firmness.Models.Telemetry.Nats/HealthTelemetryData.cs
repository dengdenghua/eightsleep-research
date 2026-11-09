using System.Collections.Generic;

namespace Eight.Firmness.Models.Telemetry.Nats;

public record HealthTelemetryData(List<SolenoidTempNatsData> SolenoidTemps, List<double> PumpTempsC, double AmbientTempC, double AmbientHumidityPct, List<ushort> PumpRpms);
