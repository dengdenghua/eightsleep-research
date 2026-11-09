using System;
using System.Buffers.Binary;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;

namespace Eight.Speaker;

public class BluetrumFotaUpdater(ILogger logger, Rfcomm rfcomm)
{
	private static readonly byte[] ConnectionId = new byte[7] { 204, 170, 85, 238, 18, 25, 228 };

	private const byte CmdStartData = 160;

	private const byte CmdContinueData = 32;

	private const byte CmdStatus = 144;

	private const byte CmdUpgradeRequest = 145;

	private const byte TypeUpgradeRequest = 2;

	private const ushort ForceVersion = ushort.MaxValue;

	private const int StartDataHeader = 10;

	private const int ContinueHeader = 2;

	private readonly ILogger logger = logger;

	private readonly Rfcomm rfcomm = rfcomm;

	private int seq;

	public Task<bool> Update(byte[] firmware, uint version, CancellationToken cancellationToken)
	{
		return Task.FromResult(RunUpdate(firmware, (ushort)version, cancellationToken));
	}

	private bool RunUpdate(byte[] firmware, ushort version, CancellationToken cancellationToken)
	{
		logger.LogInformation("FOT: sending connection ID {Id}", BitConverter.ToString(ConnectionId));
		rfcomm.WriteWithoutResponse(ConnectionId);
		uint num = Crc32(firmware);
		byte[] array = new byte[9]
		{
			145,
			NextSeq(),
			2,
			0,
			0,
			0,
			0,
			0,
			0
		};
		BinaryPrimitives.WriteUInt16LittleEndian(array.AsSpan(3, 2), ushort.MaxValue);
		BinaryPrimitives.WriteUInt32LittleEndian(array.AsSpan(5, 4), num);
		logger.LogInformation("FOT: upgrade request (0x91/02) version=0x{Ver:X4} hash=0x{Hash:X8} (file version {Cfg}, size {Size})", ushort.MaxValue, num, version, firmware.Length);
		rfcomm.WriteWithoutResponse(array);
		if (!ReadUpgradeResponse(out var startAddress, out var blockLength, out var maxPacket, out var allowed))
		{
			return false;
		}
		logger.LogInformation("FOT: upgrade response startAddr={Start} blockLen={Block} maxPacket={Max} allowed={Allowed}", startAddress, blockLength, maxPacket, allowed);
		if (allowed != 1)
		{
			logger.LogError("FOT: upgrade not allowed by device (allowed={Allowed}).", allowed);
			return false;
		}
		if (blockLength <= 0 || maxPacket <= 10)
		{
			logger.LogError("FOT: invalid blockLen={Block}/maxPacket={Max} from device.", blockLength, maxPacket);
			return false;
		}
		int num2;
		for (int i = (int)startAddress; i < firmware.Length; i += num2)
		{
			cancellationToken.ThrowIfCancellationRequested();
			num2 = Math.Min(blockLength, firmware.Length - i);
			SendBlock((uint)i, firmware, i, num2, maxPacket);
			byte b = ReadStatus(cancellationToken);
			switch (b)
			{
			case 0:
				break;
			case byte.MaxValue:
				logger.LogInformation("FOT complete (status 255) at offset {Offset}.", i + num2);
				CloseLinkAfterCompletion();
				return true;
			case 253:
				logger.LogWarning("FOT paused by device (status 253); aborting this run.");
				return false;
			default:
				logger.LogError("FOT aborted: device status {Status} ({Desc}).", b, DescribeStatus(b));
				return false;
			}
		}
		byte b2 = ReadStatus(cancellationToken);
		logger.LogInformation("FOT final status {Status} ({Desc}).", b2, DescribeStatus(b2));
		bool flag = ((b2 == 0 || b2 == byte.MaxValue) ? true : false);
		bool flag2 = flag;
		if (flag2)
		{
			CloseLinkAfterCompletion();
		}
		return flag2;
	}

