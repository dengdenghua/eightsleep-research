package kc;

/* JADX INFO: loaded from: classes2.dex */
public final class b implements java.util.concurrent.Callable {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f55560a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public final /* synthetic */ java.util.ArrayList f55561b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public final /* synthetic */ kc.d f55562c;

    public /* synthetic */ b(kc.d dVar, java.util.ArrayList arrayList, int i10) {
        this.f55560a = i10;
        this.f55562c = dVar;
        this.f55561b = arrayList;
    }

    @Override // java.util.concurrent.Callable
    public final java.lang.Object call() {
        switch (this.f55560a) {
            case 0:
                p219io.sentry.InterfaceC3274e0 interfaceC3274e0D = p219io.sentry.AbstractC3339w1.d();
                p219io.sentry.InterfaceC3274e0 interfaceC3274e0V = interfaceC3274e0D != null ? interfaceC3274e0D.v("db.sql.room", "com.eightsleep.data_jetlag.persistence.dao.JetLagPlanDao") : null;
                kc.d dVar = this.f55562c;
                com.eightsleep.eight.AppDatabase_Impl appDatabase_Impl = (com.eightsleep.eight.AppDatabase_Impl) dVar.f55565a;
                appDatabase_Impl.c();
                try {
                    ((kc.c) dVar.f55569e).z(this.f55561b);
                    appDatabase_Impl.q();
                    if (interfaceC3274e0V != null) {
                        interfaceC3274e0V.b(p219io.sentry.A2.OK);
                        break;
                    }
                    return Hm.B.f13117a;
                } finally {
                    appDatabase_Impl.k();
                    if (interfaceC3274e0V != null) {
                        interfaceC3274e0V.a();
                    }
                }
            default:
                p219io.sentry.InterfaceC3274e0 interfaceC3274e0D2 = p219io.sentry.AbstractC3339w1.d();
                p219io.sentry.InterfaceC3274e0 interfaceC3274e0V2 = interfaceC3274e0D2 != null ? interfaceC3274e0D2.v("db.sql.room", "com.eightsleep.data_jetlag.persistence.dao.JetLagPlanDao") : null;
                kc.d dVar2 = this.f55562c;
                com.eightsleep.eight.AppDatabase_Impl appDatabase_Impl2 = (com.eightsleep.eight.AppDatabase_Impl) dVar2.f55565a;
                appDatabase_Impl2.c();
                try {
                    Jd.g gVar = (Jd.g) dVar2.f55570f;
                    java.util.ArrayList arrayList = this.f55561b;
                    gVar.getClass();
                    L4.f fVarA = gVar.a();
                    try {
                        java.util.Iterator it = arrayList.iterator();
                        while (it.hasNext()) {
                            gVar.x(fVarA, it.next());
                            fVarA.o();
                        }
                        gVar.u(fVarA);
                        appDatabase_Impl2.q();
                        if (interfaceC3274e0V2 != null) {
                            interfaceC3274e0V2.b(p219io.sentry.A2.OK);
                        }
                        appDatabase_Impl2.k();
                        if (interfaceC3274e0V2 != null) {
                            interfaceC3274e0V2.a();
                        }
                        return Hm.B.f13117a;
                    } catch (java.lang.Throwable th2) {
                        gVar.u(fVarA);
                        throw th2;
                    }
                } catch (java.lang.Throwable th3) {
                    appDatabase_Impl2.k();
                    if (interfaceC3274e0V2 != null) {
                        interfaceC3274e0V2.a();
                    }
                    throw th3;
                }
        }
    }
}
