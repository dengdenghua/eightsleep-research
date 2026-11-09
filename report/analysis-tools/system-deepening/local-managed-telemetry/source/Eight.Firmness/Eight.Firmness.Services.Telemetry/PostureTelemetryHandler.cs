using System;
using System.Collections.Concurrent;
using System.Text;
using Eight.Core;
using Eight.Firmness.Models.Telemetry;
using Eight.Firmness.Models.Telemetry.Nats;
using Eight.Firmness.Protocol;
using Eight.Lsp.Protocol;
using Eight.Lsp.Subsystems.Services;
using Eight.Nats;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.Firmness.Services.Telemetry;

public sealed class PostureTelemetryHandler(IThrottleLogger<PostureTelemetryHandler> logger, INatsPublisher natsPublisher, IClock clock) : IPacketHandler
{
	private readonly IThrottleLogger<PostureTelemetryHandler> logger = logger;

	private readonly INatsPublisher natsPublisher = natsPublisher;

	private readonly IClock clock = clock;

	private readonly ConcurrentDictionary<string, SecondBuffer<PostureMemsTelemetry, PostureMemsTelemetryData, PostureMemsSideAccumulator>> memsBuffers = new ConcurrentDictionary<string, SecondBuffer<PostureMemsTelemetry, PostureMemsTelemetryData, PostureMemsSideAccumulator>>();

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
			case 92:
			{
				PostureMemsTelemetry postureMemsTelemetry = PostureTelemetryParser.ParseMemsTelemetry(packet.Payload);
				logger.LogThrottled(side + ":postureMems", "[{Side}] Posture MEMS telemetry: {SampleCount} samples, {AdcCount} ADCs", side, postureMemsTelemetry.Samples.Count, postureMemsTelemetry.AdcCount);
				BufferMemsTelemetry(side, postureMemsTelemetry);
				break;
			}
			default:
				logger.LogDebug("[{Side}] Unknown posture event: cmd=0x{Command:X2}, len={PayloadLength}", side, packet.Cmd, packet.Payload.Length);
				break;
			}
		}
		catch (Exception ex)
		{
			logger.LogWarning(ex, "[{Side}] Failed to parse posture event cmd=0x{Command:X2}: {Error}", side, packet.Cmd, ex.Message);
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
				logger.LogDebug("[{Side}] POSTURE DEBUG: {Message}", side, text);
			}
		}
	}

	private void BufferMemsTelemetry(string side, PostureMemsTelemetry telemetry)
	{
		SecondBufferManager.Enqueue(memsBuffers, clock, side, telemetry, (BufferedData<PostureMemsTelemetryData> buffered) =>
		{
			TelemetryEnvelope<PostureMemsTelemetryData> data = new TelemetryEnvelope<PostureMemsTelemetryData>(buffered.Ts, "postureMems", (side == "left") ? buffered.Data : null, (side == "right") ? buffered.Data : null, telemetry.Version, buffered.Frequency);
			natsPublisher.PublishAsync("raw.posture.mems", data);
		});
	}
}
