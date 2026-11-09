using System.Threading;
using System.Threading.Tasks;

namespace Eight.Audio.StateMachine.Tasks;

public interface IPlayerTask
{
	Task<(bool, IPlayerTask?)> TryComplete(CancellationToken cancellation);
}
