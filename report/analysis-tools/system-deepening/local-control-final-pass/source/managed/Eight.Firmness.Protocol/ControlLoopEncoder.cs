using System;
using System.Buffers.Binary;
using Eight.Firmness.Models;

namespace Eight.Firmness.Protocol;

public static class ControlLoopEncoder
{
	public const byte SetToleranceBin = 3;

	public const byte SetToleranceRange = 4;

	public const byte SetPressureCompensation = 9;

	public const byte ReadConfig = 10;

	public const byte SetTelemetryProfile = 13;

	public const byte SetDeflateSettleTime = 14;

	public const uint MaxDeflateSettleTimeMs = 2000u;

	public const int ToleranceBinCount = 10;

	public static byte[] EncodeToleranceBin(byte binIndex, float arrivalKpa, float departureKpa)
	{
		byte[] array = new byte[10] { 3, binIndex, 0, 0, 0, 0, 0, 0, 0, 0 };
		BinaryPrimitives.WriteSingleLittleEndian(array.AsSpan(2, 4), arrivalKpa);
		BinaryPrimitives.WriteSingleLittleEndian(array.AsSpan(6, 4), departureKpa);
		return array;
	}

	public static byte[] EncodeToleranceRange(float minKpa, float maxKpa)
	{
		byte[] array = new byte[9] { 4, 0, 0, 0, 0, 0, 0, 0, 0 };
		BinaryPrimitives.WriteSingleLittleEndian(array.AsSpan(1, 4), minKpa);
		BinaryPrimitives.WriteSingleLittleEndian(array.AsSpan(5, 4), maxKpa);
		return array;
	}

	public static byte[] EncodeTelemetryProfile(BalloonTelemetryProfile profile)
	{
		if (!Enum.IsDefined(profile))
		{
			throw new ArgumentOutOfRangeException("profile", profile, "The balloon firmware rejects any telemetry profile it does not define");
		}
		return new byte[2]
		{
			13,
			(byte)profile
		};
	}

	public static byte[] EncodeReadConfig()
	{
		return new byte[1] { 10 };
	}

	public static byte[] EncodeDeflateSettleTime(uint settleMs)
	{
		ArgumentOutOfRangeException.ThrowIfGreaterThan(settleMs, 2000u, "settleMs");
		byte[] array = new byte[5] { 14, 0, 0, 0, 0 };
		BinaryPrimitives.WriteUInt32LittleEndian(array.AsSpan(1, 4), settleMs);
		return array;
	}

	public static byte[] EncodePressureCompensation(byte bagId, float a, float b, float ci)
	{
		byte[] array = new byte[14]
		{
			9, bagId, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0
		};
		BinaryPrimitives.WriteSingleLittleEndian(array.AsSpan(2, 4), a);
		BinaryPrimitives.WriteSingleLittleEndian(array.AsSpan(6, 4), b);
		BinaryPrimitives.WriteSingleLittleEndian(array.AsSpan(10, 4), ci);
		return array;
	}
}
