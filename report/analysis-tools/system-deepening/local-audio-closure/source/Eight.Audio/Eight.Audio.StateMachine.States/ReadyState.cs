using System;
using System.Collections.Concurrent;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.Models;
using Eight.Audio.Player;
using Eight.Audio.StateMachine.Tasks;
using Eight.Capybara.Config;
using Eight.Speaker;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.Audio.StateMachine.States;

public sealed class ReadyState(ILogger<ReadyState> logger, IClock clock, ISpeakerStateFactory speakerStateFactory, ISpeakerTaskFactory speakerTaskFactory, ISpeaker speaker, IPlayer player, IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager) : ISpeakerState, IConnectedSpeakerState
{
	private readonly ILogger<ReadyState> logger = logger;

	private readonly IClock clock = clock;

	private readonly ISpeakerTaskFactory speakerTaskFactory = speakerTaskFactory;

	private readonly ISpeakerStateFactory speakerStateFactory = speakerStateFactory;

	private readonly IPlayer player = player;

	private readonly ISpeaker speaker = speaker;

	private readonly IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager = podConfigurationManager;

	private readonly Duration loopSleep = Duration.FromMilliseconds(50L);

	private ConcurrentQueue<SpeakerRequest> requests = new ConcurrentQueue<SpeakerRequest>();

	private readonly IPlayerTask defaultTask = new NoTask();

	private static readonly Duration StateAlivePeriod = Duration.FromHours(1);

	private PlayerStatus? lastLoggedState;

	private Instant lastStateLoggedAt;

	private IPlayerTask[] taskQueue = Array.Empty<IPlayerTask>();

	private readonly TaskCompletionSource connectionCompletionSource = new TaskCompletionSource();

	public SpeakerHardwareInfo HardwareInfo { get; private set; } = new SpeakerHardwareInfo("Unknown", "0", "0", "");

	public PlayerStatus State { get; private set; } = new PlayerStatus(PlayerState.Ready, null, player.Volume, null, null, Preview: false);

	public Task Disconnect(CancellationToken cancellationToken)
	{
		return speaker.Disconnect(cancellationToken);
	}

	public async Task<ISpeakerState> GetNextState(CancellationToken cancellationToken)
	{
		HardwareInfo = await speaker.GetHardwareInfo(cancellationToken);
		logger.LogInformation("Speaker ready, Sku {Sku}", HardwareInfo.Sku);
		speaker.ConnectedChangedEvent += OnConnectedChangedHandler;
		try
		{
			podConfigurationManager.Eject(clock);
			using PeriodicTimer timer = new PeriodicTimer(loopSleep.ToTimeSpan());
			while (await timer.WaitForNextTickAsync(cancellationToken) && !cancellationToken.IsCancellationRequested && !connectionCompletionSource.Task.IsCompleted)
			{
				await RunTick(cancellationToken);
			}
			cancellationToken.ThrowIfCancellationRequested();
			return speakerStateFactory.CreateNotConnectedSpeaker();
		}
		finally
		{
			speaker.ConnectedChangedEvent -= OnConnectedChangedHandler;
			player.Dispose();
		}
	}

	public void MakeRequest(SpeakerRequest request)
	{
		requests.Enqueue(request);
	}

