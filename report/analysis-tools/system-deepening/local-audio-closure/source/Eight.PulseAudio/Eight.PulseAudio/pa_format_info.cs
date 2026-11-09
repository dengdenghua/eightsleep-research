namespace Eight.PulseAudio;

public struct pa_format_info
{
	public pa_encoding_t encoding;

	public unsafe pa_proplist* plist;
}
