using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Eight.DBus;
using Microsoft.Extensions.Logging;

namespace Eight.Capybara.DeviceAPI.Handlers;

public class RemoteConnectivityService
{
	private readonly ILogger<RemoteConnectivityService> logger;

	private readonly FileInfo sshKeyFile;

	private readonly FileInfo sshPublicKeyFile;

	private readonly string remoteServer;

	private readonly IPairingMode pairingMode;

	private readonly string? authorizedKeysOverrideRoot;

	private Process? tunnel;

	private int sshPort;

	internal const string TunnelLifetime = "2h";

	internal const int ServerAliveIntervalSeconds = 15;

	internal const int ServerAliveCountMax = 3;

	private const string authorizedPublicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHtkRgwNftlKO1avvNNt33438J2qcOWTGp1PgKAmG8+i eng@eightsleep.com";

	public const string DefaultAuthorizedKeysUser = "rewt";

	private static readonly IReadOnlySet<string> allowedAuthorizedKeysUsers = new HashSet<string>(StringComparer.Ordinal) { "rewt", "root" };

	public FileInfo AuthorizedKeysFile { get; } = new FileInfo("/etc/ssh/authorized_keys");

	public RemoteConnectivityService(ILogger<RemoteConnectivityService> logger, string remoteServer, FileInfo sshKeyFile, IPairingMode pairingMode, string? authorizedKeysOverrideRoot = null)
	{
		this.logger = logger;
		this.remoteServer = remoteServer;
		this.sshKeyFile = sshKeyFile;
		this.pairingMode = pairingMode;
		this.authorizedKeysOverrideRoot = authorizedKeysOverrideRoot;
		sshPublicKeyFile = new FileInfo(sshKeyFile.FullName + ".pub");
	}

	private void CleanArtifacts()
	{
		if (sshKeyFile.Exists)
		{
			sshKeyFile.Delete();
		}
		if (sshPublicKeyFile.Exists)
		{
			sshPublicKeyFile.Delete();
		}
	}

	private static async Task AppendLineAsync(StreamWriter streamWriter, string contents, CancellationToken cancellationToken)
	{
		await streamWriter.WriteLineAsync(contents.AsMemory(), cancellationToken);
	}

	private static async Task ChmodAsync(FileInfo fileInfo, string permissions, CancellationToken cancellationToken)
	{
		Process chmodProc = new Process
		{
			StartInfo = new ProcessStartInfo
			{
				FileName = "chmod",
				Arguments = permissions + " " + fileInfo.FullName
			}
		};
		chmodProc.Start();
		await chmodProc.WaitForExitAsync(cancellationToken);
		if (chmodProc.ExitCode != 0)
		{
			throw new Exception($"chmod failed with exit code {chmodProc.ExitCode}");
		}
	}

	private static async Task WriteFileWithPermissionsAsync(FileInfo fileInfo, string contents, string permissions, CancellationToken cancellationToken)
	{
		await WriteFileWithPermissionsAsync(fileInfo, new _003C_003Ez__ReadOnlySingleElementList<string>(contents), permissions, cancellationToken);
	}

	private static async Task WriteFileWithPermissionsAsync(FileInfo fileInfo, IEnumerable<string> lines, string permissions, CancellationToken cancellationToken)
	{
		using (StreamWriter streamWriter = new StreamWriter(fileInfo.FullName, append: true))
		{
			foreach (string line in lines)
			{
				await AppendLineAsync(streamWriter, line, cancellationToken);
			}
		}
		await ChmodAsync(fileInfo, permissions, cancellationToken);
	}

	public Task AddAuthorizedKeys(IEnumerable<string> authorizedKeys, CancellationToken cancellationToken)
	{
		return AddAuthorizedKeys(authorizedKeys, null, cancellationToken);
	}

