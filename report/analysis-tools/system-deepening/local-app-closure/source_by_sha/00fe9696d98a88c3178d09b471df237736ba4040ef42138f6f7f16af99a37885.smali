.class public final Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;
.super LL8/e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$Companion;,
        Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$HealthCheckCalculationData;,
        Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$PregnancyModeUiState;,
        Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "LL8/e;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00d4\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0013\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0006\u0008\u0007\u0018\u0000 _2\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0003_`aB\u0081\u0001\u0008\u0007\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\u0008\u0012\u0006\u0010\u000b\u001a\u00020\n\u0012\u0006\u0010\r\u001a\u00020\u000c\u0012\u0006\u0010\u000f\u001a\u00020\u000e\u0012\u0006\u0010\u0011\u001a\u00020\u0010\u0012\u0006\u0010\u0013\u001a\u00020\u0012\u0012\u0006\u0010\u0015\u001a\u00020\u0014\u0012\u0006\u0010\u0017\u001a\u00020\u0016\u0012\u0006\u0010\u0019\u001a\u00020\u0018\u0012\u0006\u0010\u001b\u001a\u00020\u001a\u0012\u0006\u0010\u001d\u001a\u00020\u001c\u0012\u0006\u0010\u001f\u001a\u00020\u001e\u0012\u0006\u0010!\u001a\u00020 \u00a2\u0006\u0004\u0008\"\u0010#J<\u0010.\u001a\u00020-2\u0008\u0010%\u001a\u0004\u0018\u00010$2\u0008\u0010\'\u001a\u0004\u0018\u00010&2\u000c\u0010*\u001a\u0008\u0012\u0004\u0012\u00020)0(2\u0008\u0010,\u001a\u0004\u0018\u00010+H\u0082@\u00a2\u0006\u0004\u0008.\u0010/J\u0017\u00102\u001a\u00020-2\u0006\u00101\u001a\u000200H\u0002\u00a2\u0006\u0004\u00082\u00103J\u0017\u00105\u001a\u00020-2\u0006\u00104\u001a\u000200H\u0002\u00a2\u0006\u0004\u00085\u00103J\u001d\u00107\u001a\u00020-2\u000c\u0010*\u001a\u0008\u0012\u0004\u0012\u0002060(H\u0002\u00a2\u0006\u0004\u00087\u00108J\u000f\u00109\u001a\u00020-H\u0002\u00a2\u0006\u0004\u00089\u0010:J\u000f\u0010;\u001a\u00020-H\u0002\u00a2\u0006\u0004\u0008;\u0010:J\u000f\u0010=\u001a\u00020<H\u0016\u00a2\u0006\u0004\u0008=\u0010>J\u0017\u0010@\u001a\u00020-2\u0006\u0010?\u001a\u00020\u0003H\u0016\u00a2\u0006\u0004\u0008@\u0010AR\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0005\u0010BR\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0007\u0010CR\u0014\u0010\t\u001a\u00020\u00088\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\t\u0010DR\u0014\u0010\u000b\u001a\u00020\n8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000b\u0010ER\u0014\u0010\r\u001a\u00020\u000c8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\r\u0010FR\u0014\u0010\u000f\u001a\u00020\u000e8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000f\u0010GR\u0014\u0010\u0011\u001a\u00020\u00108\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0011\u0010HR\u0014\u0010\u0013\u001a\u00020\u00128\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010IR\u0014\u0010\u0015\u001a\u00020\u00148\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0015\u0010JR\u0014\u0010\u0017\u001a\u00020\u00168\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0017\u0010KR\u0014\u0010\u0019\u001a\u00020\u00188\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0019\u0010LR\u0014\u0010\u001b\u001a\u00020\u001a8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001b\u0010MR\u0014\u0010\u001d\u001a\u00020\u001c8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001d\u0010NR\u0014\u0010\u001f\u001a\u00020\u001e8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001f\u0010OR&\u0010T\u001a\u0014\u0012\u0004\u0012\u00020Q\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020S0R0P8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008T\u0010UR\u0016\u0010W\u001a\u00020V8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008W\u0010XR\u001c\u0010Z\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010+0Y8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008Z\u0010[R\u0014\u0010]\u001a\u00020\\8BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008]\u0010^\u00a8\u0006b"
    }
    d2 = {
        "Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;",
        "LL8/e;",
        "Lwg/F;",
        "Ltg/t;",
        "LJa/n;",
        "observeSelectedDateUseCase",
        "Luc/u0;",
        "observeTrendByDateUseCase",
        "Luc/p0;",
        "observeMetricAggregatesByDatesUseCase",
        "Luc/f1;",
        "smartFetchMetricAggregatesUseCase",
        "Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/RestingHeartRateMetricDataProcessor;",
        "restingHeartRateMetricDataProcessor",
        "Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/RestingHeartRateTrendMetricDataProcessor;",
        "restingHeartRateTrendMetricDataProcessor",
        "Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HeartRateVariabilityMetricDataProcessor;",
        "heartRateVariabilityMetricDataProcessor",
        "Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HeartRateVariabilityTrendMetricDataProcessor;",
        "heartRateVariabilityTrendMetricDataProcessor",
        "Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/BreathRateMetricDataProcessor;",
        "breathRateMetricDataProcessor",
        "Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/BreathRateTrendMetricDataProcessor;",
        "breathRateTrendMetricDataProcessor",
        "Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor;",
        "healthTrendsOutliersDataProcessor",
        "LFd/X0;",
        "observeTagsUseCase",
        "LFd/k2;",
        "updateTagsUseCase",
        "Lld/I;",
        "getPregnancyModeUseCase",
        "LRc/b;",
        "analytics",
        "<init>",
        "(LJa/n;Luc/u0;Luc/p0;Luc/f1;Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/RestingHeartRateMetricDataProcessor;Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/RestingHeartRateTrendMetricDataProcessor;Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HeartRateVariabilityMetricDataProcessor;Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HeartRateVariabilityTrendMetricDataProcessor;Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/BreathRateMetricDataProcessor;Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/BreathRateTrendMetricDataProcessor;Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor;LFd/X0;LFd/k2;Lld/I;LRc/b;)V",
        "Lcom/eightsleep/data_metrics/domain/model/DailyTrends;",
        "trends",
        "Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;",
        "aggregates",
        "",
        "Lyd/x;",
        "tags",
        "Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$PregnancyModeUiState;",
        "pregnancyMode",
        "LHm/B;",
        "updateContent",
        "(Lcom/eightsleep/data_metrics/domain/model/DailyTrends;Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;Ljava/util/List;Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$PregnancyModeUiState;LLm/c;)Ljava/lang/Object;",
        "",
        "toggledTag",
        "toggleTag",
        "(Ljava/lang/String;)V",
        "tag",
        "addCustomTag",
        "Lwg/j1;",
        "updateTags",
        "(Ljava/util/List;)V",
        "showAddTagModalAfterDelay",
        "()V",
        "hideAddTagModal",
        "LY7/n;",
        "getInitialViewState",
        "()LY7/n;",
        "action",
        "onUiAction",
        "(Ltg/t;)V",
        "LJa/n;",
        "Luc/u0;",
        "Luc/p0;",
        "Luc/f1;",
        "Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/RestingHeartRateMetricDataProcessor;",
        "Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/RestingHeartRateTrendMetricDataProcessor;",
        "Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HeartRateVariabilityMetricDataProcessor;",
        "Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HeartRateVariabilityTrendMetricDataProcessor;",
        "Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/BreathRateMetricDataProcessor;",
        "Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/BreathRateTrendMetricDataProcessor;",
        "Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor;",
        "LFd/X0;",
        "LFd/k2;",
        "Lld/I;",
        "",
        "Lcom/eightsleep/data_metrics/enums/AggregateMetricType;",
        "Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/MetricDataProcessor;",
        "Lwg/t0;",
        "dataProcessors",
        "Ljava/util/Map;",
        "Ljava/time/LocalDate;",
        "selectedDate",
        "Ljava/time/LocalDate;",
        "Lzo/r0;",
        "pregnancyModeFlow",
        "Lzo/r0;",
        "",
        "isPregnancyModeAvailable",
        "()Z",
        "Companion",
        "PregnancyModeUiState",
        "HealthCheckCalculationData",
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

.field public static final Companion:Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$Companion;

.field private static final METRIC_TYPES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/eightsleep/data_metrics/enums/AggregateMetricType;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final breathRateMetricDataProcessor:Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/BreathRateMetricDataProcessor;

.field private final breathRateTrendMetricDataProcessor:Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/BreathRateTrendMetricDataProcessor;

.field private final dataProcessors:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/eightsleep/data_metrics/enums/AggregateMetricType;",
            "Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/MetricDataProcessor<",
            "Lwg/t0;",
            ">;>;"
        }
    .end annotation
.end field

.field private final getPregnancyModeUseCase:Lld/I;

.field private final healthTrendsOutliersDataProcessor:Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor;

.field private final heartRateVariabilityMetricDataProcessor:Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HeartRateVariabilityMetricDataProcessor;

.field private final heartRateVariabilityTrendMetricDataProcessor:Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HeartRateVariabilityTrendMetricDataProcessor;

.field private final observeMetricAggregatesByDatesUseCase:Luc/p0;

.field private final observeSelectedDateUseCase:LJa/n;

.field private final observeTagsUseCase:LFd/X0;

.field private final observeTrendByDateUseCase:Luc/u0;

.field private final pregnancyModeFlow:Lzo/r0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lzo/r0;"
        }
    .end annotation
.end field

.field private final restingHeartRateMetricDataProcessor:Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/RestingHeartRateMetricDataProcessor;

.field private final restingHeartRateTrendMetricDataProcessor:Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/RestingHeartRateTrendMetricDataProcessor;

.field private selectedDate:Ljava/time/LocalDate;

.field private final smartFetchMetricAggregatesUseCase:Luc/f1;