	private void CloseLinkAfterCompletion()
	{
		try
		{
			logger.LogInformation("FOT: closing the RFCOMM link so the device can apply and reboot.");
			rfcomm.Reset();
		}
		catch (Exception exception)
		{
			logger.LogWarning(exception, "FOT: failed to close the RFCOMM link after completion; continuing.");
		}
	}

	private void SendBlock(uint address, byte[] firmware, int sourceOffset, int length, int maxPacket)
	{
		int num = Math.Min(length, maxPacket - 10);
		byte[] array = new byte[10 + num];
		array[0] = 160;
		array[1] = NextSeq();
		BinaryPrimitives.WriteUInt32LittleEndian(array.AsSpan(2, 4), address);
		BinaryPrimitives.WriteUInt32LittleEndian(array.AsSpan(6, 4), (uint)length);
		Array.Copy(firmware, sourceOffset, array, 10, num);
		rfcomm.WriteWithoutResponse(array);
		int num2;
		for (int i = num; i < length; i += num2)
		{
			num2 = Math.Min(length - i, maxPacket - 2);
			byte[] array2 = new byte[2 + num2];
			array2[0] = 32;
			array2[1] = NextSeq();
			Array.Copy(firmware, sourceOffset + i, array2, 2, num2);
			rfcomm.WriteWithoutResponse(array2);
		}
		logger.LogDebug("FOT block sent: addr={Addr} len={Len}", address, length);
	}

	private bool ReadUpgradeResponse(out uint startAddress, out int blockLength, out int maxPacket, out byte allowed)
	{
		startAddress = 0u;
		blockLength = 0;
		maxPacket = 0;
		allowed = 0;
		byte[] array = rfcomm.ReadExact(3);
		logger.LogInformation("FOT: upgrade response header {Header}", BitConverter.ToString(array));
		if (array[0] != 145 || array[2] != 2)
		{
			logger.LogError("FOT: expected 0x91/02 response, got cmd=0x{Cmd:X2} type=0x{Type:X2}", array[0], array[2]);
			return false;
		}
		byte[] array2 = rfcomm.ReadExact(11);
		logger.LogInformation("FOT: upgrade response value {Value}", BitConverter.ToString(array2));
		startAddress = BinaryPrimitives.ReadUInt32LittleEndian(array2.AsSpan(0, 4));
		blockLength = (int)BinaryPrimitives.ReadUInt32LittleEndian(array2.AsSpan(4, 4));
		maxPacket = BinaryPrimitives.ReadUInt16LittleEndian(array2.AsSpan(8, 2));
		allowed = array2[10];
		return true;
	}

	private byte ReadStatus(CancellationToken cancellationToken)
	{
		for (int i = 0; i < 8; i++)
		{
			cancellationToken.ThrowIfCancellationRequested();
			byte[] array = rfcomm.ReadExact(3);
			logger.LogInformation("FOT RX status frame: {Frame}", BitConverter.ToString(array));
			if (array[0] == 144)
			{
				return array[2];
			}
			logger.LogDebug("FOT: ignoring non-status frame cmd=0x{Cmd:X2} while awaiting 0x90.", array[0]);
		}
		throw new InvalidOperationException("FOT: no 0x90 status frame received from the device.");
	}

	private byte NextSeq()
	{
		byte result = (byte)(seq & 0xFF);
		seq = (seq + 1) & 0xFF;
		return result;
	}

	private static string DescribeStatus(byte status)
	{
		return status switch
		{
			0 => "normal", 
			1 => "firmware identical to current", 
			2 => "key mismatch", 
			3 => "invalid file format (not .fot)", 
			11 => "CRC error", 
			64 => "seq error", 
			65 => "data length error", 
			253 => "pause", 
			254 => "resume", 
			byte.MaxValue => "complete", 
			_ => "unknown", 
		};
	}

	private static uint Crc32(byte[] data)
	{
		uint num = uint.MaxValue;
		foreach (byte b in data)
		{
			num ^= b;
			for (int j = 0; j < 8; j++)
			{
				num = (((num & 1) != 0) ? ((num >> 1) ^ 0xEDB88320u) : (num >> 1));
			}
		}
		return ~num;
	}
}
