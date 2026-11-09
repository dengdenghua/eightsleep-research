using System;
using Eight.Audio.Tracks;
using Eight.PulseAudio;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace Eight.Audio.Player;

public sealed class TrackPlayerFactory(IServiceProvider serviceProvider) : ITrackPlayerFactory
{
	public ITrackPlayer Create(ITrack track)
	{
		return new TrackPlayer(serviceProvider.GetRequiredService<ILogger<TrackPlayer>>(), serviceProvider.GetRequiredService<IPulseAudioFactory>(), serviceProvider.GetRequiredService<ITrackConsumerFactory>(), track);
	}
}
