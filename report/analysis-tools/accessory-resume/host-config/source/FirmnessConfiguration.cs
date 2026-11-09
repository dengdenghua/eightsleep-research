using System.Collections.Generic;

namespace Eight.Firmness.Models;

public record FirmnessConfiguration(bool Enabled, FirmnessTarget? LeftTargetFirmness = null, FirmnessTarget? RightTargetFirmness = null, DeviceMode? LeftTargetMode = null, DeviceMode? RightTargetMode = null, List<FirmnessPreset>? LeftCustomPresets = null, List<FirmnessPreset>? RightCustomPresets = null, bool LeftDynamicModeEnabled = false, bool RightDynamicModeEnabled = false, BalloonTelemetryProfile? LeftTelemetryProfile = null, BalloonTelemetryProfile? RightTelemetryProfile = null, ToleranceBands? LeftToleranceBands = null, ToleranceBands? RightToleranceBands = null);
