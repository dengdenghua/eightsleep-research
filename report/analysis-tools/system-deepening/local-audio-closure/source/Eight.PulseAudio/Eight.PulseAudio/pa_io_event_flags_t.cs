namespace Eight.PulseAudio;

internal enum pa_io_event_flags_t : uint
{
	PA_IO_EVENT_NULL = 0u,
	PA_IO_EVENT_INPUT = 1u,
	PA_IO_EVENT_OUTPUT = 2u,
	PA_IO_EVENT_HANGUP = 4u,
	PA_IO_EVENT_ERROR = 8u
}
