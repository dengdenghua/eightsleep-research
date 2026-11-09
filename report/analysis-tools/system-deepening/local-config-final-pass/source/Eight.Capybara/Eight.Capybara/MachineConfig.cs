using System;
using System.Linq;
using System.Text.RegularExpressions;
using Microsoft.Extensions.Configuration;

namespace Eight.Capybara;

public static class MachineConfig
{
	private static readonly Regex WatermarkKey = new Regex("^[A-Z][0-9]{2}$", RegexOptions.Compiled);

	public static string ResolveSectionKey(IConfiguration config, string hwRev)
	{
		return (from c in config.GetChildren()
			select c.Key into k
			where WatermarkKey.IsMatch(k) && string.CompareOrdinal(k, hwRev) <= 0
			select k).DefaultIfEmpty("A00").Max(StringComparer.Ordinal);
	}
}
