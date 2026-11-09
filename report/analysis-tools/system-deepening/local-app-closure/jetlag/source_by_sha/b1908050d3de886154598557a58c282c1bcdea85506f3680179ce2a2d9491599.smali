.class public final Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lcom/squareup/moshi/JsonClass;
    generateAdapter = true
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u000c\n\u0002\u0010\u000b\n\u0002\u0008\u0007\u0008\u0087\u0008\u0018\u00002\u00020\u0001B\u001b\u0012\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\r\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0012\u0010\u000b\u001a\u0004\u0018\u00010\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0012\u0010\r\u001a\u0004\u0018\u00010\u0004H\u00c6\u0003\u00a2\u0006\u0004\u0008\r\u0010\u000eJ(\u0010\u000f\u001a\u00020\u00002\n\u0008\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u00022\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004H\u00c6\u0001\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0004H\u00d6\u0001\u00a2\u0006\u0004\u0008\u0011\u0010\u000eJ\u0010\u0010\u0012\u001a\u00020\u0002H\u00d6\u0001\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u001a\u0010\u0016\u001a\u00020\u00152\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003\u00a2\u0006\u0004\u0008\u0016\u0010\u0017R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0003\u0010\u0018\u001a\u0004\u0008\u0019\u0010\u000cR\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0005\u0010\u001a\u001a\u0004\u0008\u001b\u0010\u000e\u00a8\u0006\u001c"
    }
    d2 = {
        "Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;",
        "",
        "",
        "capsuleCount",
        "",
        "legId",
        "<init>",
        "(Ljava/lang/Integer;Ljava/lang/String;)V",
        "Lgc/d;",
        "toDomain",
        "()Lgc/d;",
        "component1",
        "()Ljava/lang/Integer;",
        "component2",
        "()Ljava/lang/String;",
        "copy",
        "(Ljava/lang/Integer;Ljava/lang/String;)Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;",
        "toString",
        "hashCode",
        "()I",
        "other",
        "",
        "equals",
        "(Ljava/lang/Object;)Z",
        "Ljava/lang/Integer;",
        "getCapsuleCount",
        "Ljava/lang/String;",
        "getLegId",
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
.field private final capsuleCount:Ljava/lang/Integer;

.field private final legId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;->capsuleCount:Ljava/lang/Integer;

    iput-object p2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;->legId:Ljava/lang/String;

    return-void
.end method

.method public static synthetic copy$default(Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;Ljava/lang/Integer;Ljava/lang/String;ILjava/lang/Object;)Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;
    .locals 0

    and-int/lit8 p4, p3, 0x1

    if-eqz p4, :cond_0

    iget-object p1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;->capsuleCount:Ljava/lang/Integer;

    :cond_0
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1

    iget-object p2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;->legId:Ljava/lang/String;

    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;->copy(Ljava/lang/Integer;Ljava/lang/String;)Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/lang/Integer;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;->capsuleCount:Ljava/lang/Integer;

    return-object p0
.end method

.method public final component2()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;->legId:Ljava/lang/String;

    return-object p0
.end method

.method public final copy(Ljava/lang/Integer;Ljava/lang/String;)Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;
    .locals 0

    new-instance p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;

    invoke-direct {p0, p1, p2}, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;-><init>(Ljava/lang/Integer;Ljava/lang/String;)V

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;

    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;->capsuleCount:Ljava/lang/Integer;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;->capsuleCount:Ljava/lang/Integer;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;->legId:Ljava/lang/String;

    iget-object p1, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;->legId:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    return v2

    :cond_3
    return v0
.end method

.method public final getCapsuleCount()Ljava/lang/Integer;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;->capsuleCount:Ljava/lang/Integer;

    return-object p0
.end method

.method public final getLegId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;->legId:Ljava/lang/String;

    return-object p0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;->capsuleCount:Ljava/lang/Integer;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_0
    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;->legId:Ljava/lang/String;

    if-nez p0, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_1
    add-int/2addr v0, v1

    return v0
.end method

.method public final toDomain()Lgc/d;
    .locals 2

    new-instance v0, Lgc/d;

    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;->capsuleCount:Ljava/lang/Integer;

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;->legId:Ljava/lang/String;

    invoke-direct {v0, v1, p0}, Lgc/d;-><init>(Ljava/lang/Integer;Ljava/lang/String;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;->capsuleCount:Ljava/lang/Integer;

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;->legId:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "JetLagPlanMetadataResponse(capsuleCount="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", legId="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
