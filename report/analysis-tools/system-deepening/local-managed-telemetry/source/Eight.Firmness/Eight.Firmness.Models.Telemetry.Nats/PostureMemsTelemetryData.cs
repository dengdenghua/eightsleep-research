using System.Collections.Generic;

namespace Eight.Firmness.Models.Telemetry.Nats;

public record PostureMemsTelemetryData(List<PostureMemsSampleData> Samples);
