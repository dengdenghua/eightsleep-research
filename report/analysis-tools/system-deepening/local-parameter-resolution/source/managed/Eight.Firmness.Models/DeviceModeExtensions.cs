using System;

namespace Eight.Firmness.Models;

public static class DeviceModeExtensions
{
	public static DeviceMode FromString(string mode)
	{
		string text = mode.ToLower();
		if (!(text == "demo"))
		{
			if (text == "sleep")
			{
				return DeviceMode.Sleep;
			}
			throw new ArgumentException("Invalid mode '" + mode + "', expected 'demo' or 'sleep'", "mode");
		}
		return DeviceMode.Demo;
	}

	public static byte ToByte(this DeviceMode mode)
	{
		return (byte)mode;
	}

	public static string ToDisplayName(this DeviceMode mode)
	{
		return mode switch
		{
			DeviceMode.Demo => "DEMO", 
			DeviceMode.Sleep => "SLEEP", 
			_ => throw new ArgumentOutOfRangeException("mode", mode, "Unknown device mode"), 
		};
	}
}
