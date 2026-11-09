using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.DataSources;
using Eight.Audio.StateMachine;
using Eight.Audio.StateMachine.States;
using Microsoft.AspNetCore.SignalR.Client;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.Capybara;

public class TrackDownloader(ILogger<TrackDownloader> logger, IClock clock, HubConnection connection, ISpeakerProvider speakerProvider, ITrackDataSourceFactory trackDataSourceFactory) : BackgroundService
{
	private ILogger<TrackDownloader> logger = logger;

	private readonly IClock clock = clock;

	private readonly HubConnection connection = connection;

	private readonly ISpeakerProvider speakerProvider = speakerProvider;

	private readonly ITrackDataSourceFactory trackDataSourceFactory = trackDataSourceFactory;

	private static readonly Duration RefreshInterval = Duration.FromHours(12);

	private static readonly Duration InitialFailureBackoff = Duration.FromMinutes(1L);

	private static readonly Duration MaxFailureBackoff = Duration.FromHours(1);

	private Instant nextRefresh = Instant.MinValue;

	private Duration failureBackoff = InitialFailureBackoff;

	protected override async Task ExecuteAsync(CancellationToken stoppingToken)
	{
		while (!stoppingToken.IsCancellationRequested)
		{
			if (connection.State != HubConnectionState.Connected)
			{
				await Task.Delay(TimeSpan.FromSeconds(30L), stoppingToken);
				continue;
			}
			if (speakerProvider.GetCurrentSpeakerState() is NullSpeaker)
			{
				await Task.Delay(TimeSpan.FromSeconds(30L), stoppingToken);
				continue;
			}
			Instant now = clock.GetCurrentInstant();
			if (!IsRefreshDue(now))
			{
				await Task.Delay(TimeSpan.FromMinutes(1L), stoppingToken);
				continue;
			}
			try
			{
				int num;
				_ = num - 3;
				_ = 1;
				try
				{
					logger.LogInformation("Refreshing Track Cache");
					await RefreshTrackCache((await connection.InvokeAsync<DeviceTrackResponse>("getalltracks", stoppingToken)).Tracks, now, stoppingToken);
				}
				catch (Exception exception) when (!stoppingToken.IsCancellationRequested)
				{
					logger.LogError(exception, "Failed to predownload track");
				}
			}
			finally
			{
				await Task.Delay(TimeSpan.FromMinutes(1L), stoppingToken);
			}
		}
	}

	internal bool IsRefreshDue(Instant now)
	{
		return now >= nextRefresh;
	}

	internal async Task<TrackPrecacheResult> RefreshTrackCache(IReadOnlyCollection<DeviceTrack> tracks, Instant now, CancellationToken cancellation)
	{
		TrackPrecacheResult trackPrecacheResult = await PrecacheTracks(tracks, cancellation);
		if (trackPrecacheResult.Succeeded > 0 || trackPrecacheResult.Attempted == 0)
		{
			nextRefresh = now + RefreshInterval;
			failureBackoff = InitialFailureBackoff;
		}
		else
		{
			nextRefresh = now + failureBackoff;
			failureBackoff = Duration.Min(failureBackoff * 2L, MaxFailureBackoff);
		}
		return trackPrecacheResult;
	}

	internal async Task<TrackPrecacheResult> PrecacheTracks(IReadOnlyCollection<DeviceTrack> tracks, CancellationToken cancellation)
	{
		int succeeded = 0;
		foreach (DeviceTrack track in tracks)
		{
			logger.LogDebug("Preloading track: {@Track}", new { track.Id, track.Name, track.Hash });
			try
			{
				using (await trackDataSourceFactory.Create(track.Id, track.Path, track.Hash, repeatingTrack: false, cancellation))
				{
					succeeded++;
				}
			}
			catch (Exception exception) when (!cancellation.IsCancellationRequested)
			{
				logger.LogError(exception, "Failed to predownload track {TrackId}", track.Id);
			}
		}
		TrackPrecacheResult trackPrecacheResult = new TrackPrecacheResult(tracks.Count, succeeded, tracks.Count - succeeded);
		LogLevel logLevel = ((trackPrecacheResult.Failed > 0) ? LogLevel.Warning : LogLevel.Information);
		logger.Log(logLevel, "Track cache refresh finished: {Attempted} attempted, {Succeeded} succeeded, {Failed} failed", trackPrecacheResult.Attempted, trackPrecacheResult.Succeeded, trackPrecacheResult.Failed);
		return trackPrecacheResult;
	}
}
