.class public final Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LNa/b;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LNa/b;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00ba\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B1\u0008\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\u0008\u0012\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0019\u0010\u0013\u001a\u0004\u0018\u00010\u00102\u0006\u0010\u000f\u001a\u00020\u000eH\u0000\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u001f\u0010\u0018\u001a\u00020\u00152\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0014\u001a\u00020\u0010H\u0000\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J$\u0010\u001d\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00100\u001a0\u00192\u0006\u0010\u000f\u001a\u00020\u000eH\u0080@\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ!\u0010\u001f\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u001e0\u001a0\u00192\u0006\u0010\u000f\u001a\u00020\u000e\u00a2\u0006\u0004\u0008\u001f\u0010 J!\u0010!\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00100\u001a0\u00192\u0006\u0010\u000f\u001a\u00020\u000e\u00a2\u0006\u0004\u0008!\u0010 J;\u0010(\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00150\u001a0\u00192\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010#\u001a\u00020\"2\u0006\u0010%\u001a\u00020$2\u0008\u0008\u0002\u0010\'\u001a\u00020&\u00a2\u0006\u0004\u0008(\u0010)J!\u0010+\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0\u001a0\u00192\u0006\u0010\u000f\u001a\u00020\u000e\u00a2\u0006\u0004\u0008+\u0010 J!\u0010,\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00150\u001a0\u00192\u0006\u0010\u000f\u001a\u00020\u000e\u00a2\u0006\u0004\u0008,\u0010 J!\u0010-\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00150\u001a0\u00192\u0006\u0010\u000f\u001a\u00020\u000e\u00a2\u0006\u0004\u0008-\u0010 J!\u0010.\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00150\u001a0\u00192\u0006\u0010\u000f\u001a\u00020\u000e\u00a2\u0006\u0004\u0008.\u0010 J#\u00100\u001a\u0010\u0012\u000c\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010/0\u001a0\u00192\u0006\u0010\u000f\u001a\u00020\u000e\u00a2\u0006\u0004\u00080\u0010 J)\u00102\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00150\u001a0\u00192\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u00101\u001a\u00020\u000e\u00a2\u0006\u0004\u00082\u00103J!\u00104\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00150\u001a0\u00192\u0006\u0010\u000f\u001a\u00020\u000e\u00a2\u0006\u0004\u00084\u0010 J-\u00108\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002070\u001a0\u00192\u0006\u0010\u000f\u001a\u00020\u000e2\n\u0008\u0002\u00106\u001a\u0004\u0018\u000105\u00a2\u0006\u0004\u00088\u00109J#\u0010;\u001a\u0010\u0012\u000c\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010:0\u001a0\u00192\u0006\u0010\u000f\u001a\u00020\u000e\u00a2\u0006\u0004\u0008;\u0010 J)\u0010>\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00150\u001a0\u00192\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010=\u001a\u00020<\u00a2\u0006\u0004\u0008>\u0010?JI\u0010H\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020G0\u001a0\u00192\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010A\u001a\u00020@2\u0006\u0010B\u001a\u00020@2\u0006\u0010C\u001a\u00020\u000e2\u0006\u0010E\u001a\u00020D2\u0006\u0010F\u001a\u00020\u000e\u00a2\u0006\u0004\u0008H\u0010IR\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004\u00a2\u0006\u000c\n\u0004\u0008J\u0010K\u001a\u0004\u0008L\u0010MR \u0010S\u001a\u0008\u0012\u0004\u0012\u00020\u00150N8\u0000X\u0080\u0004\u00a2\u0006\u000c\n\u0004\u0008O\u0010P\u001a\u0004\u0008Q\u0010RR#\u0010Y\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020*0\u001a0T8\u0006\u00a2\u0006\u000c\n\u0004\u0008U\u0010V\u001a\u0004\u0008W\u0010X\u00a8\u0006Z"
    }
    d2 = {
        "Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;",
        "LNa/b;",
        "Lfd/b;",
        "api",
        "Lwo/z;",
        "coroutineScope",
        "LDa/v;",
        "podEventsRepository",
        "Laa/b;",
        "bedtimeDao",
        "Lqd/e;",
        "pregnancyModeStateDao",
        "<init>",
        "(Lfd/b;Lwo/z;LDa/v;Laa/b;Lqd/e;)V",
        "",
        "userId",
        "Ljd/v;",
        "getUserTemperatureSettings$data_temperature_tencentRelease",
        "(Ljava/lang/String;)Ljd/v;",
        "getUserTemperatureSettings",
        "newSettings",
        "LHm/B;",
        "updateUserTemperatureSettingsMap$data_temperature_tencentRelease",
        "(Ljava/lang/String;Ljd/v;)V",
        "updateUserTemperatureSettingsMap",
        "Lzo/l;",
        "Lya/j;",
        "refreshTemperatureSettings$data_temperature_tencentRelease",
        "(Ljava/lang/String;LLm/c;)Ljava/lang/Object;",
        "refreshTemperatureSettings",
        "Ljd/p;",
        "observeBedtimeSchedules",
        "(Ljava/lang/String;)Lzo/l;",
        "observeUserTemperatureSettings",
        "Lcom/eightsleep/data_core/enums/DeviceType;",
        "deviceType",
        "Ljd/B;",
        "temperatureSettingsUpdate",
        "",
        "ignoreDeviceErrors",
        "updateTemperatureSettings",
        "(Ljava/lang/String;Lcom/eightsleep/data_core/enums/DeviceType;Ljd/B;Z)Lzo/l;",
        "Ljd/t;",
        "observeTemperatureEvents",
        "refreshTemperatureEvents",
        "activateHotFlashMode",
        "deactivateHotFlashMode",
        "Ljd/n;",
        "fetchPregnancyRecommendation",
        "action",
        "submitPregnancyRecommendation",
        "(Ljava/lang/String;Ljava/lang/String;)Lzo/l;",
        "undoPregnancyRecommendation",
        "Ljd/h;",
        "stage",
        "Ljd/i;",
        "fetchPregnancyJourneyStats",
        "(Ljava/lang/String;Ljd/h;)Lzo/l;",
        "Ljd/j;",
        "getPregnancyMode",
        "Lcom/eightsleep/data_temperature/data/model/ActivatePregnancyModeRequest;",
        "request",
        "activatePregnancyMode",
        "(Ljava/lang/String;Lcom/eightsleep/data_temperature/data/model/ActivatePregnancyModeRequest;)Lzo/l;",
        "Ljava/time/LocalDate;",
        "fromDate",
        "toDate",
        "bucket",
        "Ljava/time/ZoneId;",
        "timezone",
        "stages",
        "Ljd/m;",
        "fetchPregnancyTemperatureAggregate",
        "(Ljava/lang/String;Ljava/time/LocalDate;Ljava/time/LocalDate;Ljava/lang/String;Ljava/time/ZoneId;Ljava/lang/String;)Lzo/l;",
        "a",
        "Lfd/b;",
        "getApi",
        "()Lfd/b;",
        "Lzo/v0;",
        "h",
        "Lzo/v0;",
        "getPregnancyModeUpdateEvents$data_temperature_tencentRelease",
        "()Lzo/v0;",
        "pregnancyModeUpdateEvents",
        "Lzo/r0;",
        "m",
        "Lzo/r0;",
        "getTemperatureEvents",
        "()Lzo/r0;",
        "temperatureEvents",
        "data-temperature_tencentRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:Lfd/b;

.field public final b:Lwo/z;

.field public final c:LDa/v;

.field public final d:Laa/b;

.field public final e:Lqd/e;

.field public final f:LYa/B;

.field public final g:Lzo/z0;

.field public final h:Lzo/z0;

.field public final i:Ljava/util/concurrent/ConcurrentHashMap;

.field public final j:Ljava/util/concurrent/ConcurrentHashMap;

.field public final k:Ljava/util/concurrent/ConcurrentHashMap$KeySetView;

.field public final l:Lzo/M0;

.field public final m:Lzo/M0;


# direct methods
.method public constructor <init>(Lfd/b;Lwo/z;LDa/v;Laa/b;Lqd/e;)V
    .locals 1

    const-string v0, "api"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "coroutineScope"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "podEventsRepository"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "bedtimeDao"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "pregnancyModeStateDao"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->a:Lfd/b;

    iput-object p2, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->b:Lwo/z;

    iput-object p3, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->c:LDa/v;

    iput-object p4, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->d:Laa/b;

    iput-object p5, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->e:Lqd/e;

    new-instance p1, Lgd/z;

    const/4 p3, 0x0

    invoke-direct {p1, p0, p3}, Lgd/z;-><init>(Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;LLm/c;)V

    const/4 p4, 0x3

    invoke-static {p2, p3, p3, p1, p4}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    new-instance p1, LYa/B;

    const/4 p4, 0x6

    invoke-direct {p1, p2, p4}, LYa/B;-><init>(Lwo/z;I)V

    iput-object p1, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->f:LYa/B;

    const/4 p1, 0x1

    const/4 p2, 0x5

    invoke-static {p1, p2, p3}, Lzo/s;->b(IILyo/a;)Lzo/z0;

    move-result-object p1

    iput-object p1, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->g:Lzo/z0;

    iput-object p1, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->h:Lzo/z0;

    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object p1, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->i:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object p1, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->j:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {}, Ljava/util/concurrent/ConcurrentHashMap;->newKeySet()Ljava/util/concurrent/ConcurrentHashMap$KeySetView;

    move-result-object p1

    const-string p2, "newKeySet(...)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->k:Ljava/util/concurrent/ConcurrentHashMap$KeySetView;

    sget-object p1, Lya/f;->b:Lya/f;

    invoke-static {p1}, Lzo/s;->c(Ljava/lang/Object;)Lzo/M0;

    move-result-object p2

    iput-object p2, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->l:Lzo/M0;

    invoke-static {p1}, Lzo/s;->c(Ljava/lang/Object;)Lzo/M0;

    move-result-object p1

    iput-object p1, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->m:Lzo/M0;

    return-void
.end method

.method public static final access$cacheBedtimeSchedules(Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;Lcom/eightsleep/data_temperature/data/model/TemperatureSettingsResponse;Ljava/lang/String;LLm/c;)Ljava/lang/Object;
    .locals 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Lcom/eightsleep/data_temperature/data/model/TemperatureSettingsResponse;->getSchedules()Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p1, v1}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/eightsleep/data_bedtime/data/model/BedtimeScheduleResponse;

    invoke-virtual {v1, p2}, Lcom/eightsleep/data_bedtime/data/model/BedtimeScheduleResponse;->toEntity(Ljava/lang/String;)Lba/b;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    sget-object v0, LIm/z;->a:LIm/z;

    :cond_1
    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->d:Laa/b;

    check-cast p0, LJd/k;

    new-instance p1, LBg/w;

    const/16 v1, 0x1c

    invoke-direct {p1, p0, p2, v0, v1}, LBg/w;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    iget-object p0, p0, LJd/k;->a:Ljava/lang/Object;

    check-cast p0, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-static {p0, p1, p3}, LP2/E;->M(LE4/t;LVm/k;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    if-ne p0, p1, :cond_2

    return-object p0

    :cond_2
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0
.end method

.method public static final synthetic access$getCoroutineScope$p(Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;)Lwo/z;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->b:Lwo/z;

    return-object p0
.end method

.method public static final synthetic access$getPregnancyModeStateDao$p(Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;)Lqd/e;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->e:Lqd/e;

    return-object p0
.end method

.method public static final synthetic access$getRefreshDeferredByWrite$p(Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;)Ljava/util/Set;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->k:Ljava/util/concurrent/ConcurrentHashMap$KeySetView;

    return-object p0
.end method

.method public static final synthetic access$getWritesInFlight$p(Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->j:Ljava/util/concurrent/ConcurrentHashMap;

    return-object p0
.end method

.method public static final synthetic access$get_pregnancyModeUpdateEvents$p(Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;)Lzo/q0;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->g:Lzo/z0;

    return-object p0
.end method

.method public static final access$observeTempDialEvents(Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;LLm/c;)Ljava/lang/Object;
    .locals 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lkotlin/jvm/internal/B;->a:Lkotlin/jvm/internal/C;

    const-class v1, LIa/d;

    invoke-virtual {v0, v1}, Lkotlin/jvm/internal/C;->b(Ljava/lang/Class;)Lbn/d;

    move-result-object v0

    iget-object v1, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->c:LDa/v;

    iget-object v1, v1, LDa/v;->d:Lzo/z0;

    new-instance v2, Lzo/i0;

    const/4 v3, 0x0

    invoke-direct {v2, v1, v0, v3}, Lzo/i0;-><init>(Lzo/l;Ljava/lang/Object;I)V

    new-instance v0, Lgd/U;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lgd/U;-><init>(Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;LLm/c;)V

    invoke-static {v2, v0, p1}, Lzo/s;->m(Lzo/l;LVm/n;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    if-ne p0, p1, :cond_0

    return-object p0

    :cond_0
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0
.end method

.method public static final access$refreshPregnancyMode(Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->i:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v1, LXg/a;

    const/16 v2, 0xc

    invoke-direct {v1, v2, p0, p1}, LXg/a;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    new-instance p0, Lgd/y;

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lgd/y;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0, p1, p0}, Ljava/util/concurrent/ConcurrentHashMap;->compute(Ljava/lang/Object;Ljava/util/function/BiFunction;)Ljava/lang/Object;

    return-void
.end method

.method public static final access$refreshUnlessWriting(Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;Ljava/lang/String;LLm/c;)Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->j:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    sget-object v1, LHm/B;->a:LHm/B;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->k:Ljava/util/concurrent/ConcurrentHashMap$KeySetView;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap$KeySetView;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->refreshTemperatureSettings$data_temperature_tencentRelease(Ljava/lang/String;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    if-ne p0, p1, :cond_0

    return-object p0

    :cond_0
    return-object v1
.end method

.method public static final access$updateUserTemperatureSettingsMap(Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;Ljava/lang/String;LVm/k;)V
    .locals 1

    iget-object v0, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->l:Lzo/M0;

    invoke-virtual {v0}, Lzo/M0;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lya/j;

    invoke-virtual {v0}, Lya/j;->e()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljd/v;

    if-eqz v0, :cond_0

    invoke-interface {p2, v0}, LVm/k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljd/v;

    if-eqz p2, :cond_0

    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->updateUserTemperatureSettingsMap$data_temperature_tencentRelease(Ljava/lang/String;Ljd/v;)V

    :cond_0
    return-void
.end method

.method public static synthetic updateTemperatureSettings$default(Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;Ljava/lang/String;Lcom/eightsleep/data_core/enums/DeviceType;Ljd/B;ZILjava/lang/Object;)Lzo/l;
    .locals 0

    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_0

    const/4 p4, 0x0

    :cond_0
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->updateTemperatureSettings(Ljava/lang/String;Lcom/eightsleep/data_core/enums/DeviceType;Ljd/B;Z)Lzo/l;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final activateHotFlashMode(Ljava/lang/String;)Lzo/l;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->getApi()Lfd/b;

    move-result-object v0

    new-instance v1, Lgd/D;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lgd/D;-><init>(Ljava/lang/String;LLm/c;)V

    const/4 v3, 0x3

    invoke-static {p0, v0, v2, v1, v3}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object v0

    new-instance v1, Lgd/C;

    invoke-direct {v1, v0, p1, p0}, Lgd/C;-><init>(Lzo/l;Ljava/lang/String;Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;)V

    return-object v1
.end method

.method public final activatePregnancyMode(Ljava/lang/String;Lcom/eightsleep/data_temperature/data/model/ActivatePregnancyModeRequest;)Lzo/l;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/eightsleep/data_temperature/data/model/ActivatePregnancyModeRequest;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "request"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->getApi()Lfd/b;

    move-result-object v0

    new-instance v1, Lgd/F;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, v2}, Lgd/F;-><init>(Ljava/lang/String;Lcom/eightsleep/data_temperature/data/model/ActivatePregnancyModeRequest;LLm/c;)V

    const/4 v3, 0x3

    invoke-static {p0, v0, v2, v1, v3}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object v0

    new-instance v1, Lgd/H;

    invoke-direct {v1, p0, p1, p2, v2}, Lgd/H;-><init>(Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;Ljava/lang/String;Lcom/eightsleep/data_temperature/data/model/ActivatePregnancyModeRequest;LLm/c;)V

    invoke-static {v0, v1}, LP2/q;->D(Lzo/l;LVm/n;)LGc/h;

    move-result-object p0

    return-object p0
.end method

.method public call(Lfd/b;ZLKa/c;LVm/n;)Lzo/l;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lfd/b;",
            "Z",
            "LKa/c;",
            "LVm/n;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p2, p3, p4}, LP2/b;->s(LNa/b;ZLKa/c;LVm/n;)Lzo/x;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic call(Ljava/lang/Object;ZLKa/c;LVm/n;)Lzo/l;
    .locals 0

    .line 2
    check-cast p1, Lfd/b;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->call(Lfd/b;ZLKa/c;LVm/n;)Lzo/l;

    move-result-object p0

    return-object p0
.end method

.method public final deactivateHotFlashMode(Ljava/lang/String;)Lzo/l;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->getApi()Lfd/b;

    move-result-object v0

    new-instance v1, Lgd/J;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lgd/J;-><init>(Ljava/lang/String;LLm/c;)V

    const/4 v3, 0x3

    invoke-static {p0, v0, v2, v1, v3}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object v0

    new-instance v1, Lgd/C;

    const/4 v2, 0x1

    invoke-direct {v1, v0, p0, p1, v2}, Lgd/C;-><init>(Lzo/l;Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;Ljava/lang/String;I)V

    return-object v1
.end method

.method public final fetchPregnancyJourneyStats(Ljava/lang/String;Ljd/h;)Lzo/l;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljd/h;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->getApi()Lfd/b;

    move-result-object v0

    new-instance v1, Lgd/L;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, v2}, Lgd/L;-><init>(Ljava/lang/String;Ljd/h;LLm/c;)V

    const/4 p1, 0x3

    invoke-static {p0, v0, v2, v1, p1}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object p0

    new-instance p1, Lgd/M;

    const/4 p2, 0x2

    invoke-direct {p1, p2, v2}, LNm/i;-><init>(ILLm/c;)V

    invoke-static {p0, p1}, LP2/q;->D(Lzo/l;LVm/n;)LGc/h;

    move-result-object p0

    return-object p0
.end method

.method public final fetchPregnancyRecommendation(Ljava/lang/String;)Lzo/l;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->getApi()Lfd/b;

    move-result-object v0

    new-instance v1, Lgd/N;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lgd/N;-><init>(Ljava/lang/String;LLm/c;)V

    const/4 p1, 0x3

    invoke-static {p0, v0, v2, v1, p1}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object p0

    new-instance p1, Lgd/O;

    const/4 v0, 0x2

    invoke-direct {p1, v0, v2}, LNm/i;-><init>(ILLm/c;)V

    invoke-static {p0, p1}, LP2/q;->D(Lzo/l;LVm/n;)LGc/h;

    move-result-object p0

    return-object p0
.end method

.method public final fetchPregnancyTemperatureAggregate(Ljava/lang/String;Ljava/time/LocalDate;Ljava/time/LocalDate;Ljava/lang/String;Ljava/time/ZoneId;Ljava/lang/String;)Lzo/l;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/time/LocalDate;",
            "Ljava/time/LocalDate;",
            "Ljava/lang/String;",
            "Ljava/time/ZoneId;",
            "Ljava/lang/String;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "fromDate"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "toDate"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "bucket"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "timezone"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "stages"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->getApi()Lfd/b;

    move-result-object v0

    new-instance v1, Lgd/P;

    const/4 v8, 0x0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object v7, p6

    invoke-direct/range {v1 .. v8}, Lgd/P;-><init>(Ljava/lang/String;Ljava/time/LocalDate;Ljava/time/LocalDate;Ljava/lang/String;Ljava/time/ZoneId;Ljava/lang/String;LLm/c;)V

    const/4 p1, 0x0

    const/4 p2, 0x3

    invoke-static {p0, v0, p1, v1, p2}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object p0

    new-instance p2, Lgd/Q;

    const/4 p3, 0x2

    invoke-direct {p2, p3, p1}, LNm/i;-><init>(ILLm/c;)V

    invoke-static {p0, p2}, LP2/q;->D(Lzo/l;LVm/n;)LGc/h;

    move-result-object p0

    return-object p0
.end method

.method public getApi()Lfd/b;
    .locals 0

    .line 2
    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->a:Lfd/b;

    return-object p0
.end method

.method public bridge synthetic getApi()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->getApi()Lfd/b;

    move-result-object p0

    return-object p0
.end method

.method public final getPregnancyMode(Ljava/lang/String;)Lzo/l;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->i:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v1, LXg/a;

    const/16 v2, 0xc

    invoke-direct {v1, v2, p0, p1}, LXg/a;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Lgd/y;

    const/4 v3, 0x0

    invoke-direct {v2, v1, v3}, Lgd/y;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0, p1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->compute(Ljava/lang/Object;Ljava/util/function/BiFunction;)Ljava/lang/Object;

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->e:Lqd/e;

    check-cast p0, Lkc/i;

    const-string v0, "SELECT * FROM pregnancy_mode_state WHERE user_id = ? LIMIT 1"

    const/4 v1, 0x1

    invoke-static {v1, v0}, LE4/A;->a(ILjava/lang/String;)LE4/A;

    move-result-object v0

    invoke-virtual {v0, v1, p1}, LE4/A;->g(ILjava/lang/String;)V

    const-string p1, "pregnancy_mode_state"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    new-instance v1, Lqd/c;

    const/4 v2, 0x2

    invoke-direct {v1, v2, p0, v0}, Lqd/c;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    iget-object p0, p0, Lkc/i;->a:Lcom/eightsleep/eight/AppDatabase_Impl;

    const/4 v0, 0x0

    invoke-static {p0, v0, p1, v1}, LP2/A;->I(LE4/t;Z[Ljava/lang/String;Ljava/util/concurrent/Callable;)Lzo/u0;

    move-result-object p0

    new-instance p1, LS4/r;

    const/4 v0, 0x3

    invoke-direct {p1, p0, v0}, LS4/r;-><init>(Lzo/u0;I)V

    invoke-static {p1}, Lzo/s;->p(Lzo/l;)Lzo/l;

    move-result-object p0

    return-object p0
.end method

.method public final getPregnancyModeUpdateEvents$data_temperature_tencentRelease()Lzo/v0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lzo/v0;"
        }
    .end annotation

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->h:Lzo/z0;

    return-object p0
.end method

.method public final getTemperatureEvents()Lzo/r0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lzo/r0;"
        }
    .end annotation

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->m:Lzo/M0;

    return-object p0
.end method

.method public final getUserTemperatureSettings$data_temperature_tencentRelease(Ljava/lang/String;)Ljd/v;
    .locals 1

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->l:Lzo/M0;

    invoke-virtual {p0}, Lzo/M0;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lya/j;

    invoke-virtual {p0}, Lya/j;->e()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    if-eqz p0, :cond_0

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljd/v;

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public final observeBedtimeSchedules(Ljava/lang/String;)Lzo/l;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->d:Laa/b;

    check-cast v0, LJd/k;

    const-string v1, "SELECT * FROM bedtime_schedules WHERE user_id = ?"

    const/4 v2, 0x1

    invoke-static {v2, v1}, LE4/A;->a(ILjava/lang/String;)LE4/A;

    move-result-object v1

    invoke-virtual {v1, v2, p1}, LE4/A;->g(ILjava/lang/String;)V

    const-string v2, "bedtime_schedules"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    new-instance v3, Laa/d;

    const/4 v4, 0x0

    invoke-direct {v3, v0, v1, v4}, Laa/d;-><init>(LJd/k;LE4/A;I)V

    iget-object v0, v0, LJd/k;->a:Ljava/lang/Object;

    check-cast v0, Lcom/eightsleep/eight/AppDatabase_Impl;

    const/4 v1, 0x0

    invoke-static {v0, v1, v2, v3}, LP2/A;->I(LE4/t;Z[Ljava/lang/String;Ljava/util/concurrent/Callable;)Lzo/u0;

    move-result-object v0

    new-instance v1, LS4/r;

    const/4 v2, 0x4

    invoke-direct {v1, v0, v2}, LS4/r;-><init>(Lzo/u0;I)V

    invoke-virtual {p0, p1}, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->observeUserTemperatureSettings(Ljava/lang/String;)Lzo/l;

    move-result-object p0

    new-instance p1, LXe/l1;

    const/16 v0, 0x14

    invoke-direct {p1, v0}, LXe/l1;-><init>(I)V

    const-string v0, "f2"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lya/a;

    const/4 v2, 0x0

    invoke-direct {v0, v2, v2, v2, p1}, Lya/a;-><init>(LLm/c;LVm/a;LVm/k;LVm/n;)V

    new-instance p1, LGc/h;

    invoke-direct {p1, v1, p0, v0}, LGc/h;-><init>(Lzo/l;Lzo/l;LVm/o;)V

    return-object p1
.end method

.method public final observeTemperatureEvents(Ljava/lang/String;)Lzo/l;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lgd/W;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lgd/W;-><init>(Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;Ljava/lang/String;LLm/c;)V

    new-instance p1, Lzo/x;

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->m:Lzo/M0;

    invoke-direct {p1, p0, v0}, Lzo/x;-><init>(Lzo/l;LVm/n;)V

    return-object p1
.end method

.method public final observeUserTemperatureSettings(Ljava/lang/String;)Lzo/l;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, La9/n;

    const/4 v1, 0x0

    const/4 v2, 0x7

    invoke-direct {v0, v1, p0, p1, v2}, La9/n;-><init>(LLm/c;Ljava/lang/Object;Ljava/lang/Object;I)V

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->l:Lzo/M0;

    invoke-static {p0, v0}, Lzo/s;->G(Lzo/l;LVm/o;)LAo/n;

    move-result-object p0

    invoke-static {p0}, Lzo/s;->p(Lzo/l;)Lzo/l;

    move-result-object p0

    return-object p0
.end method

.method public final refreshTemperatureEvents(Ljava/lang/String;)Lzo/l;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->getApi()Lfd/b;

    move-result-object v0

    new-instance v1, Lgd/d0;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lgd/d0;-><init>(Ljava/lang/String;LLm/c;)V

    const/4 p1, 0x3

    invoke-static {p0, v0, v2, v1, p1}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object p1

    new-instance v0, LD9/p;

    const/16 v1, 0x15

    invoke-direct {v0, v1, p1, p0}, LD9/p;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method public final refreshTemperatureSettings$data_temperature_tencentRelease(Ljava/lang/String;LLm/c;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "LLm/c<",
            "-",
            "Lzo/l;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    new-instance v0, Lgd/g0;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lgd/g0;-><init>(Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;Ljava/lang/String;LLm/c;)V

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->f:LYa/B;

    invoke-virtual {p0, p1, v0, p2}, LYa/B;->b(Ljava/lang/Object;LVm/k;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final submitPregnancyRecommendation(Ljava/lang/String;Ljava/lang/String;)Lzo/l;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "action"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->getApi()Lfd/b;

    move-result-object v0

    new-instance v1, Lgd/h0;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, v2}, Lgd/h0;-><init>(Ljava/lang/String;Ljava/lang/String;LLm/c;)V

    const/4 p1, 0x3

    invoke-static {p0, v0, v2, v1, p1}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object p0

    new-instance p1, Lgd/i0;

    const/4 p2, 0x2

    invoke-direct {p1, p2, v2}, LNm/i;-><init>(ILLm/c;)V

    invoke-static {p0, p1}, LP2/q;->D(Lzo/l;LVm/n;)LGc/h;

    move-result-object p0

    return-object p0
.end method

.method public final undoPregnancyRecommendation(Ljava/lang/String;)Lzo/l;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->getApi()Lfd/b;

    move-result-object v0

    new-instance v1, Lgd/j0;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lgd/j0;-><init>(Ljava/lang/String;LLm/c;)V

    const/4 p1, 0x3

    invoke-static {p0, v0, v2, v1, p1}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object p0

    new-instance p1, Lgd/k0;

    const/4 v0, 0x2

    invoke-direct {p1, v0, v2}, LNm/i;-><init>(ILLm/c;)V

    invoke-static {p0, p1}, LP2/q;->D(Lzo/l;LVm/n;)LGc/h;

    move-result-object p0

    return-object p0
.end method

.method public final updateTemperatureSettings(Ljava/lang/String;Lcom/eightsleep/data_core/enums/DeviceType;Ljd/B;Z)Lzo/l;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/eightsleep/data_core/enums/DeviceType;",
            "Ljd/B;",
            "Z)",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "deviceType"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "temperatureSettingsUpdate"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->getApi()Lfd/b;

    move-result-object v0

    new-instance v1, Lgd/m0;

    const/4 v6, 0x0

    move-object v4, p1

    move-object v2, p2

    move-object v3, p3

    move v5, p4

    invoke-direct/range {v1 .. v6}, Lgd/m0;-><init>(Lcom/eightsleep/data_core/enums/DeviceType;Ljd/B;Ljava/lang/String;ZLLm/c;)V

    const/4 p1, 0x0

    const/4 p2, 0x3

    invoke-static {p0, v0, p1, v1, p2}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object p3

    new-instance p4, Lgd/p0;

    invoke-direct {p4, p0, v4, p1}, Lgd/p0;-><init>(Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;Ljava/lang/String;LLm/c;)V

    new-instance v0, Lzo/x;

    invoke-direct {v0, p3, p4}, Lzo/x;-><init>(Lzo/l;LVm/n;)V

    new-instance p3, Lgd/q0;

    invoke-direct {p3, p0, v4, v2, p1}, Lgd/q0;-><init>(Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;Ljava/lang/String;Lcom/eightsleep/data_core/enums/DeviceType;LLm/c;)V

    invoke-static {v0, p1, p3, p2}, LP2/q;->t(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object p2

    new-instance p3, LCh/d3;

    invoke-direct {p3, p0, v4, p1}, LCh/d3;-><init>(Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;Ljava/lang/String;LLm/c;)V

    new-instance p0, Lzo/v;

    invoke-direct {p0, p2, p3}, Lzo/v;-><init>(Lzo/l;LVm/o;)V

    return-object p0
.end method

.method public final updateUserTemperatureSettingsMap$data_temperature_tencentRelease(Ljava/lang/String;Ljd/v;)V
    .locals 3

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "newSettings"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->l:Lzo/M0;

    invoke-virtual {p0}, Lzo/M0;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lya/j;

    instance-of v1, v0, Lya/g;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    check-cast v0, Lya/g;

    iget-object v0, v0, Lya/g;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/Map;

    invoke-static {v0}, LIm/F;->b0(Ljava/util/Map;)Ljava/util/LinkedHashMap;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Lya/g;

    invoke-direct {p1, v0}, Lya/g;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v2, p1}, Lzo/M0;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    return-void

    :cond_0
    new-instance v0, Lya/g;

    new-instance v1, LHm/k;

    invoke-direct {v1, p1, p2}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {v1}, LIm/G;->K(LHm/k;)Ljava/util/Map;

    move-result-object p1

    invoke-direct {v0, p1}, Lya/g;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v2, v0}, Lzo/M0;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    return-void
.end method
