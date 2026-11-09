namespace Eight.Capybara.DeviceAPI.Handlers;

public record StartSshResponse(bool Result, int Port, string? Reason);
