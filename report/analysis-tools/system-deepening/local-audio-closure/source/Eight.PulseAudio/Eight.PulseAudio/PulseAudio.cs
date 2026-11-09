using System;
using System.CodeDom.Compiler;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.InteropServices.Marshalling;

namespace Eight.PulseAudio;

internal static class PulseAudio
{
	private const string libName = "libpulse.so.0";

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_channel_map_init_mono")]
	public unsafe static extern pa_channel_map* pa_channel_map_init_mono(pa_channel_map* m);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_channel_map_init_stereo")]
	public unsafe static extern pa_channel_map* pa_channel_map_init_stereo(pa_channel_map* m);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_channel_map_snprint")]
	public unsafe static extern sbyte* pa_channel_map_snprint(sbyte* s, nuint l, pa_channel_map* map);

	[LibraryImport("libpulse.so.0", EntryPoint = "pa_context_new")]
	[GeneratedCode("Microsoft.Interop.LibraryImportGenerator", "9.0.15.2218")]
	[SkipLocalsInit]
	internal unsafe static pa_context* pa_context_new(pa_mainloop_api* mainloop, [MarshalAs(UnmanagedType.LPStr)] string name)
	{
		byte* ptr = default;
		pa_context* ptr2 = default;
		scoped AnsiStringMarshaller.ManagedToUnmanagedIn managedToUnmanagedIn = default;
		try
		{
			Span<byte> buffer = stackalloc byte[AnsiStringMarshaller.ManagedToUnmanagedIn.BufferSize];
			managedToUnmanagedIn.FromManaged(name, buffer);
			ptr = managedToUnmanagedIn.ToUnmanaged();
			return __PInvoke(mainloop, ptr);
		}
		finally
		{
			managedToUnmanagedIn.Free();
		}
		[DllImport("libpulse.so.0", EntryPoint = "pa_context_new", ExactSpelling = true)]
		unsafe static extern pa_context* __PInvoke(pa_mainloop_api* __mainloop_native, byte* __name_native);
	}

	[LibraryImport("libpulse.so.0", EntryPoint = "pa_context_new_with_proplist")]
	[GeneratedCode("Microsoft.Interop.LibraryImportGenerator", "9.0.15.2218")]
	[SkipLocalsInit]
	internal unsafe static pa_context* pa_context_new_with_proplist(pa_mainloop_api* mainloop, [MarshalAs(UnmanagedType.LPStr)] string name, pa_proplist* proplist)
	{
		byte* ptr = default;
		pa_context* ptr2 = default;
		scoped AnsiStringMarshaller.ManagedToUnmanagedIn managedToUnmanagedIn = default;
		try
		{
			Span<byte> buffer = stackalloc byte[AnsiStringMarshaller.ManagedToUnmanagedIn.BufferSize];
			managedToUnmanagedIn.FromManaged(name, buffer);
			ptr = managedToUnmanagedIn.ToUnmanaged();
			return __PInvoke(mainloop, ptr, proplist);
		}
		finally
		{
			managedToUnmanagedIn.Free();
		}
		[DllImport("libpulse.so.0", EntryPoint = "pa_context_new_with_proplist", ExactSpelling = true)]
		unsafe static extern pa_context* __PInvoke(pa_mainloop_api* __mainloop_native, byte* __name_native, pa_proplist* __proplist_native);
	}

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_context_disconnect")]
	internal unsafe static extern void pa_context_disconnect(pa_context* c);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_context_unref")]
	internal unsafe static extern void pa_context_unref(pa_context* c);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_context_connect")]
	internal unsafe static extern int pa_context_connect(pa_context* c, sbyte* server, pa_context_flags_t flags, pa_spawn_api* api);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_context_set_state_callback")]
	internal unsafe static extern void pa_context_set_state_callback(pa_context* c, delegate* unmanaged[Cdecl]<pa_context*, void*, void> cb, void* userdata);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_context_errno")]
	internal unsafe static extern int pa_context_errno(pa_context* c);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_context_get_state")]
	internal unsafe static extern pa_context_state_t pa_context_get_state(pa_context* c);

