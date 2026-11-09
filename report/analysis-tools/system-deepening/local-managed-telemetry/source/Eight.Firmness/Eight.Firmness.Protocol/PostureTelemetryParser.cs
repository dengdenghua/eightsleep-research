using System;
using System.Collections.Generic;
using Eight.Firmness.Models.Telemetry;
using Eight.Lsp.Protocol.BinaryHelpers;

namespace Eight.Firmness.Protocol;

public static class PostureTelemetryParser
{
	public static PostureMemsTelemetry ParseMemsTelemetry(byte[] payload)
	{
		if (payload.Length < 10)
		{
			throw new ArgumentException($"MEMS packet too short: {payload.Length} bytes (expected at least {10})");
		}
		BinaryPayloadReader binaryPayloadReader = new BinaryPayloadReader(payload);
		byte version = binaryPayloadReader.ReadByte();
		ushort frequency = binaryPayloadReader.ReadUInt16BE();
		byte b = binaryPayloadReader.ReadByte();
		byte b2 = binaryPayloadReader.ReadByte();
		byte b3 = binaryPayloadReader.ReadByte();
		uint deviceTimestampMs = binaryPayloadReader.ReadUInt32BE();
		int num = b3 * b * b2 * 4;
		if (binaryPayloadReader.Remaining < num)
		{
			throw new ArgumentException($"MEMS packet data too short: {binaryPayloadReader.Remaining} bytes remaining (expected {num})");
		}
		List<PostureMemsSample> list = new List<PostureMemsSample>(b3);
		for (int i = 0; i < b3; i++)
		{
			int[][] array = new int[b][];
			for (int j = 0; j < b; j++)
			{
				array[j] = new int[b2];
				for (int k = 0; k < b2; k++)
				{
					array[j][k] = (int)binaryPayloadReader.ReadUInt32BE();
				}
			}
			list.Add(new PostureMemsSample(array));
		}
		return new PostureMemsTelemetry(version, frequency, b, b2, deviceTimestampMs, list);
	}
}
