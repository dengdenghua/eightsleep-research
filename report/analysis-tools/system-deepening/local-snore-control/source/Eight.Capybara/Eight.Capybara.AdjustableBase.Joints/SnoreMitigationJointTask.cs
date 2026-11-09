using System;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.Capybara.AdjustableBase.Joints;

public class SnoreMitigationJointTask : JointTask, IMovingJointTask
{
	private readonly ILogger<SnoreMitigationJointTask> logger;

	private readonly TorsoDualJointAdapter jointBaseAdapter;

	private readonly IClock clock;

	private SnoreMitigationRequest request;

	private (State left, State right)? currentStates;

	private (JointStateUpdate left, JointStateUpdate right)? startingStates;

	private readonly (Func<State> left, Func<State> right) moves;

	private readonly (Func<Duration, State> left, Func<Duration, State> right) pauses;

	public override Power PowerRequirement => Power.High;

	public SnoreMitigationJointTask(ILogger<SnoreMitigationJointTask> logger, IJointBaseAdapter jointBaseAdapter, IClock clock, SnoreMitigationRequest request)
	{
		SnoreMitigationJointTask snoreMitigationJointTask = this;
		this.logger = logger;
		this.jointBaseAdapter = (TorsoDualJointAdapter)jointBaseAdapter;
		this.clock = clock;
		this.request = request;
		(JointAdapter, JointAdapter) innerJointAdapters = this.jointBaseAdapter.InnerJointAdapters;
		JointAdapter leftAdapter = innerJointAdapters.Item1;
		JointAdapter rightAdapter = innerJointAdapters.Item2;
		Func<State> moveLeft = () => (!snoreMitigationJointTask.request.LeftTargetAngle.HasValue) ? ((State)new CompletedState()) : ((State)new MovingState(clock, (string s) =>
		{
			logger.LogInformation("LEFT: " + s);
		}, leftAdapter, snoreMitigationJointTask.request.LeftTargetAngle.Value, snoreMitigationJointTask.request.LeftTrackingAngle ?? snoreMitigationJointTask.request.LeftTargetAngle.Value));
		Func<State> moveRight = () => (!snoreMitigationJointTask.request.RightTargetAngle.HasValue) ? ((State)new CompletedState()) : ((State)new MovingState(clock, (string s) =>
		{
			logger.LogInformation("RIGHT: " + s);
		}, rightAdapter, snoreMitigationJointTask.request.RightTargetAngle.Value, snoreMitigationJointTask.request.RightTrackingAngle ?? snoreMitigationJointTask.request.RightTargetAngle.Value));
		moves = (left: moveLeft, right: moveRight);
		pauses = (left: (Duration duration) => new PauseState(clock, leftAdapter, duration, moveLeft), right: (Duration duration) => new PauseState(clock, rightAdapter, duration, moveRight));
	}

	private static SnoreMitigationRequest ModifyRequestIfRequired(SnoreMitigationRequest request, JointStateUpdate leftUpdate, JointStateUpdate rightUpdate)
	{
		if (request.SynchronousMovement)
		{
			return request;
		}
		if (request.LeftTargetAngle.HasValue)
		{
			request = request with
			{
				LeftTrackingAngle = request.LeftTargetAngle,
				RightTargetAngle = (rightUpdate.LastRequestedAngle ?? rightUpdate.Angle),
				RightTrackingAngle = (rightUpdate.LastRequestedAngle ?? rightUpdate.Angle)
			};
			double num = request.LeftTargetAngle.Value - request.RightTargetAngle.Value;
			if (Math.Abs(num) > 10.0)
			{
				request = ((!(num > 0.0)) ? request with
				{
					LeftTargetAngle = request.RightTargetAngle.Value - 10.0
				} : request with
				{
					RightTargetAngle = request.LeftTargetAngle.Value - 10.0
				});
			}
		}
		else if (request.RightTargetAngle.HasValue)
		{
			request = request with
			{
				RightTrackingAngle = request.RightTargetAngle,
				LeftTargetAngle = (leftUpdate.LastRequestedAngle ?? leftUpdate.Angle),
				LeftTrackingAngle = (leftUpdate.LastRequestedAngle ?? leftUpdate.Angle)
			};
			double num2 = request.RightTargetAngle.Value - request.LeftTargetAngle.Value;
			if (Math.Abs(num2) > 10.0)
			{
				request = ((!(num2 > 0.0)) ? request with
				{
					RightTargetAngle = request.LeftTargetAngle.Value - 10.0
				} : request with
				{
					LeftTargetAngle = request.RightTargetAngle.Value - 10.0
				});
			}
		}
		return request;
	}

