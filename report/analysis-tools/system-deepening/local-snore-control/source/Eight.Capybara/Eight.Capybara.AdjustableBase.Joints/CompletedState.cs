using System.Threading.Tasks;

namespace Eight.Capybara.AdjustableBase.Joints;

internal class CompletedState : State
{
	public override Task<State> Next(JointStateUpdate currentState)
	{
		return Task.FromResult((State)this);
	}
}
