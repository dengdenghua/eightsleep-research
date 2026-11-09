using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.Json;
using System.Threading;
using System.Threading.Tasks;
using Eight.Capybara.Config;
using Eight.Firmness.Models;
using Eight.Firmness.Repositories;
using Eight.Firmness.StateMachine;
using Eight.Firmness.StateMachine.States;
using Eight.Lsp.Subsystems.Models;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using NodaTime;
using NodaTime.Text;

namespace Eight.Firmness.Services;

public sealed class DynamicModeService(ILogger<DynamicModeService> logger, TimeProvider timeProvider, IPodConfigurationManager<FirmnessConfiguration> configManager, IFirmnessProvider provider, IFirmnessPresetRepository repository, BalloonOptions balloonOptions, Func<string, string> pathResolver, IClock clock) : BackgroundService, IDynamicModeProvider
{
	private record SideState(Posture? LastPosture = null, Instant? NonActionableSince = null, bool DefaultApplied = false);

	private record PolarDeviceEntry(string? PodSide, string? CurrentPosture, string? LastHeartbeat);

	private readonly ILogger<DynamicModeService> logger = logger;

	private readonly TimeProvider timeProvider = timeProvider;

	private readonly IPodConfigurationManager<FirmnessConfiguration> configManager = configManager;

	private readonly IFirmnessProvider provider = provider;

	private readonly IFirmnessPresetRepository repository = repository;

	private readonly BalloonOptions balloonOptions = balloonOptions;

	private readonly Func<string, string> pathResolver = pathResolver;

	private readonly IClock clock = clock;

	private static readonly Duration PollInterval = Duration.FromSeconds(5L);

	private static readonly Duration StaleThreshold = Duration.FromMinutes(5L);

	private static readonly Duration NonActionableThreshold = Duration.FromMinutes(5L);

	private static readonly LocalDateTimePattern HeartbeatPattern = LocalDateTimePattern.CreateWithInvariantCulture("yyyy-MM-dd HH:mm:ss");

	private DateTime? lastMtime;

	private SideState leftState = new SideState();

	private SideState rightState = new SideState();

	private string ConfigPath => pathResolver(balloonOptions.DeviceId);

	public bool GetDynamicModeEnabled(Side side)
	{
		FirmnessConfiguration configuration = configManager.Configuration;
		if (side != Side.Left)
		{
			return configuration?.RightDynamicModeEnabled ?? false;
		}
		return configuration?.LeftDynamicModeEnabled ?? false;
	}

	public void UpdateDynamicMode(Side side, bool enabled)
	{
		FirmnessConfiguration configuration = configManager.Configuration;
		if ((object)configuration == null)
		{
			logger.LogWarning("Cannot update dynamic mode for {Side}: configuration is null", side.ToLowerString());
			return;
		}
		FirmnessConfiguration configuration2 = ((side == Side.Left) ? configuration with
		{
			LeftDynamicModeEnabled = enabled
		} : configuration with
		{
			RightDynamicModeEnabled = enabled
		});
		configManager.UpdateConfiguration(configuration2);
		logger.LogDebug("Dynamic mode {Status} for {Side}", enabled ? "enabled" : "disabled", side.ToLowerString());
	}

	protected override async Task ExecuteAsync(CancellationToken stoppingToken)
	{
		logger.LogInformation("Dynamic mode service started, config path: {ConfigPath}", ConfigPath);
		while (!stoppingToken.IsCancellationRequested)
		{
			try
			{
				await CheckAndApplyPosture(stoppingToken);
			}
			catch (OperationCanceledException) when (stoppingToken.IsCancellationRequested)
			{
				break;
			}
			catch (Exception exception)
			{
				logger.LogError(exception, "Error in dynamic mode service");
			}
			await Task.Delay(PollInterval.ToTimeSpan(), timeProvider, stoppingToken);
		}
	}

	private async Task CheckAndApplyPosture(CancellationToken cancellation)
	{
		FirmnessConfiguration configuration = configManager.Configuration;
		if ((object)configuration == null || !configuration.Enabled)
		{
			return;
		}
		bool leftEnabled = configuration.LeftDynamicModeEnabled;
		bool rightEnabled = configuration.RightDynamicModeEnabled;
		if (!leftEnabled && !rightEnabled)
		{
			return;
		}
		List<PolarDeviceEntry> list = await ReadAndParseConfigFile(cancellation);
		if (list == null)
		{
			return;
		}
		foreach (PolarDeviceEntry item in list)
		{
			string text = item.PodSide?.ToLowerInvariant();
			if (text != null && SideExtensions.TryParse(text, out var result) && ((result == Side.Left) ? leftEnabled : rightEnabled))
			{
				await ProcessDevicePosture(result, item);
			}
		}
	}

