using System;
using System.Threading;
using System.Threading.Tasks;

namespace Eight.Audio.StateMachine.States;

public class DebugSpeaker : ISpeakerState
{
	public Task<ISpeakerState> GetNextState(CancellationToken cancellationToken)
	{
		throw new NotImplementedException();
	}

	public ValueTask DisposeAsync()
	{
		return ValueTask.CompletedTask;
	}
}
