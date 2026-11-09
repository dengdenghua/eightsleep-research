using System;
using System.Threading;
using System.Threading.Tasks;
using NodaTime;

namespace Eight.Audio.StateMachine.Tasks;

public sealed class CancelTask(Func<Task?> cancelTask, Duration backoff) : IPlayerTask
{
	private Task? task;

	public async Task<(bool, IPlayerTask?)> TryComplete(CancellationToken cancellation)
	{
		if (task == null)
		{
			task = cancelTask();
		}
		if (task == null)
		{
			return (true, null);
		}
		if (!task.IsCompleted)
		{
			return (false, null);
		}
		await Task.Delay(backoff.ToTimeSpan(), cancellation);
		return (true, null);
	}
}
