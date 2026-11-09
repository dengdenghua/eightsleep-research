using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Eight.Capybara.DeviceApi;
using Eight.DeviceApiClient;
using Eight.DeviceProtocol;
using Eight.Nats.Monitoring;
using Microsoft.Extensions.Logging;

namespace Eight.Nats.DeviceAPI;

public class DebugNatsController(ILogger<DebugNatsController> logger, INatsMonitoringClient natsMonitoringClient) : RequestController
{
	internal const int DefaultMaxBytes = 131072;

	private static readonly HashSet<string> AllowedEndpoints = new HashSet<string>(StringComparer.OrdinalIgnoreCase) { "healthz", "varz", "jsz", "connz", "subsz", "stacksz" };

	[FunctionHandler("debugnats/get")]
	public async Task<Response> Get([SerializedRequestArg] DebugNatsArgs args)
	{
		string endpoint = args.Endpoint.Trim().ToLowerInvariant();
		if (!AllowedEndpoints.Contains(endpoint))
		{
			return Utils.CreateFailure("Unknown debugnats endpoint '" + args.Endpoint + "'. Allowed: " + string.Join(", ", AllowedEndpoints.Order()), "BadRequest");
		}
		int offset = Math.Max(args.Offset.GetValueOrDefault(), 0);
		int? maxBytes = args.MaxBytes;
		int maxBytes2 = ((maxBytes.HasValue && maxBytes.GetValueOrDefault() > 0) ? args.MaxBytes.Value : 131072);
		string path = ((endpoint == "jsz") ? "jsz?streams=true&consumers=true&config=true" : endpoint);
		string s;
		HttpStatusCode valueOrDefault = default;
		try
		{
			s = await natsMonitoringClient.GetAsync(path, CancellationToken.None);
		}
		catch (HttpRequestException ex) when (((Func<bool>)delegate
		{
			// Could not convert BlockContainer to single expression
			HttpStatusCode? statusCode = ex.StatusCode;
			Unsafe.SkipInit(out int num);
			if (statusCode.HasValue)
			{
				valueOrDefault = statusCode.GetValueOrDefault();
				num = 1;
			}
			else
			{
				num = 0;
			}
			return num != 0;
		}).Invoke())
		{
			return Utils.CreateFailure($"nats-server monitoring returned {(int)valueOrDefault} for /{endpoint}: {ex.Message}", "DeviceCommunication");
		}
		catch (HttpRequestException ex2)
		{
			return Utils.CreateFailure($"Could not reach nats-server monitoring endpoint at {natsMonitoringClient.BaseAddress.TrimEnd('/')}/{endpoint} (monitoring port may not be enabled, or nats-server is down): {ex2.Message}", "OfflineAccessory");
		}
		catch (OperationCanceledException)
		{
			return Utils.CreateFailure("nats-server monitoring request for /" + endpoint + " timed out", "DeviceCommunication");
		}
		byte[] bytes = Encoding.UTF8.GetBytes(s);
		int num2 = bytes.Length;
		int num3 = ((offset < num2) ? Math.Min(maxBytes2, num2 - offset) : 0);
		byte[] array = ((num3 == 0) ? Array.Empty<byte>() : bytes.AsSpan(offset, num3).ToArray());
		bool flag = offset + array.Length < num2;
		string contentGzipB = GzipBase64(array);
		logger.LogInformation("debugnats/get {Endpoint}: totalBytes={TotalBytes} offset={Offset} length={Length} truncated={Truncated}", endpoint, num2, offset, array.Length, flag);
		return Utils.CreateResponse(new DebugNatsResponse(endpoint, num2, offset, array.Length, flag, contentGzipB));
	}

	private static string GzipBase64(byte[] data)
	{
		using MemoryStream memoryStream = new MemoryStream();
		using (GZipStream gZipStream = new GZipStream(memoryStream, CompressionLevel.Optimal, leaveOpen: true))
		{
			gZipStream.Write(data, 0, data.Length);
		}
		return Convert.ToBase64String(memoryStream.ToArray());
	}
}
