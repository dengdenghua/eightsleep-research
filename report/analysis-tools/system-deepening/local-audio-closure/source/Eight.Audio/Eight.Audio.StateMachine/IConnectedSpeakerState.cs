using System.Threading;
using System.Threading.Tasks;

namespace Eight.Audio.StateMachine;

public interface IConnectedSpeakerState
{
	Task Disconnect(CancellationToken cancellationToken);
}
