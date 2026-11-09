package p058cb;

/* JADX INFO: loaded from: classes2.dex */
public final class Q0 extends Nm.i implements Vm.n {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public int f35803a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public /* synthetic */ java.lang.Object f35804b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public final /* synthetic */ com.eightsleep.data_device.data.model.ble.HubPeripheral f35805c;

    /* JADX INFO: renamed from: d, reason: collision with root package name */
    public final /* synthetic */ com.eightsleep.data_device.data.model.ble.DeviceTokenResponse f35806d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Q0(com.eightsleep.data_device.data.model.ble.HubPeripheral hubPeripheral, com.eightsleep.data_device.data.model.ble.DeviceTokenResponse deviceTokenResponse, Lm.c cVar) {
        super(2, cVar);
        this.f35805c = hubPeripheral;
        this.f35806d = deviceTokenResponse;
    }

    @Override // Nm.a
    public final Lm.c create(java.lang.Object obj, Lm.c cVar) {
        p058cb.Q0 q10 = new p058cb.Q0(this.f35805c, this.f35806d, cVar);
        q10.f35804b = obj;
        return q10;
    }

    @Override // Vm.n
    public final java.lang.Object invoke(java.lang.Object obj, java.lang.Object obj2) {
        return ((p058cb.Q0) create((p011ab.InterfaceC2341o) obj, (Lm.c) obj2)).invokeSuspend(Hm.B.f13117a);
    }

    @Override // Nm.a
    public final java.lang.Object invokeSuspend(java.lang.Object obj) {
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i10 = this.f35803a;
        if (i10 != 0) {
            if (i10 != 1) {
                throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            X4.x.M(obj);
            return obj;
        }
        X4.x.M(obj);
        p011ab.InterfaceC2341o interfaceC2341o = (p011ab.InterfaceC2341o) this.f35804b;
        java.lang.String deviceId = this.f35805c.getDeviceId();
        com.eightsleep.data_device.data.model.ble.GetDeviceKeyRequest getDeviceKeyRequest = new com.eightsleep.data_device.data.model.ble.GetDeviceKeyRequest(this.f35806d.getNonce());
        this.f35803a = 1;
        java.lang.Object objE = interfaceC2341o.e(deviceId, getDeviceKeyRequest, this);
        return objE == aVar ? aVar : objE;
    }
}
