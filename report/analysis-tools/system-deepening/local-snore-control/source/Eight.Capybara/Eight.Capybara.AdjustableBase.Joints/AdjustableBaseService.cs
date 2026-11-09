using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Eight.Accessory;
using Eight.Audio.StateMachine;
using Eight.Audio.StateMachine.States;
using Eight.Capybara.AdjustableBase.Bases;
using Eight.Capybara.Config;
using Eight.Capybara.Observability;
using Eight.Core;
using Eight.DBus;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using NodaTime;
using Tmds.DBus;
using Tmds.DBus.Protocol;

namespace Eight.Capybara.AdjustableBase.Joints;

public class AdjustableBaseService : BackgroundService, IAdjustableBaseProvider
{
	private readonly ILogger<AdjustableBaseService> logger;

	private readonly IStatsd statsd;

	private readonly IAdjustableBaseFactory adjustableBaseFactory;

	private readonly IFrameFactory frameFactory;

	private readonly IAdapterProvider adapterProvider;

	private readonly IPodConfigurationManager<AdjustableBaseConfiguration> podConfigurationManager;

	private readonly ISpeakerProvider speakerProvider;

	private readonly BluetoothTimeoutRecovery timeoutRecovery;

	private CancellationTokenSource nextFrameCancellationTokenSource = new CancellationTokenSource();

	private IFrame2 AdjustableBase;

	private Task<bool>? pairFirstFoundBaseTask;

	public AdjustableBaseService(ILogger<AdjustableBaseService> logger, IStatsd statsd, IAdjustableBaseFactory adjustableBaseFactory, IFrameFactory frameFactory, IAdapterProvider adapterProvider, IBluetoothHealthProbe bluetoothHealthProbe, IPodConfigurationManager<AdjustableBaseConfiguration> podConfigurationManager, ISpeakerProvider speakerProvider)
	{
		this.logger = logger;
		this.statsd = statsd;
		this.adjustableBaseFactory = adjustableBaseFactory;
		this.frameFactory = frameFactory;
		this.adapterProvider = adapterProvider;
		this.podConfigurationManager = podConfigurationManager;
		this.speakerProvider = speakerProvider;
		timeoutRecovery = new BluetoothTimeoutRecovery(logger, adapterProvider, bluetoothHealthProbe, "frame", IsSpeakerPlaying, (TimeoutRecoveryAction action) =>
		{
			IStatsd statsd2 = statsd;
			statsd2.Increment(action switch
			{
				TimeoutRecoveryAction.Backoff => "adjustableBase.timeout.backoff", 
				TimeoutRecoveryAction.ResetAdapter => "adjustableBase.timeout.adapterReset", 
				_ => "adjustableBase.timeout.restart", 
			});
		});
		if ((object)podConfigurationManager.Configuration != null)
		{
			AdjustableBase = frameFactory.CreateNotConnectedFrame();
		}
		else
		{
			AdjustableBase = frameFactory.CreateNullFrame();
		}
	}

	private bool IsSpeakerPlaying()
	{
		if (speakerProvider.GetCurrentSpeakerState() is ReadyState readyState)
		{
			return readyState.State.State == PlayerState.Playing;
		}
		return false;
	}

	public override async Task StopAsync(CancellationToken cancellationToken)
	{
		await base.StopAsync(cancellationToken);
		if (AdjustableBase is IConnectedFrame connectedFrame)
		{
			await PeripheralShutdown.DisconnectQuietly("adjustable base", connectedFrame.Disconnect, logger, cancellationToken);
		}
	}

	protected override async Task ExecuteAsync(CancellationToken stoppingToken)
	{
		while (!stoppingToken.IsCancellationRequested)
		{
			try
			{
				nextFrameCancellationTokenSource = CancellationTokenSource.CreateLinkedTokenSource(stoppingToken);
				CancellationToken token = nextFrameCancellationTokenSource.Token;
				while (!token.IsCancellationRequested)
				{
					AdjustableBase = await AdjustableBase.GetNextFrame(token);
					timeoutRecovery.RecordSuccess();
					logger.LogInformation("Transitioned to next frame: {FrameName}", AdjustableBase.GetType().Name);
				}
			}
			catch (OperationCanceledException) when (nextFrameCancellationTokenSource.IsCancellationRequested)
			{
			}
			catch (Exception ex2) when ((ex2 is TimeoutException || ex2 is BedFrameConnectException) ? true : false)
			{
				LogException(ex2);
				if (nextFrameCancellationTokenSource.IsCancellationRequested)
				{
					await Task.Delay(5000, stoppingToken);
				}
				else if (await timeoutRecovery.RecoverFromTimeout(ex2, stoppingToken))
				{
					throw;
				}
			}
			catch (Tmds.DBus.Protocol.DisconnectedException exception)
			{
				logger.LogError(exception, "Connection closed for DBUS");
				adapterProvider.ResetAdapter();
				await Task.Delay(10000, stoppingToken);
			}
			catch (Exception exception2)
			{
				LogException(exception2);
			}
			finally
			{
				await Task.Delay(2000, stoppingToken);
				IFrame2 adjustableBase = AdjustableBase;
				IFrame2 adjustableBase2;
				if (adjustableBase is IExpiringFrame { Expired: false })
				{
					adjustableBase2 = AdjustableBase;
				}
				else if (adjustableBase is NullFrame)
				{
					adjustableBase2 = AdjustableBase;
				}
				else
				{
					adjustableBase2 = ((!(adjustableBase is DebugFrame)) ? frameFactory.CreateNotConnectedFrame() : AdjustableBase);
				}
				AdjustableBase = adjustableBase2;
			}
		}
	}

