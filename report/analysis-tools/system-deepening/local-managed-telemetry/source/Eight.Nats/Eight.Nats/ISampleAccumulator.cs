namespace Eight.Nats;

public interface ISampleAccumulator<TTelemetry, TData> where TData : class
{
	void AccumulateRange(TTelemetry telemetry, int startIndex, int count);

	TData? Build();

	void Reset();
}
