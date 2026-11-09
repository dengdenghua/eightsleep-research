using System.Collections.Generic;

namespace Eight.Firmness.Models.Telemetry.Nats;

public record EnhancedControlStateNatsData(uint SchemaVersion, uint UptimeMs, uint SchedulerState, uint SelectedBagsMask, uint NumBagsSteady, uint BagCount, uint ControlIntervalMs, bool PumpOn, bool SinglePumpMode, uint PumpMaxDutyPercent, IReadOnlyList<uint> PumpDutyPercent, IReadOnlyList<EnhancedBagStateNatsData> Bags, int? PumpDriverBagId, float? PumpDriverErrorKpa, MotionStateNatsData? Motion);
