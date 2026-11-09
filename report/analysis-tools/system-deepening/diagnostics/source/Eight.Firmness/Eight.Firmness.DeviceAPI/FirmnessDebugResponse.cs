namespace Eight.Firmness.DeviceAPI;

public record FirmnessDebugResponse(DebugFirmnessBagState Bag0, DebugFirmnessBagState Bag1, DebugFirmnessBagState Bag2, DebugFirmnessBagState Bag3, DebugFirmnessBagState? Bag4, FirmnessHardwareInfo HardwareInfo, string Mode, bool DynamicModeEnabled, DebugFirmwareInfo FirmwareInfo, DebugPressureTelemetry RawPressureTelemetry, DebugCurrentTelemetry? RawCurrentTelemetry, DebugControlTelemetry RawControlTelemetry, DebugHealthTelemetry? RawHealthTelemetry);
