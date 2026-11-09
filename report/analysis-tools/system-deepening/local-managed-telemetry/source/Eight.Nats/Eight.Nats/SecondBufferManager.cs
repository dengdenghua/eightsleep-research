using System;
using System.Collections.Concurrent;
using NodaTime;

namespace Eight.Nats;

public static class SecondBufferManager
{
	public static void Enqueue<TTelemetry, TData, TAccumulator>(SecondBuffer<TTelemetry, TData, TAccumulator> buffer, TTelemetry telemetry, Action<BufferedData<TData>> onFlush) where TTelemetry : ITelemetryPacket where TData : class where TAccumulator : struct, ISampleAccumulator<TTelemetry, TData>
	{
		if (telemetry.Frequency == 0)
		{
			return;
		}
		int num = 0;
		while (num < telemetry.SampleCount)
		{
			int num2 = buffer.TryEnqueue(telemetry, num);
			num += num2;
			if (num < telemetry.SampleCount)
			{
				BufferedData<TData>? bufferedData = buffer.Flush();
				if (bufferedData.HasValue)
				{
					BufferedData<TData> valueOrDefault = bufferedData.GetValueOrDefault();
					onFlush(valueOrDefault);
				}
				else
				{
					buffer.Reset();
				}
			}
		}
	}

	public static void Enqueue<TTelemetry, TData, TAccumulator>(ConcurrentDictionary<string, SecondBuffer<TTelemetry, TData, TAccumulator>> buffers, IClock clock, string side, TTelemetry telemetry, Action<BufferedData<TData>> onFlush) where TTelemetry : ITelemetryPacket where TData : class where TAccumulator : struct, ISampleAccumulator<TTelemetry, TData>
	{
		Enqueue(buffers.GetOrAdd(side, (string _) => new SecondBuffer<TTelemetry, TData, TAccumulator>(clock)), telemetry, onFlush);
	}
}
