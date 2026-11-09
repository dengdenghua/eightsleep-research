using System;
using System.Buffers.Binary;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using Eight.Firmness.Models.Telemetry.Enhanced;
using PeterO.Cbor;

namespace Eight.Firmness.Protocol;

public static class EnhancedTelemetryParser
{
	private readonly record struct SampleScalars(uint SampleRateHz, uint SensorCount, uint SamplesPerSensor, uint OverflowCount, uint LegacyFirstTimestampMs);

	private sealed class ProblemLog
	{
		private readonly List<string> problems = new List<string>();

		public bool Failed => problems.Count > 0;

		public string Problem => string.Join("; ", problems);

		public void Reject(string problem)
		{
			problems.Add(problem);
		}

		private void Reject(string at, string expectation, CBORObject? element)
		{
			problems.Add($"{at}: expected {expectation}, got {Describe(element)}");
		}

		public uint UInt(CBORObject? element, string at)
		{
			if (element != null && element.Type == CBORType.Integer && element.CanValueFitInInt64())
			{
				long num = element.AsInt64Value();
				if (num >= 0 && num <= uint.MaxValue)
				{
					return (uint)num;
				}
			}
			Reject(at, "an unsigned integer", element);
			return 0u;
		}

		public float Float(CBORObject? element, string at)
		{
			bool flag;
			if (element != null)
			{
				CBORType type = element.Type;
				if ((uint)(type - 7) <= 1u)
				{
					flag = true;
					goto IL_0016;
				}
			}
			flag = false;
			goto IL_0016;
			IL_0016:
			if (flag)
			{
				return element.AsSingle();
			}
			Reject(at, "a number", element);
			return 0f;
		}

		public bool Bool(CBORObject? element, string at)
		{
			if (element != null && element.Type == CBORType.Boolean)
			{
				return element.AsBoolean();
			}
			Reject(at, "a bool", element);
			return false;
		}

		public CBORObject? Array(CBORObject? element, string at)
		{
			if (element != null && element.Type == CBORType.Array)
			{
				return element;
			}
			Reject(at, "an array", element);
			return null;
		}

		public byte[]? Bytes(CBORObject? element, string at)
		{
			if (element != null && element.Type == CBORType.ByteString)
			{
				return element.GetByteString();
			}
			Reject(at, "a byte string", element);
			return null;
		}
	}

	private sealed class PositionalFields(ProblemLog log, CBORObject fields, string where)
	{
		public bool Has<TPosition>(TPosition position) where TPosition : struct, Enum
		{
			return Index(position) < fields.Count;
		}

		public CBORObject? Element<TPosition>(TPosition position) where TPosition : struct, Enum
		{
			int num = Index(position);
			if (num >= fields.Count)
			{
				return null;
			}
			return fields[num];
		}

		public uint UInt<TPosition>(TPosition position, string name) where TPosition : struct, Enum
		{
			return log.UInt(Element(position), At(position, name));
		}

		public float Float<TPosition>(TPosition position, string name) where TPosition : struct, Enum
		{
			return log.Float(Element(position), At(position, name));
		}

		public bool Bool<TPosition>(TPosition position, string name) where TPosition : struct, Enum
		{
			return log.Bool(Element(position), At(position, name));
		}

		public CBORObject? Array<TPosition>(TPosition position, string name) where TPosition : struct, Enum
		{
			return log.Array(Element(position), At(position, name));
		}

		private string At<TPosition>(TPosition position, string name) where TPosition : struct, Enum
		{
			return $"{where}[{Index(position)}] {name}";
		}

		private static int Index<TPosition>(TPosition position) where TPosition : struct, Enum
		{
			return Convert.ToInt32(position, CultureInfo.InvariantCulture);
		}
	}

	private const int EnvelopeElements = 3;

	private const int AxisHeaderBytes = 4;

	private const int SampleTimeBytes = 3;

	private const byte SampleAcquired = 1;

