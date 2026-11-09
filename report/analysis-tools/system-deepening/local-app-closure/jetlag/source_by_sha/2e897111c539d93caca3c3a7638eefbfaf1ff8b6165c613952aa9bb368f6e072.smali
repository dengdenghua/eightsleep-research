.class public final Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lcom/squareup/moshi/JsonClass;
    generateAdapter = true
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u000f\n\u0002\u0010\u000b\n\u0002\u0008\u0004\u0008\u0087\u0008\u0018\u00002\u00020\u0001B\'\u0012\u0008\u0008\u0001\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0008\u0001\u0010\u0004\u001a\u00020\u0005\u0012\n\u0008\u0001\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\t\u0010\u0011\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0012\u001a\u00020\u0005H\u00c6\u0003J\u0010\u0010\u0013\u001a\u0004\u0018\u00010\u0007H\u00c6\u0003\u00a2\u0006\u0002\u0010\u000fJ.\u0010\u0014\u001a\u00020\u00002\u0008\u0008\u0003\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0003\u0010\u0004\u001a\u00020\u00052\n\u0008\u0003\u0010\u0006\u001a\u0004\u0018\u00010\u0007H\u00c6\u0001\u00a2\u0006\u0002\u0010\u0015J\u0013\u0010\u0016\u001a\u00020\u00172\u0008\u0010\u0018\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010\u0019\u001a\u00020\u0007H\u00d6\u0001J\t\u0010\u001a\u001a\u00020\u0003H\u00d6\u0001R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\n\n\u0002\u0010\u0010\u001a\u0004\u0008\u000e\u0010\u000f\u00a8\u0006\u001b"
    }
    d2 = {
        "Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;",
        "",
        "taskId",
        "",
        "status",
        "Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;",
        "supplementCount",
        "",
        "<init>",
        "(Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;Ljava/lang/Integer;)V",
        "getTaskId",
        "()Ljava/lang/String;",
        "getStatus",
        "()Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;",
        "getSupplementCount",
        "()Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        "component1",
        "component2",
        "component3",
        "copy",
        "(Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;Ljava/lang/Integer;)Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;",
        "equals",
        "",
        "other",
        "hashCode",
        "toString",
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
.field private final status:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

.field private final supplementCount:Ljava/lang/Integer;

.field private final taskId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;Ljava/lang/Integer;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "taskId"
        .end annotation
    .end param
    .param p2    # Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "status"
        .end annotation
    .end param
    .param p3    # Ljava/lang/Integer;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "capsuleCount"
        .end annotation
    .end param

    const-string v0, "taskId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "status"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->taskId:Ljava/lang/String;

    iput-object p2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->status:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    iput-object p3, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->supplementCount:Ljava/lang/Integer;

    return-void
.end method

.method public static synthetic copy$default(Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;Ljava/lang/Integer;ILjava/lang/Object;)Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;
    .locals 0

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_0

    iget-object p1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->taskId:Ljava/lang/String;

    :cond_0
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_1

    iget-object p2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->status:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    :cond_1
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_2

    iget-object p3, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->supplementCount:Ljava/lang/Integer;

    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->copy(Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;Ljava/lang/Integer;)Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->taskId:Ljava/lang/String;

    return-object p0
.end method

.method public final component2()Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->status:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    return-object p0
.end method

.method public final component3()Ljava/lang/Integer;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->supplementCount:Ljava/lang/Integer;

    return-object p0
.end method

.method public final copy(Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;Ljava/lang/Integer;)Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "taskId"
        .end annotation
    .end param
    .param p2    # Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "status"
        .end annotation
    .end param
    .param p3    # Ljava/lang/Integer;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "capsuleCount"
        .end annotation
    .end param

    const-string p0, "taskId"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "status"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p0, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;

    invoke-direct {p0, p1, p2, p3}, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;-><init>(Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;Ljava/lang/Integer;)V

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;

    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->taskId:Ljava/lang/String;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->taskId:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->status:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->status:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    if-eq v1, v3, :cond_3

    return v2

    :cond_3
    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->supplementCount:Ljava/lang/Integer;

    iget-object p1, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->supplementCount:Ljava/lang/Integer;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4

    return v2

    :cond_4
    return v0
.end method

.method public final getStatus()Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->status:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    return-object p0
.end method

.method public final getSupplementCount()Ljava/lang/Integer;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->supplementCount:Ljava/lang/Integer;

    return-object p0
.end method

.method public final getTaskId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->taskId:Ljava/lang/String;

    return-object p0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->taskId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->status:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->supplementCount:Ljava/lang/Integer;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    :goto_0
    add-int/2addr v1, p0

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    iget-object v0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->taskId:Ljava/lang/String;

    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->status:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;->supplementCount:Ljava/lang/Integer;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "JetLagTaskUpdateRequest(taskId="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", status="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", supplementCount="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-static {v2, p0, v0}, Ly2/K;->c(Ljava/lang/StringBuilder;Ljava/lang/Integer;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