	private void OnRequest(SpeakerRequest request)
	{
		string text = TaskQueueNames();
		IPlayerTask[] array9;
		IPlayerTask[] array2;
		IPlayerTask[] array;
		if (!(request is PlayTrackRequest r))
		{
			if (request is PauseRequest)
			{
				array = taskQueue;
				if (array != null)
				{
					int num = array.Length;
					if (num >= 1)
					{
						IPlayerTask playerTask = array[0];
						if (playerTask is DelayedResumeTask)
						{
							IPlayerTask[] subArray = array[new Index(1)..^0];
							array2 = subArray.ToArray();
						}
						else if (num >= 2 && playerTask is LoadingTask loadingTask)
						{
							if (!(array[1] is PlayTask playTask))
							{
								goto IL_01d0;
							}
							array2 = new IPlayerTask[2] { loadingTask, playTask };
						}
						else
						{
							if (!(playerTask is PlayTask playTask2))
							{
								goto IL_01d0;
							}
							IPlayerTask[] subArray = array[new Index(1)..^0];
							IPlayerTask[] array3 = subArray;
							IPlayerTask[] array4;
							if (!playTask2.PlayRequest.PreviewRequest)
							{
								array4 = new IPlayerTask[2]
								{
									(request is TimedPauseRequest timedPauseRequest) ? DelayedResumeTask(timedPauseRequest.duration) : PauseTask(),
									playTask2
								};
							}
							else
							{
								IPlayerTask playerTask2 = StopTask(new StopRequest(StopMethod.Immediate));
								IPlayerTask[] array5 = array3;
								int num2 = 0;
								IPlayerTask[] array6 = new IPlayerTask[1 + array5.Length];
								array6[num2] = playerTask2;
								num2++;
								ReadOnlySpan<IPlayerTask> readOnlySpan = new ReadOnlySpan<IPlayerTask>(array5);
								readOnlySpan.CopyTo(new Span<IPlayerTask>(array6).Slice(num2, readOnlySpan.Length));
								num2 += readOnlySpan.Length;
								array4 = array6;
							}
							array2 = array4;
						}
						goto IL_01d8;
					}
				}
				goto IL_01d0;
			}
			if (request is ResumeRequest)
			{
				array2 = taskQueue;
				if (array2 == null || array2.Length < 1)
				{
					goto IL_0392;
				}
				IPlayerTask playerTask = array2[0];
				if (playerTask is PauseTask)
				{
					IPlayerTask[] subArray2 = array2[new Index(1)..^0];
					IPlayerTask playerTask2 = ResumeTask();
					IPlayerTask[] array6 = subArray2;
					int num = 0;
					IPlayerTask[] array5 = new IPlayerTask[1 + array6.Length];
					array5[num] = playerTask2;
					num++;
					ReadOnlySpan<IPlayerTask> readOnlySpan = new ReadOnlySpan<IPlayerTask>(array6);
					readOnlySpan.CopyTo(new Span<IPlayerTask>(array5).Slice(num, readOnlySpan.Length));
					num += readOnlySpan.Length;
					array = array5;
				}
				else if (playerTask is DelayedResumeTask)
				{
					IPlayerTask[] subArray2 = array2[new Index(1)..^0];
					IPlayerTask[] array7 = subArray2;
					IPlayerTask playerTask2 = ResumeTask();
					IPlayerTask[] array5 = array7;
					int num = 0;
					IPlayerTask[] array6 = new IPlayerTask[1 + array5.Length];
					array6[num] = playerTask2;
					num++;
					ReadOnlySpan<IPlayerTask> readOnlySpan = new ReadOnlySpan<IPlayerTask>(array5);
					readOnlySpan.CopyTo(new Span<IPlayerTask>(array6).Slice(num, readOnlySpan.Length));
					num += readOnlySpan.Length;
					array = array6;
				}
				else
				{
					if (!(playerTask is PlayTask))
					{
						goto IL_0392;
					}
					IPlayerTask playerTask2 = ResumeTask();
					IPlayerTask[] array6 = taskQueue;
					int num = 0;
					IPlayerTask[] array5 = new IPlayerTask[1 + array6.Length];
					array5[num] = playerTask2;
					num++;
					ReadOnlySpan<IPlayerTask> readOnlySpan = new ReadOnlySpan<IPlayerTask>(array6);
					readOnlySpan.CopyTo(new Span<IPlayerTask>(array5).Slice(num, readOnlySpan.Length));
					num += readOnlySpan.Length;
					array = array5;
				}
				goto IL_039a;
			}
			if (request is StopRequest request2)
			{
				array = taskQueue;
				if (array == null || array.Length < 1)
				{
					goto IL_0466;
				}
				IPlayerTask playerTask = array[0];
				if (!(playerTask is LoadingTask loadingTask2))
				{
					if (!(playerTask is CancelTask cancelTask))
					{
						if (!(playerTask is PlayTask playTask3))
						{
							if (!(playerTask is PauseTask))
							{
								if (!(playerTask is DelayedResumeTask))
								{
									goto IL_0466;
								}
								array2 = new IPlayerTask[1] { StopTask(request2) };
							}
							else
							{
								array2 = new IPlayerTask[1] { StopTask(request2) };
							}
						}
						else
						{
							array2 = new IPlayerTask[2]
							{
								StopTask(request2),
								playTask3.Cancel()
							};
						}
					}
					else
					{
						array2 = new IPlayerTask[1] { cancelTask };
					}
				}
				else
				{
					array2 = new IPlayerTask[1] { loadingTask2.Cancel() };
				}
				goto IL_046e;
			}
			if (!(request is VolumeRequest request3))
			{
				if (!(request is SeekRequest request4))
				{
					throw new InvalidOperationException();
				}
				array2 = taskQueue;
				IPlayerTask[] array8;
				if (array2 == null || array2.Length < 1 || !(array2[0] is PlayTask))
				{
					array8 = taskQueue;
				}
				else
				{
					IPlayerTask playerTask = SeekTask(request4);
					array2 = taskQueue;
					int num = 0;
					array = new IPlayerTask[1 + array2.Length];
					array[num] = playerTask;
					num++;
					ReadOnlySpan<IPlayerTask> readOnlySpan = new ReadOnlySpan<IPlayerTask>(array2);
					readOnlySpan.CopyTo(new Span<IPlayerTask>(array).Slice(num, readOnlySpan.Length));
					num += readOnlySpan.Length;
					array8 = array;
				}
				array9 = array8;
			}
			else
			{
				array2 = taskQueue;
				if (array2 != null && array2.Length >= 1 && array2[0] is PlayTask playTask4)
				{
					array = new IPlayerTask[2]
					{
						VolumeTask(request3),
						playTask4.StopVolumeRamp()
					};
				}
				else
				{
					IPlayerTask playerTask = VolumeTask(request3);
					IPlayerTask[] array5 = taskQueue;
					int num = 0;
					IPlayerTask[] array6 = new IPlayerTask[1 + array5.Length];
					array6[num] = playerTask;
					num++;
					ReadOnlySpan<IPlayerTask> readOnlySpan = new ReadOnlySpan<IPlayerTask>(array5);
					readOnlySpan.CopyTo(new Span<IPlayerTask>(array6).Slice(num, readOnlySpan.Length));
					num += readOnlySpan.Length;
					array = array6;
				}
				array9 = array;
			}
		}
		else
		{
			array9 = HandlePlayRequest(r);
		}
		goto IL_05bd;
		IL_05bd:
		taskQueue = array9;
		logger.LogInformation("Speaker request {Request}: queue [{Before}] -> [{After}]", request, text, TaskQueueNames());
		return;
		IL_0466:
		array2 = taskQueue;
		goto IL_046e;
		IL_039a:
		array9 = array;
		goto IL_05bd;
		IL_0392:
		array = taskQueue;
		goto IL_039a;
		IL_01d8:
		array9 = array2;
		goto IL_05bd;
		IL_046e:
		array9 = array2;
		goto IL_05bd;
		IL_01d0:
		array2 = taskQueue;
		goto IL_01d8;
	}

