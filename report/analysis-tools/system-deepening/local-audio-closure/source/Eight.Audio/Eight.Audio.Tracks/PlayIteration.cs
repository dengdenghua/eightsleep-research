using NodaTime;

namespace Eight.Audio.Tracks;

internal record PlayIteration(Duration? StartPosition, Duration? EndPosition, Duration RunLength);
