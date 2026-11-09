using System;
using System.Diagnostics;
using System.IO;
using System.IO.Ports;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;

namespace Eight.Speaker;

public class Rfcomm(ILogger<Rfcomm> logger, string deviceName, string macAddress) : IAsyncDisposable, IDisposable
{
	private readonly ILogger<Rfcomm> logger = logger;

	private readonly string deviceName = deviceName;

	private readonly string macAddress = macAddress;

	private const string RfcommPath = "/usr/bin/rfcomm";

	private SerialPort? serialPort;

	private bool initialized;

	private string DevicePath => "/dev/" + deviceName;

	public byte[] WriteWithResponse(byte[] payload, int responseSize)
	{
		for (int i = 0; i < 3; i++)
		{
			try
			{
				return WriteWithResponseInternal(payload, responseSize);
			}
			catch (ObjectDisposedException)
			{
				if (i == 2)
				{
					throw;
				}
				serialPort.Close();
				serialPort.Open();
			}
		}
		throw new Exception("");
	}

	private byte[] WriteWithResponseInternal(byte[] payload, int responseSize)
	{
		WriteWithoutResponse(payload);
		return Read(responseSize);
	}

	public byte[] WriteWithResponseUpTo(byte[] payload, int maxSize)
	{
		for (int i = 0; i < 3; i++)
		{
			try
			{
				WriteWithoutResponse(payload);
				return ReadUpTo(maxSize);
			}
			catch (ObjectDisposedException)
			{
				if (i == 2)
				{
					throw;
				}
				serialPort.Close();
				serialPort.Open();
			}
		}
		throw new Exception("");
	}

	private byte[] ReadUpTo(int maxSize)
	{
		byte[] array = new byte[maxSize];
		int num = serialPort.Read(array, 0, maxSize);
		logger.LogDebug("RFCOMM RX (up to {Max}, got {Got}): {Bytes}", maxSize, num, BitConverter.ToString(array, 0, num));
		return array;
	}

	public void WriteWithoutResponse(byte[] payload)
	{
		if (!initialized || serialPort == null)
		{
			throw new ArgumentException("Unabled to write to uninitialized rfcomm");
		}
		if (!serialPort.IsOpen)
		{
			throw new ArgumentException("Unabled to write to closed serial port");
		}
		Write(payload);
	}

	private void Write(byte[] payload)
	{
		logger.LogDebug("RFCOMM TX ({Length}): {Payload}", payload.Length, BitConverter.ToString(payload));
		serialPort.Write(payload, 0, payload.Length);
	}

	private byte[] Read(int responseSize)
	{
		return ReadFramed(responseSize, (byte[] buf, int off, int count) => serialPort.Read(buf, off, count), () => serialPort.BytesToRead, logger);
	}

	internal static byte[] ReadFramed(int responseSize, Func<byte[], int, int, int> read, Func<int> bytesToRead, ILogger logger)
	{
		byte[] array = new byte[responseSize];
		int i = 0;
		try
		{
			int num;
			for (; i < responseSize; i += num)
			{
				num = read(array, i, responseSize - i);
				if (num == 0)
				{
					throw new RfcommDisconnectedException($"RFCOMM read hit EOF after {i} of {responseSize} byte(s): the link is down");
				}
			}
		}
		catch (TimeoutException ex) when (!(ex is RfcommDisconnectedException))
		{
			if (i == 0)
			{
				throw new RfcommDisconnectedException($"RFCOMM read timed out with 0 of {responseSize} byte(s): the link is down", ex);
			}
			logger.LogWarning("RFCOMM read incomplete: expected {Expected} byte(s) but only read {Actual}. Bytes read: {Response}. Still buffered: {Remaining} byte(s)", responseSize, i, BitConverter.ToString(array, 0, i), bytesToRead());
			throw;
		}
		logger.LogDebug("RFCOMM RX ({Length}): {Response}", i, BitConverter.ToString(array, 0, i));
		return array;
	}

