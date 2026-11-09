namespace Eight.Firmness.Models.Telemetry;

public enum SchedulerState : byte
{
	Scheduling,
	Setup,
	Running,
	Cleanup,
	Sleep
}