	private string TaskQueueNames()
	{
		return string.Join(", ", taskQueue.Select((IPlayerTask t) => t.GetType().Name));
	}

	private IPlayerTask[] HandlePlayRequest(PlayTrackRequest r)
	{
		if (r.PlayRequest.PreviewRequest)
		{
			RestoreTask restoreTask = ((taskQueue.Length != 0) ? (taskQueue[^1] as RestoreTask) : null);
			IPlayerTask[] array = taskQueue;
			if (array != null && array.Length >= 1)
			{
				IPlayerTask playerTask = array[0];
				if (playerTask is CancelTask cancelTask)
				{
					return new IPlayerTask[2]
					{
						cancelTask,
						LoadingTask(r)
					};
				}
				if (playerTask is LoadingTask loadingTask)
				{
					IPlayerTask[] array2 = new IPlayerTask[3]
					{
						loadingTask.Cancel(),
						LoadingTask(r),
						null
					};
					IPlayerTask playerTask2 = restoreTask;
					array2[2] = playerTask2 ?? RestoreTask(loadingTask.PlayRequest);
					return array2;
				}
				if (playerTask is PlayTask playTask)
				{
					IPlayerTask[] array3 = new IPlayerTask[3]
					{
						playTask.Cancel(),
						LoadingTask(r),
						null
					};
					IPlayerTask playerTask2 = restoreTask;
					array3[2] = playerTask2 ?? RestoreTask(!playTask.ShouldVolumeRamp);
					return array3;
				}
			}
			return new IPlayerTask[1] { LoadingTask(r) };
		}
		IPlayerTask[] array4 = taskQueue;
		if (array4 != null && array4.Length >= 1)
		{
			IPlayerTask playerTask = array4[0];
			if (playerTask is CancelTask cancelTask2)
			{
				return new IPlayerTask[2]
				{
					cancelTask2,
					LoadingTask(r)
				};
			}
			if (playerTask is LoadingTask loadingTask2)
			{
				return new IPlayerTask[2]
				{
					loadingTask2.Cancel(),
					LoadingTask(r)
				};
			}
			if (playerTask is PlayTask playTask2)
			{
				return new IPlayerTask[2]
				{
					playTask2.Cancel(),
					LoadingTask(r)
				};
			}
		}
		return new IPlayerTask[1] { LoadingTask(r) };
	}

	public async Task RunTick(CancellationToken cancellation)
	{
		if (requests.TryDequeue(out SpeakerRequest result))
		{
			OnRequest(result);
		}
		UpdatePlayerStatus(cancellation);
		await PerformNextTask(cancellation);
	}

