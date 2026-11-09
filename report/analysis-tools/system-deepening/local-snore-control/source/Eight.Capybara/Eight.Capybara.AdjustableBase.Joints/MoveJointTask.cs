using System;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.Capybara.AdjustableBase.Joints;

public class MoveJointTask : JointTask, IMovingJointTask
{
	private readonly ILogger<MoveJointTask> logger;

	private readonly IJointBaseAdapter jointBaseAdapter;

	private readonly IClock clock;

	public MoveRequest MoveRequest;

	private Instant? startedAt;

	private JointStateUpdate? startingState;

	private readonly Duration maxDuration = Duration.FromMinutes(2L);

	private readonly MovePowerSequence powerSequence;

	private double lastPower;

	public MovementDirection Direction
	{
		get
		{
			if (!(MoveRequest.TargetAngle > startingState?.Angle))
			{
				return MovementDirection.Down;
			}
			return MovementDirection.Up;
		}
	}

	public override Power PowerRequirement
	{
		get
		{
			Instant? instant = startedAt;
			if (instant.HasValue)
			{
				Instant currentInstant = clock.GetCurrentInstant();
				instant = startedAt;
				if (!(currentInstant - instant < Duration.FromSeconds(1L)))
				{
					return Power.Low;
				}
			}
			return Power.High;
		}
	}

	public MoveJointTask(ILogger<MoveJointTask> logger, IJointBaseAdapter jointBaseAdapter, IClock clock, MoveRequest moveRequest)
	{
		this.logger = logger;
		this.jointBaseAdapter = jointBaseAdapter;
		this.clock = clock;
		MoveRequest = moveRequest;
		powerSequence = new MovePowerSequence(moveRequest, Direction);
	}

	public override async Task<bool> TryComplete(CancellationToken cancellation)
	{
		Instant? instant = startedAt;
		if (!instant.HasValue)
		{
			await jointBaseAdapter.ResetFlags(cancellation);
			startingState = lastStateUpdate;
			lastPower = powerSequence.GetNextPower(startingState?.Angle);
			if (startingState?.Angle == MoveRequest.TargetAngle && MoveRequest.TargetAngle != 0.0)
			{
				return true;
			}
			await jointBaseAdapter.MoveToAngle(MoveRequest.TargetAngle, lastPower, cancellation);
			jointBaseAdapter.SetLastUpdatedAngle(MoveRequest.TargetAngle);
			startedAt = clock.GetCurrentInstant();
			return false;
		}
		if ((object)lastStateUpdate == null)
		{
			return false;
		}
		Instant currentInstant = clock.GetCurrentInstant();
		instant = startedAt;
		if (currentInstant - instant > maxDuration)
		{
			await jointBaseAdapter.Stop(cancellation);
			return true;
		}
		switch (lastStateUpdate.Error)
		{
		case JointError.Overload:
			if (!lastStateUpdate.IsMoving)
			{
				return true;
			}
			await jointBaseAdapter.ResetFlags(cancellation);
			break;
		case JointError.Broken:
			if (Direction == MovementDirection.Up)
			{
				MoveRequest = MoveRequest with
				{
					FeedRate = MoveRequest.FeedRate + 5.0
				};
				if (MoveRequest.FeedRate > 100.0)
				{
					await jointBaseAdapter.Stop(cancellation);
					return true;
				}
				await jointBaseAdapter.MoveToAngle(MoveRequest.TargetAngle, MoveRequest.FeedRate, cancellation);
				jointBaseAdapter.SetLastUpdatedAngle(MoveRequest.TargetAngle);
				await jointBaseAdapter.ResetFlags(cancellation);
			}
			break;
		case JointError.MovementSensor:
			if (MoveRequest.IgnoreMovementSensor)
			{
				logger.LogInformation("Movement Sensor Triggers but ignoring due to MoveRequest");
				break;
			}
			logger.LogInformation("Movement Sensor Trigger, cancelling movement");
			await jointBaseAdapter.Stop(cancellation);
			jointBaseAdapter.FixMovementSensorTrigger("Movement Sensor Trigger, cancelling movement");
			return true;
		case JointError.LostTickTracking:
		case JointError.HallMismatch:
			if (Direction == MovementDirection.Up && MoveRequest.TargetAngle != 0.0)
			{
				await jointBaseAdapter.Stop(cancellation);
				jointBaseAdapter.FixTransientError("Detected lost tick tracking", null);
				return true;
			}
			break;
		case JointError.SideSync:
			if (MoveRequest.TargetAngle != 0.0 && !MoveRequest.IgnoreSideSync)
			{
				await jointBaseAdapter.Stop(cancellation);
				jointBaseAdapter.FixTransientError("Detected side sync", null);
			}
			break;
		}
		if (lastStateUpdate.IsMoving)
		{
			if (lastPower != powerSequence.GetNextPower(lastStateUpdate.Angle))
			{
				lastPower = powerSequence.GetLastPower();
				await jointBaseAdapter.MoveToAngle(MoveRequest.TargetAngle, lastPower, cancellation);
				jointBaseAdapter.SetLastUpdatedAngle(MoveRequest.TargetAngle);
			}
			return false;
		}
		currentInstant = clock.GetCurrentInstant();
		instant = startedAt;
		return currentInstant - instant > Duration.FromSeconds(1L);
	}

	public JointPosition ToJointPosition()
	{
		return new MovingJointPosition((lastStateUpdate ?? throw new InvalidOperationException("no last state (missing a Refresh?)")).Angle, (lastStateUpdate ?? throw new InvalidOperationException("no last state (missing a Refresh?)")).Ticks, MoveRequest.TargetAngle, startingState?.Angle ?? lastStateUpdate.Angle, MoveRequest.TargetAngle, MoveRequest.FeedRate);
	}
}
