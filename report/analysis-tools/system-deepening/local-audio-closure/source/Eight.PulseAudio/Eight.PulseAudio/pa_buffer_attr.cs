namespace Eight.PulseAudio;

public struct pa_buffer_attr
{
	public uint maxlength;

	public uint tlength;

	public uint prebuf;

	public uint minreq;

	public uint fragsize;
}
