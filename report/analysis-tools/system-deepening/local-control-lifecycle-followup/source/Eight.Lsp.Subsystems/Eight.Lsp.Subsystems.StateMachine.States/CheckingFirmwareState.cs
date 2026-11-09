using System;
using System.Threading;
using System.Threading.Tasks;
using Eight.Lsp.Subsystems.Models;
using Eight.Lsp.Subsystems.Services.Connection;
using Eight.Lsp.Subsystems.Services.Firmware;
using Microsoft.Extensions.Logging;

namespace Eight.Lsp.Subsystems.StateMachine.States;

public class CheckingFirmwareState(ILogger<CheckingFirmwareState> logger, ISubsystemStateFactory stateFactory, IFirmwareManager firmwareManager, IDeviceConnection connection, byte[] firmwareData) : ISubsystemState
{
	private readonly ILogger<CheckingFirmwareState> logger = logger;

	private readonly ISubsystemStateFactory stateFactory = stateFactory;

	private readonly IFirmwareManager firmwareManager = firmwareManager;

	private readonly IDeviceConnection connection = connection;

	private readonly byte[] firmwareData = firmwareData;

	public async Task<ISubsystemState> GetNextState(CancellationToken cancellation)
	{
		logger.LogInformation("Checking firmware version for {Side} side", connection.Side.ToLowerString());
		try
		{
			if (await firmwareManager.CheckUpdateNeeded(connection, firmwareData, cancellation))
			{
				return stateFactory.CreateUpdatingFirmwareState(connection, firmwareData);
			}
			return stateFactory.CreateBootingState(connection);
		}
		catch (Exception ex)
		{
			logger.LogError(ex, "Failed to check firmware for {Side} side: {Error}", connection.Side.ToLowerString(), ex.Message);
			return stateFactory.CreateErrorWaitingState(connection, TimeSpan.FromSeconds(20L));
		}
	}
}
