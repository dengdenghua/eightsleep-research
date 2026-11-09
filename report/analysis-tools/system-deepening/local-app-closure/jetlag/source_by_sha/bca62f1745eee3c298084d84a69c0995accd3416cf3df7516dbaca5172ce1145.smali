.class public final Lhc/U;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public a:I

.field public synthetic b:Ljava/lang/Object;

.field public final synthetic c:Lhc/V;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/util/List;

.field public final synthetic f:Z

.field public final synthetic g:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Lhc/V;Ljava/lang/String;Ljava/util/List;ZLjava/lang/Integer;LLm/c;)V
    .locals 0

    iput-object p1, p0, Lhc/U;->c:Lhc/V;

    iput-object p2, p0, Lhc/U;->d:Ljava/lang/String;

    iput-object p3, p0, Lhc/U;->e:Ljava/util/List;

    iput-boolean p4, p0, Lhc/U;->f:Z

    iput-object p5, p0, Lhc/U;->g:Ljava/lang/Integer;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p6}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 7

    new-instance v0, Lhc/U;

    iget-boolean v4, p0, Lhc/U;->f:Z

    iget-object v5, p0, Lhc/U;->g:Ljava/lang/Integer;

    iget-object v1, p0, Lhc/U;->c:Lhc/V;

    iget-object v2, p0, Lhc/U;->d:Ljava/lang/String;

    iget-object v3, p0, Lhc/U;->e:Ljava/util/List;

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lhc/U;-><init>(Lhc/V;Ljava/lang/String;Ljava/util/List;ZLjava/lang/Integer;LLm/c;)V

    iput-object p1, v0, Lhc/U;->b:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Ljava/lang/String;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lhc/U;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lhc/U;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lhc/U;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, Lhc/U;->a:I

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    if-ne v1, v2, :cond_0

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    return-object p1

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lhc/U;->b:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Ljava/lang/String;

    iget-object p1, p0, Lhc/U;->c:Lhc/V;

    iget-object v3, p1, Lhc/V;->b:Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;

    iput v2, p0, Lhc/U;->a:I

    iget-boolean v7, p0, Lhc/U;->f:Z

    iget-object v8, p0, Lhc/U;->g:Ljava/lang/Integer;

    iget-object v5, p0, Lhc/U;->d:Ljava/lang/String;

    iget-object v6, p0, Lhc/U;->e:Ljava/util/List;

    move-object v9, p0

    invoke-virtual/range {v3 .. v9}, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;->updateTasks(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;ZLjava/lang/Integer;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_2

    return-object v0

    :cond_2
    return-object p0
.end method
