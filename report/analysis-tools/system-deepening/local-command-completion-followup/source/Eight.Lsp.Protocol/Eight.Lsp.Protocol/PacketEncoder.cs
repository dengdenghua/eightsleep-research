using System;
using System.Buffers.Binary;
using System.IO;

namespace Eight.Lsp.Protocol;

public class PacketEncoder
{
	private readonly FrameEncoder frameEncoder = new FrameEncoder();

	private readonly int lengthBytes;

	public PacketEncoder(int lengthBytes = 1)
	{
		if (!((uint)(lengthBytes - 1) <= 1u))
		{
			throw new ArgumentException("lengthBytes must be 1 or 2", "lengthBytes");
		}
		this.lengthBytes = lengthBytes;
		base._002Ector();
	}

	public void SendPacket(IPhysicalLayer physical, byte[] payload)
	{
		int num = ((lengthBytes == 1) ? 255 : 65535);
		if (payload.Length > num)
		{
			throw new ArgumentException($"Payload too large for {lengthBytes}-byte length");
		}
		using MemoryStream memoryStream = new MemoryStream();
		if (lengthBytes == 1)
		{
			memoryStream.WriteByte((byte)payload.Length);
		}
		else
		{
			Span<byte> span = stackalloc byte[2];
			BinaryPrimitives.WriteUInt16BigEndian(span, (ushort)payload.Length);
			memoryStream.Write(span);
		}
		memoryStream.Write(payload, 0, payload.Length);
		ushort value = Crc.CalculateCrc16(payload, 7439, 4129);
		Span<byte> span2 = stackalloc byte[2];
		BinaryPrimitives.WriteUInt16BigEndian(span2, value);
		memoryStream.Write(span2);
		frameEncoder.SendFrame(physical, memoryStream.ToArray());
	}
}
