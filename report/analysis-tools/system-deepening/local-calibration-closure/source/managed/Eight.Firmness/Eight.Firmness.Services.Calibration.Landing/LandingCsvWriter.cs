using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Text;

namespace Eight.Firmness.Services.Calibration.Landing;

public static class LandingCsvWriter
{
	public const string FileName = "landing.csv";

	private const string Header = "bag,rep,fromKpa,targetKpa,baselineKpa,stopKpa,deflateMs,restKpa,restSd,fired,mechanism,steadyBefore,inflateLeaked,startedAt,seedA";

	public static void Write(string path, IReadOnlyList<LandingTrial> trials)
	{
		StringBuilder stringBuilder = new StringBuilder().AppendLine("bag,rep,fromKpa,targetKpa,baselineKpa,stopKpa,deflateMs,restKpa,restSd,fired,mechanism,steadyBefore,inflateLeaked,startedAt,seedA");
		foreach (LandingTrial trial in trials)
		{
			_003C_003Ey__InlineArray15<string> buffer = default;
			buffer[0] = trial.BagId.ToString(CultureInfo.InvariantCulture);
			buffer[1] = trial.Rep.ToString(CultureInfo.InvariantCulture);
			buffer[2] = Num(trial.FromKpa);
			buffer[3] = Num(trial.TargetKpa);
			buffer[4] = Num(trial.BaselineKpa);
			buffer[5] = Num(trial.StopKpa);
			buffer[6] = Num(trial.DeflateMs);
			buffer[7] = Num(trial.RestKpa);
			buffer[8] = Num(trial.RestSd);
			buffer[9] = Bool(trial.Fired);
			buffer[10] = ((trial.Mechanism == LandingMechanism.Deflate) ? "deflate" : "none");
			buffer[11] = Bool(trial.SteadyBefore);
			buffer[12] = Bool(trial.InflateLeaked);
			buffer[13] = trial.StartedAt.ToString("O", CultureInfo.InvariantCulture);
			buffer[14] = Num(trial.SeedA);
			stringBuilder.AppendJoin(',', (ReadOnlySpan<string?>)buffer).AppendLine();
		}
		File.WriteAllText(path, stringBuilder.ToString());
	}

	private static string Num(double? value)
	{
		if (value.HasValue)
		{
			double valueOrDefault = value.GetValueOrDefault();
			if (double.IsFinite(valueOrDefault))
			{
				if (!(Math.Abs(valueOrDefault - Math.Round(valueOrDefault)) < 1E-12))
				{
					return valueOrDefault.ToString("0.00000", CultureInfo.InvariantCulture);
				}
				return valueOrDefault.ToString("0", CultureInfo.InvariantCulture);
			}
		}
		return "";
	}

	private static string Bool(bool value)
	{
		if (!value)
		{
			return "false";
		}
		return "true";
	}
}
