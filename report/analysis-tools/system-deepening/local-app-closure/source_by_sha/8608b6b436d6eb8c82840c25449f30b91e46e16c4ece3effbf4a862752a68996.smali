.class public final Lmd/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmd/a;


# instance fields
.field public final a:Lu5/e;

.field public final b:Lxd/p;

.field public final c:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;


# direct methods
.method public constructor <init>(Lu5/e;Lxd/p;Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;)V
    .locals 1

    const-string v0, "napModeRepository"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmd/e;->a:Lu5/e;

    iput-object p2, p0, Lmd/e;->b:Lxd/p;

    iput-object p3, p0, Lmd/e;->c:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;

    return-void
.end method


# virtual methods
.method public final a(JLNm/c;)Ljava/lang/Object;
    .locals 12

    instance-of v0, p3, Lmd/b;

    if-eqz v0, :cond_0

    move-object v0, p3

    check-cast v0, Lmd/b;

    iget v1, v0, Lmd/b;->g:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lmd/b;->g:I

    goto :goto_0

    :cond_0
    new-instance v0, Lmd/b;

    invoke-direct {v0, p0, p3}, Lmd/b;-><init>(Lmd/e;LNm/c;)V

    :goto_0
    iget-object p3, v0, Lmd/b;->e:Ljava/lang/Object;

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, v0, Lmd/b;->g:I

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v2, :cond_4

    if-eq v2, v5, :cond_3

    if-eq v2, v4, :cond_2

    if-ne v2, v3, :cond_1

    invoke-static {p3}, LX4/x;->M(Ljava/lang/Object;)V

    return-object p3

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    iget-wide p0, v0, Lmd/b;->d:J

    iget-object p2, v0, Lmd/b;->c:Lzo/l;

    check-cast p2, Lzo/l;

    iget-object v2, v0, Lmd/b;->b:Lya/d;

    iget-object v4, v0, Lmd/b;->a:Lmd/e;

    invoke-static {p3}, LX4/x;->M(Ljava/lang/Object;)V

    move-object v5, p2

    move-object p2, v4

    :goto_1
    move-object v4, v2

    goto :goto_3

    :cond_3
    iget-wide p1, v0, Lmd/b;->d:J

    iget-object p0, v0, Lmd/b;->b:Lya/d;

    iget-object v2, v0, Lmd/b;->a:Lmd/e;

    invoke-static {p3}, LX4/x;->M(Ljava/lang/Object;)V

    move-object v10, v2

    move-object v2, p0

    move-object p0, v10

    goto :goto_2

    :cond_4
    invoke-static {p3}, LX4/x;->M(Ljava/lang/Object;)V

    sget-object p3, Lya/j;->a:Lya/d;

    iput-object p0, v0, Lmd/b;->a:Lmd/e;

    iput-object p3, v0, Lmd/b;->b:Lya/d;

    iput-wide p1, v0, Lmd/b;->d:J

    iput v5, v0, Lmd/b;->g:I

    iget-object v2, p0, Lmd/e;->a:Lu5/e;

    invoke-virtual {v2, v0}, Lu5/e;->C(LNm/c;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v1, :cond_5

    goto :goto_4

    :cond_5
    move-object v10, v2

    move-object v2, p3

    move-object p3, v10

    :goto_2
    check-cast p3, Lzo/l;

    iget-object v5, p0, Lmd/e;->b:Lxd/p;

    iput-object p0, v0, Lmd/b;->a:Lmd/e;

    iput-object v2, v0, Lmd/b;->b:Lya/d;

    move-object v6, p3

    check-cast v6, Lzo/l;

    iput-object v6, v0, Lmd/b;->c:Lzo/l;

    iput-wide p1, v0, Lmd/b;->d:J

    iput v4, v0, Lmd/b;->g:I

    invoke-virtual {v5, v0}, Lxd/p;->a(LNm/c;)Ljava/lang/Object;

    move-result-object v4

    if-ne v4, v1, :cond_6

    goto :goto_4

    :cond_6
    move-wide v10, p1

    move-object p2, p0

    move-wide p0, v10

    move-object v5, p3

    move-object p3, v4

    goto :goto_1

    :goto_3
    move-object v6, p3

    check-cast v6, Lzo/l;

    new-instance v8, Lk1/C;

    const/16 p3, 0x1d

    invoke-direct {v8, p3}, Lk1/C;-><init>(I)V

    const/16 v9, 0xc

    const/4 v7, 0x0

    invoke-static/range {v4 .. v9}, Lya/d;->b(Lya/d;Lzo/l;Lzo/l;Lcom/eightsleep/presentation_onboarding/viewmodel/h;LVm/n;I)LGc/h;

    move-result-object p3

    new-instance v2, Lmd/d;

    const/4 v4, 0x0

    invoke-direct {v2, p2, p0, p1, v4}, Lmd/d;-><init>(Lmd/e;JLLm/c;)V

    iput-object v4, v0, Lmd/b;->a:Lmd/e;

    iput-object v4, v0, Lmd/b;->b:Lya/d;

    iput-object v4, v0, Lmd/b;->c:Lzo/l;

    iput v3, v0, Lmd/b;->g:I

    invoke-static {p3, v4, v2, v3}, LP2/q;->u(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object p0

    if-ne p0, v1, :cond_7

    :goto_4
    return-object v1

    :cond_7
    return-object p0
.end method
