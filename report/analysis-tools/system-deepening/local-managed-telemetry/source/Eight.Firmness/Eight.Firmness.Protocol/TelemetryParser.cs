using System;
using System.Collections.Generic;
using System.Linq;
using Eight.Firmness.Models.Telemetry;
using Eight.Lsp.Protocol.BinaryHelpers;

namespace Eight.Firmness.Protocol;

public static class TelemetryParser
{
	public static PressureTelemetry ParsePressureTelemetry(byte[] payload)
	{
		if (payload.Length < 7)
		{
			throw new ArgumentException("Packet too short");
		}
		BinaryPayloadReader binaryPayloadReader = new BinaryPayloadReader(payload);
		ushort frequency = binaryPayloadReader.ReadUInt16BE();
		byte b = binaryPayloadReader.ReadByte();
		uint deviceTimestampMs = binaryPayloadReader.ReadUInt32BE();
		int num = payload.Length - 7;
		int num2 = 8;
		if (num % (num2 * b) != 0)
		{
			throw new ArgumentException("Invalid data length");
		}
		int num3 = num / (num2 * b);
		List<PressureSensorData> list = new List<PressureSensorData>();
		for (int i = 0; i < b; i++)
		{
			List<double> list2 = new List<double>();
			List<double> list3 = new List<double>();
			for (int j = 0; j < num3; j++)
			{
				float num4 = binaryPayloadReader.ReadSingleBE();
				float num5 = binaryPayloadReader.ReadSingleBE();
				list2.Add(num4);
				list3.Add(Math.Round(num5, 2));
			}
			list.Add(new PressureSensorData(list2, list3));
		}
		int ambientIndex = -1;
		for (int num6 = list.Count - 1; num6 >= 0; num6--)
		{
			if (list[num6].PressureKpa.Any((double p) => p > 0.0))
			{
				ambientIndex = num6;
				break;
			}
		}
		if (ambientIndex < 0)
		{
			ambientIndex = list.Count - 1;
		}
		List<PressureSensorData> sensors = list.Where((PressureSensorData _, int num7) => num7 != ambientIndex).ToList();
		PressureSensorData ambient = list[ambientIndex];
		return new PressureTelemetry("balloonPressure", 1, DateTimeOffset.UtcNow.ToUnixTimeSeconds(), deviceTimestampMs, frequency, sensors, ambient);
	}

	public static ControlStateTelemetry ParseControlTelemetry(byte[] payload)
	{
		if (payload.Length < 52)
		{
			throw new ArgumentException($"Control state packet too short: {payload.Length} bytes (expected at least {52})");
		}
		BinaryPayloadReader binaryPayloadReader = new BinaryPayloadReader(payload);
		uint deviceTimestampMs = binaryPayloadReader.ReadUInt32BE();
		SchedulerState schedulerState = (SchedulerState)binaryPayloadReader.ReadByte();
		byte selectedBagsMask = binaryPayloadReader.ReadByte();
		byte numBagsSteady = binaryPayloadReader.ReadByte();
		bool isSleeping = binaryPayloadReader.ReadByte() != 0;
		int num = payload.Length - 8;
		if (num % 11 != 0)
		{
			throw new ArgumentException($"Invalid control state packet: data length {num} is not a multiple of {11}");
		}
		int num2 = num / 11;
		if ((num2 < 4 || num2 > 5) ? true : false)
		{
			throw new ArgumentException($"Invalid bag count: {num2} (expected 4 or 5)");
		}
		List<BagState> list = new List<BagState>();
		for (int i = 0; i < num2; i++)
		{
			float num3 = binaryPayloadReader.ReadSingleBE();
			float num4 = binaryPayloadReader.ReadSingleBE();
			BagFsmState fsmState = (BagFsmState)binaryPayloadReader.ReadByte();
			byte safetyReason = binaryPayloadReader.ReadByte();
			byte faultReason = binaryPayloadReader.ReadByte();
			list.Add(new BagState(i, Math.Round(num3, 2), Math.Round(num4, 2), fsmState, safetyReason, faultReason));
		}
		return new ControlStateTelemetry(90, DateTimeOffset.UtcNow.ToUnixTimeSeconds(), deviceTimestampMs, schedulerState, selectedBagsMask, numBagsSteady, isSleeping, list);
	}

