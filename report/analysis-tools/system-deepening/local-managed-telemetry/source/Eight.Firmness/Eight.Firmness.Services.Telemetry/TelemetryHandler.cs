using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Eight.Core;
using Eight.Firmness.Models.Telemetry;
using Eight.Firmness.Models.Telemetry.Enhanced;
using Eight.Firmness.Models.Telemetry.Nats;
using Eight.Firmness.Protocol;
using Eight.Lsp.Protocol;
using Eight.Lsp.Subsystems.Services;
using Eight.Nats;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.Firmness.Services.Telemetry;

public sealed class TelemetryHandler(IThrottleLogger<TelemetryHandler> logger, INatsPublisher natsPublisher, IClock clock) : IPacketHandler
{
	private readonly IThrottleLogger<TelemetryHandler> logger = logger;

	private readonly INatsPublisher natsPublisher = natsPublisher;

	private readonly IClock clock = clock;

	private readonly ConcurrentDictionary<string, SecondBuffer<PressureTelemetry, PressureTelemetryData, PressureSideAccumulator>> pressureBuffers = new ConcurrentDictionary<string, SecondBuffer<PressureTelemetry, PressureTelemetryData, PressureSideAccumulator>>();

	private readonly ConcurrentDictionary<string, SecondBuffer<CurrentTelemetry, CurrentTelemetryData, CurrentSideAccumulator>> currentBuffers = new ConcurrentDictionary<string, SecondBuffer<CurrentTelemetry, CurrentTelemetryData, CurrentSideAccumulator>>();

	public void HandlePacket(Packet packet, ProtocolContext context)
	{
		string side = context.Side;
		try
		{
			switch (packet.Cmd)
			{
			case 7:
				HandleDebugEvent(side, packet.Payload);
				break;
			case 89:
			{
				PressureTelemetry pressureTelemetry = TelemetryParser.ParsePressureTelemetry(packet.Payload);
				logger.LogThrottled(side + ":pressure", "[{Side}] Pressure telemetry: {Data}", side, pressureTelemetry);
				BufferPressureTelemetry(side, pressureTelemetry);
				break;
			}
			case 90:
			{
				ControlStateTelemetry controlStateTelemetry = TelemetryParser.ParseControlTelemetry(packet.Payload);
				logger.LogThrottled(side + ":control", "[{Side}] Control telemetry: {Data}", side, controlStateTelemetry);
				PublishControlTelemetry("raw.balloon.control", side, controlStateTelemetry);
				break;
			}
			case 91:
			{
				CurrentTelemetry currentTelemetry = TelemetryParser.ParseCurrentTelemetry(packet.Payload);
				logger.LogThrottled(side + ":current", "[{Side}] Current telemetry: {Data}", side, currentTelemetry);
				BufferCurrentTelemetry(side, currentTelemetry);
				break;
			}
			case 93:
			{
				HealthTelemetry healthTelemetry = TelemetryParser.ParseHealthTelemetry(packet.Payload);
				logger.LogThrottled(side + ":health", "[{Side}] Health telemetry: {Data}", side, healthTelemetry);
				PublishHealthTelemetry("raw.balloon.health", side, healthTelemetry);
				break;
			}
			case 94:
				HandleEnhancedTelemetry(side, packet.Payload);
				break;
			default:
				logger.LogDebug("[{Side}] Unknown event: cmd=0x{Command:X2}, len={PayloadLength}", side, packet.Cmd, packet.Payload.Length);
				break;
			}
		}
		catch (Exception ex)
		{
			logger.LogWarning(ex, "[{Side}] Failed to parse event cmd=0x{Command:X2}: {Error}", side, packet.Cmd, ex.Message);
		}
	}

	private void HandleDebugEvent(string side, byte[] payload)
	{
		if (payload.Length != 0)
		{
			int num = payload[0];
			if (payload.Length >= num + 1)
			{
				string text = Encoding.ASCII.GetString(payload.AsSpan(1, num));
				logger.LogDebug("[{Side}] DEBUG: {Message}", side, text);
			}
		}
	}

