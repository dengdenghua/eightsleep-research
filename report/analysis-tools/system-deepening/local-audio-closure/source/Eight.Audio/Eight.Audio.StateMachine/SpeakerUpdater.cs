using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Eight.Speaker;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.Audio.StateMachine;

public class SpeakerUpdater(ILogger<SpeakerUpdater> logger, IReadOnlyList<MinamiFirmwareConfiguration> minamiConfigurations, IReadOnlyList<MinamiFirmwareConfiguration> fotaConfigurations, ISpeakerFactory speakerFactory) : ISpeakerUpdater
{
	private readonly ILogger<SpeakerUpdater> logger = logger;

	private readonly IReadOnlyList<MinamiFirmwareConfiguration> minamiConfigurations = minamiConfigurations;

	private readonly IReadOnlyList<MinamiFirmwareConfiguration> fotaConfigurations = fotaConfigurations;

	private readonly ISpeakerFactory speakerFactory = speakerFactory;

	public async Task<SpeakerUpdateResult> Update(ISpeaker speaker, CancellationToken cancellationToken)
	{
		SpeakerHardwareInfo hardwareInfo = await speaker.GetHardwareInfo(default);
		if (await speaker.GetAlias(cancellationToken) == "B13")
		{
			MinamiFirmwareConfiguration fotaConfig = fotaConfigurations.FirstOrDefault();
			if ((object)fotaConfig == null)
			{
				logger.LogCritical("Failed to find FOTA firmware config for B13 speaker: {@HardwareInfo}", hardwareInfo);
				return SpeakerUpdateResult.UpToDate;
			}
			if (int.Parse(hardwareInfo.SoftwareVersion) == fotaConfig.ExpectedVersion)
			{
				logger.LogInformation("Firmware is already up to date: {CurrentVersion}", hardwareInfo.SoftwareVersion);
				return SpeakerUpdateResult.UpToDate;
			}
			if (!(await speaker.WriteFirmwareFota(await File.ReadAllBytesAsync(fotaConfig.FirmwarePath, cancellationToken), (uint)fotaConfig.ExpectedVersion, cancellationToken)))
			{
				return SpeakerUpdateResult.Retry;
			}
			return await EvictAndWaitForReboot(speaker, hardwareInfo, cancellationToken);
		}
		MinamiFirmwareConfiguration minamiFirmwareConfiguration = minamiConfigurations.FirstOrDefault((MinamiFirmwareConfiguration x) => x.HardwareVersion == int.Parse(hardwareInfo.HardwareVersion));
		if ((object)minamiFirmwareConfiguration == null)
		{
			logger.LogCritical("Failed to find firmware for hardware version: {@HardwareInfo}", hardwareInfo);
			return SpeakerUpdateResult.UpToDate;
		}
		if (int.Parse(hardwareInfo.SoftwareVersion) == minamiFirmwareConfiguration.ExpectedVersion)
		{
			logger.LogInformation("Firmware is already up to date: {CurrentVersion}", hardwareInfo.SoftwareVersion);
			return SpeakerUpdateResult.UpToDate;
		}
		if (!(await speaker.WriteFirmware(await File.ReadAllBytesAsync(minamiFirmwareConfiguration.FirmwarePath, cancellationToken), cancellationToken)))
		{
			return SpeakerUpdateResult.Retry;
		}
		return await EvictAndWaitForReboot(speaker, hardwareInfo, cancellationToken);
	}

	private async Task<SpeakerUpdateResult> EvictAndWaitForReboot(ISpeaker speaker, SpeakerHardwareInfo hardwareInfo, CancellationToken cancellationToken)
	{
		await speaker.Disconnect(cancellationToken);
		await speakerFactory.Remove(hardwareInfo.MacAddress, Duration.FromSeconds(10L), cancellationToken);
		await Task.Delay(120000, cancellationToken);
		return SpeakerUpdateResult.Flashed;
	}
}