	[LibraryImport("libpulse.so.0", EntryPoint = "pa_strerror")]
	[GeneratedCode("Microsoft.Interop.LibraryImportGenerator", "9.0.15.2218")]
	[SkipLocalsInit]
	[return: MarshalAs(UnmanagedType.LPWStr)]
	public unsafe static string pa_strerror(int error)
	{
		bool flag = false;
		string text = null;
		ushort* unmanaged = default;
		try
		{
			unmanaged = __PInvoke(error);
			flag = true;
			return Utf16StringMarshaller.ConvertToManaged(unmanaged);
		}
		finally
		{
			if (flag)
			{
				Utf16StringMarshaller.Free(unmanaged);
			}
		}
		[DllImport("libpulse.so.0", EntryPoint = "pa_strerror", ExactSpelling = true)]
		unsafe static extern ushort* __PInvoke(int __error_native);
	}

	public static bool PA_CONTEXT_IS_GOOD(pa_context_state_t x)
	{
		if (x != pa_context_state_t.PA_CONTEXT_CONNECTING && x != pa_context_state_t.PA_CONTEXT_AUTHORIZING && x != pa_context_state_t.PA_CONTEXT_SETTING_NAME)
		{
			return x == pa_context_state_t.PA_CONTEXT_READY;
		}
		return true;
	}

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_context_get_sink_input_info")]
	public unsafe static extern pa_operation* pa_context_get_sink_input_info(pa_context* c, uint idx, delegate* unmanaged[Cdecl]<pa_context*, pa_sink_input_info*, int, void*, void> cb, void* userdata);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_context_get_sink_input_info_list")]
	public unsafe static extern pa_operation* pa_context_get_sink_input_info_list(pa_context* c, delegate* unmanaged[Cdecl]<pa_context*, pa_sink_input_info*, int, void*, void> cb, void* userdata);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_context_move_sink_input_by_name")]
	public unsafe static extern pa_operation* pa_context_move_sink_input_by_name(pa_context* c, uint idx, sbyte* sink_name, delegate* unmanaged[Cdecl]<pa_context*, int, void*, void> cb, void* userdata);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_context_move_sink_input_by_index")]
	public unsafe static extern pa_operation* pa_context_move_sink_input_by_index(pa_context* c, uint idx, int sink_idx, delegate* unmanaged[Cdecl]<pa_context*, int, void*, void> cb, void* userdata);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_context_set_sink_input_volume")]
	public unsafe static extern pa_operation* pa_context_set_sink_input_volume(pa_context* c, uint idx, pa_cvolume* volume, delegate* unmanaged[Cdecl]<pa_context*, int, void*, void> cb, void* userdata);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_context_get_sink_info_by_index")]
	public unsafe static extern pa_operation* pa_context_get_sink_info_by_index(pa_context* c, uint idx, delegate* unmanaged[Cdecl]<pa_context*, pa_sink_info*, int, void*, void> cb, void* userdata);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_context_get_sink_info_list")]
	public unsafe static extern pa_operation* pa_context_get_sink_info_list(pa_context* c, delegate* unmanaged[Cdecl]<pa_context*, pa_sink_info*, int, void*, void> cb, void* userdata);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_context_suspend_sink_by_index")]
	public unsafe static extern pa_operation* pa_context_suspend_sink_by_index(pa_context* c, uint idx, int suspend, delegate* unmanaged[Cdecl]<pa_context*, int, void*, void> cb, void* userdata);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_context_set_sink_volume_by_index")]
	public unsafe static extern pa_operation* pa_context_set_sink_volume_by_index(pa_context* c, uint idx, pa_cvolume* volume, delegate* unmanaged[Cdecl]<pa_context*, int, void*, void> cb, void* userdata);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_operation_unref")]
	internal unsafe static extern void pa_operation_unref(pa_operation* o);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_proplist_new")]
	internal unsafe static extern pa_proplist* pa_proplist_new();

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_proplist_free")]
	internal unsafe static extern void pa_proplist_free(pa_proplist* p);

	[LibraryImport("libpulse.so.0", EntryPoint = "pa_proplist_sets")]
	[GeneratedCode("Microsoft.Interop.LibraryImportGenerator", "9.0.15.2218")]
	[SkipLocalsInit]
	internal unsafe static int pa_proplist_sets(pa_proplist* p, [MarshalAs(UnmanagedType.LPStr)] string key, [MarshalAs(UnmanagedType.LPStr)] string value)
	{
		byte* ptr = default;
		byte* ptr2 = default;
		int num = 0;
		scoped AnsiStringMarshaller.ManagedToUnmanagedIn managedToUnmanagedIn = default;
		scoped AnsiStringMarshaller.ManagedToUnmanagedIn managedToUnmanagedIn2 = default;
		try
		{
			string managed = value;
			Span<byte> buffer = stackalloc byte[AnsiStringMarshaller.ManagedToUnmanagedIn.BufferSize];
			managedToUnmanagedIn.FromManaged(managed, buffer);
			managed = key;
			buffer = stackalloc byte[AnsiStringMarshaller.ManagedToUnmanagedIn.BufferSize];
			managedToUnmanagedIn2.FromManaged(managed, buffer);
			ptr2 = managedToUnmanagedIn.ToUnmanaged();
			ptr = managedToUnmanagedIn2.ToUnmanaged();
			return __PInvoke(p, ptr, ptr2);
		}
		finally
		{
			managedToUnmanagedIn.Free();
			managedToUnmanagedIn2.Free();
		}
		[DllImport("libpulse.so.0", EntryPoint = "pa_proplist_sets", ExactSpelling = true)]
		unsafe static extern int __PInvoke(pa_proplist* __p_native, byte* __key_native, byte* __value_native);
	}

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_sample_spec_valid")]
	public unsafe static extern int pa_sample_spec_valid(pa_sample_spec* spec);