	public static CurrentTelemetry ParseCurrentTelemetry(byte[] payload)
	{
		if (payload.Length < 7)
		{
			throw new ArgumentException("Packet too short");
		}
		BinaryPayloadReader binaryPayloadReader = new BinaryPayloadReader(payload);
		ushort frequency = binaryPayloadReader.ReadUInt16BE();
		byte b = binaryPayloadReader.ReadByte();
		uint deviceTimestampMs = binaryPayloadReader.ReadUInt32BE();
		if (b != 4)
		{
			throw new ArgumentException($"Expected 4 current sensors, got {b}");
		}
		int num = payload.Length - 7;
		int num2 = 4;
		if (num % (num2 * b) != 0)
		{
			throw new ArgumentException("Invalid data length");
		}
		int num3 = num / (num2 * b);
		List<double> list = new List<double>();
		List<double> list2 = new List<double>();
		List<double> list3 = new List<double>();
		List<double> list4 = new List<double>();
		for (int i = 0; i < b; i++)
		{
			for (int j = 0; j < num3; j++)
			{
				float num4 = binaryPayloadReader.ReadSingleBE();
				switch (i)
				{
				case 0:
					list.Add(Math.Round(num4, 2));
					break;
				case 1:
					list2.Add(Math.Round(num4, 2));
					break;
				case 2:
					list3.Add(Math.Round(num4, 2));
					break;
				case 3:
					list4.Add(Math.Round(num4, 2));
					break;
				}
			}
		}
		return new CurrentTelemetry("balloonCurrent", 1, DateTimeOffset.UtcNow.ToUnixTimeSeconds(), deviceTimestampMs, frequency, list, list2, list3, list4);
	}

	public static HealthTelemetry ParseHealthTelemetry(byte[] payload)
	{
		int num = 53;
		if (payload.Length < num)
		{
			throw new ArgumentException($"Health packet too short: {payload.Length} bytes (expected at least {num})");
		}
		BinaryPayloadReader binaryPayloadReader = new BinaryPayloadReader(payload);
		uint deviceTimestampMs = binaryPayloadReader.ReadUInt32BE();
		byte b = payload[4];
		int num2 = 5 + b * 8 + 16;
		bool flag = payload.Length == num2;
		if (flag)
		{
			bool flag2 = (uint)(b - 4) <= 1u;
			flag = flag2;
		}
		int num3;
		byte b2;
		if (flag)
		{
			num3 = 1;
			b2 = binaryPayloadReader.ReadByte();
		}
		else
		{
			num3 = binaryPayloadReader.ReadByte();
			if (num3 < 2)
			{
				throw new ArgumentException($"Unknown health packet version: {num3} (expected >= 2; v1 packets are detected by length)");
			}
			b2 = binaryPayloadReader.ReadByte();
			if ((b2 < 4 || b2 > 5) ? true : false)
			{
				throw new ArgumentException($"Invalid bag count: {b2} (expected 4 or 5)");
			}
			int num4 = 6 + b2 * 8 + 16 + 4;
			if (payload.Length != num4)
			{
				throw new ArgumentException($"Health v{num3} packet size mismatch: {payload.Length} bytes (expected {num4} for {b2} bags)");
			}
		}
		List<SolenoidTemp> list = new List<SolenoidTemp>();
		for (int i = 0; i < b2; i++)
		{
			float num5 = binaryPayloadReader.ReadSingleBE();
			float num6 = binaryPayloadReader.ReadSingleBE();
			list.Add(new SolenoidTemp(i, Math.Round(num5, 2), Math.Round(num6, 2)));
		}
		float num7 = binaryPayloadReader.ReadSingleBE();
		float num8 = binaryPayloadReader.ReadSingleBE();
		float num9 = binaryPayloadReader.ReadSingleBE();
		float num10 = binaryPayloadReader.ReadSingleBE();
		ushort pump0Rpm = 0;
		ushort pump1Rpm = 0;
		if (num3 >= 2)
		{
			pump0Rpm = binaryPayloadReader.ReadUInt16BE();
			pump1Rpm = binaryPayloadReader.ReadUInt16BE();
		}
		return new HealthTelemetry("balloonHealth", num3, DateTimeOffset.UtcNow.ToUnixTimeSeconds(), deviceTimestampMs, list, Math.Round(num7, 2), Math.Round(num8, 2), Math.Round(num9, 2), Math.Round(num10, 2), pump0Rpm, pump1Rpm);
	}
}
