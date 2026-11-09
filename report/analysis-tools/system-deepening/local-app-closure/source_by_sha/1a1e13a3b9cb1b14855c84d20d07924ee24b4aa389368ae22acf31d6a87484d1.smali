.class public final Lgd/n;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public synthetic a:Ljava/lang/Object;

.field public final synthetic b:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public constructor <init>(LLm/c;Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;Ljava/lang/String;)V
    .locals 0

    iput-object p2, p0, Lgd/n;->b:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;

    iput-object p3, p0, Lgd/n;->c:Ljava/lang/String;

    const/4 p2, 0x2

    invoke-direct {p0, p2, p1}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 2

    new-instance v0, Lgd/n;

    iget-object v1, p0, Lgd/n;->b:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;

    iget-object p0, p0, Lgd/n;->c:Ljava/lang/String;

    invoke-direct {v0, p2, v1, p0}, Lgd/n;-><init>(LLm/c;Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;Ljava/lang/String;)V

    iput-object p1, v0, Lgd/n;->a:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lgd/n;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lgd/n;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lgd/n;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lgd/n;->a:Ljava/lang/Object;

    check-cast p1, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;

    invoke-virtual {p1}, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->toDomain()Lkd/f;

    move-result-object p1

    iget-object v0, p0, Lgd/n;->b:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;

    iget-object p0, p0, Lgd/n;->c:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->access$updateNapStatusForUser(Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;Ljava/lang/String;Lkd/f;)V

    return-object p1
.end method
