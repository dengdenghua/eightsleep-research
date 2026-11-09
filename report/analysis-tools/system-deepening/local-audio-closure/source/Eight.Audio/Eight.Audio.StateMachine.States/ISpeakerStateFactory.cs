using Eight.Speaker;

namespace Eight.Audio.StateMachine.States;

public interface ISpeakerStateFactory
{
	ISpeakerState CreateNullSpeaker();

	ISpeakerState CreateNotConnectedSpeaker();

	ISpeakerState CreateInitializingSpeaker(ISpeaker speaker);

	ISpeakerState CreateReadySpeaker(ISpeaker speaker);
}
