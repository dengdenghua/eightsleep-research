.class public final Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lcom/squareup/moshi/JsonClass;
    generateAdapter = true
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\r\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\u0008\u0087\u0008\u0018\u00002\u00020\u0001B1\u0012\n\u0008\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0010\u0008\u0002\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\u0008\u0018\u00010\u0007\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0003H\u00c6\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0005H\u00c6\u0003J\u0011\u0010\u0013\u001a\n\u0012\u0004\u0012\u00020\u0008\u0018\u00010\u0007H\u00c6\u0003J3\u0010\u0014\u001a\u00020\u00002\n\u0008\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0010\u0008\u0002\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\u0008\u0018\u00010\u0007H\u00c6\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010\u0018\u001a\u00020\u0019H\u00d6\u0001J\t\u0010\u001a\u001a\u00020\u0005H\u00d6\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000cR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000eR\u0019\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\u0008\u0018\u00010\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010\u00a8\u0006\u001b"
    }
    d2 = {
        "Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;",
        "",
        "status",
        "Lcom/eightsleep/data_jetlag/enums/TripStatus;",
        "name",
        "",
        "legs",
        "",
        "Lcom/eightsleep/data_jetlag/data/model/TripLegRequest;",
        "<init>",
        "(Lcom/eightsleep/data_jetlag/enums/TripStatus;Ljava/lang/String;Ljava/util/List;)V",
        "getStatus",
        "()Lcom/eightsleep/data_jetlag/enums/TripStatus;",
        "getName",
        "()Ljava/lang/String;",
        "getLegs",
        "()Ljava/util/List;",
        "component1",
        "component2",
        "component3",
        "copy",
        "equals",
        "",
        "other",
        "hashCode",
        "",
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
.field private final legs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/eightsleep/data_jetlag/data/model/TripLegRequest;",
            ">;"
        }
    .end annotation
.end field

.field private final name:Ljava/lang/String;

.field private final status:Lcom/eightsleep/data_jetlag/enums/TripStatus;


# direct methods
.method public constructor <init>()V
    .locals 6

    .line 1
    const/4 v4, 0x7

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;-><init>(Lcom/eightsleep/data_jetlag/enums/TripStatus;Ljava/lang/String;Ljava/util/List;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Lcom/eightsleep/data_jetlag/enums/TripStatus;Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/eightsleep/data_jetlag/enums/TripStatus;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/eightsleep/data_jetlag/data/model/TripLegRequest;",
            ">;)V"
        }
    .end annotation

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->status:Lcom/eightsleep/data_jetlag/enums/TripStatus;

    .line 4
    iput-object p2, p0, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->name:Ljava/lang/String;

    .line 5
    iput-object p3, p0, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->legs:Ljava/util/List;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/eightsleep/data_jetlag/enums/TripStatus;Ljava/lang/String;Ljava/util/List;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 1

    and-int/lit8 p5, p4, 0x1

    const/4 v0, 0x0

    if-eqz p5, :cond_0

    move-object p1, v0

    :cond_0
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_1

    move-object p2, v0

    :cond_1
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_2

    move-object p3, v0

    .line 6
    :cond_2
    invoke-direct {p0, p1, p2, p3}, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;-><init>(Lcom/eightsleep/data_jetlag/enums/TripStatus;Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic copy$default(Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;Lcom/eightsleep/data_jetlag/enums/TripStatus;Ljava/lang/String;Ljava/util/List;ILjava/lang/Object;)Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;
    .locals 0

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_0

    iget-object p1, p0, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->status:Lcom/eightsleep/data_jetlag/enums/TripStatus;

    :cond_0
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_1

    iget-object p2, p0, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->name:Ljava/lang/String;

    :cond_1
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_2

    iget-object p3, p0, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->legs:Ljava/util/List;

    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->copy(Lcom/eightsleep/data_jetlag/enums/TripStatus;Ljava/lang/String;Ljava/util/List;)Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Lcom/eightsleep/data_jetlag/enums/TripStatus;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->status:Lcom/eightsleep/data_jetlag/enums/TripStatus;

    return-object p0
.end method

.method public final component2()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->name:Ljava/lang/String;

    return-object p0
.end method

.method public final component3()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/eightsleep/data_jetlag/data/model/TripLegRequest;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->legs:Ljava/util/List;

    return-object p0
.end method

.method public final copy(Lcom/eightsleep/data_jetlag/enums/TripStatus;Ljava/lang/String;Ljava/util/List;)Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/eightsleep/data_jetlag/enums/TripStatus;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/eightsleep/data_jetlag/data/model/TripLegRequest;",
            ">;)",
            "Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;"
        }
    .end annotation

    new-instance p0, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;

    invoke-direct {p0, p1, p2, p3}, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;-><init>(Lcom/eightsleep/data_jetlag/enums/TripStatus;Ljava/lang/String;Ljava/util/List;)V

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;

    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->status:Lcom/eightsleep/data_jetlag/enums/TripStatus;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->status:Lcom/eightsleep/data_jetlag/enums/TripStatus;

    if-eq v1, v3, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->name:Ljava/lang/String;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->name:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    :cond_3
    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->legs:Ljava/util/List;

    iget-object p1, p1, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->legs:Ljava/util/List;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4

    return v2

    :cond_4
    return v0
.end method

.method public final getLegs()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/eightsleep/data_jetlag/data/model/TripLegRequest;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->legs:Ljava/util/List;

    return-object p0
.end method

.method public final getName()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->name:Ljava/lang/String;

    return-object p0
.end method

.method public final getStatus()Lcom/eightsleep/data_jetlag/enums/TripStatus;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->status:Lcom/eightsleep/data_jetlag/enums/TripStatus;

    return-object p0
.end method

.method public hashCode()I
    .locals 3

    iget-object v0, p0, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->status:Lcom/eightsleep/data_jetlag/enums/TripStatus;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_0
    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->name:Ljava/lang/String;

    if-nez v2, :cond_1

    move v2, v1

    goto :goto_1

    :cond_1
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->legs:Ljava/util/List;

    if-nez p0, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_2
    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    iget-object v0, p0, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->status:Lcom/eightsleep/data_jetlag/enums/TripStatus;

    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->name:Ljava/lang/String;

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;->legs:Ljava/util/List;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "UpdateTripRequest(status="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", name="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", legs="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-static {v2, p0, v0}, LB/h;->p(Ljava/lang/StringBuilder;Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
