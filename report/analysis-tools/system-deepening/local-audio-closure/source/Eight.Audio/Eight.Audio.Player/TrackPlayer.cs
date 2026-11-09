using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.Models;
using Eight.Audio.Tracks;
using Eight.PulseAudio;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.Audio.Player;

public sealed class TrackPlayer(ILogger<TrackPlayer> logger, IPulseAudioFactory pulseAudioFactory, ITrackConsumerFactory trackConsumerFactory, ITrack track) : ITrackPlayer
{
	private readonly ILogger<TrackPlayer> logger = logger;

	private readonly ITrackConsumerFactory trackConsumerFactory = trackConsumerFactory;

	private readonly ITrack track = track;

	private ITrackConsumer? consumer;

	public bool Paused => consumer?.Paused ?? true;

	public int? Volume => consumer?.Volume;

	public TrackDetails? CurrentTrack => new TrackDetails(track.FileId, track.Name, track.CurrentPosition, track.TrackLength);

	public async Task Play(bool startPaused, int? startVolume, CancellationToken cancellationToken)
	{
		string text = "Eight Player";
		using Context context = pulseAudioFactory.CreateContext(text, new Dictionary<string, string>
		{
			{ "application.name", text },
			{ "application.version", "0.1.0" }
		});
		if (context == null)
		{
			throw new ArgumentException("Failed to create a context");
		}
		while (true)
		{
			try
			{
				consumer = trackConsumerFactory.Create(context, track);
				await consumer.Play(startPaused, startVolume, cancellationToken);
				break;
			}
			catch (InvalidOperationException)
			{
			}
		}
	}

	public void Stop()
	{
		consumer?.Stop();
	}

	public void Pause()
	{
		consumer?.Pause();
	}

	public void Resume()
	{
		consumer?.Resume();
	}

	public void SetVolume(int volume)
	{
		consumer?.SetVolume(volume);
	}

	public void Seek(Duration position, SeekMode mode)
	{
		track.Seek(position, mode);
	}
}
