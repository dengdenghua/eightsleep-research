.class public final LGa/s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# static fields
.field public static final c:LGa/s;

.field public static final d:LGa/s;

.field public static final e:LGa/s;


# instance fields
.field public final a:Ljava/time/Instant;

.field public final b:Lcom/eightsleep/data_core/enums/ClockSystem;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    sget-object v0, LGa/f;->e:Lcom/eightsleep/data_core/enums/MeasurementSystem;

    sget-object v0, LGa/f;->f:Lcom/eightsleep/data_core/enums/ClockSystem;

    const-string v1, "clockSystem"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, LGa/s;

    sget-object v2, Ljava/time/Instant;->MIN:Ljava/time/Instant;

    const-string v3, "MIN"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v1, v2, v0}, LGa/s;-><init>(Ljava/time/Instant;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    sput-object v1, LGa/s;->c:LGa/s;

    new-instance v1, LGa/s;

    sget-object v2, Ljava/time/Instant;->MAX:Ljava/time/Instant;

    const-string v3, "MAX"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v1, v2, v0}, LGa/s;-><init>(Ljava/time/Instant;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    sput-object v1, LGa/s;->d:LGa/s;

    new-instance v1, LGa/s;

    sget-object v2, Ljava/time/Instant;->EPOCH:Ljava/time/Instant;

    const-string v3, "EPOCH"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v1, v2, v0}, LGa/s;-><init>(Ljava/time/Instant;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    sput-object v1, LGa/s;->e:LGa/s;

    return-void
.end method

.method public constructor <init>(Lcom/eightsleep/data_core/enums/ClockSystem;Ljava/lang/String;)V
    .locals 3

    const-string v0, "time24"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "clockSystem"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    invoke-static {}, Ljava/time/ZoneId;->systemDefault()Ljava/time/ZoneId;

    move-result-object v0

    .line 23
    const-string v1, "zoneId"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    invoke-static {p2}, LYa/d;->l(Ljava/lang/String;)J

    move-result-wide v1

    .line 25
    invoke-static {}, Ljava/time/ZoneId;->systemDefault()Ljava/time/ZoneId;

    move-result-object p2

    .line 26
    invoke-static {v1, v2, p2}, LYa/d;->g(JLjava/time/ZoneId;)Ljava/time/LocalDateTime;

    move-result-object p2

    .line 27
    invoke-virtual {p2, v0}, Ljava/time/LocalDateTime;->atZone(Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    move-result-object p2

    invoke-interface {p2}, Ljava/time/chrono/ChronoZonedDateTime;->toInstant()Ljava/time/Instant;

    move-result-object p2

    const-string v0, "toInstant(...)"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    invoke-direct {p0, p2, p1}, LGa/s;-><init>(Ljava/time/Instant;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, LGa/f;->f:Lcom/eightsleep/data_core/enums/ClockSystem;

    .line 2
    invoke-direct {p0, v0, p1}, LGa/s;-><init>(Lcom/eightsleep/data_core/enums/ClockSystem;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/time/Instant;)V
    .locals 1

    .line 3
    sget-object v0, LGa/f;->f:Lcom/eightsleep/data_core/enums/ClockSystem;

    .line 4
    invoke-direct {p0, p1, v0}, LGa/s;-><init>(Ljava/time/Instant;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    return-void
.end method

.method public constructor <init>(Ljava/time/Instant;Lcom/eightsleep/data_core/enums/ClockSystem;)V
    .locals 1

    const-string v0, "instant"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "clockSystem"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, LGa/s;->a:Ljava/time/Instant;

    .line 13
    iput-object p2, p0, LGa/s;->b:Lcom/eightsleep/data_core/enums/ClockSystem;

    return-void
.end method

.method public constructor <init>(Ljava/time/LocalDate;)V
    .locals 1

    .line 5
    sget-object v0, LGa/f;->f:Lcom/eightsleep/data_core/enums/ClockSystem;

    .line 6
    invoke-direct {p0, p1, v0}, LGa/s;-><init>(Ljava/time/LocalDate;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    return-void
.end method

.method public constructor <init>(Ljava/time/LocalDate;Lcom/eightsleep/data_core/enums/ClockSystem;)V
    .locals 2

    const-string v0, "localDate"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "clockSystem"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    invoke-static {}, Ljava/time/ZoneId;->systemDefault()Ljava/time/ZoneId;

    move-result-object v0

    .line 15
    const-string v1, "zoneId"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    invoke-virtual {p1, v0}, Ljava/time/LocalDate;->atStartOfDay(Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    move-result-object p1

    invoke-interface {p1}, Ljava/time/chrono/ChronoZonedDateTime;->toInstant()Ljava/time/Instant;

    move-result-object p1

    const-string v0, "toInstant(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    invoke-direct {p0, p1, p2}, LGa/s;-><init>(Ljava/time/Instant;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    return-void
.end method

.method public constructor <init>(Ljava/time/LocalDateTime;)V
    .locals 1

    .line 7
    sget-object v0, LGa/f;->f:Lcom/eightsleep/data_core/enums/ClockSystem;

    .line 8
    invoke-direct {p0, p1, v0}, LGa/s;-><init>(Ljava/time/LocalDateTime;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    return-void
.end method

.method public constructor <init>(Ljava/time/LocalDateTime;Lcom/eightsleep/data_core/enums/ClockSystem;)V
    .locals 2

    const-string v0, "clockSystem"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    invoke-static {}, Ljava/time/ZoneId;->systemDefault()Ljava/time/ZoneId;

    move-result-object v0

    .line 19
    const-string v1, "zone"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    invoke-virtual {p1, v0}, Ljava/time/LocalDateTime;->atZone(Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    move-result-object p1

    invoke-interface {p1}, Ljava/time/chrono/ChronoZonedDateTime;->toInstant()Ljava/time/Instant;

    move-result-object p1

    const-string v0, "toInstant(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    invoke-direct {p0, p1, p2}, LGa/s;-><init>(Ljava/time/Instant;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    return-void
.end method

.method public constructor <init>(Ljava/time/LocalTime;)V
    .locals 1

    .line 9
    sget-object v0, LGa/f;->f:Lcom/eightsleep/data_core/enums/ClockSystem;

    .line 10
    invoke-direct {p0, p1, v0}, LGa/s;-><init>(Ljava/time/LocalTime;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    return-void
.end method

.method public constructor <init>(Ljava/time/LocalTime;Lcom/eightsleep/data_core/enums/ClockSystem;)V
    .locals 2

    const-string v0, "localTime"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "clockSystem"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    invoke-static {}, Ljava/time/ZoneId;->systemDefault()Ljava/time/ZoneId;

    move-result-object v0

    .line 30
    const-string v1, "zoneId"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    .line 31
    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/time/LocalTime;->atDate(Ljava/time/LocalDate;)Ljava/time/LocalDateTime;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/time/LocalDateTime;->atZone(Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    move-result-object p1

    invoke-interface {p1}, Ljava/time/chrono/ChronoZonedDateTime;->toInstant()Ljava/time/Instant;

    move-result-object p1

    const-string v0, "toInstant(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    invoke-direct {p0, p1, p2}, LGa/s;-><init>(Ljava/time/Instant;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    return-void
.end method

.method public static b(LGa/s;Ljava/time/Instant;)LGa/s;
    .locals 1

    iget-object v0, p0, LGa/s;->b:Lcom/eightsleep/data_core/enums/ClockSystem;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string p0, "clockSystem"

    invoke-static {v0, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p0, LGa/s;

    invoke-direct {p0, p1, v0}, LGa/s;-><init>(Ljava/time/Instant;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    return-object p0
.end method

.method public static c(LGa/s;Ljava/time/LocalDateTime;)LGa/s;
    .locals 1

    iget-object v0, p0, LGa/s;->b:Lcom/eightsleep/data_core/enums/ClockSystem;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string p0, "localDateTime"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "clockSystem"

    invoke-static {v0, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p0, LGa/s;

    invoke-direct {p0, p1, v0}, LGa/s;-><init>(Ljava/time/LocalDateTime;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    return-object p0
.end method

.method public static d(LGa/s;Ljava/time/LocalTime;)LGa/s;
    .locals 1

    iget-object v0, p0, LGa/s;->b:Lcom/eightsleep/data_core/enums/ClockSystem;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string p0, "localTime"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "clockSystem"

    invoke-static {v0, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p0, LGa/s;

    invoke-direct {p0, p1, v0}, LGa/s;-><init>(Ljava/time/LocalTime;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    return-object p0
.end method

.method public static synthetic f(LGa/s;LGa/t;I)Ljava/lang/String;
    .locals 0

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    sget-object p1, LGa/t;->TIME:LGa/t;

    :cond_0
    invoke-static {}, Ljava/time/ZoneId;->systemDefault()Ljava/time/ZoneId;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, LGa/s;->e(LGa/t;Ljava/time/ZoneId;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static g(LGa/s;LGa/p;I)Ljava/lang/String;
    .locals 1

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    sget-object p1, LGa/p;->DATE:LGa/p;

    :cond_0
    invoke-static {}, Ljava/time/ZoneId;->systemDefault()Ljava/time/ZoneId;

    move-result-object p2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "format"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "tz"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, LGa/t;->TIME:LGa/t;

    invoke-virtual {p0, p1, v0, p2}, LGa/s;->h(LGa/g;LGa/t;Ljava/time/ZoneId;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i(LGa/s;LGa/q;Ljava/time/ZoneId;I)Ljava/lang/String;
    .locals 1

    and-int/lit8 v0, p3, 0x1

    if-eqz v0, :cond_0

    sget-object p1, LGa/q;->DATE_TIME:LGa/q;

    :cond_0
    sget-object v0, LGa/t;->TIME:LGa/t;

    and-int/lit8 p3, p3, 0x4

    if-eqz p3, :cond_1

    invoke-static {}, Ljava/time/ZoneId;->systemDefault()Ljava/time/ZoneId;

    move-result-object p2

    :cond_1
    invoke-virtual {p0, p1, v0, p2}, LGa/s;->h(LGa/g;LGa/t;Ljava/time/ZoneId;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static j(LGa/s;)Ljava/lang/String;
    .locals 2

    invoke-static {}, Ljava/time/ZoneId;->systemDefault()Ljava/time/ZoneId;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v1, "tz"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v1, LGa/t;->TIME_NO_AM_PM:LGa/t;

    invoke-virtual {p0, v1, v0}, LGa/s;->e(LGa/t;Ljava/time/ZoneId;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static r(LGa/s;Ljava/time/LocalTime;LGa/s;I)LGa/s;
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string p3, "localTime"

    invoke-static {p1, p3}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, LGa/s;->k()Ljava/time/LocalDate;

    move-result-object p3

    invoke-static {p3, p1}, Ljava/time/LocalDateTime;->of(Ljava/time/LocalDate;Ljava/time/LocalTime;)Ljava/time/LocalDateTime;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/l;->g(Ljava/lang/Object;)V

    invoke-static {p0, p1}, LGa/s;->c(LGa/s;Ljava/time/LocalDateTime;)LGa/s;

    move-result-object p0

    if-eqz p2, :cond_1

    iget-object p1, p0, LGa/s;->a:Ljava/time/Instant;

    iget-object p2, p2, LGa/s;->a:Ljava/time/Instant;

    invoke-virtual {p1, p2}, Ljava/time/Instant;->isAfter(Ljava/time/Instant;)Z

    move-result p1

    if-eqz p1, :cond_1

    const-wide/16 p1, 0x1

    invoke-static {p1, p2}, Ljava/time/Duration;->ofDays(J)Ljava/time/Duration;

    move-result-object p1

    invoke-virtual {p1}, Ljava/time/Duration;->toMillis()J

    move-result-wide p1

    invoke-virtual {p0, p1, p2}, LGa/s;->o(J)LGa/s;

    move-result-object p0

    :cond_1
    return-object p0
.end method


# virtual methods
.method public final a(LGa/s;)I
    .locals 1

    const-string v0, "other"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, LGa/s;->a:Ljava/time/Instant;

    iget-object p1, p1, LGa/s;->a:Ljava/time/Instant;

    invoke-virtual {p0, p1}, Ljava/time/Instant;->compareTo(Ljava/time/Instant;)I

    move-result p0

    return p0
.end method

.method public final bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    check-cast p1, LGa/s;

    invoke-virtual {p0, p1}, LGa/s;->a(LGa/s;)I

    move-result p0

    return p0
.end method

.method public final e(LGa/t;Ljava/time/ZoneId;)Ljava/lang/String;
    .locals 2

    const-string v0, "format"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "tz"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, LGa/r;->a:[I

    iget-object v1, p0, LGa/s;->b:Lcom/eightsleep/data_core/enums/ClockSystem;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    iget-object p0, p0, LGa/s;->a:Ljava/time/Instant;

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, LGa/t;->a()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, p2}, LYa/d;->a(Ljava/time/Instant;Ljava/lang/String;Ljava/time/ZoneId;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0

    :cond_1
    invoke-virtual {p1}, LGa/t;->b()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, p2}, LYa/d;->a(Ljava/time/Instant;Ljava/lang/String;Ljava/time/ZoneId;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, LGa/s;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, LGa/s;

    iget-object v1, p1, LGa/s;->a:Ljava/time/Instant;

    iget-object v3, p0, LGa/s;->a:Ljava/time/Instant;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object p0, p0, LGa/s;->b:Lcom/eightsleep/data_core/enums/ClockSystem;

    iget-object p1, p1, LGa/s;->b:Lcom/eightsleep/data_core/enums/ClockSystem;

    if-eq p0, p1, :cond_3

    return v2

    :cond_3
    return v0
.end method

.method public final h(LGa/g;LGa/t;Ljava/time/ZoneId;)Ljava/lang/String;
    .locals 1

    const-string v0, "format"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "timeFormat"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "tz"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, LGa/s;->a:Ljava/time/Instant;

    invoke-interface {p1}, LGa/g;->getFormat()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1, p3}, LYa/d;->a(Ljava/time/Instant;Ljava/lang/String;Ljava/time/ZoneId;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p2, p3}, LGa/s;->e(LGa/t;Ljava/time/ZoneId;)Ljava/lang/String;

    move-result-object p0

    const-string p2, "{time}"

    invoke-static {p1, p2, p0}, Llo/u;->a0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final hashCode()I
    .locals 1

    iget-object v0, p0, LGa/s;->a:Ljava/time/Instant;

    invoke-virtual {v0}, Ljava/time/Instant;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, LGa/s;->b:Lcom/eightsleep/data_core/enums/ClockSystem;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final k()Ljava/time/LocalDate;
    .locals 2

    const/4 v0, 0x2

    and-int/2addr v0, v0

    if-eqz v0, :cond_0

    invoke-static {}, Ljava/time/ZoneId;->systemDefault()Ljava/time/ZoneId;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "instant"

    iget-object p0, p0, LGa/s;->a:Ljava/time/Instant;

    invoke-static {p0, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "zoneId"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/time/Instant;->atZone(Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    move-result-object p0

    invoke-virtual {p0}, Ljava/time/ZonedDateTime;->toLocalDate()Ljava/time/LocalDate;

    move-result-object p0

    const-string v0, "toLocalDate(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public final l()Ljava/time/LocalTime;
    .locals 2

    invoke-static {}, Ljava/time/ZoneId;->systemDefault()Ljava/time/ZoneId;

    move-result-object v0

    const-string v1, "instant"

    iget-object p0, p0, LGa/s;->a:Ljava/time/Instant;

    invoke-static {p0, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "zoneId"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/time/Instant;->atZone(Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    move-result-object p0

    invoke-virtual {p0}, Ljava/time/ZonedDateTime;->toLocalTime()Ljava/time/LocalTime;

    move-result-object p0

    const-string v0, "toLocalTime(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public final m()Ljava/time/OffsetDateTime;
    .locals 2

    invoke-static {}, Ljava/time/ZoneId;->systemDefault()Ljava/time/ZoneId;

    move-result-object v0

    const-string v1, "instant"

    iget-object p0, p0, LGa/s;->a:Ljava/time/Instant;

    invoke-static {p0, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "zoneId"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/time/Instant;->atZone(Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    move-result-object p0

    invoke-virtual {p0}, Ljava/time/ZonedDateTime;->toOffsetDateTime()Ljava/time/OffsetDateTime;

    move-result-object p0

    const-string v0, "toOffsetDateTime(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public final n(Ljava/time/ZoneOffset;)LGa/s;
    .locals 2

    const-string v0, "offset"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, LGa/s;->k()Ljava/time/LocalDate;

    move-result-object v0

    invoke-virtual {p0}, LGa/s;->l()Ljava/time/LocalTime;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/time/LocalDate;->atTime(Ljava/time/LocalTime;)Ljava/time/LocalDateTime;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/time/chrono/ChronoLocalDateTime;->toInstant(Ljava/time/ZoneOffset;)Ljava/time/Instant;

    move-result-object p1

    const-string v0, "toInstant(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0, p1}, LGa/s;->b(LGa/s;Ljava/time/Instant;)LGa/s;

    move-result-object p0

    return-object p0
.end method

.method public final o(J)LGa/s;
    .locals 1

    iget-object v0, p0, LGa/s;->a:Ljava/time/Instant;

    invoke-virtual {v0, p1, p2}, Ljava/time/Instant;->minusMillis(J)Ljava/time/Instant;

    move-result-object p1

    const-string p2, "minusMillis(...)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0, p1}, LGa/s;->b(LGa/s;Ljava/time/Instant;)LGa/s;

    move-result-object p0

    return-object p0
.end method

.method public final p(Ljava/lang/Long;)J
    .locals 4

    iget-object p0, p0, LGa/s;->a:Ljava/time/Instant;

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Ljava/time/Instant;->toEpochMilli()J

    move-result-wide v0

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    cmp-long p1, v0, v2

    if-gez p1, :cond_0

    invoke-virtual {p0}, Ljava/time/Instant;->toEpochMilli()J

    move-result-wide p0

    const-wide/16 v0, 0x1

    invoke-static {v0, v1}, Ljava/time/Duration;->ofDays(J)Ljava/time/Duration;

    move-result-object v0

    invoke-virtual {v0}, Ljava/time/Duration;->toMillis()J

    move-result-wide v0

    add-long/2addr v0, p0

    return-wide v0

    :cond_0
    invoke-virtual {p0}, Ljava/time/Instant;->toEpochMilli()J

    move-result-wide p0

    return-wide p0
.end method

.method public final q(J)LGa/s;
    .locals 1

    iget-object v0, p0, LGa/s;->a:Ljava/time/Instant;

    invoke-virtual {v0, p1, p2}, Ljava/time/Instant;->plusMillis(J)Ljava/time/Instant;

    move-result-object p1

    const-string p2, "plusMillis(...)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0, p1}, LGa/s;->b(LGa/s;Ljava/time/Instant;)LGa/s;

    move-result-object p0

    return-object p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    const/4 v0, 0x7

    const/4 v1, 0x0

    invoke-static {p0, v1, v1, v0}, LGa/s;->i(LGa/s;LGa/q;Ljava/time/ZoneId;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
