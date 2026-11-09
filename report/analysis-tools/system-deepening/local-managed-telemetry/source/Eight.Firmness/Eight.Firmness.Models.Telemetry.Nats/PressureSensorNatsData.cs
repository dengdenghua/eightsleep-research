using System.Collections.Generic;

namespace Eight.Firmness.Models.Telemetry.Nats;

public record PressureSensorNatsData(List<double> PressureKpa);