	public byte[] ReadExact(int count)
	{
		return Read(count);
	}

	public byte[] ReadAvailable()
	{
		if (serialPort == null || !serialPort.IsOpen)
		{
			return Array.Empty<byte>();
		}
		int bytesToRead = serialPort.BytesToRead;
		if (bytesToRead <= 0)
		{
			return Array.Empty<byte>();
		}
		byte[] array = new byte[bytesToRead];
		int num = serialPort.Read(array, 0, bytesToRead);
		byte[] array2 = ((num == array.Length) ? array : array[..num]);
		logger.LogDebug("RFCOMM RX (available {Count}): {Bytes}", array2.Length, BitConverter.ToString(array2));
		return array2;
	}

	public async Task Initialize(CancellationToken cancellationToken)
	{
		if (serialPort != null)
		{
			Reset();
		}
		await Unbind(cancellationToken);
		await Task.Delay(1000, cancellationToken);
		await Bind(cancellationToken);
		await Task.Delay(1000, cancellationToken);
		serialPort = new SerialPort
		{
			BaudRate = 115200,
			PortName = DevicePath,
			ReadTimeout = 20000
		};
		serialPort.Open();
		initialized = true;
	}

	private async Task Bind(CancellationToken cancellationToken)
	{
		string arguments = "bind " + DevicePath + " " + macAddress;
		ProcessStartInfo startInfo = new ProcessStartInfo
		{
			FileName = "/usr/bin/rfcomm",
			Arguments = arguments,
			RedirectStandardError = true,
			RedirectStandardOutput = true,
			UseShellExecute = false
		};
		Process proc = new Process
		{
			StartInfo = startInfo
		};
		proc.Start();
		await proc.WaitForExitAsync(cancellationToken);
		if (proc.ExitCode != 0)
		{
			throw new ArgumentException("Failed to bind rfcomm");
		}
	}

	private Task Unbind(CancellationToken cancellationToken)
	{
		return ReleaseNode(logger, deviceName, cancellationToken);
	}

	public void Reset()
	{
		Dispose(disposing: true);
	}

	public async ValueTask DisposeAsync()
	{
		serialPort?.Close();
		serialPort?.Dispose();
		serialPort = null;
		await DisposeAsyncCore();
		GC.SuppressFinalize(this);
	}

	protected virtual async Task DisposeAsyncCore()
	{
		await Unbind(default);
	}

	public void Dispose()
	{
		Dispose(disposing: true);
		GC.SuppressFinalize(this);
	}

	protected virtual void Dispose(bool disposing)
	{
		serialPort?.Close();
		serialPort?.Dispose();
		serialPort = null;
		if (disposing)
		{
			try
			{
				DisposeAsyncCore().GetAwaiter().GetResult();
			}
			catch (Exception exception)
			{
				logger.LogWarning(exception, "RFCOMM release during dispose failed for {Device}", DevicePath);
			}
		}
	}

	internal static async Task ReleaseNode(ILogger logger, string deviceName, CancellationToken cancellationToken = default(CancellationToken))
	{
		string devicePath = "/dev/" + deviceName;
		if (File.Exists(devicePath))
		{
			ProcessStartInfo startInfo = new ProcessStartInfo
			{
				FileName = "/usr/bin/rfcomm",
				Arguments = "release " + devicePath,
				RedirectStandardError = true,
				RedirectStandardOutput = true,
				UseShellExecute = false
			};
			Process proc = new Process
			{
				StartInfo = startInfo
			};
			proc.Start();
			await proc.WaitForExitAsync(cancellationToken);
			string text = (await proc.StandardError.ReadToEndAsync(cancellationToken)).Trim();
			if (proc.ExitCode != 0 || text.Length > 0)
			{
				logger.LogWarning("rfcomm release {Device} exited {Code}: {Stderr}", devicePath, proc.ExitCode, text);
			}
		}
	}
}
