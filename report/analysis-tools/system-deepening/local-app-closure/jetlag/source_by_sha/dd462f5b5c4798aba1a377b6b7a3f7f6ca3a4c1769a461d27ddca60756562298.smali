.class public final Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lcom/squareup/moshi/JsonClass;
    generateAdapter = true
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0005\u0008\u0087\u0008\u0018\u00002\u00020\u0001B\u0017\u0012\u000e\u0008\u0001\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00030\u0002\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\r\u0010\u0008\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0016\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\u00030\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008\n\u0010\u000bJ \u0010\u000c\u001a\u00020\u00002\u000e\u0008\u0003\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00030\u0002H\u00c6\u0001\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0010\u0010\u000f\u001a\u00020\u000eH\u00d6\u0001\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0010\u0010\u0012\u001a\u00020\u0011H\u00d6\u0001\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u001a\u0010\u0016\u001a\u00020\u00152\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003\u00a2\u0006\u0004\u0008\u0016\u0010\u0017R\u001d\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00030\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0004\u0010\u0018\u001a\u0004\u0008\u0019\u0010\u000b\u00a8\u0006\u001a"
    }
    d2 = {
        "Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;",
        "",
        "",
        "Lcom/eightsleep/data_jetlag/data/model/FlightResponse;",
        "flights",
        "<init>",
        "(Ljava/util/List;)V",
        "Lgc/i;",
        "toDomain",
        "()Lgc/i;",
        "component1",
        "()Ljava/util/List;",
        "copy",
        "(Ljava/util/List;)Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;",
        "",
        "toString",
        "()Ljava/lang/String;",
        "",
        "hashCode",
        "()I",
        "other",
        "",
        "equals",
        "(Ljava/lang/Object;)Z",
        "Ljava/util/List;",
        "getFlights",
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
.field private final flights:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/eightsleep/data_jetlag/data/model/FlightResponse;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "legs"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/eightsleep/data_jetlag/data/model/FlightResponse;",
            ">;)V"
        }
    .end annotation

    const-string v0, "flights"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;->flights:Ljava/util/List;

    return-void
.end method

.method public static synthetic copy$default(Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;Ljava/util/List;ILjava/lang/Object;)Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;
    .locals 0

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    iget-object p1, p0, Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;->flights:Ljava/util/List;

    :cond_0
    invoke-virtual {p0, p1}, Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;->copy(Ljava/util/List;)Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/eightsleep/data_jetlag/data/model/FlightResponse;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;->flights:Ljava/util/List;

    return-object p0
.end method

.method public final copy(Ljava/util/List;)Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "legs"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/eightsleep/data_jetlag/data/model/FlightResponse;",
            ">;)",
            "Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;"
        }
    .end annotation

    const-string p0, "flights"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p0, Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;

    invoke-direct {p0, p1}, Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;-><init>(Ljava/util/List;)V

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;->flights:Ljava/util/List;

    iget-object p1, p1, Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;->flights:Ljava/util/List;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    return v2

    :cond_2
    return v0
.end method

.method public final getFlights()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/eightsleep/data_jetlag/data/model/FlightResponse;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;->flights:Ljava/util/List;

    return-object p0
.end method

.method public hashCode()I
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;->flights:Ljava/util/List;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0
.end method

.method public final toDomain()Lgc/i;
    .locals 2

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;->flights:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p0, v1}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;

    invoke-virtual {v1}, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->toDomain()Lgc/h;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    new-instance p0, Lgc/i;

    invoke-direct {p0, v0}, Lgc/i;-><init>(Ljava/util/ArrayList;)V

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;->flights:Ljava/util/List;

    const-string v0, "FlightSearchResponse(flights="

    const-string v1, ")"

    invoke-static {v0, v1, p0}, LB/h;->n(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
