using System;
using System.IO;

namespace Eight.Audio.DataSources;

public interface ITrackDataSource : IDisposable
{
	FileStream Open();
}
