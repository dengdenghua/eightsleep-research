using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Eight.Capybara.Observability;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.Capybara.AdjustableBase.Joints;

public class Joint : IJoint
{
	private readonly ILogger<Joint> logger;

	private readonly IStatsd statsd;

	private readonly IClock clock;

	private readonly IJointBaseAdapter jointBaseAdapter;

	private readonly string identifier;

	private readonly IJointTaskFactory jointTaskFactory;

	protected JointStateUpdate? lastStateUpdate;

	private JointTask[] taskQueue = Array.Empty<JointTask>();

	public JointPosition CurrentPosition
	{
		get
		{
			if (taskQueue.FirstOrDefault((JointTask t) => t is IMovingJointTask) is IMovingJointTask movingJointTask)
			{
				return movingJointTask.ToJointPosition();
			}
			if (lastStateUpdate is TorsoDualStateUpdate { InnerJointStateUpdates: { Item1: var item, Item2: var item2 } })
			{
				return new DualJointPosition(lastStateUpdate?.Angle ?? 0.0, lastStateUpdate?.Ticks ?? 0, (lastStateUpdate?.LastRequestedAngle).GetValueOrDefault(), new JointPosition(item.Angle, item.Ticks, item.LastRequestedAngle.GetValueOrDefault()), new JointPosition(item2.Angle, item2.Ticks, item2.LastRequestedAngle.GetValueOrDefault()));
			}
			return new JointPosition(lastStateUpdate?.Angle ?? 0.0, lastStateUpdate?.Ticks ?? 0, (lastStateUpdate?.LastRequestedAngle).GetValueOrDefault());
		}
	}

	public Power NextTaskPowerRequirement => taskQueue.FirstOrDefault()?.PowerRequirement ?? Power.None;

	public bool HasPendingTasks => taskQueue.Length != 0;

	public Joint(ILogger<Joint> logger, IStatsd statsd, IClock clock, IJointBaseAdapter jointBaseAdapter, string identifier, IJointTaskFactory jointTaskFactory, JointTask[]? taskQueue = null)
	{
		JointTask[] array = taskQueue ?? Array.Empty<JointTask>();
		this.logger = logger;
		this.statsd = statsd;
		this.jointBaseAdapter = jointBaseAdapter;
		this.clock = clock;
		this.identifier = identifier;
		this.jointTaskFactory = jointTaskFactory;
		this.taskQueue = array;
	}

	public void OnBaseStateUpdate(BaseStateUpdate baseState)
	{
		OnJointStateUpdate(jointBaseAdapter.BaseStateUpdateToJointStateUpdate(baseState));
	}

	public async Task PerformNextTask(CancellationToken cancellation)
	{
		JointTask[] array = taskQueue;
		if (array != null && array.Length >= 1)
		{
			JointTask jointTask = array[0];
			JointTask[] following = array[new Index(1)..^0];
			if (await jointTask.TryComplete(cancellation))
			{
				taskQueue = following;
				await PerformNextTask(cancellation);
			}
		}
	}

	public void MakeRequest(Request request)
	{
		OnRequest(request);
	}

	public void OnRequest(Request request)
	{
		JointTask[] array;
		if (!(request is SnoreMitigationRequest request2))
		{
			if (!(request is MoveRequest request3))
			{
				if (!(request is StopRequest))
				{
					throw new InvalidOperationException();
				}
				array = new JointTask[2]
				{
					StopJointTask(),
					PauseJointTask()
				};
			}
			else
			{
				array = HandleMoveRequest(request3);
			}
		}
		else
		{
			JointTask[] array2 = taskQueue;
			array = ((array2 == null || array2.Length != 0) ? taskQueue : new JointTask[1] { SnoreMitigationTask(request2) });
		}
		taskQueue = array;
		RefreshTasksState();
	}

	private JointTask[] HandleSnoreMigiationTake(SnoreMitigationRequest request)
	{
		JointTask[] array = taskQueue;
		if (array != null && array.Length == 0)
		{
			return new JointTask[1] { SnoreMitigationTask(request) };
		}
		return taskQueue;
	}

