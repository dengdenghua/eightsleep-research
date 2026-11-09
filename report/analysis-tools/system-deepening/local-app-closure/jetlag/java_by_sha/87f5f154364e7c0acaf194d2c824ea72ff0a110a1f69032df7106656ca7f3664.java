package Ga;

/* JADX INFO: loaded from: classes2.dex */
public final class s implements java.lang.Comparable {

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public static final Ga.s f12085c;

    /* JADX INFO: renamed from: d, reason: collision with root package name */
    public static final Ga.s f12086d;

    /* JADX INFO: renamed from: e, reason: collision with root package name */
    public static final Ga.s f12087e;

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public final java.time.Instant f12088a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public final com.eightsleep.data_core.enums.ClockSystem f12089b;

    static {
        com.eightsleep.data_core.enums.MeasurementSystem measurementSystem = Ga.f.f12057e;
        com.eightsleep.data_core.enums.ClockSystem clockSystem = Ga.f.f12058f;
        kotlin.jvm.internal.l.j(clockSystem, "clockSystem");
        java.time.Instant MIN = java.time.Instant.MIN;
        kotlin.jvm.internal.l.i(MIN, "MIN");
        f12085c = new Ga.s(MIN, clockSystem);
        java.time.Instant MAX = java.time.Instant.MAX;
        kotlin.jvm.internal.l.i(MAX, "MAX");
        f12086d = new Ga.s(MAX, clockSystem);
        java.time.Instant EPOCH = java.time.Instant.EPOCH;
        kotlin.jvm.internal.l.i(EPOCH, "EPOCH");
        f12087e = new Ga.s(EPOCH, clockSystem);
    }

    public s(java.lang.String str) {
        this(Ga.f.f12058f, str);
    }

    public static Ga.s b(Ga.s sVar, java.time.Instant instant) {
        com.eightsleep.data_core.enums.ClockSystem clockSystem = sVar.f12089b;
        sVar.getClass();
        kotlin.jvm.internal.l.j(clockSystem, "clockSystem");
        return new Ga.s(instant, clockSystem);
    }

    public static Ga.s c(Ga.s sVar, java.time.LocalDateTime localDateTime) {
        com.eightsleep.data_core.enums.ClockSystem clockSystem = sVar.f12089b;
        sVar.getClass();
        kotlin.jvm.internal.l.j(localDateTime, "localDateTime");
        kotlin.jvm.internal.l.j(clockSystem, "clockSystem");
        return new Ga.s(localDateTime, clockSystem);
    }

    public static Ga.s d(Ga.s sVar, java.time.LocalTime localTime) {
        com.eightsleep.data_core.enums.ClockSystem clockSystem = sVar.f12089b;
        sVar.getClass();
        kotlin.jvm.internal.l.j(localTime, "localTime");
        kotlin.jvm.internal.l.j(clockSystem, "clockSystem");
        return new Ga.s(localTime, clockSystem);
    }

    public static /* synthetic */ java.lang.String f(Ga.s sVar, Ga.t tVar, int i10) {
        if ((i10 & 1) != 0) {
            tVar = Ga.t.TIME;
        }
        return sVar.e(tVar, java.time.ZoneId.systemDefault());
    }

    public static java.lang.String g(Ga.s sVar, Ga.p format, int i10) {
        if ((i10 & 1) != 0) {
            format = Ga.p.DATE;
        }
        java.time.ZoneId tz = java.time.ZoneId.systemDefault();
        sVar.getClass();
        kotlin.jvm.internal.l.j(format, "format");
        kotlin.jvm.internal.l.j(tz, "tz");
        return sVar.h(format, Ga.t.TIME, tz);
    }

    public static /* synthetic */ java.lang.String i(Ga.s sVar, Ga.q qVar, java.time.ZoneId zoneId, int i10) {
        if ((i10 & 1) != 0) {
            qVar = Ga.q.DATE_TIME;
        }
        Ga.t tVar = Ga.t.TIME;
        if ((i10 & 4) != 0) {
            zoneId = java.time.ZoneId.systemDefault();
        }
        return sVar.h(qVar, tVar, zoneId);
    }

    public static java.lang.String j(Ga.s sVar) {
        java.time.ZoneId tz = java.time.ZoneId.systemDefault();
        sVar.getClass();
        kotlin.jvm.internal.l.j(tz, "tz");
        return sVar.e(Ga.t.TIME_NO_AM_PM, tz);
    }