	public static EnhancedTelemetryDecodeResult Parse(byte[] payload)
	{
		CBORObject cBORObject;
		try
		{
			cBORObject = CBORObject.DecodeFromBytes(payload);
		}
		catch (CBORException ex)
		{
			return new EnhancedTelemetryDecodeResult.Malformed("0x5E payload is not CBOR: " + ex.Message);
		}
		if (cBORObject.Type != CBORType.Array || cBORObject.Count < 3)
		{
			return new EnhancedTelemetryDecodeResult.Malformed($"0x5E envelope: expected {3} elements, got {Describe(cBORObject)}");
		}
		ProblemLog problemLog = new ProblemLog();
		uint num = problemLog.UInt(cBORObject[0], "envelope[0] document_type");
		uint schemaVersion = problemLog.UInt(cBORObject[1], "envelope[1] schema_version");
		CBORObject cBORObject2 = problemLog.Array(cBORObject[2], "envelope[2] fields");
		if (problemLog.Failed || cBORObject2 == null)
		{
			return new EnhancedTelemetryDecodeResult.Malformed(problemLog.Problem);
		}
		return num switch
		{
			0u => DecodeControlState(cBORObject2, schemaVersion), 
			1u => DecodePressureSampleAxes(cBORObject2, schemaVersion), 
			2u => DecodeCurrentSampleAxis(cBORObject2, schemaVersion), 
			3u => DecodeSolenoidState(cBORObject2, schemaVersion), 
			_ => new EnhancedTelemetryDecodeResult.UnknownDocument(num, schemaVersion), 
		};
	}

	private static EnhancedTelemetryDecodeResult DecodeControlState(CBORObject fields, uint schemaVersion)
	{
		ProblemLog problemLog = new ProblemLog();
		PositionalFields positionalFields = new PositionalFields(problemLog, fields, "control");
		uint uptimeMs = positionalFields.UInt(TelemetryControlField.UptimeMs, "uptime_ms");
		uint schedulerState = positionalFields.UInt(TelemetryControlField.SchedulerState, "scheduler_state");
		uint selectedBagsMask = positionalFields.UInt(TelemetryControlField.SelectedBagsMask, "selected_bags_mask");
		uint numBagsSteady = positionalFields.UInt(TelemetryControlField.NumBagsSteady, "num_bags_steady");
		uint bagCount = positionalFields.UInt(TelemetryControlField.BagCount, "bag_count");
		uint controlIntervalMs = positionalFields.UInt(TelemetryControlField.ControlIntervalMs, "control_interval_ms");
		bool pumpOn = positionalFields.Bool(TelemetryControlField.PumpOn, "pump_on");
		bool singlePumpMode = positionalFields.Bool(TelemetryControlField.SinglePumpMode, "single_pump_mode");
		uint pumpMaxDutyPercent = positionalFields.UInt(TelemetryControlField.PumpMaxDutyPercent, "pump_max_duty_percent");
		IReadOnlyList<uint> pumpDutyPercent = ReadPumpDuties(problemLog, positionalFields.Array(TelemetryControlField.PumpDutyPercent, "pump_duty_percent"));
		IReadOnlyList<EnhancedBagState> bags = ReadBags(problemLog, positionalFields.Array(TelemetryControlField.Bags, "bags"));
		(int? BagId, float? ErrorKpa) tuple = ReadPumpDriver(problemLog, positionalFields.Array(TelemetryControlField.PumpDriver, "pump_driver"));
		int? item = tuple.BagId;
		float? item2 = tuple.ErrorKpa;
		EnhancedMotionState motion = (positionalFields.Has(TelemetryControlField.Motion) ? ReadMotion(problemLog, positionalFields.Array(TelemetryControlField.Motion, "motion")) : null);
		if (!problemLog.Failed)
		{
			return new EnhancedTelemetryDecodeResult.Decoded(new EnhancedControlState(schemaVersion, uptimeMs, schedulerState, selectedBagsMask, numBagsSteady, bagCount, controlIntervalMs, pumpOn, singlePumpMode, pumpMaxDutyPercent, pumpDutyPercent, bags, item, item2, motion));
		}
		return new EnhancedTelemetryDecodeResult.Malformed(problemLog.Problem);
	}

	private static IReadOnlyList<TEntry> ReadEach<TEntry>(CBORObject? array, Func<CBORObject, int, TEntry?> read) where TEntry : class
	{
		if (array != null)
		{
			List<TEntry> list = new List<TEntry>();
			list.AddRange((from index in Enumerable.Range(0, array.Count)
				select read(array[index], index)).OfType<TEntry>());
			return new _003C_003Ez__ReadOnlyList<TEntry>(list);
		}
		return Array.Empty<TEntry>();
	}

	private static IReadOnlyList<uint> ReadPumpDuties(ProblemLog log, CBORObject? duties)
	{
		if (duties != null)
		{
			List<uint> list = new List<uint>();
			list.AddRange(from pump in Enumerable.Range(0, duties.Count)
				select log.UInt(duties[pump], $"pump_duty_percent[{pump}]"));
			return new _003C_003Ez__ReadOnlyList<uint>(list);
		}
		return Array.Empty<uint>();
	}

	private static IReadOnlyList<EnhancedBagState> ReadBags(ProblemLog log, CBORObject? bags)
	{
		return ReadEach(bags, (CBORObject element, int bagId) => ReadBag(log, element, bagId));
	}

