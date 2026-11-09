using System;
using Eight.Audio.DataSources;
using Eight.Audio.Player;
using Eight.Audio.StateMachine;
using Eight.Audio.StateMachine.States;
using Eight.Audio.StateMachine.Tasks;
using Eight.Audio.Tracks;
using Eight.Capybara;
using Eight.Capybara.Config;
using Eight.Config;
using Eight.PulseAudio;
using Eight.Speaker;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.Audio;

public static class AudioServiceCollectionExtensions
{
	public static IServiceCollection AddAudio(this IServiceCollection services)
	{
		services.AddSingleton((Func<IServiceProvider, IPulseAudioFactory>)((IServiceProvider sp) => new PulseAudioFactory(sp.GetRequiredService<ILogger<PulseAudioFactory>>(), sp, ThreadedMainLoop.Create(() => sp.GetRequiredService<ILogger<MainLoopLock>>()))));
		services.AddTransient<ITrackConsumerFactory, TrackConsumerFactory>();
		services.AddTransient<ITrackFactory, TrackFactory>();
		services.AddTransient((Func<IServiceProvider, ITrackDataSourceFactory>)((IServiceProvider sp) => new TrackDataManager(sp.GetRequiredService<IConfiguration>().GetRefTypeOrThrow<string>("trackStorage"))));
		services.AddTransient<ITrackPlayerFactory, TrackPlayerFactory>();
		services.AddTransient<IPlayer, Eight.Audio.Player.Player>();
		services.AddSingleton<ISpeakerTaskFactory, SpeakerTaskFactory>();
		services.AddHostedService<TrackDownloader>();
		services.AddHostedService((IServiceProvider sp) => new SpeakerHeartBeatService(sp.GetRequiredService<ILogger<SpeakerHeartBeatService>>(), sp.GetRequiredService<IClock>(), sp.GetRequiredService<IPodConfigurationManager<SpeakerConfiguration>>(), sp.GetRequiredService<ISpeakerProvider>()));
		return services;
	}

	private static IServiceCollection AddMinamiSpeaker(this IServiceCollection services)
	{
		services.AddSingleton<ISpeakerFactory, MinamiSpeakerFactory>();
		return services;
	}

	public static IServiceCollection AddSpeaker(this IServiceCollection services)
	{
		services.AddSingleton((Func<IServiceProvider, ISpeakerUpdater>)((IServiceProvider sp) =>
		{
			IConfiguration requiredService = sp.GetRequiredService<IConfiguration>();
			MinamiFirmwareConfiguration[] array = requiredService.GetSection("speaker").Get<MinamiFirmwareConfiguration[]>();
			if (array == null)
			{
				throw new ArgumentNullException("Unable to load trimix controller config");
			}
			MinamiFirmwareConfiguration[] fotaConfigurations = requiredService.GetSection("speakerFota").Get<MinamiFirmwareConfiguration[]>() ?? Array.Empty<MinamiFirmwareConfiguration>();
			return new SpeakerUpdater(sp.GetRequiredService<ILogger<SpeakerUpdater>>(), array, fotaConfigurations, sp.GetRequiredService<ISpeakerFactory>());
		}));
		services.AddMinamiSpeaker();
		services.AddSingleton<ISpeakerProvider, SpeakerService>();
		services.AddSingleton<ISpeakerStateFactory, SpeakerStateFactory>();
		services.AddSingleton<SpeakerReconnectBackoff>();
		services.AddHostedService((IServiceProvider sp) => (SpeakerService)sp.GetRequiredService<ISpeakerProvider>());
		services.AddAudio();
		return services;
	}
}
