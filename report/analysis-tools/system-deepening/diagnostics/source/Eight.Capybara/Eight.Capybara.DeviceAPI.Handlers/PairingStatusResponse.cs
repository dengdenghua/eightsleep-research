using Eight.Capybara.AutoPairing;

namespace Eight.Capybara.DeviceAPI.Handlers;

public record PairingStatusResponse(PairingState? State, string? Message);