.field private final updateTagsUseCase:LFd/k2;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    new-instance v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->Companion:Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$Companion;

    const/16 v0, 0x8

    sput v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->$stable:I

    sget-object v1, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->HEART_RATE:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    sget-object v2, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->WELLBEING_HR_UPPER:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    sget-object v3, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->HRV:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    sget-object v4, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->WELLBEING_HRV_LOWER:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    sget-object v5, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->BREATH_RATE:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    sget-object v6, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->WELLBEING_RR_UPPER:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    filled-new-array/range {v1 .. v6}, [Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    move-result-object v0

    invoke-static {v0}, LIm/s;->g0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->METRIC_TYPES:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(LJa/n;Luc/u0;Luc/p0;Luc/f1;Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/RestingHeartRateMetricDataProcessor;Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/RestingHeartRateTrendMetricDataProcessor;Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HeartRateVariabilityMetricDataProcessor;Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HeartRateVariabilityTrendMetricDataProcessor;Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/BreathRateMetricDataProcessor;Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/BreathRateTrendMetricDataProcessor;Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor;LFd/X0;LFd/k2;Lld/I;LRc/b;)V
    .locals 16

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    move-object/from16 v11, p11

    move-object/from16 v12, p12

    move-object/from16 v13, p13

    move-object/from16 v14, p14

    move-object/from16 v15, p15

    const-string v0, "observeSelectedDateUseCase"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "observeTrendByDateUseCase"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "observeMetricAggregatesByDatesUseCase"

    invoke-static {v3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "smartFetchMetricAggregatesUseCase"

    invoke-static {v4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "restingHeartRateMetricDataProcessor"

    invoke-static {v5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "restingHeartRateTrendMetricDataProcessor"

    invoke-static {v6, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "heartRateVariabilityMetricDataProcessor"

    invoke-static {v7, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "heartRateVariabilityTrendMetricDataProcessor"

    invoke-static {v8, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "breathRateMetricDataProcessor"

    invoke-static {v9, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "breathRateTrendMetricDataProcessor"

    invoke-static {v10, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "healthTrendsOutliersDataProcessor"

    invoke-static {v11, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "observeTagsUseCase"

    invoke-static {v12, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "updateTagsUseCase"

    invoke-static {v13, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "getPregnancyModeUseCase"

    invoke-static {v14, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "analytics"

    invoke-static {v15, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, LL8/e;-><init>(LRc/b;)V

    iput-object v1, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->observeSelectedDateUseCase:LJa/n;

    iput-object v2, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->observeTrendByDateUseCase:Luc/u0;

    iput-object v3, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->observeMetricAggregatesByDatesUseCase:Luc/p0;

    iput-object v4, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->smartFetchMetricAggregatesUseCase:Luc/f1;

    iput-object v5, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->restingHeartRateMetricDataProcessor:Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/RestingHeartRateMetricDataProcessor;

    iput-object v6, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->restingHeartRateTrendMetricDataProcessor:Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/RestingHeartRateTrendMetricDataProcessor;

    iput-object v7, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->heartRateVariabilityMetricDataProcessor:Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HeartRateVariabilityMetricDataProcessor;

    iput-object v8, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->heartRateVariabilityTrendMetricDataProcessor:Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HeartRateVariabilityTrendMetricDataProcessor;

    iput-object v9, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->breathRateMetricDataProcessor:Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/BreathRateMetricDataProcessor;

    iput-object v10, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->breathRateTrendMetricDataProcessor:Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/BreathRateTrendMetricDataProcessor;

    iput-object v11, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->healthTrendsOutliersDataProcessor:Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor;

    iput-object v12, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->observeTagsUseCase:LFd/X0;

    iput-object v13, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->updateTagsUseCase:LFd/k2;

    iput-object v14, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->getPregnancyModeUseCase:Lld/I;

    const/4 v1, 0x6

    new-array v1, v1, [Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/MetricDataProcessor;

    const/4 v2, 0x0

    aput-object v5, v1, v2

    const/4 v2, 0x1

    aput-object v6, v1, v2

    const/4 v2, 0x2

    aput-object v7, v1, v2

    const/4 v2, 0x3

    aput-object v8, v1, v2

    const/4 v3, 0x4

    aput-object v9, v1, v3

    const/4 v3, 0x5

    aput-object v10, v1, v3

    invoke-static {v1}, LIm/s;->g0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    const/16 v3, 0xa

    invoke-static {v1, v3}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-static {v3}, LIm/G;->J(I)I

    move-result v3

    const/16 v4, 0x10

    if-ge v3, v4, :cond_0

    move v3, v4

    :cond_0
    new-instance v4, Ljava/util/LinkedHashMap;

    invoke-direct {v4, v3}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v5, v3

    check-cast v5, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/MetricDataProcessor;

    invoke-virtual {v5}, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/MetricDataProcessor;->getMetricType()Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    move-result-object v5

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    iput-object v4, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->dataProcessors:Ljava/util/Map;

    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object v1

    const-string v3, "now(...)"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v1, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->selectedDate:Ljava/time/LocalDate;

    const/4 v1, 0x0

    invoke-static {v1}, Lzo/s;->c(Ljava/lang/Object;)Lzo/M0;

    move-result-object v3

    iput-object v3, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->pregnancyModeFlow:Lzo/r0;

    invoke-static {v0}, Landroidx/lifecycle/V;->h(Landroidx/lifecycle/b0;)Li3/a;

    move-result-object v3

    new-instance v4, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$1;

    invoke-direct {v4, v0, v1}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$1;-><init>(Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;LLm/c;)V

    invoke-static {v3, v1, v1, v4, v2}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    invoke-static {v0}, Landroidx/lifecycle/V;->h(Landroidx/lifecycle/b0;)Li3/a;

    move-result-object v3

    new-instance v4, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$2;

    invoke-direct {v4, v0, v1}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$2;-><init>(Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;LLm/c;)V

    invoke-static {v3, v1, v1, v4, v2}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    return-void
.end method

.method public static final synthetic access$getGetPregnancyModeUseCase$p(Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;)Lld/I;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->getPregnancyModeUseCase:Lld/I;

    return-object p0
.end method

.method public static final synthetic access$getObserveMetricAggregatesByDatesUseCase$p(Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;)Luc/p0;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->observeMetricAggregatesByDatesUseCase:Luc/p0;

    return-object p0
.end method

.method public static final synthetic access$getObserveSelectedDateUseCase$p(Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;)LJa/n;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->observeSelectedDateUseCase:LJa/n;

    return-object p0
.end method

.method public static final synthetic access$getObserveTagsUseCase$p(Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;)LFd/X0;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->observeTagsUseCase:LFd/X0;

    return-object p0
.end method

.method public static final synthetic access$getObserveTrendByDateUseCase$p(Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;)Luc/u0;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->observeTrendByDateUseCase:Luc/u0;

    return-object p0
.end method

.method public static final synthetic access$getPregnancyModeFlow$p(Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;)Lzo/r0;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->pregnancyModeFlow:Lzo/r0;

    return-object p0
.end method

.method public static final synthetic access$getSelectedDate$p(Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;)Ljava/time/LocalDate;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->selectedDate:Ljava/time/LocalDate;

    return-object p0
.end method

.method public static final synthetic access$getSmartFetchMetricAggregatesUseCase$p(Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;)Luc/f1;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->smartFetchMetricAggregatesUseCase:Luc/f1;

    return-object p0
.end method

.method public static final synthetic access$getUpdateTagsUseCase$p(Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;)LFd/k2;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->updateTagsUseCase:LFd/k2;

    return-object p0
.end method

.method public static final synthetic access$hideAddTagModal(Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;)V
    .locals 0

    invoke-direct {p0}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->hideAddTagModal()V

    return-void
.end method

.method public static final synthetic access$setSelectedDate$p(Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;Ljava/time/LocalDate;)V
    .locals 0

    iput-object p1, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->selectedDate:Ljava/time/LocalDate;

    return-void
.end method

.method public static final synthetic access$updateContent(Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;Lcom/eightsleep/data_metrics/domain/model/DailyTrends;Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;Ljava/util/List;Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$PregnancyModeUiState;LLm/c;)Ljava/lang/Object;
    .locals 0

    invoke-direct/range {p0 .. p5}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->updateContent(Lcom/eightsleep/data_metrics/domain/model/DailyTrends;Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;Ljava/util/List;Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$PregnancyModeUiState;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private final addCustomTag(Ljava/lang/String;)V
    .locals 3

    new-instance v0, Lkotlin/jvm/internal/A;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sget-object v1, LIm/z;->a:LIm/z;

    iput-object v1, v0, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    new-instance v1, Lcom/eightsleep/presentation_metrics/viewmodel/e;

    const/4 v2, 0x1

    invoke-direct {v1, p1, v0, v2}, Lcom/eightsleep/presentation_metrics/viewmodel/e;-><init>(Ljava/lang/String;Lkotlin/jvm/internal/A;I)V

    const/4 p1, 0x1

    invoke-static {p0, v1, p1}, Landroid/support/v4/media/session/b;->I(LY7/o;LVm/k;I)V

    invoke-direct {p0}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->hideAddTagModal()V

    iget-object p1, v0, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    check-cast p1, Ljava/util/Collection;

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, v0, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    invoke-direct {p0, p1}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->updateTags(Ljava/util/List;)V

    :cond_0
    return-void
.end method

.method private static final addCustomTag$lambda$15(Ljava/lang/String;Lkotlin/jvm/internal/A;Lwg/F;)Lwg/F;
    .locals 13

    const-string v0, "model"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p2, Lwg/F;->g:Lwg/p1;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v1, "tagName"

    invoke-static {p0, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, v0, Lwg/p1;->c:Ljava/util/List;

    iget-object v2, v0, Lwg/p1;->a:Ljava/util/List;

    invoke-static {p0, v1, v2}, LV5/s;->Q(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)LHm/k;

    move-result-object p0

    iget-object v1, p0, LHm/k;->a:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    iget-object p0, p0, LHm/k;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    const/4 v2, 0x2

    invoke-static {v0, p0, v1, v2}, Lwg/p1;->f(Lwg/p1;Ljava/util/List;Ljava/util/List;I)Lwg/p1;

    move-result-object v10

    invoke-static {v10}, Lwg/l1;->c(Lwg/q1;)Ljava/util/ArrayList;

    move-result-object p0

    iput-object p0, p1, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/16 v12, 0xbf

    move-object v3, p2

    invoke-static/range {v3 .. v12}, Lwg/F;->u(Lwg/F;Ljava/util/List;Lwg/m0;Lwg/O;Lwg/v;Lwg/Q;ZLwg/p1;Ljava/lang/Boolean;I)Lwg/F;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ljava/lang/String;Lkotlin/jvm/internal/A;Lwg/F;)Lwg/F;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->toggleTag$lambda$13(Ljava/lang/String;Lkotlin/jvm/internal/A;Lwg/F;)Lwg/F;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Ljava/lang/String;Lkotlin/jvm/internal/A;Lwg/F;)Lwg/F;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->addCustomTag$lambda$15(Ljava/lang/String;Lkotlin/jvm/internal/A;Lwg/F;)Lwg/F;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Lwg/F;)Lwg/F;
    .locals 0

    invoke-static {p0}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->hideAddTagModal$lambda$16(Lwg/F;)Lwg/F;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f(Lrc/a;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/util/List;Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$PregnancyModeUiState;Lwg/m0;Lwg/O;Lwg/F;)Lwg/F;
    .locals 0

    invoke-static/range {p0 .. p7}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->updateContent$lambda$12(Lrc/a;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/util/List;Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$PregnancyModeUiState;Lwg/m0;Lwg/O;Lwg/F;)Lwg/F;

    move-result-object p0

    return-object p0
.end method

.method private final hideAddTagModal()V
    .locals 2

    new-instance v0, Lcom/eightsleep/presentation_metrics/viewmodel/h;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lcom/eightsleep/presentation_metrics/viewmodel/h;-><init>(I)V

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/support/v4/media/session/b;->I(LY7/o;LVm/k;I)V

    return-void
.end method

.method private static final hideAddTagModal$lambda$16(Lwg/F;)Lwg/F;
    .locals 12

    const-string v0, "model"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Lcom/eightsleep/data_metrics/enums/TrendTagType;->OTHER:Lcom/eightsleep/data_metrics/enums/TrendTagType;

    invoke-virtual {v0}, Lcom/eightsleep/data_metrics/enums/TrendTagType;->getJson()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lwg/F;->g:Lwg/p1;

    invoke-virtual {v1, v0}, Lwg/p1;->h(Ljava/lang/String;)Lwg/p1;

    move-result-object v9

    const/4 v8, 0x0

    const/4 v10, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/16 v11, 0x9f

    move-object v2, p0

    invoke-static/range {v2 .. v11}, Lwg/F;->u(Lwg/F;Ljava/util/List;Lwg/m0;Lwg/O;Lwg/v;Lwg/Q;ZLwg/p1;Ljava/lang/Boolean;I)Lwg/F;

    move-result-object p0

    return-object p0
.end method

.method private final isPregnancyModeAvailable()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method private final showAddTagModalAfterDelay()V
    .locals 3

    invoke-static {p0}, Landroidx/lifecycle/V;->h(Landroidx/lifecycle/b0;)Li3/a;

    move-result-object v0

    new-instance v1, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$showAddTagModalAfterDelay$1;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$showAddTagModalAfterDelay$1;-><init>(Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;LLm/c;)V

    const/4 p0, 0x3

    invoke-static {v0, v2, v2, v1, p0}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    return-void
.end method

.method private final toggleTag(Ljava/lang/String;)V
    .locals 3

    new-instance v0, Lkotlin/jvm/internal/A;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Lcom/eightsleep/presentation_metrics/viewmodel/e;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v0, v2}, Lcom/eightsleep/presentation_metrics/viewmodel/e;-><init>(Ljava/lang/String;Lkotlin/jvm/internal/A;I)V

    const/4 v2, 0x1

    invoke-static {p0, v1, v2}, Landroid/support/v4/media/session/b;->I(LY7/o;LVm/k;I)V

    sget-object v1, Lcom/eightsleep/data_metrics/enums/TrendTagType;->OTHER:Lcom/eightsleep/data_metrics/enums/TrendTagType;

    invoke-virtual {v1}, Lcom/eightsleep/data_metrics/enums/TrendTagType;->getJson()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-ne p1, v2, :cond_0

    invoke-direct {p0}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->showAddTagModalAfterDelay()V

    return-void

    :cond_0
    if-nez p1, :cond_2

    iget-object p1, v0, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_1

    invoke-direct {p0, p1}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->updateTags(Ljava/util/List;)V

    :cond_1
    return-void

    :cond_2
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0
.end method

.method private static final toggleTag$lambda$13(Ljava/lang/String;Lkotlin/jvm/internal/A;Lwg/F;)Lwg/F;
    .locals 11

    const-string v0, "model"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p2, Lwg/F;->g:Lwg/p1;

    invoke-virtual {v0, p0}, Lwg/p1;->i(Ljava/lang/String;)Lwg/p1;

    move-result-object v8

    invoke-static {v8}, Lwg/l1;->c(Lwg/q1;)Ljava/util/ArrayList;

    move-result-object p0

    iput-object p0, p1, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    const/4 v7, 0x0

    const/4 v9, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/16 v10, 0xbf

    move-object v1, p2

    invoke-static/range {v1 .. v10}, Lwg/F;->u(Lwg/F;Ljava/util/List;Lwg/m0;Lwg/O;Lwg/v;Lwg/Q;ZLwg/p1;Ljava/lang/Boolean;I)Lwg/F;

    move-result-object p0

    return-object p0
.end method

.method private final updateContent(Lcom/eightsleep/data_metrics/domain/model/DailyTrends;Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;Ljava/util/List;Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$PregnancyModeUiState;LLm/c;)Ljava/lang/Object;
    .locals 36
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/eightsleep/data_metrics/domain/model/DailyTrends;",
            "Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;",
            "Ljava/util/List<",
            "Lyd/x;",
            ">;",
            "Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$PregnancyModeUiState;",
            "LLm/c<",
            "-",
            "LHm/B;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p5

    const/4 v4, 0x1

    instance-of v5, v3, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;

    if-eqz v5, :cond_0

    move-object v5, v3

    check-cast v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;

    iget v6, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->label:I

    const/high16 v7, -0x80000000

    and-int v8, v6, v7

    if-eqz v8, :cond_0

    sub-int/2addr v6, v7

    iput v6, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->label:I

    goto :goto_0

    :cond_0
    new-instance v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;

    invoke-direct {v5, v0, v3}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;-><init>(Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;LLm/c;)V

    :goto_0
    iget-object v3, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->result:Ljava/lang/Object;

    sget-object v6, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v7, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->label:I

    sget-object v8, LHm/B;->a:LHm/B;

    sget-object v9, LIm/z;->a:LIm/z;

    const/4 v13, 0x2

    if-eqz v7, :cond_3

    if-eq v7, v4, :cond_2

    if-ne v7, v13, :cond_1

    iget v0, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->I$1:I

    iget v1, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->I$0:I

    iget-object v2, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$18:Ljava/lang/Object;

    iget-object v7, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$17:Ljava/lang/Object;

    check-cast v7, Ljava/util/Map;

    iget-object v11, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$16:Ljava/lang/Object;

    check-cast v11, [Ljava/time/LocalDate;

    iget-object v12, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$15:Ljava/lang/Object;

    check-cast v12, Ljava/util/Collection;

    iget-object v15, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$14:Ljava/lang/Object;

    check-cast v15, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    iget-object v10, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$13:Ljava/lang/Object;

    check-cast v10, Ljava/util/Iterator;

    iget-object v14, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$12:Ljava/lang/Object;

    check-cast v14, Ljava/util/LinkedHashMap;

    iget-object v13, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$11:Ljava/lang/Object;

    check-cast v13, Lwg/m0;

    iget-object v4, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$10:Ljava/lang/Object;

    check-cast v4, Ljava/util/Map;

    move/from16 p0, v0

    iget-object v0, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$9:Ljava/lang/Object;

    check-cast v0, [Ljava/time/LocalDate;

    move-object/from16 p1, v0

    iget-object v0, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$8:Ljava/lang/Object;

    check-cast v0, Lcom/eightsleep/data_core/enums/ClockSystem;

    move-object/from16 p2, v0

    iget-object v0, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$7:Ljava/lang/Object;

    check-cast v0, Lrc/a;

    move-object/from16 p3, v0

    iget-object v0, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$6:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    move-object/from16 p4, v0

    iget-object v0, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$5:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    move-object/from16 v18, v0

    iget-object v0, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$4:Ljava/lang/Object;

    check-cast v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$PregnancyModeUiState;

    move-object/from16 v19, v0

    iget-object v0, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$3:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    move-object/from16 v20, v0

    iget-object v0, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$2:Ljava/lang/Object;

    check-cast v0, Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;

    move-object/from16 v21, v0

    iget-object v0, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$1:Ljava/lang/Object;

    check-cast v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;

    move-object/from16 v22, v0

    iget-object v0, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$0:Ljava/lang/Object;

    check-cast v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;

    invoke-static {v3}, LX4/x;->M(Ljava/lang/Object;)V

    move/from16 v30, v1

    move-object/from16 v25, v5

    move-object/from16 v27, v8

    move-object/from16 v28, v9

    move-object/from16 v16, v13

    move-object/from16 v31, v15

    move-object/from16 v5, v18

    move/from16 v1, p0

    move-object/from16 v8, p3

    move-object v13, v4

    move-object v9, v6

    move-object v15, v12

    move-object/from16 v12, p1

    move-object/from16 v4, p4

    move-object v6, v3

    move-object/from16 v3, v22

    move-object/from16 v22, v14

    move-object/from16 v14, p2

    goto/16 :goto_1b

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    iget v0, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->I$1:I

    iget v1, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->I$0:I

    iget-object v2, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$14:Ljava/lang/Object;

    check-cast v2, Ljava/util/Collection;

    iget-object v4, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$13:Ljava/lang/Object;

    check-cast v4, Ljava/util/Collection;

    iget-object v7, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$12:Ljava/lang/Object;

    check-cast v7, [Ljava/time/LocalDate;

    iget-object v10, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$11:Ljava/lang/Object;

    check-cast v10, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;

    iget-object v13, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$10:Ljava/lang/Object;

    check-cast v13, Ljava/util/Map;

    iget-object v14, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$9:Ljava/lang/Object;

    check-cast v14, [Ljava/time/LocalDate;

    iget-object v15, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$8:Ljava/lang/Object;

    check-cast v15, Lcom/eightsleep/data_core/enums/ClockSystem;

    iget-object v11, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$7:Ljava/lang/Object;

    check-cast v11, Lrc/a;

    iget-object v12, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$6:Ljava/lang/Object;

    check-cast v12, Ljava/lang/Integer;

    move/from16 v20, v0

    iget-object v0, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$5:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    move-object/from16 p0, v0

    iget-object v0, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$4:Ljava/lang/Object;

    check-cast v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$PregnancyModeUiState;

    move-object/from16 p1, v0

    iget-object v0, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$3:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    move-object/from16 p2, v0

    iget-object v0, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$2:Ljava/lang/Object;

    check-cast v0, Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;

    move-object/from16 p3, v0

    iget-object v0, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$1:Ljava/lang/Object;

    check-cast v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;

    move-object/from16 p4, v0

    iget-object v0, v5, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$0:Ljava/lang/Object;

    check-cast v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;

    invoke-static {v3}, LX4/x;->M(Ljava/lang/Object;)V

    move-object/from16 v23, p0

    move-object/from16 v29, p3

    move-object/from16 v21, v7

    move-object/from16 v27, v8

    move-object/from16 v28, v9

    move-object/from16 v22, v11

    move-object v9, v12

    move-object/from16 v8, p1

    move-object/from16 v7, p2

    move-object v12, v4

    move-object v11, v6

    move-object v4, v2

    move-object v6, v3

    move-object v3, v0

    move v2, v1

    move-object v0, v10

    move-object v10, v15

    const/4 v1, 0x1

    move-object v15, v5

    move-object/from16 v5, p4

    goto/16 :goto_a

    :cond_3
    invoke-static {v3}, LX4/x;->M(Ljava/lang/Object;)V

    if-eqz p4, :cond_5

    invoke-direct {v0}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->isPregnancyModeAvailable()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-virtual/range {p4 .. p4}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$PregnancyModeUiState;->isModeActive()Z

    move-result v3

    if-eqz v3, :cond_4

    const/4 v3, 0x1

    goto :goto_1

    :cond_4
    const/4 v3, 0x0

    :goto_1
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_2

    :cond_5
    const/4 v3, 0x0

    :goto_2
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz p4, :cond_6

    invoke-virtual/range {p4 .. p4}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$PregnancyModeUiState;->isPostpartum()Z

    move-result v7

    const/4 v10, 0x1

    if-ne v7, v10, :cond_6

    const/4 v7, 0x1

    goto :goto_3

    :cond_6
    const/4 v7, 0x0

    :goto_3
    invoke-static {v4, v7}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModelKt;->outlierAccuracyNoticeRes(ZZ)Ljava/lang/Integer;

    move-result-object v4

    if-eqz v1, :cond_7

    iget-object v7, v1, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->L:Lrc/a;

    if-nez v7, :cond_8

    :cond_7
    move-object/from16 v27, v8

    const/4 v15, 0x0

    goto/16 :goto_28

    :cond_8
    if-eqz v2, :cond_9

    iget-object v10, v2, Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;->b:LGa/s;

    iget-object v10, v10, LGa/s;->b:Lcom/eightsleep/data_core/enums/ClockSystem;

    goto :goto_4

    :cond_9
    const/4 v10, 0x0

    :goto_4
    iget-object v11, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->selectedDate:Ljava/time/LocalDate;

    sget-object v12, Lcom/eightsleep/data_metrics/enums/MetricDataPeriod;->WEEK:Lcom/eightsleep/data_metrics/enums/MetricDataPeriod;

    invoke-static {v11, v12}, LGk/m;->x(Ljava/time/LocalDate;Lcom/eightsleep/data_metrics/enums/MetricDataPeriod;)Ljava/time/LocalDate;

    move-result-object v11

    sget-object v12, Ljava/time/temporal/ChronoUnit;->DAYS:Ljava/time/temporal/ChronoUnit;

    iget-object v13, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->selectedDate:Ljava/time/LocalDate;

    invoke-virtual {v12, v11, v13}, Ljava/time/temporal/ChronoUnit;->between(Ljava/time/temporal/Temporal;Ljava/time/temporal/Temporal;)J

    move-result-wide v12

    long-to-int v12, v12

    const/16 v17, 0x1

    add-int/lit8 v12, v12, 0x1

    new-array v13, v12, [Ljava/time/LocalDate;

    const/4 v14, 0x0

    :goto_5
    if-ge v14, v12, :cond_a

    move-object v15, v3

    move-object/from16 v20, v4

    int-to-long v3, v14

    invoke-virtual {v11, v3, v4}, Ljava/time/LocalDate;->plusDays(J)Ljava/time/LocalDate;

    move-result-object v3

    aput-object v3, v13, v14

    add-int/lit8 v14, v14, 0x1

    move-object v3, v15

    move-object/from16 v4, v20

    const/16 v17, 0x1

    goto :goto_5

    :cond_a
    move-object v15, v3

    move-object/from16 v20, v4

    if-eqz v2, :cond_e

    iget-object v3, v2, Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;->j:Ljava/util/List;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_b
    :goto_6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    move-object v14, v11

    check-cast v14, Lcom/eightsleep/data_metrics/domain/model/Sample;

    iget-object v14, v14, Lcom/eightsleep/data_metrics/domain/model/Sample;->a:LGa/s;

    invoke-virtual {v14}, LGa/s;->k()Ljava/time/LocalDate;

    move-result-object v14

    invoke-static {v13, v14}, LIm/n;->S([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_b

    invoke-virtual {v4, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6

    :cond_c
    const/16 v11, 0xa

    invoke-static {v4, v11}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-static {v3}, LIm/G;->J(I)I

    move-result v3

    const/16 v11, 0x10

    if-ge v3, v11, :cond_d

    const/16 v3, 0x10

    :cond_d
    new-instance v11, Ljava/util/LinkedHashMap;

    invoke-direct {v11, v3}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_7
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_f

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v14, v4

    check-cast v14, Lcom/eightsleep/data_metrics/domain/model/Sample;

    iget-object v14, v14, Lcom/eightsleep/data_metrics/domain/model/Sample;->a:LGa/s;

    invoke-virtual {v14}, LGa/s;->k()Ljava/time/LocalDate;

    move-result-object v14

    invoke-interface {v11, v14, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_7

    :cond_e
    const/4 v11, 0x0

    :cond_f
    if-nez v11, :cond_10

    move-object/from16 v4, p3

    move-object/from16 v29, v2

    move-object v14, v7

    move-object/from16 v27, v8

    move-object/from16 v28, v9

    move-object v9, v11

    move-object v3, v15

    move-object/from16 v26, v20

    const/16 v20, 0x0

    move-object v7, v5

    move-object v11, v6

    move-object/from16 v5, p4

    goto/16 :goto_14

    :cond_10
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v12}, Ljava/util/ArrayList;-><init>(I)V

    move-object/from16 v4, p3

    move-object/from16 p0, v3

    move-object/from16 v29, v6

    move-object v14, v7

    move-object/from16 v27, v8

    move-object/from16 v28, v9

    move-object v9, v11

    move-object v6, v13

    move-object/from16 v8, v20

    const/4 v7, 0x0

    move-object v3, v2

    move-object v11, v5

    move-object/from16 v5, p4

    move-object v2, v1

    move-object v1, v0

    :goto_8
    if-ge v7, v12, :cond_13

    move/from16 p1, v12

    aget-object v12, v13, v7

    move/from16 p2, v7

    iget-object v7, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->healthTrendsOutliersDataProcessor:Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor;

    sget-object v20, LGa/s;->c:LGa/s;

    invoke-static {v12}, Lkotlin/jvm/internal/l;->g(Ljava/lang/Object;)V

    move-object/from16 v20, v7

    new-instance v7, LGa/s;

    if-nez v10, :cond_11

    sget-object v21, LGa/f;->f:Lcom/eightsleep/data_core/enums/ClockSystem;

    move-object/from16 p3, v13

    move-object/from16 v13, v21

    goto :goto_9

    :cond_11
    move-object/from16 p3, v13

    move-object v13, v10

    :goto_9
    invoke-direct {v7, v12, v13}, LGa/s;-><init>(Ljava/time/LocalDate;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    sget-object v22, Lcom/eightsleep/data_metrics/enums/MetricDataPeriod;->WEEK:Lcom/eightsleep/data_metrics/enums/MetricDataPeriod;

    invoke-interface {v9, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    move-object/from16 v23, v12

    check-cast v23, Lcom/eightsleep/data_metrics/domain/model/Sample;

    iput-object v1, v11, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$0:Ljava/lang/Object;

    iput-object v2, v11, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$1:Ljava/lang/Object;

    iput-object v3, v11, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$2:Ljava/lang/Object;

    iput-object v4, v11, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$3:Ljava/lang/Object;

    iput-object v5, v11, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$4:Ljava/lang/Object;

    iput-object v15, v11, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$5:Ljava/lang/Object;

    iput-object v8, v11, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$6:Ljava/lang/Object;

    iput-object v14, v11, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$7:Ljava/lang/Object;

    iput-object v10, v11, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$8:Ljava/lang/Object;

    iput-object v6, v11, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$9:Ljava/lang/Object;

    iput-object v9, v11, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$10:Ljava/lang/Object;

    iput-object v0, v11, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$11:Ljava/lang/Object;

    move-object/from16 v13, p3

    iput-object v13, v11, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$12:Ljava/lang/Object;

    move-object/from16 v12, p0

    iput-object v12, v11, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$13:Ljava/lang/Object;

    iput-object v12, v11, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$14:Ljava/lang/Object;

    move-object/from16 p0, v1

    move/from16 v1, p2

    iput v1, v11, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->I$0:I

    move/from16 v1, p1

    iput v1, v11, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->I$1:I

    const/4 v1, 0x1

    iput v1, v11, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->label:I

    const/16 v25, 0x1

    move-object/from16 v24, v3

    move-object/from16 v21, v7

    move-object/from16 v26, v11

    invoke-virtual/range {v20 .. v26}, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/HealthTrendsOutliersDataProcessor;->transformPeriodData(LGa/s;Lcom/eightsleep/data_metrics/enums/MetricDataPeriod;Lcom/eightsleep/data_metrics/domain/model/Sample;Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;ZLLm/c;)Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v7, v26

    move-object/from16 v11, v29

    move-object/from16 v29, v24

    if-ne v3, v11, :cond_12

    move-object v9, v11

    goto/16 :goto_1a

    :cond_12
    move/from16 v20, p1

    move-object/from16 v21, v13

    move-object/from16 v22, v14

    move-object/from16 v23, v15

    move-object v14, v6

    move-object v15, v7

    move-object v13, v9

    move-object v6, v3

    move-object v7, v4

    move-object v9, v8

    move-object v4, v12

    move-object/from16 v3, p0

    move-object v8, v5

    move-object v5, v2

    move/from16 v2, p2

    :goto_a
    check-cast v6, Lwg/k0;

    invoke-interface {v4, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/2addr v2, v1

    move-object v1, v3

    move-object v4, v7

    move-object/from16 p0, v12

    move-object v6, v14

    move/from16 v12, v20

    move-object/from16 v14, v22

    move-object/from16 v3, v29

    move v7, v2

    move-object v2, v5

    move-object v5, v8

    move-object v8, v9

    move-object/from16 v29, v11

    move-object v9, v13

    move-object v11, v15

    move-object/from16 v13, v21

    move-object/from16 v15, v23

    goto/16 :goto_8

    :cond_13
    move-object/from16 v12, p0

    move-object/from16 p0, v1

    move-object v7, v11

    move-object/from16 v11, v29

    move-object/from16 v29, v3

    move-object/from16 v23, v12

    check-cast v23, Ljava/util/List;

    invoke-interface/range {v23 .. v23}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_14
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_15

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v12, v3

    check-cast v12, Lwg/k0;

    iget-object v12, v12, Lwg/k0;->b:LGa/s;

    invoke-virtual {v12}, LGa/s;->k()Ljava/time/LocalDate;

    move-result-object v12

    iget-object v13, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->selectedDate:Ljava/time/LocalDate;

    invoke-virtual {v12, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_14

    goto :goto_b

    :cond_15
    const/4 v3, 0x0

    :goto_b
    check-cast v3, Lwg/k0;

    if-eqz v3, :cond_16

    iget-object v1, v3, Lwg/k0;->a:Ljava/lang/Integer;

    goto :goto_c

    :cond_16
    const/4 v1, 0x0

    :goto_c
    iget-object v3, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->selectedDate:Ljava/time/LocalDate;

    invoke-interface {v9, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/eightsleep/data_metrics/domain/model/Sample;

    if-eqz v3, :cond_1d

    iget-object v3, v3, Lcom/eightsleep/data_metrics/domain/model/Sample;->f:Ljava/util/Map;

    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_1c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/Map$Entry;

    invoke-interface {v13}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    invoke-interface {v13}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lrc/k;

    iget v13, v13, Lrc/k;->a:I

    if-lez v13, :cond_1a

    sget-object v13, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$WhenMappings;->$EnumSwitchMapping$1:[I

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Enum;->ordinal()I

    move-result v20

    aget v13, v13, v20

    move-object/from16 p1, v1

    const/4 v1, 0x1

    if-eq v13, v1, :cond_19

    const/4 v1, 0x2

    if-eq v13, v1, :cond_18

    const/4 v1, 0x3

    if-eq v13, v1, :cond_17

    :goto_e
    const/4 v1, 0x0

    goto :goto_f

    :cond_17
    sget-object v1, Lcom/eightsleep/presentation_metrics/enums/HealthTierTrend;->HEART_RATE:Lcom/eightsleep/presentation_metrics/enums/HealthTierTrend;

    goto :goto_f

    :cond_18
    sget-object v1, Lcom/eightsleep/presentation_metrics/enums/HealthTierTrend;->BREATH_RATE:Lcom/eightsleep/presentation_metrics/enums/HealthTierTrend;

    goto :goto_f

    :cond_19
    sget-object v1, Lcom/eightsleep/presentation_metrics/enums/HealthTierTrend;->HRV:Lcom/eightsleep/presentation_metrics/enums/HealthTierTrend;

    goto :goto_f

    :cond_1a
    move-object/from16 p1, v1

    goto :goto_e

    :goto_f
    if-eqz v1, :cond_1b

    invoke-virtual {v12, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1b
    move-object/from16 v1, p1

    goto :goto_d

    :cond_1c
    move-object/from16 v24, v12

    :goto_10
    move-object/from16 p1, v1

    goto :goto_11

    :cond_1d
    move-object/from16 v24, v28

    goto :goto_10

    :goto_11
    new-instance v20, Lwg/m0;

    iget-object v0, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->selectedDate:Ljava/time/LocalDate;

    if-eqz p1, :cond_1e

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    move/from16 v22, v1

    :goto_12
    move-object/from16 v21, v0

    move-object/from16 v26, v8

    move-object/from16 v25, v15

    goto :goto_13

    :cond_1e
    const/16 v22, 0x0

    goto :goto_12

    :goto_13
    invoke-direct/range {v20 .. v26}, Lwg/m0;-><init>(Ljava/time/LocalDate;ILjava/util/List;Ljava/util/List;Ljava/lang/Boolean;Ljava/lang/Integer;)V

    move-object/from16 v0, p0

    move-object v1, v2

    move-object v13, v6

    move-object/from16 v3, v25

    :goto_14
    iget-object v2, v14, Lrc/a;->c:Lrc/m;

    if-nez v2, :cond_1f

    move-object v6, v5

    move-object v2, v14

    move-object/from16 v7, v20

    const/4 v8, 0x0

    :goto_15
    move-object v5, v4

    move-object/from16 v4, v26

    goto/16 :goto_27

    :cond_1f
    iget v2, v2, Lrc/m;->f:I

    const/4 v6, 0x0

    invoke-static {v2, v6}, Lkotlin/jvm/internal/l;->k(II)I

    move-result v2

    const/4 v8, 0x1

    if-ne v2, v8, :cond_21

    new-instance v10, Lwg/N;

    iget-object v1, v1, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->L:Lrc/a;

    if-eqz v1, :cond_20

    iget-object v1, v1, Lrc/a;->c:Lrc/m;

    if-eqz v1, :cond_20

    iget v1, v1, Lrc/m;->f:I

    goto :goto_16

    :cond_20
    const/4 v1, 0x7

    :goto_16
    invoke-direct {v10, v1}, Lwg/N;-><init>(I)V

    move-object v6, v5

    move-object v8, v10

    move-object v2, v14

    move-object/from16 v7, v20

    goto :goto_15

    :cond_21
    if-eqz v9, :cond_28

    sget-object v2, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->METRIC_TYPES:Ljava/util/List;

    new-instance v8, Ljava/util/LinkedHashMap;

    const/16 v12, 0xa

    invoke-static {v2, v12}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v12

    invoke-static {v12}, LIm/G;->J(I)I

    move-result v12

    const/16 v15, 0x10

    if-ge v12, v15, :cond_22

    move v12, v15

    :cond_22
    invoke-direct {v8, v12}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_17
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_29

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    move-object v15, v12

    check-cast v15, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    array-length v6, v13

    move-object/from16 p2, v2

    move-object/from16 p3, v8

    move-object/from16 p0, v13

    move-object/from16 p1, v16

    const/4 v2, 0x0

    move-object v13, v9

    move-object/from16 v16, v12

    move-object/from16 v12, p0

    move-object v8, v14

    move-object v9, v7

    move-object v14, v10

    move-object/from16 v10, v29

    move-object v7, v5

    move-object/from16 v29, v11

    move-object/from16 v11, v20

    move-object v5, v3

    move-object v3, v1

    move-object v1, v0

    move v0, v6

    move-object v6, v4

    move-object/from16 v4, v26

    move-object/from16 v26, p3

    :goto_18
    if-ge v2, v0, :cond_27

    move/from16 p4, v0

    aget-object v0, p0, v2

    move/from16 v30, v2

    iget-object v2, v1, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->dataProcessors:Ljava/util/Map;

    invoke-interface {v2, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v19, v2

    check-cast v19, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/MetricDataProcessor;

    if-eqz v19, :cond_25

    sget-object v2, LGa/s;->c:LGa/s;

    invoke-static {v0}, Lkotlin/jvm/internal/l;->g(Ljava/lang/Object;)V

    new-instance v2, LGa/s;

    if-nez v14, :cond_23

    sget-object v20, LGa/f;->f:Lcom/eightsleep/data_core/enums/ClockSystem;

    move-object/from16 v31, v15

    move-object/from16 v15, v20

    goto :goto_19

    :cond_23
    move-object/from16 v31, v15

    move-object v15, v14

    :goto_19
    invoke-direct {v2, v0, v15}, LGa/s;-><init>(Ljava/time/LocalDate;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    sget-object v21, Lcom/eightsleep/data_metrics/enums/MetricDataPeriod;->WEEK:Lcom/eightsleep/data_metrics/enums/MetricDataPeriod;

    invoke-interface {v13, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v22, v0

    check-cast v22, Lcom/eightsleep/data_metrics/domain/model/Sample;

    iput-object v1, v9, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$0:Ljava/lang/Object;

    iput-object v3, v9, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$1:Ljava/lang/Object;

    iput-object v10, v9, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$2:Ljava/lang/Object;

    iput-object v6, v9, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$3:Ljava/lang/Object;

    iput-object v7, v9, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$4:Ljava/lang/Object;

    iput-object v5, v9, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$5:Ljava/lang/Object;

    iput-object v4, v9, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$6:Ljava/lang/Object;

    iput-object v8, v9, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$7:Ljava/lang/Object;

    iput-object v14, v9, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$8:Ljava/lang/Object;

    iput-object v12, v9, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$9:Ljava/lang/Object;

    iput-object v13, v9, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$10:Ljava/lang/Object;

    iput-object v11, v9, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$11:Ljava/lang/Object;

    move-object/from16 v0, p3

    iput-object v0, v9, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$12:Ljava/lang/Object;

    move-object/from16 v15, p2

    iput-object v15, v9, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$13:Ljava/lang/Object;

    move-object/from16 p2, v0

    move-object/from16 v0, v31

    iput-object v0, v9, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$14:Ljava/lang/Object;

    move-object/from16 v0, p1

    iput-object v0, v9, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$15:Ljava/lang/Object;

    move-object/from16 v0, p0

    iput-object v0, v9, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$16:Ljava/lang/Object;

    move-object/from16 v0, v26

    iput-object v0, v9, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$17:Ljava/lang/Object;

    move-object/from16 v26, v1

    move-object/from16 v1, v16

    iput-object v1, v9, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->L$18:Ljava/lang/Object;

    move-object/from16 v20, v2

    move/from16 v2, v30

    iput v2, v9, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->I$0:I

    move/from16 v2, p4

    iput v2, v9, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->I$1:I

    const/4 v2, 0x2

    iput v2, v9, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateContent$1;->label:I

    const/16 v24, 0x1

    move-object/from16 v25, v9

    move-object/from16 v23, v10

    invoke-virtual/range {v19 .. v25}, Lcom/eightsleep/presentation_metrics/viewmodel/chartprocessors/MetricDataProcessor;->transformPeriodData(LGa/s;Lcom/eightsleep/data_metrics/enums/MetricDataPeriod;Lcom/eightsleep/data_metrics/domain/model/Sample;Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;ZLLm/c;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v9, v29

    if-ne v2, v9, :cond_24

    :goto_1a
    return-object v9

    :cond_24
    move-object/from16 v22, p2

    move-object/from16 v20, v6

    move-object/from16 v19, v7

    move-object/from16 v16, v11

    move-object v10, v15

    move-object/from16 v21, v23

    move-object/from16 v11, p0

    move-object/from16 v15, p1

    move-object v7, v0

    move-object v6, v2

    move-object/from16 v0, v26

    move-object v2, v1

    move/from16 v1, p4

    :goto_1b
    check-cast v6, Lwg/t0;

    move/from16 v26, v1

    move-object v1, v0

    move/from16 v0, v26

    move-object/from16 v26, v7

    move-object/from16 v7, v19

    move-object/from16 v19, v2

    :goto_1c
    move/from16 v2, v30

    goto :goto_1d

    :cond_25
    move-object/from16 v25, v9

    move-object/from16 v23, v10

    move-object/from16 v31, v15

    move-object/from16 v0, v26

    move-object/from16 v9, v29

    move-object/from16 v15, p2

    move-object/from16 p2, p3

    move-object/from16 v26, v1

    move-object/from16 v1, v16

    move-object/from16 v22, p2

    move-object/from16 v19, v1

    move-object/from16 v20, v6

    move-object/from16 v16, v11

    move-object v10, v15

    move-object/from16 v21, v23

    move-object/from16 v1, v26

    const/4 v6, 0x0

    move-object/from16 v11, p0

    move-object/from16 v15, p1

    move-object/from16 v26, v0

    move/from16 v0, p4

    goto :goto_1c

    :goto_1d
    if-eqz v6, :cond_26

    invoke-interface {v15, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_26
    const/16 v17, 0x1

    add-int/lit8 v2, v2, 0x1

    move-object/from16 v29, v9

    move-object/from16 p2, v10

    move-object/from16 p0, v11

    move-object/from16 p1, v15

    move-object/from16 v11, v16

    move-object/from16 v16, v19

    move-object/from16 v6, v20

    move-object/from16 v10, v21

    move-object/from16 p3, v22

    move-object/from16 v9, v25

    move-object/from16 v15, v31

    goto/16 :goto_18

    :cond_27
    move-object/from16 v15, p2

    move-object/from16 p2, p3

    move-object/from16 v25, v9

    move-object/from16 v23, v10

    move-object/from16 v0, v26

    move-object/from16 v9, v29

    move-object/from16 v26, v1

    move-object/from16 v1, v16

    move-object/from16 v2, p1

    check-cast v2, Ljava/util/List;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v3

    move-object v3, v5

    move-object v5, v7

    move-object/from16 v20, v11

    move-object v10, v14

    move-object v2, v15

    move-object/from16 v29, v23

    move-object/from16 v7, v25

    move-object/from16 v0, v26

    move-object/from16 v26, v4

    move-object v4, v6

    move-object v14, v8

    move-object v11, v9

    move-object v9, v13

    const/4 v6, 0x0

    move-object/from16 v8, p2

    move-object v13, v12

    goto/16 :goto_17

    :cond_28
    const/4 v8, 0x0

    :cond_29
    new-instance v2, Lwg/M;

    new-instance v29, Lwg/I;

    iget-object v6, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->selectedDate:Ljava/time/LocalDate;

    sget-object v31, Lcom/eightsleep/presentation_metrics/enums/HealthTierTrend;->HEART_RATE:Lcom/eightsleep/presentation_metrics/enums/HealthTierTrend;

    invoke-virtual/range {v31 .. v31}, Lcom/eightsleep/presentation_metrics/enums/HealthTierTrend;->getFormatHealthScoreValue()Lcom/eightsleep/presentation_metrics/enums/HealthScoreTrendFormatter;

    move-result-object v7

    iget-object v9, v1, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->L:Lrc/a;

    if-eqz v9, :cond_2a

    iget-object v9, v9, Lrc/a;->c:Lrc/m;

    if-eqz v9, :cond_2a

    iget-object v9, v9, Lrc/m;->d:Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;

    if-eqz v9, :cond_2a

    invoke-virtual {v9}, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;->getHr()Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;

    move-result-object v9

    if-eqz v9, :cond_2a

    invoke-virtual {v9}, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->getValue()D

    move-result-wide v9

    new-instance v11, Ljava/lang/Double;

    invoke-direct {v11, v9, v10}, Ljava/lang/Double;-><init>(D)V

    goto :goto_1e

    :cond_2a
    const/4 v11, 0x0

    :goto_1e
    invoke-interface {v7, v11}, Lcom/eightsleep/presentation_metrics/enums/HealthScoreTrendFormatter;->invoke(Ljava/lang/Double;)LYa/H;

    move-result-object v32

    new-instance v7, Lwg/H;

    new-instance v9, Lwg/V;

    iget-object v10, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->selectedDate:Ljava/time/LocalDate;

    sget-object v11, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->HEART_RATE:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    if-eqz v8, :cond_2b

    invoke-interface {v8, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    if-nez v12, :cond_2c

    :cond_2b
    move-object/from16 v12, v28

    :cond_2c
    new-instance v13, LHm/k;

    invoke-direct {v13, v11, v12}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v12, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->WELLBEING_HR_UPPER:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    if-eqz v8, :cond_2e

    invoke-interface {v8, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/List;

    if-nez v15, :cond_2d

    goto :goto_20

    :cond_2d
    :goto_1f
    move-object/from16 p0, v3

    goto :goto_21

    :cond_2e
    :goto_20
    move-object/from16 v15, v28

    goto :goto_1f

    :goto_21
    new-instance v3, LHm/k;

    invoke-direct {v3, v12, v15}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {v13, v3}, [LHm/k;

    move-result-object v3

    invoke-static {v3}, LIm/F;->R([LHm/k;)Ljava/util/Map;

    move-result-object v3

    const/16 v13, 0x7a

    const/4 v15, 0x0

    invoke-direct {v9, v10, v3, v15, v13}, Lwg/V;-><init>(Ljava/time/LocalDate;Ljava/util/Map;Landroid/util/Range;I)V

    invoke-direct {v7, v9}, Lwg/H;-><init>(Lwg/V;)V

    move-object/from16 v30, v6

    move-object/from16 v33, v7

    move-object/from16 v34, v11

    move-object/from16 v35, v12

    invoke-direct/range {v29 .. v35}, Lwg/I;-><init>(Ljava/time/LocalDate;Lcom/eightsleep/presentation_metrics/enums/HealthTierTrend;LYa/H;Lwg/H;Lcom/eightsleep/data_metrics/enums/AggregateMetricType;Lcom/eightsleep/data_metrics/enums/AggregateMetricType;)V

    move-object/from16 v3, v29

    new-instance v29, Lwg/I;

    iget-object v6, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->selectedDate:Ljava/time/LocalDate;

    sget-object v31, Lcom/eightsleep/presentation_metrics/enums/HealthTierTrend;->HRV:Lcom/eightsleep/presentation_metrics/enums/HealthTierTrend;

    invoke-virtual/range {v31 .. v31}, Lcom/eightsleep/presentation_metrics/enums/HealthTierTrend;->getFormatHealthScoreValue()Lcom/eightsleep/presentation_metrics/enums/HealthScoreTrendFormatter;

    move-result-object v7

    iget-object v1, v1, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->L:Lrc/a;

    if-eqz v1, :cond_2f

    iget-object v9, v1, Lrc/a;->c:Lrc/m;

    if-eqz v9, :cond_2f

    iget-object v9, v9, Lrc/m;->d:Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;

    if-eqz v9, :cond_2f

    invoke-virtual {v9}, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;->getHrv()Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;

    move-result-object v9

    if-eqz v9, :cond_2f

    invoke-virtual {v9}, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->getValue()D

    move-result-wide v9

    new-instance v11, Ljava/lang/Double;

    invoke-direct {v11, v9, v10}, Ljava/lang/Double;-><init>(D)V

    goto :goto_22

    :cond_2f
    const/4 v11, 0x0

    :goto_22
    invoke-interface {v7, v11}, Lcom/eightsleep/presentation_metrics/enums/HealthScoreTrendFormatter;->invoke(Ljava/lang/Double;)LYa/H;

    move-result-object v32

    new-instance v7, Lwg/H;

    new-instance v9, Lwg/V;

    iget-object v10, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->selectedDate:Ljava/time/LocalDate;

    sget-object v11, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->HRV:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    if-eqz v8, :cond_30

    invoke-interface {v8, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    if-nez v12, :cond_31

    :cond_30
    move-object/from16 v12, v28

    :cond_31
    new-instance v15, LHm/k;

    invoke-direct {v15, v11, v12}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v12, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->WELLBEING_HRV_LOWER:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    if-eqz v8, :cond_33

    invoke-interface {v8, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/List;

    if-nez v16, :cond_32

    goto :goto_24

    :cond_32
    move-object/from16 v13, v16

    :goto_23
    move-object/from16 p2, v4

    goto :goto_25

    :cond_33
    :goto_24
    move-object/from16 v13, v28

    goto :goto_23

    :goto_25
    new-instance v4, LHm/k;

    invoke-direct {v4, v12, v13}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {v15, v4}, [LHm/k;

    move-result-object v4

    invoke-static {v4}, LIm/F;->R([LHm/k;)Ljava/util/Map;

    move-result-object v4

    const/16 v13, 0x7a

    const/4 v15, 0x0

    invoke-direct {v9, v10, v4, v15, v13}, Lwg/V;-><init>(Ljava/time/LocalDate;Ljava/util/Map;Landroid/util/Range;I)V

    invoke-direct {v7, v9}, Lwg/H;-><init>(Lwg/V;)V

    move-object/from16 v30, v6

    move-object/from16 v33, v7

    move-object/from16 v34, v11

    move-object/from16 v35, v12

    invoke-direct/range {v29 .. v35}, Lwg/I;-><init>(Ljava/time/LocalDate;Lcom/eightsleep/presentation_metrics/enums/HealthTierTrend;LYa/H;Lwg/H;Lcom/eightsleep/data_metrics/enums/AggregateMetricType;Lcom/eightsleep/data_metrics/enums/AggregateMetricType;)V

    move-object/from16 v4, v29

    new-instance v29, Lwg/I;

    iget-object v6, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->selectedDate:Ljava/time/LocalDate;

    sget-object v31, Lcom/eightsleep/presentation_metrics/enums/HealthTierTrend;->BREATH_RATE:Lcom/eightsleep/presentation_metrics/enums/HealthTierTrend;

    invoke-virtual/range {v31 .. v31}, Lcom/eightsleep/presentation_metrics/enums/HealthTierTrend;->getFormatHealthScoreValue()Lcom/eightsleep/presentation_metrics/enums/HealthScoreTrendFormatter;

    move-result-object v7

    if-eqz v1, :cond_34

    iget-object v1, v1, Lrc/a;->c:Lrc/m;

    if-eqz v1, :cond_34

    iget-object v1, v1, Lrc/m;->d:Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;

    if-eqz v1, :cond_34

    invoke-virtual {v1}, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;->getRr()Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;

    move-result-object v1

    if-eqz v1, :cond_34

    invoke-virtual {v1}, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->getValue()D

    move-result-wide v9

    new-instance v15, Ljava/lang/Double;

    invoke-direct {v15, v9, v10}, Ljava/lang/Double;-><init>(D)V

    goto :goto_26

    :cond_34
    const/4 v15, 0x0

    :goto_26
    invoke-interface {v7, v15}, Lcom/eightsleep/presentation_metrics/enums/HealthScoreTrendFormatter;->invoke(Ljava/lang/Double;)LYa/H;

    move-result-object v32

    new-instance v1, Lwg/H;

    new-instance v7, Lwg/V;

    iget-object v9, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->selectedDate:Ljava/time/LocalDate;

    sget-object v10, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->BREATH_RATE:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    if-eqz v8, :cond_35

    invoke-interface {v8, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/List;

    if-nez v11, :cond_36

    :cond_35
    move-object/from16 v11, v28

    :cond_36
    new-instance v12, LHm/k;

    invoke-direct {v12, v10, v11}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v11, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->WELLBEING_RR_UPPER:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    if-eqz v8, :cond_37

    invoke-interface {v8, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    if-nez v8, :cond_38

    :cond_37
    move-object/from16 v8, v28

    :cond_38
    new-instance v13, LHm/k;

    invoke-direct {v13, v11, v8}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {v12, v13}, [LHm/k;

    move-result-object v8

    invoke-static {v8}, LIm/F;->R([LHm/k;)Ljava/util/Map;

    move-result-object v8

    const/16 v13, 0x7a

    const/4 v15, 0x0

    invoke-direct {v7, v9, v8, v15, v13}, Lwg/V;-><init>(Ljava/time/LocalDate;Ljava/util/Map;Landroid/util/Range;I)V

    invoke-direct {v1, v7}, Lwg/H;-><init>(Lwg/V;)V

    move-object/from16 v33, v1

    move-object/from16 v30, v6

    move-object/from16 v34, v10

    move-object/from16 v35, v11

    invoke-direct/range {v29 .. v35}, Lwg/I;-><init>(Ljava/time/LocalDate;Lcom/eightsleep/presentation_metrics/enums/HealthTierTrend;LYa/H;Lwg/H;Lcom/eightsleep/data_metrics/enums/AggregateMetricType;Lcom/eightsleep/data_metrics/enums/AggregateMetricType;)V

    move-object/from16 v1, v29

    invoke-direct {v2, v3, v4, v1}, Lwg/M;-><init>(Lwg/I;Lwg/I;Lwg/I;)V

    move-object/from16 v3, p0

    move-object v8, v2

    move-object v6, v5

    move-object v2, v14

    move-object/from16 v7, v20

    move-object/from16 v4, v26

    move-object/from16 v5, p2

    :goto_27
    new-instance v1, Lcom/eightsleep/presentation_metrics/viewmodel/f;

    invoke-direct/range {v1 .. v8}, Lcom/eightsleep/presentation_metrics/viewmodel/f;-><init>(Lrc/a;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/util/List;Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$PregnancyModeUiState;Lwg/m0;Lwg/O;)V

    const/4 v10, 0x1

    invoke-static {v0, v1, v10}, Landroid/support/v4/media/session/b;->I(LY7/o;LVm/k;I)V

    return-object v27

    :goto_28
    const-string v1, "Something went wrong"

    const/4 v2, 0x2

    invoke-static {v0, v1, v15, v2}, Landroid/support/v4/media/session/b;->J(LY7/o;Ljava/lang/String;LVm/k;I)V

    invoke-virtual {v0}, LL8/e;->onBackPressed()V

    return-object v27
.end method

.method private static final updateContent$lambda$12(Lrc/a;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/util/List;Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$PregnancyModeUiState;Lwg/m0;Lwg/O;Lwg/F;)Lwg/F;
    .locals 29

    move-object/from16 v0, p0

    move-object/from16 v1, p7

    const-string v2, "it"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v0}, LP2/D;->u(Lrc/a;)Lwg/J;

    move-result-object v2

    const/4 v3, 0x4

    const/4 v4, 0x0

    iget-object v5, v0, Lrc/a;->a:Lcom/eightsleep/data_metrics/domain/model/HealthScoreStat;

    if-nez v5, :cond_0

    goto/16 :goto_3

    :cond_0
    new-instance v6, Lwg/v;

    new-instance v7, LYa/H;

    iget-wide v8, v5, Lcom/eightsleep/data_metrics/domain/model/HealthScoreStat;->a:D

    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    invoke-static {v5}, LIm/s;->f0(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    const v10, 0x7f120304

    invoke-direct {v7, v10, v5, v4, v3}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    const-wide/high16 v10, 0x4024000000000000L    # 10.0

    invoke-static {v10, v11}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v12

    const-wide/high16 v13, 0x402c000000000000L    # 14.0

    invoke-static {v13, v14}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v15

    move-wide/from16 v16, v10

    const-wide/16 v10, 0x0

    invoke-static {v5, v10, v11}, Lkotlin/jvm/internal/l;->b(Ljava/lang/Double;D)Z

    move-result v10

    const/4 v11, 0x6

    move-wide/from16 v18, v13

    const/4 v13, 0x0

    if-eqz v10, :cond_1

    new-instance v5, LYa/H;

    const v10, 0x7f1206ed

    invoke-direct {v5, v10, v13, v13, v11}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    goto :goto_0

    :cond_1
    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    double-to-float v3, v3

    float-to-double v3, v3

    invoke-virtual {v12}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v21

    cmpg-double v3, v3, v21

    if-gez v3, :cond_2

    new-instance v5, LYa/H;

    const v3, 0x7f1206e2

    invoke-direct {v5, v3, v13, v13, v11}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    goto :goto_0

    :cond_2
    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    double-to-float v3, v3

    float-to-double v3, v3

    invoke-virtual {v15}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v21

    cmpg-double v3, v3, v21

    if-gtz v3, :cond_3

    new-instance v5, LYa/H;

    const v3, 0x7f1206ec

    invoke-direct {v5, v3, v13, v13, v11}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    goto :goto_0

    :cond_3
    new-instance v5, LYa/H;

    const v3, 0x7f1206e1

    invoke-direct {v5, v3, v13, v13, v11}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    :goto_0
    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    invoke-static/range {v16 .. v17}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    invoke-static/range {v18 .. v19}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v10

    const-wide/16 v11, 0x0

    invoke-static {v3, v11, v12}, Lkotlin/jvm/internal/l;->b(Ljava/lang/Double;D)Z

    move-result v11

    const/4 v12, 0x6

    const/4 v13, 0x0

    if-eqz v11, :cond_4

    new-instance v3, LYa/H;

    const v4, 0x7f1206df

    invoke-direct {v3, v4, v13, v13, v12}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    goto :goto_2

    :cond_4
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v15

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v17

    cmpg-double v4, v15, v17

    const/4 v11, 0x4

    if-gez v4, :cond_5

    new-instance v4, LYa/H;

    invoke-static {v3}, LIm/s;->f0(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    const v10, 0x7f1206dd

    invoke-direct {v4, v10, v3, v13, v11}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    :goto_1
    move-object v3, v4

    goto :goto_2

    :cond_5
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v15

    invoke-virtual {v10}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v17

    cmpg-double v4, v15, v17

    if-gez v4, :cond_6

    new-instance v4, LYa/H;

    invoke-static {v3}, LIm/s;->f0(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    const v10, 0x7f1206de

    invoke-direct {v4, v10, v3, v13, v11}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    goto :goto_1

    :cond_6
    invoke-static {v3, v10}, Lkotlin/jvm/internal/l;->c(Ljava/lang/Double;Ljava/lang/Double;)Z

    move-result v4

    if-eqz v4, :cond_7

    new-instance v3, LYa/H;

    const v4, 0x7f1206e0

    invoke-direct {v3, v4, v13, v13, v12}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    goto :goto_2

    :cond_7
    new-instance v4, LYa/H;

    invoke-static {v3}, LIm/s;->f0(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    const v10, 0x7f1206dc

    invoke-direct {v4, v10, v3, v13, v11}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    goto :goto_1

    :goto_2
    new-instance v10, Lwg/k;

    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v22

    const-wide/high16 v23, 0x4024000000000000L    # 10.0

    const-wide/high16 v25, 0x402c000000000000L    # 14.0

    const-wide/high16 v27, 0x403f000000000000L    # 31.0

    move-object/from16 v21, v10

    invoke-direct/range {v21 .. v28}, Lwg/k;-><init>(Ljava/lang/Double;DDD)V

    move-object/from16 v11, p1

    move-object/from16 v12, p2

    move-object v9, v3

    move-object v8, v5

    invoke-direct/range {v6 .. v12}, Lwg/v;-><init>(LYa/H;LYa/H;LYa/H;Lwg/k;Ljava/lang/Boolean;Ljava/lang/Integer;)V

    move-object v4, v6

    :goto_3
    iget-object v0, v0, Lrc/a;->b:Lcom/eightsleep/data_metrics/domain/model/HealthScoreStat;

    if-nez v0, :cond_8

    const/4 v5, 0x0

    goto/16 :goto_7

    :cond_8
    new-instance v7, Lwg/Q;

    new-instance v8, LYa/H;

    iget-wide v5, v0, Lcom/eightsleep/data_metrics/domain/model/HealthScoreStat;->a:D

    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, LIm/s;->f0(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    const v3, 0x7f12073b

    const/4 v9, 0x0

    const/4 v14, 0x4

    invoke-direct {v8, v3, v0, v9, v14}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    const-wide/high16 v11, 0x4000000000000000L    # 2.0

    invoke-static {v11, v12}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    const-wide/high16 v13, 0x4008000000000000L    # 3.0

    invoke-static {v13, v14}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v9

    move-wide v15, v11

    const-wide/16 v11, 0x0

    invoke-static {v0, v11, v12}, Lkotlin/jvm/internal/l;->b(Ljava/lang/Double;D)Z

    move-result v10

    const/4 v11, 0x6

    const/4 v12, 0x0

    if-eqz v10, :cond_9

    new-instance v0, LYa/H;

    const v3, 0x7f1206ed

    invoke-direct {v0, v3, v12, v12, v11}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    goto :goto_4

    :cond_9
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v17

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v19

    cmpg-double v3, v17, v19

    if-gez v3, :cond_a

    new-instance v0, LYa/H;

    const v3, 0x7f1206eb

    invoke-direct {v0, v3, v12, v12, v11}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    goto :goto_4

    :cond_a
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v17

    invoke-virtual {v9}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v19

    cmpg-double v3, v17, v19

    if-gez v3, :cond_b

    new-instance v0, LYa/H;

    const v3, 0x7f1206ea

    invoke-direct {v0, v3, v12, v12, v11}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    goto :goto_4

    :cond_b
    invoke-static {v0, v9}, Lkotlin/jvm/internal/l;->c(Ljava/lang/Double;Ljava/lang/Double;)Z

    move-result v0

    if-eqz v0, :cond_c

    new-instance v0, LYa/H;

    const v3, 0x7f1206ec

    invoke-direct {v0, v3, v12, v12, v11}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    goto :goto_4

    :cond_c
    new-instance v0, LYa/H;

    const v3, 0x7f1206e1

    invoke-direct {v0, v3, v12, v12, v11}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    :goto_4
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    invoke-static/range {v15 .. v16}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v9

    invoke-static {v13, v14}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v10

    const-wide/16 v11, 0x0

    invoke-static {v3, v11, v12}, Lkotlin/jvm/internal/l;->b(Ljava/lang/Double;D)Z

    move-result v11

    const/4 v12, 0x6

    const/4 v13, 0x0

    if-eqz v11, :cond_d

    new-instance v3, LYa/H;

    const v9, 0x7f1206e7

    invoke-direct {v3, v9, v13, v13, v12}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    goto :goto_6

    :cond_d
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v19

    invoke-virtual {v9}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v21

    cmpg-double v9, v19, v21

    const/4 v11, 0x4

    if-gez v9, :cond_e

    new-instance v9, LYa/H;

    invoke-static {v3}, LIm/s;->f0(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    const v10, 0x7f1206e5

    invoke-direct {v9, v10, v3, v13, v11}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    :goto_5
    move-object v3, v9

    goto :goto_6

    :cond_e
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v19

    invoke-virtual {v10}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v21

    cmpg-double v9, v19, v21

    if-gez v9, :cond_f

    new-instance v9, LYa/H;

    invoke-static {v3}, LIm/s;->f0(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    const v10, 0x7f1206e6

    invoke-direct {v9, v10, v3, v13, v11}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    goto :goto_5

    :cond_f
    invoke-static {v3, v10}, Lkotlin/jvm/internal/l;->c(Ljava/lang/Double;Ljava/lang/Double;)Z

    move-result v9

    if-eqz v9, :cond_10

    new-instance v3, LYa/H;

    const v9, 0x7f1206e8

    invoke-direct {v3, v9, v13, v13, v12}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    goto :goto_6

    :cond_10
    new-instance v9, LYa/H;

    invoke-static {v3}, LIm/s;->f0(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    const v10, 0x7f1206e4

    invoke-direct {v9, v10, v3, v13, v11}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    goto :goto_5

    :goto_6
    new-instance v9, Lwg/k;

    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v10

    move-wide v11, v15

    const-wide/high16 v15, 0x4028000000000000L    # 12.0

    const-wide/high16 v13, 0x4008000000000000L    # 3.0

    invoke-direct/range {v9 .. v16}, Lwg/k;-><init>(Ljava/lang/Double;DDD)V

    move-object/from16 v12, p1

    move-object/from16 v13, p2

    move-object v10, v3

    move-object v11, v9

    move-object v9, v0

    invoke-direct/range {v7 .. v13}, Lwg/Q;-><init>(LYa/H;LYa/H;LYa/H;Lwg/k;Ljava/lang/Boolean;Ljava/lang/Integer;)V

    move-object v5, v7

    :goto_7
    const/4 v0, 0x0

    const/4 v3, 0x1

    if-eqz p4, :cond_11

    invoke-virtual/range {p4 .. p4}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$PregnancyModeUiState;->isModeActive()Z

    move-result v6

    if-ne v6, v3, :cond_11

    move v0, v3

    :cond_11
    xor-int/2addr v0, v3

    iget-object v3, v1, Lwg/F;->g:Lwg/p1;

    move-object/from16 v6, p3

    invoke-static {v6, v3, v0}, Lwg/o1;->a(Ljava/util/List;Lwg/p1;Z)Lwg/p1;

    move-result-object v7

    iget-object v0, v2, Lwg/J;->a:Ljava/util/List;

    const/4 v6, 0x0

    const/16 v9, 0x20

    move-object v2, v1

    move-object v1, v0

    move-object v0, v2

    move-object/from16 v8, p1

    move-object/from16 v2, p5

    move-object/from16 v3, p6

    invoke-static/range {v0 .. v9}, Lwg/F;->u(Lwg/F;Ljava/util/List;Lwg/m0;Lwg/O;Lwg/v;Lwg/Q;ZLwg/p1;Ljava/lang/Boolean;I)Lwg/F;

    move-result-object v0

    return-object v0
.end method

.method private final updateTags(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lwg/j1;",
            ">;)V"
        }
    .end annotation

    invoke-static {p0}, Landroidx/lifecycle/V;->h(Landroidx/lifecycle/b0;)Li3/a;

    move-result-object v0

    new-instance v1, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateTags$1;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$updateTags$1;-><init>(Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;Ljava/util/List;LLm/c;)V

    const/4 p0, 0x3

    invoke-static {v0, v2, v2, v1, p0}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    return-void
.end method


# virtual methods
.method public getInitialViewState()LY7/n;
    .locals 9

    new-instance p0, LY7/i;

    new-instance v0, Lwg/F;

    sget-object v1, LIm/z;->a:LIm/z;

    const/4 v4, 0x0

    new-instance v7, Lwg/p1;

    sget-object v2, LIm/z;->a:LIm/z;

    const-string v3, ""

    invoke-direct {v7, v3, v2, v2}, Lwg/p1;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v6, 0x0

    move-object v5, v4

    invoke-direct/range {v0 .. v8}, Lwg/F;-><init>(Ljava/util/List;Lwg/m0;Lwg/O;Lwg/v;Lwg/Q;ZLwg/p1;Ljava/lang/Boolean;)V

    invoke-direct {p0, v0}, LY7/i;-><init>(Ld8/k;)V

    return-object p0
.end method

.method public bridge synthetic onUiAction(LZ7/c;)V
    .locals 0

    .line 1
    check-cast p1, Ltg/t;

    invoke-virtual {p0, p1}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->onUiAction(Ltg/t;)V

    return-void
.end method

.method public onUiAction(Ltg/t;)V
    .locals 6

    const-string v0, "action"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    sget-object v0, LRc/A;->a:LRc/A;

    invoke-virtual {p0, p1, v0}, LL8/e;->logUiActionEvent(LZ7/c;LRc/B;)V

    .line 3
    sget-object v0, LXo/a;->DEBUG:LXo/a;

    .line 4
    sget-object v1, LXo/d;->a:LXo/b;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    sget-object v1, LXo/b;->b:LXo/d;

    .line 6
    invoke-interface {v1, v0}, LXo/d;->b(LXo/a;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 7
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 8
    const-string v3, "ACTIONS"

    invoke-interface {v1, v0, v3, v2}, LXo/d;->a(LXo/a;Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    :cond_0
    instance-of v0, p1, Ltg/r;

    const/4 v1, 0x0

    const-string v2, "toString(...)"

    const/4 v3, 0x2

    const/4 v4, 0x0

    if-eqz v0, :cond_1

    .line 10
    new-instance p1, Lcom/eightsleep/corepresentation/navigation/route/Route$OutlierDetails;

    .line 11
    iget-object v0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->selectedDate:Ljava/time/LocalDate;

    invoke-virtual {v0}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    invoke-direct {p1, v0}, Lcom/eightsleep/corepresentation/navigation/route/Route$OutlierDetails;-><init>(Ljava/lang/String;)V

    .line 13
    invoke-static {p0, p1, v4, v3, v1}, LL8/e;->goTo$default(LL8/e;Lcom/eightsleep/corepresentation/navigation/route/NavRoute;ZILjava/lang/Object;)V

    return-void

    .line 14
    :cond_1
    instance-of v0, p1, Ltg/n;

    if-eqz v0, :cond_2

    .line 15
    new-instance p1, Lcom/eightsleep/corepresentation/navigation/route/Route$BreathingDisturbances;

    .line 16
    iget-object v0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->selectedDate:Ljava/time/LocalDate;

    invoke-virtual {v0}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    invoke-direct {p1, v0}, Lcom/eightsleep/corepresentation/navigation/route/Route$BreathingDisturbances;-><init>(Ljava/lang/String;)V

    .line 18
    invoke-static {p0, p1, v4, v3, v1}, LL8/e;->goTo$default(LL8/e;Lcom/eightsleep/corepresentation/navigation/route/NavRoute;ZILjava/lang/Object;)V

    return-void

    .line 19
    :cond_2
    instance-of v0, p1, Ltg/p;

    if-eqz v0, :cond_3

    .line 20
    new-instance p1, Lcom/eightsleep/corepresentation/navigation/route/Route$HeartbeatDisturbances;

    .line 21
    iget-object v0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->selectedDate:Ljava/time/LocalDate;

    invoke-virtual {v0}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    invoke-direct {p1, v0}, Lcom/eightsleep/corepresentation/navigation/route/Route$HeartbeatDisturbances;-><init>(Ljava/lang/String;)V

    .line 23
    invoke-static {p0, p1, v4, v3, v1}, LL8/e;->goTo$default(LL8/e;Lcom/eightsleep/corepresentation/navigation/route/NavRoute;ZILjava/lang/Object;)V

    return-void

    .line 24
    :cond_3
    instance-of v0, p1, Ltg/o;

    if-eqz v0, :cond_7

    check-cast p1, Ltg/o;

    .line 25
    iget-object p1, p1, Ltg/o;->a:Lcom/eightsleep/presentation_metrics/enums/HealthTierTrend;

    .line 26
    sget-object v0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_6

    if-eq p1, v3, :cond_5

    const/4 v0, 0x3

    if-ne p1, v0, :cond_4

    .line 27
    new-instance p1, Lcom/eightsleep/corepresentation/navigation/route/Route$BreathRateTrends;

    iget-object v0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->selectedDate:Ljava/time/LocalDate;

    invoke-virtual {v0}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p1, v0}, Lcom/eightsleep/corepresentation/navigation/route/Route$BreathRateTrends;-><init>(Ljava/lang/String;)V

    invoke-static {p0, p1, v4, v3, v1}, LL8/e;->goTo$default(LL8/e;Lcom/eightsleep/corepresentation/navigation/route/NavRoute;ZILjava/lang/Object;)V

    return-void

    .line 28
    :cond_4
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0

    .line 29
    :cond_5
    new-instance p1, Lcom/eightsleep/corepresentation/navigation/route/Route$HeartRateVariabilityTrends;

    iget-object v0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->selectedDate:Ljava/time/LocalDate;

    invoke-virtual {v0}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p1, v0}, Lcom/eightsleep/corepresentation/navigation/route/Route$HeartRateVariabilityTrends;-><init>(Ljava/lang/String;)V

    invoke-static {p0, p1, v4, v3, v1}, LL8/e;->goTo$default(LL8/e;Lcom/eightsleep/corepresentation/navigation/route/NavRoute;ZILjava/lang/Object;)V

    return-void

    .line 30
    :cond_6
    new-instance p1, Lcom/eightsleep/corepresentation/navigation/route/Route$RestingHeartRateTrends;

    iget-object v0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->selectedDate:Ljava/time/LocalDate;

    invoke-virtual {v0}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p1, v0}, Lcom/eightsleep/corepresentation/navigation/route/Route$RestingHeartRateTrends;-><init>(Ljava/lang/String;)V

    invoke-static {p0, p1, v4, v3, v1}, LL8/e;->goTo$default(LL8/e;Lcom/eightsleep/corepresentation/navigation/route/NavRoute;ZILjava/lang/Object;)V

    return-void

    .line 31
    :cond_7
    instance-of v0, p1, Ltg/m;

    if-eqz v0, :cond_8

    invoke-virtual {p0}, LL8/e;->onBackPressed()V

    return-void

    .line 32
    :cond_8
    instance-of v0, p1, Ltg/s;

    if-eqz v0, :cond_9

    check-cast p1, Ltg/s;

    .line 33
    iget-object p1, p1, Ltg/s;->a:Ljava/lang/String;

    .line 34
    invoke-direct {p0, p1}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->toggleTag(Ljava/lang/String;)V

    return-void

    .line 35
    :cond_9
    instance-of v0, p1, Ltg/k;

    if-eqz v0, :cond_a

    check-cast p1, Ltg/k;

    .line 36
    iget-object p1, p1, Ltg/k;->a:Ljava/lang/String;

    .line 37
    invoke-direct {p0, p1}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->addCustomTag(Ljava/lang/String;)V

    return-void

    .line 38
    :cond_a
    instance-of v0, p1, Ltg/l;

    if-eqz v0, :cond_b

    invoke-direct {p0}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->hideAddTagModal()V

    return-void

    .line 39
    :cond_b
    instance-of v0, p1, Ltg/q;

    if-eqz v0, :cond_d

    .line 40
    new-instance v0, Lcom/eightsleep/corepresentation/navigation/route/Route$TagDrawer;

    .line 41
    iget-object v5, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->selectedDate:Ljava/time/LocalDate;

    invoke-virtual {v5}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    .line 42
    iget-object v2, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;->pregnancyModeFlow:Lzo/r0;

    check-cast v2, Lzo/M0;

    invoke-virtual {v2}, Lzo/M0;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$PregnancyModeUiState;

    if-eqz v2, :cond_c

    invoke-virtual {v2}, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel$PregnancyModeUiState;->isModeActive()Z

    move-result v2

    goto :goto_0

    :cond_c
    move v2, v4

    .line 43
    :goto_0
    check-cast p1, Ltg/q;

    .line 44
    iget-object p1, p1, Ltg/q;->a:Ljava/util/List;

    .line 45
    invoke-direct {v0, v5, v2, p1}, Lcom/eightsleep/corepresentation/navigation/route/Route$TagDrawer;-><init>(Ljava/lang/String;ZLjava/util/List;)V

    .line 46
    invoke-static {p0, v0, v4, v3, v1}, LL8/e;->goTo$default(LL8/e;Lcom/eightsleep/corepresentation/navigation/route/NavRoute;ZILjava/lang/Object;)V

    return-void

    .line 47
    :cond_d
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0
.end method
