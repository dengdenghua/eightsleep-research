package p058cb;

/* JADX INFO: loaded from: classes2.dex */
public final class M0 extends Nm.i implements Vm.p {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35773a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public /* synthetic */ java.lang.Object f35774b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public /* synthetic */ java.lang.Object f35775c;

    /* JADX INFO: renamed from: d, reason: collision with root package name */
    public /* synthetic */ java.lang.Object f35776d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ M0(int i10, Lm.c cVar) {
        super(i10, cVar);
        this.f35773a = 2;
    }

    @Override // Vm.p
    public final java.lang.Object invoke(java.lang.Object obj, java.lang.Object obj2, java.lang.Object obj3, java.lang.Object obj4) {
        switch (this.f35773a) {
            case 0:
                p058cb.M0 m2 = new p058cb.M0((com.eightsleep.data_device.data.repository.OfflineRepository) this.f35776d, (Lm.c) obj4, 0);
                m2.f35774b = (p230jb.k) obj2;
                m2.f35775c = (com.eightsleep.data_device.data.model.offline.OfflineSecurityKey) obj3;
                return m2.invokeSuspend(Hm.B.f13117a);
            case 1:
                p058cb.M0 m10 = new p058cb.M0((com.eightsleep.data_device.data.repository.OfflineRepository) this.f35776d, (Lm.c) obj4, 1);
                m10.f35774b = (p230jb.k) obj2;
                m10.f35775c = (com.eightsleep.data_device.data.model.offline.OfflineSecurityKey) obj3;
                return m10.invokeSuspend(Hm.B.f13117a);
            default:
                p058cb.M0 m11 = new p058cb.M0(4, (Lm.c) obj4);
                m11.f35774b = (p592ya.j) obj;
                m11.f35775c = (p450sc.m) obj2;
                m11.f35776d = (p592ya.j) obj3;
                return m11.invokeSuspend(Hm.B.f13117a);
        }
    }

    @Override // Nm.a
    public final java.lang.Object invokeSuspend(java.lang.Object obj) {
        switch (this.f35773a) {
            case 0:
                Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
                X4.x.M(obj);
                p230jb.k kVar = (p230jb.k) this.f35774b;
                com.eightsleep.data_device.data.model.offline.OfflineSecurityKey deviceKey = (com.eightsleep.data_device.data.model.offline.OfflineSecurityKey) this.f35775c;
                p011ab.P pAccess$getOfflineApi$p = com.eightsleep.data_device.data.repository.OfflineRepository.access$getOfflineApi$p((com.eightsleep.data_device.data.repository.OfflineRepository) this.f35776d);
                kotlin.jvm.internal.l.h(kVar, "null cannot be cast to non-null type com.eightsleep.data_device.data.model.offline.OfflineHubPeripheralReadCommandRequest<RESPONSE of com.eightsleep.data_device.data.repository.OfflineRepository.read>");
                pAccess$getOfflineApi$p.getClass();
                kotlin.jvm.internal.l.j(deviceKey, "deviceKey");
                return pAccess$getOfflineApi$p.e(new p011ab.E(pAccess$getOfflineApi$p, (com.eightsleep.data_device.data.model.offline.OfflineHubPeripheralReadCommandRequest) kVar, deviceKey, null));
            case 1:
                Mm.a aVar2 = Mm.a.COROUTINE_SUSPENDED;
                X4.x.M(obj);
                p230jb.k kVar2 = (p230jb.k) this.f35774b;
                com.eightsleep.data_device.data.model.offline.OfflineSecurityKey deviceKey2 = (com.eightsleep.data_device.data.model.offline.OfflineSecurityKey) this.f35775c;
                p011ab.P pAccess$getOfflineApi$p2 = com.eightsleep.data_device.data.repository.OfflineRepository.access$getOfflineApi$p((com.eightsleep.data_device.data.repository.OfflineRepository) this.f35776d);
                kotlin.jvm.internal.l.h(kVar2, "null cannot be cast to non-null type com.eightsleep.data_device.data.model.offline.OfflineHubPeripheralWriteCommandRequest<REQUEST of com.eightsleep.data_device.data.repository.OfflineRepository.write>");
                pAccess$getOfflineApi$p2.getClass();
                kotlin.jvm.internal.l.j(deviceKey2, "deviceKey");
                return pAccess$getOfflineApi$p2.e(new p011ab.L(pAccess$getOfflineApi$p2, (com.eightsleep.data_device.data.model.offline.OfflineHubPeripheralWriteCommandRequest) kVar2, deviceKey2, null));
            default:
                Mm.a aVar3 = Mm.a.COROUTINE_SUSPENDED;
                X4.x.M(obj);
                return p592ya.j.b((p592ya.j) this.f35774b, new Jh.C1119d(6, (p450sc.m) this.f35775c, (p592ya.j) this.f35776d));
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ M0(com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository, Lm.c cVar, int i10) {
        super(4, cVar);
        this.f35773a = i10;
        this.f35776d = offlineRepository;
    }
}