	private static EnhancedBagState? ReadBag(ProblemLog log, CBORObject element, int bagId)
	{
		string text = $"bags[{bagId}]";
		CBORObject cBORObject = log.Array(element, text);
		if (cBORObject == null)
		{
			return null;
		}
		PositionalFields positionalFields = new PositionalFields(log, cBORObject, text);
		return new EnhancedBagState(bagId, positionalFields.Float(TelemetryBagField.SetpointKpa, "setpoint_kpa"), positionalFields.Float(TelemetryBagField.CurrentPressureKpa, "current_pressure_kpa"), positionalFields.UInt(TelemetryBagField.FsmState, "fsm_state"), positionalFields.UInt(TelemetryBagField.SafetyReason, "safety_reason"), positionalFields.UInt(TelemetryBagField.FaultReason, "fault_reason"), positionalFields.Float(TelemetryBagField.DepartureToleranceKpa, "departure_tolerance_kpa"), positionalFields.Float(TelemetryBagField.DeflateRateKpaPerSec, "deflate_rate_kpa_per_sec"), positionalFields.Float(TelemetryBagField.InflateStopTargetKpa, "inflate_stop_target_kpa"), positionalFields.Float(TelemetryBagField.DeflateStopTargetKpa, "deflate_stop_target_kpa"), positionalFields.Has(TelemetryBagField.MotionHeld) ? new bool?(positionalFields.Bool(TelemetryBagField.MotionHeld, "motion_held")) : ((bool?)null));
	}

	private static (int? BagId, float? ErrorKpa) ReadPumpDriver(ProblemLog log, CBORObject? entry)
	{
		if (entry == null)
		{
			return (BagId: null, ErrorKpa: null);
		}
		PositionalFields positionalFields = new PositionalFields(log, entry, "pump_driver");
		bool flag = positionalFields.Bool(TelemetryPumpDriverField.Valid, "valid");
		uint value = positionalFields.UInt(TelemetryPumpDriverField.BagId, "bag_id");
		float value2 = positionalFields.Float(TelemetryPumpDriverField.ErrorKpa, "error_kpa");
		if (!flag)
		{
			return (BagId: null, ErrorKpa: null);
		}
		return (BagId: (int)value, ErrorKpa: value2);
	}

	private static EnhancedMotionState? ReadMotion(ProblemLog log, CBORObject? entry)
	{
		if (entry == null)
		{
			return null;
		}
		PositionalFields positionalFields = new PositionalFields(log, entry, "motion");
		return new EnhancedMotionState(positionalFields.UInt(TelemetryMotionField.State, "state"), positionalFields.Float(TelemetryMotionField.ScoreKpa, "score_kpa"), positionalFields.UInt(TelemetryMotionField.HoldMs, "hold_ms"), positionalFields.UInt(TelemetryMotionField.Holds, "holds"));
	}

	private static EnhancedTelemetryDecodeResult DecodePressureSampleAxes(CBORObject fields, uint schemaVersion)
	{
		ProblemLog log = new ProblemLog();
		PositionalFields positionalFields = new PositionalFields(log, fields, "pressure_samples");
		SampleScalars sampleScalars = ReadSampleScalars(positionalFields);
		IReadOnlyList<SampleAxis> axes = ReadEach(positionalFields.Array(TelemetrySampleField.Axes, "axes"), (CBORObject element, int sensor) => ReadAxis(log, element, $"axes[{sensor}]"));
		if (!log.Failed)
		{
			return new EnhancedTelemetryDecodeResult.Decoded(new PressureSampleAxes(schemaVersion, sampleScalars.SampleRateHz, sampleScalars.SensorCount, sampleScalars.SamplesPerSensor, sampleScalars.OverflowCount, axes, sampleScalars.LegacyFirstTimestampMs));
		}
		return new EnhancedTelemetryDecodeResult.Malformed(log.Problem);
	}

	private static EnhancedTelemetryDecodeResult DecodeCurrentSampleAxis(CBORObject fields, uint schemaVersion)
	{
		ProblemLog problemLog = new ProblemLog();
		PositionalFields positionalFields = new PositionalFields(problemLog, fields, "current_samples");
		SampleScalars sampleScalars = ReadSampleScalars(positionalFields);
		SampleAxis sampleAxis = ReadAxis(problemLog, positionalFields.Element(TelemetrySampleField.Axes), "current_samples axis");
		if (!problemLog.Failed && (object)sampleAxis != null)
		{
			return new EnhancedTelemetryDecodeResult.Decoded(new CurrentSampleAxis(schemaVersion, sampleScalars.SampleRateHz, sampleScalars.SensorCount, sampleScalars.SamplesPerSensor, sampleScalars.OverflowCount, sampleAxis, sampleScalars.LegacyFirstTimestampMs));
		}
		return new EnhancedTelemetryDecodeResult.Malformed(problemLog.Problem);
	}

