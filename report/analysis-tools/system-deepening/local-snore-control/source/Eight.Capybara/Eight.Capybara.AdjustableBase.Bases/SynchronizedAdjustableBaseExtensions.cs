using Eight.Capybara.AdjustableBase.Joints;

namespace Eight.Capybara.AdjustableBase.Bases;

public static class SynchronizedAdjustableBaseExtensions
{
	public static SynchronizedAdjustableBase SetMitigationAngle(this SynchronizedAdjustableBase frame, double? leftTorsoAngle, double? rightTorsoAngle, double feedRate, bool? ignoreMovementSensor)
	{
		if (frame.HardwareInfo.HardwareVersion == "2")
		{
			frame.SetTorsoAngle(leftTorsoAngle ?? rightTorsoAngle, feedRate, ignoreMovementSensor == true);
			return frame;
		}
		frame.TorsoJoint.MakeRequest(new SnoreMitigationRequest(leftTorsoAngle, rightTorsoAngle, leftTorsoAngle, rightTorsoAngle, ignoreMovementSensor == true, leftTorsoAngle == rightTorsoAngle));
		return frame;
	}

	public static SynchronizedAdjustableBase SetTorsoAngle(this SynchronizedAdjustableBase frame, double? torsoAngle, double feedRate, bool? ignoreMovementSensor)
	{
		if (torsoAngle.HasValue)
		{
			frame.TorsoJoint.MakeRequest(new MoveRequest(torsoAngle.Value, feedRate, ignoreMovementSensor == true));
		}
		return frame;
	}

	public static SynchronizedAdjustableBase SetLegAngle(this SynchronizedAdjustableBase frame, double? legAngle, double feedRate, bool? ignoreMovementSensor)
	{
		if (legAngle.HasValue)
		{
			frame.LegJoint.MakeRequest(new MoveRequest(legAngle.Value, feedRate, ignoreMovementSensor == true));
		}
		return frame;
	}
}
