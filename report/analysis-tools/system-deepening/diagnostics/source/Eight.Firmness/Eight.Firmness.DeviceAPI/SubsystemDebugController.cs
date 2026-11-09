using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Eight.Capybara.DeviceApi;
using Eight.DeviceApiClient;
using Eight.DeviceProtocol;
using Eight.Lsp.Subsystems.Infrastructure;
using Microsoft.Extensions.Logging;

namespace Eight.Firmness.DeviceAPI;

public class SubsystemDebugController(ILogger<SubsystemDebugController> logger, IUsbPortMapper usbPortMapper) : RequestController
{
	private readonly ILogger<SubsystemDebugController> logger = logger;

	private readonly IUsbPortMapper usbPortMapper = usbPortMapper;

	[FunctionHandler("debugsubsystem/usbports")]
	public Task<Response> GetUsbPorts()
	{
		try
		{
			string[] availableSerialPorts = usbPortMapper.GetAvailableSerialPorts();
			List<UsbPortMapping> list = new List<UsbPortMapping>();
			foreach (string item in availableSerialPorts.OrderBy((string p) => p))
			{
				string fileName = Path.GetFileName(item);
				if (fileName.StartsWith("ttyUSB") || fileName.StartsWith("ttyACM"))
				{
					string text = usbPortMapper.ResolveDeviceToUsbPort(fileName);
					if (text != null)
					{
						list.Add(new UsbPortMapping(item, text));
					}
				}
			}
			return Task.FromResult(Utils.CreateResponse(list));
		}
		catch (PlatformNotSupportedException)
		{
			return Task.FromResult(Utils.CreateFailure("USB port discovery is only supported on Linux", "BadRequest"));
		}
		catch (Exception ex2)
		{
			logger.LogError(ex2, "Failed to enumerate USB ports: {Error}", ex2.Message);
			return Task.FromResult(Utils.CreateFailure("Failed to enumerate USB ports: " + ex2.Message, "UnknownAccessory"));
		}
	}
}
