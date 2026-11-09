using Eight.Audio.Models;
using Eight.Audio.StateMachine.States;
using Eight.Capybara.Config;
using NodaTime;

namespace Eight.Audio;

public static class PodConfigurationManagerExtensions
{
	public static void UpdateLastKnownState(this IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager, PlayRequest playRequest, IClock clock)
	{
		SpeakerConfiguration configuration = podConfigurationManager.Configuration;
		if ((object)configuration != null)
		{
			podConfigurationManager.UpdateConfiguration(configuration with
			{
				LastKnownState = new StateTracking(PlayerState.Playing, playRequest.StartVolume, playRequest.PlaybackSource, playRequest, clock.GetCurrentInstant().ToUnixTimeSeconds())
			});
		}
	}

	private static string MapStopCriteria(StopCriteria? criteria)
	{
		return criteria switch
		{
			StopCriteria.ManualStop => "ManualStop", 
			StopCriteria.UntilFallAsleep => "UntilFallAlseep", 
			StopCriteria.UntilWakeUp => "UntilWakeUp", 
			StopCriteria.UntilTrackEnd => "UntilTrackEnd", 
			StopCriteria.Duration => "Duration", 
			_ => "", 
		};
	}

	public static void UpdateTime(this IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager, IClock clock)
	{
		SpeakerConfiguration configuration = podConfigurationManager.Configuration;
		if ((object)configuration != null)
		{
			podConfigurationManager.UpdateConfiguration(configuration with
			{
				LastKnownState = configuration.LastKnownState with
				{
					UpdatedAt = clock.GetCurrentInstant().ToUnixTimeSeconds()
				}
			});
		}
	}

	public static void UpdateVolume(this IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager, int volume, IClock clock)
	{
		SpeakerConfiguration configuration = podConfigurationManager.Configuration;
		if ((object)configuration != null)
		{
			podConfigurationManager.UpdateConfiguration(configuration with
			{
				LastKnownState = configuration.LastKnownState with
				{
					Volume = volume,
					UpdatedAt = clock.GetCurrentInstant().ToUnixTimeSeconds()
				}
			});
		}
	}

	public static void Pause(this IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager, IClock clock)
	{
		SpeakerConfiguration configuration = podConfigurationManager.Configuration;
		if ((object)configuration != null)
		{
			podConfigurationManager.UpdateConfiguration(configuration with
			{
				LastKnownState = configuration.LastKnownState with
				{
					Status = PlayerState.Paused,
					UpdatedAt = clock.GetCurrentInstant().ToUnixTimeSeconds()
				}
			});
		}
	}

	public static void Resume(this IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager, IClock clock)
	{
		SpeakerConfiguration configuration = podConfigurationManager.Configuration;
		if ((object)configuration != null)
		{
			podConfigurationManager.UpdateConfiguration(configuration with
			{
				LastKnownState = configuration.LastKnownState with
				{
					Status = PlayerState.Playing,
					UpdatedAt = clock.GetCurrentInstant().ToUnixTimeSeconds()
				}
			});
		}
	}

	public static void Eject(this IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager, IClock clock)
	{
		SpeakerConfiguration configuration = podConfigurationManager.Configuration;
		if ((object)configuration != null)
		{
			podConfigurationManager.UpdateConfiguration(configuration with
			{
				LastKnownState = new StateTracking(PlayerState.Ready, configuration.LastKnownState?.Volume ?? 40, null, null, clock.GetCurrentInstant().ToUnixTimeSeconds())
			});
		}
	}
}
