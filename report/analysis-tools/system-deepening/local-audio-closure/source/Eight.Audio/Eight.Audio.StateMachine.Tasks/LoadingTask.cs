using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.Models;
using Eight.Audio.Player;
using Eight.Audio.Tracks;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.Audio.StateMachine.Tasks;

public sealed class LoadingTask(ILogger<LoadingTask> logger, ITrackFactory trackFactory, ISpeakerTaskFactory taskFactory, IPlayer player, PlayRequest playRequest) : IPlayerTask
{
	private readonly ILogger<LoadingTask> logger = logger;

	private readonly ITrackFactory trackFactory = trackFactory;

	private readonly ISpeakerTaskFactory taskFactory = taskFactory;

	private readonly IPlayer player = player;

	private readonly CancellationTokenSource taskCancellationSource = new CancellationTokenSource();

	public PlayRequest PlayRequest { get; } = playRequest;

	public Task<ITrack>? CreateTrackTask { get; private set; }

	public async Task<(bool, IPlayerTask?)> TryComplete(CancellationToken cancellationToken)
	{
		if (CreateTrackTask == null)
		{
			CreateTrackTask = trackFactory.CreateTrack(PlayRequest.TrackRequest, taskCancellationSource.Token);
		}
		if (!CreateTrackTask.IsCompleted)
		{
			return (false, null);
		}
		if (!CreateTrackTask.IsCompletedSuccessfully)
		{
			logger.LogError(CreateTrackTask.Exception, "Failed to load requested track");
			return (true, null);
		}
		this.player.ClearQueue();
		IPlayer player = this.player;
		player.QueueTrack(await CreateTrackTask);
		return (true, taskFactory.CreatePlayTask(this.player, PlayRequest));
	}

	public IPlayerTask Cancel()
	{
		return new CancelTask(() =>
		{
			taskCancellationSource.Cancel();
			Task<ITrack>? createTrackTask = CreateTrackTask;
			if (createTrackTask != null && createTrackTask.IsCompletedSuccessfully)
			{
				CreateTrackTask.Result.Dispose();
			}
			return CreateTrackTask;
		}, Duration.FromMilliseconds(250L));
	}
}
