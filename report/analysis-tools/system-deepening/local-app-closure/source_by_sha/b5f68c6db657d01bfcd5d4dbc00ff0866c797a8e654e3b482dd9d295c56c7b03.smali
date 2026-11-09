.class public final Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lcom/squareup/moshi/JsonClass;
    generateAdapter = true
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0010\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u000f\u0008\u0087\u0008\u0018\u00002\u00020\u0001B?\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\u0008\u0012\u0006\u0010\u000b\u001a\u00020\n\u0012\u0006\u0010\u000c\u001a\u00020\n\u0012\u0006\u0010\r\u001a\u00020\n\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\r\u0010\u0011\u001a\u00020\u0010\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0010\u0010\u0015\u001a\u00020\u0004H\u00c6\u0003\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u0010\u0010\u0017\u001a\u00020\u0006H\u00c6\u0003\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u0010\u0010\u0019\u001a\u00020\u0008H\u00c6\u0003\u00a2\u0006\u0004\u0008\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\nH\u00c6\u0003\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\nH\u00c6\u0003\u00a2\u0006\u0004\u0008\u001d\u0010\u001cJ\u0010\u0010\u001e\u001a\u00020\nH\u00c6\u0003\u00a2\u0006\u0004\u0008\u001e\u0010\u001cJV\u0010\u001f\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0003\u001a\u00020\u00022\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u00042\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00062\u0008\u0008\u0002\u0010\t\u001a\u00020\u00082\u0008\u0008\u0002\u0010\u000b\u001a\u00020\n2\u0008\u0008\u0002\u0010\u000c\u001a\u00020\n2\u0008\u0008\u0002\u0010\r\u001a\u00020\nH\u00c6\u0001\u00a2\u0006\u0004\u0008\u001f\u0010 J\u0010\u0010\"\u001a\u00020!H\u00d6\u0001\u00a2\u0006\u0004\u0008\"\u0010#J\u0010\u0010$\u001a\u00020\nH\u00d6\u0001\u00a2\u0006\u0004\u0008$\u0010\u001cJ\u001a\u0010\'\u001a\u00020&2\u0008\u0010%\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003\u00a2\u0006\u0004\u0008\'\u0010(R\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004\u00a2\u0006\u000c\n\u0004\u0008\u0003\u0010)\u001a\u0004\u0008*\u0010\u0014R\u001a\u0010\u0005\u001a\u00020\u00048\u0016X\u0096\u0004\u00a2\u0006\u000c\n\u0004\u0008\u0005\u0010+\u001a\u0004\u0008,\u0010\u0016R\u001a\u0010\u0007\u001a\u00020\u00068\u0016X\u0096\u0004\u00a2\u0006\u000c\n\u0004\u0008\u0007\u0010-\u001a\u0004\u0008.\u0010\u0018R\u0017\u0010\t\u001a\u00020\u00088\u0006\u00a2\u0006\u000c\n\u0004\u0008\t\u0010/\u001a\u0004\u00080\u0010\u001aR\u0017\u0010\u000b\u001a\u00020\n8\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000b\u00101\u001a\u0004\u00082\u0010\u001cR\u0017\u0010\u000c\u001a\u00020\n8\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000c\u00101\u001a\u0004\u00083\u0010\u001cR\u0017\u0010\r\u001a\u00020\n8\u0006\u00a2\u0006\u000c\n\u0004\u0008\r\u00101\u001a\u0004\u00084\u0010\u001c\u00a8\u00065"
    }
    d2 = {
        "Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;",
        "",
        "",
        "value",
        "Lcom/eightsleep/data_metrics/enums/HealthScoreStatRating;",
        "rating",
        "Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;",
        "ranges",
        "Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;",
        "abnormalities",
        "",
        "dayCount",
        "daysUntilAvailable",
        "daysUntilCalibrated",
        "<init>",
        "(DLcom/eightsleep/data_metrics/enums/HealthScoreStatRating;Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;III)V",
        "Lrc/m;",
        "toDomain",
        "()Lrc/m;",
        "component1",
        "()D",
        "component2",
        "()Lcom/eightsleep/data_metrics/enums/HealthScoreStatRating;",
        "component3",
        "()Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;",
        "component4",
        "()Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;",
        "component5",
        "()I",
        "component6",
        "component7",
        "copy",
        "(DLcom/eightsleep/data_metrics/enums/HealthScoreStatRating;Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;III)Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;",
        "",
        "toString",
        "()Ljava/lang/String;",
        "hashCode",
        "other",
        "",
        "equals",
        "(Ljava/lang/Object;)Z",
        "D",
        "getValue",
        "Lcom/eightsleep/data_metrics/enums/HealthScoreStatRating;",
        "getRating",
        "Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;",
        "getRanges",
        "Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;",
        "getAbnormalities",
        "I",
        "getDayCount",
        "getDaysUntilAvailable",
        "getDaysUntilCalibrated",
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
.field private final abnormalities:Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;

.field private final dayCount:I

.field private final daysUntilAvailable:I

.field private final daysUntilCalibrated:I

.field private final ranges:Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;

.field private final rating:Lcom/eightsleep/data_metrics/enums/HealthScoreStatRating;

.field private final value:D


# direct methods
.method public constructor <init>(DLcom/eightsleep/data_metrics/enums/HealthScoreStatRating;Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;III)V
    .locals 1

    const-string v0, "rating"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "ranges"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "abnormalities"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->value:D

    iput-object p3, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->rating:Lcom/eightsleep/data_metrics/enums/HealthScoreStatRating;

    iput-object p4, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->ranges:Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;

    iput-object p5, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->abnormalities:Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;

    iput p6, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->dayCount:I

    iput p7, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->daysUntilAvailable:I

    iput p8, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->daysUntilCalibrated:I

    return-void
.end method

.method public static synthetic copy$default(Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;DLcom/eightsleep/data_metrics/enums/HealthScoreStatRating;Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;IIIILjava/lang/Object;)Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;
    .locals 9

    and-int/lit8 v0, p9, 0x1

    if-eqz v0, :cond_0

    iget-wide p1, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->value:D

    :cond_0
    move-wide v1, p1

    and-int/lit8 p1, p9, 0x2

    if-eqz p1, :cond_1

    iget-object p3, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->rating:Lcom/eightsleep/data_metrics/enums/HealthScoreStatRating;

    :cond_1
    move-object v3, p3

    and-int/lit8 p1, p9, 0x4

    if-eqz p1, :cond_2

    iget-object p4, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->ranges:Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;

    :cond_2
    move-object v4, p4

    and-int/lit8 p1, p9, 0x8

    if-eqz p1, :cond_3

    iget-object p5, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->abnormalities:Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;

    :cond_3
    move-object v5, p5

    and-int/lit8 p1, p9, 0x10

    if-eqz p1, :cond_4

    iget p6, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->dayCount:I

    :cond_4
    move v6, p6

    and-int/lit8 p1, p9, 0x20

    if-eqz p1, :cond_5

    iget p1, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->daysUntilAvailable:I

    move v7, p1

    goto :goto_0

    :cond_5
    move/from16 v7, p7

    :goto_0
    and-int/lit8 p1, p9, 0x40

    if-eqz p1, :cond_6

    iget p1, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->daysUntilCalibrated:I

    move v8, p1

    :goto_1
    move-object v0, p0

    goto :goto_2

    :cond_6
    move/from16 v8, p8

    goto :goto_1

    :goto_2
    invoke-virtual/range {v0 .. v8}, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->copy(DLcom/eightsleep/data_metrics/enums/HealthScoreStatRating;Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;III)Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()D
    .locals 2

    iget-wide v0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->value:D

    return-wide v0
.end method

.method public final component2()Lcom/eightsleep/data_metrics/enums/HealthScoreStatRating;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->rating:Lcom/eightsleep/data_metrics/enums/HealthScoreStatRating;

    return-object p0
.end method

.method public final component3()Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->ranges:Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;

    return-object p0
.end method

.method public final component4()Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->abnormalities:Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;

    return-object p0
.end method

.method public final component5()I
    .locals 0

    iget p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->dayCount:I

    return p0
.end method

.method public final component6()I
    .locals 0

    iget p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->daysUntilAvailable:I

    return p0
.end method

.method public final component7()I
    .locals 0

    iget p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->daysUntilCalibrated:I

    return p0
.end method

.method public final copy(DLcom/eightsleep/data_metrics/enums/HealthScoreStatRating;Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;III)Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;
    .locals 9

    const-string p0, "rating"

    invoke-static {p3, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "ranges"

    invoke-static {p4, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "abnormalities"

    invoke-static {p5, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;

    move-wide v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-direct/range {v0 .. v8}, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;-><init>(DLcom/eightsleep/data_metrics/enums/HealthScoreStatRating;Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;III)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;

    iget-wide v3, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->value:D

    iget-wide v5, p1, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->value:D

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Double;->compare(DD)I

    move-result v1

    if-eqz v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->rating:Lcom/eightsleep/data_metrics/enums/HealthScoreStatRating;

    iget-object v3, p1, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->rating:Lcom/eightsleep/data_metrics/enums/HealthScoreStatRating;

    if-eq v1, v3, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->ranges:Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;

    iget-object v3, p1, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->ranges:Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    :cond_4
    iget-object v1, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->abnormalities:Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;

    iget-object v3, p1, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->abnormalities:Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    return v2

    :cond_5
    iget v1, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->dayCount:I

    iget v3, p1, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->dayCount:I

    if-eq v1, v3, :cond_6

    return v2

    :cond_6
    iget v1, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->daysUntilAvailable:I

    iget v3, p1, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->daysUntilAvailable:I

    if-eq v1, v3, :cond_7

    return v2

    :cond_7
    iget p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->daysUntilCalibrated:I

    iget p1, p1, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->daysUntilCalibrated:I

    if-eq p0, p1, :cond_8

    return v2

    :cond_8
    return v0
.end method

.method public final getAbnormalities()Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->abnormalities:Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;

    return-object p0
.end method

.method public final getDayCount()I
    .locals 0

    iget p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->dayCount:I

    return p0
.end method

.method public final getDaysUntilAvailable()I
    .locals 0

    iget p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->daysUntilAvailable:I

    return p0
.end method

.method public final getDaysUntilCalibrated()I
    .locals 0

    iget p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->daysUntilCalibrated:I

    return p0
.end method

.method public getRanges()Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->ranges:Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;

    return-object p0
.end method

.method public getRating()Lcom/eightsleep/data_metrics/enums/HealthScoreStatRating;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->rating:Lcom/eightsleep/data_metrics/enums/HealthScoreStatRating;

    return-object p0
.end method

.method public getValue()D
    .locals 2

    iget-wide v0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->value:D

    return-wide v0
.end method

.method public hashCode()I
    .locals 3

    iget-wide v0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->value:D

    invoke-static {v0, v1}, Ljava/lang/Double;->hashCode(D)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->rating:Lcom/eightsleep/data_metrics/enums/HealthScoreStatRating;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->ranges:Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;

    invoke-virtual {v0}, Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->abnormalities:Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;

    invoke-virtual {v2}, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget v0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->dayCount:I

    invoke-static {v0, v2, v1}, Lr4/K;->c(III)I

    move-result v0

    iget v2, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->daysUntilAvailable:I

    invoke-static {v2, v0, v1}, Lr4/K;->c(III)I

    move-result v0

    iget p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->daysUntilCalibrated:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toDomain()Lrc/m;
    .locals 9

    new-instance v0, Lrc/m;

    invoke-virtual {p0}, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->getValue()D

    move-result-wide v1

    invoke-virtual {p0}, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->getRating()Lcom/eightsleep/data_metrics/enums/HealthScoreStatRating;

    move-result-object v3

    invoke-virtual {p0}, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->getRanges()Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;

    move-result-object v4

    iget-object v5, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->abnormalities:Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;

    iget v6, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->dayCount:I

    iget v7, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->daysUntilAvailable:I

    iget v8, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->daysUntilCalibrated:I

    invoke-direct/range {v0 .. v8}, Lrc/m;-><init>(DLcom/eightsleep/data_metrics/enums/HealthScoreStatRating;Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;III)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 9

    iget-wide v0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->value:D

    iget-object v2, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->rating:Lcom/eightsleep/data_metrics/enums/HealthScoreStatRating;

    iget-object v3, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->ranges:Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;

    iget-object v4, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->abnormalities:Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;

    iget v5, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->dayCount:I

    iget v6, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->daysUntilAvailable:I

    iget p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingHealthScoreStatResponse;->daysUntilCalibrated:I

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "WellBeingHealthScoreStatResponse(value="

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v0, ", rating="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", ranges="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", abnormalities="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", dayCount="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", daysUntilAvailable="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", daysUntilCalibrated="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
