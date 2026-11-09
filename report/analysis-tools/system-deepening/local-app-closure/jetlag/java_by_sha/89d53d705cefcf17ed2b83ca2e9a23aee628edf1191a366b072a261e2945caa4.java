package p283lc;

/* JADX INFO: loaded from: classes2.dex */
public final class d {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public final p283lc.a f57865a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public final java.util.ArrayList f57866b;

    public d(p283lc.a plan, java.util.ArrayList tasks) {
        kotlin.jvm.internal.l.j(plan, "plan");
        kotlin.jvm.internal.l.j(tasks, "tasks");
        this.f57865a = plan;
        this.f57866b = tasks;
    }

    public final p161gc.j a() {
        p283lc.a aVar = this.f57865a;
        java.lang.String str = aVar.f57838a;
        java.util.ArrayList<p283lc.c> arrayList = this.f57866b;
        java.util.ArrayList arrayList2 = new java.util.ArrayList(Im.t.z0(arrayList, 10));
        for (p283lc.c cVar : arrayList) {
            p161gc.d domain = cVar.f57864j.toDomain();
            arrayList2.add(new p161gc.k(cVar.f57855a, cVar.f57856b, cVar.f57857c, cVar.f57858d, cVar.f57859e, cVar.f57860f, cVar.f57861g, cVar.f57862h, cVar.f57863i, domain));
        }
        return new p161gc.j(str, aVar.f57839b, aVar.f57840c, aVar.f57841d, aVar.f57842e, aVar.f57843f, aVar.f57844g, aVar.f57845h, aVar.f57846i, arrayList2);
    }

    public final boolean equals(java.lang.Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p283lc.d)) {
            return false;
        }
        p283lc.d dVar = (p283lc.d) obj;
        return kotlin.jvm.internal.l.e(this.f57865a, dVar.f57865a) && kotlin.jvm.internal.l.e(this.f57866b, dVar.f57866b);
    }

    public final int hashCode() {
        return this.f57866b.hashCode() + (this.f57865a.hashCode() * 31);
    }

    public final java.lang.String toString() {
        java.lang.StringBuilder sb2 = new java.lang.StringBuilder("JetLagPlanWithTasksEntity(plan=");
        sb2.append(this.f57865a);
        sb2.append(", tasks=");
        return p222j.m.m(")", sb2, this.f57866b);
    }
}
