using System.Threading;
using System.Threading.Tasks;

namespace Eight.Audio.StateMachine;

public interface ISpeakerState
{
	Task<ISpeakerState> GetNextState(CancellationToken cancellationToken);
}
