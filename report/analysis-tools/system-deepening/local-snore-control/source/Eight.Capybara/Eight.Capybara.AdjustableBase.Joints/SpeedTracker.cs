using System;
using System.Collections.Generic;
using System.Linq;
using NodaTime;

namespace Eight.Capybara.AdjustableBase.Joints;

public class SpeedTracker
{
	private Instant? firstTimestamp;

	private readonly List<PositionInstance> positions = new List<PositionInstance>();

	private readonly int sampleCount;

	private readonly Duration threshold;

	public double? ThresholdSpeed
	{
		get
		{
			List<PositionInstance> list = positions.Where((PositionInstance x) =>
			{
				Instant timestamp = x.Timestamp;
				Instant? instant = firstTimestamp;
				return timestamp - instant > threshold;
			}).ToList();
			if (list.Count < sampleCount)
			{
				return null;
			}
			int num = sampleCount;
			return CalulcateSpeed(list[list.Count - num], list[list.Count - 1]);
		}
	}

	public double? InstaneousSpeed
	{
		get
		{
			if (positions.Count < 2)
			{
				return null;
			}
			List<PositionInstance> list = positions;
			PositionInstance initial = list[list.Count - 2];
			List<PositionInstance> list2 = positions;
			return CalulcateSpeed(initial, list2[list2.Count - 1]);
		}
	}

	public int AvailablePreviousSpeeds => Math.Max(positions.Count - 2, 0);

	public SpeedTracker()
	{
		Duration duration = Duration.FromSeconds(4L);
		sampleCount = 2;
		threshold = duration;
	}

	public SpeedTracker(int sampleCount)
	{
		this.sampleCount = sampleCount;
	}

	public void AppendSample(PositionInstance positionInstance)
	{
		Instant? instant = firstTimestamp;
		if (!instant.HasValue)
		{
			firstTimestamp = positionInstance.Timestamp;
		}
		else
		{
			positions.Add(positionInstance);
		}
	}

	private double CalulcateSpeed(PositionInstance initial, PositionInstance latest)
	{
		return Math.Abs((double)(latest.Position - initial.Position) / (latest.Timestamp - initial.Timestamp).TotalSeconds);
	}

	public void Reset()
	{
		positions.Clear();
	}

	public double? PreviousInstaneousSpeed(int previousIndex)
	{
		if (previousIndex < 1)
		{
			throw new ArgumentException("Previous Index cannot be less than 1");
		}
		if (positions.Count < previousIndex + 2)
		{
			return null;
		}
		List<PositionInstance> list = positions;
		int num = previousIndex + 2;
		PositionInstance initial = list[list.Count - num];
		List<PositionInstance> list2 = positions;
		num = previousIndex + 1;
		return CalulcateSpeed(initial, list2[list2.Count - num]);
	}
}
