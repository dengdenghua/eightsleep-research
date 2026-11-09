using System;
using System.IO;
using System.Net.Http;
using System.Security.Cryptography;
using System.Threading;
using System.Threading.Tasks;
using Eight.Audio.Models;
using FFMpegCore;

namespace Eight.Audio.DataSources;

public class TrackDataManager(string storageFolder) : ITrackDataSourceFactory
{
	private readonly DirectoryInfo storageFolder = new DirectoryInfo(storageFolder);

	private readonly DirectoryInfo convertedFolder = new DirectoryInfo(Path.Combine(storageFolder, "converted"));

	public async Task<ITrackDataSource> Create(string fileId, string url, Hash? hash, bool repeatingTrack, CancellationToken cancellationToken)
	{
		(FileInfo, bool) tuple = await RetrieveAndVerifyFile(fileId, url, hash, cancellationToken);
		FileInfo item = tuple.Item1;
		bool item2 = tuple.Item2;
		item = await ConvertFileIfRequired(item, item2);
		if (!repeatingTrack)
		{
			return new PersistentTrackDataSource(item.FullName);
		}
		item.Refresh();
		if (item.Length > 104857600)
		{
			return new PersistentTrackDataSource(item.FullName);
		}
		string tempPath = Path.GetTempFileName();
		try
		{
			using FileStream sourceFile = new FileStream(item.FullName, FileMode.Open);
			using FileStream destinationFile = new FileStream(tempPath, FileMode.OpenOrCreate);
			await sourceFile.CopyToAsync(destinationFile, cancellationToken);
			cancellationToken.ThrowIfCancellationRequested();
		}
		catch (OperationCanceledException)
		{
			File.Delete(tempPath);
			throw;
		}
		return new DisposableTackDataSource(tempPath);
	}

	private async Task<string> CalculateMD5(string filePath, CancellationToken cancellationToken)
	{
		using MD5 md5 = MD5.Create();
		using FileStream stream = File.OpenRead(filePath);
		return Convert.ToHexStringLower(await md5.ComputeHashAsync(stream, cancellationToken));
	}

	private async Task<bool> VerifyFile(string filePath, Hash? hash, CancellationToken cancellationToken)
	{
		if ((object)hash == null || hash.Algorithm != "MD5")
		{
			return true;
		}
		return await CalculateMD5(filePath, cancellationToken) == hash.Value;
	}

	private async Task<(FileInfo, bool)> RetrieveAndVerifyFile(string fileId, string url, Hash? hash, CancellationToken cancellationToken)
	{
		FileInfo fileInfo;
		bool downloaded;
		(fileInfo, downloaded) = await RetrieveFile(fileId, url, cancellationToken);
		if (await VerifyFile(fileInfo.FullName, hash, cancellationToken))
		{
			return (fileInfo, downloaded);
		}
		fileInfo.Delete();
		(fileInfo, downloaded) = await RetrieveFile(fileId, url, cancellationToken);
		if (await VerifyFile(fileInfo.FullName, hash, cancellationToken))
		{
			return (fileInfo, downloaded);
		}
		throw new ArgumentException("Failed to download and verify requested file");
	}

	private async Task<(FileInfo, bool)> RetrieveFile(string fileId, string url, CancellationToken cancellationToken)
	{
		storageFolder.Refresh();
		if (!storageFolder.Exists)
		{
			storageFolder.Create();
		}
		string filePath = Path.Combine(storageFolder.FullName, fileId);
		FileInfo fileInfo = new FileInfo(filePath);
		fileInfo.Refresh();
		bool item = false;
		if (!fileInfo.Exists)
		{
			using HttpClient client = new HttpClient();
			using Stream s = await client.GetStreamAsync(url);
			using FileStream file = new FileStream(filePath, FileMode.OpenOrCreate);
			await s.CopyToAsync(file, cancellationToken);
			fileInfo.Refresh();
			item = true;
		}
		return (fileInfo, item);
	}

	private async Task<FileInfo> ConvertFileIfRequired(FileInfo sourceFile, bool forceRefresh)
	{
		convertedFolder.Refresh();
		if (!convertedFolder.Exists)
		{
			convertedFolder.Create();
		}
		string outputFilePath = Path.Combine(convertedFolder.FullName, sourceFile.Name);
		FileInfo outputFileInfo = new FileInfo(outputFilePath);
		if ((await FFProbe.AnalyseAsync(sourceFile.FullName)).Format.FormatName == "wav")
		{
			return sourceFile;
		}
		if (outputFileInfo.Exists && !forceRefresh)
		{
			return outputFileInfo;
		}
		await FFMpegArguments.FromFileInput(sourceFile.FullName).OutputToFile(outputFilePath, overwrite: true, (FFMpegArgumentOptions options) =>
		{
			options.ForceFormat("wav");
		}).ProcessAsynchronously();
		outputFileInfo.Refresh();
		return outputFileInfo;
	}
}
