using System;
using Eight.Lsp.Subsystems.Models;

namespace Eight.Firmness.Services.Calibration;

public interface ICalibrationRunStore
{
	(string RunId, string Directory) CreateRun(Side side, DateTimeOffset startedAt);

	void SaveRecord(string directory, CalibrationRunRecord record);

	void MarkInterruptedRunsAtStartup();

	void PruneOldRuns(Side side);

	CalibrationRunRecord? GetLatestRecord(Side side);
}
