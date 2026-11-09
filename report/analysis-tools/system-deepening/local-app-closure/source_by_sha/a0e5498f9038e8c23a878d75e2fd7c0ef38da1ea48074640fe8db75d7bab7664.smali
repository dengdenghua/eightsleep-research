.class public final Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lcom/squareup/moshi/JsonClass;
    generateAdapter = true
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008 \n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0000\u0008\u0087\u0008\u0018\u00002\u00020\u0001BQ\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u0012\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u0003\u0012\u0008\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\u0008\u0010\n\u001a\u0004\u0018\u00010\u0003\u0012\u0008\u0010\u000b\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\t\u0010\u0019\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u001a\u001a\u00020\u0005H\u00c6\u0003J\u0010\u0010\u001b\u001a\u0004\u0018\u00010\u0003H\u00c6\u0003\u00a2\u0006\u0002\u0010\u0012J\t\u0010\u001c\u001a\u00020\u0003H\u00c6\u0003J\u0010\u0010\u001d\u001a\u0004\u0018\u00010\u0003H\u00c6\u0003\u00a2\u0006\u0002\u0010\u0012J\u0010\u0010\u001e\u001a\u0004\u0018\u00010\u0003H\u00c6\u0003\u00a2\u0006\u0002\u0010\u0012J\u0010\u0010\u001f\u001a\u0004\u0018\u00010\u0003H\u00c6\u0003\u00a2\u0006\u0002\u0010\u0012J\u0010\u0010 \u001a\u0004\u0018\u00010\u0003H\u00c6\u0003\u00a2\u0006\u0002\u0010\u0012Jh\u0010!\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00032\n\u0008\u0002\u0010\u0008\u001a\u0004\u0018\u00010\u00032\n\u0008\u0002\u0010\t\u001a\u0004\u0018\u00010\u00032\n\u0008\u0002\u0010\n\u001a\u0004\u0018\u00010\u00032\n\u0008\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0003H\u00c6\u0001\u00a2\u0006\u0002\u0010\"J\u0013\u0010#\u001a\u00020\u00052\u0008\u0010$\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010%\u001a\u00020&H\u00d6\u0001J\t\u0010\'\u001a\u00020(H\u00d6\u0001R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000fR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0004\u0010\u0010R\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\n\n\u0002\u0010\u0013\u001a\u0004\u0008\u0011\u0010\u0012R\u0011\u0010\u0007\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u000fR\u0015\u0010\u0008\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\n\n\u0002\u0010\u0013\u001a\u0004\u0008\u0015\u0010\u0012R\u0015\u0010\t\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\n\n\u0002\u0010\u0013\u001a\u0004\u0008\u0016\u0010\u0012R\u0015\u0010\n\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\n\n\u0002\u0010\u0013\u001a\u0004\u0008\u0017\u0010\u0012R\u0015\u0010\u000b\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\n\n\u0002\u0010\u0013\u001a\u0004\u0008\u0018\u0010\u0012\u00a8\u0006)"
    }
    d2 = {
        "Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;",
        "",
        "value",
        "",
        "isAbnormal",
        "",
        "probability",
        "dayOfWeekAverage",
        "dayOfWeekStdDev",
        "dayOfWeekDeviation",
        "abnormalLowerBound",
        "abnormalUpperBound",
        "<init>",
        "(DZLjava/lang/Double;DLjava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;)V",
        "getValue",
        "()D",
        "()Z",
        "getProbability",
        "()Ljava/lang/Double;",
        "Ljava/lang/Double;",
        "getDayOfWeekAverage",
        "getDayOfWeekStdDev",
        "getDayOfWeekDeviation",
        "getAbnormalLowerBound",
        "getAbnormalUpperBound",
        "component1",
        "component2",
        "component3",
        "component4",
        "component5",
        "component6",
        "component7",
        "component8",
        "copy",
        "(DZLjava/lang/Double;DLjava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;)Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;",
        "equals",
        "other",
        "hashCode",
        "",
        "toString",
        "",
        "data-metrics_tencentRelease"
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
.field private final abnormalLowerBound:Ljava/lang/Double;

.field private final abnormalUpperBound:Ljava/lang/Double;

.field private final dayOfWeekAverage:D

.field private final dayOfWeekDeviation:Ljava/lang/Double;

.field private final dayOfWeekStdDev:Ljava/lang/Double;

.field private final isAbnormal:Z

.field private final probability:Ljava/lang/Double;

.field private final value:D


# direct methods
.method public constructor <init>(DZLjava/lang/Double;DLjava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->value:D

    iput-boolean p3, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->isAbnormal:Z

    iput-object p4, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->probability:Ljava/lang/Double;

    iput-wide p5, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->dayOfWeekAverage:D

    iput-object p7, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->dayOfWeekStdDev:Ljava/lang/Double;

    iput-object p8, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->dayOfWeekDeviation:Ljava/lang/Double;

    iput-object p9, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->abnormalLowerBound:Ljava/lang/Double;

    iput-object p10, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->abnormalUpperBound:Ljava/lang/Double;

    return-void
.end method

.method public static synthetic copy$default(Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;DZLjava/lang/Double;DLjava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;ILjava/lang/Object;)Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;
    .locals 11

    move/from16 v0, p11

    and-int/lit8 v1, v0, 0x1

    if-eqz v1, :cond_0

    iget-wide p1, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->value:D

    :cond_0
    move-wide v1, p1

    and-int/lit8 p1, v0, 0x2

    if-eqz p1, :cond_1

    iget-boolean p3, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->isAbnormal:Z

    :cond_1
    move v3, p3

    and-int/lit8 p1, v0, 0x4

    if-eqz p1, :cond_2

    iget-object p4, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->probability:Ljava/lang/Double;

    :cond_2
    move-object v4, p4

    and-int/lit8 p1, v0, 0x8

    if-eqz p1, :cond_3

    iget-wide p1, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->dayOfWeekAverage:D

    move-wide v5, p1

    goto :goto_0

    :cond_3
    move-wide/from16 v5, p5

    :goto_0
    and-int/lit8 p1, v0, 0x10

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->dayOfWeekStdDev:Ljava/lang/Double;

    move-object v7, p1

    goto :goto_1

    :cond_4
    move-object/from16 v7, p7

    :goto_1
    and-int/lit8 p1, v0, 0x20

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->dayOfWeekDeviation:Ljava/lang/Double;

    move-object v8, p1

    goto :goto_2

    :cond_5
    move-object/from16 v8, p8

    :goto_2
    and-int/lit8 p1, v0, 0x40

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->abnormalLowerBound:Ljava/lang/Double;

    move-object v9, p1

    goto :goto_3

    :cond_6
    move-object/from16 v9, p9

    :goto_3
    and-int/lit16 p1, v0, 0x80

    if-eqz p1, :cond_7

    iget-object p1, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->abnormalUpperBound:Ljava/lang/Double;

    move-object v10, p1

    :goto_4
    move-object v0, p0

    goto :goto_5

    :cond_7
    move-object/from16 v10, p10

    goto :goto_4

    :goto_5
    invoke-virtual/range {v0 .. v10}, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->copy(DZLjava/lang/Double;DLjava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;)Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()D
    .locals 2

    iget-wide v0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->value:D

    return-wide v0
.end method

.method public final component2()Z
    .locals 0

    iget-boolean p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->isAbnormal:Z

    return p0
.end method

.method public final component3()Ljava/lang/Double;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->probability:Ljava/lang/Double;

    return-object p0
.end method

.method public final component4()D
    .locals 2

    iget-wide v0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->dayOfWeekAverage:D

    return-wide v0
.end method

.method public final component5()Ljava/lang/Double;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->dayOfWeekStdDev:Ljava/lang/Double;

    return-object p0
.end method

.method public final component6()Ljava/lang/Double;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->dayOfWeekDeviation:Ljava/lang/Double;

    return-object p0
.end method

.method public final component7()Ljava/lang/Double;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->abnormalLowerBound:Ljava/lang/Double;

    return-object p0
.end method

.method public final component8()Ljava/lang/Double;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->abnormalUpperBound:Ljava/lang/Double;

    return-object p0
.end method

.method public final copy(DZLjava/lang/Double;DLjava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;)Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;
    .locals 0

    new-instance p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;

    invoke-direct/range {p0 .. p10}, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;-><init>(DZLjava/lang/Double;DLjava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;)V

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;

    iget-wide v3, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->value:D

    iget-wide v5, p1, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->value:D

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Double;->compare(DD)I

    move-result v1

    if-eqz v1, :cond_2

    return v2

    :cond_2
    iget-boolean v1, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->isAbnormal:Z

    iget-boolean v3, p1, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->isAbnormal:Z

    if-eq v1, v3, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->probability:Ljava/lang/Double;

    iget-object v3, p1, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->probability:Ljava/lang/Double;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    :cond_4
    iget-wide v3, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->dayOfWeekAverage:D

    iget-wide v5, p1, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->dayOfWeekAverage:D

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Double;->compare(DD)I

    move-result v1

    if-eqz v1, :cond_5

    return v2

    :cond_5
    iget-object v1, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->dayOfWeekStdDev:Ljava/lang/Double;

    iget-object v3, p1, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->dayOfWeekStdDev:Ljava/lang/Double;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    return v2

    :cond_6
    iget-object v1, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->dayOfWeekDeviation:Ljava/lang/Double;

    iget-object v3, p1, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->dayOfWeekDeviation:Ljava/lang/Double;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    return v2

    :cond_7
    iget-object v1, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->abnormalLowerBound:Ljava/lang/Double;

    iget-object v3, p1, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->abnormalLowerBound:Ljava/lang/Double;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    return v2

    :cond_8
    iget-object p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->abnormalUpperBound:Ljava/lang/Double;

    iget-object p1, p1, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->abnormalUpperBound:Ljava/lang/Double;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9

    return v2

    :cond_9
    return v0
.end method

.method public final getAbnormalLowerBound()Ljava/lang/Double;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->abnormalLowerBound:Ljava/lang/Double;

    return-object p0
.end method

.method public final getAbnormalUpperBound()Ljava/lang/Double;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->abnormalUpperBound:Ljava/lang/Double;

    return-object p0
.end method

.method public final getDayOfWeekAverage()D
    .locals 2

    iget-wide v0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->dayOfWeekAverage:D

    return-wide v0
.end method

.method public final getDayOfWeekDeviation()Ljava/lang/Double;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->dayOfWeekDeviation:Ljava/lang/Double;

    return-object p0
.end method

.method public final getDayOfWeekStdDev()Ljava/lang/Double;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->dayOfWeekStdDev:Ljava/lang/Double;

    return-object p0
.end method

.method public final getProbability()Ljava/lang/Double;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->probability:Ljava/lang/Double;

    return-object p0
.end method

.method public final getValue()D
    .locals 2

    iget-wide v0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->value:D

    return-wide v0
.end method

.method public hashCode()I
    .locals 6

    iget-wide v0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->value:D

    invoke-static {v0, v1}, Ljava/lang/Double;->hashCode(D)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->isAbnormal:Z

    invoke-static {v0, v1, v2}, Lr4/K;->f(IIZ)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->probability:Ljava/lang/Double;

    const/4 v3, 0x0

    if-nez v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_0
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-wide v4, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->dayOfWeekAverage:D

    invoke-static {v4, v5, v0, v1}, LB/h;->c(DII)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->dayOfWeekStdDev:Ljava/lang/Double;

    if-nez v2, :cond_1

    move v2, v3

    goto :goto_1

    :cond_1
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_1
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->dayOfWeekDeviation:Ljava/lang/Double;

    if-nez v2, :cond_2

    move v2, v3

    goto :goto_2

    :cond_2
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_2
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->abnormalLowerBound:Ljava/lang/Double;

    if-nez v2, :cond_3

    move v2, v3

    goto :goto_3

    :cond_3
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_3
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->abnormalUpperBound:Ljava/lang/Double;

    if-nez p0, :cond_4

    goto :goto_4

    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_4
    add-int/2addr v0, v3

    return v0
.end method

.method public final isAbnormal()Z
    .locals 0

    iget-boolean p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->isAbnormal:Z

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 11

    iget-wide v0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->value:D

    iget-boolean v2, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->isAbnormal:Z

    iget-object v3, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->probability:Ljava/lang/Double;

    iget-wide v4, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->dayOfWeekAverage:D

    iget-object v6, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->dayOfWeekStdDev:Ljava/lang/Double;

    iget-object v7, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->dayOfWeekDeviation:Ljava/lang/Double;

    iget-object v8, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->abnormalLowerBound:Ljava/lang/Double;

    iget-object p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;->abnormalUpperBound:Ljava/lang/Double;

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "WellBeingDetailStats(value="

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v0, ", isAbnormal="

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, ", probability="

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", dayOfWeekAverage="

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v0, ", dayOfWeekStdDev="

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", dayOfWeekDeviation="

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", abnormalLowerBound="

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", abnormalUpperBound="

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
