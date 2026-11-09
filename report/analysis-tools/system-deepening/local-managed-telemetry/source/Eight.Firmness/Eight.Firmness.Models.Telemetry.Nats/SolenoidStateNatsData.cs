using System.Collections.Generic;

namespace Eight.Firmness.Models.Telemetry.Nats;

public record SolenoidStateNatsData(uint SchemaVersion, uint UptimeMs, uint ChangedMask, IReadOnlyList<ValveStateNatsData> Valves);
