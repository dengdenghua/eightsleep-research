using Eight.DeviceApiClient;
using Eight.Firmness.DeviceAPI;
using Microsoft.Extensions.DependencyInjection;

namespace Eight.Firmness.Extensions;

public static class DeviceApiExtensions
{
	public static IServiceCollection RegisterFirmnessController(this IServiceCollection services)
	{
		services.AddScopedController<FirmnessController>();
		services.AddScopedController<FirmnessDebugController>();
		services.AddScopedController<FirmnessPresetController>();
		services.AddScopedController<SubsystemDebugController>();
		services.AddScopedController<CalibrationController>();
		services.AddScopedController<TelemetryProfileDebugController>();
		services.AddScopedController<ToleranceDebugController>();
		return services;
	}
}
