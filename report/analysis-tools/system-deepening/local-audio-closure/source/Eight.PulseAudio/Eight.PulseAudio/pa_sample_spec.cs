namespace Eight.PulseAudio;

public struct pa_sample_spec
{
	public pa_sample_format_t format;

	public uint rate;

	public byte channels;
}