	public async Task AddAuthorizedKeys(IEnumerable<string> authorizedKeys, string? user, CancellationToken cancellationToken)
	{
		string resolvedUser = user ?? "rewt";
		if (!allowedAuthorizedKeysUsers.Contains(resolvedUser))
		{
			logger.LogWarning("AddAuthorizedKeys rejected: invalid user='{User}' (allowed: [{Allowed}])", user, string.Join(", ", allowedAuthorizedKeysUsers));
			throw new ArgumentException("user must be one of [" + string.Join(", ", allowedAuthorizedKeysUsers) + "]", "user");
		}
		int incomingCount = authorizedKeys.Count();
		bool onEphemeral = ShouldUseEphemeralPath();
		FileInfo target = ResolveAuthorizedKeysFile(resolvedUser, onEphemeral);
		logger.LogInformation("AddAuthorizedKeys: user={User} target={Path} branch={Branch} incoming={Incoming}", resolvedUser, target.FullName, onEphemeral ? "ephemeral" : "legacy", incomingCount);
		try
		{
			if (onEphemeral)
			{
				EnsureEphemeralAuthorizedKeysDirectories(target, resolvedUser);
			}
			HashSet<string> existing = await ReadExistingKeysAsync(target, cancellationToken);
			List<string> novel = (from k in authorizedKeys
				where !string.IsNullOrWhiteSpace(k)
				select k.TrimEnd(new char[3] { '\r', '\n', ' ' }) into k
				where !existing.Contains(k)
				select k).Distinct(StringComparer.Ordinal).ToList();
			if (novel.Count == 0)
			{
				logger.LogInformation("AddAuthorizedKeys: no novel keys to append (incoming={Incoming} existing={Existing}, all dedup)", incomingCount, existing.Count);
				return;
			}
			string perms = (onEphemeral ? "0600" : "0644");
			await WriteFileWithPermissionsAsync(target, novel, perms, cancellationToken);
			logger.LogInformation("AddAuthorizedKeys: appended {Count} novel key(s) to {Path} (mode {Perms})", novel.Count, target.FullName, perms);
			if (onEphemeral && authorizedKeysOverrideRoot == null && !string.Equals(resolvedUser, "root", StringComparison.Ordinal))
			{
				ChownSync(target.FullName, resolvedUser + ":" + resolvedUser);
			}
		}
		catch (Exception exception)
		{
			logger.LogError(exception, "AddAuthorizedKeys failed for user={User} target={Path} branch={Branch}", resolvedUser, target.FullName, onEphemeral ? "ephemeral" : "legacy");
			throw;
		}
	}

	public async Task PrimeLegacyConnectivity(string key, CancellationToken cancellationToken)
	{
		logger.LogInformation("PrimeLegacyConnectivity: starting (sshKeyFile={Path})", sshKeyFile.FullName);
		sshKeyFile.Refresh();
		CleanArtifacts();
		await AddAuthorizedKeys(new _003C_003Ez__ReadOnlySingleElementList<string>("ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHtkRgwNftlKO1avvNNt33438J2qcOWTGp1PgKAmG8+i eng@eightsleep.com"), "rewt", cancellationToken);
		await AddAuthorizedKeys(new _003C_003Ez__ReadOnlySingleElementList<string>("ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHtkRgwNftlKO1avvNNt33438J2qcOWTGp1PgKAmG8+i eng@eightsleep.com"), "root", cancellationToken);
		try
		{
			await WriteFileWithPermissionsAsync(sshKeyFile, key, "0600", cancellationToken);
			logger.LogInformation("PrimeLegacyConnectivity: wrote session ssh key to {Path}", sshKeyFile.FullName);
		}
		catch (Exception exception)
		{
			logger.LogError(exception, "PrimeLegacyConnectivity: failed to write ssh key to {Path}", sshKeyFile.FullName);
			throw;
		}
	}

	private FileInfo ResolveAuthorizedKeysFile(string user, bool onEphemeral)
	{
		if (authorizedKeysOverrideRoot != null)
		{
			return new FileInfo(Path.Combine(authorizedKeysOverrideRoot, "ssh", user, "authorized_keys"));
		}
		if (onEphemeral)
		{
			return new FileInfo("/ephemeral/ssh/" + user + "/authorized_keys");
		}
		return AuthorizedKeysFile;
	}

	private bool ShouldUseEphemeralPath()
	{
		if (authorizedKeysOverrideRoot != null)
		{
			return true;
		}
		return IsEphemeralMountpoint();
	}

	private bool IsEphemeralMountpoint()
	{
		try
		{
			using StreamReader streamReader = new StreamReader("/proc/self/mountinfo");
			string text;
			while ((text = streamReader.ReadLine()) != null)
			{
				string[] array = text.Split(' ');
				if (array.Length >= 5 && array[4] == "/ephemeral")
				{
					return true;
				}
			}
			return false;
		}
		catch (Exception exception)
		{
			logger.LogWarning(exception, "IsEphemeralMountpoint: failed to read /proc/self/mountinfo, assuming legacy path");
			return false;
		}
	}