	private JointTask[] HandleMoveRequest(MoveRequest request)
	{
		JointTask[] array = taskQueue;
		if (array != null)
		{
			if (array.Length == 0)
			{
				if (lastStateUpdate is TorsoDualStateUpdate { InnerJointStateUpdates: { Item1: var item, Item2: var item2 } } && item.LastRequestedAngle != item2.LastRequestedAngle)
				{
					request = request with
					{
						IgnoreSideSync = true
					};
				}
				statsd.Increment("adjustableBase.movement." + identifier);
				return new JointTask[1] { MoveJointTask(request) };
			}
			JointTask jointTask = array[0];
			if (jointTask is PauseJointTask pauseJointTask)
			{
				statsd.Increment("adjustableBase.movement." + identifier);
				return new JointTask[2]
				{
					pauseJointTask,
					MoveJointTask(request)
				};
			}
			if (jointTask is StopJointTask stopJointTask)
			{
				statsd.Increment("adjustableBase.movement." + identifier);
				return new JointTask[3]
				{
					stopJointTask,
					PauseJointTask(),
					MoveJointTask(request)
				};
			}
			if (jointTask is SnoreMitigationJointTask)
			{
				return new JointTask[3]
				{
					StopJointTask(),
					PauseJointTask(),
					MoveJointTask(request)
				};
			}
			if (jointTask is MoveJointTask moveJointTask)
			{
				if (NeedsToChangeDirection(moveJointTask, request))
				{
					statsd.Increment("adjustableBase.movement." + identifier);
					statsd.Increment("adjustableBase.movement." + identifier + ".directionChange");
					return new JointTask[3]
					{
						StopJointTask(),
						PauseJointTask(),
						MoveJointTask(request)
					};
				}
				if (request.TargetAngle != moveJointTask.MoveRequest.TargetAngle)
				{
					statsd.Increment("adjustableBase.movement." + identifier + ".angleModification");
					if (RequiresExplicitStop(moveJointTask, request))
					{
						return new JointTask[3]
						{
							StopJointTask(),
							PauseJointTask(),
							MoveJointTask(request)
						};
					}
				}
				else if (request.FeedRate != moveJointTask.MoveRequest.FeedRate)
				{
					statsd.Increment("adjustableBase.movement." + identifier + ".feedRateChange");
				}
				return new JointTask[1] { MoveJointTask(request) };
			}
		}
		throw new InvalidOperationException("unhandle combination of tasks");
		static double FeedRateDelta(double feedRate)
		{
			if (feedRate > 70.0)
			{
				return 3.0;
			}
			if (feedRate > 50.0)
			{
				return 2.0;
			}
			return 1.0;
		}
		bool RequiresExplicitStop(MoveJointTask currentTask, MoveRequest moveRequest)
		{
			if (currentTask.Direction == MovementDirection.Up)
			{
				return lastStateUpdate?.Angle + FeedRateDelta(currentTask.MoveRequest.FeedRate) > moveRequest.TargetAngle;
			}
			return Math.Max((lastStateUpdate?.Angle - FeedRateDelta(currentTask.MoveRequest.FeedRate)).GetValueOrDefault(), 0.0) < moveRequest.TargetAngle;
		}
	}

	private bool NeedsToChangeDirection(MoveJointTask currentMove, MoveRequest newMove)
	{
		return newMove.GetDirectionFromStartAngle((lastStateUpdate ?? throw new InvalidOperationException("received a move before first state update")).Angle) != currentMove.Direction;
	}

