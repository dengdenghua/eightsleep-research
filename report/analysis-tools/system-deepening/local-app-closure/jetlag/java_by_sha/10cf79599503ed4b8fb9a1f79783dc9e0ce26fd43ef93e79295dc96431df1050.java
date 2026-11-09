package p231jc;

/* JADX INFO: loaded from: classes2.dex */
public final class d implements Qa.d {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public final kc.d f54351a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public final long f54352b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public long f54353c;

    public d(kc.d dVar) {
        this.f54351a = dVar;
        int i10 = p319mo.b.f60446d;
        this.f54352b = P2.G.V(24, p319mo.d.HOURS);
    }

    @Override // Qa.b
    public final long a() {
        return this.f54352b;
    }

    @Override // Qa.b
    public final boolean b() {
        return P2.AbstractC1569h.G(this, null);
    }

    @Override // Qa.b
    public final long c() {
        return this.f54353c;
    }

    @Override // Qa.d
    public final zo.InterfaceC5441l d(java.lang.String str) {
        timber.log.Timber.f67879a.j(B.h.k("loading current user from cache with id: ", str), new java.lang.Object[0]);
        if (str == null) {
            return new J8.e(null, 9);
        }
        kc.d dVar = this.f54351a;
        E4.A a10 = E4.A.a(1, "SELECT * FROM jet_lag_plan WHERE tripId = ?");
        a10.g(1, str);
        aa.e eVar = new aa.e(14, dVar, a10);
        return new S4.r(P2.A.I((com.eightsleep.eight.AppDatabase_Impl) dVar.f55565a, false, new java.lang.String[]{"jet_lag_plan_task", "jet_lag_plan"}, eVar), 5);
    }

    @Override // Qa.b
    public final void e(long j5) {
        this.f54353c = j5;
    }

    @Override // Qa.b
    public final java.lang.Object f() {
        return null;
    }

    @Override // Qa.b
    public final /* bridge */ /* synthetic */ java.lang.Object g(Lm.c cVar, java.lang.Object obj) {
        return Hm.B.f13117a;
    }

    public final java.lang.Object h(java.util.List list, Nm.c cVar) {
        java.util.ArrayList arrayList = new java.util.ArrayList(Im.t.z0(list, 10));
        java.util.Iterator it = list.iterator();
        while (it.hasNext()) {
            p161gc.f fVar = (p161gc.f) it.next();
            p161gc.d dVar = fVar.f48500d;
            arrayList.add(new p283lc.e(fVar.f48497a, fVar.f48498b, fVar.f48499c, new com.eightsleep.data_jetlag.data.model.JetLagPlanMetadataResponse(dVar.f48485a, dVar.f48486b)));
        }
        kc.d dVar2 = this.f54351a;
        java.lang.Object objK = P2.A.K((com.eightsleep.eight.AppDatabase_Impl) dVar2.f55565a, new kc.b(dVar2, arrayList, 1), cVar);
        return objK == Mm.a.COROUTINE_SUSPENDED ? objK : Hm.B.f13117a;
    }
}