    public static Ga.s r(Ga.s sVar, java.time.LocalTime localTime, Ga.s sVar2, int i10) {
        if ((i10 & 2) != 0) {
            sVar2 = null;
        }
        sVar.getClass();
        kotlin.jvm.internal.l.j(localTime, "localTime");
        java.time.LocalDateTime localDateTimeOf = java.time.LocalDateTime.of(sVar.k(), localTime);
        kotlin.jvm.internal.l.g(localDateTimeOf);
        Ga.s sVarC = c(sVar, localDateTimeOf);
        return (sVar2 == null || !sVarC.f12088a.isAfter(sVar2.f12088a)) ? sVarC : sVarC.o(java.time.Duration.ofDays(1L).toMillis());
    }

    public final int a(Ga.s other) {
        kotlin.jvm.internal.l.j(other, "other");
        return this.f12088a.compareTo(other.f12088a);
    }

    @Override // java.lang.Comparable
    public final /* bridge */ /* synthetic */ int compareTo(java.lang.Object obj) {
        return a((Ga.s) obj);
    }

    public final java.lang.String e(Ga.t format, java.time.ZoneId tz) {
        kotlin.jvm.internal.l.j(format, "format");
        kotlin.jvm.internal.l.j(tz, "tz");
        int i10 = Ga.r.f12084a[this.f12089b.ordinal()];
        java.time.Instant instant = this.f12088a;
        if (i10 == 1) {
            return Ya.C2102d.a(instant, format.b(), tz);
        }
        if (i10 == 2) {
            return Ya.C2102d.a(instant, format.a(), tz);
        }
        throw new kotlin.NoWhenBranchMatchedException();
    }

