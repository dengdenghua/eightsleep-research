using NodaTime;

namespace Eight.Audio.StateMachine.Tasks;

public sealed record TimedPauseRequest(Duration duration) : PauseRequest;
