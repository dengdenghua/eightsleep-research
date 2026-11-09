namespace Eight.Firmness.Models.Telemetry.Nats;

public record CurrentSampleAxisNatsData(uint SchemaVersion, uint SampleRateHz, uint SensorCount, uint SamplesPerSensor, uint OverflowCount, SampleAxisNatsData Axis, uint LegacyFirstTimestampMs);
