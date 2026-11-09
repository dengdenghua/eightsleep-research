using Eight.Firmness.Services;

namespace Eight.Capybara.Firmness;

public sealed class SpecializationFirmnessGate(DeviceSpecialization specialization) : IFirmnessGate
{
	private readonly DeviceSpecialization specialization = specialization;

	public bool IsAllowed => specialization.Specialization != Specialization.Pillow;
}
