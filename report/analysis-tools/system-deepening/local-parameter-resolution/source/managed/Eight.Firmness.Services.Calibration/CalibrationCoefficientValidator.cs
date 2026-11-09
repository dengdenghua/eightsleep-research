using System;
using System.Collections.Generic;
using Eight.Firmness.Models;

namespace Eight.Firmness.Services.Calibration;

public static class CalibrationCoefficientValidator
{
	public static string? Validate(IReadOnlyList<BagCalibrationCoefficients> coefficients, CalibrationOptions options)
	{
		foreach (BagCalibrationCoefficients coefficient in coefficients)
		{
			if (!float.IsFinite(coefficient.A) || !float.IsFinite(coefficient.B) || !float.IsFinite(coefficient.Ci) || !float.IsFinite(coefficient.Al) || !float.IsFinite(coefficient.Cl))
			{
				return $"Bag {coefficient.BagId}: non-finite coefficient (a {coefficient.A}, b {coefficient.B}, ci {coefficient.Ci}, al {coefficient.Al}, cl {coefficient.Cl})";
			}
			if (coefficient.A < options.MinCoefficientA || coefficient.A > options.MaxCoefficientA)
			{
				return $"Bag {coefficient.BagId}: 'a' coefficient {coefficient.A:F3} out of device bounds [{options.MinCoefficientA}, {options.MaxCoefficientA}]";
			}
			if (coefficient.B < options.MinCoefficientB || coefficient.B > options.MaxCoefficientB)
			{
				return $"Bag {coefficient.BagId}: 'b' coefficient {coefficient.B:F3} out of device bounds [{options.MinCoefficientB}, {options.MaxCoefficientB}]";
			}
			if (coefficient.Al < options.MinCoefficientA || coefficient.Al > options.MaxCoefficientA)
			{
				return $"Bag {coefficient.BagId}: 'al' coefficient {coefficient.Al:F3} out of device bounds [{options.MinCoefficientA}, {options.MaxCoefficientA}]";
			}
			if (Math.Abs(coefficient.Ci) > options.MaxAbsCoefficientCi)
			{
				return $"Bag {coefficient.BagId}: 'ci' coefficient {coefficient.Ci:F3} out of device bounds ±{options.MaxAbsCoefficientCi}";
			}
			if (Math.Abs(coefficient.Cl) > options.MaxAbsCoefficientCi)
			{
				return $"Bag {coefficient.BagId}: 'cl' coefficient {coefficient.Cl:F3} out of device bounds ±{options.MaxAbsCoefficientCi}";
			}
		}
		return null;
	}
}
