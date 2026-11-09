using System;
using Eight.Audio.Models;
using Eight.Audio.Player;
using Eight.Audio.Tracks;
using Eight.Capybara.Config;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.Audio.StateMachine.Tasks;

public class SpeakerTaskFactory(IServiceProvider serviceProvider) : ISpeakerTaskFactory
{
	private readonly IServiceProvider serviceProvider = serviceProvider;

	public IPlayerTask CreateLoadingTask(IPlayer player, PlayRequest playRequest)
	{
		return new LoadingTask(serviceProvider.GetRequiredService<ILogger<LoadingTask>>(), serviceProvider.GetRequiredService<ITrackFactory>(), serviceProvider.GetRequiredService<ISpeakerTaskFactory>(), player, playRequest);
	}

	public IPlayerTask CreatePlayTask(IPlayer player, PlayRequest playRequest)
	{
		return new PlayTask(serviceProvider.GetRequiredService<ILogger<PlayTask>>(), serviceProvider.GetRequiredService<IClock>(), serviceProvider.GetRequiredService<IPodConfigurationManager<SpeakerConfiguration>>(), player, playRequest);
	}

	public IPlayerTask CreateRestoreTask(IPlayer player, bool keepCurrentVolume)
	{
		if ((object)player.CurrentTrack == null)
		{
			return new NoTask();
		}
		PlayRequest playRequest = player.PlayRequest with
		{
			StartPaused = player.Paused
		};
		if (playRequest.PreviewRequest)
		{
			return new NoTask();
		}
		if (keepCurrentVolume)
		{
			playRequest = playRequest with
			{
				StartVolume = player.Volume
			};
		}
		return new RestoreTask(this, player, playRequest);
	}

	public IPlayerTask CreateRestoreTask(IPlayer player, PlayRequest playRequest)
	{
		if (playRequest.PreviewRequest)
		{
			return new NoTask();
		}
		return new RestoreTask(this, player, playRequest);
	}

	public IPlayerTask CreatePauseTask(IPlayer player)
	{
		return new PauseTask(serviceProvider.GetRequiredService<IClock>(), serviceProvider.GetRequiredService<ISpeakerTaskFactory>(), serviceProvider.GetRequiredService<IPodConfigurationManager<SpeakerConfiguration>>(), player, null);
	}

	public IPlayerTask CreatePauseTask(IPlayer player, Duration duration)
	{
		return new PauseTask(serviceProvider.GetRequiredService<IClock>(), serviceProvider.GetRequiredService<ISpeakerTaskFactory>(), serviceProvider.GetRequiredService<IPodConfigurationManager<SpeakerConfiguration>>(), player, duration);
	}

	public IPlayerTask CreateResumeTask(IPlayer player)
	{
		return new ResumeTask(serviceProvider.GetRequiredService<IClock>(), serviceProvider.GetRequiredService<IPodConfigurationManager<SpeakerConfiguration>>(), player);
	}

	public IPlayerTask CreateVolumeTask(IPlayer player, int volume)
	{
		return new VolumeTask(serviceProvider.GetRequiredService<IClock>(), serviceProvider.GetRequiredService<IPodConfigurationManager<SpeakerConfiguration>>(), player, volume);
	}

	public IPlayerTask CreateStopTask(IPlayer player, StopMethod stopMethod)
	{
		return new StopTask(serviceProvider.GetRequiredService<IClock>(), serviceProvider.GetRequiredService<IPodConfigurationManager<SpeakerConfiguration>>(), player, stopMethod);
	}

	public IPlayerTask CreateSeekTask(IPlayer player, SeekRequest request)
	{
		return new SeekTask(player, request);
	}

	public IPlayerTask CreateDelayedResumeTask(IPlayer player, Duration duration)
	{
		return new DelayedResumeTask(serviceProvider.GetRequiredService<IClock>(), serviceProvider.GetRequiredService<ISpeakerTaskFactory>(), serviceProvider.GetRequiredService<IPodConfigurationManager<SpeakerConfiguration>>(), player, duration);
	}
}
