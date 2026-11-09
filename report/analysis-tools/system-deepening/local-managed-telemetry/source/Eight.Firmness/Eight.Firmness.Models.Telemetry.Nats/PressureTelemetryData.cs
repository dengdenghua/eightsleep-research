using System.Collections.Generic;

namespace Eight.Firmness.Models.Telemetry.Nats;

public record PressureTelemetryData(List<PressureSensorNatsData> Sensors, PressureSensorNatsData Ambient);
