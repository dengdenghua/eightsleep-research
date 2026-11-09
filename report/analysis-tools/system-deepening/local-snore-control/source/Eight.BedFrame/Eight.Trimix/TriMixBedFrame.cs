using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Eight.Accessory.BedFrame;
using Eight.BedFrame;
using Eight.DBus;
using Eight.DBus.Bluez;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.TriMix;

public class TriMixBedFrame : IAdjustableBase
{
	private readonly Device1 device;

	private readonly ILogger<TriMixBedFrame> logger;

	private TriMixWriter? writer;

	private static readonly Dictionary<int, short> TorsoAngleMap = new Dictionary<int, short> { { 0, 0 } }.Concat(RegressTicks(0, 20, 25.59, 21.39)).Concat(InterpolateTicks(20, 533, 60, 2253)).ToDictionary((KeyValuePair<int, short> k) => k.Key, (KeyValuePair<int, short> v) => v.Value);

	private static readonly Dictionary<int, short> LegAngleMap = new Dictionary<int, short> { { 0, 0 } }.Concat(InterpolateTicks(0, 0, 5, 190)).Concat(InterpolateTicks(5, 190, 10, 350)).Concat(InterpolateTicks(10, 350, 15, 540))
		.Concat(InterpolateTicks(15, 540, 20, 740))
		.Concat(InterpolateTicks(20, 740, 45, 1806))
		.ToDictionary((KeyValuePair<int, short> k) => k.Key, (KeyValuePair<int, short> v) => v.Value);

	public TriMixBedFrame(ILogger<TriMixBedFrame> logger, Device1 device)
	{
		this.logger = logger;
		this.device = device;
	}

	public Task<bool> IsConnected()
	{
		return device.GetConnectedAsync();
	}

	private async Task Write(byte[] payload, CancellationToken cancellationToken)
	{
		await (await GetOrCreateWriter(cancellationToken)).SendCommand(payload, cancellationToken);
	}

	private async Task<byte[]> WriteWithResponse(byte[] payload, byte? expectedReturnPacket, CancellationToken cancellationToken)
	{
		return await (await GetOrCreateWriter(cancellationToken)).SendCommandWithResponse(payload, expectedReturnPacket, cancellationToken);
	}

	private async Task<byte[]> WriteWithResponseAndValidation(byte[] payload, byte? expectedReturnPacket, Duration? notifyTimeout, CancellationToken cancellationToken)
	{
		TriMixWriter writer = await GetOrCreateWriter(cancellationToken);
		try
		{
			return await writer.SendCommandWithResponseAndValidation(payload, expectedReturnPacket, notifyTimeout, cancellationToken);
		}
		catch (InvalidChecksumException)
		{
			return await writer.SendCommandWithResponseAndValidation(payload, expectedReturnPacket, notifyTimeout, cancellationToken);
		}
	}

	private async Task<byte[]> WriteWithResponseAndValidationAndRetry(byte[] payload, byte? expectedReturnPacket, Duration? notifyTimeout, int retries, CancellationToken cancellationToken)
	{
		for (int i = 0; i < retries; i++)
		{
			try
			{
				return await WriteWithResponseAndValidation(payload, expectedReturnPacket, notifyTimeout, cancellationToken);
			}
			catch (TaskCanceledException)
			{
				Console.WriteLine("Failed to execute within timeout");
			}
		}
		throw new TaskCanceledException($"Failed to execute command with reties {retries}");
	}

	private async Task<TriMixWriter> GetOrCreateWriter(CancellationToken cancellationToken)
	{
		if (!(await IsConnected()))
		{
			await Connect(cancellationToken);
		}
		if (writer == null)
		{
			GattCharacteristic1 characteristic = await device.GetTriMixCharacteristic();
			writer = new TriMixWriter(logger, characteristic);
		}
		return writer;
	}

	public async Task Connect(CancellationToken cancellationToken)
	{
		await Utils.DbusRetry((CancellationToken _) => device.Connect(DBusExtensions.LeConnectBudget, cancellationToken), 2, cancellationToken);
	}

