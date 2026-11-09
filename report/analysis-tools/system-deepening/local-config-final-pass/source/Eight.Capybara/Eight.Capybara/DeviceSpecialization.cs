using System;
using System.IO;
using System.Threading.Tasks;

namespace Eight.Capybara;

public class DeviceSpecialization
{
	private readonly string path;

	private Specialization specialization;

	public Specialization Specialization => specialization;

	public DeviceSpecialization(string path, Specialization specialization)
	{
		this.path = path;
		this.specialization = specialization;
	}

	public async Task Update(Specialization newSpecialization)
	{
		if (specialization != newSpecialization)
		{
			WriteSpecialization(path, newSpecialization);
			await SystemdServiceManager.RestartService("frank.service");
			await SystemdServiceManager.RestartService("dac.service");
			specialization = newSpecialization;
		}
	}

	public async Task<Specialization?> TryUpdate(string? newSpecializationString)
	{
		if (newSpecializationString == null)
		{
			return null;
		}
		Specialization? specialization = TryParseSpecializationFromString(newSpecializationString);
		if (!specialization.HasValue)
		{
			return null;
		}
		await Update(specialization.Value);
		return this.specialization;
	}

	public static DeviceSpecialization FromPath(string basePath)
	{
		string text = Path.Combine(basePath, "specialization");
		return new DeviceSpecialization(text, ReadSpecialization(text));
	}

	private static Specialization ReadSpecialization(string path)
	{
		Specialization? specialization = TryReadSpecialization(path);
		if (specialization.HasValue)
		{
			return specialization.GetValueOrDefault();
		}
		WriteSpecialization(path, Specialization.Pod);
		return Specialization.Pod;
	}

	private static Specialization? TryReadSpecialization(string path)
	{
		if (!File.Exists(path))
		{
			return null;
		}
		return TryParseSpecializationFromString(File.ReadAllText(path).Trim().ToLowerInvariant());
	}

	private static void WriteSpecialization(string path, Specialization specialization)
	{
		string contents = SpecializationToString(specialization);
		File.WriteAllText(path, contents);
	}

	private static Specialization? TryParseSpecializationFromString(string specialization)
	{
		if (!(specialization == "pod"))
		{
			if (specialization == "pillow")
			{
				return Specialization.Pillow;
			}
			return null;
		}
		return Specialization.Pod;
	}

	private static string SpecializationToString(Specialization specialization)
	{
		return specialization switch
		{
			Specialization.Pod => "pod", 
			Specialization.Pillow => "pillow", 
			_ => throw new ArgumentException($"Unknown specialization: {specialization}"), 
		};
	}
}
