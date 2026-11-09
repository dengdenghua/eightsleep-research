using System;
using System.Buffers.Binary;

namespace Eight.Firmness.Protocol;

public static class ControlLoopConfigParser
{
	private const int PrefixBytes = 130;

	private const int BytesPerBag = 25;

	private const int BytesPerBin = 8;

	private const int V3Shift = 4;

	private const int V4Shift = 21;

	public static ControlLoopConfig Parse(ReadOnlySpan<byte> payload)
	{
		if (payload.Length < 130)
		{
			throw new FormatException($"Control config is {payload.Length} bytes, shorter than the {130}-byte prefix");
		}
		byte b = payload[0];
		int num = b switch
		{
			2 => 0, 
			3 => 4, 
			4 => 21, 
			_ => throw new FormatException($"Control config version {b} is not 2, 3 or 4"), 
		};
		int num2 = 130 + num;
		if (payload.Length < num2)
		{
			throw new FormatException($"Control config v{b} is {payload.Length} bytes, shorter than its {num2}-byte prefix");
		}
		int num3 = payload[num2 - 1];
		int num4 = num2 + num3 * 25;
		if (payload.Length != num4)
		{
			throw new FormatException($"Control config length {payload.Length} does not match {num3} bags (expected {num4})");
		}
		int num5 = payload[48 + num];
		if (num5 > 10)
		{
			throw new FormatException($"Control config reports {num5} tolerance bins, more than the {10} it can carry");
		}
		return new ControlLoopConfig(b, U(payload, 1), U(payload, 17), (b >= 3) ? new uint?(U(payload, 21)) : ((uint?)null), F(payload, 29 + num), F(payload, 33 + num), F(payload, 37 + num), payload[45 + num], payload[47 + num], ParseBins(payload, num, num5), ParseBags(payload, num2, num3));
	}

	private static ToleranceBinConfig[] ParseBins(ReadOnlySpan<byte> payload, int shift, int binCount)
	{
		ToleranceBinConfig[] array = new ToleranceBinConfig[binCount];
		for (int i = 0; i < binCount; i++)
		{
			int num = 49 + shift + i * 8;
			array[i] = new ToleranceBinConfig(F(payload, num), F(payload, num + 4));
		}
		return array;
	}

	private static BagCompensationConfig[] ParseBags(ReadOnlySpan<byte> payload, int prefix, int bagCount)
	{
		BagCompensationConfig[] array = new BagCompensationConfig[bagCount];
		for (int i = 0; i < bagCount; i++)
		{
			int num = prefix + i * 25;
			array[i] = new BagCompensationConfig(i, F(payload, num), F(payload, num + 4), F(payload, num + 8), F(payload, num + 12), F(payload, num + 16), payload[num + 20] != 0, F(payload, num + 21));
		}
		return array;
	}

	private static uint U(ReadOnlySpan<byte> payload, int at)
	{
		return BinaryPrimitives.ReadUInt32BigEndian(payload.Slice(at, payload.Length - at));
	}

	private static float F(ReadOnlySpan<byte> payload, int at)
	{
		return BinaryPrimitives.ReadSingleBigEndian(payload.Slice(at, payload.Length - at));
	}
}
