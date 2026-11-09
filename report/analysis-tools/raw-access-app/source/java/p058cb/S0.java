package p058cb;

/* JADX INFO: loaded from: classes2.dex */
public final class S0 extends Nm.i implements Vm.n {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public /* synthetic */ java.lang.Object f35815a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public final /* synthetic */ com.eightsleep.data_device.data.repository.OfflineRepository f35816b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public final /* synthetic */ com.eightsleep.data_device.data.model.ble.HubPeripheral f35817c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public S0(com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository, com.eightsleep.data_device.data.model.ble.HubPeripheral hubPeripheral, Lm.c cVar) {
        super(2, cVar);
        this.f35816b = offlineRepository;
        this.f35817c = hubPeripheral;
    }

    @Override // Nm.a
    public final Lm.c create(java.lang.Object obj, Lm.c cVar) {
        p058cb.S0 s10 = new p058cb.S0(this.f35816b, this.f35817c, cVar);
        s10.f35815a = obj;
        return s10;
    }

    @Override // Vm.n
    public final java.lang.Object invoke(java.lang.Object obj, java.lang.Object obj2) {
        return ((p058cb.S0) create((com.eightsleep.data_device.data.model.ble.DeviceTokenResponse) obj, (Lm.c) obj2)).invokeSuspend(Hm.B.f13117a);
    }

    @Override // Nm.a
    public final java.lang.Object invokeSuspend(java.lang.Object obj) {
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        X4.x.M(obj);
        com.eightsleep.data_device.data.model.ble.DeviceTokenResponse deviceTokenResponse = (com.eightsleep.data_device.data.model.ble.DeviceTokenResponse) this.f35815a;
        com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository = this.f35816b;
        p011ab.InterfaceC2341o api = offlineRepository.getApi();
        com.eightsleep.data_device.data.model.ble.HubPeripheral hubPeripheral = this.f35817c;
        return P2.q.t(P2.AbstractC1563b.t(offlineRepository, api, null, new p058cb.Q0(hubPeripheral, deviceTokenResponse, null), 3), null, new p058cb.R0(offlineRepository, hubPeripheral, null), 3);
    }
}
