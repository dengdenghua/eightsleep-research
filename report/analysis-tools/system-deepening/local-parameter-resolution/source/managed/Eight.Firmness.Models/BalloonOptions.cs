using System;
using System.Collections.Generic;
using System.Linq;
using Eight.Lsp.Subsystems.Models;

namespace Eight.Firmness.Models;

public class BalloonOptions : IDeviceOptions
{
	public UsbPortConfig? UsbPortConfig { get; set; }

	public Dictionary<Side, string[]> UsbPorts
	{
		get
		{
			return UsbPortConfig?.ToDictionary() ?? new Dictionary<Side, string[]>();
		}
		set
		{
			UsbPortConfig = new UsbPortConfig
			{
				Left = value.GetValueOrDefault(Side.Left),
				Right = value.GetValueOrDefault(Side.Right)
			};
		}
	}

	public int BootloaderBaudrate { get; set; } = 38400;

	public int FirmwareBaudrate { get; set; } = 115200;

	public List<FirmwareMapping>? FirmwareMappings { get; set; }

	public string DeviceId { get; set; } = "";

	public string MachineSection { get; set; } = "";

	public TimeSpan DeviceUpdateInterval { get; set; } = TimeSpan.FromSeconds(1L);

	public int MaxBootloaderAttempts { get; set; } = 15;

	public TimeSpan BootloaderRetryDelay { get; set; } = TimeSpan.FromSeconds(2L);

	public TimeSpan StateTimeout { get; set; } = TimeSpan.FromSeconds(5L);

	public TimeSpan CommandTimeout { get; set; } = TimeSpan.FromSeconds(1L);

	public int FirmnessValuesCount { get; set; } = 5;

	public int[]? AllowedPartNumbers { get; set; } = new int[2] { 20400, 20401 };

	public string[]? UsbRoots { get; set; }

	public IReadOnlyDictionary<Side, int[]>? SidePartNumbers { get; set; } = new Dictionary<Side, int[]>
	{
		[Side.Left] = new int[1] { 20400 },
		[Side.Right] = new int[1] { 20401 }
	};

	public string? GetFirmwarePathForRevision(string? hardwareRevision)
	{
		if (FirmwareMappings == null || string.IsNullOrEmpty(hardwareRevision))
		{
			return null;
		}
		foreach (FirmwareMapping item in FirmwareMappings.OrderByDescending((FirmwareMapping m) => m.MinimumHardwareVersion, Comparer<string>.Create(FirmwareMapping.CompareRevisions)).ToList())
		{
			if (item.Matches(hardwareRevision))
			{
				return item.FirmwarePath;
			}
		}
		return null;
	}
}
