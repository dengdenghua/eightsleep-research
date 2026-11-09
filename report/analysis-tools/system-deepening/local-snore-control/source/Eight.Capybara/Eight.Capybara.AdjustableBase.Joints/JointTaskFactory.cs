using System;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.Capybara.AdjustableBase.Joints;

public class JointTaskFactory : IJointTaskFactory
{
	private readonly IServiceProvider serviceProvider;

	private readonly IClock clock;

	public JointTaskFactory(IClock clock, IServiceProvider serviceProvider)
	{
		this.clock = clock;
		this.serviceProvider = serviceProvider;
	}

	public JointTask PauseJointTask()
	{
		return new PauseJointTask(clock);
	}

	public JointTask MoveJointTask(IJointBaseAdapter jointBaseAdapter, MoveRequest request)
	{
		return new MoveJointTask(serviceProvider.GetRequiredService<ILogger<MoveJointTask>>(), jointBaseAdapter, clock, request);
	}

	public JointTask StopJointTask(IJointBaseAdapter jointBaseAdapter)
	{
		return new StopJointTask(jointBaseAdapter);
	}

	public JointTask SnoreMitigationTask(IJointBaseAdapter jointBaseAdapter, SnoreMitigationRequest request)
	{
		return new SnoreMitigationJointTask(serviceProvider.GetRequiredService<ILogger<SnoreMitigationJointTask>>(), jointBaseAdapter, clock, request);
	}
}
