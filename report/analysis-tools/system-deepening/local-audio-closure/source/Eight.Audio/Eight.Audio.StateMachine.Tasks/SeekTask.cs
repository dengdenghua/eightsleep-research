using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.Player;

namespace Eight.Audio.StateMachine.Tasks;

public sealed class SeekTask(IPlayer player, SeekRequest seekRequest) : IPlayerTask
{
	private readonly IPlayer player = player;

	private readonly SeekRequest seekRequest = seekRequest;

	public Task<(bool, IPlayerTask?)> TryComplete(CancellationToken cancellation)
	{
		player?.Seek(seekRequest.Position, seekRequest.Mode);
		return Task.FromResult<(bool, IPlayerTask)>((true, null));
	}
}
