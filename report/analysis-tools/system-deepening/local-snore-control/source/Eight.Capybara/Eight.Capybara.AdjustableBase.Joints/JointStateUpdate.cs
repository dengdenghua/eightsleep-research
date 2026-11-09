using NodaTime;

namespace Eight.Capybara.AdjustableBase.Joints;

public record JointStateUpdate(Instant Timestamp, double Angle, int Ticks, double? LastRequestedAngle, bool IsMoving, JointError Error);