	public async Task Disconnect(CancellationToken cancellationToken)
	{
		await Utils.DbusRetry((CancellationToken _) => device.DisconnectAsync(), 3, cancellationToken);
	}

	public async Task GoToFlat(CancellationToken cancellationToken)
	{
		await SetTorsoAngle(100.0, 0.0, cancellationToken);
		await Task.Delay(2000, cancellationToken);
		await SetLegAngle(100.0, 0.0, cancellationToken);
		await Task.Delay(10000, cancellationToken);
	}

	public async Task<byte[]> QuerySystemInfo(CancellationToken cancellationToken)
	{
		byte[] payload = BuildTriMixPayload(new byte[3] { 32, 20, 160 });
		return await WriteWithResponse(payload, (byte)32, cancellationToken);
	}

	public async Task ResetSystemFlags(CancellationToken cancellationToken)
	{
		byte[] payload = BuildTriMixPayload(new byte[3] { 25, 20, 176 });
		logger.LogInformation("Resetting System Flags");
		await Write(payload, cancellationToken);
	}

	public async Task<SystemFlags> QuerySystemFlags(CancellationToken cancellationToken)
	{
		byte[] payload = BuildTriMixPayload(new byte[3] { 25, 20, 160 });
		byte[] array = await WriteWithResponseAndValidationAndRetry(payload, (byte)25, Duration.FromSeconds(0.5), 3, cancellationToken);
		return new SystemFlags(array[8] == 1, (MotorStatus)array[11], (MotorStatus)array[12], (MotorStatus)array[9], (MotorStatus)array[10]);
	}

	public async Task SetLeftTorsoAngle(double feedRate, double angle, CancellationToken cancellationToken)
	{
		if (angle > 60.0 || angle < 0.0)
		{
			throw new ArgumentOutOfRangeException("Head angle must be between 0 and 60 inclusive");
		}
		await SetLeftTorsoTicks(feedRate, TorsoAngleToTicks((int)angle), cancellationToken);
	}

	public async Task SetLeftTorsoTicks(double feedRate, short ticks, CancellationToken cancellationToken)
	{
		if (feedRate > 100.0 || feedRate < 1.0)
		{
			throw new ArgumentOutOfRangeException("Feed rate must be between 30 and 100 inclusive");
		}
		if (ticks < 0 || ticks > 2253)
		{
			throw new ArgumentOutOfRangeException("Torso ticks  must be between 0 and 2253 inclusive");
		}
		byte[] bytes = BitConverter.GetBytes(ticks);
		byte[] payload = BuildTriMixPayload(new byte[6]
		{
			33,
			20,
			Convert.ToByte(feedRate),
			4,
			bytes[0],
			bytes[1]
		});
		logger.LogInformation("Setting Left Torso Ticks: {@Ticks}", new { feedRate, ticks });
		await WriteWithResponse(payload, null, cancellationToken);
	}

	public async Task SetRightTorsoAngle(double feedRate, double angle, CancellationToken cancellationToken)
	{
		if (angle > 60.0 || angle < 0.0)
		{
			throw new ArgumentOutOfRangeException("Head angle must be between 0 and 60 inclusive");
		}
		await SetRightTorsoTicks(feedRate, TorsoAngleToTicks((int)angle), cancellationToken);
	}

	public async Task SetRightTorsoTicks(double feedRate, short ticks, CancellationToken cancellationToken)
	{
		if (feedRate > 100.0 || feedRate < 1.0)
		{
			throw new ArgumentOutOfRangeException("Feed rate must be between 30 and 100 inclusive");
		}
		if (ticks < 0 || ticks > 2253)
		{
			throw new ArgumentOutOfRangeException("Torso ticks  must be between 0 and 2253 inclusive");
		}
		byte[] bytes = BitConverter.GetBytes(ticks);
		byte[] payload = BuildTriMixPayload(new byte[6]
		{
			33,
			20,
			Convert.ToByte(feedRate),
			2,
			bytes[0],
			bytes[1]
		});
		logger.LogInformation("Setting Right Torso Ticks: {@Ticks}", new { feedRate, ticks });
		await WriteWithResponse(payload, null, cancellationToken);
	}