	[LibraryImport("libpulse.so.0", EntryPoint = "pa_stream_new_with_proplist")]
	[GeneratedCode("Microsoft.Interop.LibraryImportGenerator", "9.0.15.2218")]
	[SkipLocalsInit]
	internal unsafe static pa_stream* pa_stream_new_with_proplist(pa_context* c, [MarshalAs(UnmanagedType.LPStr)] string name, pa_sample_spec* ss, pa_channel_map* map, pa_proplist* p)
	{
		byte* ptr = default;
		pa_stream* ptr2 = default;
		scoped AnsiStringMarshaller.ManagedToUnmanagedIn managedToUnmanagedIn = default;
		try
		{
			Span<byte> buffer = stackalloc byte[AnsiStringMarshaller.ManagedToUnmanagedIn.BufferSize];
			managedToUnmanagedIn.FromManaged(name, buffer);
			ptr = managedToUnmanagedIn.ToUnmanaged();
			return __PInvoke(c, ptr, ss, map, p);
		}
		finally
		{
			managedToUnmanagedIn.Free();
		}
		[DllImport("libpulse.so.0", EntryPoint = "pa_stream_new_with_proplist", ExactSpelling = true)]
		unsafe static extern pa_stream* __PInvoke(pa_context* __c_native, byte* __name_native, pa_sample_spec* __ss_native, pa_channel_map* __map_native, pa_proplist* __p_native);
	}

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_stream_get_state")]
	internal unsafe static extern pa_stream_state_t pa_stream_get_state(pa_stream* p);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_stream_set_state_callback")]
	internal unsafe static extern void pa_stream_set_state_callback(pa_stream* s, delegate* unmanaged[Cdecl]<pa_stream*, void*, void> cb, void* userdata);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_stream_connect_playback")]
	internal unsafe static extern int pa_stream_connect_playback(pa_stream* s, sbyte* dev, pa_buffer_attr* attr, pa_stream_flags_t flags, pa_cvolume* volume, pa_stream* sync_stream);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_stream_unref")]
	internal unsafe static extern void pa_stream_unref(pa_stream* s);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_stream_disconnect")]
	internal unsafe static extern int pa_stream_disconnect(pa_stream* s);

