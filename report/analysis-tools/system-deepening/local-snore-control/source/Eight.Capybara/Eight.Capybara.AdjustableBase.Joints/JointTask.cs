using System.Threading;
using System.Threading.Tasks;

namespace Eight.Capybara.AdjustableBase.Joints;

public abstract class JointTask
{
	protected JointStateUpdate? lastStateUpdate;

	public virtual Power PowerRequirement => Power.None;

	public void OnStateUpdate(JointStateUpdate stateUpdate)
	{
		lastStateUpdate = stateUpdate;
	}

	public abstract Task<bool> TryComplete(CancellationToken cancellation);
}
