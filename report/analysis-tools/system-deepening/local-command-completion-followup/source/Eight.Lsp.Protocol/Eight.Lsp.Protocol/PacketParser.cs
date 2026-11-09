using System;
using System.Buffers.Binary;
using System.IO;
using System.Text;

namespace Eight.Lsp.Protocol;

public static class PacketParser
{
	public static Packet ParsePacket(byte[] data)
	{
		if (data.Length < 1)
		{
			throw new ArgumentException("Invalid packet: too short");
		}
		bool isResponse = (data[0] & 0x80) != 0;
		byte cmd = (byte)(data[0] & -129);
		byte[] payload = ((data.Length > 1) ? data[1..] : Array.Empty<byte>());
		return new Packet(isResponse, cmd, payload);
	}

	public static byte[] FormatPacketPayload(params object[] args)
	{
		using MemoryStream memoryStream = new MemoryStream();
		foreach (object obj in args)
		{
			object obj2 = obj;
			if (!(obj2 is int num))
			{
				if (!(obj2 is bool flag))
				{
					if (!(obj2 is bool[] array))
					{
						if (!(obj2 is byte[] array2))
						{
							if (!(obj2 is string s))
							{
								if (!(obj2 is SizedInt sizedInt))
								{
									throw new ArgumentException("Unsupported argument type: " + obj?.GetType().Name);
								}
								Span<byte> span = stackalloc byte[4];
								switch (sizedInt.Type)
								{
								case "uint8":
									memoryStream.WriteByte((byte)sizedInt.Value);
									break;
								case "uint16":
									BinaryPrimitives.WriteUInt16BigEndian(span, (ushort)sizedInt.Value);
									memoryStream.Write(span.Slice(0, 2));
									break;
								case "uint32":
									BinaryPrimitives.WriteUInt32BigEndian(span, (uint)sizedInt.Value);
									memoryStream.Write(span);
									break;
								default:
									throw new ArgumentException("Unknown SizedInt type: " + sizedInt.Type);
								}
							}
							else
							{
								byte[] bytes = Encoding.ASCII.GetBytes(s);
								if (bytes.Length > 254)
								{
									throw new ArgumentException("String too long");
								}
								memoryStream.WriteByte((byte)bytes.Length);
								memoryStream.Write(bytes, 0, bytes.Length);
							}
						}
						else
						{
							memoryStream.Write(array2, 0, array2.Length);
						}
						continue;
					}
					if (array.Length > 8)
					{
						throw new ArgumentException("Too many boolean flags (max 8)");
					}
					byte b = 0;
					for (int j = 0; j < array.Length; j++)
					{
						if (array[j])
						{
							b |= (byte)(1 << j);
						}
					}
					memoryStream.WriteByte(b);
				}
				else
				{
					memoryStream.WriteByte(flag ? ((byte)1) : ((byte)0));
				}
			}
			else
			{
				if (num < 0 || num > 255)
				{
					int value = num;
					throw new ArgumentException($"Integer {value} out of range for uint8");
				}
				memoryStream.WriteByte((byte)num);
			}
		}
		return memoryStream.ToArray();
	}
}
