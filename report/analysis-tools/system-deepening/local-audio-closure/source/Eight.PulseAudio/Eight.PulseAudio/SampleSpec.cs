namespace Eight.PulseAudio;

public class SampleSpec
{
	internal readonly pa_sample_spec Struct;

	internal SampleSpec(pa_sample_spec spec)
	{
		Struct = spec;
	}
}
