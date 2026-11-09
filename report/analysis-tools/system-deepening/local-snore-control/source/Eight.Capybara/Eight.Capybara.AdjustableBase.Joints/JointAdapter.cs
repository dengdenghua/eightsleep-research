using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Eight.Accessory.BedFrame;
using Eight.Capybara.AdjustableBase.Exceptions;
using Eight.Capybara.Observability;
using Eight.DBus;
using Microsoft.Extensions.Logging;
using Tmds.DBus;
using Tmds.DBus.Protocol;

namespace Eight.Capybara.AdjustableBase.Joints;

public class JointAdapter : IJointBaseAdapter
{
	protected readonly ILogger<JointAdapter> logger;

	protected readonly IStatsd statsd;

	private readonly IAdjustableBase trimix;

	private readonly string identifier;

	private readonly Func<IAdjustableBase, double, double, CancellationToken, Task> set;

	private readonly Func<IAdjustableBase, CancellationToken, Task> stop;

	private readonly Func<FrameState, FrameSectionState> getSectionState;

	private readonly Func<SystemFlags, MotorStatus> getFlag;

	protected SpeedTracker? speed;

	private double? lastRequestedAngle;

	private bool lastMovementSensor;

	public JointAdapter(ILogger<JointAdapter> logger, IStatsd statsd, IAdjustableBase trimix, string identifier, Func<IAdjustableBase, double, double, CancellationToken, Task> set, Func<IAdjustableBase, CancellationToken, Task> stop, Func<FrameState, FrameSectionState> getSectionState, Func<SystemFlags, MotorStatus> getFlag)
	{
		this.logger = logger;
		this.statsd = statsd;
		this.trimix = trimix;
		this.identifier = identifier;
		this.set = set;
		this.stop = stop;
		this.getSectionState = getSectionState;
		this.getFlag = getFlag;
	}

	public async Task MoveToAngle(double targetAngle, double feedRate, CancellationToken cancellation)
	{
		ResetSpeedTracking();
		try
		{
			await Utils.DbusRetry((CancellationToken c) => set(trimix, feedRate, targetAngle, c), 2, cancellation);
		}
		catch (Tmds.DBus.DBusException exception)
		{
			logger.LogInformation(exception, "Failed to execute movement command");
			throw;
		}
		catch (Tmds.DBus.Protocol.DBusException exception2)
		{
			logger.LogInformation(exception2, "Failed to execute movement command");
			throw;
		}
		catch (Exception exception3)
		{
			statsd.Increment("adjustableBase.movement.error");
			logger.LogInformation(exception3, "Failed to execute movement command");
		}
	}

	public virtual void SetLastUpdatedAngle(double angle)
	{
		lastRequestedAngle = angle;
	}

	public async Task Stop(CancellationToken cancellation)
	{
		await stop(trimix, cancellation);
		lastRequestedAngle = null;
	}

	public virtual JointStateUpdate BaseStateUpdateToJointStateUpdate(BaseStateUpdate baseState)
	{
		FrameState frameState = baseState.FrameState;
		FrameSectionState frameSectionState = getSectionState(frameState);
		JointError jointError = getFlag(baseState.SystemFlags) switch
		{
			MotorStatus.Working => JointError.None, 
			MotorStatus.Overload => JointError.Overload, 
			MotorStatus.NotWorking => JointError.Broken, 
			MotorStatus.SpikeCurrentOverload => JointError.SpikeOverload, 
			MotorStatus.LowPowerSpikeOverload => JointError.LowPowerSpikeOverload, 
			_ => JointError.None, 
		};
		bool movementSensor = baseState.SystemFlags.MovementSensor;
		if ((jointError == JointError.None && frameSectionState.Moving) & movementSensor)
		{
			if (!lastMovementSensor)
			{
				logger.LogInformation("Movement Sensor Trigger, should have cancelled movement");
				statsd.Increment("adjustableBase.movement.sensor.shouldCancel");
			}
			jointError = JointError.MovementSensor;
		}
		lastMovementSensor = movementSensor;
		if (frameSectionState.Moving && !frameSectionState.HallMoving)
		{
			jointError = JointError.HallMismatch;
		}
		jointError = HandleSpeed(baseState, jointError);
		double valueOrDefault = lastRequestedAngle.GetValueOrDefault();
		if (!lastRequestedAngle.HasValue)
		{
			valueOrDefault = frameSectionState.CurrentAngle;
			lastRequestedAngle = valueOrDefault;
		}
		return new JointStateUpdate(baseState.TimeStamp, frameSectionState.CurrentAngle, frameSectionState.CurrentTicks, lastRequestedAngle, frameSectionState.Moving, jointError);
	}

	public virtual void ResetSpeedTracking()
	{
		speed = new SpeedTracker();
	}

