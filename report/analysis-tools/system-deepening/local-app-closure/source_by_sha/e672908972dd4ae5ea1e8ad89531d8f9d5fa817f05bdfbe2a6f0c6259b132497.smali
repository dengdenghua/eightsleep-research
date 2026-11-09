.class public final Lld/W0;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public synthetic a:Ljava/lang/Object;

.field public final synthetic b:Lld/X0;

.field public final synthetic c:Ljd/c;


# direct methods
.method public constructor <init>(Lld/X0;Ljd/c;LLm/c;)V
    .locals 0

    iput-object p1, p0, Lld/W0;->b:Lld/X0;

    iput-object p2, p0, Lld/W0;->c:Ljd/c;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 2

    new-instance v0, Lld/W0;

    iget-object v1, p0, Lld/W0;->b:Lld/X0;

    iget-object p0, p0, Lld/W0;->c:Ljd/c;

    invoke-direct {v0, v1, p0, p2}, Lld/W0;-><init>(Lld/X0;Ljd/c;LLm/c;)V

    iput-object p1, v0, Lld/W0;->a:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Ljava/lang/String;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lld/W0;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lld/W0;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lld/W0;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lld/W0;->a:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    iget-object v0, p0, Lld/W0;->b:Lld/X0;

    iget-object v0, v0, Lld/X0;->b:Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;

    iget-object p0, p0, Lld/W0;->c:Ljd/c;

    invoke-virtual {v0, p1, p0}, Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;->updateHotFlashModeSettings(Ljava/lang/String;Ljd/c;)Lzo/l;

    move-result-object p0

    return-object p0
.end method
