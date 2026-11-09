.class public interface abstract Lfd/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008`\u0018\u00002\u00020\u0001J \u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u00042\u0008\u0008\u0001\u0010\u0003\u001a\u00020\u0002H\u00a7@\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J*\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u00042\u0008\u0008\u0001\u0010\u0003\u001a\u00020\u00022\u0008\u0008\u0001\u0010\t\u001a\u00020\u0008H\u00a7@\u00a2\u0006\u0004\u0008\n\u0010\u000bJ \u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u00042\u0008\u0008\u0001\u0010\u0003\u001a\u00020\u0002H\u00a7@\u00a2\u0006\u0004\u0008\r\u0010\u0007J*\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u00042\u0008\u0008\u0001\u0010\u0003\u001a\u00020\u00022\u0008\u0008\u0001\u0010\u000f\u001a\u00020\u000eH\u00a7@\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J \u0010\u0013\u001a\u0008\u0012\u0004\u0012\u00020\u00120\u00042\u0008\u0008\u0001\u0010\u0003\u001a\u00020\u0002H\u00a7@\u00a2\u0006\u0004\u0008\u0013\u0010\u0007J*\u0010\u0015\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u00042\u0008\u0008\u0001\u0010\u0003\u001a\u00020\u00022\u0008\u0008\u0001\u0010\u000f\u001a\u00020\u0014H\u00a7@\u00a2\u0006\u0004\u0008\u0015\u0010\u0016\u00a8\u0006\u0017"
    }
    d2 = {
        "Lfd/a;",
        "",
        "",
        "userId",
        "LXq/S;",
        "Lcom/eightsleep/data_temperature/data/model/napmode/NapModeSettingsNetwork;",
        "e",
        "(Ljava/lang/String;LLm/c;)Ljava/lang/Object;",
        "Lcom/eightsleep/data_temperature/data/model/napmode/UpdateNapModeSettingsRequest;",
        "settings",
        "b",
        "(Ljava/lang/String;Lcom/eightsleep/data_temperature/data/model/napmode/UpdateNapModeSettingsRequest;LLm/c;)Ljava/lang/Object;",
        "Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;",
        "a",
        "Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;",
        "request",
        "c",
        "(Ljava/lang/String;Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;LLm/c;)Ljava/lang/Object;",
        "LHm/B;",
        "f",
        "Lcom/eightsleep/data_temperature/data/model/napmode/ExtendNapRequest;",
        "d",
        "(Ljava/lang/String;Lcom/eightsleep/data_temperature/data/model/napmode/ExtendNapRequest;LLm/c;)Ljava/lang/Object;",
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


# virtual methods
.method public abstract a(Ljava/lang/String;LLm/c;)Ljava/lang/Object;
    .param p1    # Ljava/lang/String;
        .annotation runtime LZq/s;
            value = "userId"
        .end annotation
    .end param
    .annotation runtime LZq/f;
        value = "v1/users/{userId}/temperature/nap-mode/status"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "LLm/c<",
            "-",
            "LXq/S<",
            "Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method

.method public abstract b(Ljava/lang/String;Lcom/eightsleep/data_temperature/data/model/napmode/UpdateNapModeSettingsRequest;LLm/c;)Ljava/lang/Object;
    .param p1    # Ljava/lang/String;
        .annotation runtime LZq/s;
            value = "userId"
        .end annotation
    .end param
    .param p2    # Lcom/eightsleep/data_temperature/data/model/napmode/UpdateNapModeSettingsRequest;
        .annotation runtime LZq/a;
        .end annotation
    .end param
    .annotation runtime LZq/p;
        value = "v1/users/{userId}/temperature/nap-mode"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/eightsleep/data_temperature/data/model/napmode/UpdateNapModeSettingsRequest;",
            "LLm/c<",
            "-",
            "LXq/S<",
            "Lcom/eightsleep/data_temperature/data/model/napmode/NapModeSettingsNetwork;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method

.method public abstract c(Ljava/lang/String;Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;LLm/c;)Ljava/lang/Object;
    .param p1    # Ljava/lang/String;
        .annotation runtime LZq/s;
            value = "userId"
        .end annotation
    .end param
    .param p2    # Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;
        .annotation runtime LZq/a;
        .end annotation
    .end param
    .annotation runtime LZq/o;
        value = "v1/users/{userId}/temperature/nap-mode/activate"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;",
            "LLm/c<",
            "-",
            "LXq/S<",
            "Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method

.method public abstract d(Ljava/lang/String;Lcom/eightsleep/data_temperature/data/model/napmode/ExtendNapRequest;LLm/c;)Ljava/lang/Object;
    .param p1    # Ljava/lang/String;
        .annotation runtime LZq/s;
            value = "userId"
        .end annotation
    .end param
    .param p2    # Lcom/eightsleep/data_temperature/data/model/napmode/ExtendNapRequest;
        .annotation runtime LZq/a;
        .end annotation
    .end param
    .annotation runtime LZq/o;
        value = "v1/users/{userId}/temperature/nap-mode/extend"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/eightsleep/data_temperature/data/model/napmode/ExtendNapRequest;",
            "LLm/c<",
            "-",
            "LXq/S<",
            "Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method

.method public abstract e(Ljava/lang/String;LLm/c;)Ljava/lang/Object;
    .param p1    # Ljava/lang/String;
        .annotation runtime LZq/s;
            value = "userId"
        .end annotation
    .end param
    .annotation runtime LZq/f;
        value = "v1/users/{userId}/temperature/nap-mode"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "LLm/c<",
            "-",
            "LXq/S<",
            "Lcom/eightsleep/data_temperature/data/model/napmode/NapModeSettingsNetwork;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method

.method public abstract f(Ljava/lang/String;LLm/c;)Ljava/lang/Object;
    .param p1    # Ljava/lang/String;
        .annotation runtime LZq/s;
            value = "userId"
        .end annotation
    .end param
    .annotation runtime LZq/p;
        value = "v1/users/{userId}/temperature/nap-mode/deactivate"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
