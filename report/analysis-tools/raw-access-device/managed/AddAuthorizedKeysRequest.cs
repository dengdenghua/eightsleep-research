using System.Collections.Generic;

namespace Eight.Capybara.DeviceAPI.Handlers;

public record AddAuthorizedKeysRequest(IReadOnlyList<string> AuthorizedKeys, string? User = null);