	public async Task SetLeftLegAngle(double feedRate, double angle, CancellationToken cancellationToken)
	{
		if (angle > 45.0 || angle < 0.0)
		{
			throw new ArgumentOutOfRangeException("Foot angle must be between 0 and 45 inclusive");
		}
		await SetLeftLegTicks(feedRate, LegAngleToTicks((int)angle), cancellationToken);
	}

	public async Task SetLeftLegTicks(double feedRate, short ticks, CancellationToken cancellationToken)
	{
		if (feedRate > 100.0 || feedRate < 1.0)
		{
			throw new ArgumentOutOfRangeException("Feed rate must be between 30 and 100 inclusive");
		}
		if (ticks < 0 || ticks > 1806)
		{
			throw new ArgumentOutOfRangeException("Foot ticks  must be between 0 and 2253 inclusive");
		}
		byte[] bytes = BitConverter.GetBytes(ticks);
		byte[] payload = BuildTriMixPayload(new byte[6]
		{
			33,
			20,
			Convert.ToByte(feedRate),
			3,
			bytes[0],
			bytes[1]
		});
		logger.LogInformation("Setting Left Leg Ticks: {@Ticks}", new { feedRate, ticks });
		await WriteWithResponse(payload, null, cancellationToken);
	}

	public async Task SetRightLegAngle(double feedRate, double angle, CancellationToken cancellationToken)
	{
		if (angle > 45.0 || angle < 0.0)
		{
			throw new ArgumentOutOfRangeException("Foot angle must be between 0 and 45 inclusive");
		}
		await SetRightLegTicks(feedRate, LegAngleToTicks((int)angle), cancellationToken);
	}

	public async Task SetRightLegTicks(double feedRate, short ticks, CancellationToken cancellationToken)
	{
		if (feedRate > 100.0 || feedRate < 1.0)
		{
			throw new ArgumentOutOfRangeException("Feed rate must be between 30 and 100 inclusive");
		}
		if (ticks < 0 || ticks > 1806)
		{
			throw new ArgumentOutOfRangeException("Foot ticks  must be between 0 and 2253 inclusive");
		}
		byte[] bytes = BitConverter.GetBytes(ticks);
		byte[] payload = BuildTriMixPayload(new byte[6]
		{
			33,
			20,
			Convert.ToByte(feedRate),
			1,
			bytes[0],
			bytes[1]
		});
		logger.LogInformation("Setting Right Leg Ticks: {@Ticks}", new { feedRate, ticks });
		await WriteWithResponse(payload, null, cancellationToken);
	}

	public async Task SetTorsoAngle(double feedRate, double torsoAngle, CancellationToken cancellationToken)
	{
		if (torsoAngle > 60.0 || torsoAngle < 0.0)
		{
			throw new ArgumentOutOfRangeException("Head angle must be between 0 and 60 inclusive");
		}
		await SetTorsoTicks(feedRate, TorsoAngleToTicks((int)torsoAngle), cancellationToken);
	}

	public async Task SetTorsoTicks(double feedRate, short ticks, CancellationToken cancellationToken)
	{
		if (feedRate > 100.0 || feedRate < 1.0)
		{
			throw new ArgumentOutOfRangeException("Feed rate must be between 20 and 100 inclusive");
		}
		if (ticks < 0 || ticks > 2253)
		{
			throw new ArgumentOutOfRangeException("Torso ticks  must be between 0 and 2253 inclusive");
		}
		byte[] bytes = BitConverter.GetBytes(ticks);
		byte[] payload = BuildTriMixPayload(new byte[6]
		{
			33,
			20,
			Convert.ToByte(feedRate),
			6,
			bytes[0],
			bytes[1]
		});
		logger.LogInformation("Setting Torso Angle: {@Ticks}", new { feedRate, ticks });
		await WriteWithResponse(payload, null, cancellationToken);
	}