	private void HandleEnhancedTelemetry(string side, byte[] payload)
	{
		EnhancedTelemetryDecodeResult enhancedTelemetryDecodeResult = EnhancedTelemetryParser.Parse(payload);
		if (enhancedTelemetryDecodeResult is EnhancedTelemetryDecodeResult.Decoded decoded)
		{
			decoded.Deconstruct(out EnhancedTelemetryDocument Document);
			if (!(Document is EnhancedControlState enhancedControlState))
			{
				if (!(Document is PressureSampleAxes pressureSampleAxes))
				{
					if (!(Document is CurrentSampleAxis currentSampleAxis))
					{
						if (Document is SolenoidState solenoidState)
						{
							logger.LogThrottled(side + ":solenoid", "[{Side}] Solenoid state: {Data}", side, solenoidState);
							PublishSolenoidState(side, solenoidState);
						}
						else
						{
							logger.ThrottledLogDebug(side + ":enhanced-unpublished", "[{Side}] Decoded 0x5E document {DocumentType} has no publish mapping", side, decoded.Document.DocumentType);
						}
					}
					else
					{
						logger.LogThrottled(side + ":current-axis", "[{Side}] Current sample axis: base {BaseMs}, join key {JoinKey}", side, currentSampleAxis.Axis.BaseMs, currentSampleAxis.LegacyFirstTimestampMs);
						PublishCurrentSampleAxis(side, currentSampleAxis);
					}
				}
				else
				{
					logger.LogThrottled(side + ":pressure-axes", "[{Side}] Pressure sample axes: {SensorCount} sensors, join key {JoinKey}", side, pressureSampleAxes.Axes.Count, pressureSampleAxes.LegacyFirstTimestampMs);
					PublishPressureSampleAxes(side, pressureSampleAxes);
				}
			}
			else
			{
				logger.LogThrottled(side + ":control-enhanced", "[{Side}] Enhanced control telemetry: {Data}", side, enhancedControlState);
				PublishEnhancedControlState(side, enhancedControlState);
			}
		}
		else if (!(enhancedTelemetryDecodeResult is EnhancedTelemetryDecodeResult.UnknownDocument unknownDocument))
		{
			if (enhancedTelemetryDecodeResult is EnhancedTelemetryDecodeResult.Malformed malformed)
			{
				logger.ThrottledLogWarning(side + ":enhanced-malformed", "[{Side}] Malformed 0x5E payload: {Problem}", side, malformed.Problem);
			}
		}
		else
		{
			logger.ThrottledLogDebug(side + ":enhanced-unknown", "[{Side}] Ignoring unknown 0x5E document type {DocumentType} at schema {SchemaVersion}", side, unknownDocument.DocumentType, unknownDocument.SchemaVersion);
		}
	}

	private void PublishEnhancedControlState(string side, EnhancedControlState control)
	{
		uint schemaVersion = control.SchemaVersion;
		uint uptimeMs = control.UptimeMs;
		uint schedulerState = control.SchedulerState;
		uint selectedBagsMask = control.SelectedBagsMask;
		uint numBagsSteady = control.NumBagsSteady;
		uint bagCount = control.BagCount;
		uint controlIntervalMs = control.ControlIntervalMs;
		bool pumpOn = control.PumpOn;
		bool singlePumpMode = control.SinglePumpMode;
		uint pumpMaxDutyPercent = control.PumpMaxDutyPercent;
		IReadOnlyList<uint> pumpDutyPercent = control.PumpDutyPercent;
		List<EnhancedBagStateNatsData> list = new List<EnhancedBagStateNatsData>();
		list.AddRange(control.Bags.Select(ToNatsData));
		_003C_003Ez__ReadOnlyList<EnhancedBagStateNatsData> bags = new _003C_003Ez__ReadOnlyList<EnhancedBagStateNatsData>(list);
		int? pumpDriverBagId = control.PumpDriverBagId;
		float? pumpDriverErrorKpa = control.PumpDriverErrorKpa;
		EnhancedMotionState motion = control.Motion;
		PublishEnhanced("raw.balloon.control.enhanced", "balloonControlStateEnhanced", side, new EnhancedControlStateNatsData(schemaVersion, uptimeMs, schedulerState, selectedBagsMask, numBagsSteady, bagCount, controlIntervalMs, pumpOn, singlePumpMode, pumpMaxDutyPercent, pumpDutyPercent, bags, pumpDriverBagId, pumpDriverErrorKpa, ((object)motion != null) ? new MotionStateNatsData(motion.State, motion.ScoreKpa, motion.HoldMs, motion.Holds) : null));
	}

	private void PublishPressureSampleAxes(string side, PressureSampleAxes axes)
	{
		uint schemaVersion = axes.SchemaVersion;
		uint sampleRateHz = axes.SampleRateHz;
		uint sensorCount = axes.SensorCount;
		uint samplesPerSensor = axes.SamplesPerSensor;
		uint overflowCount = axes.OverflowCount;
		List<SampleAxisNatsData> list = new List<SampleAxisNatsData>();
		list.AddRange(axes.Axes.Select(ToNatsData));
		PublishEnhanced("raw.balloon.samples.pressure", "balloonPressureSampleAxes", side, new PressureSampleAxesNatsData(schemaVersion, sampleRateHz, sensorCount, samplesPerSensor, overflowCount, new _003C_003Ez__ReadOnlyList<SampleAxisNatsData>(list), axes.LegacyFirstTimestampMs));
	}

	private void PublishCurrentSampleAxis(string side, CurrentSampleAxis axis)
	{
		PublishEnhanced("raw.balloon.samples.current", "balloonCurrentSampleAxis", side, new CurrentSampleAxisNatsData(axis.SchemaVersion, axis.SampleRateHz, axis.SensorCount, axis.SamplesPerSensor, axis.OverflowCount, ToNatsData(axis.Axis), axis.LegacyFirstTimestampMs));
	}

