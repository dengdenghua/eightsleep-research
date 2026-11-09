.class public final Lec/b;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public a:I

.field public synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;


# direct methods
.method public constructor <init>(LLm/c;Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p3, p0, Lec/b;->c:Ljava/lang/String;

    iput-object p4, p0, Lec/b;->d:Ljava/lang/String;

    iput-object p2, p0, Lec/b;->e:Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;

    const/4 p2, 0x2

    invoke-direct {p0, p2, p1}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 3

    new-instance v0, Lec/b;

    iget-object v1, p0, Lec/b;->d:Ljava/lang/String;

    iget-object v2, p0, Lec/b;->e:Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;

    iget-object p0, p0, Lec/b;->c:Ljava/lang/String;

    invoke-direct {v0, p2, v2, p0, v1}, Lec/b;-><init>(LLm/c;Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;Ljava/lang/String;Ljava/lang/String;)V

    iput-object p1, v0, Lec/b;->b:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lec/b;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lec/b;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lec/b;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, Lec/b;->a:I

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    if-ne v1, v2, :cond_0

    iget-object p0, p0, Lec/b;->b:Ljava/lang/Object;

    check-cast p0, Llc/d;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_2

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lec/b;->b:Ljava/lang/Object;

    check-cast p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;

    const-string v1, "response"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p0, Lec/b;->c:Ljava/lang/String;

    iget-object v3, p0, Lec/b;->d:Ljava/lang/String;

    invoke-virtual {p1, v1, v3}, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->toEntity(Ljava/lang/String;Ljava/lang/String;)Llc/a;

    move-result-object v1

    invoke-virtual {p1}, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->getTasks()Ljava/util/List;

    move-result-object p1

    new-instance v3, Ljava/util/ArrayList;

    const/16 v4, 0xa

    invoke-static {p1, v4}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;

    invoke-virtual {v4}, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->toEntity()Llc/c;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    new-instance p1, Llc/d;

    invoke-direct {p1, v1, v3}, Llc/d;-><init>(Llc/a;Ljava/util/ArrayList;)V

    iget-object v1, p0, Lec/b;->e:Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;

    invoke-static {v1}, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;->access$getCache$p(Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;)Ljc/d;

    move-result-object v1

    iput-object p1, p0, Lec/b;->b:Ljava/lang/Object;

    iput v2, p0, Lec/b;->a:I

    iget-object v1, v1, Ljc/d;->a:Lkc/d;

    new-instance v2, Lhf/c;

    const/16 v3, 0xb

    invoke-direct {v2, v3, v1, p1}, Lhf/c;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    iget-object v1, v1, Lkc/d;->a:Ljava/lang/Object;

    check-cast v1, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-static {v1, v2, p0}, LP2/E;->M(LE4/t;LVm/k;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    if-ne p0, v1, :cond_3

    goto :goto_1

    :cond_3
    sget-object p0, LHm/B;->a:LHm/B;

    :goto_1
    if-ne p0, v0, :cond_4

    return-object v0

    :cond_4
    move-object p0, p1

    :goto_2
    invoke-virtual {p0}, Llc/d;->a()Lgc/j;

    move-result-object p0

    return-object p0
.end method
