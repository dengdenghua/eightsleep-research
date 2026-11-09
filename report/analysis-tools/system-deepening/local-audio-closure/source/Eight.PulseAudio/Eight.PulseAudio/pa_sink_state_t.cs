namespace Eight.PulseAudio;

public enum pa_sink_state_t
{
	PA_SINK_INVALID_STATE = -1,
	PA_SINK_RUNNING = 0,
	PA_SINK_IDLE = 1,
	PA_SINK_SUSPENDED = 2,
	PA_SINK_INIT = -2,
	PA_SINK_UNLINKED = -3
}