	public void UpdatePlayerStatus(CancellationToken cancellation)
	{
		bool playing = player.Playing;
		bool paused = player.Paused;
		PlayerState playerState = (playing ? ((!paused) ? PlayerState.Playing : PlayerState.Paused) : PlayerState.Ready);
		PlayerState state = playerState;
		TrackDetails currentTrack = player.CurrentTrack;
		IPlayerTask[] array = taskQueue;
		if (array == null || array.Length < 1 || !(array[0] is LoadingTask))
		{
			array = taskQueue;
			if (array == null || array.Length < 2 || !(array[0] is CancelTask) || !(array[1] is LoadingTask))
			{
				goto IL_00e9;
			}
		}
		LoadingTask loadingTask = (LoadingTask)taskQueue.First((IPlayerTask x) => x is LoadingTask);
		state = PlayerState.Loading;
		currentTrack = new TrackDetails(loadingTask.PlayRequest.TrackRequest.FileId, loadingTask.PlayRequest.TrackRequest.Name, Duration.FromSeconds(0L), Duration.FromSeconds(0L));
		goto IL_00e9;
		IL_00e9:
		IPlayerTask playerTask = ((taskQueue.Length != 0) ? taskQueue[0] : defaultTask);
		State = new PlayerStatus(state, currentTrack, player.Volume, (playerTask as PlayTask)?.PlayRequest.StopCriteria, (playerTask as PlayTask)?.PlayRequest.PlaybackSource, (playerTask as PlayTask)?.PlayRequest.PreviewRequest ?? false);
		LogStateIfChangedOrDue();
	}

	private void LogStateIfChangedOrDue()
	{
		TrackDetails currentTrack = State.CurrentTrack;
		PlayerStatus playerStatus = (((object)currentTrack != null) ? State with
		{
			CurrentTrack = currentTrack with
			{
				CurrentPosition = Duration.Zero
			}
		} : State);
		Instant currentInstant = clock.GetCurrentInstant();
		if (!(playerStatus == lastLoggedState) || !(currentInstant - lastStateLoggedAt < StateAlivePeriod))
		{
			lastLoggedState = playerStatus;
			lastStateLoggedAt = currentInstant;
			logger.LogInformation("Current State: {@State}", new { State });
		}
	}

	public async Task PerformNextTask(CancellationToken cancellation)
	{
		IPlayerTask[] array = taskQueue;
		if (array == null || array.Length < 1)
		{
			return;
		}
		IPlayerTask playerTask = array[0];
		IPlayerTask[] following = array[new Index(1)..^0];
		var (flag, playerTask2) = await playerTask.TryComplete(cancellation);
		if (flag)
		{
			ReadyState readyState = this;
			IPlayerTask[] array2;
			if (playerTask2 == null)
			{
				array2 = following;
			}
			else
			{
				IPlayerTask playerTask3 = playerTask2;
				array = following;
				int num = 0;
				IPlayerTask[] array3 = new IPlayerTask[1 + array.Length];
				array3[num] = playerTask3;
				num++;
				ReadOnlySpan<IPlayerTask> readOnlySpan = new ReadOnlySpan<IPlayerTask>(array);
				readOnlySpan.CopyTo(new Span<IPlayerTask>(array3).Slice(num, readOnlySpan.Length));
				_ = num + readOnlySpan.Length;
				array2 = array3;
			}
			readyState.taskQueue = array2;
			await PerformNextTask(cancellation);
		}
	}

	private IPlayerTask LoadingTask(PlayTrackRequest request)
	{
		return speakerTaskFactory.CreateLoadingTask(player, request.PlayRequest);
	}

	private IPlayerTask PauseTask()
	{
		return speakerTaskFactory.CreatePauseTask(player);
	}

	private IPlayerTask DelayedResumeTask(Duration duration)
	{
		return speakerTaskFactory.CreatePauseTask(player, duration);
	}

	private IPlayerTask ResumeTask()
	{
		return speakerTaskFactory.CreateResumeTask(player);
	}

	private IPlayerTask VolumeTask(VolumeRequest request)
	{
		return speakerTaskFactory.CreateVolumeTask(player, request.Volume);
	}

	private IPlayerTask StopTask(StopRequest request)
	{
		return speakerTaskFactory.CreateStopTask(player, request.StopMethod);
	}

	private IPlayerTask SeekTask(SeekRequest request)
	{
		return speakerTaskFactory.CreateSeekTask(player, request);
	}

	private IPlayerTask RestoreTask(bool keepCurrentVolume)
	{
		return speakerTaskFactory.CreateRestoreTask(player, keepCurrentVolume);
	}

	private IPlayerTask RestoreTask(PlayRequest r)
	{
		return speakerTaskFactory.CreateRestoreTask(player, r);
	}

	private Task OnConnectedChangedHandler(ISpeaker speaker, SpeakerConnectedEventArgs args)
	{
		connectionCompletionSource.TrySetCanceled();
		return Task.CompletedTask;
	}
}
