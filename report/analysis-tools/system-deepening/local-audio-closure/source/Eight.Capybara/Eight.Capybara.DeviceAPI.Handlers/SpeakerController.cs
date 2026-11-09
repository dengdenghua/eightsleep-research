using System;
using System.Linq;
using System.Threading.Tasks;
using Eight.Audio.Models;
using Eight.Audio.StateMachine;
using Eight.Audio.StateMachine.States;
using Eight.Audio.StateMachine.Tasks;
using Eight.Capybara.DeviceApi;
using Eight.DeviceApiClient;
using Eight.DeviceProtocol;
using Microsoft.Extensions.Logging;
using NodaTime;

namespace Eight.Capybara.DeviceAPI.Handlers;

public class SpeakerController(ILogger<SpeakerController> logger, ISpeakerProvider speakerProvider) : RequestController
{
	private readonly ILogger<SpeakerController> logger = logger;

	private readonly ISpeakerProvider speakerProvider = speakerProvider;

	[FunctionHandler("speaker/get")]
	public Task<Response> GetSpeaker()
	{
		var (response, speaker) = GetPlayer();
		if ((object)response != null)
		{
			return Task.FromResult(response);
		}
		return Task.FromResult(BuildRequestFrameResponse(speaker));
	}

	private Response BuildRequestFrameResponse(ISpeakerState speaker)
	{
		return Utils.CreateResponse(RequestSpeaker.FromeState(speaker));
	}

	private (Response?, ISpeakerState?) GetPlayer()
	{
		ISpeakerState currentSpeakerState = speakerProvider.GetCurrentSpeakerState();
		if (!(currentSpeakerState is NotConnectedSpeaker))
		{
			if (!(currentSpeakerState is InitializingSpeaker))
			{
				if (!(currentSpeakerState is NullSpeaker))
				{
					if (currentSpeakerState is DebugSpeaker)
					{
						return (Utils.CreateFailure("Frame is in debug mode, unable to take any actions", "DebugFrame"), null);
					}
					return (null, currentSpeakerState);
				}
				return (Utils.CreateFailure("No Associated Speaker", "UnknownAccessory"), null);
			}
			return (Utils.CreateFailure("Initializing Speaker", "AccessoryInitialization"), null);
		}
		return (Utils.CreateFailure("Speaker is not connected", "OfflineAccessory"), null);
	}

	[FunctionHandler("speaker/remove")]
	public Task<bool> Remove()
	{
		return Task.FromResult(speakerProvider.TryRemoveCurrentSpeaker());
	}

	[FunctionHandler("speaker/pairfirstfound")]
	public Task<Response> PairFirstFound()
	{
		if (!(speakerProvider.GetCurrentSpeakerState() is NullSpeaker))
		{
			return Utils.CreateFailureResult("We already have a paired speaker", "BadRequest");
		}
		logger.LogInformation("Triggering pair first speaker found");
		speakerProvider.TryStartPairFirstFound();
		return Task.FromResult(Utils.CreateResponse("Triggered pair first speaker found"));
	}

	[FunctionHandler("speaker/setspeaker")]
	public Task<Response> SetSpeaker([SerializedRequestArg] string address)
	{
		if (!(speakerProvider.GetCurrentSpeakerState() is NullSpeaker))
		{
			return Utils.CreateFailureResult("We already have a paired speaker, remove it first", "BadRequest");
		}
		string text = NormalizeMacAddress(address);
		if (text == null)
		{
			return Utils.CreateFailureResult("Invalid MAC address", "BadRequest");
		}
		logger.LogInformation("Setting speaker to {Address}", text);
		speakerProvider.SetCurrentSpeaker(new Address(text));
		return Task.FromResult(Utils.CreateResponse("Set speaker to " + text));
	}

	internal static string? NormalizeMacAddress(string? address)
	{
		if (address == null)
		{
			return null;
		}
		string hex = address.Replace(":", "").Replace("-", "").ToUpperInvariant();
		if (hex.Length != 12 || !hex.All(Uri.IsHexDigit))
		{
			return null;
		}
		return string.Join(':', from i in Enumerable.Range(0, 6)
			select hex.Substring(i * 2, 2));
	}

	[FunctionHandler("speaker/pause")]
	public Task<Response> Pause()
	{
		var (response, speakerState) = GetPlayer();
		if ((object)response != null)
		{
			return Task.FromResult(response);
		}
		if (speakerState is ReadyState readyState)
		{
			readyState.MakeRequest(new PauseRequest());
			return Task.FromResult(BuildRequestFrameResponse(speakerProvider.GetCurrentSpeakerState()));
		}
		throw new ClassifiedException("BadRequest", "Speaker must be playing to pause");
	}

