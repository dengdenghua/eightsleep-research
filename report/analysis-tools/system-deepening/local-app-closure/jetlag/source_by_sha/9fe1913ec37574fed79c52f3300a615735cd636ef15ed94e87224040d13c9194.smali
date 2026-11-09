.class public final Lhc/N;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public synthetic a:Ljava/lang/Object;

.field public final synthetic b:Lhc/O;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lhc/O;Ljava/lang/String;LLm/c;)V
    .locals 0

    iput-object p1, p0, Lhc/N;->b:Lhc/O;

    iput-object p2, p0, Lhc/N;->c:Ljava/lang/String;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 2

    new-instance v0, Lhc/N;

    iget-object v1, p0, Lhc/N;->b:Lhc/O;

    iget-object p0, p0, Lhc/N;->c:Ljava/lang/String;

    invoke-direct {v0, v1, p0, p2}, Lhc/N;-><init>(Lhc/O;Ljava/lang/String;LLm/c;)V

    iput-object p1, v0, Lhc/N;->a:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, LHm/k;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lhc/N;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lhc/N;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lhc/N;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lhc/N;->a:Ljava/lang/Object;

    check-cast p1, LHm/k;

    iget-object v0, p1, LHm/k;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object p1, p1, LHm/k;->b:Ljava/lang/Object;

    check-cast p1, LGa/f;

    iget-object v1, p0, Lhc/N;->b:Lhc/O;

    iget-object v1, v1, Lhc/O;->c:Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;

    iget-object p0, p0, Lhc/N;->c:Ljava/lang/String;

    invoke-virtual {v1, p0, v0}, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;->observePlan(Ljava/lang/String;Ljava/lang/String;)Lzo/l;

    move-result-object p0

    new-instance v0, Lhc/M;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lhc/M;-><init>(LGa/f;LLm/c;)V

    const/4 p1, 0x3

    invoke-static {p0, v1, v0, p1}, LP2/q;->t(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object p0

    return-object p0
.end method
