.class public final Lhc/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhc/a;


# instance fields
.field public final a:Lxd/p;

.field public final b:Lu5/e;

.field public final c:Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;


# direct methods
.method public constructor <init>(Lxd/p;Lu5/e;Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhc/e;->a:Lxd/p;

    iput-object p2, p0, Lhc/e;->b:Lu5/e;

    iput-object p3, p0, Lhc/e;->c:Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;

    return-void
.end method


# virtual methods
.method public final a(LNm/c;Ljava/lang/String;Z)Ljava/lang/Object;
    .locals 11

    instance-of v0, p1, Lhc/b;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lhc/b;

    iget v1, v0, Lhc/b;->h:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lhc/b;->h:I

    goto :goto_0

    :cond_0
    new-instance v0, Lhc/b;

    invoke-direct {v0, p0, p1}, Lhc/b;-><init>(Lhc/e;LNm/c;)V

    :goto_0
    iget-object p1, v0, Lhc/b;->f:Ljava/lang/Object;

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, v0, Lhc/b;->h:I

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v2, :cond_4

    if-eq v2, v5, :cond_3

    if-eq v2, v4, :cond_2

    if-ne v2, v3, :cond_1

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    return-object p1

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    iget-boolean p0, v0, Lhc/b;->e:Z

    iget-object p2, v0, Lhc/b;->d:Lzo/l;

    check-cast p2, Lzo/l;

    iget-object p3, v0, Lhc/b;->c:Lya/d;

    iget-object v2, v0, Lhc/b;->b:Ljava/lang/String;

    iget-object v4, v0, Lhc/b;->a:Lhc/e;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    move-object v5, p2

    move-object p2, v4

    :goto_1
    move-object v4, p3

    goto :goto_4

    :cond_3
    iget-boolean p3, v0, Lhc/b;->e:Z

    iget-object p0, v0, Lhc/b;->c:Lya/d;

    iget-object p2, v0, Lhc/b;->b:Ljava/lang/String;

    iget-object v2, v0, Lhc/b;->a:Lhc/e;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    move v10, p3

    move-object p3, p0

    move-object p0, v2

    :goto_2
    move v2, v10

    goto :goto_3

    :cond_4
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    sget-object p1, Lya/j;->a:Lya/d;

    iput-object p0, v0, Lhc/b;->a:Lhc/e;

    iput-object p2, v0, Lhc/b;->b:Ljava/lang/String;

    iput-object p1, v0, Lhc/b;->c:Lya/d;

    iput-boolean p3, v0, Lhc/b;->e:Z

    iput v5, v0, Lhc/b;->h:I

    iget-object v2, p0, Lhc/e;->b:Lu5/e;

    invoke-virtual {v2, v0}, Lu5/e;->C(LNm/c;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v1, :cond_5

    goto :goto_5

    :cond_5
    move v10, p3

    move-object p3, p1

    move-object p1, v2

    goto :goto_2

    :goto_3
    check-cast p1, Lzo/l;

    iget-object v5, p0, Lhc/e;->a:Lxd/p;

    iput-object p0, v0, Lhc/b;->a:Lhc/e;

    iput-object p2, v0, Lhc/b;->b:Ljava/lang/String;

    iput-object p3, v0, Lhc/b;->c:Lya/d;

    move-object v6, p1

    check-cast v6, Lzo/l;

    iput-object v6, v0, Lhc/b;->d:Lzo/l;

    iput-boolean v2, v0, Lhc/b;->e:Z

    iput v4, v0, Lhc/b;->h:I

    invoke-virtual {v5, v0}, Lxd/p;->a(LNm/c;)Ljava/lang/Object;

    move-result-object v4

    if-ne v4, v1, :cond_6

    goto :goto_5

    :cond_6
    move-object v5, p2

    move-object p2, p0

    move p0, v2

    move-object v2, v5

    move-object v5, p1

    move-object p1, v4

    goto :goto_1

    :goto_4
    move-object v6, p1

    check-cast v6, Lzo/l;

    new-instance v8, LXe/l1;

    const/16 p1, 0x16

    invoke-direct {v8, p1}, LXe/l1;-><init>(I)V

    const/16 v9, 0xc

    const/4 v7, 0x0

    invoke-static/range {v4 .. v9}, Lya/d;->b(Lya/d;Lzo/l;Lzo/l;Lcom/eightsleep/presentation_onboarding/viewmodel/h;LVm/n;I)LGc/h;

    move-result-object p1

    new-instance p3, Lhc/d;

    const/4 v4, 0x0

    invoke-direct {p3, p2, v2, p0, v4}, Lhc/d;-><init>(Lhc/e;Ljava/lang/String;ZLLm/c;)V

    iput-object v4, v0, Lhc/b;->a:Lhc/e;

    iput-object v4, v0, Lhc/b;->b:Ljava/lang/String;

    iput-object v4, v0, Lhc/b;->c:Lya/d;

    iput-object v4, v0, Lhc/b;->d:Lzo/l;

    iput v3, v0, Lhc/b;->h:I

    invoke-static {p1, v4, p3, v3}, LP2/q;->u(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object p0

    if-ne p0, v1, :cond_7

    :goto_5
    return-object v1

    :cond_7
    return-object p0
.end method
