using System;
using System.IO;
using System.Linq;
using System.Text.Json;
using System.Text.Json.Serialization;
using Eight.Firmness.Models;
using Eight.Lsp.Subsystems.Models;
using Microsoft.Extensions.Logging;

namespace Eight.Firmness.Services.Calibration;

public sealed class CalibrationRunStore(CalibrationOptions options, ILogger<CalibrationRunStore> logger) : ICalibrationRunStore
{
	private static readonly JsonSerializerOptions SerializerOptions = new JsonSerializerOptions
	{
		WriteIndented = true,
		Converters = { (JsonConverter)new JsonStringEnumConverter() }
	};

	public (string RunId, string Directory) CreateRun(Side side, DateTimeOffset startedAt)
	{
		string text = $"run-{startedAt.UtcDateTime:yyyyMMddTHHmmssfffZ}";
		string text2 = Path.Combine(SideDirectory(side), text);
		Directory.CreateDirectory(text2);
		return (RunId: text, Directory: text2);
	}

	public void SaveRecord(string directory, CalibrationRunRecord record)
	{
		string destFileName = Path.Combine(directory, "run.json");
		string text = Path.Combine(directory, $"run.json.{Guid.NewGuid():N}.tmp");
		string contents = JsonSerializer.Serialize(record, SerializerOptions);
		File.WriteAllText(text, contents);
		File.Move(text, destFileName, overwrite: true);
	}

	public void MarkInterruptedRunsAtStartup()
	{
		if (!Directory.Exists(options.RunDirectory))
		{
			return;
		}
		foreach (string item in Directory.EnumerateFiles(options.RunDirectory, "run.json", SearchOption.AllDirectories))
		{
			try
			{
				CalibrationRunRecord calibrationRunRecord = JsonSerializer.Deserialize<CalibrationRunRecord>(File.ReadAllText(item), SerializerOptions);
				if ((object)calibrationRunRecord != null && calibrationRunRecord.State == CalibrationRunState.Running)
				{
					CalibrationRunRecord record = calibrationRunRecord with
					{
						State = CalibrationRunState.Interrupted,
						FinishedAt = DateTimeOffset.UtcNow
					};
					string directoryName = Path.GetDirectoryName(item);
					if (directoryName != null)
					{
						SaveRecord(directoryName, record);
						logger.LogWarning("[calibration] Run {RunId} for {Side} was still Running at startup — marked Interrupted", calibrationRunRecord.RunId, calibrationRunRecord.Side.ToLowerString());
					}
				}
			}
			catch (Exception exception)
			{
				logger.LogWarning(exception, "[calibration] Failed to check run record {Path} for interruption at startup", item);
			}
		}
	}

	public void PruneOldRuns(Side side)
	{
		string path = SideDirectory(side);
		if (!Directory.Exists(path))
		{
			return;
		}
		foreach (string item in Directory.EnumerateDirectories(path).OrderByDescending((string d) => d, StringComparer.Ordinal).ToList()
			.Skip(Math.Max(options.RunRetentionCount, 0)))
		{
			try
			{
				Directory.Delete(item, recursive: true);
				logger.LogInformation("[calibration] Pruned old run directory {Directory}", item);
			}
			catch (Exception exception)
			{
				logger.LogWarning(exception, "[calibration] Failed to prune old run directory {Directory}", item);
			}
		}
	}

	public CalibrationRunRecord? GetLatestRecord(Side side)
	{
		string path = SideDirectory(side);
		if (!Directory.Exists(path))
		{
			return null;
		}
		string text = Directory.EnumerateDirectories(path).OrderByDescending((string d) => d, StringComparer.Ordinal).FirstOrDefault();
		if (text == null)
		{
			return null;
		}
		string text2 = Path.Combine(text, "run.json");
		if (!File.Exists(text2))
		{
			return null;
		}
		try
		{
			return JsonSerializer.Deserialize<CalibrationRunRecord>(File.ReadAllText(text2), SerializerOptions);
		}
		catch (Exception exception)
		{
			logger.LogWarning(exception, "[calibration] Failed to read latest run record {Path}", text2);
			return null;
		}
	}

	private string SideDirectory(Side side)
	{
		string text = Path.Combine(options.RunDirectory, side.ToLowerString());
		Directory.CreateDirectory(text);
		return text;
	}
}
