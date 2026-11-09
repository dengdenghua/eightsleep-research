using System;
using System.Threading;
using System.Threading.Tasks;

namespace Microsoft.Extensions.Hosting;

public abstract class BackgroundService : IHostedService, IDisposable
{
	private Task _executeTask;

	private CancellationTokenSource _stoppingCts;

	public virtual Task? ExecuteTask => _executeTask;

	protected abstract Task ExecuteAsync(CancellationToken stoppingToken);

	public virtual Task StartAsync(CancellationToken cancellationToken)
	{
		_stoppingCts = CancellationTokenSource.CreateLinkedTokenSource(cancellationToken);
		_executeTask = Task.Run(() => ExecuteAsync(_stoppingCts.Token), _stoppingCts.Token);
		return Task.CompletedTask;
	}

	public virtual async Task StopAsync(CancellationToken cancellationToken)
	{
		if (_executeTask != null)
		{
			try
			{
				_stoppingCts.Cancel();
			}
			finally
			{
				await _executeTask.WaitAsync(cancellationToken).ConfigureAwait(ConfigureAwaitOptions.SuppressThrowing);
			}
		}
	}

	public virtual void Dispose()
	{
		_stoppingCts?.Cancel();
	}
}
