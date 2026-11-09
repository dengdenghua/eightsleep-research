using System.Collections.Generic;

namespace Eight.Firmness.Models.Telemetry;

public record ControlStateTelemetry(byte Command, long Timestamp, uint DeviceTimestampMs, SchedulerState SchedulerState, byte SelectedBagsMask, byte NumBagsSteady, bool IsSleeping, List<BagState> Bags)
{
	public override string ToString()
	{
		List<int> selectedBagIds = GetSelectedBagIds();
		string value = ((selectedBagIds.Count > 0) ? string.Join(",", selectedBagIds) : "none");
		string value2 = string.Join("\n      ", Bags);
		return $"Timestamp={Timestamp}, DeviceMs={DeviceTimestampMs}, Scheduler={SchedulerState}, SelectedBags=[{value}], BagsSteady={NumBagsSteady}, Sleeping={IsSleeping}\n    Bags:\n      {value2}";
	}

	public List<int> GetSelectedBagIds()
	{
		List<int> list = new List<int>();
		for (int i = 0; i < 5; i++)
		{
			if ((SelectedBagsMask & (1 << i)) != 0)
			{
				list.Add(i);
			}
		}
		return list;
	}
}
