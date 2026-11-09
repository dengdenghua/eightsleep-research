.class public final Lhc/v;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public a:LJ8/e;

.field public b:I

.field public synthetic c:Ljava/lang/Object;

.field public final synthetic d:Lhc/w;


# direct methods
.method public constructor <init>(Lhc/w;LLm/c;)V
    .locals 0

    iput-object p1, p0, Lhc/v;->d:Lhc/w;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 1

    new-instance v0, Lhc/v;

    iget-object p0, p0, Lhc/v;->d:Lhc/w;

    invoke-direct {v0, p0, p2}, Lhc/v;-><init>(Lhc/w;LLm/c;)V

    iput-object p1, v0, Lhc/v;->c:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Ljava/util/List;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lhc/v;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lhc/v;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lhc/v;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, Lhc/v;->b:I

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    if-ne v1, v2, :cond_0

    iget-object v0, p0, Lhc/v;->a:LJ8/e;

    iget-object p0, p0, Lhc/v;->c:Ljava/lang/Object;

    check-cast p0, Lya/d;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    move-object v5, p0

    move-object v6, v0

    goto :goto_1

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lhc/v;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v3, 0x0

    if-eqz v1, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lgc/o;

    iget-object v4, v4, Lgc/o;->e:Lcom/eightsleep/data_jetlag/enums/TripStatus;

    sget-object v5, Lcom/eightsleep/data_jetlag/enums/TripStatus;->PLANNING:Lcom/eightsleep/data_jetlag/enums/TripStatus;

    if-eq v4, v5, :cond_4

    sget-object v5, Lcom/eightsleep/data_jetlag/enums/TripStatus;->ACTIVE:Lcom/eightsleep/data_jetlag/enums/TripStatus;

    if-ne v4, v5, :cond_2

    goto :goto_0

    :cond_3
    move-object v1, v3

    :cond_4
    :goto_0
    check-cast v1, Lgc/o;

    if-eqz v1, :cond_6

    sget-object p1, Lya/j;->a:Lya/d;

    new-instance v3, Lya/g;

    invoke-direct {v3, v1}, Lya/g;-><init>(Ljava/lang/Object;)V

    new-instance v4, LJ8/e;

    const/16 v5, 0x9

    invoke-direct {v4, v3, v5}, LJ8/e;-><init>(Ljava/lang/Object;I)V

    iget-object v3, p0, Lhc/v;->d:Lhc/w;

    iget-object v3, v3, Lhc/w;->b:Lyc/d;

    iput-object p1, p0, Lhc/v;->c:Ljava/lang/Object;

    iput-object v4, p0, Lhc/v;->a:LJ8/e;

    iput v2, p0, Lhc/v;->b:I

    iget-object v1, v1, Lgc/o;->b:Ljava/lang/String;

    invoke-virtual {v3, v1, p0}, Lyc/d;->u(Ljava/lang/String;LNm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_5

    return-object v0

    :cond_5
    move-object v5, p1

    move-object v6, v4

    move-object p1, p0

    :goto_1
    move-object v7, p1

    check-cast v7, Lzo/l;

    new-instance v9, LXe/l1;

    const/16 p0, 0x18

    invoke-direct {v9, p0}, LXe/l1;-><init>(I)V

    const/16 v10, 0xc

    const/4 v8, 0x0

    invoke-static/range {v5 .. v10}, Lya/d;->b(Lya/d;Lzo/l;Lzo/l;Lcom/eightsleep/presentation_onboarding/viewmodel/h;LVm/n;I)LGc/h;

    move-result-object p0

    return-object p0

    :cond_6
    new-instance p0, Lya/g;

    new-instance p1, LHm/k;

    invoke-direct {p1, v3, v3}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {p0, p1}, Lya/g;-><init>(Ljava/lang/Object;)V

    new-instance p1, LJ8/e;

    const/16 v0, 0x9

    invoke-direct {p1, p0, v0}, LJ8/e;-><init>(Ljava/lang/Object;I)V

    return-object p1
.end method
