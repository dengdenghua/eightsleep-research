using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Eight.Capybara.Config;
using Eight.Firmness.Models;
using Eight.Lsp.Subsystems.Models;

namespace Eight.Firmness.Repositories;

public class FirmnessPresetRepository(IPodConfigurationManager<FirmnessConfiguration> configManager) : IFirmnessPresetRepository
{
	private readonly IPodConfigurationManager<FirmnessConfiguration> configManager = configManager;

	public Task<List<FirmnessPreset>> GetPresetsAsync(Side side)
	{
		FirmnessConfiguration configuration = configManager.Configuration;
		return Task.FromResult(ApplyDefaults((side != Side.Left) ? (configuration?.RightCustomPresets ?? new List<FirmnessPreset>()) : (configuration?.LeftCustomPresets ?? new List<FirmnessPreset>())));
	}

	public Task<List<FirmnessPreset>> UpdatePresetAsync(Side side, FirmnessPreset preset)
	{
		FirmnessConfiguration firmnessConfiguration = configManager.Configuration ?? new FirmnessConfiguration(Enabled: false);
		List<FirmnessPreset> list = ((side != Side.Left) ? (firmnessConfiguration.RightCustomPresets?.ToList() ?? new List<FirmnessPreset>()) : (firmnessConfiguration.LeftCustomPresets?.ToList() ?? new List<FirmnessPreset>()));
		FirmnessPreset firmnessPreset = DefaultFirmnessPresets.All.FirstOrDefault((FirmnessPreset p) => p.Id == preset.Id);
		if ((object)firmnessPreset == null)
		{
			throw new ArgumentException("Preset ID '" + preset.Id + "' does not match any default preset", "preset");
		}
		FirmnessPreset firmnessPreset2 = preset with
		{
			Name = firmnessPreset.Name
		};
		int num = list.FindIndex((FirmnessPreset p) => p.Id == preset.Id);
		if (num >= 0)
		{
			list[num] = firmnessPreset2;
		}
		else
		{
			list.Add(firmnessPreset2);
		}
		FirmnessConfiguration configuration = ((side == Side.Left) ? firmnessConfiguration with
		{
			LeftCustomPresets = list
		} : firmnessConfiguration with
		{
			RightCustomPresets = list
		});
		configManager.UpdateConfiguration(configuration);
		return Task.FromResult(ApplyDefaults(list));
	}

	public Task<List<FirmnessPreset>> ResetPresetsAsync(Side side)
	{
		FirmnessConfiguration firmnessConfiguration = configManager.Configuration ?? new FirmnessConfiguration(Enabled: false);
		FirmnessConfiguration configuration = ((side == Side.Left) ? firmnessConfiguration with
		{
			LeftCustomPresets = new List<FirmnessPreset>()
		} : firmnessConfiguration with
		{
			RightCustomPresets = new List<FirmnessPreset>()
		});
		configManager.UpdateConfiguration(configuration);
		return Task.FromResult(ApplyDefaults(new List<FirmnessPreset>()));
	}

	private static List<FirmnessPreset> ApplyDefaults(List<FirmnessPreset> customPresets)
	{
		Dictionary<string, FirmnessPreset> dictionary = customPresets.ToDictionary((FirmnessPreset p) => p.Id);
		List<FirmnessPreset> list = new List<FirmnessPreset>();
		foreach (FirmnessPreset item in DefaultFirmnessPresets.All)
		{
			if (dictionary.TryGetValue(item.Id, out var value))
			{
				list.Add(value with
				{
					Name = item.Name
				});
			}
			else
			{
				list.Add(item);
			}
		}
		return list;
	}
}
