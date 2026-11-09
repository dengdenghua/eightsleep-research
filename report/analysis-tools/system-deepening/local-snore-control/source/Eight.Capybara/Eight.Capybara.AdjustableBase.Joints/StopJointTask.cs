using System.Threading;
using System.Threading.Tasks;

namespace Eight.Capybara.AdjustableBase.Joints;

public class StopJointTask : JointTask
{
	private readonly IJointBaseAdapter jointBaseAdapter;

	public StopJointTask(IJointBaseAdapter jointBaseAdapter)
	{
		this.jointBaseAdapter = jointBaseAdapter;
	}

	public override async Task<bool> TryComplete(CancellationToken cancellation)
	{
		await jointBaseAdapter.Stop(cancellation);
		return true;
	}
}
