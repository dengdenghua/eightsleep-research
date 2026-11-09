using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using System.Text.Json;
using System.Threading;
using System.Threading.Tasks;
using Eight.Firmness.Models;
using Microsoft.Extensions.Logging;

namespace Eight.Firmness.Services.Calibration;

public sealed class CalibrationAnalyzerRunner(CalibrationOptions options, ILogger<CalibrationAnalyzerRunner> logger)
{
	public async Task<CalibrationAnalyzerRunResult> RunAsync(string csvPath, IReadOnlyList<int> bags, CancellationToken cancellation)
	{
		ProcessStartInfo processStartInfo = new ProcessStartInfo
		{
			FileName = options.NodePath,
			RedirectStandardOutput = true,
			RedirectStandardError = true,
			UseShellExecute = false,
			CreateNoWindow = true
		};
		processStartInfo.ArgumentList.Add(options.AnalyzerScriptPath);
		processStartInfo.ArgumentList.Add(csvPath);
		processStartInfo.ArgumentList.Add("--bags");
		processStartInfo.ArgumentList.Add(string.Join(',', bags));
		using Process process = new Process
		{
			StartInfo = processStartInfo
		};
		StringBuilder stdout = new StringBuilder();
		StringBuilder stderr = new StringBuilder();
		process.OutputDataReceived += (object _, DataReceivedEventArgs e) =>
		{
			if (e.Data != null)
			{
				stdout.AppendLine(e.Data);
			}
		};
		process.ErrorDataReceived += (object _, DataReceivedEventArgs e) =>
		{
			if (e.Data != null)
			{
				stderr.AppendLine(e.Data);
			}
		};
		try
		{
			process.Start();
		}
		catch (Exception ex)
		{
			logger.LogError(ex, "[calibration] Failed to start analyzer '{Node} {Script}'", options.NodePath, options.AnalyzerScriptPath);
			return new CalibrationAnalyzerRunResult(CalibrationAnalyzerOutcome.NoFit, null, "Failed to start '" + options.NodePath + "': " + ex.Message);
		}
		process.BeginOutputReadLine();
		process.BeginErrorReadLine();
		using CancellationTokenSource timeoutCts = new CancellationTokenSource(options.AnalyzerTimeout);
		using CancellationTokenSource linkedCts = CancellationTokenSource.CreateLinkedTokenSource(cancellation, timeoutCts.Token);
		try
		{
			await process.WaitForExitAsync(linkedCts.Token);
		}
		catch (OperationCanceledException)
		{
			TryKill(process);
			string text = ((!cancellation.IsCancellationRequested) ? $"timed out after {options.AnalyzerTimeout}" : "cancelled");
			logger.LogError("[calibration] Analyzer {Reason}", text);
			return new CalibrationAnalyzerRunResult(CalibrationAnalyzerOutcome.NoFit, null, "Analyzer " + text);
		}
		string text2 = stderr.ToString();
		if (!string.IsNullOrWhiteSpace(text2))
		{
			logger.LogWarning("[calibration] Analyzer stderr: {Stderr}", text2);
		}
		string text3 = stdout.ToString();
		CalibrationAnalyzerResult calibrationAnalyzerResult = TryParse(text3);
		if (process.ExitCode == 0 && (object)calibrationAnalyzerResult != null)
		{
			return new CalibrationAnalyzerRunResult(CalibrationAnalyzerOutcome.AllPassed, calibrationAnalyzerResult, null);
		}
		if (process.ExitCode == 1 && (object)calibrationAnalyzerResult != null)
		{
			return new CalibrationAnalyzerRunResult(CalibrationAnalyzerOutcome.SomeFailed, calibrationAnalyzerResult, null);
		}
		string text4 = ((!string.IsNullOrWhiteSpace(text2)) ? text2 : text3);
		return new CalibrationAnalyzerRunResult(CalibrationAnalyzerOutcome.NoFit, null, $"Analyzer exited {process.ExitCode} with no usable result: {(string.IsNullOrWhiteSpace(text4) ? "(no output)" : text4)}");
	}

	private static CalibrationAnalyzerResult? TryParse(string stdout)
	{
		if (string.IsNullOrWhiteSpace(stdout))
		{
			return null;
		}
		try
		{
			CalibrationAnalyzerResult calibrationAnalyzerResult = JsonSerializer.Deserialize<CalibrationAnalyzerResult>(stdout);
			return (calibrationAnalyzerResult?.Bags == null) ? null : calibrationAnalyzerResult;
		}
		catch (JsonException)
		{
			return null;
		}
	}

	private static void TryKill(Process process)
	{
		try
		{
			if (!process.HasExited)
			{
				process.Kill(entireProcessTree: true);
			}
		}
		catch
		{
		}
	}
}
