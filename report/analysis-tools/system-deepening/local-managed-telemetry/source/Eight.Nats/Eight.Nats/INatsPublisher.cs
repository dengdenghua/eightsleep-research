using System;
using System.Threading;
using System.Threading.Tasks;

namespace Eight.Nats;

public interface INatsPublisher
{
	bool IsConnected { get; }

	ValueTask PublishAsync<T>(string subject, T data, CancellationToken cancellationToken = default(CancellationToken));

	ValueTask PublishAsync(string subject, ReadOnlyMemory<byte> data, CancellationToken cancellationToken = default(CancellationToken));
}
