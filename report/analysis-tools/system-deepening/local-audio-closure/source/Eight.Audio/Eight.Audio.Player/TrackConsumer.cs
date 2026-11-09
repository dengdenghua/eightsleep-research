using System;
using System.Collections.Generic;
using System.IO.Pipelines;
using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.Tracks;
using Eight.PulseAudio;
using Microsoft.Extensions.Logging;

namespace Eight.Audio.Player;

public class TrackConsumer(ILogger<TrackConsumer> logger, IPulseAudioFactory pulseAudioFactory, Context context, ITrack source) : ITrackConsumer
{
	private readonly ILogger<TrackConsumer> logger = logger;

	private readonly IPulseAudioFactory pulseAudioFactory = pulseAudioFactory;

	private readonly Context context = context;

	private readonly ITrack source = source;

	private Stream? stream;

	private readonly Pipe pipe = new Pipe();

	private double slope = 655.0;

	public bool Paused => stream?.Paused ?? true;

	public int? Volume
	{
		get
		{
			ushort? num = stream?.GetVolume();
			if (!num.HasValue)
			{
				return null;
			}
			return ScalePulsVolume(num.Value);
		}
	}

	public async Task Play(bool startPaused, int? startVolume, CancellationToken cancellationToken)
	{
		SampleSpec sampleSpec = pulseAudioFactory.CreateSampleSpec(source.BitsPerSample, source.SampleRate, source.Channels, source.IsLittleEndian);
		ChannelMap channelMap = CreateChannelMap(pulseAudioFactory, source.Channels);
		try
		{
			stream = pulseAudioFactory.CreateStream(context, source.Name, sampleSpec, channelMap, new Dictionary<string, string>
			{
				{ "media.role", "music" },
				{ "media.icon_name", "audio-x-generic" }
			});
			if (stream == null)
			{
				throw new ArgumentException("Failed to create a context");
			}
			using IAudioStreamWriter consumer = pulseAudioFactory.CreateAudioStreamWriter(stream, pipe.Reader);
			using CancellationTokenSource linkedTokenSource = CancellationTokenSource.CreateLinkedTokenSource(cancellationToken);
			ushort? startVolume2 = (startVolume.HasValue ? new ushort?(ScaleUserVolume(startVolume.Value)) : ((ushort?)null));
			await Task.WhenAny(source.ProvideAudio(pipe.Writer, null, null, linkedTokenSource.Token), consumer.WriteToStream(startPaused, startVolume2, linkedTokenSource.Token));
			linkedTokenSource.Cancel();
		}
		finally
		{
			logger.LogInformation("Finished playing track {Name}", source.Name);
			stream?.Dispose();
			stream = null;
		}
	}

	internal static ChannelMap CreateChannelMap(IPulseAudioFactory pulseAudioFactory, int channels)
	{
		if (channels == 2)
		{
			return pulseAudioFactory.CreateSwappedStereoChannelMap();
		}
		throw new NotImplementedException($"unknown channel mapping for {channels} channels");
	}

	public void Stop()
	{
		pipe.Reader.Complete();
	}

	public void Pause()
	{
		stream?.Pause();
	}

	public void Resume()
	{
		stream?.Resume();
	}

	public void SetVolume(int volume)
	{
		stream?.SetVolume(ScaleUserVolume(volume));
	}

	private ushort ScaleUserVolume(int desiredVolume)
	{
		return (ushort)((double)desiredVolume * slope);
	}

	private int ScalePulsVolume(ushort currentVolume)
	{
		return (int)Math.Round((double)(int)currentVolume / slope, MidpointRounding.AwayFromZero);
	}
}
