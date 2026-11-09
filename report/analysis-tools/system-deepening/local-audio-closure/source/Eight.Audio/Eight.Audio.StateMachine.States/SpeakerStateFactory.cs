using System;
using Eight.Audio.Player;
using Eight.Audio.StateMachine.Tasks;
using Eight.Capybara.Config;
using Eight.Speaker;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.Audio.StateMachine.States;

public class SpeakerStateFactory(IServiceProvider serviceProvider, IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager) : ISpeakerStateFactory
{
	private readonly IServiceProvider serviceProvider = serviceProvider;

	private readonly IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager = podConfigurationManager;

	public ISpeakerState CreateInitializingSpeaker(ISpeaker speaker)
	{
		return new InitializingSpeaker(serviceProvider.GetRequiredService<ILogger<InitializingSpeaker>>(), serviceProvider.GetRequiredService<IClock>(), this, serviceProvider.GetRequiredService<IPodConfigurationManager<SpeakerConfiguration>>(), speaker, serviceProvider.GetRequiredService<ISpeakerUpdater>());
	}

	public ISpeakerState CreateNotConnectedSpeaker()
	{
		if ((object)podConfigurationManager.Configuration == null)
		{
			throw new ArgumentException("Speaker configuration is null, unable to create initializing speaker");
		}
		return new NotConnectedSpeaker(serviceProvider.GetRequiredService<ILogger<NotConnectedSpeaker>>(), this, serviceProvider.GetRequiredService<ISpeakerFactory>(), podConfigurationManager.Configuration, serviceProvider.GetRequiredService<SpeakerReconnectBackoff>());
	}

	public ISpeakerState CreateNullSpeaker()
	{
		return new NullSpeaker(this, podConfigurationManager);
	}

	public ISpeakerState CreateReadySpeaker(ISpeaker speaker)
	{
		return new ReadyState(serviceProvider.GetRequiredService<ILogger<ReadyState>>(), serviceProvider.GetRequiredService<IClock>(), serviceProvider.GetRequiredService<ISpeakerStateFactory>(), serviceProvider.GetRequiredService<ISpeakerTaskFactory>(), speaker, serviceProvider.GetRequiredService<IPlayer>(), serviceProvider.GetRequiredService<IPodConfigurationManager<SpeakerConfiguration>>());
	}
}
