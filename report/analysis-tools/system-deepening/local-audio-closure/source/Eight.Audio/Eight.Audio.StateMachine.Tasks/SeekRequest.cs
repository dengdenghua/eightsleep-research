using Eight.Audio.Models;
using NodaTime;

namespace Eight.Audio.StateMachine.Tasks;

public sealed record SeekRequest(Duration Position, SeekMode Mode) : SpeakerRequest;
