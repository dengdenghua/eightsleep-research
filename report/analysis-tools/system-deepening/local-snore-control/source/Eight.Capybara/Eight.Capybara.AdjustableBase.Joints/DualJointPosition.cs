namespace Eight.Capybara.AdjustableBase.Joints;

public record DualJointPosition(double CurrentAngle, int CurrentTicks, double LastRequestedAngle, JointPosition LeftPosition, JointPosition RightPosition) : JointPosition(CurrentAngle, CurrentTicks, LastRequestedAngle), IDualJointPosition;
