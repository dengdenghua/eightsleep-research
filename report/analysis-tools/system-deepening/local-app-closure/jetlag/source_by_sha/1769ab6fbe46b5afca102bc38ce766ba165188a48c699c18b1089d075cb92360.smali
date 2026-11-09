.class public final Lec/u;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public a:I

.field public synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;LLm/c;)V
    .locals 0

    iput-object p1, p0, Lec/u;->c:Ljava/lang/String;

    iput-object p2, p0, Lec/u;->d:Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 2

    new-instance v0, Lec/u;

    iget-object v1, p0, Lec/u;->c:Ljava/lang/String;

    iget-object p0, p0, Lec/u;->d:Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;

    invoke-direct {v0, v1, p0, p2}, Lec/u;-><init>(Ljava/lang/String;Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;LLm/c;)V

    iput-object p1, v0, Lec/u;->b:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lcom/eightsleep/data_jetlag/data/model/TripResponse;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lec/u;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lec/u;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lec/u;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, Lec/u;->a:I

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    if-ne v1, v2, :cond_0

    iget-object p0, p0, Lec/u;->b:Ljava/lang/Object;

    check-cast p0, Llc/j;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lec/u;->b:Ljava/lang/Object;

    check-cast p1, Lcom/eightsleep/data_jetlag/data/model/TripResponse;

    iget-object v1, p0, Lec/u;->c:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/eightsleep/data_jetlag/data/model/TripResponse;->toEntity(Ljava/lang/String;)Llc/j;

    move-result-object p1

    iget-object v1, p0, Lec/u;->d:Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;

    invoke-static {v1}, Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;->access$getTripCache$p(Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;)Ljc/g;

    move-result-object v1

    invoke-static {p1}, LIm/s;->f0(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    iput-object p1, p0, Lec/u;->b:Ljava/lang/Object;

    iput v2, p0, Lec/u;->a:I

    invoke-virtual {v1, p0, v3}, Ljc/g;->g(LLm/c;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_2

    return-object v0

    :cond_2
    move-object p0, p1

    :goto_0
    invoke-virtual {p0}, Llc/j;->a()Lgc/l;

    move-result-object p0

    return-object p0
.end method