    public final boolean equals(java.lang.Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Ga.s)) {
            return false;
        }
        Ga.s sVar = (Ga.s) obj;
        return kotlin.jvm.internal.l.e(this.f12088a, sVar.f12088a) && this.f12089b == sVar.f12089b;
    }

    public final java.lang.String h(Ga.g format, Ga.t timeFormat, java.time.ZoneId tz) {
        kotlin.jvm.internal.l.j(format, "format");
        kotlin.jvm.internal.l.j(timeFormat, "timeFormat");
        kotlin.jvm.internal.l.j(tz, "tz");
        return p294lo.u.a0(Ya.C2102d.a(this.f12088a, format.getFormat(), tz), "{time}", e(timeFormat, tz));
    }

    public final int hashCode() {
        return this.f12089b.hashCode() + (this.f12088a.hashCode() * 31);
    }

    public final java.time.LocalDate k() {
        java.time.ZoneId zoneId = (2 & 2) != 0 ? java.time.ZoneId.systemDefault() : null;
        java.time.Instant instant = this.f12088a;
        kotlin.jvm.internal.l.j(instant, "instant");
        kotlin.jvm.internal.l.j(zoneId, "zoneId");
        java.time.LocalDate localDate = instant.atZone(zoneId).toLocalDate();
        kotlin.jvm.internal.l.i(localDate, "toLocalDate(...)");
        return localDate;
    }

    public final java.time.LocalTime l() {
        java.time.ZoneId zoneId = java.time.ZoneId.systemDefault();
        java.time.Instant instant = this.f12088a;
        kotlin.jvm.internal.l.j(instant, "instant");
        kotlin.jvm.internal.l.j(zoneId, "zoneId");
        java.time.LocalTime localTime = instant.atZone(zoneId).toLocalTime();
        kotlin.jvm.internal.l.i(localTime, "toLocalTime(...)");
        return localTime;
    }

    public final java.time.OffsetDateTime m() {
        java.time.ZoneId zoneId = java.time.ZoneId.systemDefault();
        java.time.Instant instant = this.f12088a;
        kotlin.jvm.internal.l.j(instant, "instant");
        kotlin.jvm.internal.l.j(zoneId, "zoneId");
        java.time.OffsetDateTime offsetDateTime = instant.atZone(zoneId).toOffsetDateTime();
        kotlin.jvm.internal.l.i(offsetDateTime, "toOffsetDateTime(...)");
        return offsetDateTime;
    }

    public final Ga.s n(java.time.ZoneOffset offset) {
        kotlin.jvm.internal.l.j(offset, "offset");
        java.time.Instant instant = k().atTime(l()).toInstant(offset);
        kotlin.jvm.internal.l.i(instant, "toInstant(...)");
        return b(this, instant);
    }

    public final Ga.s o(long j5) {
        java.time.Instant instantMinusMillis = this.f12088a.minusMillis(j5);
        kotlin.jvm.internal.l.i(instantMinusMillis, "minusMillis(...)");
        return b(this, instantMinusMillis);
    }

    public final long p(java.lang.Long l) {
        java.time.Instant instant = this.f12088a;
        if (l == null || instant.toEpochMilli() >= l.longValue()) {
            return instant.toEpochMilli();
        }
        return java.time.Duration.ofDays(1L).toMillis() + instant.toEpochMilli();
    }

    public final Ga.s q(long j5) {
        java.time.Instant instantPlusMillis = this.f12088a.plusMillis(j5);
        kotlin.jvm.internal.l.i(instantPlusMillis, "plusMillis(...)");
        return b(this, instantPlusMillis);
    }

    public final java.lang.String toString() {
        return i(this, null, null, 7);
    }

    public s(java.time.Instant instant) {
        this(instant, Ga.f.f12058f);
    }

    public s(java.time.LocalDate localDate) {
        this(localDate, Ga.f.f12058f);
    }

    public s(java.time.LocalDateTime localDateTime) {
        this(localDateTime, Ga.f.f12058f);
    }

    public s(java.time.LocalTime localTime) {
        this(localTime, Ga.f.f12058f);
    }

    public s(java.time.Instant instant, com.eightsleep.data_core.enums.ClockSystem clockSystem) {
        kotlin.jvm.internal.l.j(instant, "instant");
        kotlin.jvm.internal.l.j(clockSystem, "clockSystem");
        this.f12088a = instant;
        this.f12089b = clockSystem;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public s(java.time.LocalDate localDate, com.eightsleep.data_core.enums.ClockSystem clockSystem) {
        kotlin.jvm.internal.l.j(localDate, "localDate");
        kotlin.jvm.internal.l.j(clockSystem, "clockSystem");
        java.time.ZoneId zoneId = java.time.ZoneId.systemDefault();
        kotlin.jvm.internal.l.j(zoneId, "zoneId");
        java.time.Instant instant = localDate.atStartOfDay(zoneId).toInstant();
        kotlin.jvm.internal.l.i(instant, "toInstant(...)");
        this(instant, clockSystem);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public s(java.time.LocalDateTime localDateTime, com.eightsleep.data_core.enums.ClockSystem clockSystem) {
        kotlin.jvm.internal.l.j(clockSystem, "clockSystem");
        java.time.ZoneId zone = java.time.ZoneId.systemDefault();
        kotlin.jvm.internal.l.j(zone, "zone");
        java.time.Instant instant = localDateTime.atZone(zone).toInstant();
        kotlin.jvm.internal.l.i(instant, "toInstant(...)");
        this(instant, clockSystem);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public s(com.eightsleep.data_core.enums.ClockSystem clockSystem, java.lang.String time24) {
        kotlin.jvm.internal.l.j(time24, "time24");
        kotlin.jvm.internal.l.j(clockSystem, "clockSystem");
        java.time.ZoneId zoneId = java.time.ZoneId.systemDefault();
        kotlin.jvm.internal.l.j(zoneId, "zoneId");
        java.time.Instant instant = Ya.C2102d.g(Ya.C2102d.l(time24), java.time.ZoneId.systemDefault()).atZone(zoneId).toInstant();
        kotlin.jvm.internal.l.i(instant, "toInstant(...)");
        this(instant, clockSystem);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public s(java.time.LocalTime localTime, com.eightsleep.data_core.enums.ClockSystem clockSystem) {
        kotlin.jvm.internal.l.j(localTime, "localTime");
        kotlin.jvm.internal.l.j(clockSystem, "clockSystem");
        java.time.ZoneId zoneId = java.time.ZoneId.systemDefault();
        kotlin.jvm.internal.l.j(zoneId, "zoneId");
        java.time.Instant instant = localTime.atDate(java.time.LocalDate.now()).atZone(zoneId).toInstant();
        kotlin.jvm.internal.l.i(instant, "toInstant(...)");
        this(instant, clockSystem);
    }
}
