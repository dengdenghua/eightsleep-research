.class public final Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lcom/squareup/moshi/JsonClass;
    generateAdapter = true
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0010\n\u0002\u0010\u000e\n\u0000\u0008\u0087\u0008\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\n\u0010\u0006\u001a\u00060\u0007j\u0002`\u0008\u00a2\u0006\u0004\u0008\t\u0010\nJ\t\u0010\u0011\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0012\u001a\u00020\u0005H\u00c6\u0003J\r\u0010\u0013\u001a\u00060\u0007j\u0002`\u0008H\u00c6\u0003J+\u0010\u0014\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u000c\u0008\u0002\u0010\u0006\u001a\u00060\u0007j\u0002`\u0008H\u00c6\u0001J\u0013\u0010\u0015\u001a\u00020\u00032\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010\u0017\u001a\u00020\u0007H\u00d6\u0001J\t\u0010\u0018\u001a\u00020\u0019H\u00d6\u0001R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000cR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000eR\u0015\u0010\u0006\u001a\u00060\u0007j\u0002`\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010\u00a8\u0006\u001a"
    }
    d2 = {
        "Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;",
        "",
        "enabled",
        "",
        "hotFlashDuration",
        "Ljava/time/LocalTime;",
        "levelDelta",
        "",
        "Lcom/eightsleep/data_core/domain/model/ServerTemp;",
        "<init>",
        "(ZLjava/time/LocalTime;I)V",
        "getEnabled",
        "()Z",
        "getHotFlashDuration",
        "()Ljava/time/LocalTime;",
        "getLevelDelta",
        "()I",
        "component1",
        "component2",
        "component3",
        "copy",
        "equals",
        "other",
        "hashCode",
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
.field private final enabled:Z

.field private final hotFlashDuration:Ljava/time/LocalTime;

.field private final levelDelta:I


# direct methods
.method public constructor <init>(ZLjava/time/LocalTime;I)V
    .locals 1

    const-string v0, "hotFlashDuration"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->enabled:Z

    iput-object p2, p0, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->hotFlashDuration:Ljava/time/LocalTime;

    iput p3, p0, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->levelDelta:I

    return-void
.end method

.method public static synthetic copy$default(Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;ZLjava/time/LocalTime;IILjava/lang/Object;)Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;
    .locals 0

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_0

    iget-boolean p1, p0, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->enabled:Z

    :cond_0
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_1

    iget-object p2, p0, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->hotFlashDuration:Ljava/time/LocalTime;

    :cond_1
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_2

    iget p3, p0, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->levelDelta:I

    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->copy(ZLjava/time/LocalTime;I)Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Z
    .locals 0

    iget-boolean p0, p0, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->enabled:Z

    return p0
.end method

.method public final component2()Ljava/time/LocalTime;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->hotFlashDuration:Ljava/time/LocalTime;

    return-object p0
.end method

.method public final component3()I
    .locals 0

    iget p0, p0, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->levelDelta:I

    return p0
.end method

.method public final copy(ZLjava/time/LocalTime;I)Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;
    .locals 0

    const-string p0, "hotFlashDuration"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p0, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;

    invoke-direct {p0, p1, p2, p3}, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;-><init>(ZLjava/time/LocalTime;I)V

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;

    iget-boolean v1, p0, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->enabled:Z

    iget-boolean v3, p1, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->enabled:Z

    if-eq v1, v3, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->hotFlashDuration:Ljava/time/LocalTime;

    iget-object v3, p1, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->hotFlashDuration:Ljava/time/LocalTime;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    :cond_3
    iget p0, p0, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->levelDelta:I

    iget p1, p1, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->levelDelta:I

    if-eq p0, p1, :cond_4

    return v2

    :cond_4
    return v0
.end method

.method public final getEnabled()Z
    .locals 0

    iget-boolean p0, p0, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->enabled:Z

    return p0
.end method

.method public final getHotFlashDuration()Ljava/time/LocalTime;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->hotFlashDuration:Ljava/time/LocalTime;

    return-object p0
.end method

.method public final getLevelDelta()I
    .locals 0

    iget p0, p0, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->levelDelta:I

    return p0
.end method

.method public hashCode()I
    .locals 2

    iget-boolean v0, p0, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->enabled:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->hotFlashDuration:Ljava/time/LocalTime;

    invoke-virtual {v1}, Ljava/time/LocalTime;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget p0, p0, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->levelDelta:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    iget-boolean v0, p0, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->enabled:Z

    iget-object v1, p0, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->hotFlashDuration:Ljava/time/LocalTime;

    iget p0, p0, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;->levelDelta:I

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "HotFlashModeSettingsRequestSettings(enabled="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, ", hotFlashDuration="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", levelDelta="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-static {p0, v0, v2}, LB/h;->i(ILjava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
