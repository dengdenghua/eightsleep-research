.class public final Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor;
.super Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/MetricDataProcessor;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/MetricDataProcessor<",
        "Lwg/k0;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0006\u0008\u0007\u0018\u0000 \u00142\u0008\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u0014B\u0011\u0008\u0007\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J<\u0010\u0011\u001a\u00020\u00022\u0006\u0010\u0008\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\t2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u000b2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0096@\u00a2\u0006\u0004\u0008\u0011\u0010\u0012R\u0014\u0010\u0004\u001a\u00020\u00038\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0004\u0010\u0013\u00a8\u0006\u0015"
    }
    d2 = {
        "Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor;",
        "Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/MetricDataProcessor;",
        "Lwg/k0;",
        "Luc/G;",
        "getMetricAggregatesUseCase",
        "<init>",
        "(Luc/G;)V",
        "LGa/s;",
        "date",
        "Lcom/eightsleep/data_metrics/enums/MetricDataPeriod;",
        "period",
        "Lcom/eightsleep/data_metrics/domain/model/Sample;",
        "sample",
        "Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;",
        "aggregate",
        "",
        "showLabel",
        "transformPeriodData",
        "(LGa/s;Lcom/eightsleep/data_metrics/enums/MetricDataPeriod;Lcom/eightsleep/data_metrics/domain/model/Sample;Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;ZLLm/c;)Ljava/lang/Object;",
        "Luc/G;",
        "Companion",
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
.field public static final $stable:I

.field private static final AGGREGATE_WEEK_PERIODS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/eightsleep/data_metrics/enums/MetricDataPeriod;",
            ">;"
        }
    .end annotation
.end field

.field public static final Companion:Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$Companion;


