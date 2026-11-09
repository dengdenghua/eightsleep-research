using System.Collections.Generic;
using System.IO.Pipelines;

namespace Eight.PulseAudio;

public interface IPulseAudioFactory
{
	ChannelMap CreateStereoChannelMap();

	ChannelMap CreateSwappedStereoChannelMap();

	Context? CreateContext(string name, IEnumerable<KeyValuePair<string, string>> pairs);

	Context? CreateContext(string name, PropList propList);

	IAudioStreamWriter CreateAudioStreamWriter(Stream stream, PipeReader reader);

	SampleSpec CreateSampleSpec(int bitsPerSample, int sampleRate, int channels, bool isLittleEndian);

	Stream? CreateStream(Context context, string name, SampleSpec sampleSpec, ChannelMap channelMap, IEnumerable<KeyValuePair<string, string>> entries);
}
