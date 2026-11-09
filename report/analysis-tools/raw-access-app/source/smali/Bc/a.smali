.class public interface abstract LBc/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008`\u0018\u00002\u00020\u0001J \u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u00042\u0008\u0008\u0001\u0010\u0003\u001a\u00020\u0002H\u00a7@\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J*\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\t0\u00042\u0008\u0008\u0001\u0010\u0003\u001a\u00020\u00022\u0008\u0008\u0001\u0010\u0008\u001a\u00020\u0002H\u00a7@\u00a2\u0006\u0004\u0008\n\u0010\u000bJ \u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\t0\u00042\u0008\u0008\u0001\u0010\u000c\u001a\u00020\u0002H\u00a7@\u00a2\u0006\u0004\u0008\r\u0010\u0007J,\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\t0\u00042\u0008\u0008\u0001\u0010\u000c\u001a\u00020\u00022\n\u0008\u0001\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u00a7@\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J,\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00020\t0\u00042\u0008\u0008\u0001\u0010\u000c\u001a\u00020\u00022\n\u0008\u0001\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u00a7@\u00a2\u0006\u0004\u0008\u0012\u0010\u0011J,\u0010\u0013\u001a\u0008\u0012\u0004\u0012\u00020\t0\u00042\u0008\u0008\u0001\u0010\u000c\u001a\u00020\u00022\n\u0008\u0001\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u00a7@\u00a2\u0006\u0004\u0008\u0013\u0010\u0011J \u0010\u0014\u001a\u0008\u0012\u0004\u0012\u00020\t0\u00042\u0008\u0008\u0001\u0010\u000c\u001a\u00020\u0002H\u00a7@\u00a2\u0006\u0004\u0008\u0014\u0010\u0007J \u0010\u0017\u001a\u0008\u0012\u0004\u0012\u00020\t0\u00042\u0008\u0008\u0001\u0010\u0016\u001a\u00020\u0015H\u00a7@\u00a2\u0006\u0004\u0008\u0017\u0010\u0018\u00a8\u0006\u0019"
    }
    d2 = {
        "LBc/a;",
        "",
        "",
        "userId",
        "LXq/S;",
        "Lcom/eightsleep/data_notifications/data/model/RemoteNotificationResponse;",
        "h",
        "(Ljava/lang/String;LLm/c;)Ljava/lang/Object;",
        "notificationId",
        "LHm/B;",
        "a",
        "(Ljava/lang/String;Ljava/lang/String;LLm/c;)Ljava/lang/Object;",
        "url",
        "b",
        "Lokhttp3/RequestBody;",
        "body",
        "c",
        "(Ljava/lang/String;Lokhttp3/RequestBody;LLm/c;)Ljava/lang/Object;",
        "f",
        "g",
        "d",
        "Lcom/eightsleep/data_notifications/data/model/NotificationAckRequest;",
        "request",
        "e",
        "(Lcom/eightsleep/data_notifications/data/model/NotificationAckRequest;LLm/c;)Ljava/lang/Object;",
        "data-notifications_tencentRelease"
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
.method public abstract a(Ljava/lang/String;Ljava/lang/String;LLm/c;)Ljava/lang/Object;
    .param p1    # Ljava/lang/String;
        .annotation runtime LZq/s;
            value = "USER_ID"
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime LZq/s;
            value = "NOTIFICATION_ID"
        .end annotation
    .end param
    .annotation runtime LZq/p;
        value = "v1/users/{USER_ID}/notifications/{NOTIFICATION_ID}/dismiss"
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

.method public abstract b(Ljava/lang/String;LLm/c;)Ljava/lang/Object;
    .param p1    # Ljava/lang/String;
        .annotation runtime LZq/y;
        .end annotation
    .end param
    .annotation runtime LZq/f;
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

.method public abstract c(Ljava/lang/String;Lokhttp3/RequestBody;LLm/c;)Ljava/lang/Object;
    .param p1    # Ljava/lang/String;
        .annotation runtime LZq/y;
        .end annotation
    .end param
    .param p2    # Lokhttp3/RequestBody;
        .annotation runtime LZq/a;
        .end annotation
    .end param
    .annotation runtime LZq/o;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lokhttp3/RequestBody;",
            "LLm/c<",
            "-",
            "LXq/S<",
            "LHm/B;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method

.method public abstract d(Ljava/lang/String;LLm/c;)Ljava/lang/Object;
    .param p1    # Ljava/lang/String;
        .annotation runtime LZq/y;
        .end annotation
    .end param
    .annotation runtime LZq/b;
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

.method public abstract e(Lcom/eightsleep/data_notifications/data/model/NotificationAckRequest;LLm/c;)Ljava/lang/Object;
    .param p1    # Lcom/eightsleep/data_notifications/data/model/NotificationAckRequest;
        .annotation runtime LZq/a;
        .end annotation
    .end param
    .annotation runtime LZq/o;
        value = "v1/push_event/acknowledge"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/eightsleep/data_notifications/data/model/NotificationAckRequest;",
            "LLm/c<",
            "-",
            "LXq/S<",
            "LHm/B;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method

.method public abstract f(Ljava/lang/String;Lokhttp3/RequestBody;LLm/c;)Ljava/lang/Object;
    .param p1    # Ljava/lang/String;
        .annotation runtime LZq/y;
        .end annotation
    .end param
    .param p2    # Lokhttp3/RequestBody;
        .annotation runtime LZq/a;
        .end annotation
    .end param
    .annotation runtime LZq/p;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lokhttp3/RequestBody;",
            "LLm/c<",
            "-",
            "LXq/S<",
            "LHm/B;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method

.method public abstract g(Ljava/lang/String;Lokhttp3/RequestBody;LLm/c;)Ljava/lang/Object;
    .param p1    # Ljava/lang/String;
        .annotation runtime LZq/y;
        .end annotation
    .end param
    .param p2    # Lokhttp3/RequestBody;
        .annotation runtime LZq/a;
        .end annotation
    .end param
    .annotation runtime LZq/n;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lokhttp3/RequestBody;",
            "LLm/c<",
            "-",
            "LXq/S<",
            "LHm/B;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method

.method public abstract h(Ljava/lang/String;LLm/c;)Ljava/lang/Object;
    .param p1    # Ljava/lang/String;
        .annotation runtime LZq/s;
            value = "USER_ID"
        .end annotation
    .end param
    .annotation runtime LZq/f;
        value = "v1/users/{USER_ID}/notifications?active=true"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "LLm/c<",
            "-",
            "LXq/S<",
            "Lcom/eightsleep/data_notifications/data/model/RemoteNotificationResponse;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method
