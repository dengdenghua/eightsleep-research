.class public final Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lcom/squareup/moshi/JsonClass;
    generateAdapter = true
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u000c\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0000\u0008\u0087\u0008\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u000b\u001a\u00020\u0003H\u00c6\u0003J\u001d\u0010\u000c\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0003H\u00c6\u0001J\u0013\u0010\r\u001a\u00020\u00032\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010\u000f\u001a\u00020\u0010H\u00d6\u0001J\t\u0010\u0011\u001a\u00020\u0012H\u00d6\u0001R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0011\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\u0008\u00a8\u0006\u0013"
    }
    d2 = {
        "Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;",
        "",
        "supplementsEnabled",
        "",
        "stayingLongerThanThreeDays",
        "<init>",
        "(ZZ)V",
        "getSupplementsEnabled",
        "()Z",
        "getStayingLongerThanThreeDays",
        "component1",
        "component2",
        "copy",
        "equals",
        "other",
        "hashCode",
        "",
        "toString",
        "",
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
.field private final stayingLongerThanThreeDays:Z

.field private final supplementsEnabled:Z


# direct methods
.method public constructor <init>(ZZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;->supplementsEnabled:Z

    iput-boolean p2, p0, Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;->stayingLongerThanThreeDays:Z

    return-void
.end method

.method public static synthetic copy$default(Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;ZZILjava/lang/Object;)Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;
    .locals 0

    and-int/lit8 p4, p3, 0x1

    if-eqz p4, :cond_0

    iget-boolean p1, p0, Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;->supplementsEnabled:Z

    :cond_0
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1

    iget-boolean p2, p0, Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;->stayingLongerThanThreeDays:Z

    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;->copy(ZZ)Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Z
    .locals 0

    iget-boolean p0, p0, Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;->supplementsEnabled:Z

    return p0
.end method

.method public final component2()Z
    .locals 0

    iget-boolean p0, p0, Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;->stayingLongerThanThreeDays:Z

    return p0
.end method

.method public final copy(ZZ)Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;
    .locals 0

    new-instance p0, Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;

    invoke-direct {p0, p1, p2}, Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;-><init>(ZZ)V

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;

    iget-boolean v1, p0, Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;->supplementsEnabled:Z

    iget-boolean v3, p1, Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;->supplementsEnabled:Z

    if-eq v1, v3, :cond_2

    return v2

    :cond_2
    iget-boolean p0, p0, Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;->stayingLongerThanThreeDays:Z

    iget-boolean p1, p1, Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;->stayingLongerThanThreeDays:Z

    if-eq p0, p1, :cond_3

    return v2

    :cond_3
    return v0
.end method

.method public final getStayingLongerThanThreeDays()Z
    .locals 0

    iget-boolean p0, p0, Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;->stayingLongerThanThreeDays:Z

    return p0
.end method

.method public final getSupplementsEnabled()Z
    .locals 0

    iget-boolean p0, p0, Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;->supplementsEnabled:Z

    return p0
.end method

.method public hashCode()I
    .locals 1

    iget-boolean v0, p0, Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;->supplementsEnabled:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean p0, p0, Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;->stayingLongerThanThreeDays:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    iget-boolean v0, p0, Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;->supplementsEnabled:Z

    iget-boolean p0, p0, Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;->stayingLongerThanThreeDays:Z

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "CreateJetLagPlanRequest(supplementsEnabled="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, ", stayingLongerThanThreeDays="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
