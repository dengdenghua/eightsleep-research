namespace Eight.Firmness.Models;

public record BagCalibrationSetting(int BagId, double A, double B, double? Ci = null, double? Al = null, double? Cl = null)
{
	public double ResolvedCi => Ci.GetValueOrDefault();

	public double ResolvedAl => Al ?? A;

	public double ResolvedCl => Cl.GetValueOrDefault();
}
