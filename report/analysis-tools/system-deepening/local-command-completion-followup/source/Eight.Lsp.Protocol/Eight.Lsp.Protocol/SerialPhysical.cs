using System;
using System.IO;
using System.IO.Ports;
using System.Threading.Tasks;
using Eight.Lsp.Protocol.Exceptions;

namespace Eight.Lsp.Protocol;

public sealed class SerialPhysical : IPhysicalLayer, IDisposable
{
	private readonly SerialPort port;

	public bool IsOpen => port.IsOpen;

	internal SerialPhysical(string path, int baudrate)
	{
		port = new SerialPort(path, baudrate)
		{
			ReadTimeout = 30000,
			WriteTimeout = 1000
		};
	}

	public void Open()
	{
		port.Open();
	}

	internal static int CheckedBytesToRead(string portName, Func<int> bytesToRead)
	{
		int num;
		try
		{
			num = bytesToRead();
		}
		catch (Exception ex) when ((ex is IOException || ex is InvalidOperationException) ? true : false)
		{
			throw new PortClosedException(portName, "BytesToRead failed: " + ex.Message, ex);
		}
		if (num < 0)
		{
			throw new PortClosedException(portName, $"BytesToRead returned {num}");
		}
		return num;
	}

	public byte[] TryReceive(int maxBytes)
	{
		if (!port.IsOpen)
		{
			throw new PortClosedException(port.PortName, "port is closed");
		}
		int num = CheckedBytesToRead(port.PortName, () => port.BytesToRead);
		if (num == 0)
		{
			return Array.Empty<byte>();
		}
		int num2 = Math.Min(num, maxBytes);
		byte[] array = new byte[num2];
		int num3 = port.Read(array, 0, num2);
		if (num3 < num2)
		{
			Array.Resize(ref array, num3);
		}
		return array;
	}

	public void Send(byte[] data)
	{
		if (!port.IsOpen)
		{
			throw new InvalidOperationException("Serial port is closed");
		}
		port.Write(data, 0, data.Length);
		port.BaseStream.Flush();
	}

	public void Dispose()
	{
		if (!port.IsOpen)
		{
			port.Dispose();
			return;
		}
		try
		{
			Task.Run(() =>
			{
				try
				{
					port.BaseStream.Flush();
				}
				catch
				{
				}
				try
				{
					port.Close();
				}
				catch
				{
				}
			}).Wait(TimeSpan.FromSeconds(2.0));
		}
		catch (AggregateException)
		{
		}
		port.Dispose();
	}
}
