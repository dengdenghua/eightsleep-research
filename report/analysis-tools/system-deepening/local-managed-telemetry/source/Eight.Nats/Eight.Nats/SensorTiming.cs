using System;
using NodaTime;

namespace Eight.Nats;

public sealed class SensorTiming(IClock clock)
{
	private const long DriftThresholdSeconds = 3L;

	private readonly IClock clock = clock;

	private long refSensorTime;

	private uint refSensorMillis;

	private uint lastRawSensorMillis;

	private bool hasReference;

	private uint refCheckCount;

	private uint refCheckInterval;

	public void SelectSamplingRate(ushort samplingRate)
	{
		ArgumentOutOfRangeException.ThrowIfZero(samplingRate, "samplingRate");
		refCheckInterval = (uint)(2 * samplingRate);
	}

	public (long ts, uint msecOffset) GetRefMillis(uint rawSensorMillis)
	{
		if (!hasReference || ++refCheckCount >= refCheckInterval || rawSensorMillis < lastRawSensorMillis)
		{
			if (hasReference)
			{
				refCheckCount = 0u;
			}
			UpdateRefMarker(rawSensorMillis);
		}
		lastRawSensorMillis = rawSensorMillis;
		uint num = rawSensorMillis - refSensorMillis;
		long item = refSensorTime + num / 1000;
		uint item2 = num % 1000;
		return (ts: item, msecOffset: item2);
	}

	private void UpdateRefMarker(uint rawSensorMillis)
	{
		long num = clock.GetCurrentInstant().ToUnixTimeSeconds();
		if (!hasReference)
		{
			UpdateReferenceTime(num, rawSensorMillis);
			hasReference = true;
			return;
		}
		uint num2 = rawSensorMillis - refSensorMillis;
		long num3 = refSensorTime + num2 / 1000;
		if (Math.Abs(num - num3) >= 3)
		{
			UpdateReferenceTime(num, rawSensorMillis);
		}
	}

	private void UpdateReferenceTime(long curTime, uint rawSensorMillis)
	{
		refSensorTime = curTime;
		refSensorMillis = rawSensorMillis;
	}

	public void Reset()
	{
		hasReference = false;
		refCheckCount = 0u;
	}
}
