using System;
using System.Collections.Concurrent;
using System.Threading;
using System.Threading.Tasks;
using Eight.Lsp.Subsystems.Models;
using Microsoft.Extensions.Logging;

namespace Eight.Lsp.Subsystems.StateMachine;

public static class SubsystemHost
{
	public static async Task RunAsync(ILogger logger, TimeProvider timeProvider, Side side, string deviceType, ISubsystemStateFactory factory, ConcurrentDictionary<Side, ISubsystemState> stateDict, ConcurrentDictionary<Side, CancellationTokenSource> ctsDict, Func<ISubsystemState, bool> isNullState, CancellationToken stoppingToken)
	{
		logger.LogInformation("Starting {DeviceType} state machine for {Side} side", deviceType, side.ToLowerString());
		ISubsystemState state = (stateDict[side] = factory.CreateNullState(side));
		while (!stoppingToken.IsCancellationRequested)
		{
			try
			{
				try
				{
					if (ctsDict.TryGetValue(side, out CancellationTokenSource value))
					{
						value.Dispose();
					}
					CancellationTokenSource cancellationTokenSource = (ctsDict[side] = CancellationTokenSource.CreateLinkedTokenSource(stoppingToken));
					state = await state.GetNextState(cancellationTokenSource.Token);
					logger.LogInformation("[{Side}:{DeviceType}] Transitioned to: {StateName}", side.ToLowerString(), deviceType, state.GetType().Name);
				}
				catch (OperationCanceledException)
				{
					if (!stoppingToken.IsCancellationRequested)
					{
						logger.LogWarning("[{Side}:{DeviceType}] Operation cancelled unexpectedly", side.ToLowerString(), deviceType);
					}
				}
				catch (Exception exception)
				{
					logger.LogError(exception, "[{Side}:{DeviceType}] Unhandled error in state machine, restarting", side.ToLowerString(), deviceType);
					try
					{
						await Task.Delay(TimeSpan.FromSeconds(2L), timeProvider, stoppingToken);
					}
					catch (OperationCanceledException)
					{
						goto end_IL_0076;
					}
					if (!stoppingToken.IsCancellationRequested)
					{
						try
						{
							state = factory.CreateNullState(side);
							goto end_IL_01cd;
						}
						catch (Exception exception2)
						{
							logger.LogCritical(exception2, "[{Side}:{DeviceType}] Failed to create null state, stopping", side.ToLowerString(), deviceType);
						}
					}
					goto end_IL_0076;
					end_IL_01cd:;
				}
				continue;
				end_IL_0076:;
			}
			finally
			{
				ISubsystemState subsystemState2;
				if (isNullState(state))
				{
					subsystemState2 = state;
				}
				else
				{
					subsystemState2 = ((!ctsDict.TryGetValue(side, out CancellationTokenSource value2) || !value2.IsCancellationRequested || !stateDict.TryGetValue(side, out ISubsystemState value3) || !isNullState(value3)) ? state : value3);
				}
				state = (stateDict[side] = subsystemState2);
			}
			break;
		}
		logger.LogInformation("[{Side}:{DeviceType}] State machine stopped", side.ToLowerString(), deviceType);
	}
}
