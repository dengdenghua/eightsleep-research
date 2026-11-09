.class public final Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lcom/squareup/moshi/JsonClass;
    generateAdapter = true
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u000e\n\u0002\u0010\u0008\n\u0002\u0008\u000f\u0008\u0087\u0008\u0018\u00002\u00020\u0001B/\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0008\u001a\u00020\u0007\u0012\u0006\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\r\u0010\u000e\u001a\u00020\r\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008\u0012\u0010\u0011J\u0010\u0010\u0013\u001a\u00020\u0005H\u00c6\u0003\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0010\u0010\u0015\u001a\u00020\u0007H\u00c6\u0003\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u0010\u0010\u0017\u001a\u00020\tH\u00c6\u0003\u00a2\u0006\u0004\u0008\u0017\u0010\u0018JB\u0010\u0019\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0003\u001a\u00020\u00022\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00022\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u00072\u0008\u0008\u0002\u0010\n\u001a\u00020\tH\u00c6\u0001\u00a2\u0006\u0004\u0008\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\tH\u00d6\u0001\u00a2\u0006\u0004\u0008\u001b\u0010\u0018J\u0010\u0010\u001d\u001a\u00020\u001cH\u00d6\u0001\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ\u001a\u0010 \u001a\u00020\u00072\u0008\u0010\u001f\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003\u00a2\u0006\u0004\u0008 \u0010!R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0003\u0010\"\u001a\u0004\u0008#\u0010\u0011R\u0017\u0010\u0004\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0004\u0010\"\u001a\u0004\u0008$\u0010\u0011R\u0017\u0010\u0006\u001a\u00020\u00058\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0006\u0010%\u001a\u0004\u0008&\u0010\u0014R\u0017\u0010\u0008\u001a\u00020\u00078\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0008\u0010\'\u001a\u0004\u0008(\u0010\u0016R\u0017\u0010\n\u001a\u00020\t8\u0006\u00a2\u0006\u000c\n\u0004\u0008\n\u0010)\u001a\u0004\u0008*\u0010\u0018\u00a8\u0006+"
    }
    d2 = {
        "Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;",
        "",
        "Ljava/time/Instant;",
        "startTime",
        "endTime",
        "Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;",
        "levels",
        "",
        "alarmRequested",
        "",
        "sessionId",
        "<init>",
        "(Ljava/time/Instant;Ljava/time/Instant;Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;ZLjava/lang/String;)V",
        "Lkd/f;",
        "toDomain",
        "()Lkd/f;",
        "component1",
        "()Ljava/time/Instant;",
        "component2",
        "component3",
        "()Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;",
        "component4",
        "()Z",
        "component5",
        "()Ljava/lang/String;",
        "copy",
        "(Ljava/time/Instant;Ljava/time/Instant;Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;ZLjava/lang/String;)Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;",
        "toString",
        "",
        "hashCode",
        "()I",
        "other",
        "equals",
        "(Ljava/lang/Object;)Z",
        "Ljava/time/Instant;",
        "getStartTime",
        "getEndTime",
        "Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;",
        "getLevels",
        "Z",
        "getAlarmRequested",
        "Ljava/lang/String;",
        "getSessionId",
        "data-temperature_tencentRelease"
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
.field private final alarmRequested:Z

.field private final endTime:Ljava/time/Instant;

.field private final levels:Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;

.field private final sessionId:Ljava/lang/String;

.field private final startTime:Ljava/time/Instant;


# direct methods
.method public constructor <init>(Ljava/time/Instant;Ljava/time/Instant;Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;ZLjava/lang/String;)V
    .locals 1

    const-string v0, "startTime"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "endTime"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "levels"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "sessionId"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->startTime:Ljava/time/Instant;

    iput-object p2, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->endTime:Ljava/time/Instant;

    iput-object p3, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->levels:Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;

    iput-boolean p4, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->alarmRequested:Z

    iput-object p5, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->sessionId:Ljava/lang/String;

    return-void
.end method

.method public static synthetic copy$default(Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;Ljava/time/Instant;Ljava/time/Instant;Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;ZLjava/lang/String;ILjava/lang/Object;)Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;
    .locals 0

    and-int/lit8 p7, p6, 0x1

    if-eqz p7, :cond_0

    iget-object p1, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->startTime:Ljava/time/Instant;

    :cond_0
    and-int/lit8 p7, p6, 0x2

    if-eqz p7, :cond_1

    iget-object p2, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->endTime:Ljava/time/Instant;

    :cond_1
    and-int/lit8 p7, p6, 0x4

    if-eqz p7, :cond_2

    iget-object p3, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->levels:Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;

    :cond_2
    and-int/lit8 p7, p6, 0x8

    if-eqz p7, :cond_3

    iget-boolean p4, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->alarmRequested:Z

    :cond_3
    and-int/lit8 p6, p6, 0x10

    if-eqz p6, :cond_4

    iget-object p5, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->sessionId:Ljava/lang/String;

    :cond_4
    move p6, p4

    move-object p7, p5

    move-object p4, p2

    move-object p5, p3

    move-object p2, p0

    move-object p3, p1

    invoke-virtual/range {p2 .. p7}, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->copy(Ljava/time/Instant;Ljava/time/Instant;Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;ZLjava/lang/String;)Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/time/Instant;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->startTime:Ljava/time/Instant;

    return-object p0
.end method

.method public final component2()Ljava/time/Instant;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->endTime:Ljava/time/Instant;

    return-object p0
.end method

.method public final component3()Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->levels:Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;

    return-object p0
.end method

.method public final component4()Z
    .locals 0

    iget-boolean p0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->alarmRequested:Z

    return p0
.end method

.method public final component5()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->sessionId:Ljava/lang/String;

    return-object p0
.end method

.method public final copy(Ljava/time/Instant;Ljava/time/Instant;Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;ZLjava/lang/String;)Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;
    .locals 6

    const-string p0, "startTime"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "endTime"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "levels"

    invoke-static {p3, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "sessionId"

    invoke-static {p5, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;-><init>(Ljava/time/Instant;Ljava/time/Instant;Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;ZLjava/lang/String;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;

    iget-object v1, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->startTime:Ljava/time/Instant;

    iget-object v3, p1, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->startTime:Ljava/time/Instant;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->endTime:Ljava/time/Instant;

    iget-object v3, p1, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->endTime:Ljava/time/Instant;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->levels:Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;

    iget-object v3, p1, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->levels:Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    :cond_4
    iget-boolean v1, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->alarmRequested:Z

    iget-boolean v3, p1, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->alarmRequested:Z

    if-eq v1, v3, :cond_5

    return v2

    :cond_5
    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->sessionId:Ljava/lang/String;

    iget-object p1, p1, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->sessionId:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6

    return v2

    :cond_6
    return v0
.end method

.method public final getAlarmRequested()Z
    .locals 0

    iget-boolean p0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->alarmRequested:Z

    return p0
.end method

.method public final getEndTime()Ljava/time/Instant;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->endTime:Ljava/time/Instant;

    return-object p0
.end method

.method public final getLevels()Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->levels:Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;

    return-object p0
.end method

.method public final getSessionId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->sessionId:Ljava/lang/String;

    return-object p0
.end method

.method public final getStartTime()Ljava/time/Instant;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->startTime:Ljava/time/Instant;

    return-object p0
.end method

.method public hashCode()I
    .locals 3

    iget-object v0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->startTime:Ljava/time/Instant;

    invoke-virtual {v0}, Ljava/time/Instant;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->endTime:Ljava/time/Instant;

    invoke-static {v2, v0, v1}, LRp/a;->d(Ljava/time/Instant;II)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->levels:Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;

    invoke-virtual {v2}, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-boolean v0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->alarmRequested:Z

    invoke-static {v2, v1, v0}, Lr4/K;->f(IIZ)I

    move-result v0

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->sessionId:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toDomain()Lkd/f;
    .locals 6

    iget-object v1, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->startTime:Ljava/time/Instant;

    iget-object v0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->levels:Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;

    invoke-virtual {v0}, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;->toDomain()Lkd/d;

    move-result-object v3

    iget-object v2, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->endTime:Ljava/time/Instant;

    iget-boolean v4, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->alarmRequested:Z

    iget-object v5, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->sessionId:Ljava/lang/String;

    new-instance v0, Lkd/f;

    invoke-direct/range {v0 .. v5}, Lkd/f;-><init>(Ljava/time/Instant;Ljava/time/Instant;Lkd/d;ZLjava/lang/String;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    iget-object v0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->startTime:Ljava/time/Instant;

    iget-object v1, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->endTime:Ljava/time/Instant;

    iget-object v2, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->levels:Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;

    iget-boolean v3, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->alarmRequested:Z

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->sessionId:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "NapModeStatusResponse(startTime="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", endTime="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", levels="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", alarmRequested="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, ", sessionId="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-static {v4, p0, v0}, Lr4/K;->s(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
