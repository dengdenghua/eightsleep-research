using System;
using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.Models;
using Eight.Audio.Player;
using Eight.Capybara.Config;
using NodaTime;

namespace Eight.Audio.StateMachine.Tasks;

public sealed class StopTask(IClock clock, IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager, IPlayer player, StopMethod stopMethod) : IPlayerTask
{
	private readonly IClock clock = clock;

	private readonly IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager = podConfigurationManager;

	private readonly IPlayer player = player;

	private readonly StopMethod stopMethod = stopMethod;

	private Instant lastVolumeDecrease = Instant.MinValue;

	private readonly Duration IterationWait = GetIterationWait(stopMethod);

	private int? originalVolume;

	public Task<(bool, IPlayerTask?)> TryComplete(CancellationToken cancellation)
	{
		podConfigurationManager.Eject(clock);
		if (stopMethod == StopMethod.Immediate)
		{
			player.Stop();
			return Task.FromResult<(bool, IPlayerTask)>((true, null));
		}
		if (clock.GetCurrentInstant() - lastVolumeDecrease > IterationWait)
		{
			int valueOrDefault = originalVolume.GetValueOrDefault();
			if (!originalVolume.HasValue)
			{
				valueOrDefault = player.Volume;
				originalVolume = valueOrDefault;
			}
			lastVolumeDecrease = clock.GetCurrentInstant();
			player.Volume = Math.Max(0, player.Volume - 1);
		}
		if (player.Volume != 0)
		{
			return Task.FromResult<(bool, IPlayerTask)>((false, null));
		}
		player.Stop();
		if (originalVolume.HasValue)
		{
			player.Volume = originalVolume.Value;
		}
		return Task.FromResult<(bool, IPlayerTask)>((true, null));
	}

	private static Duration GetIterationWait(StopMethod stopMethod)
	{
		return stopMethod switch
		{
			StopMethod.Immediate => Duration.FromSeconds(0L), 
			StopMethod.SlowFade => Duration.FromSeconds(2L), 
			StopMethod.FastFade => Duration.FromMilliseconds(200L), 
		};
	}
}
