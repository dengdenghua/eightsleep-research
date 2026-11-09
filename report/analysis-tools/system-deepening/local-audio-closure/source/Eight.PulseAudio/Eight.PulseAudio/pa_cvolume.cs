namespace Eight.PulseAudio;

public struct pa_cvolume
{
	public byte channels;

	public unsafe fixed uint values[32];
}
