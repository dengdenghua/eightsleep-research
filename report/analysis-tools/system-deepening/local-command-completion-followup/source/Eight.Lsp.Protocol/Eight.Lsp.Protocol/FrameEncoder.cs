using System.Collections.Generic;

namespace Eight.Lsp.Protocol;

public class FrameEncoder
{
	private const int BufferSize = 2048;

	private readonly List<byte> buffer = new List<byte>(2048);

	private IPhysicalLayer? currentPhysical;

	public void SendFrame(IPhysicalLayer physical, byte[] data)
	{
		currentPhysical = physical;
		WriteByte(126);
		foreach (byte b in data)
		{
			if (b == 126 || b == 125)
			{
				WriteByte(125);
				WriteByte((byte)(b ^ 0x20));
			}
			else
			{
				WriteByte(b);
			}
		}
		Flush();
	}

	private void WriteByte(byte b)
	{
		buffer.Add(b);
		if (buffer.Count >= 2048)
		{
			Flush();
		}
	}

	private void Flush()
	{
		if (buffer.Count != 0)
		{
			currentPhysical.Send(buffer.ToArray());
			buffer.Clear();
		}
	}
}
