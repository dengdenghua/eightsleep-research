.class public final Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;
.super LL8/e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "LL8/e;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000^\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\r\u0008\u0007\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001B9\u0008\u0007\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\u0008\u0012\u0006\u0010\u000b\u001a\u00020\n\u0012\u0006\u0010\r\u001a\u00020\u000c\u0012\u0006\u0010\u000f\u001a\u00020\u000e\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J3\u0010\u001b\u001a\u00020\u001a2\u0006\u0010\u0013\u001a\u00020\u00122\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u00142\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u00162\u0006\u0010\u0019\u001a\u00020\u0018H\u0002\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ\u000f\u0010\u001e\u001a\u00020\u001dH\u0016\u00a2\u0006\u0004\u0008\u001e\u0010\u001fJ\u0017\u0010!\u001a\u00020\u001a2\u0006\u0010 \u001a\u00020\u0003H\u0016\u00a2\u0006\u0004\u0008!\u0010\"R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0005\u0010#R\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0007\u0010$R\u0014\u0010\t\u001a\u00020\u00088\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\t\u0010%R\u0014\u0010\u000b\u001a\u00020\n8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000b\u0010&R\u0014\u0010\r\u001a\u00020\u000c8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\r\u0010\'R\u0016\u0010(\u001a\u00020\u00128\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008(\u0010)\u00a8\u0006*"
    }
    d2 = {
        "Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;",
        "LL8/e;",
        "Lwg/T;",
        "Ltg/v;",
        "Lxd/i;",
        "getAppUserUseCase",
        "LJa/n;",
        "observeSelectedDateUseCase",
        "Luc/u0;",
        "observeTrendByDateUseCase",
        "Luc/p0;",
        "observeMetricAggregatesByDatesUseCase",
        "Luc/f1;",
        "smartFetchMetricAggregatesUseCase",
        "LRc/b;",
        "analytics",
        "<init>",
        "(Lxd/i;LJa/n;Luc/u0;Luc/p0;Luc/f1;LRc/b;)V",
        "Ljava/time/LocalDate;",
        "date",
        "Lcom/eightsleep/data_metrics/domain/model/DailyTrends;",
        "trends",
        "Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;",
        "aggregates",
        "LGa/f;",
        "displaySettings",
        "LHm/B;",
        "updateContent",
        "(Ljava/time/LocalDate;Lcom/eightsleep/data_metrics/domain/model/DailyTrends;Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;LGa/f;)V",
        "LY7/n;",
        "getInitialViewState",
        "()LY7/n;",
        "action",
        "onUiAction",
        "(Ltg/v;)V",
        "Lxd/i;",
        "LJa/n;",
        "Luc/u0;",
        "Luc/p0;",
        "Luc/f1;",
        "selectedDate",
        "Ljava/time/LocalDate;",
        "presentation-metrics_tencentRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final $stable:I = 0x8


# instance fields
.field private final getAppUserUseCase:Lxd/i;

.field private final observeMetricAggregatesByDatesUseCase:Luc/p0;

.field private final observeSelectedDateUseCase:LJa/n;

.field private final observeTrendByDateUseCase:Luc/u0;

.field private selectedDate:Ljava/time/LocalDate;

.field private final smartFetchMetricAggregatesUseCase:Luc/f1;


# direct methods
.method public constructor <init>(Lxd/i;LJa/n;Luc/u0;Luc/p0;Luc/f1;LRc/b;)V
    .locals 1

    const-string v0, "getAppUserUseCase"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "observeSelectedDateUseCase"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "observeTrendByDateUseCase"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "observeMetricAggregatesByDatesUseCase"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "smartFetchMetricAggregatesUseCase"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "analytics"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, p6}, LL8/e;-><init>(LRc/b;)V

    iput-object p1, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;->getAppUserUseCase:Lxd/i;

    iput-object p2, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;->observeSelectedDateUseCase:LJa/n;

    iput-object p3, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;->observeTrendByDateUseCase:Luc/u0;

    iput-object p4, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;->observeMetricAggregatesByDatesUseCase:Luc/p0;

    iput-object p5, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;->smartFetchMetricAggregatesUseCase:Luc/f1;

    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object p1

    const-string p2, "now(...)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;->selectedDate:Ljava/time/LocalDate;

    invoke-static {p0}, Landroidx/lifecycle/V;->h(Landroidx/lifecycle/b0;)Li3/a;

    move-result-object p1

    new-instance p2, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1;-><init>(Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;LLm/c;)V

    const/4 p0, 0x3

    invoke-static {p1, p3, p3, p2, p0}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    return-void