	public override async Task<bool> TryComplete(CancellationToken cancellation)
	{
		if ((object)lastStateUpdate == null)
		{
			throw new InvalidOperationException("No last state (missing a Refresh?)");
		}
		(JointStateUpdate, JointStateUpdate) innerJointStateUpdates = ((TorsoDualStateUpdate)lastStateUpdate).InnerJointStateUpdates;
		JointStateUpdate item = innerJointStateUpdates.Item1;
		JointStateUpdate updateRight = innerJointStateUpdates.Item2;
		(JointStateUpdate, JointStateUpdate)? tuple = startingStates;
		if (!tuple.HasValue)
		{
			request = ModifyRequestIfRequired(request, item, updateRight);
			startingStates = (item, updateRight);
			if (SideAtPosition(item, request.LeftTargetAngle) && SideAtPosition(updateRight, request.RightTargetAngle))
			{
				return true;
			}
		}
		var (jointAdapter, rightAdapter) = jointBaseAdapter.InnerJointAdapters;
		if (lastStateUpdate.Error == JointError.LostTickTracking || lastStateUpdate.Error == JointError.HallMismatch)
		{
			await jointAdapter.Stop(cancellation);
			await rightAdapter.Stop(cancellation);
			logger.LogInformation("Detected lost tick tracking");
			jointBaseAdapter.FixTransientError("Detected lost tick tracking", null);
			return true;
		}
		if (lastStateUpdate.Error == JointError.SideSync && request.SynchronousMovement && request.LeftTargetAngle.Value != 0.0)
		{
			await jointAdapter.Stop(cancellation);
			await rightAdapter.Stop(cancellation);
			logger.LogInformation("Detected side sync error");
			jointBaseAdapter.FixTransientError("Detected side sync error", request);
			return true;
		}
		(State, State)? tuple3 = currentStates;
		if (!tuple3.HasValue)
		{
			currentStates = (moves.left(), moves.right());
		}
		(State left, State right) states = currentStates.Value;
		var (state, state2) = states;
		if (Math.Abs(item.Angle - updateRight.Angle) > 4.0 && request.SynchronousMovement)
		{
			bool flag = Math.Abs(item.Angle - request.LeftTargetAngle.Value) < Math.Abs(updateRight.Angle - request.RightTargetAngle.Value);
			Task<State> task = (flag ? pauses.left(Duration.FromSeconds(5L)) : state).Next(item);
			currentStates = new ValueTuple<State, State>(item2: await ((!flag) ? pauses.right(Duration.FromSeconds(5L)) : state2).Next(updateRight), item1: await task);
		}
		else
		{
			currentStates = (await states.left.Next(item), await states.right.Next(updateRight));
		}
		switch (lastStateUpdate.Error)
		{
		case JointError.MovementSensor:
			if (request.IgnoreMovementSensor)
			{
				logger.LogInformation("Movement Sensor Triggers but ignoring due to MoveRequest");
				break;
			}
			logger.LogInformation("Movement Sensor Trigger, cancelling movement");
			await jointBaseAdapter.Stop(cancellation);
			jointBaseAdapter.FixMovementSensorTrigger("Movement Sensor Trigger, cancelling movement");
			return true;
		case JointError.Broken:
			await jointBaseAdapter.ResetFlags(cancellation);
			break;
		}
		tuple3 = currentStates;
		int result;
		if (tuple3.HasValue)
		{
			(State, State) valueOrDefault = tuple3.GetValueOrDefault();
			if (valueOrDefault.Item1 is CompletedState)
			{
				result = ((valueOrDefault.Item2 is CompletedState) ? 1 : 0);
				goto IL_080b;
			}
		}
		result = 0;
		goto IL_080b;
		IL_080b:
		return (byte)result != 0;
	}

