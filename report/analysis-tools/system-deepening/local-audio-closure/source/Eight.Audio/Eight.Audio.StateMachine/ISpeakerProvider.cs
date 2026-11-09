using System.Collections.Generic;
using System.Threading;

namespace Eight.Audio.StateMachine;

public interface ISpeakerProvider
{
	ISpeakerState GetCurrentSpeakerState();

	void SetCurrentSpeaker(Address adjustableBaseAddress);

	bool TryRemoveCurrentSpeaker();

	bool TryStartPairFirstFound();

	IAsyncEnumerable<ScanResult> GetAvailableAddresses(CancellationToken cancellationToken);
}
