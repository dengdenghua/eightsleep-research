using System.Diagnostics.CodeAnalysis;

namespace Eight.PulseAudio;

internal static class Utils
{
	[DoesNotReturn]
	internal static void ThrowPulseAudioException(string message, int errorCode)
	{
		throw new PulseAudioException(message, errorCode);
	}

	[DoesNotReturn]
	internal unsafe static void ThrowPulseAudioException(pa_context* pointer)
	{
		int errorCode = PulseAudio.pa_context_errno(pointer);
		throw new PulseAudioException("PulseAudio Error: " + GetErrorMessage(errorCode), errorCode);
	}

	internal static string GetErrorMessage(int errorCode)
	{
		if (errorCode != 0)
		{
			return PulseAudio.pa_strerror(errorCode);
		}
		return "No Pulse Error, code issue";
	}
}
