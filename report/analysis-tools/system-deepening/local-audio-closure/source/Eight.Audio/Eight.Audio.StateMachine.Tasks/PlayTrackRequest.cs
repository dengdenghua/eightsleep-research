using Eight.Audio.Models;

namespace Eight.Audio.StateMachine.Tasks;

public sealed record PlayTrackRequest(PlayRequest PlayRequest) : SpeakerRequest;
