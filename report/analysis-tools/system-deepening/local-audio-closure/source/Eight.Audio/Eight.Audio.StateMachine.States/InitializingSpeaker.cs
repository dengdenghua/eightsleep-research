using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.Models;
using Eight.Audio.StateMachine.Tasks;
using Eight.Capybara.Config;
using Eight.Core;
using Eight.Speaker;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.Audio.StateMachine.States;

public class InitializingSpeaker(ILogger<InitializingSpeaker> logger, IClock clock, ISpeakerStateFactory speakerStateFactory, IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager, ISpeaker speaker, ISpeakerUpdater speakerUpdater) : ISpeakerState, IConnectedSpeakerState
{
	private readonly ILogger<InitializingSpeaker> logger = logger;

	private readonly IClock clock = clock;

	private readonly ISpeakerStateFactory speakerStateFactory = speakerStateFactory;

	private readonly IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager = podConfigurationManager;

	private readonly ISpeaker speaker = speaker;

	private readonly ISpeakerUpdater speakerUpdater = speakerUpdater;

	public Task Disconnect(CancellationToken cancellationToken)
	{
		return speaker.Disconnect(cancellationToken);
	}

	public async Task<ISpeakerState> GetNextState(CancellationToken cancellationToken)
	{
		try
		{
			return await TryUpdateFrame(cancellationToken).WithTimeout(Duration.FromMinutes(20L));
		}
		catch (TimeoutException exception)
		{
			logger.LogCritical(exception, "Failed to leave Control Loop in required time.");
			throw;
		}
	}

	private async Task<ISpeakerState> TryUpdateFrame(CancellationToken cancellationToken)
	{
		SpeakerUpdateResult speakerUpdateResult;
		while ((speakerUpdateResult = await speakerUpdater.Update(speaker, cancellationToken)) == SpeakerUpdateResult.Retry)
		{
			await Task.Delay(10000, cancellationToken);
		}
		if (speakerUpdateResult == SpeakerUpdateResult.Flashed)
		{
			logger.LogInformation("Speaker flashed; re-acquiring after reboot.");
			speaker.Dispose();
			return speakerStateFactory.CreateNotConnectedSpeaker();
		}
		await speaker.Connect(cancellationToken);
		ReadyState readyState = (ReadyState)speakerStateFactory.CreateReadySpeaker(speaker);
		StateTracking stateTracking = podConfigurationManager.Configuration?.LastKnownState;
		PlayRequest playRequest = stateTracking?.PlayRequest;
		if ((object)playRequest != null && ResumeWindowOpen(stateTracking, clock.GetCurrentInstant()))
		{
			PlayModification[] playModifications = playRequest.PlayModifications;
			int num = 0;
			PlayModification[] array = new PlayModification[1 + playModifications.Length];
			ReadOnlySpan<PlayModification> readOnlySpan = new ReadOnlySpan<PlayModification>(playModifications);
			readOnlySpan.CopyTo(new Span<PlayModification>(array).Slice(num, readOnlySpan.Length));
			num += readOnlySpan.Length;
			array[num] = PlayModification.SlowRampVolumeOnStart;
			PlayModification[] playModifications2 = new HashSet<PlayModification>(new _003C_003Ez__ReadOnlyArray<PlayModification>(array)).ToArray();
			readyState.MakeRequest(new PlayTrackRequest(playRequest with
			{
				PlayModifications = playModifications2,
				StartVolume = (stateTracking?.Volume ?? playRequest.StartVolume),
				StartPaused = ((object)stateTracking != null && stateTracking.Status == PlayerState.Paused)
			}));
		}
		return readyState;
	}

	internal static bool ResumeWindowOpen(StateTracking? lastKnownState, Instant now)
	{
		return (double)(lastKnownState?.UpdatedAt ?? 0) + Duration.FromMinutes(5L).TotalSeconds > (double)now.ToUnixTimeSeconds();
	}
}
