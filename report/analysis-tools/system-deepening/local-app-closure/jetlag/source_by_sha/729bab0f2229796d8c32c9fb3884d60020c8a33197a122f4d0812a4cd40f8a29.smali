.class public final Lhc/d;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public synthetic a:Ljava/lang/Object;

.field public final synthetic b:Lhc/e;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z


# direct methods
.method public constructor <init>(Lhc/e;Ljava/lang/String;ZLLm/c;)V
    .locals 0

    iput-object p1, p0, Lhc/d;->b:Lhc/e;

    iput-object p2, p0, Lhc/d;->c:Ljava/lang/String;

    iput-boolean p3, p0, Lhc/d;->d:Z

    const/4 p1, 0x2

    invoke-direct {p0, p1, p4}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 3

    new-instance v0, Lhc/d;

    iget-object v1, p0, Lhc/d;->c:Ljava/lang/String;

    iget-boolean v2, p0, Lhc/d;->d:Z

    iget-object p0, p0, Lhc/d;->b:Lhc/e;

    invoke-direct {v0, p0, v1, v2, p2}, Lhc/d;-><init>(Lhc/e;Ljava/lang/String;ZLLm/c;)V

    iput-object p1, v0, Lhc/d;->a:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, LHm/k;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lhc/d;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lhc/d;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lhc/d;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lhc/d;->a:Ljava/lang/Object;

    check-cast p1, LHm/k;

    iget-object v0, p1, LHm/k;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object p1, p1, LHm/k;->b:Ljava/lang/Object;

    check-cast p1, LGa/f;

    iget-object v1, p0, Lhc/d;->b:Lhc/e;

    iget-object v1, v1, Lhc/e;->c:Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;

    iget-object v2, p0, Lhc/d;->c:Ljava/lang/String;

    iget-boolean p0, p0, Lhc/d;->d:Z

    invoke-virtual {v1, v0, v2, p0}, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;->createPlan(Ljava/lang/String;Ljava/lang/String;Z)Lzo/l;

    move-result-object p0

    new-instance v0, Lhc/c;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lhc/c;-><init>(LGa/f;LLm/c;)V

    const/4 p1, 0x3

    invoke-static {p0, v1, v0, p1}, LP2/q;->t(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object p0

    return-object p0
.end method
