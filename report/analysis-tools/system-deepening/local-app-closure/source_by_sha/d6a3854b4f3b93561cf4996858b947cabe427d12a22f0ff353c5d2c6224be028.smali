.class public final Lrc/m;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:D

.field public final b:Lcom/eightsleep/data_metrics/enums/HealthScoreStatRating;

.field public final c:Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;

.field public final d:Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;

.field public final e:I

.field public final f:I

.field public final g:I


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

    iput-wide p1, p0, Lrc/m;->a:D

    iput-object p3, p0, Lrc/m;->b:Lcom/eightsleep/data_metrics/enums/HealthScoreStatRating;

    iput-object p4, p0, Lrc/m;->c:Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;

    iput-object p5, p0, Lrc/m;->d:Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;

    iput p6, p0, Lrc/m;->e:I

    iput p7, p0, Lrc/m;->f:I

    iput p8, p0, Lrc/m;->g:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lrc/m;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lrc/m;

    iget-wide v3, p1, Lrc/m;->a:D

    iget-wide v5, p0, Lrc/m;->a:D

    invoke-static {v5, v6, v3, v4}, Ljava/lang/Double;->compare(DD)I

    move-result v1

    if-eqz v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lrc/m;->b:Lcom/eightsleep/data_metrics/enums/HealthScoreStatRating;

    iget-object v3, p1, Lrc/m;->b:Lcom/eightsleep/data_metrics/enums/HealthScoreStatRating;

    if-eq v1, v3, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lrc/m;->c:Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;

    iget-object v3, p1, Lrc/m;->c:Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    :cond_4
    iget-object v1, p0, Lrc/m;->d:Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;

    iget-object v3, p1, Lrc/m;->d:Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    return v2

    :cond_5
    iget v1, p0, Lrc/m;->e:I

    iget v3, p1, Lrc/m;->e:I

    if-eq v1, v3, :cond_6

    return v2

    :cond_6
    iget v1, p0, Lrc/m;->f:I

    iget v3, p1, Lrc/m;->f:I

    if-eq v1, v3, :cond_7

    return v2

    :cond_7
    iget p0, p0, Lrc/m;->g:I

    iget p1, p1, Lrc/m;->g:I

    if-eq p0, p1, :cond_8

    return v2

    :cond_8
    return v0
.end method

.method public final hashCode()I
    .locals 3

    iget-wide v0, p0, Lrc/m;->a:D

    invoke-static {v0, v1}, Ljava/lang/Double;->hashCode(D)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lrc/m;->b:Lcom/eightsleep/data_metrics/enums/HealthScoreStatRating;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lrc/m;->c:Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;

    invoke-virtual {v0}, Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lrc/m;->d:Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;

    invoke-virtual {v2}, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget v0, p0, Lrc/m;->e:I

    invoke-static {v0, v2, v1}, Lr4/K;->c(III)I

    move-result v0

    iget v2, p0, Lrc/m;->f:I

    invoke-static {v2, v0, v1}, Lr4/K;->c(III)I

    move-result v0

    iget p0, p0, Lrc/m;->g:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "WellBeingHealthScoreStat(value="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v1, p0, Lrc/m;->a:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", rating="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lrc/m;->b:Lcom/eightsleep/data_metrics/enums/HealthScoreStatRating;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", ranges="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lrc/m;->c:Lcom/eightsleep/data_metrics/interfaces/HealthScoreStatRanges;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", abnormalities="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lrc/m;->d:Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", dayCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lrc/m;->e:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", daysUntilAvailable="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lrc/m;->f:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", daysUntilCalibrated="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lrc/m;->g:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
