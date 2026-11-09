using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace Eight.PulseAudio;

public struct pa_channel_map
{
	public struct _map_e__FixedBuffer
	{
		public pa_channel_position_t e0;

		public pa_channel_position_t e1;

		public pa_channel_position_t e2;

		public pa_channel_position_t e3;

		public pa_channel_position_t e4;

		public pa_channel_position_t e5;

		public pa_channel_position_t e6;

		public pa_channel_position_t e7;

		public pa_channel_position_t e8;

		public pa_channel_position_t e9;

		public pa_channel_position_t e10;

		public pa_channel_position_t e11;

		public pa_channel_position_t e12;

		public pa_channel_position_t e13;

		public pa_channel_position_t e14;

		public pa_channel_position_t e15;

		public pa_channel_position_t e16;

		public pa_channel_position_t e17;

		public pa_channel_position_t e18;

		public pa_channel_position_t e19;

		public pa_channel_position_t e20;

		public pa_channel_position_t e21;

		public pa_channel_position_t e22;

		public pa_channel_position_t e23;

		public pa_channel_position_t e24;

		public pa_channel_position_t e25;

		public pa_channel_position_t e26;

		public pa_channel_position_t e27;

		public pa_channel_position_t e28;

		public pa_channel_position_t e29;

		public pa_channel_position_t e30;

		public pa_channel_position_t e31;

		public ref pa_channel_position_t this[int index]
		{
			[MethodImpl(MethodImplOptions.AggressiveInlining)]
			get
			{
				return ref AsSpan()[index];
			}
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		public Span<pa_channel_position_t> AsSpan()
		{
			return MemoryMarshal.CreateSpan(ref e0, 32);
		}
	}

	public byte channels;

	public _map_e__FixedBuffer map;
}
