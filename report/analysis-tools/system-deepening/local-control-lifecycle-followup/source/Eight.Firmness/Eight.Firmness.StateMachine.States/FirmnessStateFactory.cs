using System;
using System.Collections.Generic;
using Eight.Capybara.Config;
using Eight.Firmness.Models;
using Eight.Firmness.Services.Calibration;
using Eight.Lsp.Protocol.Models;
using Eight.Lsp.Subsystems.Services;
using Eight.Lsp.Subsystems.Services.Connection;
using Eight.Lsp.Subsystems.StateMachine;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace Eight.Firmness.StateMachine.States;

public class FirmnessStateFactory(IServiceProvider serviceProvider, BalloonOptions balloonOptions, [FromKeyedServices("balloon")] IPacketHandler packetHandler) : SubsystemStateFactoryBase(serviceProvider, balloonOptions, packetHandler), IFirmnessStateFactory, ISubsystemStateFactory
{
	public override ISubsystemState CreateReadyState(IDeviceConnection connection, FirmwareInfo firmwareInfo)
	{
		ILogger<FirmnessReadyState> requiredService = serviceProvider.GetRequiredService<ILogger<FirmnessReadyState>>();
		IPodConfigurationManager<FirmnessConfiguration> requiredService2 = serviceProvider.GetRequiredService<IPodConfigurationManager<FirmnessConfiguration>>();
		return new FirmnessReadyState(requiredService, this, connection, requiredService2, balloonOptions, firmwareInfo);
	}

	public ISubsystemState CreateCalibratingState(IDeviceConnection connection, FirmwareInfo firmwareInfo, int bagCount, IReadOnlyList<int>? requestedBags, CalibrationDeflateMethod? method)
	{
		return new CalibratingState(serviceProvider.GetRequiredService<ILogger<CalibratingState>>(), calibrationOptions: serviceProvider.GetRequiredService<CalibrationOptions>(), calibrationAnalyzer: serviceProvider.GetRequiredService<CalibrationAnalyzerRunner>(), calibrationRunStore: serviceProvider.GetRequiredService<ICalibrationRunStore>(), stateFactory: this, connection: connection, firmwareInfo: firmwareInfo, bagCount: bagCount, requestedBags: requestedBags, requestedMethod: method, balloonOptions: balloonOptions);
	}
}
