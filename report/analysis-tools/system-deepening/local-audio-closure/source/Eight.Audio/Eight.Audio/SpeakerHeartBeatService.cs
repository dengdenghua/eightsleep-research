using System;
using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.StateMachine;
using Eight.Audio.StateMachine.States;
using Eight.Capybara.Config;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.Audio;

public class SpeakerHeartBeatService(ILogger<SpeakerHeartBeatService> logger, IClock clock, IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager, ISpeakerProvider speakerProvider) : BackgroundService
{
	private readonly ILogger<SpeakerHeartBeatService> logger = logger;

	private readonly IClock clock = clock;

	private readonly IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager = podConfigurationManager;

	private readonly ISpeakerProvider speakerProvider = speakerProvider;

	protected override async Task ExecuteAsync(CancellationToken stoppingToken)
	{
		while (!stoppingToken.IsCancellationRequested)
		{
			try
			{
				using PeriodicTimer timer = new PeriodicTimer(TimeSpan.FromSeconds(10L));
				while (await timer.WaitForNextTickAsync(stoppingToken))
				{
					if (speakerProvider.GetCurrentSpeakerState() is ReadyState speakerState)
					{
						UpdateLastKnownState(speakerState);
					}
				}
			}
			catch (Exception exception)
			{
				logger.LogError(exception, "Error occured while updating adjustable base heartbeat");
				await Task.Delay(5000, stoppingToken);
			}
		}
	}

	internal void UpdateLastKnownState(ReadyState speakerState)
	{
		if (!(Instant.FromUnixTimeSeconds((podConfigurationManager.Configuration?.LastKnownState?.UpdatedAt).GetValueOrDefault()) + Duration.FromMinutes(1L) > clock.GetCurrentInstant()))
		{
			PlayerStatus state = speakerState.State;
			SpeakerConfiguration configuration = podConfigurationManager.Configuration;
			if (state.State == PlayerState.Loading && (object)configuration != null && configuration.LastKnownState?.Status == PlayerState.Playing)
			{
				podConfigurationManager.UpdateTime(clock);
			}
			else if (state.State == PlayerState.Playing && (object)configuration != null && configuration.LastKnownState?.Status == PlayerState.Playing)
			{
				podConfigurationManager.UpdateTime(clock);
			}
			else if (state.State == PlayerState.Paused && (object)configuration != null && configuration.LastKnownState?.Status == PlayerState.Playing)
			{
				podConfigurationManager.UpdateTime(clock);
			}
		}
	}
}
