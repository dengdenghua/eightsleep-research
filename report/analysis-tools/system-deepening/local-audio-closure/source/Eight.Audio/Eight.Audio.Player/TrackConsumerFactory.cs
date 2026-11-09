using System;
using Eight.Audio.Tracks;
using Eight.PulseAudio;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace Eight.Audio.Player;

public sealed class TrackConsumerFactory(IServiceProvider serviceProvider) : ITrackConsumerFactory
{
	private readonly IServiceProvider serviceProvider = serviceProvider;

	public ITrackConsumer Create(Context context, ITrack source)
	{
		return new TrackConsumer(serviceProvider.GetRequiredService<ILogger<TrackConsumer>>(), serviceProvider.GetRequiredService<IPulseAudioFactory>(), context, source);
	}
}
