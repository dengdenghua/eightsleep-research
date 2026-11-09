using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.Models;
using Eight.Audio.Player;

namespace Eight.Audio.StateMachine.Tasks;

public sealed class RestoreTask(ISpeakerTaskFactory taskFactory, IPlayer player, PlayRequest playRequest) : IPlayerTask
{
	private readonly ISpeakerTaskFactory taskFactory = taskFactory;

	private readonly IPlayer player = player;

	public PlayRequest PlayRequest { get; } = playRequest;

	public Task<(bool, IPlayerTask?)> TryComplete(CancellationToken cancellation)
	{
		return Task.FromResult((true, taskFactory.CreateLoadingTask(player, PlayRequest)));
	}
}
