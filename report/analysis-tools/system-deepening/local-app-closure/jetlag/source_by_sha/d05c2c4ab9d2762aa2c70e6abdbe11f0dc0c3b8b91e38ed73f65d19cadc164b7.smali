.class public final Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LNa/b;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LNa/b;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0008\u0000\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0019\u0008\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J1\u0010\u0010\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u000f0\u000e0\r2\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J1\u0010\u0013\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u000f0\u000e0\r2\u0006\u0010\n\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u0012\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\u0013\u0010\u0011J)\u0010\u0014\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u000f0\u000e0\r2\u0006\u0010\n\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u0014\u0010\u0015JL\u0010\u001e\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u001d0\u000e0\r2\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u0016\u001a\u00020\u00082\u000c\u0010\u0019\u001a\u0008\u0012\u0004\u0012\u00020\u00180\u00172\u0006\u0010\u001a\u001a\u00020\u000b2\u0008\u0010\u001c\u001a\u0004\u0018\u00010\u001bH\u0086@\u00a2\u0006\u0004\u0008\u001e\u0010\u001fR\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004\u00a2\u0006\u000c\n\u0004\u0008 \u0010!\u001a\u0004\u0008\"\u0010#\u00a8\u0006$"
    }
    d2 = {
        "Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;",
        "LNa/b;",
        "Ldc/a;",
        "api",
        "Ljc/d;",
        "cache",
        "<init>",
        "(Ldc/a;Ljc/d;)V",
        "",
        "userId",
        "tripId",
        "",
        "includeSupplements",
        "Lzo/l;",
        "Lya/j;",
        "Lgc/j;",
        "createPlan",
        "(Ljava/lang/String;Ljava/lang/String;Z)Lzo/l;",
        "forceRefresh",
        "getPlan",
        "observePlan",
        "(Ljava/lang/String;Ljava/lang/String;)Lzo/l;",
        "planId",
        "",
        "Lgc/f;",
        "tasks",
        "isComplete",
        "",
        "supplementCount",
        "LHm/B;",
        "updateTasks",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;ZLjava/lang/Integer;LLm/c;)Ljava/lang/Object;",
        "a",
        "Ldc/a;",
        "getApi",
        "()Ldc/a;",
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
.field public final a:Ldc/a;

.field public final b:Ljc/d;


# direct methods
.method public constructor <init>(Ldc/a;Ljc/d;)V
    .locals 1

    const-string v0, "api"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "cache"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;->a:Ldc/a;

    iput-object p2, p0, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;->b:Ljc/d;

    return-void
.end method

.method public static final synthetic access$getCache$p(Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;)Ljc/d;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;->b:Ljc/d;

    return-object p0
.end method


# virtual methods
.method public call(Ldc/a;ZLKa/c;LVm/n;)Lzo/l;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ldc/a;",
            "Z",
            "LKa/c;",
            "LVm/n;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p2, p3, p4}, LP2/b;->s(LNa/b;ZLKa/c;LVm/n;)Lzo/x;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic call(Ljava/lang/Object;ZLKa/c;LVm/n;)Lzo/l;
    .locals 0

    .line 2
    check-cast p1, Ldc/a;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;->call(Ldc/a;ZLKa/c;LVm/n;)Lzo/l;

    move-result-object p0

    return-object p0
.end method

