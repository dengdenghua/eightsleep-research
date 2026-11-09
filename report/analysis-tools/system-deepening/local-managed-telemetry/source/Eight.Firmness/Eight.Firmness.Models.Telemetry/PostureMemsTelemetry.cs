using System.Collections.Generic;
using Eight.Nats;

namespace Eight.Firmness.Models.Telemetry;

public record PostureMemsTelemetry(int Version, ushort Frequency, int AdcCount, int ChannelsPerAdc, uint DeviceTimestampMs, List<PostureMemsSample> Samples) : ITelemetryPacket
{
	public int SampleCount => Samples.Count;
}