	public async Task SetLegAngle(double feedRate, double legAngle, CancellationToken cancellationToken)
	{
		if (legAngle > 45.0 || legAngle < 0.0)
		{
			throw new ArgumentOutOfRangeException("Foot angle must be between 0 and 45 inclusive");
		}
		await SetLegTicks(feedRate, LegAngleToTicks((int)legAngle), cancellationToken);
	}

	public async Task SetLegTicks(double feedRate, short ticks, CancellationToken cancellationToken)
	{
		if (feedRate > 100.0 || feedRate < 1.0)
		{
			throw new ArgumentOutOfRangeException("Feed rate must be between 20 and 100 inclusive");
		}
		if (ticks < 0 || ticks > 1806)
		{
			throw new ArgumentOutOfRangeException("Torso ticks  must be between 0 and 2253 inclusive");
		}
		byte[] bytes = BitConverter.GetBytes(ticks);
		byte[] payload = BuildTriMixPayload(new byte[6]
		{
			33,
			20,
			Convert.ToByte(feedRate),
			5,
			bytes[0],
			bytes[1]
		});
		logger.LogInformation("Setting Leg Angle: {ticks}", new { feedRate, ticks });
		await WriteWithResponse(payload, null, cancellationToken);
	}

	private static IEnumerable<KeyValuePair<int, short>> InterpolateTicks(int startingAngle, short startingTick, int endingAngle, short endingTick)
	{
		return from x in Enumerable.Range(startingAngle + 1, endingAngle - startingAngle)
			select new KeyValuePair<int, short>(x, (short)(startingTick + (x - startingAngle) * (endingTick - startingTick) / (endingAngle - startingAngle)));
	}

	private static IEnumerable<KeyValuePair<int, short>> RegressTicks(int startingAngle, int endingAngle, double slope, double intercept)
	{
		return from x in Enumerable.Range(startingAngle + 1, endingAngle - startingAngle)
			select new KeyValuePair<int, short>(x, (short)((double)x * slope + intercept));
	}

	public static short TorsoAngleToTicks(int angle)
	{
		return TorsoAngleMap[angle];
	}

	public static short LegAngleToTicks(int angle)
	{
		return LegAngleMap[angle];
	}

	private static double TorsoTicksToAngle(double ticks)
	{
		return TicksToAngle(ticks, TorsoAngleMap);
	}

	private static double LegTicksToAngle(double ticks)
	{
		return TicksToAngle(ticks, LegAngleMap);
	}

	private static double TicksToAngle(double ticks, IDictionary<int, short> map)
	{
		return map.Aggregate((KeyValuePair<int, short> x, KeyValuePair<int, short> y) => (!(Math.Abs((double)x.Value - ticks) < Math.Abs((double)y.Value - ticks))) ? y : x).Key;
	}

	public async Task Stop(CancellationToken cancellationToken)
	{
		byte[] payload = new byte[11]
		{
			255, 255, 255, 255, 5, 0, 0, 0, 0, 215,
			0
		};
		logger.LogInformation("Stopping all frame movement");
		await WriteWithResponse(payload, null, cancellationToken);
	}

