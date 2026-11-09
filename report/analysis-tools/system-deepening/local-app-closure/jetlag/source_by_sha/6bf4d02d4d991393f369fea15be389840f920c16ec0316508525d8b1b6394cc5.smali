.class public final Ljc/g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LQa/b;


# instance fields
.field public final a:Lkc/i;

.field public final b:J

.field public c:J


# direct methods
.method public constructor <init>(Lkc/i;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljc/g;->a:Lkc/i;

    sget p1, Lmo/b;->d:I

    const/16 p1, 0xc

    sget-object v0, Lmo/d;->HOURS:Lmo/d;

    invoke-static {p1, v0}, LP2/G;->V(ILmo/d;)J

    move-result-wide v0

    iput-wide v0, p0, Ljc/g;->b:J

    return-void
.end method


# virtual methods
.method public final a()J
    .locals 2

    iget-wide v0, p0, Ljc/g;->b:J

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

    iget-wide v0, p0, Ljc/g;->c:J

    return-wide v0
.end method

.method public final e(J)V
    .locals 0

    iput-wide p1, p0, Ljc/g;->c:J

    return-void
.end method

.method public final f()Ljava/lang/Object;
    .locals 0

    sget-object p0, LIm/z;->a:LIm/z;

    return-object p0
.end method

.method public final bridge synthetic g(LLm/c;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    const/4 v0, 0x0

    check-cast p2, Ljava/util/List;

    invoke-virtual {p0, v0, p2, p1}, Ljc/g;->h(Ljava/lang/String;Ljava/util/List;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final h(Ljava/lang/String;Ljava/util/List;LLm/c;)Ljava/lang/Object;
    .locals 6

    instance-of p1, p3, Ljc/f;

    if-eqz p1, :cond_0

    move-object p1, p3

    check-cast p1, Ljc/f;

    iget v0, p1, Ljc/f;->c:I

    const/high16 v1, -0x80000000

    and-int v2, v0, v1

    if-eqz v2, :cond_0

    sub-int/2addr v0, v1

    iput v0, p1, Ljc/f;->c:I

    goto :goto_0

    :cond_0
    new-instance p1, Ljc/f;

    invoke-direct {p1, p0, p3}, Ljc/f;-><init>(Ljc/g;LLm/c;)V

    :goto_0
    iget-object p3, p1, Ljc/f;->a:Ljava/lang/Object;

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p1, Ljc/f;->c:I

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eqz v1, :cond_3

    if-eq v1, v3, :cond_2

    if-ne v1, v2, :cond_1

    goto :goto_1

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    :goto_1
    invoke-static {p3}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_3

    :cond_3
    invoke-static {p3}, LX4/x;->M(Ljava/lang/Object;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Ljc/g;->c:J

    iget-object p0, p0, Ljc/g;->a:Lkc/i;

    iget-object p3, p0, Lkc/i;->a:Lcom/eightsleep/eight/AppDatabase_Impl;

    if-eqz p2, :cond_4

    iput v3, p1, Ljc/f;->c:I

    new-instance v1, Lhf/c;

    const/16 v2, 0xc

    invoke-direct {v1, v2, p0, p2}, Lhf/c;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-static {p3, v1, p1}, LP2/E;->M(LE4/t;LVm/k;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_5

    goto :goto_2

    :cond_4
    iput v2, p1, Ljc/f;->c:I

    new-instance p2, LJd/c;

    const/16 v1, 0xc

    invoke-direct {p2, p0, v1}, LJd/c;-><init>(Ljava/lang/Object;I)V

    invoke-static {p3, p2, p1}, LP2/A;->K(LE4/t;Ljava/util/concurrent/Callable;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_5

    :goto_2
    return-object v0

    :cond_5
    :goto_3
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0
.end method
