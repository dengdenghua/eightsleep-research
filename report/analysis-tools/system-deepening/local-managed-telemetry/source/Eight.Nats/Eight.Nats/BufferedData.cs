namespace Eight.Nats;

public readonly record struct BufferedData<TData>(long Ts, ushort Frequency, TData Data) where TData : class;
