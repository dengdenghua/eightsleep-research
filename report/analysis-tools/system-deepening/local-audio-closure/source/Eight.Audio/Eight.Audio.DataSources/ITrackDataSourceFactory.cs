using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.Models;

namespace Eight.Audio.DataSources;

public interface ITrackDataSourceFactory
{
	Task<ITrackDataSource> Create(string fileId, string url, Hash? hash, bool repeatingTrack, CancellationToken cancellationToken);
}
