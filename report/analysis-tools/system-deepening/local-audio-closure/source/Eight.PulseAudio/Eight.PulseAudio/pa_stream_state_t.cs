namespace Eight.PulseAudio;

public enum pa_stream_state_t : uint
{
	PA_STREAM_UNCONNECTED,
	PA_STREAM_CREATING,
	PA_STREAM_READY,
	PA_STREAM_FAILED,
	PA_STREAM_TERMINATED
}
