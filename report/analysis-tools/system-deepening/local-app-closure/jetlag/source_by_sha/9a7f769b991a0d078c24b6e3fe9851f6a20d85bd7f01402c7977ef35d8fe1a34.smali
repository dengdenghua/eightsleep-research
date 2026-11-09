.class public final Lhc/m;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public synthetic a:Ljava/lang/Object;

.field public final synthetic b:Lhc/n;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lhc/n;Ljava/lang/String;LLm/c;)V
    .locals 0

    iput-object p1, p0, Lhc/m;->b:Lhc/n;

    iput-object p2, p0, Lhc/m;->c:Ljava/lang/String;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 2

    new-instance v0, Lhc/m;

    iget-object v1, p0, Lhc/m;->b:Lhc/n;

    iget-object p0, p0, Lhc/m;->c:Ljava/lang/String;

    invoke-direct {v0, v1, p0, p2}, Lhc/m;-><init>(Lhc/n;Ljava/lang/String;LLm/c;)V

    iput-object p1, v0, Lhc/m;->a:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Ljava/lang/String;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lhc/m;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lhc/m;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lhc/m;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lhc/m;->a:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    iget-object v0, p0, Lhc/m;->b:Lhc/n;

    iget-object v0, v0, Lhc/n;->b:Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;

    iget-object p0, p0, Lhc/m;->c:Ljava/lang/String;

    invoke-virtual {v0, p1, p0}, Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;->deleteTrip(Ljava/lang/String;Ljava/lang/String;)Lzo/l;

    move-result-object p0

    return-object p0
.end method
