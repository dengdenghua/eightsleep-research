using System;
using System.IO;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Threading;
using Microsoft.Extensions.Logging;
using NodaTime;
using NodaTime.Serialization.SystemTextJson;

namespace Eight.Capybara.Config;

public class PodConifgurationManager<T>(FileInfo configurationPath, T? configuration, ILogger logger) : IPodConfigurationManager<T> where T : class
{
	private readonly FileInfo configurationPath = configurationPath;

	private readonly ILogger logger = logger;

	private readonly SemaphoreSlim saveGate = new SemaphoreSlim(1, 1);

	private string? savedJson = ((configuration == null) ? null : Serialize(configuration));

	public T? Configuration { get; private set; } = configuration;

	private static JsonSerializerOptions SerializerOptions => new JsonSerializerOptions
	{
		Converters = { (JsonConverter)new JsonStringEnumConverter(JsonNamingPolicy.CamelCase) }
	}.ConfigureForNodaTime(DateTimeZoneProviders.Tzdb);

	public T? UpdateConfiguration(T? configuration)
	{
		Configuration = configuration;
		Save();
		return Configuration;
	}

	private void Save()
	{
		saveGate.Wait();
		try
		{
			string text = Serialize(Configuration);
			if (text == savedJson)
			{
				logger.LogDebug("Configuration {Path} unchanged; not rewritten", configurationPath.FullName);
			}
			else
			{
				SaveConfiguration(configurationPath, text);
				savedJson = text;
			}
		}
		finally
		{
			saveGate.Release();
		}
	}

	public static PodConifgurationManager<T2> Create<T2>(FileInfo configurationPath, ILogger logger) where T2 : class
	{
		ArgumentNullException.ThrowIfNull(logger, "logger");
		configurationPath.Refresh();
		return new PodConifgurationManager<T2>(configurationPath, PodConifgurationManager<T2>.ReadConfiguration(configurationPath, logger), logger);
	}

	private static T? ReadConfiguration(FileInfo filePath, ILogger logger)
	{
		filePath.Refresh();
		if (!filePath.Exists)
		{
			return null;
		}
		string text;
		try
		{
			text = ReadText(filePath);
		}
		catch (Exception ex) when ((ex is IOException || ex is UnauthorizedAccessException) ? true : false)
		{
			logger.LogWarning(ex, "Ignoring configuration {Path}: file could not be read; continuing with no saved configuration", filePath.FullName);
			return null;
		}
		if (string.IsNullOrWhiteSpace(text))
		{
			logger.LogWarning("Ignoring configuration {Path}: file is empty; continuing with no saved configuration", filePath.FullName);
			return null;
		}
		try
		{
			return JsonSerializer.Deserialize<T>(text, SerializerOptions);
		}
		catch (JsonException ex2) when (IsWellFormedJson(text))
		{
			logger.LogWarning(ex2, "Ignoring configuration {Path}: file is valid JSON this build cannot map ({MappingError}); leaving it in place and continuing with no saved configuration", filePath.FullName, ex2.Message);
			return null;
		}
		catch (JsonException ex3)
		{
			logger.LogWarning(ex3, "Ignoring configuration {Path}: file is not valid JSON ({ParseError}); continuing with no saved configuration", filePath.FullName, ex3.Message);
			MoveAsideCorruptFile(filePath, logger);
			return null;
		}
	}

	private static string ReadText(FileInfo filePath)
	{
		using StreamReader streamReader = filePath.OpenText();
		return streamReader.ReadToEnd();
	}

	private static bool IsWellFormedJson(string json)
	{
		try
		{
			using (JsonDocument.Parse(json))
			{
				return true;
			}
		}
		catch (JsonException)
		{
			return false;
		}
	}

	private static void MoveAsideCorruptFile(FileInfo filePath, ILogger logger)
	{
		string fullName = filePath.FullName;
		string text = fullName + ".corrupt";
		if (File.Exists(text))
		{
			logger.LogInformation("Keeping the earlier sample {CorruptPath}; leaving unreadable configuration {Path} in place for the next save to replace", text, fullName);
			return;
		}
		try
		{
			File.Move(fullName, text, overwrite: false);
			logger.LogInformation("Moved unreadable configuration {Path} to {CorruptPath}", fullName, text);
		}
		catch (Exception ex) when ((ex is IOException || ex is UnauthorizedAccessException) ? true : false)
		{
			logger.LogWarning(ex, "Could not move unreadable configuration {Path} to {CorruptPath}", fullName, text);
		}
		filePath.Refresh();
	}

	private static string Serialize(T? data)
	{
		return JsonSerializer.Serialize(data, SerializerOptions);
	}

	private static void SaveConfiguration(FileInfo filePath, string json)
	{
		string text = filePath.FullName + ".tmp";
		WriteDurably(text, new UTF8Encoding(encoderShouldEmitUTF8Identifier: true).GetBytes(json));
		File.Move(text, filePath.FullName, overwrite: true);
		filePath.Refresh();
	}

	private static void WriteDurably(string path, byte[] bytes)
	{
		using FileStream fileStream = new FileStream(path, FileMode.Create, FileAccess.Write, FileShare.None);
		fileStream.Write(bytes);
		fileStream.Flush(flushToDisk: true);
	}
}
