using Eight.Firmness.Models.Telemetry;
using Eight.Lsp.Protocol.Models;

namespace Eight.Firmness.StateMachine.States;

public record FirmnessDeviceState(HardwareInfo? HardwareInfo = null, FirmwareInfo? FirmwareInfo = null, int BagCount = 4, PressureTelemetry? PressureTelemetry = null, CurrentTelemetry? CurrentTelemetry = null, ControlStateTelemetry? ControlTelemetry = null, HealthTelemetry? HealthTelemetry = null);
