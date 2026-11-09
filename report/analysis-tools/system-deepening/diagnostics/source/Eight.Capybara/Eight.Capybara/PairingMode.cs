using System;
using Eight.DBus;

namespace Eight.Capybara;

public class PairingMode : IPairingMode
{
	public bool Active { get; private set; }

	public PairingMode(bool initialState)
	{
		Active = initialState;
	}

	public void EnterPairingMode()
	{
		Active = true;
		Console.WriteLine($"pairing mode: {Active}");
	}

	public void ExitPairingMode()
	{
		Active = false;
		Console.WriteLine($"pairing mode: {Active}");
	}
}
