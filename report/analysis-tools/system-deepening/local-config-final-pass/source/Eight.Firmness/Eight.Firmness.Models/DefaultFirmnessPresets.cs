using System.Collections.Generic;

namespace Eight.Firmness.Models;

public static class DefaultFirmnessPresets
{
	public static readonly FirmnessPreset Default = new FirmnessPreset("default", "Neutral", 5, 5, 5, 5, 5);

	public static readonly FirmnessPreset Side = new FirmnessPreset("side", "Side", 3, 5, 4, 5, 5);

	public static readonly FirmnessPreset Stomach = new FirmnessPreset("stomach", "Stomach", 6, 7, 6, 5, 5);

	public static readonly FirmnessPreset Back = new FirmnessPreset("back", "Back", 4, 5, 5, 4, 4);

	public static IReadOnlyList<FirmnessPreset> All { get; } = new FirmnessPreset[4] { Default, Side, Stomach, Back };
}
