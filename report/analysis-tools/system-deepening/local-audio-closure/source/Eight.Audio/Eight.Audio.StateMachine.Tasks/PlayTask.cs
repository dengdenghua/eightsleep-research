using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.Models;
using Eight.Audio.Player;
using Eight.Capybara.Config;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.Audio.StateMachine.Tasks;

public sealed class PlayTask(ILogger<PlayTask> logger, IClock clock, IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager, IPlayer player, PlayRequest playRequest) : IPlayerTask
{
	private readonly ILogger<PlayTask> logger = logger;

	private readonly IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager = podConfigurationManager;

	private readonly IClock clock = clock;

	private readonly CancellationTokenSource taskCancellationSource = new CancellationTokenSource();

	private Task? playTask;

	private Instant lastVolumeIncrease = Instant.MinValue;

	private int lastKnownVolume;

	private readonly Duration IterationWait = GetIterationWait();

	private readonly int originalVolume = player.Volume;

	public PlayRequest PlayRequest { get; } = playRequest;

	public bool ShouldVolumeRamp { get; private set; } = Enumerable.Contains(playRequest.PlayModifications, PlayModification.SlowRampVolumeOnStart);

	public Task<(bool, IPlayerTask?)> TryComplete(CancellationToken cancellation)
	{
		if (ShouldVolumeRamp && playTask != null)
		{
			if (player.Volume == PlayRequest.StartVolume)
			{
				ShouldVolumeRamp = false;
			}
			else if (clock.GetCurrentInstant() - lastVolumeIncrease > IterationWait)
			{
				lastVolumeIncrease = clock.GetCurrentInstant();
				lastKnownVolume++;
				player.Volume = Math.Min(100, lastKnownVolume);
			}
		}
		if (playTask == null)
		{
			PlayRequest playRequest = PlayRequest with
			{
				StartVolume = ((!ShouldVolumeRamp) ? PlayRequest.StartVolume : 0)
			};
			playTask = player.PlayNext(playRequest, taskCancellationSource.Token);
			podConfigurationManager.UpdateLastKnownState(PlayRequest, clock);
		}
		bool isCompleted = playTask.IsCompleted;
		if (isCompleted && Enumerable.Contains(PlayRequest.PlayModifications, PlayModification.RestoreVolumeOnCompletion))
		{
			player.Volume = originalVolume;
		}
		if (isCompleted)
		{
			podConfigurationManager.Eject(clock);
		}
		return Task.FromResult<(bool, IPlayerTask)>((isCompleted, null));
	}

	public IPlayerTask Cancel()
	{
		return new CancelTask(() =>
		{
			taskCancellationSource.Cancel();
			return playTask;
		}, Duration.FromMilliseconds(250L));
	}

	public IPlayerTask StopVolumeRamp()
	{
		ShouldVolumeRamp = false;
		return this;
	}

	private static Duration GetIterationWait()
	{
		return Duration.FromSeconds(2L);
	}
}
