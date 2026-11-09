using Eight.Audio.Models;
using NodaTime;

namespace Eight.Capybara.DeviceAPI.Handlers;

public record PlayRequestArgs(string FileId, string Uri, Hash? Hash, StopCriteria StopCriteria, Duration? StartLoopPosition, Duration? EndLoopPosition, bool? StartPaused, int? Volume = null, Duration? RepeatFor = null, bool PreviewRequest = false, PlaybackSource? PlaybackSource = null, PlayModification[]? PlayModifications = null);
