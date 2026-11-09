using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Threading;
using Microsoft.Extensions.Primitives;

namespace Microsoft.Extensions.Configuration;

[DebuggerDisplay("{DebuggerToString(),nq}")]
[DebuggerTypeProxy(typeof(ConfigurationRootDebugView))]
public class ConfigurationRoot : IConfigurationRoot, IConfiguration, IDisposable
{
	private sealed class ConfigurationRootDebugView
	{
		private readonly ConfigurationRoot _current;

		[DebuggerBrowsable(DebuggerBrowsableState.RootHidden)]
		public ConfigurationSectionDebugView[] Items => ConfigurationSectionDebugView.FromConfiguration(_current, _current).ToArray();

		public ConfigurationRootDebugView(ConfigurationRoot current)
		{
			_current = current;
		}
	}

	private readonly IList<IConfigurationProvider> _providers;

	private readonly List<IDisposable> _changeTokenRegistrations;

	private ConfigurationReloadToken _changeToken = new ConfigurationReloadToken();

	public IEnumerable<IConfigurationProvider> Providers => _providers;

	public string? this[string key]
	{
		get
		{
			return GetConfiguration(_providers, key);
		}
		set
		{
			SetConfiguration(_providers, key, value);
		}
	}

	public ConfigurationRoot(IList<IConfigurationProvider> providers)
	{
		ArgumentNullException.ThrowIfNull(providers, "providers");
		_providers = providers;
		_changeTokenRegistrations = new List<IDisposable>(providers.Count);
		foreach (IConfigurationProvider provider in providers)
		{
			provider.Load();
			_changeTokenRegistrations.Add(ChangeToken.OnChange(provider.GetReloadToken, RaiseChanged));
		}
	}

	public IEnumerable<IConfigurationSection> GetChildren()
	{
		return this.GetChildrenImplementation(null);
	}

	public IChangeToken GetReloadToken()
	{
		return _changeToken;
	}

	public IConfigurationSection GetSection(string key)
	{
		return new ConfigurationSection(this, key);
	}

	public void Reload()
	{
		foreach (IConfigurationProvider provider in _providers)
		{
			provider.Load();
		}
		RaiseChanged();
	}

	private void RaiseChanged()
	{
		Interlocked.Exchange(ref _changeToken, new ConfigurationReloadToken()).OnReload();
	}

	public void Dispose()
	{
		foreach (IDisposable changeTokenRegistration in _changeTokenRegistrations)
		{
			changeTokenRegistration.Dispose();
		}
		foreach (IConfigurationProvider provider in _providers)
		{
			(provider as IDisposable)?.Dispose();
		}
	}

	internal static string? GetConfiguration(IList<IConfigurationProvider> providers, string key)
	{
		for (int num = providers.Count - 1; num >= 0; num--)
		{
			if (providers[num].TryGet(key, out string value))
			{
				return value;
			}
		}
		return null;
	}

	internal static void SetConfiguration(IList<IConfigurationProvider> providers, string key, string? value)
	{
		if (providers.Count == 0)
		{
			throw new InvalidOperationException(SR.Error_NoSources);
		}
		foreach (IConfigurationProvider provider in providers)
		{
			provider.Set(key, value);
		}
	}

	private string DebuggerToString()
	{
		return $"Sections = {ConfigurationSectionDebugView.FromConfiguration(this, this).Count}";
	}
}
