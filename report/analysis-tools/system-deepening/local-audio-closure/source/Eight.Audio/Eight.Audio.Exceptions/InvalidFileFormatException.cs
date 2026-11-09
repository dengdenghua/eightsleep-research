using System;

namespace Eight.Audio.Exceptions;

public class InvalidFileFormatException : Exception
{
	public InvalidFileFormatException(string message)
		: base(message)
	{
	}
}
