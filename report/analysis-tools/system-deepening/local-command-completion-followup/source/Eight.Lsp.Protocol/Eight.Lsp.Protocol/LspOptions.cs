using System;

namespace Eight.Lsp.Protocol;

public class LspOptions
{
	public int BootloaderBaudrate { get; set; } = 38400;

	public int FirmwareBaudrate { get; set; } = 115200;

	public int HighSpeedBaudrate { get; set; } = 921600;

	public int MaxBootloaderAttempts { get; set; } = 15;

	public int MaxFirmwareAttempts { get; set; } = 10;

	public TimeSpan StateTimeout { get; set; } = TimeSpan.FromSeconds(10.0);

	public TimeSpan CommandTimeout { get; set; } = TimeSpan.FromMilliseconds(500.0);

	public TimeSpan MonitorPollInterval { get; set; } = TimeSpan.FromSeconds(4.0);

	public int SerialReadTimeoutMs { get; set; } = 1000;

	public int SerialWriteTimeoutMs { get; set; } = 1000;

	public int FirmwareChunkSize { get; set; } = 128;

	public int FirmwareChunkMaxRetries { get; set; } = 3;

	public bool Debug { get; set; }
}