# instance fields
.field private final getMetricAggregatesUseCase:Luc/G;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor;->Companion:Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$Companion;

    const/16 v0, 0x8

    sput v0, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor;->$stable:I

    sget-object v0, Lcom/eightsleep/data_metrics/enums/MetricDataPeriod;->SIX_MONTHS:Lcom/eightsleep/data_metrics/enums/MetricDataPeriod;

    sget-object v1, Lcom/eightsleep/data_metrics/enums/MetricDataPeriod;->YEAR:Lcom/eightsleep/data_metrics/enums/MetricDataPeriod;

    filled-new-array {v0, v1}, [Lcom/eightsleep/data_metrics/enums/MetricDataPeriod;

    move-result-object v0

    invoke-static {v0}, LIm/n;->O0([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor;->AGGREGATE_WEEK_PERIODS:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Luc/G;)V
    .locals 1

    const-string v0, "getMetricAggregatesUseCase"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->WELLBEING_COUNT:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    invoke-direct {p0, v0}, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/MetricDataProcessor;-><init>(Lcom/eightsleep/data_metrics/enums/AggregateMetricType;)V

    iput-object p1, p0, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor;->getMetricAggregatesUseCase:Luc/G;

    return-void
.end method


# virtual methods
.method public transformPeriodData(LGa/s;Lcom/eightsleep/data_metrics/enums/MetricDataPeriod;Lcom/eightsleep/data_metrics/domain/model/Sample;Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;ZLLm/c;)Ljava/lang/Object;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LGa/s;",
            "Lcom/eightsleep/data_metrics/enums/MetricDataPeriod;",
            "Lcom/eightsleep/data_metrics/domain/model/Sample;",
            "Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;",
            "Z",
            "LLm/c<",
            "-",
            "Lwg/k0;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p6

    instance-of v3, v2, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;

    if-eqz v3, :cond_0

    move-object v3, v2

    check-cast v3, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;

    iget v4, v3, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;->label:I

    const/high16 v5, -0x80000000

    and-int v6, v4, v5

    if-eqz v6, :cond_0

    sub-int/2addr v4, v5

    iput v4, v3, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;->label:I

    goto :goto_0

    :cond_0
    new-instance v3, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;

    invoke-direct {v3, v0, v2}, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;-><init>(Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor;LLm/c;)V

    :goto_0
    iget-object v2, v3, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;->result:Ljava/lang/Object;

    sget-object v4, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v5, v3, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;->label:I

    const/4 v6, 0x1

    const/4 v7, 0x2

    const/4 v8, 0x0

    if-eqz v5, :cond_3

    if-eq v5, v6, :cond_2

    if-ne v5, v7, :cond_1

    iget-boolean v0, v3, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;->Z$0:Z

    iget-object v1, v3, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;->L$2:Ljava/lang/Object;

    check-cast v1, Lcom/eightsleep/data_metrics/domain/model/Sample;

    iget-object v4, v3, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;->L$1:Ljava/lang/Object;

    check-cast v4, Lcom/eightsleep/data_metrics/enums/MetricDataPeriod;

    iget-object v3, v3, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;->L$0:Ljava/lang/Object;

    check-cast v3, LGa/s;

    invoke-static {v2}, LX4/x;->M(Ljava/lang/Object;)V

    move v11, v0

    move-object v10, v1

    move-object v9, v3

    move-object v1, v4

    goto :goto_3

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    iget-boolean v0, v3, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;->Z$0:Z

    iget-object v1, v3, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;->L$2:Ljava/lang/Object;

    check-cast v1, Lcom/eightsleep/data_metrics/domain/model/Sample;

    iget-object v5, v3, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;->L$1:Ljava/lang/Object;

    check-cast v5, Lcom/eightsleep/data_metrics/enums/MetricDataPeriod;

    iget-object v9, v3, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;->L$0:Ljava/lang/Object;

    check-cast v9, LGa/s;

    invoke-static {v2}, LX4/x;->M(Ljava/lang/Object;)V

    move v11, v0

    move-object v10, v1

    move-object v1, v5

    goto :goto_1

    :cond_3
    invoke-static {v2}, LX4/x;->M(Ljava/lang/Object;)V

    sget-object v2, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor;->AGGREGATE_WEEK_PERIODS:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    iget-object v0, v0, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor;->getMetricAggregatesUseCase:Luc/G;

    invoke-virtual/range {p1 .. p1}, LGa/s;->k()Ljava/time/LocalDate;

    move-result-object v2

    sget-object v5, Lcom/eightsleep/data_metrics/enums/AggregateMetricPeriod;->WEEK:Lcom/eightsleep/data_metrics/enums/AggregateMetricPeriod;

    move-object/from16 v9, p1

    iput-object v9, v3, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;->L$0:Ljava/lang/Object;

    iput-object v1, v3, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;->L$1:Ljava/lang/Object;

    move-object/from16 v10, p3

    iput-object v10, v3, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;->L$2:Ljava/lang/Object;

    move/from16 v11, p5

    iput-boolean v11, v3, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;->Z$0:Z

    iput v6, v3, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;->label:I

    invoke-static {v0, v2, v5, v3, v6}, LGk/m;->K(Luc/G;Ljava/time/LocalDate;Lcom/eightsleep/data_metrics/enums/AggregateMetricPeriod;LNm/c;I)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v4, :cond_4

    goto :goto_2

    :cond_4
    :goto_1
    check-cast v2, Lzo/l;

    new-instance v0, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$$inlined$filter$1;

    invoke-direct {v0, v2}, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$$inlined$filter$1;-><init>(Lzo/l;)V

    iput-object v9, v3, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;->L$0:Ljava/lang/Object;

    iput-object v1, v3, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;->L$1:Ljava/lang/Object;

    iput-object v10, v3, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;->L$2:Ljava/lang/Object;

    iput-boolean v11, v3, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;->Z$0:Z

    iput v7, v3, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor$transformPeriodData$1;->label:I

    invoke-static {v0, v3}, Lzo/s;->u(Lzo/l;LLm/c;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v4, :cond_5

    :goto_2
    return-object v4

    :cond_5
    :goto_3
    check-cast v2, Lya/j;

    goto :goto_4

    :cond_6
    move-object/from16 v9, p1

    move-object/from16 v10, p3

    move/from16 v11, p5

    move-object v2, v8

    :goto_4
    const/4 v0, 0x0

    if-eqz v2, :cond_11

    invoke-virtual {v2}, Lya/j;->e()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_11

    invoke-static {v3}, LIm/r;->Z0(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;

    if-eqz v3, :cond_11

    iget-object v3, v3, Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;->j:Ljava/util/List;

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_7

    move-object v4, v8

    goto/16 :goto_b

    :cond_7
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_8

    goto/16 :goto_b

    :cond_8
    move-object v5, v4

    check-cast v5, Lcom/eightsleep/data_metrics/domain/model/Sample;

    iget-object v12, v5, Lcom/eightsleep/data_metrics/domain/model/Sample;->f:Ljava/util/Map;

    sget-object v13, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->WELLBEING_HR:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    invoke-interface {v12, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lrc/k;

    if-eqz v12, :cond_9

    iget v12, v12, Lrc/k;->a:I

    goto :goto_5

    :cond_9
    move v12, v0

    :goto_5
    sget-object v13, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->WELLBEING_RR:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    iget-object v5, v5, Lcom/eightsleep/data_metrics/domain/model/Sample;->f:Ljava/util/Map;

    invoke-interface {v5, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lrc/k;

    if-eqz v13, :cond_a

    iget v13, v13, Lrc/k;->a:I

    goto :goto_6

    :cond_a
    move v13, v0

    :goto_6
    add-int/2addr v12, v13

    sget-object v13, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->WELLBEING_HRV:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    invoke-interface {v5, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lrc/k;

    if-eqz v5, :cond_b

    iget v5, v5, Lrc/k;->a:I

    goto :goto_7

    :cond_b
    move v5, v0

    :goto_7
    add-int/2addr v12, v5

    :cond_c
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    move-object v13, v5

    check-cast v13, Lcom/eightsleep/data_metrics/domain/model/Sample;

    iget-object v14, v13, Lcom/eightsleep/data_metrics/domain/model/Sample;->f:Ljava/util/Map;

    sget-object v15, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->WELLBEING_HR:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    invoke-interface {v14, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lrc/k;

    if-eqz v14, :cond_d

    iget v14, v14, Lrc/k;->a:I

    goto :goto_8

    :cond_d
    move v14, v0

    :goto_8
    sget-object v15, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->WELLBEING_RR:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    iget-object v13, v13, Lcom/eightsleep/data_metrics/domain/model/Sample;->f:Ljava/util/Map;

    invoke-interface {v13, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lrc/k;

    if-eqz v15, :cond_e

    iget v15, v15, Lrc/k;->a:I

    goto :goto_9

    :cond_e
    move v15, v0

    :goto_9
    add-int/2addr v14, v15

    sget-object v15, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->WELLBEING_HRV:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    invoke-interface {v13, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lrc/k;

    if-eqz v13, :cond_f

    iget v13, v13, Lrc/k;->a:I

    goto :goto_a

    :cond_f
    move v13, v0

    :goto_a
    add-int/2addr v14, v13

    if-ge v12, v14, :cond_10

    move-object v4, v5

    move v12, v14

    :cond_10
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_c

    :goto_b
    check-cast v4, Lcom/eightsleep/data_metrics/domain/model/Sample;

    goto :goto_c

    :cond_11
    move-object v4, v8

    :goto_c
    sget-object v3, Ltimber/log/Timber;->a:Lbr/a;

    const-string v5, "Outliers"

    invoke-virtual {v3, v5}, Lbr/a;->p(Ljava/lang/String;)V

    if-eqz v10, :cond_12

    iget-object v12, v10, Lcom/eightsleep/data_metrics/domain/model/Sample;->a:LGa/s;

    goto :goto_d

    :cond_12
    move-object v12, v8

    :goto_d
    if-eqz v10, :cond_13

    iget-object v13, v10, Lcom/eightsleep/data_metrics/domain/model/Sample;->f:Ljava/util/Map;

    goto :goto_e

    :cond_13
    move-object v13, v8

    :goto_e
    new-instance v14, LHm/k;

    invoke-direct {v14, v12, v13}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "Sample: "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    new-array v13, v0, [Ljava/lang/Object;

    invoke-virtual {v3, v12, v13}, Lbr/a;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v3, v5}, Lbr/a;->p(Ljava/lang/String;)V

    const/16 v5, 0xa

    if-eqz v2, :cond_14

    invoke-virtual {v2}, Lya/j;->e()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_14

    invoke-static {v2}, LIm/r;->Z0(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;

    if-eqz v2, :cond_14

    iget-object v2, v2, Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;->j:Ljava/util/List;

    new-instance v12, Ljava/util/ArrayList;

    invoke-static {v2, v5}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v13

    invoke-direct {v12, v13}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_15

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/eightsleep/data_metrics/domain/model/Sample;

    iget-object v14, v13, Lcom/eightsleep/data_metrics/domain/model/Sample;->a:LGa/s;

    new-instance v15, LHm/k;

    iget-object v13, v13, Lcom/eightsleep/data_metrics/domain/model/Sample;->f:Ljava/util/Map;

    invoke-direct {v15, v14, v13}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v12, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_f

    :cond_14
    move-object v12, v8

    :cond_15
    if-eqz v4, :cond_16

    iget-object v2, v4, Lcom/eightsleep/data_metrics/domain/model/Sample;->a:LGa/s;

    goto :goto_10

    :cond_16
    move-object v2, v8

    :goto_10
    if-eqz v4, :cond_17

    iget-object v13, v4, Lcom/eightsleep/data_metrics/domain/model/Sample;->f:Ljava/util/Map;

    goto :goto_11

    :cond_17
    move-object v13, v8

    :goto_11
    new-instance v14, LHm/k;

    invoke-direct {v14, v2, v13}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v13, "Outliers Week: "

    invoke-direct {v2, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v12, "\nWorst Day: "

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v12, "}"

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-array v12, v0, [Ljava/lang/Object;

    invoke-virtual {v3, v2, v12}, Lbr/a;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    filled-new-array {v10, v4}, [Lcom/eightsleep/data_metrics/domain/model/Sample;

    move-result-object v2

    invoke-static {v2}, LIm/s;->g0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    new-instance v3, Ljava/util/ArrayList;

    invoke-static {v2, v5}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_12
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/eightsleep/data_metrics/domain/model/Sample;

    if-eqz v4, :cond_18

    iget-object v5, v4, Lcom/eightsleep/data_metrics/domain/model/Sample;->f:Ljava/util/Map;

    sget-object v10, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->WELLBEING_HR:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    invoke-interface {v5, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lrc/k;

    if-eqz v5, :cond_18

    new-instance v10, Ljava/lang/Integer;

    iget v5, v5, Lrc/k;->a:I

    invoke-direct {v10, v5}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_13

    :cond_18
    move-object v10, v8

    :goto_13
    if-eqz v4, :cond_19

    iget-object v5, v4, Lcom/eightsleep/data_metrics/domain/model/Sample;->f:Ljava/util/Map;

    sget-object v12, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->WELLBEING_HRV:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    invoke-interface {v5, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lrc/k;

    if-eqz v5, :cond_19

    new-instance v12, Ljava/lang/Integer;

    iget v5, v5, Lrc/k;->a:I

    invoke-direct {v12, v5}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_14

    :cond_19
    move-object v12, v8

    :goto_14
    if-eqz v4, :cond_1a

    iget-object v4, v4, Lcom/eightsleep/data_metrics/domain/model/Sample;->f:Ljava/util/Map;

    sget-object v5, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->WELLBEING_RR:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lrc/k;

    if-eqz v4, :cond_1a

    new-instance v5, Ljava/lang/Integer;

    iget v4, v4, Lrc/k;->a:I

    invoke-direct {v5, v4}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_15

    :cond_1a
    move-object v5, v8

    :goto_15
    new-instance v4, LHm/q;

    invoke-direct {v4, v10, v12, v5}, LHm/q;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_12

    :cond_1b
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, LHm/q;

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, LHm/q;

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Integer;

    iget-object v5, v2, LHm/q;->a:Ljava/lang/Object;

    aput-object v5, v4, v0

    iget-object v5, v2, LHm/q;->b:Ljava/lang/Object;

    aput-object v5, v4, v6

    iget-object v6, v2, LHm/q;->c:Ljava/lang/Object;

    aput-object v6, v4, v7

    invoke-static {v4}, LIm/n;->h0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    check-cast v4, Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_1d

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_16
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1c

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Number;

    invoke-virtual {v7}, Ljava/lang/Number;->intValue()I

    move-result v7

    add-int/2addr v0, v7

    goto :goto_16

    :cond_1c
    new-instance v4, Ljava/lang/Integer;

    invoke-direct {v4, v0}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_17

    :cond_1d
    move-object v4, v8

    :goto_17
    sget-object v0, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor;->AGGREGATE_WEEK_PERIODS:Ljava/util/Set;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    goto :goto_18

    :cond_1e
    move-object v3, v2

    :goto_18
    new-instance v0, Lwg/j0;

    iget-object v1, v3, LHm/q;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    iget-object v7, v3, LHm/q;->b:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Integer;

    iget-object v3, v3, LHm/q;->c:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Integer;

    invoke-direct {v0, v1, v7, v3}, Lwg/j0;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V

    sget-object v1, Lcom/eightsleep/presentation_metrics/enums/OutlierType;->HR:Lcom/eightsleep/presentation_metrics/enums/OutlierType;

    new-instance v3, LHm/k;

    iget-object v2, v2, LHm/q;->a:Ljava/lang/Object;

    invoke-direct {v3, v1, v2}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v7, Lcom/eightsleep/presentation_metrics/enums/OutlierType;->HRV:Lcom/eightsleep/presentation_metrics/enums/OutlierType;

    new-instance v10, LHm/k;

    invoke-direct {v10, v7, v5}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v12, Lcom/eightsleep/presentation_metrics/enums/OutlierType;->BR:Lcom/eightsleep/presentation_metrics/enums/OutlierType;

    new-instance v13, LHm/k;

    invoke-direct {v13, v12, v6}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {v3, v10, v13}, [LHm/k;

    move-result-object v3

    invoke-static {v3}, LIm/F;->R([LHm/k;)Ljava/util/Map;

    move-result-object v3

    check-cast v2, Ljava/lang/Integer;

    if-eqz v2, :cond_1f

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    if-lez v2, :cond_1f

    goto :goto_19

    :cond_1f
    move-object v1, v8

    :goto_19
    check-cast v5, Ljava/lang/Integer;

    if-eqz v5, :cond_20

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v2

    if-lez v2, :cond_20

    goto :goto_1a

    :cond_20
    move-object v7, v8

    :goto_1a
    check-cast v6, Ljava/lang/Integer;

    if-eqz v6, :cond_21

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v2

    if-lez v2, :cond_21

    move-object v8, v12

    :cond_21
    filled-new-array {v1, v7, v8}, [Lcom/eightsleep/presentation_metrics/enums/OutlierType;

    move-result-object v1

    invoke-static {v1}, LIm/n;->h0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    new-instance v2, Lwg/k0;

    move-object/from16 p4, v0

    move-object/from16 p6, v1

    move-object/from16 p0, v2

    move-object/from16 p5, v3

    move-object/from16 p1, v4

    move-object/from16 p2, v9

    move/from16 p3, v11

    invoke-direct/range {p0 .. p6}, Lwg/k0;-><init>(Ljava/lang/Integer;LGa/s;ZLwg/j0;Ljava/util/Map;Ljava/util/List;)V

    move-object/from16 v0, p0

    return-object v0
.end method
