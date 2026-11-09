using System.Threading;
using System.Threading.Tasks;
using Eight.Speaker;

namespace Eight.Audio.StateMachine;

public interface ISpeakerUpdater
{
	Task<SpeakerUpdateResult> Update(ISpeaker adjustableBase, CancellationToken cancellationToken);
}
