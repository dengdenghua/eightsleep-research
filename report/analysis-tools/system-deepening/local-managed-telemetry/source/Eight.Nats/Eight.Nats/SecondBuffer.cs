using NodaTime;

namespace Eight.Nats;

public sealed class SecondBuffer<TTelemetry, TData, TAccumulator>(IClock clock) where TTelemetry : ITelemetryPacket where TData : class where TAccumulator : struct, ISampleAccumulator<TTelemetry, TData>
{
	private readonly SensorTiming timing = new SensorTiming(clock);

	private long ts;

	private ushort frequency;

	private bool hasData;

	private TAccumulator accumulator;

	public bool HasData => hasData;

	public int TryEnqueue(TTelemetry telemetry, int offset = 0)
	{
		int sampleCount = telemetry.SampleCount;
		if (offset >= sampleCount)
		{
			return 0;
		}
		ushort num = telemetry.Frequency;
		if (num == 0)
		{
			return 0;
		}
		uint num2 = 1000u / (uint)num;
		if (!hasData)
		{
			timing.SelectSamplingRate(num);
		}
		for (int i = offset; i < sampleCount; i++)
		{
			uint rawSensorMillis = telemetry.DeviceTimestampMs + (uint)(int)(i * num2);
			long item = timing.GetRefMillis(rawSensorMillis).ts;
			if (hasData && item != ts)
			{
				int num3 = i - offset;
				if (num3 > 0)
				{
					accumulator.AccumulateRange(telemetry, offset, num3);
				}
				return num3;
			}
			if (!hasData)
			{
				ts = item;
				frequency = num;
				hasData = true;
			}
		}
		accumulator.AccumulateRange(telemetry, offset, sampleCount - offset);
		return sampleCount - offset;
	}

	public BufferedData<TData>? Flush()
	{
		if (!hasData)
		{
			return null;
		}
		TData val = accumulator.Build();
		if (val == null)
		{
			return null;
		}
		BufferedData<TData> value = new BufferedData<TData>(ts, frequency, val);
		Reset();
		return value;
	}

	public void Reset()
	{
		hasData = false;
		accumulator.Reset();
	}

	public void ResetAll()
	{
		Reset();
		timing.Reset();
	}
}
