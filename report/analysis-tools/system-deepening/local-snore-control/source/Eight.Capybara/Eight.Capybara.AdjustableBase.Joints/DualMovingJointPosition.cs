namespace Eight.Capybara.AdjustableBase.Joints;

public record DualMovingJointPosition(double CurrentAngle, int CurrentTicks, double LastRequestedAngle, double StartAngle, double TargetAngle, double FeedRate, JointPosition LeftPosition, JointPosition RightPosition) : MovingJointPosition(CurrentAngle, CurrentTicks, LastRequestedAngle, StartAngle, TargetAngle, FeedRate), IDualJointPosition;
