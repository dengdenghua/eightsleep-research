namespace Eight.Capybara.AdjustableBase.Joints;

public record MovingJointPosition(double CurrentAngle, int CurrentTicks, double LastRequestedAngle, double StartAngle, double TargetAngle, double FeedRate) : JointPosition(CurrentAngle, CurrentTicks, LastRequestedAngle);
