namespace Eight.PulseAudio;

public enum pa_seek_mode_t : uint
{
	PA_SEEK_RELATIVE,
	PA_SEEK_ABSOLUTE,
	PA_SEEK_RELATIVE_ON_READ,
	PA_SEEK_RELATIVE_END
}
