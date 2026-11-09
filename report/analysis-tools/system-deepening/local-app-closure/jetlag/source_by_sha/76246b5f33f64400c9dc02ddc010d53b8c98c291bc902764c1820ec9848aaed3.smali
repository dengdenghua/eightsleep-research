.class public final Ljc/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LQa/d;


# instance fields
.field public final a:Lkc/d;

.field public final b:J

.field public c:J


# direct methods
.method public constructor <init>(Lkc/d;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljc/d;->a:Lkc/d;

    sget p1, Lmo/b;->d:I

    const/16 p1, 0x18

    sget-object v0, Lmo/d;->HOURS:Lmo/d;

    invoke-static {p1, v0}, LP2/G;->V(ILmo/d;)J

    move-result-wide v0

    iput-wide v0, p0, Ljc/d;->b:J

    return-void
.end method


# virtual methods
.method public final a()J
    .locals 2

    iget-wide v0, p0, Ljc/d;->b:J

    return-wide v0
.end method

.method public final b()Z
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, v0}, LP2/h;->G(LQa/b;Ljava/lang/Long;)Z

    move-result p0

    return p0
.end method

.method public final c()J
    .locals 2

    iget-wide v0, p0, Ljc/d;->c:J

    return-wide v0
.end method

.method public final d(Ljava/lang/String;)Lzo/l;
    .locals 4

    sget-object v0, Ltimber/log/Timber;->a:Lbr/a;

    const-string v1, "loading current user from cache with id: "

    invoke-static {v1, p1}, LB/h;->k(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v3}, Lbr/a;->j(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz p1, :cond_0

    iget-object p0, p0, Ljc/d;->a:Lkc/d;

    const-string v0, "SELECT * FROM jet_lag_plan WHERE tripId = ?"

    const/4 v1, 0x1

    invoke-static {v1, v0}, LE4/A;->a(ILjava/lang/String;)LE4/A;

    move-result-object v0

    invoke-virtual {v0, v1, p1}, LE4/A;->g(ILjava/lang/String;)V

    const-string p1, "jet_lag_plan_task"

    const-string v1, "jet_lag_plan"

    filled-new-array {p1, v1}, [Ljava/lang/String;

    move-result-object p1

    new-instance v1, Laa/e;

    const/16 v3, 0xe

    invoke-direct {v1, v3, p0, v0}, Laa/e;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    iget-object p0, p0, Lkc/d;->a:Ljava/lang/Object;

    check-cast p0, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-static {p0, v2, p1, v1}, LP2/A;->I(LE4/t;Z[Ljava/lang/String;Ljava/util/concurrent/Callable;)Lzo/u0;

    move-result-object p0

    new-instance p1, LS4/r;

    const/4 v0, 0x5

    invoke-direct {p1, p0, v0}, LS4/r;-><init>(Lzo/u0;I)V

    return-object p1

    :cond_0
    new-instance p0, LJ8/e;

    const/4 p1, 0x0

    const/16 v0, 0x9

    invoke-direct {p0, p1, v0}, LJ8/e;-><init>(Ljava/lang/Object;I)V

    return-object p0
.end method

.method public final e(J)V
    .locals 0

    iput-wide p1, p0, Ljc/d;->c:J

    return-void
.end method

.method public final f()Ljava/lang/Object;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public final bridge synthetic g(LLm/c;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;

    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0
.end method

.method public final h(Ljava/util/List;LNm/c;)Ljava/lang/Object;
    .locals 6

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p1, v1}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lgc/f;

    new-instance v2, Llc/e;

    new-instance v3, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;

    iget-object v4, v1, Lgc/f;->d:Lgc/d;

    iget-object v5, v4, Lgc/d;->a:Ljava/lang/Integer;

    iget-object v4, v4, Lgc/d;->b:Ljava/lang/String;

    invoke-direct {v3, v5, v4}, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;-><init>(Ljava/lang/Integer;Ljava/lang/String;)V

    iget-object v4, v1, Lgc/f;->c:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    iget-object v5, v1, Lgc/f;->a:Ljava/lang/String;

    iget-object v1, v1, Lgc/f;->b:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    invoke-direct {v2, v5, v1, v4, v3}, Llc/e;-><init>(Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    iget-object p0, p0, Ljc/d;->a:Lkc/d;

    new-instance p1, Lkc/b;

    const/4 v1, 0x1

    invoke-direct {p1, p0, v0, v1}, Lkc/b;-><init>(Lkc/d;Ljava/util/ArrayList;I)V

    iget-object p0, p0, Lkc/d;->a:Ljava/lang/Object;

    check-cast p0, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-static {p0, p1, p2}, LP2/A;->K(LE4/t;Ljava/util/concurrent/Callable;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    if-ne p0, p1, :cond_1

    return-object p0

    :cond_1
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0
.end method
