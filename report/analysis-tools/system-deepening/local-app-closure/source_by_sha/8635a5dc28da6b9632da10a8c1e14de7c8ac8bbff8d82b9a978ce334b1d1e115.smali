.class public final Lld/c;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public synthetic a:Ljava/lang/Object;

.field public final synthetic b:Lld/d;


# direct methods
.method public constructor <init>(Lld/d;LLm/c;)V
    .locals 0

    iput-object p1, p0, Lld/c;->b:Lld/d;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 1

    new-instance v0, Lld/c;

    iget-object p0, p0, Lld/c;->b:Lld/d;

    invoke-direct {v0, p0, p2}, Lld/c;-><init>(Lld/d;LLm/c;)V

    iput-object p1, v0, Lld/c;->a:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Ljava/lang/String;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lld/c;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lld/c;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lld/c;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lld/c;->a:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Lld/c;->b:Lld/d;

    iget-object p0, p0, Lld/d;->b:Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;

    invoke-virtual {p0, p1}, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->activateHotFlashMode(Ljava/lang/String;)Lzo/l;

    move-result-object p0

    return-object p0
.end method
