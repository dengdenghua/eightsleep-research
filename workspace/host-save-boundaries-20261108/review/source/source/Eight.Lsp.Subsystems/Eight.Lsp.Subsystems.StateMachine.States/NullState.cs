using System;
using System.Threading;
using System.Threading.Tasks;
using Eight.Lsp.Subsystems.Models;

namespace Eight.Lsp.Subsystems.StateMachine.States;

public class NullState(ISubsystemStateFactory stateFactory, TimeProvider timeProvider, Func<bool> isEnabled, Side side) : ISubsystemState
{
	private readonly ISubsystemStateFactory stateFactory = stateFactory;

	private readonly TimeProvider timeProvider = timeProvider;

	private readonly Func<bool> isEnabled = isEnabled;

	private readonly Side side = side;

	public async Task<ISubsystemState> GetNextState(CancellationToken cancellation)
	{
		while (!isEnabled())
		{
			await Task.Delay(TimeSpan.FromSeconds(10L), timeProvider, cancellation);
		}
		return stateFactory.CreateNotConnectedState(side);
	}
}
