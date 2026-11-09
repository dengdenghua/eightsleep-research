namespace Eight.PulseAudio;

internal interface IContextSubscriber
{
	bool SubscribesToEvent(pa_subscription_event_type_t type);

	void ActionOnEvent(pa_subscription_event_type_t type, int idx);
}