	private static SampleScalars ReadSampleScalars(PositionalFields samples)
	{
		return new SampleScalars(samples.UInt(TelemetrySampleField.SampleRateHz, "sample_rate_hz"), samples.UInt(TelemetrySampleField.SensorCount, "sensor_count"), samples.UInt(TelemetrySampleField.SamplesPerSensor, "samples_per_sensor"), samples.UInt(TelemetrySampleField.OverflowCount, "overflow_count"), samples.UInt(TelemetrySampleField.LegacyFirstTimestampMs, "legacy_first_timestamp_ms"));
	}

	private static SampleAxis? ReadAxis(ProblemLog log, CBORObject? element, string at)
	{
		byte[] array = log.Bytes(element, at);
		if (array != null)
		{
			return DecodeAxisBlob(log, array, at);
		}
		return null;
	}

	private static SampleAxis? DecodeAxisBlob(ProblemLog log, ReadOnlySpan<byte> blob, string at)
	{
		if (blob.Length < 4 || (blob.Length - 4) % 3 != 0)
		{
			log.Reject($"{at}: {blob.Length} bytes is not a {4}-byte base plus whole {3}-byte samples");
			return null;
		}
		uint num = BinaryPrimitives.ReadUInt32BigEndian(blob);
		int num2 = (blob.Length - 4) / 3;
		SampleTime[] array = new SampleTime[num2];
		for (int i = 0; i < num2; i++)
		{
			ReadOnlySpan<byte> readOnlySpan = blob.Slice(4 + i * 3, 3);
			int num3 = i;
			SampleTime sampleTime;
			if (readOnlySpan[0] != 1)
			{
				sampleTime = SampleTime.Absent;
			}
			else
			{
				sampleTime = new SampleTime(num + BinaryPrimitives.ReadUInt16BigEndian(readOnlySpan.Slice(1, readOnlySpan.Length - 1)));
			}
			array[num3] = sampleTime;
		}
		return new SampleAxis(num, array);
	}

	private static EnhancedTelemetryDecodeResult DecodeSolenoidState(CBORObject fields, uint schemaVersion)
	{
		ProblemLog log = new ProblemLog();
		PositionalFields positionalFields = new PositionalFields(log, fields, "solenoid");
		uint uptimeMs = positionalFields.UInt(TelemetrySolenoidField.UptimeMs, "uptime_ms");
		uint changedMask = positionalFields.UInt(TelemetrySolenoidField.ChangedMask, "changed_mask");
		IReadOnlyList<ValveState> valves = ReadEach(positionalFields.Array(TelemetrySolenoidField.Valves, "valves"), (CBORObject element, int bagId) => ReadValve(log, element, bagId, changedMask));
		if (!log.Failed)
		{
			return new EnhancedTelemetryDecodeResult.Decoded(new SolenoidState(schemaVersion, uptimeMs, changedMask, valves));
		}
		return new EnhancedTelemetryDecodeResult.Malformed(log.Problem);
	}

	private static ValveState? ReadValve(ProblemLog log, CBORObject element, int bagId, uint changedMask)
	{
		string text = $"valves[{bagId}]";
		CBORObject cBORObject = log.Array(element, text);
		if (cBORObject == null)
		{
			return null;
		}
		PositionalFields positionalFields = new PositionalFields(log, cBORObject, text);
		return new ValveState(bagId, (ValveMotion)positionalFields.UInt(TelemetryValveField.InflateState, "inflate_state"), positionalFields.UInt(TelemetryValveField.InflateDutyPercent, "inflate_duty_percent"), (ValveMotion)positionalFields.UInt(TelemetryValveField.DeflateState, "deflate_state"), positionalFields.UInt(TelemetryValveField.DeflateDutyPercent, "deflate_duty_percent"), IsSet(changedMask, bagId * 2), IsSet(changedMask, bagId * 2 + 1));
	}

	private static bool IsSet(uint mask, int bit)
	{
		if (bit < 32)
		{
			return (mask & (uint)(1 << bit)) != 0;
		}
		return false;
	}

	private static string Describe(CBORObject? element)
	{
		if (element == null)
		{
			return "nothing";
		}
		return element.Type switch
		{
			CBORType.ByteString => $"a {element.GetByteString().Length}-byte string", 
			CBORType.Array => $"a {element.Count}-element array", 
			_ => $"{element.Type} {element}", 
		};
	}
}
