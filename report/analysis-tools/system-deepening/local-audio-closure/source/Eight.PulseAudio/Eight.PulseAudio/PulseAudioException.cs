using System;

namespace Eight.PulseAudio;

public class PulseAudioException : Exception
{
	public int ErrorCode { get; }

	public PulseAudioException(string message, int errorCode)
		: base(message)
	{
		ErrorCode = errorCode;
	}

	public PulseAudioException(string message, int errorCode, Exception? innerException)
		: base(message, innerException)
	{
		ErrorCode = errorCode;
	}
}
