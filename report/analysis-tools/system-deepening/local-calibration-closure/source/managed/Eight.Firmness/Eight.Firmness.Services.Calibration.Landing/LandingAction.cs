using System.Collections.Generic;

namespace Eight.Firmness.Services.Calibration.Landing;

public abstract record LandingAction
{
	public sealed record SetSetpoints(IReadOnlyList<float> Kpa) : LandingAction;

	public sealed record SetCompensation(int BagId, float A, float B, float Ci) : LandingAction;
}
