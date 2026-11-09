namespace Eight.Nats;

public interface ITelemetryPacket
{
	uint DeviceTimestampMs { get; }

	ushort Frequency { get; }

	int SampleCount { get; }
}