	public async Task<FrameState> GetBase(CancellationToken cancellationToken)
	{
		byte[] payload = BuildTriMixPayload(new byte[3] { 34, 20, 160 });
		byte[] array = await WriteWithResponseAndValidationAndRetry(payload, (byte)34, Duration.FromSeconds(0.5), 3, cancellationToken);
		byte b = array[17];
		byte b2 = array[8];
		bool moving = ((b >> 4) & 3) > 0;
		bool moving2 = ((b >> 6) & 3) > 0;
		bool moving3 = (b & 3) > 0;
		bool moving4 = ((b >> 2) & 3) > 0;
		bool hallMoving = ((b2 >> 4) & 3) > 0;
		bool hallMoving2 = ((b2 >> 6) & 3) > 0;
		bool hallMoving3 = (b2 & 3) > 0;
		bool hallMoving4 = ((b2 >> 2) & 3) > 0;
		FrameSectionState torso = new FrameSectionState(TorsoTicksToAngle(BitConverter.ToInt16(array[11..13])), BitConverter.ToInt16(array[11..13]), moving4, hallMoving4);
		FrameSectionState leg = new FrameSectionState(LegTicksToAngle(BitConverter.ToInt16(array[9..11])), BitConverter.ToInt16(array[9..11]), moving3, hallMoving3);
		FrameSectionState torso2 = new FrameSectionState(TorsoTicksToAngle(BitConverter.ToInt16(array[15..17])), BitConverter.ToInt16(array[15..17]), moving2, hallMoving2);
		FrameSectionState leg2 = new FrameSectionState(LegTicksToAngle(BitConverter.ToInt16(array[13..15])), BitConverter.ToInt16(array[13..15]), moving, hallMoving);
		return new FrameState(new FrameSideState(torso2, leg2), new FrameSideState(torso, leg));
	}

	public async Task Reboot(CancellationToken cancellationToken)
	{
		byte[] payload = BuildTriMixPayload(new byte[3] { 36, 20, 10 });
		logger.LogInformation("Rebooting Controller");
		await Write(payload, cancellationToken);
		await Task.Delay(60000, cancellationToken);
	}

	public async Task<FrameHardwareInfo> GetHardwareInfo(CancellationToken cancellationToken)
	{
		byte[] array = await QuerySystemInfo(cancellationToken);
		string text = ((array[10] == 0) ? BitConverter.ToInt16(Enumerable.Reverse(array[10..12]).ToArray()) : array[10]).ToString();
		string text2 = ((array[10] == 0) ? BitConverter.ToInt16(Enumerable.Reverse(array[12..14]).ToArray()) : array[11]).ToString();
		string source = "TriMix";
		if (int.TryParse(text2, out var result) && int.TryParse(text, out var result2) && result >= 6 && result2 >= 24 && array[14] == 11)
		{
			source = "Keeston";
		}
		string hardwareVersion = text2;
		string softwareVersion = text;
		return new FrameHardwareInfo("TriMix", hardwareVersion, softwareVersion, await GetMacAddress(cancellationToken), await GetName(cancellationToken), source);
	}

	public async Task WriteHardwareVersion(short hardwareVersion, CancellationToken cancellationToken)
	{
		byte[] bytes = BitConverter.GetBytes(hardwareVersion);
		byte[] payload = BuildTriMixPayload(new byte[4]
		{
			37,
			20,
			bytes[1],
			bytes[0]
		});
		await Write(payload, cancellationToken);
		logger.LogInformation("Writing Hardware Version");
		await Task.Delay(3000, cancellationToken);
	}

	public async Task<string> GetMacAddress(CancellationToken cancellationToken)
	{
		return await device.GetAddressAsync();
	}

	public async Task<short> GetRssi(CancellationToken cancellationToken)
	{
		return await BtMgmt.ReadConnectedRssi(await device.GetAddressAsync(), cancellationToken);
	}

	private async Task<string> GetName(CancellationToken cancellationToken)
	{
		return await device.GetAliasAsync();
	}

