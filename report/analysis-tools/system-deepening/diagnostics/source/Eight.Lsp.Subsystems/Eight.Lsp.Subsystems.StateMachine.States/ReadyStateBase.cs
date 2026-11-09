using System;
using System.Threading;
using System.Threading.Tasks;
using Eight.Lsp.Protocol;
using Eight.Lsp.Protocol.Models;
using Eight.Lsp.Subsystems.Models;
using Eight.Lsp.Subsystems.Services.Connection;
using Microsoft.Extensions.Logging;

namespace Eight.Lsp.Subsystems.StateMachine.States;

public abstract class ReadyStateBase(ILogger logger, ISubsystemStateFactory stateFactory, IDeviceConnection connection, FirmwareInfo firmwareInfo) : ISubsystemState
{
	protected readonly ILogger logger = logger;

	protected readonly ISubsystemStateFactory stateFactory = stateFactory;

	protected readonly IDeviceConnection connection = connection;

	protected readonly FirmwareInfo firmwareInfo = firmwareInfo;

	public IDeviceConnection Connection => connection;

	protected abstract string DeviceType { get; }

	public async Task<ISubsystemState> GetNextState(CancellationToken cancellation)
	{
		logger.LogInformation("{DeviceType} device {Side} is ready", DeviceType, connection.Side.ToLowerString());
		TaskCompletionSource<ISubsystemState> stateChangeTcs = new TaskCompletionSource<ISubsystemState>();
		connection.StateChanged += OnStateChanged;
		try
		{
			await Initialize(cancellation);
			connection.PacketReceived += OnPacketReceived;
			ISubsystemState subsystemState = await RunMonitorLoop(stateChangeTcs, cancellation);
			cancellation.ThrowIfCancellationRequested();
			if (subsystemState != null)
			{
				return subsystemState;
			}
			if (stateChangeTcs.Task.IsCompleted)
			{
				await connection.Close(CancellationToken.None);
				return await stateChangeTcs.Task;
			}
		}
		catch (OperationCanceledException)
		{
		}
		finally
		{
			connection.PacketReceived -= OnPacketReceived;
			connection.StateChanged -= OnStateChanged;
		}
		await connection.Close(CancellationToken.None);
		return stateFactory.CreateNotConnectedState(connection.Side);
		void OnStateChanged(DeviceState newState, DeviceState prevState)
		{
			logger.LogWarning("{DeviceType} device {Side} state changed from {PrevState} to {NewState}, transitioning to not connected", DeviceType, connection.Side.ToLowerString(), prevState.ToDisplayName(), newState.ToDisplayName());
			if (newState != DeviceState.Firmware)
			{
				stateChangeTcs.TrySetResult(stateFactory.CreateNotConnectedState(connection.Side));
			}
		}
	}

	protected abstract Task Initialize(CancellationToken cancellation);

	protected abstract void OnPacketReceived(Packet packet, ProtocolContext context);

	protected abstract Task<ISubsystemState?> RunMonitorLoop(TaskCompletionSource<ISubsystemState> stateChangeTcs, CancellationToken cancellationToken);
}
