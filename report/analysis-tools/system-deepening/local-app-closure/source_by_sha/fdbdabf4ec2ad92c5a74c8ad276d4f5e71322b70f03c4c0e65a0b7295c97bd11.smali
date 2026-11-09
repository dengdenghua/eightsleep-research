.class public final Lgd/v;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public a:I

.field public synthetic b:Ljava/lang/Object;

.field public final synthetic c:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:LGa/b;

.field public final synthetic f:LGa/b;

.field public final synthetic g:Ljava/time/LocalTime;


# direct methods
.method public constructor <init>(Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;Ljava/lang/String;LGa/b;LGa/b;Ljava/time/LocalTime;LLm/c;)V
    .locals 0

    iput-object p1, p0, Lgd/v;->c:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;

    iput-object p2, p0, Lgd/v;->d:Ljava/lang/String;

    iput-object p3, p0, Lgd/v;->e:LGa/b;

    iput-object p4, p0, Lgd/v;->f:LGa/b;

    iput-object p5, p0, Lgd/v;->g:Ljava/time/LocalTime;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p6}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 7

    new-instance v0, Lgd/v;

    iget-object v4, p0, Lgd/v;->f:LGa/b;

    iget-object v5, p0, Lgd/v;->g:Ljava/time/LocalTime;

    iget-object v1, p0, Lgd/v;->c:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;

    iget-object v2, p0, Lgd/v;->d:Ljava/lang/String;

    iget-object v3, p0, Lgd/v;->e:LGa/b;

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lgd/v;-><init>(Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;Ljava/lang/String;LGa/b;LGa/b;Ljava/time/LocalTime;LLm/c;)V

    iput-object p1, v0, Lgd/v;->b:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lgd/v;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lgd/v;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lgd/v;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, Lgd/v;->a:I

    iget-object v2, p0, Lgd/v;->c:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;

    iget-object v3, p0, Lgd/v;->d:Ljava/lang/String;

    const/4 v4, 0x1

    if-eqz v1, :cond_1

    if-ne v1, v4, :cond_0

    iget-object p0, p0, Lgd/v;->b:Ljava/lang/Object;

    check-cast p0, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_1

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lgd/v;->b:Ljava/lang/Object;

    check-cast p1, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;

    invoke-static {v2}, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->access$getNapModeSettingsCache$p(Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;)Lrd/e;

    move-result-object v1

    new-instance v5, Lrd/f;

    iget-object v6, p0, Lgd/v;->e:LGa/b;

    iget-object v7, p0, Lgd/v;->f:LGa/b;

    if-eqz v7, :cond_2

    new-instance v8, Ljava/lang/Integer;

    iget v7, v7, LGa/b;->a:I

    invoke-direct {v8, v7}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_0

    :cond_2
    const/4 v8, 0x0

    :goto_0
    iget-object v7, p0, Lgd/v;->g:Ljava/time/LocalTime;

    iget v6, v6, LGa/b;->a:I

    invoke-direct {v5, v3, v6, v8, v7}, Lrd/f;-><init>(Ljava/lang/String;ILjava/lang/Integer;Ljava/time/LocalTime;)V

    iput-object p1, p0, Lgd/v;->b:Ljava/lang/Object;

    iput v4, p0, Lgd/v;->a:I

    invoke-virtual {v1, v5, v3, p0}, Lrd/e;->h(Lrd/f;Ljava/lang/String;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_3

    return-object v0

    :cond_3
    move-object p0, p1

    :goto_1
    invoke-virtual {p0}, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeStatusResponse;->toDomain()Lkd/f;

    move-result-object p0

    invoke-static {v2, v3, p0}, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->access$updateNapStatusForUser(Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;Ljava/lang/String;Lkd/f;)V

    new-instance p1, Lya/g;

    invoke-direct {p1, p0}, Lya/g;-><init>(Ljava/lang/Object;)V

    return-object p1
.end method
