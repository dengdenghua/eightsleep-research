using System.Threading;
using System.Threading.Tasks;

namespace Eight.Audio.StateMachine.Tasks;

public sealed class NoTask : IPlayerTask
{
	public Task<(bool, IPlayerTask?)> TryComplete(CancellationToken cancellation)
	{
		return Task.FromResult<(bool, IPlayerTask)>((true, null));
	}
}
