.class public final Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lcom/squareup/moshi/JsonClass;
    generateAdapter = true
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u000f\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0000\u0008\u0087\u0008\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0008\u0001\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0011\u001a\u00020\u0005H\u00c6\u0003J\t\u0010\u0012\u001a\u00020\u0007H\u00c6\u0003J\'\u0010\u0013\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0003\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007H\u00c6\u0001J\u0013\u0010\u0014\u001a\u00020\u00072\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010\u0016\u001a\u00020\u0017H\u00d6\u0001J\t\u0010\u0018\u001a\u00020\u0019H\u00d6\u0001R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000f\u00a8\u0006\u001a"
    }
    d2 = {
        "Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;",
        "",
        "levels",
        "Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;",
        "durationHms",
        "Ljava/time/LocalTime;",
        "alarmRequested",
        "",
        "<init>",
        "(Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;Ljava/time/LocalTime;Z)V",
        "getLevels",
        "()Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;",
        "getDurationHms",
        "()Ljava/time/LocalTime;",
        "getAlarmRequested",
        "()Z",
        "component1",
        "component2",
        "component3",
        "copy",
        "equals",
        "other",
        "hashCode",
        "",
        "toString",
        "",
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

.field private final durationHms:Ljava/time/LocalTime;

.field private final levels:Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;


# direct methods
.method public constructor <init>(Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;Ljava/time/LocalTime;Z)V
    .locals 1
    .param p2    # Ljava/time/LocalTime;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "duration"
        .end annotation
    .end param

    const-string v0, "levels"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "durationHms"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->levels:Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;

    iput-object p2, p0, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->durationHms:Ljava/time/LocalTime;

    iput-boolean p3, p0, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->alarmRequested:Z

    return-void
.end method

.method public static synthetic copy$default(Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;Ljava/time/LocalTime;ZILjava/lang/Object;)Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;
    .locals 0

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_0

    iget-object p1, p0, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->levels:Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;

    :cond_0
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_1

    iget-object p2, p0, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->durationHms:Ljava/time/LocalTime;

    :cond_1
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_2

    iget-boolean p3, p0, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->alarmRequested:Z

    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->copy(Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;Ljava/time/LocalTime;Z)Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->levels:Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;

    return-object p0
.end method

.method public final component2()Ljava/time/LocalTime;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->durationHms:Ljava/time/LocalTime;

    return-object p0
.end method

.method public final component3()Z
    .locals 0

    iget-boolean p0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->alarmRequested:Z

    return p0
.end method

.method public final copy(Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;Ljava/time/LocalTime;Z)Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;
    .locals 0
    .param p2    # Ljava/time/LocalTime;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "duration"
        .end annotation
    .end param

    const-string p0, "levels"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "durationHms"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p0, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;

    invoke-direct {p0, p1, p2, p3}, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;-><init>(Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;Ljava/time/LocalTime;Z)V

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;

    iget-object v1, p0, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->levels:Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;

    iget-object v3, p1, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->levels:Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->durationHms:Ljava/time/LocalTime;

    iget-object v3, p1, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->durationHms:Ljava/time/LocalTime;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    :cond_3
    iget-boolean p0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->alarmRequested:Z

    iget-boolean p1, p1, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->alarmRequested:Z

    if-eq p0, p1, :cond_4

    return v2

    :cond_4
    return v0
.end method

.method public final getAlarmRequested()Z
    .locals 0

    iget-boolean p0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->alarmRequested:Z

    return p0
.end method

.method public final getDurationHms()Ljava/time/LocalTime;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->durationHms:Ljava/time/LocalTime;

    return-object p0
.end method

.method public final getLevels()Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->levels:Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;

    return-object p0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->levels:Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;

    invoke-virtual {v0}, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->durationHms:Ljava/time/LocalTime;

    invoke-virtual {v1}, Ljava/time/LocalTime;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-boolean p0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->alarmRequested:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    iget-object v0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->levels:Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;

    iget-object v1, p0, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->durationHms:Ljava/time/LocalTime;

    iget-boolean p0, p0, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;->alarmRequested:Z

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "StartNapRequest(levels="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", durationHms="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", alarmRequested="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-static {v2, p0, v0}, Lj/m;->p(Ljava/lang/StringBuilder;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
