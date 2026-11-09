namespace Eight.Capybara.AdjustableBase.Joints;

public record MoveRequest(double TargetAngle, double FeedRate, bool IgnoreMovementSensor, bool IgnoreSideSync = false) : Request;
