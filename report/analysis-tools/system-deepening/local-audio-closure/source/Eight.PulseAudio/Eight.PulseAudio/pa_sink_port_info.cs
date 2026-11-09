namespace Eight.PulseAudio;

public struct pa_sink_port_info
{
	public unsafe sbyte* name;

	public unsafe sbyte* description;

	public uint priority;

	public int available;
}
