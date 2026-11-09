.class public final Lgd/s;
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

    iput-object p2, p0, Lgd/s;->b:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;

    iput-object p3, p0, Lgd/s;->c:Ljava/lang/String;

    const/4 p2, 0x2

    invoke-direct {p0, p2, p1}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 2

    new-instance v0, Lgd/s;

    iget-object v1, p0, Lgd/s;->b:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;

    iget-object p0, p0, Lgd/s;->c:Ljava/lang/String;

    invoke-direct {v0, p2, v1, p0}, Lgd/s;-><init>(LLm/c;Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;Ljava/lang/String;)V

    iput-object p1, v0, Lgd/s;->a:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lya/j;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lgd/s;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lgd/s;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lgd/s;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lgd/s;->a:Ljava/lang/Object;

    check-cast p1, Lya/j;

    instance-of v0, p1, Lya/e;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    check-cast p1, Lya/e;

    goto :goto_0

    :cond_0
    move-object p1, v1

    :goto_0
    if-eqz p1, :cond_1

    iget-object p1, p1, Lya/e;->b:Ljava/lang/Throwable;

    goto :goto_1

    :cond_1
    move-object p1, v1

    :goto_1
    instance-of v0, p1, Lcom/eightsleep/data_core/exception/EightException;

    if-eqz v0, :cond_2

    check-cast p1, Lcom/eightsleep/data_core/exception/EightException;

    goto :goto_2

    :cond_2
    move-object p1, v1

    :goto_2
    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lcom/eightsleep/data_core/exception/EightException;->a()Z

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_3

    iget-object p1, p0, Lgd/s;->b:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;

    iget-object p0, p0, Lgd/s;->c:Ljava/lang/String;

    invoke-static {p1, p0, v1}, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->access$updateNapStatusForUser(Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;Ljava/lang/String;Lkd/f;)V

    :cond_3
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0
.end method