	public async Task<bool> WriteFirmware(byte[] firmware, CancellationToken cancellationToken)
	{
		byte[] bytes = BitConverter.GetBytes(firmware.Length);
		byte[] payload = new byte[8] { 255, 255, 255, 255, 1, 0, 48, 14 }.Concat(bytes).ToArray();
		await Write(payload, cancellationToken);
		int pageSize = 128;
		for (int i = 0; i <= firmware.Length / pageSize; i++)
		{
			cancellationToken.ThrowIfCancellationRequested();
			byte[] array = firmware.Skip(pageSize * i).Take(pageSize).ToArray();
			byte[] pagePayload = new byte[8]
			{
				255,
				255,
				255,
				255,
				1,
				0,
				49,
				Convert.ToByte(14 + array.Length)
			}.Concat(BitConverter.GetBytes(i + 1)[0..2]).Concat(BitConverter.GetBytes(array.Length)[0..2]).Concat(array)
				.ToArray();
			try
			{
				await Utils.DbusRetry((CancellationToken c) => Write(pagePayload, c), 3, cancellationToken);
				await Task.Delay(100, cancellationToken);
			}
			catch
			{
				logger.LogError($"Failed to write packet {i}");
				throw;
			}
			if (i % 100 == 0)
			{
				logger.LogInformation($"Check loop: {i}");
				short num = await Utils.DbusRetry(AskForPage, 3, cancellationToken);
				logger.LogInformation($"{num}");
				if (num != i + 1)
				{
					logger.LogError("Expecting the wrong page number: {@Error}", new
					{
						expectedPageNumer = num,
						actionPageNumber = i
					});
					return false;
				}
			}
		}
		byte[] endOTA = new byte[8] { 255, 255, 255, 255, 1, 0, 50, 10 };
		if ((await Utils.DbusRetry((CancellationToken c) => WriteWithResponse(endOTA, null, c), 3, cancellationToken))[6] == 51)
		{
			logger.LogInformation("Updated Firmware, rebooting");
			await Disconnect(cancellationToken);
			await Task.Delay(20000, cancellationToken);
			return true;
		}
		logger.LogInformation("Failed to update firmware");
		return false;
	}

	private async Task<short> AskForPage(CancellationToken cancellationToken)
	{
		byte[] payload = new byte[8] { 255, 255, 255, 255, 1, 0, 53, 10 };
		return BitConverter.ToInt16((await WriteWithResponse(payload, (byte)54, cancellationToken))[8..10]);
	}

	public async Task StopLeftTorso(CancellationToken cancellationToken)
	{
		byte[] payload = BuildTriMixPayload(new byte[4] { 35, 20, 15, 4 });
		logger.LogInformation("Stopping left torso frame movement");
		await WriteWithResponse(payload, null, cancellationToken);
	}

	public async Task StopRightTorso(CancellationToken cancellationToken)
	{
		byte[] payload = BuildTriMixPayload(new byte[4] { 35, 20, 15, 2 });
		logger.LogInformation("Stopping right torso frame movement");
		await WriteWithResponse(payload, null, cancellationToken);
	}

	public async Task StopLeftLeg(CancellationToken cancellationToken)
	{
		byte[] payload = BuildTriMixPayload(new byte[4] { 35, 20, 15, 3 });
		logger.LogInformation("Stopping stop left leg frame movement");
		await WriteWithResponse(payload, null, cancellationToken);
	}

	public async Task StopRightLeg(CancellationToken cancellationToken)
	{
		byte[] payload = BuildTriMixPayload(new byte[4] { 35, 20, 15, 1 });
		logger.LogInformation("Stoppin right leg frame movement");
		await WriteWithResponse(payload, null, cancellationToken);
	}

	public async Task StopTorso(CancellationToken cancellationToken)
	{
		byte[] payload = BuildTriMixPayload(new byte[4] { 35, 20, 15, 6 });
		logger.LogInformation("Stopping torso frame movement");
		await WriteWithResponse(payload, null, cancellationToken);
	}

	public async Task StopLeg(CancellationToken cancellationToken)
	{
		byte[] payload = BuildTriMixPayload(new byte[4] { 35, 20, 15, 5 });
		logger.LogInformation("Stopping leg frame movement");
		await WriteWithResponse(payload, null, cancellationToken);
	}

	private static byte[] BuildTriMixPayload(byte[] specificValues)
	{
		byte[] array = new byte[6] { 255, 255, 255, 255, 1, 0 };
		int count = 18 - array.Length - specificValues.Length;
		return array.Concat(specificValues).Concat(Enumerable.Repeat((byte)0, count)).ToArray();
	}
}