	private bool IsInTargetRange(double currentPosition, double TargetAngle)
	{
		return currentPosition == TargetAngle;
	}

	private bool SideAtPosition(JointStateUpdate update, double? TargetAngle)
	{
		if (TargetAngle.HasValue)
		{
			if (IsInTargetRange(update.Angle, TargetAngle.Value))
			{
				if (TargetAngle == 0.0)
				{
					(State, State)? tuple = currentStates;
					return tuple.HasValue;
				}
				return true;
			}
			return false;
		}
		return true;
	}

	public JointPosition ToJointPosition()
	{
		if (!(lastStateUpdate is TorsoDualStateUpdate))
		{
			return new MovingJointPosition((lastStateUpdate ?? throw new InvalidOperationException("no last state (missing a Refresh?)")).Angle, (lastStateUpdate ?? throw new InvalidOperationException("no last state (missing a Refresh?)")).Ticks, request.LeftTargetAngle ?? request.RightTargetAngle.GetValueOrDefault(), startingStates?.left.Angle ?? lastStateUpdate.Angle, request.LeftTargetAngle ?? request.RightTargetAngle.GetValueOrDefault(), (currentStates?.left as MovingState)?.CurrentPower ?? 0.0);
		}
		var (jointStateUpdate, jointStateUpdate2) = (lastStateUpdate as TorsoDualStateUpdate).InnerJointStateUpdates;
		if ((object)jointStateUpdate == null)
		{
			throw new InvalidOperationException("no last state (missing a Refresh?)");
		}
		double angle = jointStateUpdate.Angle;
		if ((object)jointStateUpdate == null)
		{
			throw new InvalidOperationException("no last state (missing a Refresh?)");
		}
		JointPosition leftPosition = new MovingJointPosition(angle, jointStateUpdate.Ticks, jointStateUpdate.LastRequestedAngle ?? request.LeftTargetAngle.GetValueOrDefault(), startingStates?.left.Angle ?? jointStateUpdate.Angle, request.LeftTargetAngle ?? jointStateUpdate.Angle, (currentStates?.left as MovingState)?.CurrentPower ?? 0.0);
		if ((object)jointStateUpdate2 == null)
		{
			throw new InvalidOperationException("no last state (missing a Refresh?)");
		}
		double angle2 = jointStateUpdate2.Angle;
		if ((object)jointStateUpdate2 == null)
		{
			throw new InvalidOperationException("no last state (missing a Refresh?)");
		}
		JointPosition rightPosition = new MovingJointPosition(angle2, jointStateUpdate2.Ticks, jointStateUpdate2.LastRequestedAngle ?? request.RightTargetAngle.GetValueOrDefault(), startingStates?.right.Angle ?? jointStateUpdate2.Angle, request.RightTargetAngle ?? jointStateUpdate2.Angle, (currentStates?.right as MovingState)?.CurrentPower ?? 0.0);
		return new DualMovingJointPosition((lastStateUpdate ?? throw new InvalidOperationException("no last state (missing a Refresh?)")).Angle, (lastStateUpdate ?? throw new InvalidOperationException("no last state (missing a Refresh?)")).Ticks, request.LeftTargetAngle ?? request.RightTargetAngle.GetValueOrDefault(), startingStates?.left.Angle ?? lastStateUpdate.Angle, request.LeftTargetAngle ?? request.RightTargetAngle.GetValueOrDefault(), (currentStates?.left as MovingState)?.CurrentPower ?? 0.0, leftPosition, rightPosition);
	}
}
