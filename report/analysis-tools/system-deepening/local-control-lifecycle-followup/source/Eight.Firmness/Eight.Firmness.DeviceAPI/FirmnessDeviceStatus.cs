using Eight.Capybara.DeviceApi;
using Eight.DeviceProtocol;
using Eight.Firmness.StateMachine.States;
using Eight.Lsp.Subsystems.Models;
using Eight.Lsp.Subsystems.StateMachine;
using Eight.Lsp.Subsystems.StateMachine.States;

namespace Eight.Firmness.DeviceAPI;

public static class FirmnessDeviceStatus
{
	public static Response? Classify(Side side, ISubsystemState? state, Response? calibrating = null)
	{
		if (state != null && !(state is NullState))
		{
			if (!(state is NotConnectedState))
			{
				if (!(state is WaitingForBootloaderState))
				{
					if (!(state is CheckingFirmwareState) && !(state is BootingToFirmwareState))
					{
						if (!(state is UpdatingFirmwareState))
						{
							if (!(state is ErrorWaitingState))
							{
								if (!(state is CalibratingState))
								{
									if (state is FirmnessReadyState)
									{
										return null;
									}
									return NotReady(side);
								}
								return calibrating ?? Utils.CreateFailure($"Calibration is running on {side}", "BadRequest");
							}
							return Initializing($"{side} firmness device is recovering");
						}
						return Initializing($"{side} firmness device is updating firmware");
					}
					return StartingUp(side);
				}
				return Offline($"{side} firmness device is not responding");
			}
			return Offline($"{side} firmness device is disconnected");
		}
		return Utils.CreateFailure($"No firmness device configured on {side}", "UnknownAccessory");
	}

	public static Response StartingUp(Side side)
	{
		return Initializing($"{side} firmness device is starting up");
	}

	public static Response NotReady(Side side)
	{
		return Initializing($"{side} firmness device is not ready");
	}

	private static Response Offline(string message)
	{
		return Utils.CreateFailure(message, "OfflineAccessory");
	}

	private static Response Initializing(string message)
	{
		return Utils.CreateFailure(message, "AccessoryInitialization");
	}
}
