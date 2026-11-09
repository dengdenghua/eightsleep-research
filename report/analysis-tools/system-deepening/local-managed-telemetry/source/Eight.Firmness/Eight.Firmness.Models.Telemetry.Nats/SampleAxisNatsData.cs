using System.Collections.Generic;

namespace Eight.Firmness.Models.Telemetry.Nats;

public record SampleAxisNatsData(uint BaseMs, IReadOnlyList<uint?> SampleTimestampsMs);
