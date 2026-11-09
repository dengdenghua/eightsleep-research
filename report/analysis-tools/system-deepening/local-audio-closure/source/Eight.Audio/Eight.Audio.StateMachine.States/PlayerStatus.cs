using Eight.Audio.Models;

namespace Eight.Audio.StateMachine.States;

public record PlayerStatus(PlayerState State, TrackDetails? CurrentTrack, int Volume, StopCriteria? StopCriteria, PlaybackSource? PlaybackSource, bool Preview);
