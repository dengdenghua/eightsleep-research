namespace Eight.Capybara.DeviceAPI.Handlers;

public record SetAngleRequest(double FeedRate, double? TorsoAngle, double? LegAngle, bool? SnoreMitigation, bool? IgnoreMovementSensor, Side? Side);
