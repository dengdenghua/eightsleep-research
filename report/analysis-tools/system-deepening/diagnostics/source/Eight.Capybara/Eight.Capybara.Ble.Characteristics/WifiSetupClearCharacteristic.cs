using System;
using System.Text;
using System.Threading.Tasks;
using DotnetBleServer.Gatt;
using DotnetBleServer.Gatt.Description;
using Eight.Ble;
using Eight.DBus;
using Eight.Wifi;

namespace Eight.Capybara.Ble.Characteristics;

public class WifiSetupClearCharacteristic : ICharacteristicSource
{
	private readonly WifiSetup wifiSetup;

	private readonly IPairingMode pairingMode;

	public WifiSetupClearCharacteristic(WifiSetup wifiSetup, IPairingMode pairingMode)
	{
		this.wifiSetup = wifiSetup;
		this.pairingMode = pairingMode;
	}

	public async Task<byte[]> ReadValueAsync()
	{
		WifiSetupStatus wifiSetupStatus = await wifiSetup.GetStatus();
		string s = $"ConnectivityStatus: {wifiSetupStatus.ConnectivityStatus}\nDeviceStatus: {wifiSetupStatus.DeviceStatus}";
		return Encoding.UTF8.GetBytes(s);
	}

	public static (string ssid, string? pass)? ParseSsidPass(byte[] value)
	{
		string[] array = Encoding.UTF8.GetString(value).Split(" ", 2);
		return array.Length switch
		{
			1 => ((string ssid, string? pass)?)(array[0], null), 
			2 => (array[0], array[1]), 
			_ => null, 
		};
	}

	public async Task WriteValueAsync(byte[] value)
	{
		(string, string)? tuple = ParseSsidPass(value);
		if (tuple.HasValue)
		{
			var (text, text2) = tuple.Value;
			Console.WriteLine($"[wifisetup] connecting to {text} ({(string.IsNullOrEmpty(text2) ? "open" : "protected")})");
			await wifiSetup.Connect(text, text2);
			pairingMode.ExitPairingMode();
		}
	}

	public static implicit operator GattCharacteristicDescription(WifiSetupClearCharacteristic characteristic)
	{
		GattCharacteristicDescription gattCharacteristicDescription = new GattCharacteristicDescription();
		gattCharacteristicDescription.UUID = "b52828ba-1af4-4e12-bc17-aeed13c743e6";
		gattCharacteristicDescription.Flags = new string[2] { "read", "write" };
		gattCharacteristicDescription.CharacteristicSource = new CharacteristicSourceLogger(characteristic);
		return gattCharacteristicDescription;
	}
}
