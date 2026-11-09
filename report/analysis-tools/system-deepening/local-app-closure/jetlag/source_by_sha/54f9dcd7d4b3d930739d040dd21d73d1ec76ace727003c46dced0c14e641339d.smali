.class public final Lhc/j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhc/f;


# instance fields
.field public final a:Lxd/p;

.field public final b:Lu5/e;

.field public final c:Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;


# direct methods
.method public constructor <init>(Lxd/p;Lu5/e;Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhc/j;->a:Lxd/p;

    iput-object p2, p0, Lhc/j;->b:Lu5/e;

    iput-object p3, p0, Lhc/j;->c:Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/ArrayList;LNm/c;)Ljava/lang/Object;
    .locals 12

    instance-of v0, p2, Lhc/g;

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, Lhc/g;

    iget v1, v0, Lhc/g;->g:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lhc/g;->g:I

    goto :goto_0

    :cond_0
    new-instance v0, Lhc/g;

    invoke-direct {v0, p0, p2}, Lhc/g;-><init>(Lhc/j;LNm/c;)V

    :goto_0
    iget-object p2, v0, Lhc/g;->e:Ljava/lang/Object;

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, v0, Lhc/g;->g:I

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v2, :cond_4

    if-eq v2, v5, :cond_3

    if-eq v2, v4, :cond_2

    if-ne v2, v3, :cond_1

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    return-object p2

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    iget-object p0, v0, Lhc/g;->d:Lzo/l;

    check-cast p0, Lzo/l;

    iget-object p1, v0, Lhc/g;->c:Lya/d;

    iget-object v2, v0, Lhc/g;->b:Ljava/util/List;

    iget-object v4, v0, Lhc/g;->a:Lhc/j;

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    move-object v6, p0

    :goto_1
    move-object v5, p1

    goto :goto_3

    :cond_3
    iget-object p0, v0, Lhc/g;->c:Lya/d;

    iget-object p1, v0, Lhc/g;->b:Ljava/util/List;

    iget-object v2, v0, Lhc/g;->a:Lhc/j;

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    move-object v11, p1

    move-object p1, p0

    move-object p0, v2

    move-object v2, p2

    move-object p2, v11

    goto :goto_2

    :cond_4
    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    sget-object p2, Lya/j;->a:Lya/d;

    iput-object p0, v0, Lhc/g;->a:Lhc/j;

    iput-object p1, v0, Lhc/g;->b:Ljava/util/List;

    iput-object p2, v0, Lhc/g;->c:Lya/d;

    iput v5, v0, Lhc/g;->g:I

    iget-object v2, p0, Lhc/j;->b:Lu5/e;

    invoke-virtual {v2, v0}, Lu5/e;->C(LNm/c;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v1, :cond_5

    goto :goto_4

    :cond_5
    move-object v11, p2

    move-object p2, p1

    move-object p1, v11

    :goto_2
    check-cast v2, Lzo/l;

    iget-object v5, p0, Lhc/j;->a:Lxd/p;

    iput-object p0, v0, Lhc/g;->a:Lhc/j;

    iput-object p2, v0, Lhc/g;->b:Ljava/util/List;

    iput-object p1, v0, Lhc/g;->c:Lya/d;

    move-object v6, v2

    check-cast v6, Lzo/l;

    iput-object v6, v0, Lhc/g;->d:Lzo/l;

    iput v4, v0, Lhc/g;->g:I

    invoke-virtual {v5, v0}, Lxd/p;->a(LNm/c;)Ljava/lang/Object;

    move-result-object v4

    if-ne v4, v1, :cond_6

    goto :goto_4

    :cond_6
    move-object v6, v2

    move-object v2, p2

    move-object p2, v4

    move-object v4, p0

    goto :goto_1

    :goto_3
    move-object v7, p2

    check-cast v7, Lzo/l;

    new-instance v9, LXe/l1;

    const/16 p0, 0x17

    invoke-direct {v9, p0}, LXe/l1;-><init>(I)V

    const/16 v10, 0xc

    const/4 v8, 0x0

    invoke-static/range {v5 .. v10}, Lya/d;->b(Lya/d;Lzo/l;Lzo/l;Lcom/eightsleep/presentation_onboarding/viewmodel/h;LVm/n;I)LGc/h;

    move-result-object p0

    new-instance p1, Lhc/i;

    const/4 p2, 0x0

    invoke-direct {p1, v4, v2, p2}, Lhc/i;-><init>(Lhc/j;Ljava/util/List;LLm/c;)V

    iput-object p2, v0, Lhc/g;->a:Lhc/j;

    iput-object p2, v0, Lhc/g;->b:Ljava/util/List;

    iput-object p2, v0, Lhc/g;->c:Lya/d;

    iput-object p2, v0, Lhc/g;->d:Lzo/l;

    iput v3, v0, Lhc/g;->g:I

    invoke-static {p0, p2, p1, v3}, LP2/q;->u(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object p0

    if-ne p0, v1, :cond_7

    :goto_4
    return-object v1

    :cond_7
    return-object p0
.end method
