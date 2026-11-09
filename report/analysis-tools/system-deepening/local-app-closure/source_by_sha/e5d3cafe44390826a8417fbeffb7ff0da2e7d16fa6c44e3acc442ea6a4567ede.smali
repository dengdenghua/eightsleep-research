.class public final Lgd/u;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public a:I

.field public synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:LGa/b;

.field public final synthetic e:LGa/b;

.field public final synthetic f:Ljava/time/LocalTime;

.field public final synthetic g:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;LGa/b;LGa/b;Ljava/time/LocalTime;ZLLm/c;)V
    .locals 0

    iput-object p1, p0, Lgd/u;->c:Ljava/lang/String;

    iput-object p2, p0, Lgd/u;->d:LGa/b;

    iput-object p3, p0, Lgd/u;->e:LGa/b;

    iput-object p4, p0, Lgd/u;->f:Ljava/time/LocalTime;

    iput-boolean p5, p0, Lgd/u;->g:Z

    const/4 p1, 0x2

    invoke-direct {p0, p1, p6}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 7

    new-instance v0, Lgd/u;

    iget-object v4, p0, Lgd/u;->f:Ljava/time/LocalTime;

    iget-boolean v5, p0, Lgd/u;->g:Z

    iget-object v1, p0, Lgd/u;->c:Ljava/lang/String;

    iget-object v2, p0, Lgd/u;->d:LGa/b;

    iget-object v3, p0, Lgd/u;->e:LGa/b;

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lgd/u;-><init>(Ljava/lang/String;LGa/b;LGa/b;Ljava/time/LocalTime;ZLLm/c;)V

    iput-object p1, v0, Lgd/u;->b:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lfd/a;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lgd/u;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lgd/u;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lgd/u;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, Lgd/u;->a:I

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    if-ne v1, v2, :cond_0

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    return-object p1

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lgd/u;->b:Ljava/lang/Object;

    check-cast p1, Lfd/a;

    new-instance v1, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;

    new-instance v3, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;

    iget-object v4, p0, Lgd/u;->d:LGa/b;

    iget-object v5, p0, Lgd/u;->e:LGa/b;

    if-eqz v5, :cond_2

    new-instance v6, Ljava/lang/Integer;

    iget v5, v5, LGa/b;->a:I

    invoke-direct {v6, v5}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_0

    :cond_2
    const/4 v6, 0x0

    :goto_0
    iget v4, v4, LGa/b;->a:I

    invoke-direct {v3, v4, v6}, Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;-><init>(ILjava/lang/Integer;)V

    iget-object v4, p0, Lgd/u;->f:Ljava/time/LocalTime;

    iget-boolean v5, p0, Lgd/u;->g:Z

    invoke-direct {v1, v3, v4, v5}, Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;-><init>(Lcom/eightsleep/data_temperature/data/model/napmode/NapModeLevelsNetworkModel;Ljava/time/LocalTime;Z)V

    iput v2, p0, Lgd/u;->a:I

    iget-object v2, p0, Lgd/u;->c:Ljava/lang/String;

    invoke-interface {p1, v2, v1, p0}, Lfd/a;->c(Ljava/lang/String;Lcom/eightsleep/data_temperature/data/model/napmode/StartNapRequest;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_3

    return-object v0

    :cond_3
    return-object p0
.end method
