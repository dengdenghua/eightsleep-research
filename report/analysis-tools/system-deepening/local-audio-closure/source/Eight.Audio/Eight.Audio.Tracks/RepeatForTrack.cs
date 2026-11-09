using System;
using System.Collections.Generic;
using System.IO.Pipelines;
using System.Runtime.InteropServices;
using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.Models;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.Audio.Tracks;

public sealed class RepeatForTrack(ILogger<RepeatForTrack> logger, ITrack source, Duration? startLoopPosition, Duration? endLoopPosition, Duration runLength) : ITrack, IDisposable
{
	private readonly ILogger<RepeatForTrack> logger = logger;

	private readonly ITrack source = source;

	private bool disposed;

	private readonly Duration? startLoopPosition = startLoopPosition;

	private readonly Duration? endLoopPosition = endLoopPosition;

	private Duration accumulatedDuration = Duration.FromSeconds(0L);

	private int currentLoopIteration;

	private PlayIteration[] iterations = Array.Empty<PlayIteration>();

	public int Channels => source.Channels;

	public int BitsPerSample => source.BitsPerSample;

	public int SampleRate => source.SampleRate;

	public bool IsLittleEndian => source.IsLittleEndian;

	public int DataStartingPosition => source.DataStartingPosition;

	public int DataSize => source.DataSize;

	public string Name => source.Name;

	public string FileId => source.FileId;

	public Duration TrackLength => runLength;

	public Duration CurrentPosition => accumulatedDuration + source.CurrentPosition;

	public async Task ProvideAudio(PipeWriter writer, Duration? startPosition, Duration? endPosition, CancellationToken cancellationToken)
	{
		ThrowIfDisposed();
		currentLoopIteration = 0;
		iterations = CalculateLoopParameters(startPosition, endPosition);
		FlushResult flushResult = default;
		while (currentLoopIteration < iterations.Length && !cancellationToken.IsCancellationRequested && !flushResult.IsCompleted)
		{
			PlayIteration playIteration = iterations[currentLoopIteration];
			await source.ProvideAudio(writer, playIteration.StartPosition, playIteration.EndPosition, cancellationToken);
			flushResult = await writer.FlushAsync(cancellationToken);
			accumulatedDuration += source.CurrentPosition;
			currentLoopIteration++;
		}
	}

	private PlayIteration[] CalculateLoopParameters(Duration? startPosition, Duration? endPosition)
	{
		Duration? duration = endPosition ?? endLoopPosition;
		Duration duration2 = duration ?? source.TrackLength;
		if (runLength <= duration2)
		{
			return new PlayIteration[1]
			{
				new PlayIteration(null, runLength, runLength)
			};
		}
		Duration? duration3 = startPosition ?? startLoopPosition;
		Duration? duration4 = endPosition ?? endLoopPosition;
		Duration duration5 = (duration4 ?? source.TrackLength) - (duration3 ?? Duration.FromSeconds(0L));
		int num = 1;
		List<PlayIteration> list = new List<PlayIteration>(num);
		CollectionsMarshal.SetCount(list, num);
		Span<PlayIteration> span = CollectionsMarshal.AsSpan(list);
		int index = 0;
		span[index] = new PlayIteration(null, duration, duration2);
		List<PlayIteration> list2 = list;
		double totalSeconds = (runLength - duration2).TotalSeconds;
		int num2 = (int)Math.Floor(totalSeconds / duration5.TotalSeconds);
		for (int i = 0; i < num2; i++)
		{
			list2.Add(new PlayIteration(duration3, duration4, duration5));
		}
		Duration value = Duration.FromSeconds(totalSeconds - (double)num2 * duration5.TotalSeconds);
		list2.Add(new PlayIteration(duration3, value, value));
		return list2.ToArray();
	}

	public void Seek(Duration duration, SeekMode mode)
	{
		if (mode == SeekMode.Relative)
		{
			duration += CurrentPosition;
		}
		int i = 0;
		for (accumulatedDuration = Duration.FromSeconds(0L); i < iterations.Length; i++)
		{
			PlayIteration playIteration = iterations[0];
			if (duration < playIteration.RunLength)
			{
				break;
			}
			duration -= playIteration.RunLength;
			accumulatedDuration += playIteration.RunLength;
		}
		currentLoopIteration = i;
		source.Seek(duration, SeekMode.Absolute);
	}

	public void Dispose()
	{
		if (!disposed)
		{
			disposed = true;
			source?.Dispose();
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
