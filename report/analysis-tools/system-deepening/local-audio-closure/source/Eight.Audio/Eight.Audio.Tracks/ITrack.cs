using System;
using System.IO.Pipelines;
using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.Models;
using NodaTime;

namespace Eight.Audio.Tracks;

public interface ITrack : IDisposable
{
	int Channels { get; }

	int BitsPerSample { get; }

	int SampleRate { get; }

	bool IsLittleEndian { get; }

	int DataStartingPosition { get; }

	int DataSize { get; }

	string FileId { get; }

	string Name { get; }

	Duration TrackLength { get; }

	Duration CurrentPosition { get; }

	void Seek(Duration position, SeekMode mode);

	Task ProvideAudio(PipeWriter writer, Duration? startPosition, Duration? endPosition, CancellationToken cancellationToken);
}
