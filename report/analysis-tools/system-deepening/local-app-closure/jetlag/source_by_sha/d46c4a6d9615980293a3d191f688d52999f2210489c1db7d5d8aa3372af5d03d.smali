.class public final Lhc/r;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public synthetic a:Ljava/lang/Object;

.field public final synthetic b:Lhc/s;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/time/LocalDate;


# direct methods
.method public constructor <init>(Lhc/s;Ljava/lang/String;Ljava/time/LocalDate;LLm/c;)V
    .locals 0

    iput-object p1, p0, Lhc/r;->b:Lhc/s;

    iput-object p2, p0, Lhc/r;->c:Ljava/lang/String;

    iput-object p3, p0, Lhc/r;->d:Ljava/time/LocalDate;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p4}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 3

    new-instance v0, Lhc/r;

    iget-object v1, p0, Lhc/r;->c:Ljava/lang/String;

    iget-object v2, p0, Lhc/r;->d:Ljava/time/LocalDate;

    iget-object p0, p0, Lhc/r;->b:Lhc/s;

    invoke-direct {v0, p0, v1, v2, p2}, Lhc/r;-><init>(Lhc/s;Ljava/lang/String;Ljava/time/LocalDate;LLm/c;)V

    iput-object p1, v0, Lhc/r;->a:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, LGa/f;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lhc/r;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lhc/r;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lhc/r;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lhc/r;->a:Ljava/lang/Object;

    check-cast p1, LGa/f;

    iget-object v0, p0, Lhc/r;->b:Lhc/s;

    iget-object v0, v0, Lhc/s;->b:Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;

    iget-object v1, p0, Lhc/r;->c:Ljava/lang/String;

    iget-object p0, p0, Lhc/r;->d:Ljava/time/LocalDate;

    invoke-virtual {v0, v1, p0}, Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;->findFlights(Ljava/lang/String;Ljava/time/LocalDate;)Lzo/l;

    move-result-object p0

    new-instance v0, Lhc/q;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lhc/q;-><init>(LGa/f;LLm/c;)V

    const/4 p1, 0x3

    invoke-static {p0, v1, v0, p1}, LP2/q;->t(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object p0

    return-object p0
.end method
