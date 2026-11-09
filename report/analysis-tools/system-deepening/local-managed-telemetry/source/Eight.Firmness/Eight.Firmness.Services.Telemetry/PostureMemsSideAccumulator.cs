using System.Collections.Generic;
using Eight.Firmness.Models.Telemetry;
using Eight.Firmness.Models.Telemetry.Nats;
using Eight.Nats;

namespace Eight.Firmness.Services.Telemetry;

public struct PostureMemsSideAccumulator : ISampleAccumulator<PostureMemsTelemetry, PostureMemsTelemetryData>
{
	private List<PostureMemsSampleData>? samples;

	public void AccumulateRange(PostureMemsTelemetry telemetry, int startIndex, int count)
	{
		if (samples == null)
		{
			samples = new List<PostureMemsSampleData>();
		}
		for (int i = startIndex; i < startIndex + count; i++)
		{
			samples.Add(new PostureMemsSampleData(telemetry.Samples[i].AdcData));
		}
	}

	public readonly PostureMemsTelemetryData? Build()
	{
		if (samples == null)
		{
			return null;
		}
		return new PostureMemsTelemetryData(samples);
	}

	public void Reset()
	{
		samples = null;
	}
}
