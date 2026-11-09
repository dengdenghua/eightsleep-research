using System.Collections.Generic;

namespace Eight.Firmness.Models.Telemetry.Nats;

public record ControlStateTelemetryData(List<BagStateNatsData> Bags);
