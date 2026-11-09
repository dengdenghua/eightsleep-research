using System;
using System.IO.Pipelines;
using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.Models;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.Audio.Tracks;

public sealed class RepeatingTrack(ILogger<RepeatingTrack> logger, ITrack source, Duration? startLoopPosition, Duration? endLoopPosition) : ITrack, IDisposable
{
	private readonly ILogger<RepeatingTrack> logger = logger;

	private readonly ITrack source = source;

	private readonly Duration? startLoopPosition = startLoopPosition;

	private readonly Duration? endLoopPosition = endLoopPosition;

	private bool disposed;

	private Duration accumulatedDuration = Duration.FromSeconds(0L);

	public int Channels => source.Channels;

	public int BitsPerSample => source.BitsPerSample;

	public int SampleRate => source.SampleRate;

	public bool IsLittleEndian => source.IsLittleEndian;

	public int DataStartingPosition => source.DataStartingPosition;

	public int DataSize => source.DataSize;

	public string Name => source.Name;

	public string FileId => source.FileId;

	public Duration TrackLength => Duration.FromSeconds(-1L);

	public Duration CurrentPosition => accumulatedDuration + source.CurrentPosition;

	public async Task ProvideAudio(PipeWriter writer, Duration? startLoopPosition, Duration? endLoopPosition, CancellationToken cancellationToken)
	{
		ThrowIfDisposed();
		await source.ProvideAudio(writer, null, endLoopPosition ?? this.endLoopPosition, cancellationToken);
		accumulatedDuration += source.CurrentPosition;
		FlushResult flushResult = default;
		while (!cancellationToken.IsCancellationRequested && !flushResult.IsCompleted)
		{
			await source.ProvideAudio(writer, startLoopPosition ?? this.startLoopPosition, endLoopPosition ?? this.endLoopPosition, cancellationToken);
			flushResult = await writer.FlushAsync(cancellationToken);
			accumulatedDuration += source.CurrentPosition;
		}
	}

	public void Seek(Duration duration, SeekMode mode)
	{
		source.Seek(duration, mode);
	}

	public void Dispose()
	{
		if (!disposed)
		{
			disposed = true;
			source.Dispose();
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
