using System;
using System.IO;
using System.IO.Pipelines;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.DataSources;
using Eight.Audio.Exceptions;
using Eight.Audio.Models;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.Audio.Tracks;

public sealed class WavTrack(ILogger<WavTrack> logger, string fileId, string name, ITrackDataSource dataSource, int channels, int bitsPerSample, int sampleRate, int dataStartingPosition, int dataSize) : ITrack, IDisposable
{
	private readonly ILogger<WavTrack> logger = logger;

	private readonly ITrackDataSource dataSource = dataSource;

	private bool disposed;

	private const int ReadBlockSize = 4096;

	private int currentPosition;

	private Duration startPositionOffset = Duration.FromSeconds(0L);

	private Duration endPositionOffset = Duration.FromSeconds(0L);

	private readonly Duration trueDuration = Duration.FromSeconds(dataSize / (sampleRate * channels * (bitsPerSample / 8)));

	private bool pendingSeek;

	public int Channels => channels;

	public int BitsPerSample => bitsPerSample;

	public int SampleRate => sampleRate;

	public bool IsLittleEndian => true;

	public int DataStartingPosition => dataStartingPosition;

	public int DataSize => dataSize;

	public string Name => name;

	public string FileId => fileId;

	public Duration TrackLength => trueDuration - endPositionOffset - startPositionOffset;

	public Duration CurrentPosition => Duration.FromSeconds(currentPosition / (sampleRate * channels * (bitsPerSample / 8))) - startPositionOffset;

	public async Task ProvideAudio(PipeWriter writer, Duration? startPosition, Duration? endPosition, CancellationToken cancellationToken)
	{
		int num = DataStartingPosition;
		currentPosition = 0;
		if (startPosition.HasValue)
		{
			int num2 = CalculationPosition(startPosition.Value, sampleRate, bitsPerSample, channels);
			num += num2;
			currentPosition = num2;
			startPositionOffset = startPosition.Value;
		}
		int endByte = DataSize;
		if (endPosition.HasValue)
		{
			endByte = Math.Min(CalculationPosition(endPosition.Value, sampleRate, bitsPerSample, channels), DataSize);
			endPositionOffset = trueDuration - endPosition.Value;
		}
		using FileStream file = dataSource.Open();
		FlushResult flushResult = default;
		file.Seek(num, SeekOrigin.Begin);
		logger.LogDebug("requested to provide audio");
		byte[] buffer = new byte[4096];
		while (!flushResult.IsCompleted && !cancellationToken.IsCancellationRequested)
		{
			logger.LogDebug("Writer Recieved the Request");
			if (pendingSeek)
			{
				pendingSeek = false;
				file.Seek(currentPosition, SeekOrigin.Begin);
			}
			int val = endByte - currentPosition;
			int readSize = Math.Min(val, 4096);
			logger.LogDebug("Read Size: {ReadSize}", readSize);
			Memory<byte> bufferMem = buffer.AsMemory(0, readSize);
			await file.ReadExactlyAsync(bufferMem, cancellationToken);
			logger.LogDebug("Current Position: {Position}", file.Position);
			bufferMem.CopyTo(writer.GetMemory(4096));
			currentPosition += readSize;
			writer.Advance(readSize);
			flushResult = await writer.FlushAsync(cancellationToken);
			if (currentPosition >= endByte)
			{
				logger.LogInformation("Completed playing track: {Name}", Name);
				return;
			}
		}
		logger.LogInformation("Completed Writing Audio");
	}

	public void Seek(Duration position, SeekMode mode)
	{
		if (mode == SeekMode.Relative)
		{
			position += CurrentPosition;
		}
		if (position.TotalSeconds < 0.0)
		{
			currentPosition = CalculationPosition(startPositionOffset, SampleRate, bitsPerSample, channels);
		}
		else if (position > TrackLength)
		{
			currentPosition = CalculationPosition(trueDuration - endPositionOffset, SampleRate, bitsPerSample, channels);
		}
		else
		{
			currentPosition = CalculationPosition(position + startPositionOffset, SampleRate, bitsPerSample, channels);
		}
		pendingSeek = true;
	}

	internal static int CalculationPosition(Duration desiredPosition, int sampleRate, int bitsPerSample, int channels)
	{
		return (int)Math.Floor(desiredPosition.TotalSeconds * (double)sampleRate) * channels * bitsPerSample / 8;
	}

	public static WavTrack Create(ILogger<WavTrack> logger, string fileId, string name, ITrackDataSource dataSource)
	{
		using FileStream fileStream = dataSource.Open();
		byte[] array = new byte[8];
		ReadNamedChunkHeader(fileStream, "RIFF");
		fileStream.ReadExactly(array, 0, 4);
		if (Encoding.ASCII.GetString(array, 0, 4) != "WAVE")
		{
			throw new InvalidFileFormatException("This is not a properly formatted WAV file");
		}
		int num = FindChunk(fileStream, "fmt ");
		if (num < 16)
		{
			throw new InvalidFileFormatException($"Invalid format size, must be 16 bits, was {num}");
		}
		byte[] array2 = new byte[num];
		fileStream.ReadExactly(array2);
		short num2 = BitConverter.ToInt16(array2, 0);
		short num3 = BitConverter.ToInt16(array2, 2);
		int num4 = BitConverter.ToInt32(array2, 4);
		BitConverter.ToInt32(array2, 8);
		BitConverter.ToInt32(array2, 12);
		short num5 = BitConverter.ToInt16(array2, 14);
		if (num2 != 1)
		{
			throw new InvalidFileFormatException("Currently do not support non PCM compliant WAV files");
		}
		if (num5 != 8 && num5 != 16 && num5 != 24 && num5 != 32)
		{
			throw new InvalidFileFormatException($"Invalid bits per sample: {num5}");
		}
		if (num3 < 1)
		{
			throw new InvalidFileFormatException("File must have atleast one channel");
		}
		int num6 = FindChunk(fileStream, "data");
		long position = fileStream.Position;
		return new WavTrack(logger, fileId, name, dataSource, num3, num5, num4, (int)position, num6);
	}

	private static (string, int) ReadChunkHeader(FileStream stream)
	{
		byte[] array = new byte[8];
		stream.ReadExactly(array);
		string item = Encoding.ASCII.GetString(array, 0, 4);
		int item2 = BitConverter.ToInt32(array, 4);
		return (item, item2);
	}

	private static int ReadNamedChunkHeader(FileStream stream, string expectedName)
	{
		var (text, result) = ReadChunkHeader(stream);
		if (text != expectedName)
		{
			throw new InvalidFileFormatException("This is not a properly formatted WAV file, " + text + " is not " + expectedName);
		}
		return result;
	}

	private static int FindChunk(FileStream stream, string expectedName)
	{
		int num;
		while (true)
		{
			string text;
			(text, num) = ReadChunkHeader(stream);
			if (text == expectedName)
			{
				break;
			}
			stream.Seek(num, SeekOrigin.Current);
		}
		return num;
	}

	public void Dispose()
	{
		if (!disposed)
		{
			disposed = true;
			dataSource.Dispose();
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
