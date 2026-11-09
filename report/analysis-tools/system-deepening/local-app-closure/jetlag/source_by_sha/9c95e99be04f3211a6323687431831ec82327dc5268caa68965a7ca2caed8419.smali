.class public final Lhc/Z;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public synthetic a:Ljava/lang/Object;

.field public final synthetic b:Lhc/a0;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/eightsleep/data_jetlag/enums/TripStatus;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/util/List;


# direct methods
.method public constructor <init>(Lhc/a0;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/TripStatus;Ljava/lang/String;Ljava/util/List;LLm/c;)V
    .locals 0

    iput-object p1, p0, Lhc/Z;->b:Lhc/a0;

    iput-object p2, p0, Lhc/Z;->c:Ljava/lang/String;

    iput-object p3, p0, Lhc/Z;->d:Lcom/eightsleep/data_jetlag/enums/TripStatus;

    iput-object p4, p0, Lhc/Z;->e:Ljava/lang/String;

    iput-object p5, p0, Lhc/Z;->f:Ljava/util/List;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p6}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 7

    new-instance v0, Lhc/Z;

    iget-object v4, p0, Lhc/Z;->e:Ljava/lang/String;

    iget-object v5, p0, Lhc/Z;->f:Ljava/util/List;

    iget-object v1, p0, Lhc/Z;->b:Lhc/a0;

    iget-object v2, p0, Lhc/Z;->c:Ljava/lang/String;

    iget-object v3, p0, Lhc/Z;->d:Lcom/eightsleep/data_jetlag/enums/TripStatus;

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lhc/Z;-><init>(Lhc/a0;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/TripStatus;Ljava/lang/String;Ljava/util/List;LLm/c;)V

    iput-object p1, v0, Lhc/Z;->a:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, LHm/k;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lhc/Z;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lhc/Z;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lhc/Z;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lhc/Z;->a:Ljava/lang/Object;

    check-cast p1, LHm/k;

    iget-object v0, p1, LHm/k;->a:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Ljava/lang/String;

    iget-object p1, p1, LHm/k;->b:Ljava/lang/Object;

    check-cast p1, LGa/f;

    iget-object v0, p0, Lhc/Z;->b:Lhc/a0;

    iget-object v1, v0, Lhc/a0;->c:Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;

    iget-object v3, p0, Lhc/Z;->c:Ljava/lang/String;

    iget-object v4, p0, Lhc/Z;->d:Lcom/eightsleep/data_jetlag/enums/TripStatus;

    iget-object v5, p0, Lhc/Z;->e:Ljava/lang/String;

    iget-object v6, p0, Lhc/Z;->f:Ljava/util/List;

    invoke-virtual/range {v1 .. v6}, Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;->updateTrip(Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/TripStatus;Ljava/lang/String;Ljava/util/List;)Lzo/l;

    move-result-object p0

    new-instance v0, Lhc/Y;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lhc/Y;-><init>(LGa/f;LLm/c;)V

    const/4 p1, 0x3

    invoke-static {p0, v1, v0, p1}, LP2/q;->t(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object p0

    return-object p0
.end method
