using System;
using System.IO;

namespace Eight.Audio.DataSources;

public sealed class PersistentTrackDataSource(string path) : ITrackDataSource, IDisposable
{
	private readonly string path = path;

	private bool disposed;

	public FileStream Open()
	{
		return File.Open(path, FileMode.Open);
	}

	public void Dispose()
	{
		if (!disposed)
		{
			disposed = true;
		}
	}

	private void ThrowIfDisposed()
	{
		if (disposed)
		{
			throw new ObjectDisposedException(GetType().FullName);
		}
	}
}
