.class public final Lgd/x;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public final synthetic a:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public constructor <init>(LLm/c;Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;Ljava/lang/String;)V
    .locals 0

    iput-object p2, p0, Lgd/x;->a:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;

    iput-object p3, p0, Lgd/x;->b:Ljava/lang/String;

    const/4 p2, 0x2

    invoke-direct {p0, p2, p1}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 1

    new-instance p1, Lgd/x;

    iget-object v0, p0, Lgd/x;->a:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;

    iget-object p0, p0, Lgd/x;->b:Ljava/lang/String;

    invoke-direct {p1, p2, v0, p0}, Lgd/x;-><init>(LLm/c;Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;Ljava/lang/String;)V

    return-object p1
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, LHm/B;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lgd/x;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lgd/x;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lgd/x;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lgd/x;->b:Ljava/lang/String;

    const/4 v0, 0x0

    iget-object p0, p0, Lgd/x;->a:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;

    invoke-static {p0, p1, v0}, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->access$updateNapStatusForUser(Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;Ljava/lang/String;Lkd/f;)V

    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0
.end method
