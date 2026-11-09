using System;
using System.Threading;
using System.Threading.Tasks;
using Eight.Core;
using Eight.Speaker;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.Audio.StateMachine.States;

public class NotConnectedSpeaker(ILogger<NotConnectedSpeaker> logger, ISpeakerStateFactory speakerStateFactory, ISpeakerFactory speakerFactory, SpeakerConfiguration speakerConfiguration, SpeakerReconnectBackoff backoff) : ISpeakerState
{
	private readonly ILogger<NotConnectedSpeaker> logger = logger;

	private readonly ISpeakerStateFactory speakerStateFactory = speakerStateFactory;

	private readonly ISpeakerFactory speakerFactory = speakerFactory;

	private readonly SpeakerConfiguration speakerConfiguration = speakerConfiguration;

	private readonly SpeakerReconnectBackoff backoff = backoff;

	public async Task<ISpeakerState> GetNextState(CancellationToken cancellationToken)
	{
		ISpeaker speaker;
		for (speaker = null; speaker == null; speaker = await SetupSpeaker(cancellationToken))
		{
		}
		return speakerStateFactory.CreateInitializingSpeaker(speaker);
	}

	private async Task<ISpeaker?> SetupSpeaker(CancellationToken cancellationToken)
	{
		if (backoff.ShouldSkipAttempt(out var sinceCentral))
		{
			logger.LogInformation("Speaker still offline; a phone used the hub {SinceCentral} ago, skipping this scan and checking again in {Delay}", sinceCentral, SpeakerReconnectBackoff.RelaxedDelay);
			await Task.Delay(SpeakerReconnectBackoff.RelaxedDelay.ToTimeSpan(), TimeProvider.System, cancellationToken);
			return null;
		}
		ISpeaker speaker = await TryConnectSpeaker(speakerConfiguration.Address, cancellationToken);
		if (speaker == null)
		{
			(Duration Delay, SpeakerReconnectBackoff.Phase Phase, bool PhaseChanged) tuple = backoff.RecordFailure();
			var (duration, phase, _) = tuple;
			if (tuple.PhaseChanged)
			{
				logger.LogInformation("Speaker unreachable for {Offline}; reconnect schedule is now {Phase} (every {Delay})", backoff.Offline, phase, duration);
			}
			else
			{
				logger.LogInformation("Failed to create speaker, waiting {Delay} before retrying", duration);
			}
			await Task.Delay(duration.ToTimeSpan(), TimeProvider.System, cancellationToken);
			return null;
		}
		backoff.RecordSuccess();
		return speaker;
	}

	private async Task<ISpeaker?> TryConnectSpeaker(string address, CancellationToken cancellationToken)
	{
		try
		{
			return await TryConnectSpeakerInternal(address, cancellationToken).WithTimeout(Duration.FromMinutes(3L));
		}
		catch (TimeoutException exception)
		{
			logger.LogCritical(exception, "Failed to leave Control Loop in required time.");
			throw;
		}
		catch (ArgumentException)
		{
			return null;
		}
	}

	private async Task<ISpeaker?> TryConnectSpeakerInternal(string address, CancellationToken cancellationToken)
	{
		ISpeaker speaker = await speakerFactory.Create(address, Duration.FromMinutes(2L), cancellationToken);
		if (speaker != null)
		{
			await speaker.Connect(cancellationToken);
			if (!(await speaker.IsConnected(cancellationToken)))
			{
				logger.LogInformation("Speaker disconnected immediately after connect; re-establishing the link");
				await ReestablishSpeaker(speaker, cancellationToken);
				return null;
			}
			try
			{
				await speaker.GetHardwareInfo(cancellationToken);
			}
			catch (RfcommDisconnectedException)
			{
				logger.LogInformation("Speaker RFCOMM link dropped during hardware-info read; re-establishing the link");
				await ReestablishSpeaker(speaker, cancellationToken);
				return null;
			}
			catch (TimeoutException)
			{
				logger.LogInformation("Failed to connect over rfcomm to get hardware information");
				await speaker.Disconnect(cancellationToken);
				speaker.Dispose();
				return null;
			}
			catch (Exception exception)
			{
				logger.LogError(exception, "Unhandled exception trying to get speaker firmware");
				await speaker.Disconnect(cancellationToken);
				speaker.Dispose();
				return null;
			}
		}
		return speaker;
	}

	private async Task ReestablishSpeaker(ISpeaker speaker, CancellationToken cancellationToken)
	{
		try
		{
			await speaker.Disconnect(cancellationToken);
		}
		catch (Exception exception)
		{
			logger.LogWarning(exception, "Error disconnecting speaker while re-establishing the link");
		}
		speaker.Dispose();
	}
}
