.class public final Lgd/K;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 0

    new-instance p0, Lgd/K;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, LNm/i;-><init>(ILLm/c;)V

    return-object p0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lya/j;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lgd/K;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lgd/K;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lgd/K;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    sget-object p0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0
.end method
