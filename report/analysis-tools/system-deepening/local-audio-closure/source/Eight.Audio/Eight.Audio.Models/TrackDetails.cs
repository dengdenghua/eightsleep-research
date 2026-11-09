using NodaTime;

namespace Eight.Audio.Models;

public record TrackDetails(string TrackId, string Name, Duration CurrentPosition, Duration Length);