	private void PublishSolenoidState(string side, SolenoidState solenoid)
	{
		uint schemaVersion = solenoid.SchemaVersion;
		uint uptimeMs = solenoid.UptimeMs;
		uint changedMask = solenoid.ChangedMask;
		List<ValveStateNatsData> list = new List<ValveStateNatsData>();
		list.AddRange(solenoid.Valves.Select(ToNatsData));
		PublishEnhanced("raw.balloon.solenoid", "balloonSolenoidState", side, new SolenoidStateNatsData(schemaVersion, uptimeMs, changedMask, new _003C_003Ez__ReadOnlyList<ValveStateNatsData>(list)));
	}

	private void PublishEnhanced<TData>(string subject, string type, string side, TData data) where TData : class
	{
		TelemetryEnvelope<TData> data2 = new TelemetryEnvelope<TData>(clock.GetCurrentInstant().ToUnixTimeSeconds(), type, (side == "left") ? data : null, (side == "right") ? data : null, 1);
		natsPublisher.PublishAsync(subject, data2);
	}

	private static EnhancedBagStateNatsData ToNatsData(EnhancedBagState bag)
	{
		return new EnhancedBagStateNatsData(bag.SetpointKpa, bag.CurrentPressureKpa, bag.FsmState, bag.SafetyReason, bag.FaultReason, bag.DepartureToleranceKpa, bag.DeflateRateKpaPerSec, bag.InflateStopTargetKpa, bag.DeflateStopTargetKpa, bag.MotionHeld);
	}

	private static SampleAxisNatsData ToNatsData(SampleAxis axis)
	{
		uint baseMs = axis.BaseMs;
		List<uint?> list = new List<uint?>();
		list.AddRange(axis.Samples.Select((SampleTime sample) => sample.TimestampMs));
		return new SampleAxisNatsData(baseMs, new _003C_003Ez__ReadOnlyList<uint?>(list));
	}

	private static ValveStateNatsData ToNatsData(ValveState valve)
	{
		return new ValveStateNatsData((uint)valve.InflateState, valve.InflateDutyPercent, (uint)valve.DeflateState, valve.DeflateDutyPercent, valve.InflateChanged, valve.DeflateChanged);
	}

	private void BufferPressureTelemetry(string side, PressureTelemetry telemetry)
	{
		SecondBufferManager.Enqueue(pressureBuffers, clock, side, telemetry, (BufferedData<PressureTelemetryData> buffered) =>
		{
			PublishBuffered("raw.balloon.pressure", "balloonPressure", side, buffered);
		});
	}

	private void BufferCurrentTelemetry(string side, CurrentTelemetry telemetry)
	{
		SecondBufferManager.Enqueue(currentBuffers, clock, side, telemetry, (BufferedData<CurrentTelemetryData> buffered) =>
		{
			PublishBuffered("raw.balloon.current", "balloonCurrent", side, buffered);
		});
	}

	private void PublishBuffered<TData>(string subject, string type, string side, BufferedData<TData> buffered) where TData : class
	{
		TelemetryEnvelope<TData> data = new TelemetryEnvelope<TData>(buffered.Ts, type, (side == "left") ? buffered.Data : null, (side == "right") ? buffered.Data : null, 1, buffered.Frequency);
		natsPublisher.PublishAsync(subject, data);
	}

	private void PublishControlTelemetry(string subject, string side, ControlStateTelemetry telemetry)
	{
		ControlStateTelemetryData controlStateTelemetryData = new ControlStateTelemetryData(telemetry.Bags.Select((BagState b) => new BagStateNatsData(b.SetpointKpa, b.CurrentPressureKpa, b.FsmState, b.SafetyReason, b.FaultReason)).ToList());
		TelemetryEnvelope<ControlStateTelemetryData> data = new TelemetryEnvelope<ControlStateTelemetryData>(clock.GetCurrentInstant().ToUnixTimeSeconds(), "balloonControlState", (side == "left") ? controlStateTelemetryData : null, (side == "right") ? controlStateTelemetryData : null);
		natsPublisher.PublishAsync(subject, data);
	}

	private void PublishHealthTelemetry(string subject, string side, HealthTelemetry telemetry)
	{
		HealthTelemetryData healthTelemetryData = new HealthTelemetryData(telemetry.SolenoidTemps.Select((SolenoidTemp s) => new SolenoidTempNatsData(s.InflateTempC, s.DeflateTempC)).ToList(), new List<double> { telemetry.Pump0TempC, telemetry.Pump1TempC }, PumpRpms: new List<ushort> { telemetry.Pump0Rpm, telemetry.Pump1Rpm }, AmbientTempC: telemetry.AmbientTempC, AmbientHumidityPct: telemetry.AmbientHumidityPct);
		TelemetryEnvelope<HealthTelemetryData> data = new TelemetryEnvelope<HealthTelemetryData>(telemetry.Timestamp, telemetry.Type, (side == "left") ? healthTelemetryData : null, (side == "right") ? healthTelemetryData : null, telemetry.Version);
		natsPublisher.PublishAsync(subject, data);
	}
}
