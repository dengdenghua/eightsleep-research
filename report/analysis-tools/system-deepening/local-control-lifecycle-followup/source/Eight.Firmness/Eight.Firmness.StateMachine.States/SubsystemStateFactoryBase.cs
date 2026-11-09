using System;
using Eight.Capybara.Config;
using Eight.Firmness.Models;
using Eight.Lsp.Protocol.Models;
using Eight.Lsp.Subsystems.Infrastructure;
using Eight.Lsp.Subsystems.Models;
using Eight.Lsp.Subsystems.Services;
using Eight.Lsp.Subsystems.Services.Connection;
using Eight.Lsp.Subsystems.Services.Firmware;
using Eight.Lsp.Subsystems.StateMachine;
using Eight.Lsp.Subsystems.StateMachine.States;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace Eight.Firmness.StateMachine.States;

public abstract class SubsystemStateFactoryBase : ISubsystemStateFactory
{
	protected readonly IServiceProvider serviceProvider;

	protected readonly IDeviceOptions options;

	protected readonly IPacketHandler packetHandler;

	protected SubsystemStateFactoryBase(IServiceProvider serviceProvider, IDeviceOptions options, IPacketHandler packetHandler)
	{
		this.serviceProvider = serviceProvider;
		this.options = options;
		this.packetHandler = packetHandler;
	}

	public ISubsystemState CreateNullState(Side side)
	{
		IPodConfigurationManager<FirmnessConfiguration> configManager = serviceProvider.GetRequiredService<IPodConfigurationManager<FirmnessConfiguration>>();
		TimeProvider requiredService = serviceProvider.GetRequiredService<TimeProvider>();
		return new NullState(this, requiredService, () => configManager.Configuration?.Enabled ?? false, side);
	}

	public ISubsystemState CreateNotConnectedState(Side side)
	{
		return new NotConnectedState(serviceProvider.GetRequiredService<ILogger<NotConnectedState>>(), connectionFactory: serviceProvider.GetRequiredService<IDeviceConnectionFactory>(), usbPortMapper: serviceProvider.GetRequiredService<IUsbPortMapper>(), timeProvider: serviceProvider.GetRequiredService<TimeProvider>(), portRegistry: serviceProvider.GetRequiredService<IUsbPortRegistry>(), ttyUsage: serviceProvider.GetRequiredService<ITtyUsage>(), stateFactory: this, options: options, packetHandler: packetHandler, side: side);
	}

	public ISubsystemState CreateWaitingForBootloaderState(IDeviceConnection connection)
	{
		return new WaitingForBootloaderState(serviceProvider.GetRequiredService<ILogger<WaitingForBootloaderState>>(), firmwareManager: serviceProvider.GetRequiredService<IFirmwareManager>(), portRegistry: serviceProvider.GetRequiredService<IUsbPortRegistry>(), usbPortMapper: serviceProvider.GetRequiredService<IUsbPortMapper>(), stateFactory: this, options: options, connection: connection);
	}

	public ISubsystemState CreateCheckingFirmwareState(IDeviceConnection connection, byte[] firmwareData)
	{
		ILogger<CheckingFirmwareState> requiredService = serviceProvider.GetRequiredService<ILogger<CheckingFirmwareState>>();
		IFirmwareManager requiredService2 = serviceProvider.GetRequiredService<IFirmwareManager>();
		return new CheckingFirmwareState(requiredService, this, requiredService2, connection, firmwareData);
	}

	public ISubsystemState CreateUpdatingFirmwareState(IDeviceConnection connection, byte[] firmwareData)
	{
		ILogger<UpdatingFirmwareState> requiredService = serviceProvider.GetRequiredService<ILogger<UpdatingFirmwareState>>();
		IFirmwareManager requiredService2 = serviceProvider.GetRequiredService<IFirmwareManager>();
		return new UpdatingFirmwareState(requiredService, this, requiredService2, connection, firmwareData);
	}

	public ISubsystemState CreateBootingState(IDeviceConnection connection)
	{
		ILogger<BootingToFirmwareState> requiredService = serviceProvider.GetRequiredService<ILogger<BootingToFirmwareState>>();
		IFirmwareManager requiredService2 = serviceProvider.GetRequiredService<IFirmwareManager>();
		return new BootingToFirmwareState(requiredService, this, requiredService2, connection);
	}

	public abstract ISubsystemState CreateReadyState(IDeviceConnection connection, FirmwareInfo firmwareInfo);

	public ISubsystemState CreateErrorWaitingState(IDeviceConnection connection, TimeSpan waitDuration)
	{
		ILogger<ErrorWaitingState> requiredService = serviceProvider.GetRequiredService<ILogger<ErrorWaitingState>>();
		TimeProvider requiredService2 = serviceProvider.GetRequiredService<TimeProvider>();
		return new ErrorWaitingState(requiredService, requiredService2, this, connection, waitDuration);
	}
}
