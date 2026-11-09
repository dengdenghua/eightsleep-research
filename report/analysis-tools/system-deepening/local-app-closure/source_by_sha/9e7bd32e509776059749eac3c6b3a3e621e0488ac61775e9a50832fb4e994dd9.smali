.class public final Lcom/eightsleep/presentation_metrics/enums/HealthScoreTrendSelector$HRV;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/eightsleep/presentation_metrics/enums/HealthScoreTrendSelector;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/eightsleep/presentation_metrics/enums/HealthScoreTrendSelector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "HRV"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\u0008\u00c7\n\u0018\u00002\u00020\u0001B\t\u0008\u0003\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001c\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004H\u0096\u0002\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0010\u0010\n\u001a\u00020\tH\u00d7\u0001\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0010\u0010\r\u001a\u00020\u000cH\u00d7\u0001\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u001a\u0010\u0012\u001a\u00020\u00112\u0008\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u00d7\u0003\u00a2\u0006\u0004\u0008\u0012\u0010\u0013\u00a8\u0006\u0014"
    }
    d2 = {
        "Lcom/eightsleep/presentation_metrics/enums/HealthScoreTrendSelector$HRV;",
        "Lcom/eightsleep/presentation_metrics/enums/HealthScoreTrendSelector;",
        "<init>",
        "()V",
        "Lrc/m;",
        "healthScore",
        "Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;",
        "invoke",
        "(Lrc/m;)Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;",
        "",
        "toString",
        "()Ljava/lang/String;",
        "",
        "hashCode",
        "()I",
        "",
        "other",
        "",
        "equals",
        "(Ljava/lang/Object;)Z",
        "presentation-metrics_tencentRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final $stable:I

.field public static final INSTANCE:Lcom/eightsleep/presentation_metrics/enums/HealthScoreTrendSelector$HRV;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/eightsleep/presentation_metrics/enums/HealthScoreTrendSelector$HRV;

    invoke-direct {v0}, Lcom/eightsleep/presentation_metrics/enums/HealthScoreTrendSelector$HRV;-><init>()V

    sput-object v0, Lcom/eightsleep/presentation_metrics/enums/HealthScoreTrendSelector$HRV;->INSTANCE:Lcom/eightsleep/presentation_metrics/enums/HealthScoreTrendSelector$HRV;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of p0, p1, Lcom/eightsleep/presentation_metrics/enums/HealthScoreTrendSelector$HRV;

    if-nez p0, :cond_1

    const/4 p0, 0x0

    return p0

    :cond_1
    return v0
.end method

.method public hashCode()I
    .locals 0

    const p0, 0x614258d7

    return p0
.end method

.method public invoke(Lrc/m;)Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;
    .locals 0

    if-eqz p1, :cond_0

    iget-object p0, p1, Lrc/m;->d:Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;->getHrv()Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    const-string p0, "HRV"

    return-object p0
.end method
