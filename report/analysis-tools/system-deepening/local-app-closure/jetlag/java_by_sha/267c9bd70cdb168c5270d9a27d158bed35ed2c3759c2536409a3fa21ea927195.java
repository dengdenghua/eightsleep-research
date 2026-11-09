package p161gc;

/* JADX INFO: loaded from: classes2.dex */
public final class c {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public final java.lang.String f48475a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public final java.lang.String f48476b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public final java.lang.String f48477c;

    /* JADX INFO: renamed from: d, reason: collision with root package name */
    public final com.eightsleep.data_jetlag.enums.TravelDirection f48478d;

    /* JADX INFO: renamed from: e, reason: collision with root package name */
    public final boolean f48479e;

    /* JADX INFO: renamed from: f, reason: collision with root package name */
    public final Ga.s f48480f;

    /* JADX INFO: renamed from: g, reason: collision with root package name */
    public final java.lang.String f48481g;

    /* JADX INFO: renamed from: h, reason: collision with root package name */
    public final java.time.LocalDate f48482h;

    /* JADX INFO: renamed from: i, reason: collision with root package name */
    public final java.time.LocalDate f48483i;

    /* JADX INFO: renamed from: j, reason: collision with root package name */
    public final java.util.ArrayList f48484j;

    public c(java.lang.String id2, java.lang.String userId, java.lang.String tripId, com.eightsleep.data_jetlag.enums.TravelDirection direction, boolean z10, Ga.s sVar, java.lang.String status, java.time.LocalDate startDate, java.time.LocalDate endDate, java.util.ArrayList arrayList) {
        kotlin.jvm.internal.l.j(id2, "id");
        kotlin.jvm.internal.l.j(userId, "userId");
        kotlin.jvm.internal.l.j(tripId, "tripId");
        kotlin.jvm.internal.l.j(direction, "direction");
        kotlin.jvm.internal.l.j(status, "status");
        kotlin.jvm.internal.l.j(startDate, "startDate");
        kotlin.jvm.internal.l.j(endDate, "endDate");
        this.f48475a = id2;
        this.f48476b = userId;
        this.f48477c = tripId;
        this.f48478d = direction;
        this.f48479e = z10;
        this.f48480f = sVar;
        this.f48481g = status;
        this.f48482h = startDate;
        this.f48483i = endDate;
        this.f48484j = arrayList;
    }

    public final com.eightsleep.data_jetlag.enums.JetLagPlanTaskPhase a() {
        java.lang.Object next;
        java.util.Iterator it = this.f48484j.iterator();
        do {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
        } while (!kotlin.jvm.internal.l.e(((p161gc.e) next).k, java.time.LocalDate.now()));
        p161gc.e eVar = (p161gc.e) next;
        if (eVar != null) {
            return eVar.f48491e;
        }
        return null;
    }

    public final boolean equals(java.lang.Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p161gc.c)) {
            return false;
        }
        p161gc.c cVar = (p161gc.c) obj;
        return kotlin.jvm.internal.l.e(this.f48475a, cVar.f48475a) && kotlin.jvm.internal.l.e(this.f48476b, cVar.f48476b) && kotlin.jvm.internal.l.e(this.f48477c, cVar.f48477c) && this.f48478d == cVar.f48478d && this.f48479e == cVar.f48479e && this.f48480f.equals(cVar.f48480f) && kotlin.jvm.internal.l.e(this.f48481g, cVar.f48481g) && kotlin.jvm.internal.l.e(this.f48482h, cVar.f48482h) && kotlin.jvm.internal.l.e(this.f48483i, cVar.f48483i) && this.f48484j.equals(cVar.f48484j);
    }

    public final int hashCode() {
        return this.f48484j.hashCode() + Rp.a.e(this.f48483i, Rp.a.e(this.f48482h, androidx.fragment.app.AbstractC2375d0.a(p222j.m.b(this.f48480f, p417r4.K.f((this.f48478d.hashCode() + androidx.fragment.app.AbstractC2375d0.a(androidx.fragment.app.AbstractC2375d0.a(this.f48475a.hashCode() * 31, 31, this.f48476b), 31, this.f48477c)) * 31, 31, this.f48479e), 31), 31, this.f48481g), 31), 31);
    }

    public final java.lang.String toString() {
        java.lang.StringBuilder sb2 = new java.lang.StringBuilder("JetLagPlan(id=");
        sb2.append(this.f48475a);
        sb2.append(", userId=");
        sb2.append(this.f48476b);
        sb2.append(", tripId=");
        sb2.append(this.f48477c);
        sb2.append(", direction=");
        sb2.append(this.f48478d);
        sb2.append(", supplementsEnabled=");
        sb2.append(this.f48479e);
        sb2.append(", createdAt=");
        sb2.append(this.f48480f);
        sb2.append(", status=");
        sb2.append(this.f48481g);
        sb2.append(", startDate=");
        sb2.append(this.f48482h);
        sb2.append(", endDate=");
        sb2.append(this.f48483i);
        sb2.append(", tasks=");
        return p222j.m.m(")", sb2, this.f48484j);
    }
}
