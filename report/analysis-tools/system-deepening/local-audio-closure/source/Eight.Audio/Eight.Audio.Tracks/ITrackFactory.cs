using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.Models;

namespace Eight.Audio.Tracks;

public interface ITrackFactory
{
	Task<ITrack> CreateTrack(TrackRequest request, CancellationToken cancellationToken);
}
