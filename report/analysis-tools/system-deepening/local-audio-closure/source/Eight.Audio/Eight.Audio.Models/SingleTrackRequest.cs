using System.Text;

namespace Eight.Audio.Models;

public record SingleTrackRequest(string FileId, string Name, string Path, Hash? Hash, int? StartVolume, bool StartPaused) : TrackRequest(FileId, Name, Path, Hash, StartVolume, StartPaused)
{
	public override string ToString()
	{
		StringBuilder stringBuilder = new StringBuilder();
		this with
		{
			Path = Path.Substring(0, 50)
		}.PrintMembers(stringBuilder);
		return stringBuilder.ToString();
	}
}
