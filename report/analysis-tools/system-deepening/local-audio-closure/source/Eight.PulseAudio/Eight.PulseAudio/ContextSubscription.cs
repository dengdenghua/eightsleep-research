using System;
using System.Collections.Concurrent;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace Eight.PulseAudio;

public sealed class ContextSubscription(Context context) : IDisposable
{
	private readonly Context context = context;

	private GCHandle? handle;

	private bool disposed;

	private ConcurrentBag<IContextSubscriber> eventHandlers = new ConcurrentBag<IContextSubscriber>();

	internal unsafe void Subscribe()
	{
		GCHandle valueOrDefault = handle.GetValueOrDefault();
		if (!handle.HasValue)
		{
			valueOrDefault = GCHandle.Alloc(this);
			handle = valueOrDefault;
		}
		PulseAudio.pa_context_set_subscribe_callback(context.Pointer, (delegate* unmanaged[Cdecl]<pa_context*, pa_subscription_event_type_t, int, void*, void>)(&SubscriptionEventCallback), (void*)GCHandle.ToIntPtr(handle.Value));
	}

	internal void AddHandler(IContextSubscriber handler)
	{
		eventHandlers.Add(handler);
	}

	internal void RemoveHandler(IContextSubscriber handler)
	{
		ConcurrentBag<IContextSubscriber> concurrentBag = new ConcurrentBag<IContextSubscriber>();
		foreach (IContextSubscriber item in eventHandlers.Where((IContextSubscriber x) => x != handler))
		{
			concurrentBag.Add(item);
		}
		eventHandlers = concurrentBag;
	}

	[UnmanagedCallersOnly(CallConvs = new Type[] { typeof(CallConvCdecl) })]
	private unsafe static void SubscriptionEventCallback(pa_context* c, pa_subscription_event_type_t t, int idx, void* userdata)
	{
		if (!(GCHandle.FromIntPtr((nint)userdata).Target is ContextSubscription contextSubscription) || c != contextSubscription.context.Pointer)
		{
			return;
		}
		foreach (IContextSubscriber eventHandler in contextSubscription.eventHandlers)
		{
			if (eventHandler.SubscribesToEvent(t))
			{
				eventHandler.ActionOnEvent(t, idx);
			}
		}
	}

	public void Dispose()
	{
		if (!disposed)
		{
			disposed = true;
			handle?.Free();
			handle = null;
		}
	}

	private void ThrowIfDisposed()
	{
		if (disposed)
		{
			throw new ObjectDisposedException(GetType().FullName);
		}
	}
}