.method public final createPlan(Ljava/lang/String;Ljava/lang/String;Z)Lzo/l;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "tripId"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;->getApi()Ldc/a;

    move-result-object v0

    new-instance v1, Lec/a;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, p3, v2}, Lec/a;-><init>(Ljava/lang/String;Ljava/lang/String;ZLLm/c;)V

    const/4 p3, 0x3

    invoke-static {p0, v0, v2, v1, p3}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object v0

    new-instance v1, Lec/b;

    invoke-direct {v1, v2, p0, p1, p2}, Lec/b;-><init>(LLm/c;Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, v2, v1, p3}, LP2/q;->t(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object p0

    return-object p0
.end method

.method public getApi()Ldc/a;
    .locals 0

    .line 2
    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;->a:Ldc/a;

    return-object p0
.end method

.method public bridge synthetic getApi()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;->getApi()Ldc/a;

    move-result-object p0

    return-object p0
.end method

.method public final getPlan(Ljava/lang/String;Ljava/lang/String;Z)Lzo/l;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "tripId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "userId"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    if-nez p3, :cond_0

    iget-object p3, p0, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;->b:Ljc/d;

    sget-object v1, Lwo/M;->a:LEo/f;

    sget-object v1, LEo/e;->b:LEo/e;

    new-instance v2, Ljc/b;

    invoke-direct {v2, p3, p1, v0}, Ljc/b;-><init>(Ljc/d;Ljava/lang/String;LLm/c;)V

    invoke-static {v1, v2}, Lwo/C;->F(LLm/h;LVm/n;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lgc/j;

    if-eqz p3, :cond_0

    new-instance p0, Lya/g;

    invoke-direct {p0, p3}, Lya/g;-><init>(Ljava/lang/Object;)V

    new-instance p1, LJ8/e;

    const/16 p2, 0x9

    invoke-direct {p1, p0, p2}, LJ8/e;-><init>(Ljava/lang/Object;I)V

    return-object p1

    :cond_0
    invoke-virtual {p0}, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;->getApi()Ldc/a;

    move-result-object p3

    new-instance v1, Lec/d;

    invoke-direct {v1, p2, p1, v0}, Lec/d;-><init>(Ljava/lang/String;Ljava/lang/String;LLm/c;)V

    const/4 v2, 0x3

    invoke-static {p0, p3, v0, v1, v2}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object v4

    new-instance v3, LYd/n;

    const/4 v8, 0x2

    move-object v5, p0

    move-object v7, p1

    move-object v6, p2

    invoke-direct/range {v3 .. v8}, LYd/n;-><init>(Lzo/l;LNa/b;Ljava/lang/Object;Ljava/lang/Object;I)V

    return-object v3
.end method

.method public final observePlan(Ljava/lang/String;Ljava/lang/String;)Lzo/l;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "tripId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "userId"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;->b:Ljc/d;

    invoke-virtual {v0, p1}, Ljc/d;->d(Ljava/lang/String;)Lzo/l;

    move-result-object v0

    new-instance v1, LHb/h;

    const/4 v2, 0x0

    invoke-direct {v1, v2, p0, p1, p2}, LHb/h;-><init>(LLm/c;Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lzo/s;->G(Lzo/l;LVm/o;)LAo/n;

    move-result-object p0

    return-object p0
.end method

.method public final updateTasks(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;ZLjava/lang/Integer;LLm/c;)Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lgc/f;",
            ">;Z",
            "Ljava/lang/Integer;",
            "LLm/c<",
            "-",
            "Lzo/l;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    instance-of v0, p6, Lec/f;

    if-eqz v0, :cond_0

    move-object v0, p6

    check-cast v0, Lec/f;

    iget v1, v0, Lec/f;->j:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lec/f;->j:I

    goto :goto_0

    :cond_0
    new-instance v0, Lec/f;

    invoke-direct {v0, p0, p6}, Lec/f;-><init>(Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;LLm/c;)V

    :goto_0
    iget-object p6, v0, Lec/f;->h:Ljava/lang/Object;

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, v0, Lec/f;->j:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    if-ne v2, v3, :cond_1

    iget-object p0, v0, Lec/f;->g:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    iget-object p1, v0, Lec/f;->f:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    iget-object p5, v0, Lec/f;->e:Ljava/lang/Integer;

    iget-object p3, v0, Lec/f;->d:Ljava/util/List;

    iget-object p2, v0, Lec/f;->c:Ljava/lang/String;

    iget-object p4, v0, Lec/f;->b:Ljava/lang/String;

    iget-object v0, v0, Lec/f;->a:Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;

    invoke-static {p6}, LX4/x;->M(Ljava/lang/Object;)V

    move-object v6, p0

    move-object p6, p1

    move-object p1, p4

    move-object v4, v0

    :goto_1
    move-object v5, p3

    goto :goto_4

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    invoke-static {p6}, LX4/x;->M(Ljava/lang/Object;)V

    if-eqz p4, :cond_3

    sget-object p6, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;->COMPLETE:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    goto :goto_2

    :cond_3
    sget-object p6, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;->PENDING:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    :goto_2
    if-nez p4, :cond_4

    sget-object p4, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;->COMPLETE:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    goto :goto_3

    :cond_4
    sget-object p4, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;->PENDING:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    :goto_3
    iput-object p0, v0, Lec/f;->a:Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;

    iput-object p1, v0, Lec/f;->b:Ljava/lang/String;

    iput-object p2, v0, Lec/f;->c:Ljava/lang/String;

    iput-object p3, v0, Lec/f;->d:Ljava/util/List;

    iput-object p5, v0, Lec/f;->e:Ljava/lang/Integer;

    iput-object p6, v0, Lec/f;->f:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    iput-object p4, v0, Lec/f;->g:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    iput v3, v0, Lec/f;->j:I

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;->b:Ljc/d;

    invoke-virtual {v2, p3, v0}, Ljc/d;->h(Ljava/util/List;LNm/c;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v1, :cond_5

    return-object v1

    :cond_5
    move-object v4, p0

    move-object v6, p4

    goto :goto_1

    :goto_4
    new-instance p0, Ljava/util/ArrayList;

    const/16 p3, 0xa

    invoke-static {v5, p3}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result p3

    invoke-direct {p0, p3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_5
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    const/4 v0, 0x0

    if-eqz p4, :cond_7

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lgc/f;

    new-instance v1, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;

    iget-object v2, p4, Lgc/f;->a:Ljava/lang/String;

    sget-object v3, Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;->SUPPLEMENT:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    iget-object p4, p4, Lgc/f;->b:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    if-ne p4, v3, :cond_6

    move-object v0, p5

    :cond_6
    invoke-direct {v1, v2, p6, v0}, Lcom/eightsleep/data_jetlag/data/model/JetLagTaskUpdateRequest;-><init>(Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;Ljava/lang/Integer;)V

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5

    :cond_7
    new-instance p3, Lcom/eightsleep/data_jetlag/data/model/JetLagBulkTaskUpdateRequest;

    invoke-direct {p3, p0}, Lcom/eightsleep/data_jetlag/data/model/JetLagBulkTaskUpdateRequest;-><init>(Ljava/util/List;)V

    invoke-virtual {v4}, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;->getApi()Ldc/a;

    move-result-object p0

    new-instance p4, Lec/g;

    invoke-direct {p4, p1, p2, p3, v0}, Lec/g;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/data/model/JetLagBulkTaskUpdateRequest;LLm/c;)V

    const/4 p1, 0x3

    invoke-static {v4, p0, v0, p4, p1}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object v3

    new-instance v2, LYd/n;

    const/4 v7, 0x3

    invoke-direct/range {v2 .. v7}, LYd/n;-><init>(Lzo/l;LNa/b;Ljava/lang/Object;Ljava/lang/Object;I)V

    return-object v2
.end method
