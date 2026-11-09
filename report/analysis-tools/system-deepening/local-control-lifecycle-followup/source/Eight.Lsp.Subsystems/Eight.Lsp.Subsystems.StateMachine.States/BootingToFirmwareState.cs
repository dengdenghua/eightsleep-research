using System;
using System.Threading;
using System.Threading.Tasks;
using Eight.Lsp.Protocol.Models;
using Eight.Lsp.Subsystems.Models;
using Eight.Lsp.Subsystems.Services.Connection;
using Eight.Lsp.Subsystems.Services.Firmware;
using Microsoft.Extensions.Logging;

namespace Eight.Lsp.Subsystems.StateMachine.States;

public class BootingToFirmwareState(ILogger<BootingToFirmwareState> logger, ISubsystemStateFactory stateFactory, IFirmwareManager firmwareManager, IDeviceConnection connection) : ISubsystemState
{
	private readonly ILogger<BootingToFirmwareState> logger = logger;

	private readonly ISubsystemStateFactory stateFactory = stateFactory;

	private readonly IFirmwareManager firmwareManager = firmwareManager;

	private readonly IDeviceConnection connection = connection;

	public async Task<ISubsystemState> GetNextState(CancellationToken cancellation)
	{
		logger.LogInformation("Booting {Side} side to firmware mode", connection.Side.ToLowerString());
		try
		{
			FirmwareInfo firmwareInfo = await connection.GetFwInfo(cancellation);
			logger.LogInformation("[{Side}] Firmware info: CRC=0x{Crc:X8}, Valid={Valid}", connection.Side.ToLowerString(), firmwareInfo.Crc, firmwareInfo.IsValid);
			await firmwareManager.BootToFirmware(connection, 2, cancellation);
			logger.LogInformation("{Side} side device is ready", connection.Side.ToLowerString());
			return stateFactory.CreateReadyState(connection, firmwareInfo);
		}
		catch (Exception ex)
		{
			logger.LogError(ex, "Failed to boot {Side} side to firmware: {Error}", connection.Side.ToLowerString(), ex.Message);
			return stateFactory.CreateErrorWaitingState(connection, TimeSpan.FromSeconds(20L));
		}
	}
}
