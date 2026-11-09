namespace Eight.PulseAudio;

internal struct pa_mainloop_api
{
	public unsafe void* userdata;

	public unsafe delegate* unmanaged<pa_mainloop_api*, int, pa_io_event_flags_t, delegate* unmanaged<pa_mainloop_api*, pa_io_event*, int, pa_io_event_flags_t, void*, void>, void*, pa_io_event*> io_new;

	public unsafe delegate* unmanaged<pa_io_event*, pa_io_event_flags_t, void> io_enable;

	public unsafe delegate* unmanaged<pa_io_event*, void> io_free;

	public unsafe delegate* unmanaged<pa_io_event*, delegate* unmanaged<pa_mainloop_api*, pa_io_event*, void*, void>, void> io_set_destroy;

	public unsafe delegate* unmanaged<pa_mainloop_api*, timeval*, delegate* unmanaged<pa_mainloop_api*, pa_time_event*, timeval*, void*, void>, void*, pa_time_event*> time_new;

	public unsafe delegate* unmanaged<pa_time_event*, timeval*, void> time_restart;

	public unsafe delegate* unmanaged<pa_time_event*, void> time_free;

	public unsafe delegate* unmanaged<pa_time_event*, delegate* unmanaged<pa_mainloop_api*, pa_time_event*, void*, void>, void> time_set_destroy;

	public unsafe delegate* unmanaged<pa_mainloop_api*, delegate* unmanaged<pa_mainloop_api*, pa_defer_event*, void*, void>, void*, pa_defer_event*> defer_new;

	public unsafe delegate* unmanaged<pa_defer_event*, int, void> defer_enable;

	public unsafe delegate* unmanaged<pa_defer_event*, void> defer_free;

	public unsafe delegate* unmanaged<pa_defer_event*, delegate* unmanaged<pa_mainloop_api*, pa_defer_event*, void*, void>, void> defer_set_destroy;

	public unsafe delegate* unmanaged<pa_mainloop_api*, int, void> quit;
}
