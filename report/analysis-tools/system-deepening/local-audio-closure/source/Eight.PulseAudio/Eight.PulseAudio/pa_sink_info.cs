namespace Eight.PulseAudio;

public struct pa_sink_info
{
	public unsafe sbyte* name;

	public uint index;

	public unsafe sbyte* description;

	public pa_sample_spec sample_spec;

	public pa_channel_map channel_map;

	public uint owner_module;

	public pa_cvolume volume;

	public int mute;

	public uint monitor_source;

	public unsafe sbyte* monitor_source_name;

	public nuint latency;

	public unsafe sbyte* driver;

	public pa_sink_flags_t flags;

	public unsafe pa_proplist* proplist;

	public nuint configured_latency;

	public uint base_volume;

	public pa_sink_state_t state;

	public uint n_volume_steps;

	public uint card;

	public uint n_ports;

	public unsafe pa_sink_port_info** ports;

	public unsafe pa_sink_port_info* active_port;

	public byte n_formats;

	public unsafe pa_format_info** formats;
}
