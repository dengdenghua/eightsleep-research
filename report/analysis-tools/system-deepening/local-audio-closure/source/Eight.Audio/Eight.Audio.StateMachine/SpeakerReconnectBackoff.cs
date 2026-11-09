using System.Threading;
using Eight.DBus;
using NodaTime;

namespace Eight.Audio.StateMachine;

public sealed class SpeakerReconnectBackoff(IClock clock, ICentralActivity centralActivity)
{
	public enum Phase
	{
		Aggressive,
		Steady,
		Relaxed
	}

	public static readonly Duration AggressiveDelay = Duration.FromSeconds(20L);

	public static readonly Duration SteadyDelay = Duration.FromMinutes(1L);

	public static readonly Duration RelaxedDelay = Duration.FromMinutes(5L);

	public static readonly Duration SteadyAfter = Duration.FromMinutes(20L);

	public static readonly Duration RelaxedAfter = Duration.FromMinutes(60L);

	public static readonly Duration RecentCentralWindow = Duration.FromMinutes(5L);

	private readonly IClock clock = clock;

	private readonly ICentralActivity centralActivity = centralActivity;

	private readonly Lock gate = new Lock();

	private Instant? firstFailure;

	private Phase? announced;

	public Duration Offline
	{
		get
		{
			using (gate.EnterScope())
			{
				Instant? instant = firstFailure;
				Duration result;
				if (instant.HasValue)
				{
					Instant valueOrDefault = instant.GetValueOrDefault();
					result = clock.GetCurrentInstant() - valueOrDefault;
				}
				else
				{
					result = Duration.Zero;
				}
				return result;
			}
		}
	}

	public Phase CurrentPhase => PhaseFor(Offline);

	public static Phase PhaseFor(Duration offline)
	{
		if (offline >= RelaxedAfter)
		{
			return Phase.Relaxed;
		}
		if (!(offline >= SteadyAfter))
		{
			return Phase.Aggressive;
		}
		return Phase.Steady;
	}

	public static Duration DelayFor(Phase phase)
	{
		return phase switch
		{
			Phase.Relaxed => RelaxedDelay, 
			Phase.Steady => SteadyDelay, 
			_ => AggressiveDelay, 
		};
	}

	public (Duration Delay, Phase Phase, bool PhaseChanged) RecordFailure()
	{
		using (gate.EnterScope())
		{
			Instant currentInstant = clock.GetCurrentInstant();
			Instant valueOrDefault = firstFailure.GetValueOrDefault();
			if (!firstFailure.HasValue)
			{
				valueOrDefault = currentInstant;
				firstFailure = valueOrDefault;
			}
			Phase phase = PhaseFor(currentInstant - firstFailure.Value);
			bool item = announced != phase;
			announced = phase;
			return (Delay: DelayFor(phase), Phase: phase, PhaseChanged: item);
		}
	}

	public void RecordSuccess()
	{
		using (gate.EnterScope())
		{
			firstFailure = null;
			announced = null;
		}
	}

	public bool ShouldSkipAttempt(out Duration sinceCentral)
	{
		sinceCentral = Duration.Zero;
		if (CurrentPhase != Phase.Relaxed)
		{
			return false;
		}
		Instant? last = centralActivity.Last;
		if (last.HasValue)
		{
			Instant valueOrDefault = last.GetValueOrDefault();
			sinceCentral = clock.GetCurrentInstant() - valueOrDefault;
			if (sinceCentral >= Duration.Zero)
			{
				return sinceCentral < RecentCentralWindow;
			}
			return false;
		}
		return false;
	}
}