	private async Task<List<PolarDeviceEntry>?> ReadAndParseConfigFile(CancellationToken cancellation)
	{
		DateTime? dateTime;
		if (!File.Exists(ConfigPath))
		{
			dateTime = lastMtime;
			if (dateTime.HasValue)
			{
				logger.LogWarning("Posture config file no longer exists: {Path}", ConfigPath);
				lastMtime = null;
			}
			return null;
		}
		DateTime lastWriteTimeUtc = File.GetLastWriteTimeUtc(ConfigPath);
		dateTime = lastMtime;
		if (dateTime.HasValue)
		{
			DateTime value = lastWriteTimeUtc;
			dateTime = lastMtime;
			if (value == dateTime)
			{
				return null;
			}
		}
		lastMtime = lastWriteTimeUtc;
		try
		{
			using JsonDocument jsonDocument = JsonDocument.Parse(await File.ReadAllTextAsync(ConfigPath, cancellation));
			JsonElement property = jsonDocument.RootElement.GetProperty("settings").GetProperty("polar_devices");
			List<PolarDeviceEntry> list = new List<PolarDeviceEntry>();
			foreach (JsonElement item in property.EnumerateArray())
			{
				list.Add(new PolarDeviceEntry(item.TryGetProperty("pod_side", out var value2) ? value2.GetString() : null, item.TryGetProperty("current_posture", out var value3) ? value3.GetString() : null, item.TryGetProperty("last_heartbeat", out var value4) ? value4.GetString() : null));
			}
			return list;
		}
		catch (JsonException exception)
		{
			logger.LogError(exception, "Invalid JSON in posture config: {Path}", ConfigPath);
			return null;
		}
		catch (Exception exception2)
		{
			logger.LogError(exception2, "Error reading posture config: {Path}", ConfigPath);
			return null;
		}
	}

	private async Task ProcessDevicePosture(Side side, PolarDeviceEntry device)
	{
		ref SideState reference = ref side == Side.Left ? ref leftState : ref rightState;
		if (IsStale(device.LastHeartbeat, side))
		{
			reference = new SideState();
			await ApplyPresetToSide(side, "default");
			return;
		}
		if (!PostureExtensions.TryParse(device.CurrentPosture, out var posture))
		{
			logger.LogWarning("Unknown posture '{Posture}' for {Side}, applying default", device.CurrentPosture, side.ToLowerString());
			reference = new SideState();
			await ApplyPresetToSide(side, "default");
			return;
		}
		if (posture.IsActionable())
		{
			if (reference.LastPosture != posture)
			{
				string presetId = posture.GetPresetId();
				logger.LogInformation("{Side} posture: {OldPosture} -> {NewPosture} (preset: {PresetId})", side.ToLowerString(), reference.LastPosture?.ToString() ?? "None", posture, presetId);
				reference = new SideState(posture);
				await ApplyPresetToSide(side, presetId);
			}
			return;
		}
		Instant currentInstant = clock.GetCurrentInstant();
		Instant instant = reference.NonActionableSince ?? currentInstant;
		if (!reference.NonActionableSince.HasValue)
		{
			logger.LogDebug("{Side} entered non-actionable posture '{Posture}', holding current firmness", side.ToLowerString(), posture);
			reference = reference with
			{
				NonActionableSince = currentInstant
			};
		}
		else if (!reference.DefaultApplied)
		{
			Duration duration = currentInstant - instant;
			if (duration > NonActionableThreshold)
			{
				logger.LogInformation("{Side} non-actionable for {Elapsed}, applying default preset", side.ToLowerString(), duration);
				reference = reference with
				{
					LastPosture = null,
					DefaultApplied = true
				};
				await ApplyPresetToSide(side, "default");
			}
		}
	}

	private bool IsStale(string? lastHeartbeatStr, Side side)
	{
		if (string.IsNullOrEmpty(lastHeartbeatStr))
		{
			return true;
		}
		ParseResult<LocalDateTime> parseResult = HeartbeatPattern.Parse(lastHeartbeatStr);
		if (!parseResult.Success)
		{
			logger.LogWarning("Failed to parse heartbeat timestamp '{Timestamp}' for {Side}", lastHeartbeatStr, side.ToLowerString());
			return true;
		}
		Instant instant = parseResult.Value.InUtc().ToInstant();
		return clock.GetCurrentInstant() - instant > StaleThreshold;
	}

	private async Task ApplyPresetToSide(Side side, string presetId)
	{
		FirmnessPreset firmnessPreset = (await repository.GetPresetsAsync(side)).FirstOrDefault((FirmnessPreset p) => p.Id.Equals(presetId, StringComparison.OrdinalIgnoreCase));
		if ((object)firmnessPreset == null)
		{
			logger.LogWarning("Preset '{PresetId}' not found for {Side}", presetId, side.ToLowerString());
		}
		else if (!(provider.GetCurrentState(side) is FirmnessReadyState firmnessReadyState))
		{
			logger.LogDebug("Device {Side} is not ready, skipping preset application", side.ToLowerString());
		}
		else
		{
			logger.LogInformation("Applying dynamic mode preset {PresetName} to {Side}", firmnessPreset.Name, side.ToLowerString());
			SetFirmnessRequest request = new SetFirmnessRequest(firmnessPreset.Bag0, firmnessPreset.Bag1, firmnessPreset.Bag2, firmnessPreset.Bag3, firmnessPreset.Bag4);
			firmnessReadyState.MakeRequest(request);
		}
	}
}
