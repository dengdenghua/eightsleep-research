using System;
using System.Buffers.Binary;
using System.Collections.Generic;
using System.Linq;

namespace Eight.Firmness.Services.Calibration;

public static class CalibrationProtocolEncoder
{
	public static byte[] EncodePumpEnable(byte pumpId, bool enabled)
	{
		return new byte[3]
		{
			0,
			pumpId,
			enabled ? ((byte)1) : ((byte)0)
		};
	}

	public static byte[] EncodePumpSpeed(byte pumpId, byte speedPercent)
	{
		return new byte[3] { 1, pumpId, speedPercent };
	}

	public static byte[] EncodeSolenoidState(byte bagId, SolenoidDirection direction, SolenoidValveState state)
	{
		byte b = ((direction == SolenoidDirection.Inflate) ? ((byte)1) : ((byte)0));
		byte b2 = ((state == SolenoidValveState.Open) ? ((byte)1) : ((byte)0));
		return new byte[4] { 0, bagId, b, b2 };
	}

	public static byte[] EncodeSolenoidOpeningConfig(SolenoidOpeningConfig config)
	{
		byte[] array = new byte[11]
		{
			1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0
		};
		BinaryPrimitives.WriteUInt32LittleEndian(array.AsSpan(1, 4), config.RampIntervalMs);
		array[5] = config.RampStepPercent;
		BinaryPrimitives.WriteUInt32LittleEndian(array.AsSpan(6, 4), config.HoldMs);
		array[10] = config.MaintainPercent;
		return array;
	}

	public static byte[] EncodeSetBagCalibration(byte bagId, float a, float b, float ci, float al, float cl)
	{
		byte[] array = new byte[22]
		{
			1, bagId, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0
		};
		BinaryPrimitives.WriteSingleLittleEndian(array.AsSpan(2, 4), a);
		BinaryPrimitives.WriteSingleLittleEndian(array.AsSpan(6, 4), b);
		BinaryPrimitives.WriteSingleLittleEndian(array.AsSpan(10, 4), ci);
		BinaryPrimitives.WriteSingleLittleEndian(array.AsSpan(14, 4), al);
		BinaryPrimitives.WriteSingleLittleEndian(array.AsSpan(18, 4), cl);
		return array;
	}

	public static byte[] EncodeSaveCalibrationToFlash(uint unixTimestampSeconds)
	{
		byte[] array = new byte[5] { 2, 0, 0, 0, 0 };
		BinaryPrimitives.WriteUInt32LittleEndian(array.AsSpan(1, 4), unixTimestampSeconds);
		return array;
	}

	public static byte[] EncodeClearCalibration()
	{
		return new byte[1] { 3 };
	}

	public static byte[] EncodeGetCalibration()
	{
		return new byte[1];
	}

	public static byte[] EncodeDisableControlLoop(int bagCount)
	{
		List<float> list = new List<float>();
		list.AddRange(Enumerable.Repeat(-1f, bagCount));
		return EncodeSetpoints(new _003C_003Ez__ReadOnlyList<float>(list));
	}

	public static byte[] EncodeSetpoints(IReadOnlyList<float> kpa)
	{
		byte[] array = new byte[kpa.Count * 4];
		for (int i = 0; i < kpa.Count; i++)
		{
			BinaryPrimitives.WriteSingleLittleEndian(array.AsSpan(i * 4, 4), kpa[i]);
		}
		return array;
	}
}
