.class public final Lmd/H;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public synthetic a:Ljava/lang/Object;

.field public final synthetic b:Lmd/I;


# direct methods
.method public constructor <init>(Lmd/I;LLm/c;)V
    .locals 0

    iput-object p1, p0, Lmd/H;->b:Lmd/I;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 1

    new-instance v0, Lmd/H;

    iget-object p0, p0, Lmd/H;->b:Lmd/I;

    invoke-direct {v0, p0, p2}, Lmd/H;-><init>(Lmd/I;LLm/c;)V

    iput-object p1, v0, Lmd/H;->a:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Ljava/lang/String;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lmd/H;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lmd/H;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lmd/H;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lmd/H;->a:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Lmd/H;->b:Lmd/I;

    iget-object v0, p0, Lmd/I;->b:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;

    invoke-virtual {v0, p1}, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->stopNap(Ljava/lang/String;)Lzo/l;

    move-result-object p1

    new-instance v0, Lmd/F;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lmd/F;-><init>(Lmd/I;LLm/c;)V

    new-instance p0, Lzo/x;

    const/4 v2, 0x4

    invoke-direct {p0, p1, v0, v2}, Lzo/x;-><init>(Lzo/l;LVm/n;I)V

    new-instance p1, Lmd/G;

    const/4 v0, 0x2

    invoke-direct {p1, v0, v1}, LNm/i;-><init>(ILLm/c;)V

    invoke-static {p0, p1}, LP2/q;->D(Lzo/l;LVm/n;)LGc/h;

    move-result-object p0

    return-object p0
.end method
