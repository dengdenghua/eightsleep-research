.class public final Lrd/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LQa/d;


# instance fields
.field public final a:Lqd/d;

.field public b:J

.field public final c:J


# direct methods
.method public constructor <init>(Lqd/d;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrd/e;->a:Lqd/d;

    sget p1, Lmo/b;->d:I

    const/16 p1, 0x1e

    sget-object v0, Lmo/d;->DAYS:Lmo/d;

    invoke-static {p1, v0}, LP2/G;->V(ILmo/d;)J

    move-result-wide v0

    iput-wide v0, p0, Lrd/e;->c:J

    return-void
.end method


# virtual methods
.method public final a()J
    .locals 2

    iget-wide v0, p0, Lrd/e;->c:J

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

    iget-wide v0, p0, Lrd/e;->b:J

    return-wide v0
.end method

.method public final d(Ljava/lang/String;)Lzo/l;
    .locals 3

    if-eqz p1, :cond_0

    iget-object p0, p0, Lrd/e;->a:Lqd/d;

    const-string v0, "SELECT * FROM nap_mode_settings WHERE user_id = ?"

    const/4 v1, 0x1

    invoke-static {v1, v0}, LE4/A;->a(ILjava/lang/String;)LE4/A;

    move-result-object v0

    invoke-virtual {v0, v1, p1}, LE4/A;->g(ILjava/lang/String;)V

    const-string p1, "nap_mode_settings"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    new-instance v1, Laa/e;

    const/16 v2, 0x1d

    invoke-direct {v1, v2, p0, v0}, Laa/e;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    iget-object p0, p0, Lqd/d;->a:Ljava/lang/Object;

    check-cast p0, Lcom/eightsleep/eight/AppDatabase_Impl;

    const/4 v0, 0x0

    invoke-static {p0, v0, p1, v1}, LP2/A;->I(LE4/t;Z[Ljava/lang/String;Ljava/util/concurrent/Callable;)Lzo/u0;

    move-result-object p0

    return-object p0

    :cond_0
    new-instance p0, LJ8/e;

    const/4 p1, 0x0

    const/16 v0, 0x9

    invoke-direct {p0, p1, v0}, LJ8/e;-><init>(Ljava/lang/Object;I)V

    return-object p0
.end method

.method public final e(J)V
    .locals 0

    iput-wide p1, p0, Lrd/e;->b:J

    return-void
.end method

.method public final bridge synthetic f()Ljava/lang/Object;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public final bridge synthetic g(LLm/c;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    const/4 v0, 0x0

    check-cast p2, Lrd/f;

    invoke-virtual {p0, p2, v0, p1}, Lrd/e;->h(Lrd/f;Ljava/lang/String;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final h(Lrd/f;Ljava/lang/String;LLm/c;)Ljava/lang/Object;
    .locals 7

    instance-of v0, p3, Lrd/d;

    if-eqz v0, :cond_0

    move-object v0, p3

    check-cast v0, Lrd/d;

    iget v1, v0, Lrd/d;->d:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lrd/d;->d:I

    goto :goto_0

    :cond_0
    new-instance v0, Lrd/d;

    invoke-direct {v0, p0, p3}, Lrd/d;-><init>(Lrd/e;LLm/c;)V

    :goto_0
    iget-object p3, v0, Lrd/d;->b:Ljava/lang/Object;

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, v0, Lrd/d;->d:I

    sget-object v3, LHm/B;->a:LHm/B;

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x1

    if-eqz v2, :cond_3

    if-eq v2, v6, :cond_2

    if-eq v2, v5, :cond_2

    if-ne v2, v4, :cond_1

    invoke-static {p3}, LX4/x;->M(Ljava/lang/Object;)V

    return-object v3

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    iget-object p0, v0, Lrd/d;->a:Lrd/e;

    invoke-static {p3}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_1

    :cond_3
    invoke-static {p3}, LX4/x;->M(Ljava/lang/Object;)V

    if-nez p2, :cond_4

    sget-object p0, Ltimber/log/Timber;->a:Lbr/a;

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Object;

    const-string p2, "NapModeSettingsCache: Key is null."

    invoke-virtual {p0, p2, p1}, Lbr/a;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v3

    :cond_4
    iget-object p3, p0, Lrd/e;->a:Lqd/d;

    iget-object v2, p3, Lqd/d;->a:Ljava/lang/Object;

    check-cast v2, Lcom/eightsleep/eight/AppDatabase_Impl;

    if-nez p1, :cond_5

    iput-object p0, v0, Lrd/d;->a:Lrd/e;

    iput v6, v0, Lrd/d;->d:I

    new-instance p1, Lqd/c;

    const/4 v5, 0x0

    invoke-direct {p1, v5, p3, p2}, Lqd/c;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-static {v2, p1, v0}, LP2/A;->K(LE4/t;Ljava/util/concurrent/Callable;LLm/c;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_6

    goto :goto_2

    :cond_5
    iput-object p0, v0, Lrd/d;->a:Lrd/e;

    iput v5, v0, Lrd/d;->d:I

    new-instance p2, Lqd/c;

    const/4 v5, 0x1

    invoke-direct {p2, v5, p3, p1}, Lqd/c;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-static {v2, p2, v0}, LP2/A;->K(LE4/t;Ljava/util/concurrent/Callable;LLm/c;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_6

    goto :goto_2

    :cond_6
    :goto_1
    const/4 p1, 0x0

    iput-object p1, v0, Lrd/d;->a:Lrd/e;

    iput v4, v0, Lrd/d;->d:I

    invoke-static {p0}, LP2/i;->G(LQa/d;)LHm/B;

    if-ne v3, v1, :cond_7

    :goto_2
    return-object v1

    :cond_7
    return-object v3
.end method
