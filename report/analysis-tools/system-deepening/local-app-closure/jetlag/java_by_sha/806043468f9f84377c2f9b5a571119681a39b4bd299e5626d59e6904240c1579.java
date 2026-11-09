package p231jc;

/* JADX INFO: loaded from: classes2.dex */
public final class b extends Nm.i implements Vm.n {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public final /* synthetic */ p231jc.d f54346a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public final /* synthetic */ java.lang.String f54347b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(p231jc.d dVar, java.lang.String str, Lm.c cVar) {
        super(2, cVar);
        this.f54346a = dVar;
        this.f54347b = str;
    }

    @Override // Nm.a
    public final Lm.c create(java.lang.Object obj, Lm.c cVar) {
        return new p231jc.b(this.f54346a, this.f54347b, cVar);
    }

    @Override // Vm.n
    public final java.lang.Object invoke(java.lang.Object obj, java.lang.Object obj2) {
        return ((p231jc.b) create((p554wo.InterfaceC5106z) obj, (Lm.c) obj2)).invokeSuspend(Hm.B.f13117a);
    }

    @Override // Nm.a
    public final java.lang.Object invokeSuspend(java.lang.Object obj) throws java.io.IOException {
        p283lc.d dVar;
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        X4.x.M(obj);
        kc.d dVar2 = this.f54346a.f54351a;
        p219io.sentry.InterfaceC3274e0 interfaceC3274e0D = p219io.sentry.AbstractC3339w1.d();
        p219io.sentry.InterfaceC3274e0 interfaceC3274e0V = interfaceC3274e0D != null ? interfaceC3274e0D.v("db.sql.room", "com.eightsleep.data_jetlag.persistence.dao.JetLagPlanDao") : null;
        E4.A a10 = E4.A.a(1, "SELECT * FROM jet_lag_plan WHERE tripId = ?");
        a10.g(1, this.f54347b);
        com.eightsleep.eight.AppDatabase_Impl appDatabase_Impl = (com.eightsleep.eight.AppDatabase_Impl) dVar2.f55565a;
        appDatabase_Impl.b();
        android.database.Cursor cursorW = p008a7.d.W(appDatabase_Impl, a10, true);
        try {
            int iK = p000a.a.K(cursorW, "id");
            int iK2 = p000a.a.K(cursorW, com.eightsleep.presentation_home.viewmodel.TagBreakdownViewModel.USER_ID);
            int iK3 = p000a.a.K(cursorW, "tripId");
            int iK4 = p000a.a.K(cursorW, "direction");
            int iK5 = p000a.a.K(cursorW, "supplementsEnabled");
            int iK6 = p000a.a.K(cursorW, "createdAt");
            int iK7 = p000a.a.K(cursorW, "status");
            int iK8 = p000a.a.K(cursorW, com.heytap.mcssdk.constant.b.f42635s);
            int iK9 = p000a.a.K(cursorW, com.heytap.mcssdk.constant.b.f42636t);
            p464t.C4713e c4713e = new p464t.C4713e(0);
            while (cursorW.moveToNext()) {
                java.lang.String string = cursorW.getString(iK);
                if (!c4713e.containsKey(string)) {
                    c4713e.put(string, new java.util.ArrayList());
                }
            }
            cursorW.moveToPosition(-1);
            dVar2.a(c4713e);
            if (cursorW.moveToFirst()) {
                java.lang.String string2 = cursorW.getString(iK);
                java.lang.String string3 = cursorW.getString(iK2);
                java.lang.String string4 = cursorW.getString(iK3);
                java.lang.String string5 = cursorW.getString(iK4);
                dVar2.b().getClass();
                com.eightsleep.data_jetlag.enums.TravelDirection travelDirectionA = p231jc.a.a(string5);
                boolean z10 = cursorW.getInt(iK5) != 0;
                java.time.Instant instantD = dVar2.c().d(cursorW.getString(iK6));
                if (instantD == null) {
                    throw new java.lang.IllegalStateException("Expected NON-NULL 'java.time.Instant', but it was NULL.");
                }
                java.lang.String string6 = cursorW.getString(iK7);
                java.time.LocalDate localDateE = dVar2.c().e(cursorW.getString(iK8));
                if (localDateE == null) {
                    throw new java.lang.IllegalStateException("Expected NON-NULL 'java.time.LocalDate', but it was NULL.");
                }
                java.time.LocalDate localDateE2 = dVar2.c().e(cursorW.getString(iK9));
                if (localDateE2 == null) {
                    throw new java.lang.IllegalStateException("Expected NON-NULL 'java.time.LocalDate', but it was NULL.");
                }
                dVar = new p283lc.d(new p283lc.a(string2, string3, string4, travelDirectionA, z10, instantD, string6, localDateE, localDateE2), (java.util.ArrayList) c4713e.get(cursorW.getString(iK)));
            } else {
                dVar = null;
            }
            cursorW.close();
            if (interfaceC3274e0V != null) {
                interfaceC3274e0V.a();
            }
            a10.release();
            if (dVar != null) {
                return dVar.a();
            }
            return null;
        } catch (java.lang.Throwable th2) {
            cursorW.close();
            if (interfaceC3274e0V != null) {
                interfaceC3274e0V.a();
            }
            a10.release();
            throw th2;
        }
    }
}
