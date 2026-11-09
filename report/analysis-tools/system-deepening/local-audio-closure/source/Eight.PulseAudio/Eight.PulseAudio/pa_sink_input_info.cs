namespace Eight.PulseAudio;

public struct pa_sink_input_info
{
	public uint index;

	public unsafe sbyte* name;

	public uint owner_module;

	public uint client;

	public uint sink;

	public pa_sample_spec sample_spec;

	public pa_channel_map channel_map;

	public pa_cvolume volume;

	public nuint buffer_usec;

	public nuint sink_usec;

	public unsafe sbyte* resample_method;

	public unsafe sbyte* driver;

	public int mute;

	public unsafe pa_proplist* proplist;

	public int corked;

	public int has_volume;

	public int volume_writable;

	public unsafe pa_format_info* format;
}
