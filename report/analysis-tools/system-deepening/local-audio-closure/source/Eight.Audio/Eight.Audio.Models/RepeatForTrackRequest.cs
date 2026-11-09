using System.Text;
using NodaTime;

namespace Eight.Audio.Models;

public record RepeatForTrackRequest(string FileId, string Name, string Path, Hash? Hash, int? StartVolume, bool StartPaused, Duration Duration, Duration? StartLoopPosition, Duration? EndLoopPosition) : TrackRequest(FileId, Name, Path, Hash, StartVolume, StartPaused)
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
