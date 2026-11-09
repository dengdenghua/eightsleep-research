namespace Eight.Capybara.AdjustableBase.Joints;

public record SnoreMitigationRequest(double? LeftTargetAngle, double? RightTargetAngle, double? LeftTrackingAngle, double? RightTrackingAngle, bool IgnoreMovementSensor, bool SynchronousMovement, int Attempts = 0) : Request;
