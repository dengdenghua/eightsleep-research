using NodaTime;

namespace Eight.Capybara.AdjustableBase.Joints;

public record TorsoDualStateUpdate((JointStateUpdate left, JointStateUpdate right) InnerJointStateUpdates, Instant Timestamp, double Angle, int Ticks, double? LastRequestedAngle, bool IsMoving, JointError Error) : JointStateUpdate(Timestamp, Angle, Ticks, LastRequestedAngle, IsMoving, Error);