	private void LogException(Exception exception)
	{
		if (exception is BedFrameConnectException)
		{
			Exception innerException = exception.InnerException;
			if (innerException != null)
			{
				LogException(innerException);
				return;
			}
		}
		else
		{
			if (exception is Tmds.DBus.DBusException exception2)
			{
				statsd.Increment("adjustableBase.dbus.error");
				logger.LogError(exception2, "A BlueZ error occured, restarting the service");
				return;
			}
			if (exception is Tmds.DBus.Protocol.DBusException exception3)
			{
				statsd.Increment("adjustableBase.dbus.error");
				logger.LogError(exception3, "A BlueZ error occured, restarting the service");
				return;
			}
			if (exception is BluetoothConnectDroppedException exception4)
			{
				statsd.Increment("adjustableBase.connect.dropped");
				logger.LogError(exception4, "The frame dropped the connection before services resolved, restarting the service");
				return;
			}
			if (exception is TimeoutException exception5)
			{
				statsd.Increment("adjustableBase.dbus.timeout");
				logger.LogError(exception5, "Failed to interact with the frame within the aloted timeout period, restarting the service");
				return;
			}
		}
		statsd.Increment("adjustableBase.unhandledException");
		logger.LogError(exception, "An unhandled error occured when executing TriMix service, restarting the service");
	}

	public void SetCurrentAdjustableBase(Address adjustableBaseAddress)
	{
		podConfigurationManager.UpdateConfiguration(new AdjustableBaseConfiguration(adjustableBaseAddress.AddressString, SplitBase: false));
		AdjustableBase = frameFactory.CreateNotConnectedFrame();
		nextFrameCancellationTokenSource.Cancel();
	}

	public async Task<bool> TryRemoveCurrentAdjustableBase()
	{
		if (AdjustableBase == null)
		{
			return false;
		}
		string address = podConfigurationManager.Configuration?.Address;
		podConfigurationManager.UpdateConfiguration(null);
		AdjustableBase = frameFactory.CreateNullFrame();
		nextFrameCancellationTokenSource.Cancel();
		if (address != null)
		{
			try
			{
				await adjustableBaseFactory.Remove(address, Duration.FromSeconds(10L), default);
			}
			catch (Exception exception)
			{
				logger.LogError(exception, "Failed to remove BLE connection for {Address}", address);
			}
		}
		return true;
	}

	public async Task<IEnumerable<ScanResult>> ScanAvailableAddresses(CancellationToken cancellationToken)
	{
		if (!(AdjustableBase is NullFrame))
		{
			throw new ArgumentException("Only able to scan while no frame is connected");
		}
		await adjustableBaseFactory.FlushBlueZ(cancellationToken);
		return (await adjustableBaseFactory.AvailableBluetoothDevices(cancellationToken)).Select(((string, int) x) => new ScanResult(new Address(x.Item1), x.Item2));
	}

	public IAsyncEnumerable<ScanResult> GetAvailableAddresses(CancellationToken cancellationToken)
	{
		if (!(AdjustableBase is NullFrame))
		{
			throw new ArgumentException("Only able to scan while no frame is connected");
		}
		return from x in adjustableBaseFactory.ScanForPotentialBases(cancellationToken)
			select new ScanResult(new Address(x.Item1), x.Item2);
	}

	public async Task TransitionToDebugMode()
	{
		if (AdjustableBase is NullFrame || AdjustableBase is NotConnectedFrame)
		{
			throw new ArgumentException("Unable to move to debug mode not in a starting frame");
		}
		AdjustableBase = await frameFactory.CreateDebugFrame(default);
		nextFrameCancellationTokenSource.Cancel();
	}

	public bool TryStartPairFirstFound()
	{
		if (pairFirstFoundBaseTask != null && !pairFirstFoundBaseTask.IsCompleted)
		{
			return false;
		}
		pairFirstFoundBaseTask = PairFirstFoundInternal(Duration.FromSeconds(240L));
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
		_ = 2;
		try
		{
			ScanResult firstBase;
			try
			{
				firstBase = await GetAvailableAddresses(default).FirstOrDefaultAsync();
			}
			catch (Tmds.DBus.Protocol.DisconnectedException exception)
			{
				logger.LogError(exception, "Connection closed for DBUS, resetting adapter and trying to pair again");
				adapterProvider.ResetAdapter();
				await Task.Delay(10000);
				firstBase = await GetAvailableAddresses(default).FirstOrDefaultAsync();
			}
			if ((object)firstBase == null)
			{
				logger.LogInformation("Failed to find an adjustable base");
				return false;
			}
			logger.LogInformation("Found a base");
			SetCurrentAdjustableBase(firstBase.AdjustableBaseAddress);
			return true;
		}
		catch (Tmds.DBus.DBusException exception2)
		{
			logger.LogError(exception2, "A DBUS error occured during Piar First Found Base");
			throw;
		}
		catch (Exception exception3)
		{
			logger.LogError(exception3, "An unhandled exceptiom occured during the pair first found base");
			throw;
		}
	}

	public IFrame2 TryGetCurrentAdjustableBase()
	{
		return AdjustableBase;
	}
}
