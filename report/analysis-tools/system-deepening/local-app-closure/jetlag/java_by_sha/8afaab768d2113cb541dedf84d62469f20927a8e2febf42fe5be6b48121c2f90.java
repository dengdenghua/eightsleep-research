package p161gc;

/* JADX INFO: loaded from: classes2.dex */
public final class q {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public final java.lang.String f48574a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public final java.lang.String f48575b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public final java.time.ZoneOffset f48576c;

    public q(java.lang.String name, java.lang.String str, java.time.ZoneOffset timezoneOffset) {
        kotlin.jvm.internal.l.j(name, "name");
        kotlin.jvm.internal.l.j(timezoneOffset, "timezoneOffset");
        this.f48574a = name;
        this.f48575b = str;
        this.f48576c = timezoneOffset;
    }

    public final boolean equals(java.lang.Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p161gc.q)) {
            return false;
        }
        p161gc.q qVar = (p161gc.q) obj;
        return kotlin.jvm.internal.l.e(this.f48574a, qVar.f48574a) && kotlin.jvm.internal.l.e(this.f48575b, qVar.f48575b) && kotlin.jvm.internal.l.e(this.f48576c, qVar.f48576c);
    }

    public final int hashCode() {
        int iHashCode = this.f48574a.hashCode() * 31;
        java.lang.String str = this.f48575b;
        return this.f48576c.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final java.lang.String toString() {
        return "TripLocation(name=" + this.f48574a + ", airportCode=" + this.f48575b + ", timezoneOffset=" + this.f48576c + ")";
    }
}