	public JointError HandleSpeed(BaseStateUpdate baseState, JointError currentError)
	{
		if (currentError != JointError.None && currentError != JointError.Broken)
		{
			return currentError;
		}
		if (speed == null)
		{
			return currentError;
		}
		FrameState frameState = baseState.FrameState;
		FrameSectionState frameSectionState = getSectionState(frameState);
		speed.AppendSample(new PositionInstance(baseState.TimeStamp, frameSectionState.CurrentTicks));
		if (!frameSectionState.Moving)
		{
			return currentError;
		}
		if (speed.ThresholdSpeed < 12.0)
		{
			currentError = JointError.Stalling;
		}
		if (frameSectionState.CurrentTicks < 20)
		{
			return currentError;
		}
		logger.LogInformation($"{identifier} Movement Speed: {speed.InstaneousSpeed.GetValueOrDefault()}");
		if (speed.InstaneousSpeed == 0.0 && speed.PreviousInstaneousSpeed(1) > 15.0)
		{
			currentError = JointError.LostTickTracking;
		}
		else if (speed.InstaneousSpeed == 0.0 && Enumerable.Range(1, 3).All((int x) => speed.PreviousInstaneousSpeed(x) == 0.0) && speed.PreviousInstaneousSpeed(4) > 6.0)
		{
			currentError = JointError.LostTickTracking;
		}
		else if (speed.InstaneousSpeed == 0.0 && Enumerable.Range(1, 10).All((int x) => speed.PreviousInstaneousSpeed(x) == 0.0))
		{
			currentError = JointError.LostTickTracking;
		}
		return currentError;
	}

	public static JointAdapter CreateTorso(ILogger<JointAdapter> logger, IStatsd statsd, IAdjustableBase trimix)
	{
		return new TorsoDualJointAdapter((CreateLeftTorso(logger, statsd, trimix), CreateRightTorso(logger, statsd, trimix)), logger, statsd, trimix, "Sync Torso", (IAdjustableBase t, double f, double a, CancellationToken c) => t.SetTorsoAngle(f, a, c), (IAdjustableBase t, CancellationToken c) => t.StopTorso(c), (FrameState f) => f.Left.Torso, (SystemFlags f) => (f.LeftTorso != MotorStatus.Working) ? f.LeftTorso : f.RightTorso);
	}

	public static JointAdapter CreateLeftTorso(ILogger<JointAdapter> logger, IStatsd statsd, IAdjustableBase trimix)
	{
		return new JointAdapter(logger, statsd, trimix, "Left Torso", (IAdjustableBase t, double f, double a, CancellationToken c) => t.SetLeftTorsoAngle(f, a, c), (IAdjustableBase t, CancellationToken c) => t.StopLeftTorso(c), (FrameState f) => f.Left.Torso, (SystemFlags f) => f.LeftTorso);
	}

	public static JointAdapter CreateRightTorso(ILogger<JointAdapter> logger, IStatsd statsd, IAdjustableBase trimix)
	{
		return new JointAdapter(logger, statsd, trimix, "Right Torso", (IAdjustableBase t, double f, double a, CancellationToken c) => t.SetRightTorsoAngle(f, a, c), (IAdjustableBase t, CancellationToken c) => t.StopRightTorso(c), (FrameState f) => f.Right.Torso, (SystemFlags f) => f.RightTorso);
	}

	public static JointAdapter CreateLeg(ILogger<JointAdapter> logger, IStatsd statsd, IAdjustableBase trimix)
	{
		return new TorsoDualJointAdapter((CreateLeftLeg(logger, statsd, trimix), CreateRightLeg(logger, statsd, trimix)), logger, statsd, trimix, "Sync Leg", (IAdjustableBase t, double f, double a, CancellationToken c) => t.SetLegAngle(f, a, c), (IAdjustableBase t, CancellationToken c) => t.StopLeg(c), (FrameState f) => f.Left.Leg, (SystemFlags f) => (f.LeftLeg != MotorStatus.Working) ? f.LeftLeg : f.RightLeg);
	}

	public static JointAdapter CreateLeftLeg(ILogger<JointAdapter> logger, IStatsd statsd, IAdjustableBase trimix)
	{
		return new JointAdapter(logger, statsd, trimix, "Left Leg", (IAdjustableBase t, double f, double a, CancellationToken c) => t.SetLeftLegAngle(f, a, c), (IAdjustableBase t, CancellationToken c) => t.StopLeftLeg(c), (FrameState f) => f.Left.Leg, (SystemFlags f) => f.LeftLeg);
	}

	public static JointAdapter CreateRightLeg(ILogger<JointAdapter> logger, IStatsd statsd, IAdjustableBase trimix)
	{
		return new JointAdapter(logger, statsd, trimix, "Right Leg", (IAdjustableBase t, double f, double a, CancellationToken c) => t.SetRightLegAngle(f, a, c), (IAdjustableBase t, CancellationToken c) => t.StopRightLeg(c), (FrameState f) => f.Right.Leg, (SystemFlags f) => f.RightLeg);
	}

	public async Task ResetFlags(CancellationToken cancellationToken)
	{
		await trimix.ResetSystemFlags(default);
	}

	public void FixTransientError(string message, Request? request)
	{
		throw new MovementError(message, request);
	}

	public void FixMovementSensorTrigger(string message)
	{
		throw new MovementSensorTrigger(message);
	}
}
