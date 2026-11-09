using System;
using System.Collections.Generic;
using NodaTime;

namespace Eight.Capybara.AdjustableBase.Joints;

internal class AverageSpeedSnoring
{
	private Instant? firstTimestamp;

	private readonly List<PositionInstance> positions = new List<PositionInstance>();

	private const int sampleCount = 5;

	public double? Value
	{
		get
		{
			if (positions.Count < 5)
			{
				return null;
			}
			List<PositionInstance> list = positions;
			PositionInstance initial = list[list.Count - 5];
			List<PositionInstance> list2 = positions;
			return CalulcateAverage(initial, list2[list2.Count - 1]);
		}
	}

	public void AppendSample(PositionInstance positionInstance)
	{
		Instant? instant = firstTimestamp;
		if (!instant.HasValue)
		{
			firstTimestamp = positionInstance.Timestamp;
			return;
		}
		Instant timestamp = positionInstance.Timestamp;
		instant = firstTimestamp;
		if (!(timestamp - instant < Duration.FromSeconds(2L)))
		{
			positions.Add(positionInstance);
		}
	}

	private double CalulcateAverage(PositionInstance initial, PositionInstance latest)
	{
		return Math.Abs((double)(latest.Position - initial.Position) / (latest.Timestamp - initial.Timestamp).TotalSeconds);
	}

	public void Reset()
	{
		positions.Clear();
	}
}