	[FunctionHandler("speaker/resume")]
	public Task<Response> Resume()
	{
		var (response, speakerState) = GetPlayer();
		if ((object)response != null)
		{
			return Task.FromResult(response);
		}
		if (speakerState is ReadyState readyState)
		{
			readyState.MakeRequest(new ResumeRequest());
			return Task.FromResult(BuildRequestFrameResponse(speakerProvider.GetCurrentSpeakerState()));
		}
		throw new ClassifiedException("BadRequest", "Speaker must be playing to pause");
	}

	[FunctionHandler("speaker/play")]
	public async Task<Response> Play([SerializedRequestArg] PlayRequestArgs args)
	{
		var (response, speaker) = GetPlayer();
		if ((object)response != null)
		{
			return response;
		}
		if (speaker is ReadyState readyState)
		{
			TrackRequest trackRequest;
			switch (args.StopCriteria)
			{
			case StopCriteria.Duration:
				if (!(args.RepeatFor > Duration.FromSeconds(0L)))
				{
					throw new ClassifiedException("BadRequest", "Must pass in a postive duration if playing for a duration");
				}
				trackRequest = new RepeatForTrackRequest(args.FileId, "Name", args.Uri, args.Hash, args.Volume, args.StartPaused == true, args.RepeatFor.Value, args.StartLoopPosition, args.EndLoopPosition);
				break;
			case StopCriteria.UntilTrackEnd:
				trackRequest = new SingleTrackRequest(args.FileId, "Name", args.Uri, args.Hash, args.Volume, args.StartPaused == true);
				break;
			default:
				trackRequest = new RepeatingTrackRequest(args.FileId, "Name", args.Uri, args.Hash, args.Volume, args.StartPaused == true, args.StartLoopPosition, args.EndLoopPosition);
				break;
			}
			TrackRequest trackRequest2 = trackRequest;
			PlayRequest playRequest = new PlayRequest(args.StopCriteria, args.PlaybackSource ?? new PlaybackSource("unknown"), args.Volume ?? readyState.State.Volume, args.StartPaused == true, trackRequest2, args.PreviewRequest, args.PlayModifications ?? Array.Empty<PlayModification>());
			readyState.MakeRequest(new PlayTrackRequest(playRequest));
			await Task.Delay(50);
			return BuildRequestFrameResponse(speaker);
		}
		throw new ClassifiedException("BadRequest", "Speaker must be in ready state to play");
	}

	[FunctionHandler("speaker/setvolume")]
	public Task<Response> SetVolume([SerializedRequestArg] SetVolumeRequestArgs args)
	{
		var (response, speakerState) = GetPlayer();
		if ((object)response != null)
		{
			return Task.FromResult(response);
		}
		Console.WriteLine($"Set Volume: {args}");
		if (speakerState is ReadyState readyState)
		{
			readyState.MakeRequest(new VolumeRequest(args.Volume));
			return Task.FromResult(BuildRequestFrameResponse(speakerProvider.GetCurrentSpeakerState()));
		}
		throw new ClassifiedException("BadRequest", "Speaker must be playing to pause");
	}

	[FunctionHandler("speaker/seek")]
	public Task<Response> Seek([SerializedRequestArg] SeekRequestArgs args)
	{
		var (response, speakerState) = GetPlayer();
		if ((object)response != null)
		{
			return Task.FromResult(response);
		}
		if (speakerState is ReadyState readyState)
		{
			ReadyState readyState2 = readyState;
			Duration position = args.Position;
			readyState2.MakeRequest(new SeekRequest(position, args.Mode switch
			{
				SeekMode.Relative => Eight.Audio.Models.SeekMode.Relative, 
				SeekMode.Absolute => Eight.Audio.Models.SeekMode.Absolute, 
				_ => throw new ArgumentException("Unmapped type"), 
			}));
			return Task.FromResult(BuildRequestFrameResponse(speakerProvider.GetCurrentSpeakerState()));
		}
		throw new ClassifiedException("BadRequest", "Speaker must be playing to seek");
	}

	[FunctionHandler("speaker/eject")]
	public Task<Response> EjectFile([SerializedRequestArg] StopRequestArgs args)
	{
		var (response, speakerState) = GetPlayer();
		if ((object)response != null)
		{
			return Task.FromResult(response);
		}
		if (speakerState is ReadyState readyState)
		{
			readyState.MakeRequest(new StopRequest(args.StopMethod));
			return Task.FromResult(BuildRequestFrameResponse(speakerState));
		}
		throw new ClassifiedException("BadRequest", "Speaker must be playing to eject");
	}
}
