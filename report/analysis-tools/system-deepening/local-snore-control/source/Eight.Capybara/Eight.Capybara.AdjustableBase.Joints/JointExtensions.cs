namespace Eight.Capybara.AdjustableBase.Joints;

public static class JointExtensions
{
	public static MovementDirection GetDirectionFromStartAngle(this MoveRequest request, double startAngle)
	{
		if (!(request.TargetAngle > startAngle))
		{
			return MovementDirection.Down;
		}
		return MovementDirection.Up;
	}
}
