using System.Threading;
using System.Threading.Tasks;
using Eight.Capybara.Config;

namespace Eight.Audio.StateMachine.States;

public class NullSpeaker(ISpeakerStateFactory speakerStateFactory, IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager) : ISpeakerState
{
	private readonly ISpeakerStateFactory speakerStateFactory = speakerStateFactory;

	private readonly IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager = podConfigurationManager;

	public async Task<ISpeakerState> GetNextState(CancellationToken cancellationToken)
	{
		SpeakerConfiguration speakerConfiguration = null;
		while ((object)speakerConfiguration == null)
		{
			speakerConfiguration = await WaitForConfiguration(cancellationToken);
		}
		return speakerStateFactory.CreateNotConnectedSpeaker();
	}

	private async Task<SpeakerConfiguration> WaitForConfiguration(CancellationToken cancellation)
	{
		SpeakerConfiguration configuration;
		while ((object)(configuration = podConfigurationManager.Configuration) == null)
		{
			await Task.Delay(10000, cancellation);
		}
		return configuration;
	}
}
