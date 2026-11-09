package p058cb;

/* JADX INFO: loaded from: classes2.dex */
public final class R0 extends Nm.i implements Vm.n {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public int f35807a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public /* synthetic */ java.lang.Object f35808b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public final /* synthetic */ com.eightsleep.data_device.data.repository.OfflineRepository f35809c;

    /* JADX INFO: renamed from: d, reason: collision with root package name */
    public final /* synthetic */ com.eightsleep.data_device.data.model.ble.HubPeripheral f35810d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public R0(com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository, com.eightsleep.data_device.data.model.ble.HubPeripheral hubPeripheral, Lm.c cVar) {
        super(2, cVar);
        this.f35809c = offlineRepository;
        this.f35810d = hubPeripheral;
    }

    @Override // Nm.a
    public final Lm.c create(java.lang.Object obj, Lm.c cVar) {
        p058cb.R0 r10 = new p058cb.R0(this.f35809c, this.f35810d, cVar);
        r10.f35808b = obj;
        return r10;
    }

    @Override // Vm.n
    public final java.lang.Object invoke(java.lang.Object obj, java.lang.Object obj2) {
        return ((p058cb.R0) create((com.eightsleep.data_device.data.model.ble.DeviceKeyResponse) obj, (Lm.c) obj2)).invokeSuspend(Hm.B.f13117a);
    }

    @Override // Nm.a
    public final java.lang.Object invokeSuspend(java.lang.Object obj) {
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i10 = this.f35807a;
        if (i10 != 0) {
            if (i10 != 1) {
                throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            X4.x.M(obj);
            return obj;
        }
        X4.x.M(obj);
        com.eightsleep.data_device.data.model.offline.OfflineSecurityKey domain = ((com.eightsleep.data_device.data.model.ble.DeviceKeyResponse) this.f35808b).toDomain();
        this.f35807a = 1;
        java.lang.Object objAccess$saveOfflineDataForDevice = com.eightsleep.data_device.data.repository.OfflineRepository.access$saveOfflineDataForDevice(this.f35809c, this.f35810d, domain, this);
        return objAccess$saveOfflineDataForDevice == aVar ? aVar : objAccess$saveOfflineDataForDevice;
    }
}
