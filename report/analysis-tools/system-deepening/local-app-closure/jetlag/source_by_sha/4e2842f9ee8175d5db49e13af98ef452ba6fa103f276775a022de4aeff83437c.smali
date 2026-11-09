.class public final Lec/l;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public synthetic a:Ljava/lang/Object;


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 1

    new-instance p0, Lec/l;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p2}, LNm/i;-><init>(ILLm/c;)V

    iput-object p1, p0, Lec/l;->a:Ljava/lang/Object;

    return-object p0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lec/l;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lec/l;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lec/l;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p0, p0, Lec/l;->a:Ljava/lang/Object;

    check-cast p0, Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;

    new-instance p1, Lya/g;

    invoke-virtual {p0}, Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;->toDomain()Lgc/i;

    move-result-object p0

    invoke-direct {p1, p0}, Lya/g;-><init>(Ljava/lang/Object;)V

    return-object p1
.end method
