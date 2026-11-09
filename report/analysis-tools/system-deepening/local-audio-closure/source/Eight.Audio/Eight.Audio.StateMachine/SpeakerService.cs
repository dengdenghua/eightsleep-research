using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.StateMachine.States;
using Eight.Capybara.Config;
using Eight.Core;
using Eight.DBus;
using Eight.Speaker;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using NodaTime;
using Tmds.DBus;
using Tmds.DBus.Protocol;

namespace Eight.Audio.StateMachine;

public class SpeakerService(ILogger<SpeakerService> logger, IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager, ISpeakerStateFactory speakerStateFactory, ISpeakerFactory speakerFactory, IAdapterProvider adapterProvider, IBluetoothHealthProbe bluetoothHealthProbe) : BackgroundService, ISpeakerProvider
{
	private readonly ILogger<SpeakerService> logger = logger;

	private readonly IPodConfigurationManager<SpeakerConfiguration> podConfigurationManager = podConfigurationManager;

	private readonly ISpeakerStateFactory speakerStateFactory = speakerStateFactory;

	private readonly ISpeakerFactory speakerFactory = speakerFactory;

	private readonly IAdapterProvider adapterProvider = adapterProvider;

	private readonly BluetoothTimeoutRecovery timeoutRecovery = new BluetoothTimeoutRecovery(logger, adapterProvider, bluetoothHealthProbe, "speaker");

	private CancellationTokenSource nextSpeakerCancellationTokenSource = new CancellationTokenSource();

	private ISpeakerState state = (((object)podConfigurationManager.Configuration != null) ? speakerStateFactory.CreateNotConnectedSpeaker() : speakerStateFactory.CreateNullSpeaker());

	private Task<bool>? pairFirstFoundBaseTask;

	private bool disposed;

	public override async Task StopAsync(CancellationToken cancellationToken)
	{
		await base.StopAsync(cancellationToken);
		if (state is IConnectedSpeakerState connectedSpeakerState)
		{
			await PeripheralShutdown.DisconnectQuietly("speaker", connectedSpeakerState.Disconnect, logger, cancellationToken);
		}
	}

	protected override async Task ExecuteAsync(CancellationToken stoppingToken)
	{
		while (!stoppingToken.IsCancellationRequested)
		{
			try
			{
				while (!stoppingToken.IsCancellationRequested)
				{
					nextSpeakerCancellationTokenSource.Dispose();
					nextSpeakerCancellationTokenSource = CancellationTokenSource.CreateLinkedTokenSource(stoppingToken);
					state = await state.GetNextState(nextSpeakerCancellationTokenSource.Token);
					timeoutRecovery.RecordSuccess();
					logger.LogInformation("Transitioned to next state: {StateName}", state.GetType().Name);
				}
			}
			catch (TimeoutException ex)
			{
				LogException(ex);
				if (nextSpeakerCancellationTokenSource.IsCancellationRequested)
				{
					await Task.Delay(5000, stoppingToken);
				}
				else if (await timeoutRecovery.RecoverFromTimeout(ex, stoppingToken))
				{
					throw;
				}
			}
			catch (OperationCanceledException exception)
			{
				if (!nextSpeakerCancellationTokenSource.IsCancellationRequested)
				{
					LogException(exception);
				}
			}
			catch (Tmds.DBus.Protocol.DisconnectedException exception2)
			{
				logger.LogError(exception2, "Connection closed for DBUS");
				adapterProvider.ResetAdapter();
				await Task.Delay(10000, stoppingToken);
			}
			catch (Exception exception3)
			{
				LogException(exception3);
			}
			finally
			{
				await Task.Delay(2000, stoppingToken);
				ISpeakerState speakerState = ((!(state is NullSpeaker)) ? speakerStateFactory.CreateNotConnectedSpeaker() : state);
				state = speakerState;
			}
		}
	}

	private void LogException(Exception exception)
	{
		if (!(exception is Tmds.DBus.DBusException exception2))
		{
			if (exception is TimeoutException exception3)
			{
				logger.LogError(exception3, "Failed to interact with the speaker within the aloted timeout period, restarting the service");
			}
			else
			{
				logger.LogError(exception, "An unhandled error occured when executing Speaker service, restarting the service");
			}
		}
		else
		{
			logger.LogError(exception2, "A BlueZ error occured, restarting the speaker service");
		}
	}

	public void SetCurrentSpeaker(Address speakerAddress)
	{
		podConfigurationManager.UpdateConfiguration(new SpeakerConfiguration(speakerAddress.AddressString, StateTracking.CreateDefault()));
		state = speakerStateFactory.CreateNotConnectedSpeaker();
	}

	public ISpeakerState GetCurrentSpeakerState()
	{
		return state;
	}

	public bool TryRemoveCurrentSpeaker()
	{
		if (state is NullSpeaker)
		{
			return false;
		}
		string address = podConfigurationManager.Configuration.Address;
		podConfigurationManager.UpdateConfiguration(null);
		state = speakerStateFactory.CreateNullSpeaker();
		nextSpeakerCancellationTokenSource.Cancel();
		speakerFactory.Remove(address, Duration.FromSeconds(10L), default);
		return true;
	}

	public IAsyncEnumerable<ScanResult> GetAvailableAddresses(CancellationToken cancellationToken)
	{
		if (!(state is NullSpeaker))
		{
			throw new ArgumentException("Only able to scan while no frame is connected");
		}
		return from x in speakerFactory.ScanForPotentialSpeakers(cancellationToken)
			select new ScanResult(new Address(x.Item1), x.Item2);
	}

	public bool TryStartPairFirstFound()
	{
		if (pairFirstFoundBaseTask != null && !pairFirstFoundBaseTask.IsCompleted)
		{
			return false;
		}
		pairFirstFoundBaseTask = PairFirstFoundInternal(Duration.FromSeconds(180L));
		return true;
	}

	private async Task<bool> PairFirstFoundInternal(Duration timeout)
	{
		bool result = default;
		object obj;
		int num;
		try
		{
			result = await PairFirstFoundInternal().WithTimeout(timeout);
			return result;
		}
		catch (TimeoutException ex)
		{
			obj = ex;
			num = 1;
		}
		if (num != 1)
		{
			return result;
		}
		TimeoutException exception = (TimeoutException)obj;
		logger.LogError(exception, "A timeout occured during the pairing process, likely DBUS hang. Restarting capybara");
		await Task.Delay(1000);
		Environment.Exit(1);
		return false;
	}

	private async Task<bool> PairFirstFoundInternal()
	{
		try
		{
			ScanResult scanResult = await GetAvailableAddresses(default).FirstOrDefaultAsync();
			if ((object)scanResult == null)
			{
				logger.LogInformation("Failed to find a speaker");
				return false;
			}
			logger.LogInformation("Found a speaker");
			SetCurrentSpeaker(scanResult.SpeakerAddress);
			return true;
		}
		catch (Tmds.DBus.Protocol.DBusException exception)
		{
			logger.LogError(exception, "A DBUS error occured during Piar First Found Speaker");
			throw;
		}
		catch (Exception exception2)
		{
			logger.LogError(exception2, "An unhandled exceptiom occured during the pair first found speaker");
			throw;
		}
	}

	protected virtual void ThrowIfDisposed()
	{
		if (disposed)
		{
			throw new ObjectDisposedException(GetType().FullName);
		}
	}

	public override void Dispose()
	{
		if (!disposed)
		{
			disposed = true;
			nextSpeakerCancellationTokenSource.Dispose();
			base.Dispose();
		}
	}
}
