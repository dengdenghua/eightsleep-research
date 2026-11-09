package p161gc;

/* JADX INFO: loaded from: classes2.dex */
public final class j {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public final java.lang.String f48522a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public final java.lang.String f48523b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public final java.lang.String f48524c;

    /* JADX INFO: renamed from: d, reason: collision with root package name */
    public final com.eightsleep.data_jetlag.enums.TravelDirection f48525d;

    /* JADX INFO: renamed from: e, reason: collision with root package name */
    public final boolean f48526e;

    /* JADX INFO: renamed from: f, reason: collision with root package name */
    public final java.time.Instant f48527f;

    /* JADX INFO: renamed from: g, reason: collision with root package name */
    public final java.lang.String f48528g;

    /* JADX INFO: renamed from: h, reason: collision with root package name */
    public final java.time.LocalDate f48529h;

    /* JADX INFO: renamed from: i, reason: collision with root package name */
    public final java.time.LocalDate f48530i;

    /* JADX INFO: renamed from: j, reason: collision with root package name */
    public final java.util.ArrayList f48531j;

    public j(java.lang.String id2, java.lang.String userId, java.lang.String tripId, com.eightsleep.data_jetlag.enums.TravelDirection direction, boolean z10, java.time.Instant createdAt, java.lang.String status, java.time.LocalDate startDate, java.time.LocalDate endDate, java.util.ArrayList arrayList) {
        kotlin.jvm.internal.l.j(id2, "id");
        kotlin.jvm.internal.l.j(userId, "userId");
        kotlin.jvm.internal.l.j(tripId, "tripId");
        kotlin.jvm.internal.l.j(direction, "direction");
        kotlin.jvm.internal.l.j(createdAt, "createdAt");
        kotlin.jvm.internal.l.j(status, "status");
        kotlin.jvm.internal.l.j(startDate, "startDate");
        kotlin.jvm.internal.l.j(endDate, "endDate");
        this.f48522a = id2;
        this.f48523b = userId;
        this.f48524c = tripId;
        this.f48525d = direction;
        this.f48526e = z10;
        this.f48527f = createdAt;
        this.f48528g = status;
        this.f48529h = startDate;
        this.f48530i = endDate;
        this.f48531j = arrayList;
    }

    public final p161gc.c a(Ga.f displaySettings) {
        kotlin.jvm.internal.l.j(displaySettings, "displaySettings");
        com.eightsleep.data_core.enums.ClockSystem clockSystem = displaySettings.f12062d;
        Ga.s sVar = new Ga.s(this.f48527f, clockSystem);
        java.util.ArrayList<p161gc.k> arrayList = this.f48531j;
        java.util.ArrayList arrayList2 = new java.util.ArrayList(Im.t.z0(arrayList, 10));
        for (p161gc.k kVar : arrayList) {
            kVar.getClass();
            arrayList2.add(new p161gc.e(kVar.f48532a, kVar.f48533b, kVar.f48534c, kVar.f48535d, kVar.f48536e, new Ga.s(kVar.f48537f, clockSystem), kVar.f48538g, kVar.f48539h, kVar.f48540i, kVar.f48541j));
        }
        return new p161gc.c(this.f48522a, this.f48523b, this.f48524c, this.f48525d, this.f48526e, sVar, this.f48528g, this.f48529h, this.f48530i, arrayList2);
    }

    public final boolean equals(java.lang.Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p161gc.j)) {
            return false;
        }
        p161gc.j jVar = (p161gc.j) obj;
        return kotlin.jvm.internal.l.e(this.f48522a, jVar.f48522a) && kotlin.jvm.internal.l.e(this.f48523b, jVar.f48523b) && kotlin.jvm.internal.l.e(this.f48524c, jVar.f48524c) && this.f48525d == jVar.f48525d && this.f48526e == jVar.f48526e && kotlin.jvm.internal.l.e(this.f48527f, jVar.f48527f) && kotlin.jvm.internal.l.e(this.f48528g, jVar.f48528g) && kotlin.jvm.internal.l.e(this.f48529h, jVar.f48529h) && kotlin.jvm.internal.l.e(this.f48530i, jVar.f48530i) && this.f48531j.equals(jVar.f48531j);
    }

    public final int hashCode() {
        return this.f48531j.hashCode() + Rp.a.e(this.f48530i, Rp.a.e(this.f48529h, androidx.fragment.app.AbstractC2375d0.a(Rp.a.d(this.f48527f, p417r4.K.f((this.f48525d.hashCode() + androidx.fragment.app.AbstractC2375d0.a(androidx.fragment.app.AbstractC2375d0.a(this.f48522a.hashCode() * 31, 31, this.f48523b), 31, this.f48524c)) * 31, 31, this.f48526e), 31), 31, this.f48528g), 31), 31);
    }

    public final java.lang.String toString() {
        java.lang.StringBuilder sb2 = new java.lang.StringBuilder("RawJetLagPlan(id=");
        sb2.append(this.f48522a);
        sb2.append(", userId=");
        sb2.append(this.f48523b);
        sb2.append(", tripId=");
        sb2.append(this.f48524c);
        sb2.append(", direction=");
        sb2.append(this.f48525d);
        sb2.append(", supplementsEnabled=");
        sb2.append(this.f48526e);
        sb2.append(", createdAt=");
        sb2.append(this.f48527f);
        sb2.append(", status=");
        sb2.append(this.f48528g);
        sb2.append(", startDate=");
        sb2.append(this.f48529h);
        sb2.append(", endDate=");
        sb2.append(this.f48530i);
        sb2.append(", tasks=");
        return p222j.m.m(")", sb2, this.f48531j);
    }
}
