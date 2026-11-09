using System;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.IO;
using System.IO.Ports;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text.RegularExpressions;
using System.Text.RegularExpressions.Generated;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Logging.Abstractions;

namespace Eight.Lsp.Subsystems.Infrastructure;

public class UsbPortMapper : IUsbPortMapper
{
	private const string DefaultUsbDevicesDir = "/sys/bus/usb/devices";

	private readonly ILogger<UsbPortMapper> logger;

	private readonly string usbDevicesDir;

	[GeneratedRegex("^(?<port>\\d+-\\d+(?:\\.\\d+)*):\\d+\\.\\d+$")]
	[GeneratedCode("System.Text.RegularExpressions.Generator", "9.0.15.2218")]
	private static Regex InterfaceDirPattern()
	{
		return _003CRegexGenerator_g_003EF20446936D011A008546DF076EB3EA1C73B683799C7B05FBC9C25A779E8078328__InterfaceDirPattern_0.Instance;
	}

	public UsbPortMapper(ILogger<UsbPortMapper>? logger = null, string usbDevicesDir = "/sys/bus/usb/devices")
	{
		this.logger = logger ?? NullLogger<UsbPortMapper>.Instance;
		this.usbDevicesDir = usbDevicesDir;
	}

	public string? ResolveUsbPortToDevice(string usbPort)
	{
		RequireLinux();
		foreach (var (text, text2) in EnumeratePortTtyPairs())
		{
			if (!(text != usbPort))
			{
				logger.LogDebug("Resolved USB port '{UsbPort}' to /dev/{Tty}", usbPort, text2);
				return "/dev/" + text2;
			}
		}
		logger.LogDebug("No tty device owned by USB port '{UsbPort}'", usbPort);
		return null;
	}

	public string? ResolveDeviceToUsbPort(string ttyDevice)
	{
		RequireLinux();
		foreach (var item in EnumeratePortTtyPairs())
		{
			var (text, _) = item;
			if (!(item.Tty != ttyDevice))
			{
				logger.LogDebug("Resolved tty '{Tty}' to USB port '{UsbPort}'", ttyDevice, text);
				return text;
			}
		}
		logger.LogDebug("No USB port owns tty device '{TtyDevice}'", ttyDevice);
		return null;
	}

	public string[] GetAvailableSerialPorts()
	{
		return SerialPort.GetPortNames();
	}

	public IReadOnlyList<UsbSerialPort> ListSerialPorts()
	{
		RequireLinux();
		return (from pair in EnumeratePortTtyPairs()
			select new UsbSerialPort(pair.Port, "/dev/" + pair.Tty, ParentHubPartNumber(pair.Port))).ToArray();
	}

	private int? ParentHubPartNumber(string usbPort)
	{
		int num = usbPort.LastIndexOf('.');
		if (num < 0)
		{
			return null;
		}
		string path = Path.Combine(usbDevicesDir, usbPort.Substring(0, num), "serial");
		string input;
		try
		{
			input = File.ReadAllText(path).Trim();
		}
		catch (Exception ex) when ((ex is IOException || ex is UnauthorizedAccessException) ? true : false)
		{
			return null;
		}
		Match match = HubSerialPartNumberPattern().Match(input);
		if (!match.Success)
		{
			return null;
		}
		return int.Parse(match.Groups["pn"].Value);
	}

	[GeneratedRegex("^(?<pn>\\d{5})-")]
	[GeneratedCode("System.Text.RegularExpressions.Generator", "9.0.15.2218")]
	private static Regex HubSerialPartNumberPattern()
	{
		return _003CRegexGenerator_g_003EF20446936D011A008546DF076EB3EA1C73B683799C7B05FBC9C25A779E8078328__HubSerialPartNumberPattern_1.Instance;
	}

	private static void RequireLinux()
	{
		if (!RuntimeInformation.IsOSPlatform(OSPlatform.Linux))
		{
			throw new PlatformNotSupportedException("USB port resolution is only supported on Linux. Current platform: " + RuntimeInformation.OSDescription);
		}
	}

	private IEnumerable<(string Port, string Tty)> EnumeratePortTtyPairs()
	{
		if (!Directory.Exists(usbDevicesDir))
		{
			logger.LogDebug("Directory {UsbDevicesDir} does not exist", usbDevicesDir);
			yield break;
		}
		foreach (string item in EnumerateInterfaceDirs())
		{
			Match match = InterfaceDirPattern().Match(Path.GetFileName(item));
			if (!match.Success)
			{
				continue;
			}
			foreach (string item2 in TtysOwnedBy(item))
			{
				yield return (Port: match.Groups["port"].Value, Tty: item2);
			}
		}
	}

	private IEnumerable<string> EnumerateInterfaceDirs()
	{
		string[] array = SafeGetDirectories(usbDevicesDir);
		foreach (string entry in array)
		{
			yield return entry;
			string[] array2 = SafeGetDirectories(entry);
			for (int j = 0; j < array2.Length; j++)
			{
				yield return array2[j];
			}
		}
	}

	private IEnumerable<string> TtysOwnedBy(string interfaceDir)
	{
		string path = Path.Combine(interfaceDir, "tty");
		string[] array;
		if (Directory.Exists(path))
		{
			array = SafeGetDirectories(path);
			for (int i = 0; i < array.Length; i++)
			{
				string fileName = Path.GetFileName(array[i]);
				if (IsTtyName(fileName))
				{
					yield return fileName;
				}
			}
		}
		array = SafeGetDirectories(interfaceDir);
		foreach (string text in array)
		{
			string fileName2 = Path.GetFileName(text);
			if (IsTtyName(fileName2) && Directory.Exists(Path.Combine(text, "tty", fileName2)))
			{
				yield return fileName2;
			}
		}
	}

	private static bool IsTtyName(string name)
	{
		if (!name.StartsWith("ttyUSB"))
		{
			return name.StartsWith("ttyACM");
		}
		return true;
	}

	private string[] SafeGetDirectories(string path)
	{
		try
		{
			return Directory.GetDirectories(path);
		}
		catch (Exception ex)
		{
			logger.LogDebug("  Error listing {Path}: {Error}", path, ex.Message);
			return Array.Empty<string>();
		}
	}
}
