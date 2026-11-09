namespace Eight.Lsp.Protocol;

public enum ResponseCode : byte
{
	Ack,
	Nak,
	Unsupported,
	BadCrc,
	NoFw,
	BadOffset,
	BadLength,
	FlashError
}
