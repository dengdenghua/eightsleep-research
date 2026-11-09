.class public interface abstract Ldc/b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000P\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008f\u0018\u00002\u00020\u0001J*\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\u00070\u00062\u0008\u0008\u0001\u0010\u0003\u001a\u00020\u00022\u0008\u0008\u0001\u0010\u0005\u001a\u00020\u0004H\u00a7@\u00a2\u0006\u0004\u0008\u0008\u0010\tJ&\u0010\u000b\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00070\n0\u00062\u0008\u0008\u0001\u0010\u0003\u001a\u00020\u0002H\u00a7@\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ \u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u00070\u00062\u0008\u0008\u0001\u0010\r\u001a\u00020\u0002H\u00a7@\u00a2\u0006\u0004\u0008\u000e\u0010\u000cJ0\u0010\u0013\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00120\n0\u00062\u0008\u0008\u0001\u0010\u0010\u001a\u00020\u000f2\u0008\u0008\u0001\u0010\u0011\u001a\u00020\u0002H\u00a7@\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J*\u0010\u0016\u001a\u0008\u0012\u0004\u0012\u00020\u00150\u00062\u0008\u0008\u0001\u0010\u0003\u001a\u00020\u00022\u0008\u0008\u0001\u0010\r\u001a\u00020\u0002H\u00a7@\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J4\u0010\u0019\u001a\u0008\u0012\u0004\u0012\u00020\u00070\u00062\u0008\u0008\u0001\u0010\u0003\u001a\u00020\u00022\u0008\u0008\u0001\u0010\r\u001a\u00020\u00022\u0008\u0008\u0001\u0010\u0005\u001a\u00020\u0018H\u00a7@\u00a2\u0006\u0004\u0008\u0019\u0010\u001aJ*\u0010\u001e\u001a\u0008\u0012\u0004\u0012\u00020\u001d0\u00062\u0008\u0008\u0001\u0010\u001b\u001a\u00020\u00022\u0008\u0008\u0001\u0010\u001c\u001a\u00020\u0002H\u00a7@\u00a2\u0006\u0004\u0008\u001e\u0010\u0017\u00a8\u0006\u001f"
    }
    d2 = {
        "Ldc/b;",
        "",
        "",
        "userId",
        "Lcom/eightsleep/data_jetlag/data/model/CreateTripRequest;",
        "request",
        "LXq/S;",
        "Lcom/eightsleep/data_jetlag/data/model/TripResponse;",
        "c",
        "(Ljava/lang/String;Lcom/eightsleep/data_jetlag/data/model/CreateTripRequest;LLm/c;)Ljava/lang/Object;",
        "",
        "d",
        "(Ljava/lang/String;LLm/c;)Ljava/lang/Object;",
        "tripId",
        "g",
        "",
        "maxResults",
        "query",
        "Lcom/eightsleep/data_jetlag/data/model/LocationResultResponse;",
        "f",
        "(ILjava/lang/String;LLm/c;)Ljava/lang/Object;",
        "LHm/B;",
        "e",
        "(Ljava/lang/String;Ljava/lang/String;LLm/c;)Ljava/lang/Object;",
        "Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;",
        "a",
        "(Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;LLm/c;)Ljava/lang/Object;",
        "flightNumber",
        "departureDate",
        "Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;",
        "b",
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


# virtual methods
.method public abstract a(Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;LLm/c;)Ljava/lang/Object;
    .param p1    # Ljava/lang/String;
        .annotation runtime LZq/s;
            value = "userId"
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime LZq/s;
            value = "tripId"
        .end annotation
    .end param
    .param p3    # Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;
        .annotation runtime LZq/a;
        .end annotation
    .end param
    .annotation runtime LZq/p;
        value = "v1/users/{userId}/travel/trips/{tripId}"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;",
            "LLm/c<",
            "-",
            "LXq/S<",
            "Lcom/eightsleep/data_jetlag/data/model/TripResponse;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method

.method public abstract b(Ljava/lang/String;Ljava/lang/String;LLm/c;)Ljava/lang/Object;
    .param p1    # Ljava/lang/String;
        .annotation runtime LZq/t;
            value = "flightNumber"
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime LZq/t;
            value = "date"
        .end annotation
    .end param
    .annotation runtime LZq/f;
        value = "v1/travel/flight-status"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "LLm/c<",
            "-",
            "LXq/S<",
            "Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method

.method public abstract c(Ljava/lang/String;Lcom/eightsleep/data_jetlag/data/model/CreateTripRequest;LLm/c;)Ljava/lang/Object;
    .param p1    # Ljava/lang/String;
        .annotation runtime LZq/s;
            value = "USER_ID"
        .end annotation
    .end param
    .param p2    # Lcom/eightsleep/data_jetlag/data/model/CreateTripRequest;
        .annotation runtime LZq/a;
        .end annotation
    .end param
    .annotation runtime LZq/o;
        value = "v1/users/{USER_ID}/travel/trips"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/eightsleep/data_jetlag/data/model/CreateTripRequest;",
            "LLm/c<",
            "-",
            "LXq/S<",
            "Lcom/eightsleep/data_jetlag/data/model/TripResponse;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method

.method public abstract d(Ljava/lang/String;LLm/c;)Ljava/lang/Object;
    .param p1    # Ljava/lang/String;
        .annotation runtime LZq/s;
            value = "USER_ID"
        .end annotation
    .end param
    .annotation runtime LZq/f;
        value = "v1/users/{USER_ID}/travel/trips"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "LLm/c<",
            "-",
            "LXq/S<",
            "Ljava/util/List<",
            "Lcom/eightsleep/data_jetlag/data/model/TripResponse;",
            ">;>;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method

.method public abstract e(Ljava/lang/String;Ljava/lang/String;LLm/c;)Ljava/lang/Object;
    .param p1    # Ljava/lang/String;
        .annotation runtime LZq/s;
            value = "USER_ID"
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime LZq/s;
            value = "TRIP_ID"
        .end annotation
    .end param
    .annotation runtime LZq/b;
        value = "v1/users/{USER_ID}/travel/trips/{TRIP_ID}"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "LLm/c<",
            "-",
            "LXq/S<",
            "LHm/B;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method

.method public abstract f(ILjava/lang/String;LLm/c;)Ljava/lang/Object;
    .param p1    # I
        .annotation runtime LZq/t;
            value = "maxResults"
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime LZq/t;
            value = "query"
        .end annotation
    .end param
    .annotation runtime LZq/f;
        value = "v1/travel/airport-search"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "LLm/c<",
            "-",
            "LXq/S<",
            "Ljava/util/List<",
            "Lcom/eightsleep/data_jetlag/data/model/LocationResultResponse;",
            ">;>;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method

.method public abstract g(Ljava/lang/String;LLm/c;)Ljava/lang/Object;
    .param p1    # Ljava/lang/String;
        .annotation runtime LZq/a;
        .end annotation
    .end param
    .annotation runtime LZq/f;
        value = "v1/users/{USER_ID}/travel/trips/{TRIP_ID}"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "LLm/c<",
            "-",
            "LXq/S<",
            "Lcom/eightsleep/data_jetlag/data/model/TripResponse;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method
