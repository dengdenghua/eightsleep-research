namespace Eight.Audio.Models;

public record PlayRequest(StopCriteria StopCriteria, PlaybackSource PlaybackSource, int StartVolume, bool StartPaused, TrackRequest TrackRequest, bool PreviewRequest, PlayModification[] PlayModifications);
