using System.Collections.Generic;

namespace Eight.Firmness.Models.Telemetry.Nats;

public record PressureSampleAxesNatsData(uint SchemaVersion, uint SampleRateHz, uint SensorCount, uint SamplesPerSensor, uint OverflowCount, IReadOnlyList<SampleAxisNatsData> Axes, uint LegacyFirstTimestampMs);
