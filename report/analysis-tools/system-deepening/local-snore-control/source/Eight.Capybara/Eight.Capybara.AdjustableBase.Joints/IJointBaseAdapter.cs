using System.Threading;
using System.Threading.Tasks;

namespace Eight.Capybara.AdjustableBase.Joints;

public interface IJointBaseAdapter
{
	Task ResetFlags(CancellationToken cancellationToken);

	Task MoveToAngle(double targetAngle, double feedRate, CancellationToken cancellation);

	void SetLastUpdatedAngle(double angle);

	Task Stop(CancellationToken cancellation);

	void FixTransientError(string message, Request? request);

	void FixMovementSensorTrigger(string message);

	JointStateUpdate BaseStateUpdateToJointStateUpdate(BaseStateUpdate baseStateUpdate);
}