	[LibraryImport("libpulse.so.0", EntryPoint = "pa_stream_get_device_name")]
	[GeneratedCode("Microsoft.Interop.LibraryImportGenerator", "9.0.15.2218")]
	[SkipLocalsInit]
	[return: MarshalAs(UnmanagedType.LPWStr)]
	internal unsafe static string pa_stream_get_device_name(pa_stream* s)
	{
		bool flag = false;
		string text = null;
		ushort* unmanaged = default;
		try
		{
			unmanaged = __PInvoke(s);
			flag = true;
			return Utf16StringMarshaller.ConvertToManaged(unmanaged);
		}
		finally
		{
			if (flag)
			{
				Utf16StringMarshaller.Free(unmanaged);
			}
		}
		[DllImport("libpulse.so.0", EntryPoint = "pa_stream_get_device_name", ExactSpelling = true)]
		unsafe static extern ushort* __PInvoke(pa_stream* __s_native);
	}

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_stream_is_suspended")]
	internal unsafe static extern int pa_stream_is_suspended(pa_stream* s);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_stream_is_corked")]
	internal unsafe static extern int pa_stream_is_corked(pa_stream* s);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_stream_begin_write")]
	internal unsafe static extern int pa_stream_begin_write(pa_stream* p, void** data, nuint* nbytes);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_stream_cancel_write")]
	internal unsafe static extern int pa_stream_cancel_write(pa_stream* p);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_stream_write")]
	internal unsafe static extern int pa_stream_write(pa_stream* p, void* data, nuint nbytes, delegate* unmanaged<void*, void> free_cb, nint offset, pa_seek_mode_t seek);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_stream_writable_size")]
	internal unsafe static extern nuint pa_stream_writable_size(pa_stream* p);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_stream_readable_size")]
	internal unsafe static extern nuint pa_stream_readable_size(pa_stream* p);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_stream_drain")]
	internal unsafe static extern pa_operation* pa_stream_drain(pa_stream* s, delegate* unmanaged[Cdecl]<pa_stream*, int, void*, void> cb, void* userdata);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_stream_cork")]
	internal unsafe static extern pa_operation* pa_stream_cork(pa_stream* s, int b, delegate* unmanaged[Cdecl]<pa_stream*, int, void*, void> cb, void* userdata);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_stream_flush")]
	internal unsafe static extern pa_operation* pa_stream_flush(pa_stream* s, delegate* unmanaged[Cdecl]<pa_stream*, int, void*, void> cb, void* userdata);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_stream_get_context")]
	internal unsafe static extern pa_context* pa_stream_get_context(pa_stream* p);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_stream_set_write_callback")]
	public unsafe static extern void pa_stream_set_write_callback(pa_stream* p, delegate* unmanaged[Cdecl]<pa_stream*, nuint, void*, void> cb, void* userdata);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_stream_get_index")]
	public unsafe static extern uint pa_stream_get_index(pa_stream* s);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_stream_get_channel_map")]
	public unsafe static extern pa_channel_map* pa_stream_get_channel_map(pa_stream* s);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_context_subscribe")]
	internal unsafe static extern pa_operation* pa_context_subscribe(pa_context* c, pa_subscription_mask_t m, delegate* unmanaged<pa_context*, int, void*, void> cb, void* userdata);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_context_set_subscribe_callback")]
	internal unsafe static extern void pa_context_set_subscribe_callback(pa_context* c, delegate* unmanaged[Cdecl]<pa_context*, pa_subscription_event_type_t, int, void*, void> cb, void* userdata);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_threaded_mainloop_new")]
	internal unsafe static extern pa_threaded_mainloop* pa_threaded_mainloop_new();

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_threaded_mainloop_start")]
	internal unsafe static extern int pa_threaded_mainloop_start(pa_threaded_mainloop* m);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_threaded_mainloop_in_thread")]
	internal unsafe static extern int pa_threaded_mainloop_in_thread(pa_threaded_mainloop* m);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_threaded_mainloop_free")]
	internal unsafe static extern void pa_threaded_mainloop_free(pa_threaded_mainloop* m);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_threaded_mainloop_stop")]
	internal unsafe static extern void pa_threaded_mainloop_stop(pa_threaded_mainloop* m);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_threaded_mainloop_get_api")]
	internal unsafe static extern pa_mainloop_api* pa_threaded_mainloop_get_api(pa_threaded_mainloop* m);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_threaded_mainloop_lock")]
	internal unsafe static extern void pa_threaded_mainloop_lock(pa_threaded_mainloop* m);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_threaded_mainloop_unlock")]
	internal unsafe static extern void pa_threaded_mainloop_unlock(pa_threaded_mainloop* m);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_threaded_mainloop_signal")]
	public unsafe static extern void pa_threaded_mainloop_signal(pa_threaded_mainloop* m, int wait_for_accept);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_threaded_mainloop_wait")]
	public unsafe static extern void pa_threaded_mainloop_wait(pa_threaded_mainloop* m);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_threaded_mainloop_accept")]
	public unsafe static extern void pa_threaded_mainloop_accept(pa_threaded_mainloop* m);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_cvolume_set")]
	public unsafe static extern pa_cvolume* pa_cvolume_set(pa_cvolume* a, uint channels, uint v);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_cvolume_set_position")]
	public unsafe static extern pa_cvolume* pa_cvolume_set_position(pa_cvolume* cv, pa_channel_map* map, pa_channel_position_t t, uint v);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_cvolume_get_position")]
	public unsafe static extern uint pa_cvolume_get_position(pa_cvolume* cv, pa_channel_map* map, pa_channel_position_t t);

	[DllImport("libpulse.so.0", ExactSpelling = true)]
	[LibraryImport("libpulse.so.0", EntryPoint = "pa_cvolume_init")]
	public unsafe static extern pa_cvolume* pa_cvolume_init(pa_cvolume* cv);
}
