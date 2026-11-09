package p231jc;

/* JADX INFO: loaded from: classes2.dex */
public final class g implements Qa.b {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public final kc.i f54360a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public final long f54361b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public long f54362c;

    public g(kc.i iVar) {
        this.f54360a = iVar;
        int i10 = p319mo.b.f60446d;
        this.f54361b = P2.G.V(12, p319mo.d.HOURS);
    }

    @Override // Qa.b
    public final long a() {
        return this.f54361b;
    }

    @Override // Qa.b
    public final boolean b() {
        return P2.AbstractC1569h.G(this, null);
    }

    @Override // Qa.b
    public final long c() {
        return this.f54362c;
    }

    @Override // Qa.b
    public final void e(long j5) {
        this.f54362c = j5;
    }

    @Override // Qa.b
    public final java.lang.Object f() {
        return Im.z.f14265a;
    }

    @Override // Qa.b
    public final /* bridge */ /* synthetic */ java.lang.Object g(Lm.c cVar, java.lang.Object obj) {
        return h(null, (java.util.List) obj, cVar);
    }

    /* JADX WARN: Code duplicated, block: B:7:0x0013  */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x004f, code lost:
    
        if (P2.E.M(r9, new p189hf.c(12, r6, r8), r7) == r0) goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x005f, code lost:
    
        if (P2.A.K(r9, new Jd.c(r6, 12), r7) == r0) goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0061, code lost:
    
        return r0;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final java.lang.Object h(java.lang.String str, java.util.List list, Lm.c cVar) {
        p231jc.f fVar;
        if (cVar instanceof p231jc.f) {
            fVar = (p231jc.f) cVar;
            int i10 = fVar.f54359c;
            if ((i10 & com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE) != 0) {
                fVar.f54359c = i10 - com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE;
            } else {
                fVar = new p231jc.f(this, cVar);
            }
        } else {
            fVar = new p231jc.f(this, cVar);
        }
        java.lang.Object obj = fVar.f54357a;
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i11 = fVar.f54359c;
        if (i11 == 0) {
            X4.x.M(obj);
            this.f54362c = java.lang.System.currentTimeMillis();
            kc.i iVar = this.f54360a;
            com.eightsleep.eight.AppDatabase_Impl appDatabase_Impl = iVar.f55584a;
            if (list != null) {
                fVar.f54359c = 1;
            } else {
                fVar.f54359c = 2;
            }
        } else {
            if (i11 != 1 && i11 != 2) {
                throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            X4.x.M(obj);
        }
        return Hm.B.f13117a;
    }
}
