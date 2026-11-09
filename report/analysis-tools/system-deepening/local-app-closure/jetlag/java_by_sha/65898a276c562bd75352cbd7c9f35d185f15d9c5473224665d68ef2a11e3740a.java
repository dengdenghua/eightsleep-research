package p161gc;

/* JADX INFO: loaded from: classes2.dex */
public final class k {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public final java.lang.String f48532a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public final java.lang.String f48533b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public final java.lang.String f48534c;

    /* JADX INFO: renamed from: d, reason: collision with root package name */
    public final com.eightsleep.data_jetlag.enums.JetLagTaskType f48535d;

    /* JADX INFO: renamed from: e, reason: collision with root package name */
    public final com.eightsleep.data_jetlag.enums.JetLagPlanTaskPhase f48536e;

    /* JADX INFO: renamed from: f, reason: collision with root package name */
    public final java.time.Instant f48537f;

    /* JADX INFO: renamed from: g, reason: collision with root package name */
    public final java.lang.String f48538g;

    /* JADX INFO: renamed from: h, reason: collision with root package name */
    public final java.lang.String f48539h;

    /* JADX INFO: renamed from: i, reason: collision with root package name */
    public final com.eightsleep.data_jetlag.enums.JetLagPlanTaskStatus f48540i;

    /* JADX INFO: renamed from: j, reason: collision with root package name */
    public final p161gc.d f48541j;

    public k(java.lang.String id2, java.lang.String planId, java.lang.String name, com.eightsleep.data_jetlag.enums.JetLagTaskType type, com.eightsleep.data_jetlag.enums.JetLagPlanTaskPhase phase, java.time.Instant scheduledAt, java.lang.String timezoneId, java.lang.String instructions, com.eightsleep.data_jetlag.enums.JetLagPlanTaskStatus status, p161gc.d metadata) {
        kotlin.jvm.internal.l.j(id2, "id");
        kotlin.jvm.internal.l.j(planId, "planId");
        kotlin.jvm.internal.l.j(name, "name");
        kotlin.jvm.internal.l.j(type, "type");
        kotlin.jvm.internal.l.j(phase, "phase");
        kotlin.jvm.internal.l.j(scheduledAt, "scheduledAt");
        kotlin.jvm.internal.l.j(timezoneId, "timezoneId");
        kotlin.jvm.internal.l.j(instructions, "instructions");
        kotlin.jvm.internal.l.j(status, "status");
        kotlin.jvm.internal.l.j(metadata, "metadata");
        this.f48532a = id2;
        this.f48533b = planId;
        this.f48534c = name;
        this.f48535d = type;
        this.f48536e = phase;
        this.f48537f = scheduledAt;
        this.f48538g = timezoneId;
        this.f48539h = instructions;
        this.f48540i = status;
        this.f48541j = metadata;
    }

    public final boolean equals(java.lang.Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p161gc.k)) {
            return false;
        }
        p161gc.k kVar = (p161gc.k) obj;
        return kotlin.jvm.internal.l.e(this.f48532a, kVar.f48532a) && kotlin.jvm.internal.l.e(this.f48533b, kVar.f48533b) && kotlin.jvm.internal.l.e(this.f48534c, kVar.f48534c) && this.f48535d == kVar.f48535d && this.f48536e == kVar.f48536e && kotlin.jvm.internal.l.e(this.f48537f, kVar.f48537f) && kotlin.jvm.internal.l.e(this.f48538g, kVar.f48538g) && kotlin.jvm.internal.l.e(this.f48539h, kVar.f48539h) && this.f48540i == kVar.f48540i && kotlin.jvm.internal.l.e(this.f48541j, kVar.f48541j);
    }

    public final int hashCode() {
        return this.f48541j.hashCode() + ((this.f48540i.hashCode() + androidx.fragment.app.AbstractC2375d0.a(androidx.fragment.app.AbstractC2375d0.a(Rp.a.d(this.f48537f, (this.f48536e.hashCode() + ((this.f48535d.hashCode() + androidx.fragment.app.AbstractC2375d0.a(androidx.fragment.app.AbstractC2375d0.a(this.f48532a.hashCode() * 31, 31, this.f48533b), 31, this.f48534c)) * 31)) * 31, 31), 31, this.f48538g), 31, this.f48539h)) * 31);
    }

    public final java.lang.String toString() {
        return "RawJetLagPlanTask(id=" + this.f48532a + ", planId=" + this.f48533b + ", name=" + this.f48534c + ", type=" + this.f48535d + ", phase=" + this.f48536e + ", scheduledAt=" + this.f48537f + ", timezoneId=" + this.f48538g + ", instructions=" + this.f48539h + ", status=" + this.f48540i + ", metadata=" + this.f48541j + ")";
    }
}
