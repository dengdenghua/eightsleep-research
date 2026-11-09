using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using Eight.Firmness.Models.Telemetry;
using Microsoft.Extensions.Logging;

namespace Eight.Firmness.Services.Calibration;

public sealed class CalibrationCsvWriter : IDisposable
{
	private readonly StreamWriter writer;

	private readonly int bagSensorCount;

	private readonly ILogger? logger;

	private double? expectedNextDeviceMs;

	public long SamplesWritten { get; private set; }

	public long DroppedSampleCount { get; private set; }

	public CalibrationCsvWriter(string path, int bagSensorCount, ILogger? logger = null)
	{
		this.bagSensorCount = bagSensorCount;
		this.logger = logger;
		writer = new StreamWriter(new FileStream(path, FileMode.Create, FileAccess.Write, FileShare.Read));
		WriteHeader();
	}

	private void WriteHeader()
	{
		List<string> list = new List<string> { "Timestamp_UTC", "Sample_Rate_Hz" };
		for (int i = 0; i <= bagSensorCount; i++)
		{
			list.Add($"Pressure_S{i}");
		}
		writer.WriteLine(string.Join(',', list));
	}

	public void WriteSamples(PressureTelemetry telemetry)
	{
		if (telemetry.Sensors.Count != bagSensorCount)
		{
			throw new ArgumentException($"Telemetry has {telemetry.Sensors.Count} bag sensors, writer was sized for {bagSensorCount}", "telemetry");
		}
		double num = ((telemetry.Frequency > 0) ? (1000.0 / (double)(int)telemetry.Frequency) : 0.0);
		DetectGap(telemetry.DeviceTimestampMs, num);
		string item = DateTimeOffset.FromUnixTimeSeconds(telemetry.Timestamp).ToString("O", CultureInfo.InvariantCulture);
		int sampleCount = telemetry.SampleCount;
		for (int i = 0; i < sampleCount; i++)
		{
			List<string> list = new List<string>(2 + bagSensorCount + 1)
			{
				item,
				telemetry.Frequency.ToString(CultureInfo.InvariantCulture)
			};
			foreach (PressureSensorData sensor in telemetry.Sensors)
			{
				list.Add(sensor.PressureKpa[i].ToString(CultureInfo.InvariantCulture));
			}
			list.Add(telemetry.Ambient.PressureKpa[i].ToString(CultureInfo.InvariantCulture));
			writer.WriteLine(string.Join(',', list));
			SamplesWritten++;
		}
		if (num > 0.0)
		{
			expectedNextDeviceMs = (double)telemetry.DeviceTimestampMs + (double)sampleCount * num;
		}
	}

	private void DetectGap(uint actualStartMs, double periodMs)
	{
		double? num = expectedNextDeviceMs;
		if (!num.HasValue)
		{
			return;
		}
		double valueOrDefault = num.GetValueOrDefault();
		if (!(periodMs <= 0.0))
		{
			double num2 = (double)actualStartMs - valueOrDefault;
			if (num2 > periodMs * 1.5)
			{
				long num3 = (long)Math.Round(num2 / periodMs, MidpointRounding.AwayFromZero);
				DroppedSampleCount += num3;
				logger?.LogWarning("[calibration] Telemetry gap detected: ~{Dropped} samples dropped ({DriftMs:F0}ms drift at device clock {ActualMs})", num3, num2, actualStartMs);
			}
		}
	}

	public void Flush()
	{
		writer.Flush();
	}

	public void Dispose()
	{
		writer.Flush();
		writer.Dispose();
	}
}
