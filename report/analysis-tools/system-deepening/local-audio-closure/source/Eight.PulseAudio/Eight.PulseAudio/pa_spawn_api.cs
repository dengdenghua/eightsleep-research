namespace Eight.PulseAudio;

public struct pa_spawn_api
{
	public unsafe delegate* unmanaged<void> prefork;

	public unsafe delegate* unmanaged<void> postfork;

	public unsafe delegate* unmanaged<void> atfork;
}
