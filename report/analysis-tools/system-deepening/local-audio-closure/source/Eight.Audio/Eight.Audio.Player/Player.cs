using System;
using System.Collections.Concurrent;
using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.Models;
using Eight.Audio.Tracks;
using Eight.Capybara.Config;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.Audio.Player;

public sealed class Player(ILogger<Player> logger, ITrackPlayerFactory trackPlayerFactory, IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager) : IPlayer, IDisposable
{
	private readonly ILogger<Player> logger = logger;

	private readonly ITrackPlayerFactory trackPlayerFactory = trackPlayerFactory;

	private Task? playTask;

	private ITrack? currentTrack;

	private ITrackPlayer? trackPlayer;

	private readonly ConcurrentQueue<ITrack> trackQueue = new ConcurrentQueue<ITrack>();

	private int lastVolume = podConfigurationManager.Configuration?.LastKnownState?.Volume ?? 40;

	public bool Paused => trackPlayer?.Paused ?? false;

	public bool Playing
	{
		get
		{
			Task? task = playTask;
			if (task == null)
			{
				return false;
			}
			return !task.IsCompleted;
		}
	}

	public int Volume
	{
		get
		{
			lastVolume = trackPlayer?.Volume ?? lastVolume;
			return lastVolume;
		}
		set
		{
			lastVolume = value;
			if (trackPlayer != null)
			{
				trackPlayer.SetVolume(value);
			}
		}
	}

	public TrackDetails? CurrentTrack
	{
		get
		{
			if (!Playing)
			{
				return null;
			}
			return trackPlayer?.CurrentTrack;
		}
	}

	public PlayRequest? PlayRequest { get; private set; }

	public Task PlayNext(PlayRequest playRequest, CancellationToken cancellationToken)
	{
		CleanPreviousTrack();
		trackQueue.TryDequeue(out ITrack result);
		if (result == null)
		{
			return Task.CompletedTask;
		}
		currentTrack = result;
		PlayRequest = playRequest;
		trackPlayer = trackPlayerFactory.Create(currentTrack);
		playTask = trackPlayer.Play(playRequest.StartPaused, playRequest.StartVolume, cancellationToken);
		return playTask;
	}

	private void CleanPreviousTrack()
	{
		currentTrack?.Dispose();
		trackPlayer?.Stop();
		PlayRequest = null;
	}

	public void Stop()
	{
		trackPlayer?.Stop();
	}

	public void Pause()
	{
		trackPlayer?.Pause();
	}

	public void Resume()
	{
		trackPlayer?.Resume();
	}

	public void Seek(Duration position, SeekMode mode)
	{
		trackPlayer?.Seek(position, mode);
	}

	public void QueueTrack(ITrack track)
	{
		trackQueue.Enqueue(track);
	}

	public void ClearQueue()
	{
		trackQueue.Clear();
	}

	public void Dispose()
	{
		trackPlayer?.Stop();
		currentTrack?.Dispose();
		playTask = null;
		currentTrack = null;
		trackPlayer = null;
	}
}
