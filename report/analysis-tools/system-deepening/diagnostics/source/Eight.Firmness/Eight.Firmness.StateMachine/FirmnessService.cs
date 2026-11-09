using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Eight.Capybara.Config;
using Eight.Firmness.Models;
using Eight.Firmness.Services;
using Eight.Lsp.Subsystems.Models;
using Eight.Lsp.Subsystems.StateMachine;
using Eight.Lsp.Subsystems.StateMachine.States;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace Eight.Firmness.StateMachine;

public class FirmnessService(ILogger<FirmnessService> logger, ISubsystemStateFactory stateFactory, BalloonOptions options, IPodConfigurationManager<FirmnessConfiguration> configManager, IFirmnessGate gate, TimeProvider timeProvider) : BackgroundService, IFirmnessProvider
{
	private readonly ILogger<FirmnessService> logger = logger;

	private readonly ISubsystemStateFactory stateFactory = stateFactory;

	private readonly BalloonOptions options = options;

	private readonly IPodConfigurationManager<FirmnessConfiguration> configManager = configManager;

	private readonly IFirmnessGate gate = gate;

	private readonly TimeProvider timeProvider = timeProvider;

	private readonly ConcurrentDictionary<Side, ISubsystemState> states = new ConcurrentDictionary<Side, ISubsystemState>();

	private readonly ConcurrentDictionary<Side, CancellationTokenSource> cancellationTokenSources = new ConcurrentDictionary<Side, CancellationTokenSource>();

	private bool disposed;

	private string MachineSection
	{
		get
		{
			if (!string.IsNullOrEmpty(options.MachineSection))
			{
				return options.MachineSection;
			}
			return "unknown";
		}
	}

	private static bool IsNullState(ISubsystemState state)
	{
		return state is NullState;
	}

	private void WarnUnconfiguredSides(Dictionary<Side, string[]> usbPorts)
	{
		foreach (Side item in UsbPortMap.UnconfiguredSides(usbPorts))
		{
			logger.LogWarning("no firmness usbPortConfig for {Section}/{Side} — R12 disabled", MachineSection, item.ToLowerString());
		}
	}

	private IReadOnlyCollection<Side> SidesToRun()
	{
		string[] usbRoots = options.UsbRoots;
		if (usbRoots != null && usbRoots.Length > 0)
		{
			return options.SidePartNumbers?.Keys.ToArray() ?? Array.Empty<Side>();
		}
		Dictionary<Side, string[]> usbPorts = options.UsbPorts;
		WarnUnconfiguredSides(usbPorts);
		return usbPorts.Keys;
	}

	protected override async Task ExecuteAsync(CancellationToken stoppingToken)
	{
		if (!gate.IsAllowed && (configManager.Configuration?.Enabled ?? false))
		{
			logger.LogWarning("Firmness gate denied; disabling persisted configuration");
			Disable();
		}
		IReadOnlyCollection<Side> readOnlyCollection = SidesToRun();
		logger.LogInformation("Starting firmness service for {SideCount} side(s)", readOnlyCollection.Count);
		await Task.WhenAll(readOnlyCollection.Select((Side side) => SubsystemHost.RunAsync(logger, timeProvider, side, "balloon", stateFactory, states, cancellationTokenSources, IsNullState, stoppingToken)).ToArray());
	}

	public IReadOnlyDictionary<Side, ISubsystemState> GetCurrentStates()
	{
		return states;
	}

	public ISubsystemState? GetCurrentState(Side side)
	{
		states.TryGetValue(side, out ISubsystemState value);
		return value;
	}

	public void Enable()
	{
		FirmnessConfiguration firmnessConfiguration = configManager.Configuration ?? new FirmnessConfiguration(Enabled: false);
		configManager.UpdateConfiguration(firmnessConfiguration with
		{
			Enabled = true
		});
		logger.LogInformation("Firmness devices enabled");
	}

	public void Disable()
	{
		FirmnessConfiguration firmnessConfiguration = configManager.Configuration ?? new FirmnessConfiguration(Enabled: false);
		configManager.UpdateConfiguration(firmnessConfiguration with
		{
			Enabled = false
		});
		Side[] array = states.Keys.ToArray();
		foreach (Side side in array)
		{
			ISubsystemState value = stateFactory.CreateNullState(side);
			states[side] = value;
			logger.LogInformation("[{Side}:balloon] Reset to NullState due to disable", side.ToLowerString());
			if (cancellationTokenSources.TryGetValue(side, out CancellationTokenSource value2))
			{
				value2.Cancel();
			}
		}
		logger.LogInformation("Firmness devices disabled");
	}

	public override void Dispose()
	{
		if (disposed)
		{
			return;
		}
		disposed = true;
		foreach (CancellationTokenSource value in cancellationTokenSources.Values)
		{
			value.Cancel();
			value.Dispose();
		}
		cancellationTokenSources.Clear();
		base.Dispose();
		GC.SuppressFinalize(this);
	}
}
