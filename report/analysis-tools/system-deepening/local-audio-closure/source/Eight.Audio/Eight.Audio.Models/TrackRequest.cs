using System.Text;
using System.Text.Json.Serialization;

namespace Eight.Audio.Models;

[JsonDerivedType(typeof(SingleTrackRequest), "single")]
[JsonDerivedType(typeof(RepeatingTrackRequest), "repeatFor")]
[JsonDerivedType(typeof(RepeatForTrackRequest), "repeating")]
public abstract record TrackRequest(string FileId, string Name, string Path, Hash? Hash, int? StartVolume, bool StartPaused)
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
