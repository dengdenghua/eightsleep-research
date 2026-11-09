using Eight.Firmness.Models;

namespace Eight.Firmness.DeviceAPI;

public record TelemetryProfileStateResponse(bool Configured, BalloonTelemetryProfile? Profile);
