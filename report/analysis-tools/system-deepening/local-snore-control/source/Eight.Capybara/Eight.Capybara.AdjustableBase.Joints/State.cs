using System.Threading.Tasks;

namespace Eight.Capybara.AdjustableBase.Joints;

public abstract class State
{
	public abstract Task<State> Next(JointStateUpdate currentState);
}