	private void EnsureEphemeralAuthorizedKeysDirectories(FileInfo target, string user)
	{
		DirectoryInfo directory = target.Directory;
		if (directory == null)
		{
			logger.LogWarning("EnsureEphemeralAuthorizedKeysDirectories: target {Path} has no parent directory", target.FullName);
			return;
		}
		DirectoryInfo parent = directory.Parent;
		if (parent != null)
		{
			EnsureDirectory(parent.FullName, "0755");
		}
		EnsureDirectory(directory.FullName, "0700");
		if (authorizedKeysOverrideRoot == null && !string.Equals(user, "root", StringComparison.Ordinal))
		{
			ChownSync(directory.FullName, user + ":" + user);
		}
	}

	private void EnsureDirectory(string path, string permissions)
	{
		try
		{
			Directory.CreateDirectory(path);
		}
		catch (Exception exception)
		{
			logger.LogError(exception, "EnsureDirectory: CreateDirectory failed for {Path}", path);
			throw;
		}
		ChmodSync(path, permissions);
	}

	private void ChmodSync(string path, string permissions)
	{
		Process process = new Process
		{
			StartInfo = new ProcessStartInfo
			{
				FileName = "chmod",
				Arguments = permissions + " " + path,
				RedirectStandardError = true,
				RedirectStandardOutput = true,
				UseShellExecute = false
			}
		};
		try
		{
			process.Start();
			process.WaitForExit();
		}
		catch (Exception exception)
		{
			logger.LogError(exception, "ChmodSync: failed to launch chmod {Perms} {Path}", permissions, path);
			throw;
		}
		if (process.ExitCode != 0)
		{
			string text = process.StandardError.ReadToEnd();
			logger.LogError("ChmodSync: chmod {Perms} {Path} exited {Code}: {Stderr}", permissions, path, process.ExitCode, text.Trim());
			throw new Exception($"chmod {permissions} {path} failed with exit code {process.ExitCode}");
		}
	}

	private void ChownSync(string path, string userAndGroup)
	{
		Process process = new Process
		{
			StartInfo = new ProcessStartInfo
			{
				FileName = "chown",
				Arguments = userAndGroup + " " + path,
				RedirectStandardError = true,
				RedirectStandardOutput = true,
				UseShellExecute = false
			}
		};
		try
		{
			process.Start();
			process.WaitForExit();
		}
		catch (Exception exception)
		{
			logger.LogError(exception, "ChownSync: failed to launch chown {Owner} {Path}", userAndGroup, path);
			throw;
		}
		if (process.ExitCode != 0)
		{
			string text = process.StandardError.ReadToEnd();
			logger.LogError("ChownSync: chown {Owner} {Path} exited {Code}: {Stderr}", userAndGroup, path, process.ExitCode, text.Trim());
			throw new Exception($"chown {userAndGroup} {path} failed with exit code {process.ExitCode}");
		}
		logger.LogInformation("ChownSync: chown {Owner} {Path} ok", userAndGroup, path);
	}

	private async Task<HashSet<string>> ReadExistingKeysAsync(FileInfo target, CancellationToken cancellationToken)
	{
		target.Refresh();
		if (!target.Exists)
		{
			return new HashSet<string>(StringComparer.Ordinal);
		}
		try
		{
			return new HashSet<string>(from l in await File.ReadAllLinesAsync(target.FullName, cancellationToken)
				select l.TrimEnd(new char[3] { '\r', '\n', ' ' }) into l
				where l.Length > 0
				select l, StringComparer.Ordinal);
		}
		catch (Exception exception)
		{
			logger.LogError(exception, "ReadExistingKeysAsync: failed to read {Path}", target.FullName);
			throw;
		}
	}