.end method

.method public static final synthetic access$getGetAppUserUseCase$p(Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;)Lxd/i;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;->getAppUserUseCase:Lxd/i;

    return-object p0
.end method

.method public static final synthetic access$getObserveMetricAggregatesByDatesUseCase$p(Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;)Luc/p0;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;->observeMetricAggregatesByDatesUseCase:Luc/p0;

    return-object p0
.end method

.method public static final synthetic access$getObserveSelectedDateUseCase$p(Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;)LJa/n;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;->observeSelectedDateUseCase:LJa/n;

    return-object p0
.end method

.method public static final synthetic access$getObserveTrendByDateUseCase$p(Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;)Luc/u0;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;->observeTrendByDateUseCase:Luc/u0;

    return-object p0
.end method

.method public static final synthetic access$getSmartFetchMetricAggregatesUseCase$p(Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;)Luc/f1;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;->smartFetchMetricAggregatesUseCase:Luc/f1;

    return-object p0
.end method

.method public static final synthetic access$setSelectedDate$p(Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;Ljava/time/LocalDate;)V
    .locals 0

    iput-object p1, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;->selectedDate:Ljava/time/LocalDate;

    return-void
.end method

.method public static final synthetic access$updateContent(Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;Ljava/time/LocalDate;Lcom/eightsleep/data_metrics/domain/model/DailyTrends;Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;LGa/f;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;->updateContent(Ljava/time/LocalDate;Lcom/eightsleep/data_metrics/domain/model/DailyTrends;Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;LGa/f;)V

    return-void
.end method

.method public static synthetic c(Ljava/time/LocalDate;Lcom/eightsleep/data_metrics/domain/model/DailyTrends;Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;LGa/f;Lwg/T;)Lwg/T;
    .locals 0

    invoke-static {p0, p1, p2, p3, p4}, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;->updateContent$lambda$0(Ljava/time/LocalDate;Lcom/eightsleep/data_metrics/domain/model/DailyTrends;Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;LGa/f;Lwg/T;)Lwg/T;

    move-result-object p0

    return-object p0
.end method

.method private final updateContent(Ljava/time/LocalDate;Lcom/eightsleep/data_metrics/domain/model/DailyTrends;Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;LGa/f;)V
    .locals 6

    new-instance v0, LAe/c0;

    const/16 v5, 0x17

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, LAe/c0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    const/4 p1, 0x1

    invoke-static {p0, v0, p1}, Landroid/support/v4/media/session/b;->I(LY7/o;LVm/k;I)V

    return-void
.end method

.method private static final updateContent$lambda$0(Ljava/time/LocalDate;Lcom/eightsleep/data_metrics/domain/model/DailyTrends;Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;LGa/f;Lwg/T;)Lwg/T;
    .locals 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    const/4 v4, 0x1

    const-string v5, "it"

    move-object/from16 v6, p4

    invoke-static {v6, v5}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v5, Lwg/T;->f:Ljava/util/List;

    const-string v5, "date"

    invoke-static {v0, v5}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "displaySettings"

    invoke-static {v3, v5}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v5, Lcom/eightsleep/data_metrics/enums/MetricDataPeriod;->WEEK:Lcom/eightsleep/data_metrics/enums/MetricDataPeriod;

    invoke-static {v0, v5}, LGk/m;->x(Ljava/time/LocalDate;Lcom/eightsleep/data_metrics/enums/MetricDataPeriod;)Ljava/time/LocalDate;

    move-result-object v5

    sget-object v6, Ljava/time/temporal/ChronoUnit;->DAYS:Ljava/time/temporal/ChronoUnit;

    invoke-virtual {v6, v5, v0}, Ljava/time/temporal/ChronoUnit;->between(Ljava/time/temporal/Temporal;Ljava/time/temporal/Temporal;)J

    move-result-wide v6

    long-to-int v0, v6

    add-int/2addr v0, v4

    new-array v6, v0, [Ljava/time/LocalDate;

    const/4 v8, 0x0

    :goto_0
    if-ge v8, v0, :cond_0

    int-to-long v9, v8

    invoke-virtual {v5, v9, v10}, Ljava/time/LocalDate;->plusDays(J)Ljava/time/LocalDate;

    move-result-object v9

    aput-object v9, v6, v8

    add-int/2addr v8, v4

    goto :goto_0

    :cond_0
    const/16 v5, 0xa

    if-eqz v2, :cond_4

    iget-object v9, v2, Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;->j:Ljava/util/List;

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_1
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    move-object v12, v11

    check-cast v12, Lcom/eightsleep/data_metrics/domain/model/Sample;

    iget-object v12, v12, Lcom/eightsleep/data_metrics/domain/model/Sample;->a:LGa/s;

    invoke-virtual {v12}, LGa/s;->k()Ljava/time/LocalDate;

    move-result-object v12

    invoke-static {v6, v12}, LIm/n;->S([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1

    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    invoke-static {v10, v5}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v9

    invoke-static {v9}, LIm/G;->J(I)I

    move-result v9

    const/16 v11, 0x10

    if-ge v9, v11, :cond_3

    move v9, v11

    :cond_3
    new-instance v11, Ljava/util/LinkedHashMap;

    invoke-direct {v11, v9}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_5

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    move-object v12, v10

    check-cast v12, Lcom/eightsleep/data_metrics/domain/model/Sample;

    iget-object v12, v12, Lcom/eightsleep/data_metrics/domain/model/Sample;->a:LGa/s;

    invoke-virtual {v12}, LGa/s;->k()Ljava/time/LocalDate;

    move-result-object v12

    invoke-interface {v11, v12, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_4
    const/4 v11, 0x0

    :cond_5
    if-eqz v1, :cond_6

    iget-object v9, v1, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->M:Lrc/c;

    if-eqz v9, :cond_6

    iget-object v9, v9, Lrc/c;->a:Lrc/d;

    if-eqz v9, :cond_6

    iget v9, v9, Lrc/d;->a:I

    move v13, v9

    goto :goto_3

    :cond_6
    const/4 v13, 0x0

    :goto_3
    if-eqz v1, :cond_8

    iget-object v9, v1, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->M:Lrc/c;

    if-eqz v9, :cond_8

    iget-object v9, v9, Lrc/c;->a:Lrc/d;

    if-eqz v9, :cond_8

    iget-object v9, v9, Lrc/d;->b:Ljava/lang/Integer;

    if-eqz v9, :cond_8

    invoke-virtual {v9}, Ljava/lang/Number;->intValue()I

    move-result v9

    int-to-long v9, v9

    invoke-static {v9, v10}, Ljava/time/Duration;->ofSeconds(J)Ljava/time/Duration;

    move-result-object v9

    if-nez v9, :cond_7

    goto :goto_5

    :cond_7
    :goto_4
    move-object v14, v9

    goto :goto_6

    :cond_8
    :goto_5
    sget-object v9, Ljava/time/Duration;->ZERO:Ljava/time/Duration;

    goto :goto_4

    :goto_6
    invoke-static {v14}, Lkotlin/jvm/internal/l;->g(Ljava/lang/Object;)V

    if-eqz v1, :cond_9

    iget-object v9, v1, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->M:Lrc/c;

    if-eqz v9, :cond_9

    iget-object v9, v9, Lrc/c;->a:Lrc/d;

    if-eqz v9, :cond_9

    iget-object v9, v9, Lrc/d;->c:Lcom/eightsleep/data_core/enums/SleepStage;

    move-object v15, v9

    goto :goto_7

    :cond_9
    const/4 v15, 0x0

    :goto_7
    if-eqz v1, :cond_c

    iget-object v1, v1, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->M:Lrc/c;

    if-eqz v1, :cond_c

    iget-object v1, v1, Lrc/c;->b:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_a

    goto :goto_8

    :cond_a
    const/4 v1, 0x0

    :goto_8
    if-eqz v1, :cond_c

    new-instance v9, Ljava/util/ArrayList;

    invoke-static {v1, v5}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-direct {v9, v5}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lrc/b;

    new-instance v16, Lwg/U;

    iget-object v10, v5, Lrc/b;->a:LGa/s;

    iget v12, v5, Lrc/b;->b:I

    int-to-long v7, v12

    invoke-static {v7, v8}, Ljava/time/Duration;->ofSeconds(J)Ljava/time/Duration;

    move-result-object v7

    const-string v8, "ofSeconds(...)"

    invoke-static {v7, v8}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v8, v5, Lrc/b;->c:LGa/b;

    iget-object v12, v5, Lrc/b;->d:Lcom/eightsleep/data_core/enums/autopilot/AutopilotAdjustmentPhase;

    iget-object v5, v5, Lrc/b;->e:Lcom/eightsleep/data_core/enums/SleepStage;

    move-object/from16 v20, v5

    move-object/from16 v18, v7

    move-object/from16 v21, v8

    move-object/from16 v17, v10

    move-object/from16 v19, v12

    invoke-direct/range {v16 .. v21}, Lwg/U;-><init>(LGa/s;Ljava/time/Duration;Lcom/eightsleep/data_core/enums/autopilot/AutopilotAdjustmentPhase;Lcom/eightsleep/data_core/enums/SleepStage;LGa/b;)V

    move-object/from16 v5, v16

    invoke-virtual {v9, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_9

    :cond_b
    :goto_a
    move-object/from16 v16, v9

    goto :goto_b

    :cond_c
    sget-object v9, Lwg/T;->f:Ljava/util/List;

    goto :goto_a

    :goto_b
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v5, 0x0

    :goto_c
    iget-object v7, v3, LGa/f;->d:Lcom/eightsleep/data_core/enums/ClockSystem;

    if-ge v5, v0, :cond_f

    aget-object v10, v6, v5

    if-eqz v11, :cond_d

    invoke-interface {v11, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/eightsleep/data_metrics/domain/model/Sample;

    goto :goto_d

    :cond_d
    const/4 v12, 0x0

    :goto_d
    new-instance v8, LGa/s;

    invoke-static {v10}, Lkotlin/jvm/internal/l;->g(Ljava/lang/Object;)V

    invoke-direct {v8, v10, v7}, LGa/s;-><init>(Ljava/time/LocalDate;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    if-eqz v12, :cond_e

    sget-object v7, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->HOT_FLASH_SESSION_COUNT:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    iget-object v9, v12, Lcom/eightsleep/data_metrics/domain/model/Sample;->b:Ljava/util/Map;

    invoke-interface {v9, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Double;

    if-eqz v7, :cond_e

    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v9

    move-wide/from16 v17, v9

    goto :goto_e

    :cond_e
    const-wide/16 v17, 0x0

    :goto_e
    invoke-static/range {v17 .. v18}, LXm/a;->T(D)I

    move-result v7

    new-instance v9, Lwg/h;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    sget-object v10, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v9, v7, v10, v8, v4}, Lwg/h;-><init>(Ljava/lang/Integer;Ljava/lang/Boolean;LGa/s;Z)V

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/2addr v5, v4

    goto :goto_c

    :cond_f
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v5, 0x0

    :goto_f
    if-ge v5, v0, :cond_12

    aget-object v8, v6, v5

    if-eqz v11, :cond_10

    invoke-interface {v11, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/eightsleep/data_metrics/domain/model/Sample;

    goto :goto_10

    :cond_10
    const/4 v9, 0x0

    :goto_10
    new-instance v10, LGa/s;

    invoke-static {v8}, Lkotlin/jvm/internal/l;->g(Ljava/lang/Object;)V

    invoke-direct {v10, v8, v7}, LGa/s;-><init>(Ljava/time/LocalDate;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    if-eqz v9, :cond_11

    sget-object v8, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->HOT_FLASH_SESSION_COUNT:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    iget-object v9, v9, Lcom/eightsleep/data_metrics/domain/model/Sample;->b:Ljava/util/Map;

    invoke-interface {v9, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Double;

    if-eqz v8, :cond_11

    invoke-virtual {v8}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    goto :goto_11

    :cond_11
    const-wide/16 v8, 0x0

    :goto_11
    invoke-static {v8, v9}, LXm/a;->T(D)I

    move-result v8

    new-instance v9, Lwg/h;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    sget-object v12, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v9, v8, v12, v10, v4}, Lwg/h;-><init>(Ljava/lang/Integer;Ljava/lang/Boolean;LGa/s;Z)V

    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/2addr v5, v4

    goto :goto_f

    :cond_12
    if-eqz v2, :cond_15

    iget-object v0, v2, Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;->j:Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const-wide/16 v4, 0x0

    :goto_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_14

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/eightsleep/data_metrics/domain/model/Sample;

    iget-object v6, v6, Lcom/eightsleep/data_metrics/domain/model/Sample;->b:Ljava/util/Map;

    sget-object v7, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->HOT_FLASH_SESSION_COUNT:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Double;

    if-eqz v6, :cond_13

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    goto :goto_13

    :cond_13
    const-wide/16 v6, 0x0

    :goto_13
    add-double/2addr v4, v6

    goto :goto_12

    :cond_14
    invoke-static {v4, v5}, LXm/a;->T(D)I

    move-result v0

    goto :goto_14

    :cond_15
    const/4 v0, 0x0

    :goto_14
    if-eqz v2, :cond_16

    iget-object v2, v2, Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;->c:Ljava/util/Map;

    sget-object v4, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->HOT_FLASH_SESSION_COUNT:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    if-eqz v2, :cond_16

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    invoke-static {v4, v5}, LXm/a;->T(D)I

    move-result v7

    goto :goto_15

    :cond_16
    const/4 v7, 0x0

    :goto_15
    new-instance v2, Lwg/b;

    invoke-direct {v2, v1, v3, v0, v7}, Lwg/b;-><init>(Ljava/util/ArrayList;Ljava/util/ArrayList;II)V

    new-instance v12, Lwg/T;

    move-object/from16 v17, v2

    invoke-direct/range {v12 .. v17}, Lwg/T;-><init>(ILjava/time/Duration;Lcom/eightsleep/data_core/enums/SleepStage;Ljava/util/List;Lwg/b;)V

    return-object v12
.end method


# virtual methods
.method public getInitialViewState()LY7/n;
    .locals 6

    new-instance p0, LY7/n;

    new-instance v0, Lwg/T;

    sget-object v2, Ljava/time/Duration;->ZERO:Ljava/time/Duration;

    sget-object v4, Lwg/T;->f:Ljava/util/List;

    const/4 v1, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lwg/T;-><init>(ILjava/time/Duration;Lcom/eightsleep/data_core/enums/SleepStage;Ljava/util/List;Lwg/b;)V

    invoke-direct {p0, v0}, LY7/n;-><init>(Ld8/k;)V

    return-object p0
.end method

.method public bridge synthetic onUiAction(LZ7/c;)V
    .locals 0

    .line 1
    check-cast p1, Ltg/v;

    invoke-virtual {p0, p1}, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;->onUiAction(Ltg/v;)V

    return-void
.end method

.method public onUiAction(Ltg/v;)V
    .locals 1

    const-string v0, "action"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    sget-object v0, LRc/A;->a:LRc/A;

    invoke-virtual {p0, p1, v0}, LL8/e;->logUiActionEvent(LZ7/c;LRc/B;)V

    .line 3
    instance-of p1, p1, Ltg/u;

    if-eqz p1, :cond_0

    invoke-virtual {p0}, LL8/e;->onBackPressed()V

    return-void

    .line 4
    :cond_0
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0
.end method
