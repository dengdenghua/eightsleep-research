using System;
using System.Collections.Generic;
using System.Collections.Immutable;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Eight.Accessory.BedFrame;
using Eight.Capybara.AdjustableBase.Exceptions;
using Eight.Capybara.AdjustableBase.Joints;
using Eight.Capybara.Observability;
using Microsoft.Extensions.Logging;
using NodaTime;
using Tmds.DBus;

namespace Eight.Capybara.AdjustableBase.Bases;

public abstract class AbstractAdjustableBase : IFrame2, IConnectedFrame
{
	protected readonly ILogger logger;

	protected readonly IStatsd statsd;

	protected readonly IClock clock;

	protected readonly IFrameFactory frameFactory;

	protected readonly IAdjustableBase adjustableBase;

	protected SystemFlags lastSystemFlags = new SystemFlags(MovementSensor: false, MotorStatus.Working, MotorStatus.Working, MotorStatus.Working, MotorStatus.Working);

	internal static readonly Duration TickInterval = Duration.FromSeconds(1L);

	internal const int IdlePollTicks = 10;

	internal const int ActivityLingerTicks = 30;

	private int ticksSinceLastPoll = 10;

	private int activeTicksRemaining;

	private static readonly Duration StateAlivePeriod = Duration.FromHours(1);

	private Instant lastStateLoggedAt;

	protected abstract IEnumerable<Joint> Joints { get; }

	public BaseStateUpdate? LastStateUpdate { get; private set; }

	public FrameHardwareInfo HardwareInfo { get; init; }

	public AbstractAdjustableBase(ILogger logger, IStatsd statsd, IClock clock, IFrameFactory frameFactory, IAdjustableBase adjustableBase, FrameHardwareInfo frameHardwareInfo)
	{
		this.logger = logger;
		this.statsd = statsd;
		this.clock = clock;
		this.frameFactory = frameFactory;
		this.adjustableBase = adjustableBase;
		HardwareInfo = frameHardwareInfo;
	}

	public Task<short> GetRssi(CancellationToken cancellationToken)
	{
		return adjustableBase.GetRssi(cancellationToken);
	}

	public Task Disconnect(CancellationToken cancellationToken)
	{
		return adjustableBase.Disconnect(cancellationToken);
	}

	public void StopAll()
	{
		statsd.Increment("adjustableBase.movement.stop");
		foreach (Joint joint in Joints)
		{
			joint.OnRequest(new StopRequest());
		}
	}

	public async Task UpdateJointsState(CancellationToken cancellation)
	{
		FrameState baseState = await adjustableBase.GetBase(cancellation);
		SystemFlags systemFlags = await adjustableBase.QuerySystemFlags(cancellation);
		BaseStateUpdate lastStateUpdate = LastStateUpdate;
		LastStateUpdate = new BaseStateUpdate(baseState, systemFlags, clock.GetCurrentInstant());
		LogStateIfActiveOrDue(lastStateUpdate, LastStateUpdate);
		ticksSinceLastPoll = 0;
		activeTicksRemaining = ((IsAnySectionMoving(baseState) || systemFlags.MovementSensor) ? 30 : Math.Max(activeTicksRemaining - 1, 0));
		if (systemFlags.MovementSensor && !lastSystemFlags.MovementSensor)
		{
			statsd.Increment("adjustableBase.movement.movementSensorTrigger");
			logger.LogInformation("Movement Sensors Triggers");
		}
		lastSystemFlags = systemFlags;
		foreach (Joint joint in Joints)
		{
			joint.OnBaseStateUpdate(LastStateUpdate);
		}
	}

	private static bool IsMoving(BaseStateUpdate update)
	{
		if (!update.SystemFlags.MovementSensor && !update.FrameState.Left.Torso.Moving && !update.FrameState.Right.Torso.Moving && !update.FrameState.Left.Leg.Moving)
		{
			return update.FrameState.Right.Leg.Moving;
		}
		return true;
	}

	private void LogStateIfActiveOrDue(BaseStateUpdate? previous, BaseStateUpdate current)
	{
		if ((object)previous == null || IsMoving(current) || IsMoving(previous) || current.SystemFlags != previous.SystemFlags || current.TimeStamp - lastStateLoggedAt >= StateAlivePeriod)
		{
			lastStateLoggedAt = current.TimeStamp;
			logger.LogInformation("Current State: {@State}", new
			{
				baseState = current.FrameState,
				flags = current.SystemFlags
			});
		}
	}

