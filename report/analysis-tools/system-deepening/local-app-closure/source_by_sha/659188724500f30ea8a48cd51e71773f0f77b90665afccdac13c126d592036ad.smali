.class public final Lgd/m;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public a:I

.field public synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:J


# direct methods
.method public constructor <init>(Ljava/lang/String;JLLm/c;)V
    .locals 0

    iput-object p1, p0, Lgd/m;->c:Ljava/lang/String;

    iput-wide p2, p0, Lgd/m;->d:J

    const/4 p1, 0x2

    invoke-direct {p0, p1, p4}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 4

    new-instance v0, Lgd/m;

    iget-object v1, p0, Lgd/m;->c:Ljava/lang/String;

    iget-wide v2, p0, Lgd/m;->d:J

    invoke-direct {v0, v1, v2, v3, p2}, Lgd/m;-><init>(Ljava/lang/String;JLLm/c;)V

    iput-object p1, v0, Lgd/m;->b:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lfd/a;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lgd/m;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lgd/m;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lgd/m;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, Lgd/m;->a:I

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

    iget-object p1, p0, Lgd/m;->b:Ljava/lang/Object;

    check-cast p1, Lfd/a;

    new-instance v1, Lcom/eightsleep/data_temperature/data/model/napmode/ExtendNapRequest;

    iget-wide v3, p0, Lgd/m;->d:J

    invoke-static {v3, v4}, Lbn/J;->R(J)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/eightsleep/data_temperature/data/model/napmode/ExtendNapRequest;-><init>(Ljava/lang/String;)V

    iput v2, p0, Lgd/m;->a:I

    iget-object v2, p0, Lgd/m;->c:Ljava/lang/String;

    invoke-interface {p1, v2, v1, p0}, Lfd/a;->d(Ljava/lang/String;Lcom/eightsleep/data_temperature/data/model/napmode/ExtendNapRequest;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_2

    return-object v0

    :cond_2
    return-object p0
.end method