	public StartSshResponse RunRemoteConnectivity(int port, CancellationToken cancellationToken = default(CancellationToken))
	{
		if (!pairingMode.Active)
		{
			logger.LogWarning("Pairing mode is not enabled, cannot start SSH");
			return new StartSshResponse(Result: false, 0, "Pairing mode is not enabled, cannot start SSH");
		}
		logger.LogDebug("Processing an SSH Request");
		if (tunnel != null && !tunnel.HasExited)
		{
			logger.LogInformation("SSH session already running on port {Port}; reusing it", sshPort);
			return new StartSshResponse(Result: true, sshPort, "Leveraging existing SSH session");
		}
		string text = "/usr/bin/timeout";
		string text2 = TunnelArguments(port);
		ProcessStartInfo startInfo = new ProcessStartInfo
		{
			FileName = text,
			Arguments = text2,
			RedirectStandardError = true,
			RedirectStandardOutput = true,
			UseShellExecute = false
		};
		logger.LogInformation(text + " " + text2);
		try
		{
			tunnel = new Process
			{
				StartInfo = startInfo
			};
			tunnel.Start();
			Task.WaitAny(new Task[2]
			{
				tunnel.WaitForExitAsync(cancellationToken),
				Task.Delay(5000, cancellationToken)
			}, cancellationToken);
			if (tunnel.HasExited)
			{
				logger.LogInformation("Failed to initialize SSH connection: {@Result}", new
				{
					message = tunnel.StandardOutput.ReadToEnd(),
					error = tunnel.StandardError.ReadToEnd()
				});
				CleanArtifacts();
				return new StartSshResponse(Result: false, 0, "Failed to initialize SSH connection, check device logs");
			}
			sshPort = port;
			logger.LogInformation("Successfully initialized SSH connection: {@Result}", new
			{
				Host = remoteServer,
				port = port
			});
			return new StartSshResponse(Result: true, port, null);
		}
		catch (Exception exception)
		{
			logger.LogError(exception, "Critical failure in SSH handling");
			CleanArtifacts();
			return new StartSshResponse(Result: false, 0, "Critical failure in SSH handling");
		}
	}

	internal string TunnelArguments(int port)
	{
		return $"{"2h"} /usr/bin/ssh -o StrictHostKeyChecking=no -o ServerAliveInterval={15} -o ServerAliveCountMax={3}" + " -o ExitOnForwardFailure=yes" + $" -i {sshKeyFile.FullName} -R {port}:localhost:8822 -p 8822 -tt ec2-user@{remoteServer}";
	}

	public async Task<string> GetPublicKey(CancellationToken cancellationToken)
	{
		sshKeyFile.Refresh();
		sshPublicKeyFile.Refresh();
		if (sshPublicKeyFile.Exists)
		{
			return await ReadPublicKey(cancellationToken);
		}
		if (!sshKeyFile.Exists)
		{
			await GenerateKeyPair(cancellationToken);
		}
		else
		{
			await RegeneratePublicKey(cancellationToken);
		}
		return await ReadPublicKey(cancellationToken);
	}

	private async Task<string> ReadPublicKey(CancellationToken cancellationToken)
	{
		using StreamReader streamReader = new StreamReader(sshPublicKeyFile.FullName);
		return (await streamReader.ReadLineAsync(cancellationToken)) ?? throw new ArgumentNullException();
	}

	private async Task RegeneratePublicKey(CancellationToken cancellationToken)
	{
		string text = "/usr/bin/ssh-keygen";
		string text2 = "-y -f " + sshKeyFile.FullName;
		this.logger.LogInformation(text + " " + text2);
		using Process keygen = new Process
		{
			StartInfo = new ProcessStartInfo
			{
				FileName = text,
				Arguments = text2,
				RedirectStandardError = true,
				RedirectStandardOutput = true,
				UseShellExecute = false
			}
		};
		keygen.Start();
		string publicKey = await keygen.StandardOutput.ReadToEndAsync(cancellationToken);
		await keygen.WaitForExitAsync(cancellationToken);
		if (keygen.ExitCode != 0)
		{
			ILogger logger = this.logger;
			string text3 = await keygen.StandardError.ReadToEndAsync(cancellationToken);
			logger.LogError("Failed to regenerate public key: {Stderr}", text3.Trim());
			throw new ArgumentException("Failed to regenerate public key");
		}
		await File.WriteAllTextAsync(sshPublicKeyFile.FullName, publicKey, cancellationToken);
	}

	private async Task GenerateKeyPair(CancellationToken cancellationToken)
	{
		string text = "/usr/bin/ssh-keygen";
		string text2 = "-t ed25519 -f " + sshKeyFile.FullName + " -q -N \"\"";
		this.logger.LogInformation(text + " " + text2);
		using Process keygen = new Process
		{
			StartInfo = new ProcessStartInfo
			{
				FileName = text,
				Arguments = text2,
				RedirectStandardError = true,
				RedirectStandardOutput = true,
				UseShellExecute = false
			}
		};
		keygen.Start();
		await keygen.WaitForExitAsync(cancellationToken);
		if (keygen.ExitCode != 0)
		{
			ILogger logger = this.logger;
			string text3 = await keygen.StandardError.ReadToEndAsync(cancellationToken);
			logger.LogError("Failed to generate key pair: {Stderr}", text3.Trim());
			throw new ArgumentException("Failed to generate key pair");
		}
	}
}
