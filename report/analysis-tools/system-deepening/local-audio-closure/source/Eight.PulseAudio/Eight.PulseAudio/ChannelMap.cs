namespace Eight.PulseAudio;

public class ChannelMap
{
	private const int PA_CHANNEL_MAP_SNPRINT_MAX = 336;

	internal readonly pa_channel_map Struct;

	internal ChannelMap(pa_channel_map map)
	{
		Struct = map;
	}

	internal static ChannelMap SwappedStereo()
	{
		pa_channel_map map = default;
		map.map.AsSpan().Fill(pa_channel_position_t.PA_CHANNEL_POSITION_INVALID);
		map.channels = 2;
		map.map[0] = pa_channel_position_t.PA_CHANNEL_POSITION_FRONT_RIGHT;
		map.map[1] = pa_channel_position_t.PA_CHANNEL_POSITION_FRONT_LEFT;
		return new ChannelMap(map);
	}

	public unsafe override string ToString()
	{
		fixed (sbyte* ptr = new sbyte[336])
		{
			fixed (pa_channel_map* map = &Struct)
			{
				PulseAudio.pa_channel_map_snprint(ptr, 336u, map);
				new string(ptr, 0, 336);
				return new string(ptr, 0, 336).TrimEnd('\0');
			}
		}
	}
}
