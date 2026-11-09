.class public interface abstract Ldc/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008f\u0018\u00002\u00020\u0001J4\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u00072\u0008\u0008\u0001\u0010\u0003\u001a\u00020\u00022\u0008\u0008\u0001\u0010\u0004\u001a\u00020\u00022\u0008\u0008\u0001\u0010\u0006\u001a\u00020\u0005H\u00a7@\u00a2\u0006\u0004\u0008\t\u0010\nJ0\u0010\u000c\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00080\u000b0\u00072\u0008\u0008\u0001\u0010\u0003\u001a\u00020\u00022\u0008\u0008\u0001\u0010\u0004\u001a\u00020\u0002H\u00a7@\u00a2\u0006\u0004\u0008\u000c\u0010\rJ4\u0010\u0011\u001a\u0008\u0012\u0004\u0012\u00020\u00100\u00072\u0008\u0008\u0001\u0010\u0003\u001a\u00020\u00022\u0008\u0008\u0001\u0010\u000e\u001a\u00020\u00022\u0008\u0008\u0001\u0010\u000f\u001a\u00020\u0002H\u00a7@\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J4\u0010\u0014\u001a\u0008\u0012\u0004\u0012\u00020\u00100\u00072\u0008\u0008\u0001\u0010\u0003\u001a\u00020\u00022\u0008\u0008\u0001\u0010\u000e\u001a\u00020\u00022\u0008\u0008\u0001\u0010\u0006\u001a\u00020\u0013H\u00a7@\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J4\u0010\u0016\u001a\u0008\u0012\u0004\u0012\u00020\u00100\u00072\u0008\u0008\u0001\u0010\u0003\u001a\u00020\u00022\u0008\u0008\u0001\u0010\u000e\u001a\u00020\u00022\u0008\u0008\u0001\u0010\u000f\u001a\u00020\u0002H\u00a7@\u00a2\u0006\u0004\u0008\u0016\u0010\u0012\u00a8\u0006\u0017"
    }
    d2 = {
        "Ldc/a;",
        "",
        "",
        "userId",
        "tripId",
        "Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;",
        "request",
        "LXq/S;",
        "Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;",
        "a",
        "(Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;LLm/c;)Ljava/lang/Object;",
        "",
        "d",
        "(Ljava/lang/String;Ljava/lang/String;LLm/c;)Ljava/lang/Object;",
        "planId",
        "taskId",
        "LHm/B;",
        "e",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;LLm/c;)Ljava/lang/Object;",
        "Lcom/eightsleep/data_jetlag/data/model/JetLagBulkTaskUpdateRequest;",
        "b",
        "(Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/data/model/JetLagBulkTaskUpdateRequest;LLm/c;)Ljava/lang/Object;",
        "c",
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
.method public abstract a(Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;LLm/c;)Ljava/lang/Object;
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
    .param p3    # Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;
        .annotation runtime LZq/a;
        .end annotation
    .end param
    .annotation runtime LZq/o;
        value = "v1/users/{USER_ID}/travel/trips/{TRIP_ID}/plans"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;",
            "LLm/c<",
            "-",
            "LXq/S<",
            "Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method

.method public abstract b(Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/data/model/JetLagBulkTaskUpdateRequest;LLm/c;)Ljava/lang/Object;
    .param p1    # Ljava/lang/String;
        .annotation runtime LZq/s;
            value = "USER_ID"
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime LZq/s;
            value = "PLAN_ID"
        .end annotation
    .end param
    .param p3    # Lcom/eightsleep/data_jetlag/data/model/JetLagBulkTaskUpdateRequest;
        .annotation runtime LZq/a;
        .end annotation
    .end param
    .annotation runtime LZq/n;
        value = "v1/users/{USER_ID}/travel/plans/{PLAN_ID}/tasks"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/eightsleep/data_jetlag/data/model/JetLagBulkTaskUpdateRequest;",
            "LLm/c<",
            "-",
            "LXq/S<",
            "LHm/B;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method

.method public abstract c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;LLm/c;)Ljava/lang/Object;
    .param p1    # Ljava/lang/String;
        .annotation runtime LZq/s;
            value = "USER_ID"
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime LZq/s;
            value = "PLAN_ID"
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime LZq/s;
            value = "TASK_ID"
        .end annotation
    .end param
    .annotation runtime LZq/p;
        value = "v1/users/{USER_ID}/travel/tasks/{PLAN_ID}/{TASK_ID}/reset"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
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

.method public abstract d(Ljava/lang/String;Ljava/lang/String;LLm/c;)Ljava/lang/Object;
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
    .annotation runtime LZq/f;
        value = "v1/users/{USER_ID}/travel/trips/{TRIP_ID}/plans"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "LLm/c<",
            "-",
            "LXq/S<",
            "Ljava/util/List<",
            "Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;",
            ">;>;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method

.method public abstract e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;LLm/c;)Ljava/lang/Object;
    .param p1    # Ljava/lang/String;
        .annotation runtime LZq/s;
            value = "USER_ID"
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime LZq/s;
            value = "PLAN_ID"
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime LZq/s;
            value = "TASK_ID"
        .end annotation
    .end param
    .annotation runtime LHm/c;
    .end annotation

    .annotation runtime LZq/p;
        value = "v1/users/{USER_ID}/travel/tasks/{PLAN_ID}/{TASK_ID}/complete"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
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
