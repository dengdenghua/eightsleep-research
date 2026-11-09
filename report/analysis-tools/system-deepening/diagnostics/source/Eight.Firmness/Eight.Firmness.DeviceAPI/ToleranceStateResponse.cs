using System.Collections.Generic;
using Eight.Firmness.Models;

namespace Eight.Firmness.DeviceAPI;

public record ToleranceStateResponse(bool Tuned, double? MinKpa, double? MaxKpa, IReadOnlyList<ToleranceBinSetting> Bins);