	private void OnJointStateUpdate(JointStateUpdate stateUpdate)
	{
		switch (stateUpdate.Error)
		{
		case JointError.Stalling:
		{
			JointStateUpdate? jointStateUpdate3 = lastStateUpdate;
			if ((object)jointStateUpdate3 == null || jointStateUpdate3.Error != JointError.Stalling)
			{
				statsd.Increment("adjustableBase.movement." + identifier + ".stalling");
				logger.LogInformation("Detected a stalling joint: {Identifier}", identifier);
			}
			break;
		}
		case JointError.Broken:
		{
			JointStateUpdate? jointStateUpdate4 = lastStateUpdate;
			if ((object)jointStateUpdate4 == null || jointStateUpdate4.Error != JointError.Broken)
			{
				statsd.Increment("adjustableBase.movement." + identifier + ".broken");
				logger.LogInformation("Detected a broken joint: {Identifier}", identifier);
			}
			break;
		}
		case JointError.Overload:
		{
			JointStateUpdate? jointStateUpdate2 = lastStateUpdate;
			if ((object)jointStateUpdate2 == null || jointStateUpdate2.Error != JointError.Overload)
			{
				statsd.Increment("adjustableBase.movement." + identifier + ".overload");
				logger.LogInformation("Detected an overloaded joint: {Identifier}", identifier);
			}
			break;
		}
		case JointError.SpikeOverload:
		{
			JointStateUpdate? jointStateUpdate5 = lastStateUpdate;
			if ((object)jointStateUpdate5 == null || jointStateUpdate5.Error != JointError.SpikeOverload)
			{
				statsd.Increment("adjustableBase.movement." + identifier + ".spkieoverload");
				logger.LogInformation("Detected a spike overloaded joint: {Identifier}", identifier);
			}
			break;
		}
		case JointError.LowPowerSpikeOverload:
		{
			JointStateUpdate? jointStateUpdate6 = lastStateUpdate;
			if ((object)jointStateUpdate6 == null || jointStateUpdate6.Error != JointError.LowPowerSpikeOverload)
			{
				statsd.Increment("adjustableBase.movement." + identifier + ".lowpowerspikeoverload");
				logger.LogInformation("Detected a low power spike overloaded joint: {Identifier}", identifier);
			}
			break;
		}
		case JointError.LostTickTracking:
		{
			JointStateUpdate? jointStateUpdate7 = lastStateUpdate;
			if ((object)jointStateUpdate7 == null || jointStateUpdate7.Error != JointError.LostTickTracking)
			{
				statsd.Increment("adjustableBase.movement." + identifier + ".lostticktracking");
				logger.LogInformation("Detected a loss of ticks: {Identifier}", identifier);
			}
			break;
		}
		case JointError.HallMismatch:
		{
			JointStateUpdate? jointStateUpdate8 = lastStateUpdate;
			if ((object)jointStateUpdate8 == null || jointStateUpdate8.Error != JointError.HallMismatch)
			{
				statsd.Increment("adjustableBase.movement." + identifier + ".hallmismatcherror");
				logger.LogInformation("Detected a mismatch between hall setting and motor status: {Identifier}", identifier);
			}
			break;
		}
		case JointError.SideSync:
		{
			JointStateUpdate? jointStateUpdate = lastStateUpdate;
			if ((object)jointStateUpdate != null && jointStateUpdate.Error == JointError.SideSync)
			{
				break;
			}
			if (lastStateUpdate is TorsoDualStateUpdate { InnerJointStateUpdates: { Item1: var item, Item2: var item2 } })
			{
				if (item.LastRequestedAngle != item2.LastRequestedAngle)
				{
					stateUpdate = stateUpdate with
					{
						Error = JointError.None
					};
					break;
				}
				logger.LogInformation($"Detected Size Sync: {item.Angle} {item2.Angle}");
			}
			statsd.Increment("adjustableBase.movement." + identifier + ".sidesync");
			logger.LogInformation("Detected a side sync error: {Identifier}", identifier);
			break;
		}
		}
		lastStateUpdate = stateUpdate;
		RefreshTasksState();
	}

	private void RefreshTasksState()
	{
		JointTask[] array = taskQueue;
		for (int i = 0; i < array.Length; i++)
		{
			array[i].OnStateUpdate(lastStateUpdate);
		}
	}

	private JointTask PauseJointTask()
	{
		return jointTaskFactory.PauseJointTask();
	}

	private JointTask MoveJointTask(MoveRequest request)
	{
		return jointTaskFactory.MoveJointTask(jointBaseAdapter, request);
	}

	private JointTask StopJointTask()
	{
		return jointTaskFactory.StopJointTask(jointBaseAdapter);
	}

	private JointTask SnoreMitigationTask(SnoreMitigationRequest request)
	{
		return jointTaskFactory.SnoreMitigationTask(jointBaseAdapter, request);
	}
}
