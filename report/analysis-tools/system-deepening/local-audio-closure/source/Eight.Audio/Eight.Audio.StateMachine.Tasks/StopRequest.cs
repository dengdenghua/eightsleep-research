using Eight.Audio.Models;

namespace Eight.Audio.StateMachine.Tasks;

public sealed record StopRequest(StopMethod StopMethod) : SpeakerRequest;
