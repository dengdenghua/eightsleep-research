using System;
using System.IO.Pipelines;
using System.Runtime.InteropServices;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;

namespace Eight.PulseAudio;

public sealed class AudioStreamWriter(ILogger<AudioStreamWriter> logger, Stream stream, PipeReader pipeReader) : IAudioStreamWriter, IDisposable
{
	private readonly ILogger<AudioStreamWriter> logger = logger;

	private readonly Stream stream = stream;

	private readonly PipeReader pipeReader = pipeReader;

	private bool disposed;

	public async Task WriteToStream(bool startPaused, ushort? startVolume, CancellationToken cancellationToken)
	{
		ThrowIfDisposed();
		GCHandle handle = GCHandle.Alloc(this);
		try
		{
			stream.Connect(startPaused);
			if (startVolume.HasValue)
			{
				stream.SetVolume(startVolume.Value);
			}
			ReadResult result = default;
			while (!result.IsCompleted && !cancellationToken.IsCancellationRequested)
			{
				logger.LogDebug("Result not completed");
				cancellationToken.ThrowIfCancellationRequested();
				int bytesRequested;
				while (!stream.RequestedData(out bytesRequested) && !cancellationToken.IsCancellationRequested)
				{
					await Task.Delay(100, cancellationToken);
				}
				int bytesWritten = 0;
				while (bytesWritten < bytesRequested)
				{
					result = await pipeReader.ReadAsync(cancellationToken);
					int num = bytesRequested - bytesWritten;
					if (num > result.Buffer.Length)
					{
						num = (int)result.Buffer.Length;
					}
					if (!stream.WriteData(result.Buffer, num, out var bytesWritten2, out var position))
					{
						throw new ArgumentException("Failed to write data");
					}
					bytesWritten += bytesWritten2;
					pipeReader.AdvanceTo(position);
				}
				await Task.Delay(1, cancellationToken);
			}
			logger.LogDebug("Result Completed");
		}
		finally
		{
			handle.Free();
		}
	}

	public void Dispose()
	{
		if (!disposed)
		{
			disposed = true;
		}
	}

	private void ThrowIfDisposed()
	{
		if (disposed)
		{
			throw new ObjectDisposedException(GetType().FullName);
		}
	}
}