	public async Task RunJointsIteration(CancellationToken cancellation)
	{
		await PerformJointTasks(Joints.Where((Joint j) => j.NextTaskPowerRequirement == Power.None), cancellation);
		ImmutableDictionary<Power, Joint[]> immutableDictionary = (from j in Joints
			group j by j.NextTaskPowerRequirement).ToImmutableDictionary((IGrouping<Power, Joint> g) => g.Key, (IGrouping<Power, Joint> g) => g.ToArray());
		Joint[] value2;
		if (immutableDictionary.TryGetValue(Power.High, out var value))
		{
			await value.First().PerformNextTask(cancellation);
		}
		else if (immutableDictionary.TryGetValue(Power.Low, out value2))
		{
			await PerformJointTasks(value2, cancellation);
		}
	}

	private static async Task PerformJointTasks(IEnumerable<Joint> joints, CancellationToken cancellation)
	{
		foreach (Joint joint in joints)
		{
			await joint.PerformNextTask(cancellation);
		}
	}

	public async Task<IFrame2> GetNextFrame(CancellationToken cancellationToken)
	{
		try
		{
			using PeriodicTimer timer = new PeriodicTimer(TickInterval.ToTimeSpan());
			while (await timer.WaitForNextTickAsync(cancellationToken) && !cancellationToken.IsCancellationRequested)
			{
				await ControlLoopIteration(cancellationToken);
			}
		}
		catch (MovementError movementError)
		{
			await adjustableBase.Stop(cancellationToken);
			logger.LogError(movementError, "Transitioning to Transient Error Frame");
			IFrame2 frame = frameFactory.CreateTransientErrorFrame(adjustableBase);
			Request request = movementError.Request;
			if (request is SnoreMitigationRequest { Attempts: 0 } r)
			{
				using CancellationTokenSource cancellationTokenSource = CancellationTokenSource.CreateLinkedTokenSource(cancellationToken, new CancellationTokenSource(TimeSpan.FromMinutes(5L)).Token);
				CancellationToken linkedToken = cancellationTokenSource.Token;
				await adjustableBase.SetLeftTorsoAngle(8.0, 0.0, linkedToken);
				await adjustableBase.SetRightTorsoAngle(8.0, 0.0, linkedToken);
				await Task.Delay(60000, linkedToken);
				await adjustableBase.SetLeftTorsoAngle(16.0, 0.0, linkedToken);
				await adjustableBase.SetRightTorsoAngle(16.0, 0.0, linkedToken);
				await Task.Delay(45000, linkedToken);
				await adjustableBase.SetLeftTorsoAngle(24.0, 0.0, linkedToken);
				await adjustableBase.SetRightTorsoAngle(24.0, 0.0, linkedToken);
				await Task.Delay(30000, linkedToken);
				await adjustableBase.SetTorsoAngle(30.0, 0.0, linkedToken);
				await Task.Delay(15000, linkedToken);
				await ((TransientErrorFrame)frame).RebootFrame(linkedToken);
				while (!(frame is AbstractAdjustableBase) && !linkedToken.IsCancellationRequested)
				{
					frame = await frame.GetNextFrame(linkedToken);
					logger.LogInformation("Transitioned to next frame: " + frame.GetType().Name);
				}
				if (!linkedToken.IsCancellationRequested && frame is SynchronizedAdjustableBase { TorsoJoint: var torsoJoint })
				{
					torsoJoint.MakeRequest(r with
					{
						Attempts = 1
					});
				}
			}
			return frame;
		}
		catch (MovementSensorTrigger exception)
		{
			await adjustableBase.Stop(cancellationToken);
			logger.LogError(exception, "Transitioning to Movement Sensor Frame");
			return frameFactory.CreateMovementSensorFrame(adjustableBase);
		}
		catch (DBusException exception2)
		{
			logger.LogError(exception2, "Transitioning to Expired Frame");
			return frameFactory.CreateExpiredFrame(this);
		}
		catch
		{
			throw;
		}
		return frameFactory.CreateExpiredFrame(this);
	}

	private async Task ControlLoopIteration(CancellationToken cancellationToken)
	{
		Task iterationTask = RunTick(cancellationToken);
		await Task.WhenAny(iterationTask, Task.Delay(50000, cancellationToken));
		if (!iterationTask.IsCompleted)
		{
			throw new TimeoutException("Failed to leave Control Loop in required time.");
		}
		await iterationTask;
	}

	public async Task RunTick(CancellationToken cancellation)
	{
		bool hasWork = Joints.Any((Joint j) => j.HasPendingTasks);
		ticksSinceLastPoll++;
		if (hasWork || activeTicksRemaining > 0 || ticksSinceLastPoll >= 10)
		{
			await UpdateJointsState(cancellation);
		}
		if (hasWork)
		{
			await RunJointsIteration(cancellation);
		}
	}

	private static bool IsAnySectionMoving(FrameState state)
	{
		if (!state.Left.Torso.Moving && !state.Right.Torso.Moving && !state.Left.Leg.Moving)
		{
			return state.Right.Leg.Moving;
		}
		return true;
	}
}
