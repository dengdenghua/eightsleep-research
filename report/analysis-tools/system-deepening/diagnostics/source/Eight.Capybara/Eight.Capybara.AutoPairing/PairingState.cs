using System;
using System.Collections.Generic;
using Microsoft.Extensions.Logging;

namespace Eight.Capybara.AutoPairing;

public record PairingState(string PairingId, Status Status, PairingStep? CurrentStep, int ProgressPercent, DateTimeOffset? StartedAt, DateTimeOffset? LastUpdatedAt, IReadOnlyList<PairingStep> StepsCompleted, IReadOnlyList<PairingStep> StepsRemaining, int EstimatedTimeRemainingSeconds, IReadOnlyList<string> Errors, string? PairedDeviceId = null)
{
	public static readonly IReadOnlyList<PairingStep> AllSteps = new _003C_003Ez__ReadOnlyArray<PairingStep>(new PairingStep[4]
	{
		PairingStep.IdentifyPairingMode,
		PairingStep.ReadNetworkCredentials,
		PairingStep.SendNetworkCredentials,
		PairingStep.ValidateConnectivity
	});

	public static PairingState CreateInitial(string pairingId, ILogger<PairingService> logger)
	{
		logger.LogInformation("[pairing][state] CREATE");
		return new PairingState(pairingId, Status.NotStarted, null, 0, DateTimeOffset.UtcNow, DateTimeOffset.UtcNow, Array.Empty<PairingStep>(), AllSteps, AllSteps.Count * 10, Array.Empty<string>());
	}

	public PairingState WithStatus(Status status, ILogger logger)
	{
		logger.LogInformation("[pairing][state] UPDATE: {Status}", status);
		return Now() with
		{
			Status = status
		};
	}

	public PairingState WithCurrentStep(PairingStep step, ILogger logger)
	{
		logger.LogInformation("[pairing][step] UPDATE: {CurrentStep}", step);
		List<PairingStep> list = new List<PairingStep>(StepsCompleted);
		List<PairingStep> list2 = new List<PairingStep>(StepsRemaining);
		PairingStep? currentStep = CurrentStep;
		if (currentStep.HasValue)
		{
			PairingStep valueOrDefault = currentStep.GetValueOrDefault();
			if (!list.Contains(valueOrDefault))
			{
				list.Add(valueOrDefault);
				list2.Remove(valueOrDefault);
			}
		}
		int progressPercent = (int)Math.Round((double)list.Count / (double)AllSteps.Count * 100.0);
		int estimatedTimeRemainingSeconds = list2.Count * 10;
		return Now() with
		{
			CurrentStep = step,
			ProgressPercent = progressPercent,
			StepsCompleted = list,
			StepsRemaining = list2,
			EstimatedTimeRemainingSeconds = estimatedTimeRemainingSeconds
		};
	}

	public PairingState WithError(string error, ILogger logger)
	{
		logger.LogError("[pairing][error] {Error}", error);
		return Now() with
		{
			Errors = new _003C_003Ez__ReadOnlySingleElementList<string>(error)
		};
	}

	public PairingState WithPairedDeviceId(string deviceId, ILogger logger)
	{
		logger.LogInformation("[pairing][device] PAIRED: {DeviceId}", deviceId);
		return Now() with
		{
			PairedDeviceId = deviceId
		};
	}

	public PairingState WithCompletedStep(PairingStep step, ILogger logger)
	{
		logger.LogInformation("[pairing][step] COMPLETE: {Step}", step);
		List<PairingStep> list = new List<PairingStep>(StepsCompleted);
		if (!list.Contains(step))
		{
			list.Add(step);
		}
		List<PairingStep> list2 = new List<PairingStep>(StepsRemaining);
		list2.Remove(step);
		int progressPercent = (int)Math.Round((double)list.Count / (double)AllSteps.Count * 100.0);
		int estimatedTimeRemainingSeconds = list2.Count * 10;
		return Now() with
		{
			ProgressPercent = progressPercent,
			StepsCompleted = list,
			StepsRemaining = list2,
			EstimatedTimeRemainingSeconds = estimatedTimeRemainingSeconds
		};
	}

	public PairingState MarkAsComplete(ILogger logger)
	{
		logger.LogInformation("[pairing][state] COMPLETE");
		return Complete() with
		{
			Status = Status.Completed,
			CurrentStep = null,
			StepsCompleted = AllSteps,
			StepsRemaining = Array.Empty<PairingStep>()
		};
	}

	public PairingState MarkAsFailed(string error, ILogger logger)
	{
		logger.LogError("[pairing][state] FAILED: {Error}", error);
		return Complete() with
		{
			Status = Status.Failed,
			Errors = new _003C_003Ez__ReadOnlySingleElementList<string>(error)
		};
	}

	private PairingState Now()
	{
		return this with
		{
			LastUpdatedAt = DateTimeOffset.UtcNow
		};
	}

	private PairingState Complete()
	{
		return Now() with
		{
			EstimatedTimeRemainingSeconds = 0,
			ProgressPercent = 100
		};
	}
}
