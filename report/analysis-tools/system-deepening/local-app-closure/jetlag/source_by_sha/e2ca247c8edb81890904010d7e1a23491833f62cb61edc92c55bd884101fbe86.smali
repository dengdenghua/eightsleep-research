.class public final Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lcom/squareup/moshi/JsonClass;
    generateAdapter = true
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0007\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u001d\u0008\u0087\u0008\u0018\u00002\u00020\u0001B7\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0002\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\u0008\u0012\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u001d\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u000f\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0010\u0010\u0015\u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008\u0015\u0010\u0014J\u0010\u0010\u0016\u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008\u0016\u0010\u0014J\u0010\u0010\u0017\u001a\u00020\u0006H\u00c6\u0003\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u0010\u0010\u0019\u001a\u00020\u0008H\u00c6\u0003\u00a2\u0006\u0004\u0008\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\nH\u00c6\u0003\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJL\u0010\u001d\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0003\u001a\u00020\u00022\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00022\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u00022\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00062\u0008\u0008\u0002\u0010\t\u001a\u00020\u00082\u0008\u0008\u0002\u0010\u000b\u001a\u00020\nH\u00c6\u0001\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0006H\u00d6\u0001\u00a2\u0006\u0004\u0008\u001f\u0010\u0018J\u0010\u0010 \u001a\u00020\u0002H\u00d6\u0001\u00a2\u0006\u0004\u0008 \u0010\u0014J\u001a\u0010\"\u001a\u00020\u00082\u0008\u0010!\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003\u00a2\u0006\u0004\u0008\"\u0010#R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0003\u0010$\u001a\u0004\u0008%\u0010\u0014R\u0017\u0010\u0004\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0004\u0010$\u001a\u0004\u0008&\u0010\u0014R\u0017\u0010\u0005\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0005\u0010$\u001a\u0004\u0008\'\u0010\u0014R\u0017\u0010\u0007\u001a\u00020\u00068\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0007\u0010(\u001a\u0004\u0008)\u0010\u0018R\u0017\u0010\t\u001a\u00020\u00088\u0006\u00a2\u0006\u000c\n\u0004\u0008\t\u0010*\u001a\u0004\u0008\t\u0010\u001aR\u0017\u0010\u000b\u001a\u00020\n8\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000b\u0010+\u001a\u0004\u0008,\u0010\u001c\u00a8\u0006-"
    }
    d2 = {
        "Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;",
        "",
        "",
        "totalDays",
        "completedTasks",
        "totalTasks",
        "",
        "nextTaskDate",
        "",
        "isActive",
        "",
        "progress",
        "<init>",
        "(IIILjava/lang/String;ZF)V",
        "planId",
        "userId",
        "Llc/b;",
        "toEntity",
        "(Ljava/lang/String;Ljava/lang/String;)Llc/b;",
        "component1",
        "()I",
        "component2",
        "component3",
        "component4",
        "()Ljava/lang/String;",
        "component5",
        "()Z",
        "component6",
        "()F",
        "copy",
        "(IIILjava/lang/String;ZF)Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;",
        "toString",
        "hashCode",
        "other",
        "equals",
        "(Ljava/lang/Object;)Z",
        "I",
        "getTotalDays",
        "getCompletedTasks",
        "getTotalTasks",
        "Ljava/lang/String;",
        "getNextTaskDate",
        "Z",
        "F",
        "getProgress",
        "data-jetlag_tencentRelease"
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
.field private final completedTasks:I

.field private final isActive:Z

.field private final nextTaskDate:Ljava/lang/String;

.field private final progress:F

.field private final totalDays:I

.field private final totalTasks:I


# direct methods
.method public constructor <init>(IIILjava/lang/String;ZF)V
    .locals 1

    const-string v0, "nextTaskDate"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->totalDays:I

    iput p2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->completedTasks:I

    iput p3, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->totalTasks:I

    iput-object p4, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->nextTaskDate:Ljava/lang/String;

    iput-boolean p5, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->isActive:Z

    iput p6, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->progress:F

    return-void
.end method

.method public static synthetic copy$default(Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;IIILjava/lang/String;ZFILjava/lang/Object;)Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;
    .locals 0

    and-int/lit8 p8, p7, 0x1

    if-eqz p8, :cond_0

    iget p1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->totalDays:I

    :cond_0
    and-int/lit8 p8, p7, 0x2

    if-eqz p8, :cond_1

    iget p2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->completedTasks:I

    :cond_1
    and-int/lit8 p8, p7, 0x4

    if-eqz p8, :cond_2

    iget p3, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->totalTasks:I

    :cond_2
    and-int/lit8 p8, p7, 0x8

    if-eqz p8, :cond_3

    iget-object p4, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->nextTaskDate:Ljava/lang/String;

    :cond_3
    and-int/lit8 p8, p7, 0x10

    if-eqz p8, :cond_4

    iget-boolean p5, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->isActive:Z

    :cond_4
    and-int/lit8 p7, p7, 0x20

    if-eqz p7, :cond_5

    iget p6, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->progress:F

    :cond_5
    move p7, p5

    move p8, p6

    move p5, p3

    move-object p6, p4

    move p3, p1

    move p4, p2

    move-object p2, p0

    invoke-virtual/range {p2 .. p8}, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->copy(IIILjava/lang/String;ZF)Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()I
    .locals 0

    iget p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->totalDays:I

    return p0
.end method

.method public final component2()I
    .locals 0

    iget p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->completedTasks:I

    return p0
.end method

.method public final component3()I
    .locals 0

    iget p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->totalTasks:I

    return p0
.end method

.method public final component4()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->nextTaskDate:Ljava/lang/String;

    return-object p0
.end method

.method public final component5()Z
    .locals 0

    iget-boolean p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->isActive:Z

    return p0
.end method

.method public final component6()F
    .locals 0

    iget p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->progress:F

    return p0
.end method

.method public final copy(IIILjava/lang/String;ZF)Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;
    .locals 7

    const-string p0, "nextTaskDate"

    invoke-static {p4, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;

    move v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    move v6, p6

    invoke-direct/range {v0 .. v6}, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;-><init>(IIILjava/lang/String;ZF)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;

    iget v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->totalDays:I

    iget v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->totalDays:I

    if-eq v1, v3, :cond_2

    return v2

    :cond_2
    iget v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->completedTasks:I

    iget v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->completedTasks:I

    if-eq v1, v3, :cond_3

    return v2

    :cond_3
    iget v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->totalTasks:I

    iget v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->totalTasks:I

    if-eq v1, v3, :cond_4

    return v2

    :cond_4
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->nextTaskDate:Ljava/lang/String;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->nextTaskDate:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    return v2

    :cond_5
    iget-boolean v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->isActive:Z

    iget-boolean v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->isActive:Z

    if-eq v1, v3, :cond_6

    return v2

    :cond_6
    iget p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->progress:F

    iget p1, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->progress:F

    invoke-static {p0, p1}, Ljava/lang/Float;->compare(FF)I

    move-result p0

    if-eqz p0, :cond_7

    return v2

    :cond_7
    return v0
.end method

.method public final getCompletedTasks()I
    .locals 0

    iget p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->completedTasks:I

    return p0
.end method

.method public final getNextTaskDate()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->nextTaskDate:Ljava/lang/String;

    return-object p0
.end method

.method public final getProgress()F
    .locals 0

    iget p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->progress:F

    return p0
.end method

.method public final getTotalDays()I
    .locals 0

    iget p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->totalDays:I

    return p0
.end method

.method public final getTotalTasks()I
    .locals 0

    iget p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->totalTasks:I

    return p0
.end method

.method public hashCode()I
    .locals 3

    iget v0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->totalDays:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->completedTasks:I

    invoke-static {v2, v0, v1}, Lr4/K;->c(III)I

    move-result v0

    iget v2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->totalTasks:I

    invoke-static {v2, v0, v1}, Lr4/K;->c(III)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->nextTaskDate:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/d0;->a(IILjava/lang/String;)I

    move-result v0

    iget-boolean v2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->isActive:Z

    invoke-static {v0, v1, v2}, Lr4/K;->f(IIZ)I

    move-result v0

    iget p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->progress:F

    invoke-static {p0}, Ljava/lang/Float;->hashCode(F)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final isActive()Z
    .locals 0

    iget-boolean p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->isActive:Z

    return p0
.end method

.method public final toEntity(Ljava/lang/String;Ljava/lang/String;)Llc/b;
    .locals 10

    const-string v0, "planId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "userId"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Llc/b;

    iget v4, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->totalDays:I

    iget v5, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->completedTasks:I

    iget v6, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->totalTasks:I

    iget-object v7, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->nextTaskDate:Ljava/lang/String;

    iget-boolean v8, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->isActive:Z

    iget v9, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->progress:F

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v1 .. v9}, Llc/b;-><init>(Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;ZF)V

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 8

    iget v0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->totalDays:I

    iget v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->completedTasks:I

    iget v2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->totalTasks:I

    iget-object v3, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->nextTaskDate:Ljava/lang/String;

    iget-boolean v4, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->isActive:Z

    iget p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->progress:F

    const-string v5, "JetLagPlanSummaryResponse(totalDays="

    const-string v6, ", completedTasks="

    const-string v7, ", totalTasks="

    invoke-static {v0, v1, v5, v6, v7}, Lr4/K;->t(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", nextTaskDate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", isActive="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", progress="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
