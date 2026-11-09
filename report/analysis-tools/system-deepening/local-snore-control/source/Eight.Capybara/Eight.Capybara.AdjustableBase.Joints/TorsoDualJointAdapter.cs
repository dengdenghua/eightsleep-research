using System;
using System.Threading;
using System.Threading.Tasks;
using Eight.Accessory.BedFrame;
using Eight.Capybara.Observability;
using Microsoft.Extensions.Logging;

namespace Eight.Capybara.AdjustableBase.Joints;

public class TorsoDualJointAdapter : JointAdapter
{
	private readonly (JointAdapter left, JointAdapter right) innerJointAdapters;

	public (JointAdapter, JointAdapter) InnerJointAdapters => innerJointAdapters;

	public TorsoDualJointAdapter((JointAdapter, JointAdapter) innerJointAdapters, ILogger<JointAdapter> logger, IStatsd statsd, IAdjustableBase trimix, string identifier, Func<IAdjustableBase, double, double, CancellationToken, Task> set, Func<IAdjustableBase, CancellationToken, Task> stop, Func<FrameState, FrameSectionState> getSectionState, Func<SystemFlags, MotorStatus> getFlag)
		: base(logger, statsd, trimix, identifier, set, stop, getSectionState, getFlag)
	{
		this.innerJointAdapters = innerJointAdapters;
	}

	public override void SetLastUpdatedAngle(double angle)
	{
		base.SetLastUpdatedAngle(angle);
		innerJointAdapters.left.SetLastUpdatedAngle(angle);
		innerJointAdapters.right.SetLastUpdatedAngle(angle);
	}

	public override JointStateUpdate BaseStateUpdateToJointStateUpdate(BaseStateUpdate baseState)
	{
		(JointAdapter left, JointAdapter right) tuple = innerJointAdapters;
		JointAdapter item = tuple.left;
		JointAdapter item2 = tuple.right;
		(JointStateUpdate, JointStateUpdate) innerJointStateUpdates = (item.BaseStateUpdateToJointStateUpdate(baseState), item2.BaseStateUpdateToJointStateUpdate(baseState));
		JointStateUpdate jointStateUpdate = base.BaseStateUpdateToJointStateUpdate(baseState);
		JointError error;
		if (Math.Abs(innerJointStateUpdates.Item1.Angle - innerJointStateUpdates.Item2.Angle) > 5.0)
		{
			error = JointError.SideSync;
		}
		else
		{
			JointError error2 = innerJointStateUpdates.Item1.Error;
			JointError error3 = innerJointStateUpdates.Item2.Error;
			JointError jointError;
			if (error2 != JointError.LostTickTracking && error3 != JointError.LostTickTracking)
			{
				if (error2 != JointError.HallMismatch && error3 != JointError.HallMismatch)
				{
					if (error2 != JointError.SpikeOverload && error3 != JointError.SpikeOverload)
					{
						if (error2 != JointError.Stalling && error3 != JointError.Stalling)
						{
							jointError = ((innerJointStateUpdates.Item1.Error == JointError.None) ? innerJointStateUpdates.Item2.Error : innerJointStateUpdates.Item1.Error);
						}
						else
						{
							jointError = JointError.Stalling;
						}
					}
					else
					{
						jointError = JointError.SpikeOverload;
					}
				}
				else
				{
					jointError = JointError.HallMismatch;
				}
			}
			else
			{
				jointError = JointError.LostTickTracking;
			}
			error = jointError;
		}
		return new TorsoDualStateUpdate(innerJointStateUpdates, jointStateUpdate.Timestamp, jointStateUpdate.Angle, jointStateUpdate.Ticks, jointStateUpdate.LastRequestedAngle, innerJointStateUpdates.Item1.IsMoving || innerJointStateUpdates.Item2.IsMoving, error);
	}

	public override void ResetSpeedTracking()
	{
		var (jointAdapter, jointAdapter2) = innerJointAdapters;
		jointAdapter.ResetSpeedTracking();
		jointAdapter2.ResetSpeedTracking();
	}
}
