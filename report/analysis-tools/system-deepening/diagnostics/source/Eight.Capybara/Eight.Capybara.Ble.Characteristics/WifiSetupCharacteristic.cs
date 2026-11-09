using System;
using System.Diagnostics;
using System.Diagnostics.CodeAnalysis;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using DotnetBleServer.Gatt;
using DotnetBleServer.Gatt.Description;
using Eight.Ble;
using Eight.DBus;
using Eight.Wifi;
using Eight.Wifi.Contract;

namespace Eight.Capybara.Ble.Characteristics;

public class WifiSetupCharacteristic : ICharacteristicSource
{
	public static readonly JsonSerializerOptions serializerOptions = new JsonSerializerOptions
	{
		PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
		Converters = { (JsonConverter)new JsonStringEnumConverter(JsonNamingPolicy.CamelCase) }
	};

	private readonly WifiSetup wifiSetup;

	private readonly IPairingMode pairingMode;

	private readonly DeviceSpecialization deviceSpecialization;

	[UnconditionalSuppressMessage("AssemblyLoadTrimming", "IL2026:RequiresUnreferencedCode", Justification = "Serialized/deserialized types are referenced and will be preserved by the trimmer.")]
	public static WifiSetupRequestContract? TryDeserialize(ReadOnlySpan<byte> json)
	{
		try
		{
			WifiSetupRequestContract wifiSetupRequestContract = JsonSerializer.Deserialize<WifiSetupRequestContract>(json, serializerOptions);
			if (wifiSetupRequestContract?.Ssid == null)
			{
				return null;
			}
			return wifiSetupRequestContract;
		}
		catch (JsonException value)
		{
			Console.WriteLine($"[wifisetup] invalid request json ({value})");
			return null;
		}
	}

	public WifiSetupCharacteristic(WifiSetup wifiSetup, IPairingMode pairingMode, DeviceSpecialization deviceSpecialization)
	{
		this.wifiSetup = wifiSetup;
		this.pairingMode = pairingMode;
		this.deviceSpecialization = deviceSpecialization;
	}

	[UnconditionalSuppressMessage("AssemblyLoadTrimming", "IL2026:RequiresUnreferencedCode", Justification = "Serialized types are referenced and will be preserved by the trimmer.")]
	public async Task<byte[]> ReadValueAsync()
	{
		Stopwatch sw = Stopwatch.StartNew();
		string text = JsonSerializer.Serialize(WifiSetupStatusContract.FromStatus(await wifiSetup.GetStatus()), serializerOptions);
		byte[] result = GZipUtils.Compress(Encoding.UTF8.GetBytes(text));
		Console.WriteLine($"[wifisetup][profile] read {text} took: {sw.ElapsedMilliseconds}ms");
		return result;
	}

	private async Task DelayedConnect(byte[] value)
	{
		Stopwatch sw = Stopwatch.StartNew();
		WifiSetupRequestContract wifiSetupRequestContract = TryDeserialize(GZipUtils.Decompress(value));
		if ((object)wifiSetupRequestContract == null)
		{
			return;
		}
		var (text4, text5, specialization) = wifiSetupRequestContract;
		Console.WriteLine($"[wifisetup] connecting to {text4} ({(string.IsNullOrEmpty(text5) ? "open" : "protected")})");
		Console.WriteLine("[wifisetup] specialization: " + (specialization ?? "na"));
		try
		{
			await wifiSetup.Connect(text4, text5);
			await deviceSpecialization.TryUpdate(specialization);
		}
		finally
		{
			pairingMode.ExitPairingMode();
			Console.WriteLine($"[wifisetup][profile] connect took: {sw.ElapsedMilliseconds}ms");
		}
	}

	public Task WriteValueAsync(byte[] value)
	{
		Stopwatch stopwatch = Stopwatch.StartNew();
		Task.Run(() => DelayedConnect(value).ConfigureAwait(continueOnCapturedContext: false));
		Console.WriteLine($"[wifisetup][profile] write took: {stopwatch.ElapsedMilliseconds}ms");
		return Task.CompletedTask;
	}

	public static implicit operator GattCharacteristicDescription(WifiSetupCharacteristic characteristic)
	{
		GattCharacteristicDescription gattCharacteristicDescription = new GattCharacteristicDescription();
		gattCharacteristicDescription.UUID = "b52828ba-1af4-4e12-bc17-aeed13c743e5";
		gattCharacteristicDescription.Flags = new string[2] { "read", "write" };
		gattCharacteristicDescription.CharacteristicSource = new CharacteristicSourceLogger(characteristic);
		return gattCharacteristicDescription;
	}
}
