using System;
using System.IO;

namespace Eight.Audio.DataSources;

public sealed class DisposableTackDataSource(string path) : ITrackDataSource, IDisposable
{
	private readonly string path = path;

	private bool disposed;

	public FileStream Open()
	{
		ThrowIfDisposed();
		return File.Open(path, FileMode.Open);
	}

	public void Dispose()
	{
		if (!disposed)
		{
			disposed = true;
			File.Delete(path);
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
