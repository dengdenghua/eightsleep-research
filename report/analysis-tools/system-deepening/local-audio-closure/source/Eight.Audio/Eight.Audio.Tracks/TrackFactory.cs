using System;
using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.DataSources;
using Eight.Audio.Models;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace Eight.Audio.Tracks;

public class TrackFactory(ILogger<TrackFactory> logger, IServiceProvider serviceProvider, ITrackDataSourceFactory trackDataSourceFactory) : ITrackFactory
{
	private readonly ILogger<TrackFactory> logger = logger;

	private readonly IServiceProvider serviceProvider = serviceProvider;

	private readonly ITrackDataSourceFactory trackDataSourceFactory = trackDataSourceFactory;

	public async Task<ITrack> CreateTrack(TrackRequest request, CancellationToken cancellationToken)
	{
		ITrackDataSource trackDataSource = await trackDataSourceFactory.Create(request.FileId, request.Path, request.Hash, !(request is SingleTrackRequest), cancellationToken);
		ITrack result;
		if (!(request is RepeatingTrackRequest repeatingTrackRequest))
		{
			if (!(request is RepeatForTrackRequest repeatForTrackRequest))
			{
				if (!(request is SingleTrackRequest singleTrackRequest))
				{
					throw new NotImplementedException($"Have no impleted {request.GetType()}");
				}
				result = CreateTrackSource(singleTrackRequest.FileId, singleTrackRequest.Name, trackDataSource);
			}
			else
			{
				result = new RepeatForTrack(serviceProvider.GetRequiredService<ILogger<RepeatForTrack>>(), CreateTrackSource(repeatForTrackRequest.FileId, repeatForTrackRequest.Name, trackDataSource), repeatForTrackRequest.StartLoopPosition, repeatForTrackRequest.EndLoopPosition, repeatForTrackRequest.Duration);
			}
		}
		else
		{
			result = new RepeatingTrack(serviceProvider.GetRequiredService<ILogger<RepeatingTrack>>(), CreateTrackSource(repeatingTrackRequest.FileId, repeatingTrackRequest.Name, trackDataSource), repeatingTrackRequest.StartLoopPosition, repeatingTrackRequest.EndLoopPosition);
		}
		return result;
	}

	private ITrack CreateTrackSource(string fileId, string name, ITrackDataSource trackDataSource)
	{
		return WavTrack.Create(serviceProvider.GetRequiredService<ILogger<WavTrack>>(), fileId, name, trackDataSource);
	}
}
