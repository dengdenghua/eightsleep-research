.class public final LHb/h;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/o;


# instance fields
.field public final synthetic a:I

.field public b:I

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public final synthetic f:Ljava/lang/Object;

.field public final synthetic g:Ljava/lang/Object;


# direct methods
.method public constructor <init>(LLm/c;LVm/k;LVm/k;LVm/n;)V
    .locals 1

    const/4 v0, 0x7

    iput v0, p0, LHb/h;->a:I

    .line 1
    iput-object p2, p0, LHb/h;->e:Ljava/lang/Object;

    iput-object p3, p0, LHb/h;->f:Ljava/lang/Object;

    check-cast p4, LNm/i;

    iput-object p4, p0, LHb/h;->g:Ljava/lang/Object;

    const/4 p2, 0x3

    invoke-direct {p0, p2, p1}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method

.method public constructor <init>(LLm/c;LVm/k;LVm/n;Lzo/l;)V
    .locals 1

    const/16 v0, 0x8

    iput v0, p0, LHb/h;->a:I

    .line 2
    iput-object p2, p0, LHb/h;->e:Ljava/lang/Object;

    check-cast p3, LNm/i;

    iput-object p3, p0, LHb/h;->f:Ljava/lang/Object;

    iput-object p4, p0, LHb/h;->g:Ljava/lang/Object;

    const/4 p2, 0x3

    invoke-direct {p0, p2, p1}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method

.method public constructor <init>(LLm/c;Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x3

    iput v0, p0, LHb/h;->a:I

    .line 3
    iput-object p2, p0, LHb/h;->e:Ljava/lang/Object;

    iput-object p3, p0, LHb/h;->f:Ljava/lang/Object;

    iput-object p4, p0, LHb/h;->g:Ljava/lang/Object;

    const/4 p2, 0x3

    invoke-direct {p0, p2, p1}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method

.method public constructor <init>(LYa/B;Ljava/lang/Object;LLm/c;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, LHb/h;->a:I

    .line 4
    iput-object p1, p0, LHb/h;->f:Ljava/lang/Object;

    iput-object p2, p0, LHb/h;->g:Ljava/lang/Object;

    const/4 p1, 0x3

    invoke-direct {p0, p1, p3}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method

.method public constructor <init>(Lcom/eightsleep/data_metrics/data/repository/MetricsTrendsRepository;Ljava/lang/String;Ljava/time/LocalDate;LLm/c;)V
    .locals 1

    const/4 v0, 0x6

    iput v0, p0, LHb/h;->a:I

    .line 5
    iput-object p1, p0, LHb/h;->f:Ljava/lang/Object;

    iput-object p2, p0, LHb/h;->g:Ljava/lang/Object;

    iput-object p3, p0, LHb/h;->e:Ljava/lang/Object;

    const/4 p1, 0x3

    invoke-direct {p0, p1, p4}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;LLm/c;I)V
    .locals 0

    .line 6
    iput p5, p0, LHb/h;->a:I

    iput-object p1, p0, LHb/h;->e:Ljava/lang/Object;

    iput-object p2, p0, LHb/h;->f:Ljava/lang/Object;

    iput-object p3, p0, LHb/h;->g:Ljava/lang/Object;

    const/4 p1, 0x3

    invoke-direct {p0, p1, p4}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/time/LocalDate;Lcom/eightsleep/data_metrics/data/model/MenopauseTreatmentPatch;LLm/c;)V
    .locals 1

    const/4 v0, 0x5

    iput v0, p0, LHb/h;->a:I

    .line 7
    iput-object p1, p0, LHb/h;->f:Ljava/lang/Object;

    iput-object p2, p0, LHb/h;->e:Ljava/lang/Object;

    iput-object p3, p0, LHb/h;->g:Ljava/lang/Object;

    const/4 p1, 0x3

    invoke-direct {p0, p1, p4}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    iget v0, p0, LHb/h;->a:I

    packed-switch v0, :pswitch_data_0

    check-cast p1, Lzo/m;

    check-cast p3, LLm/c;

    new-instance v0, LHb/h;

    iget-object v1, p0, LHb/h;->f:Ljava/lang/Object;

    check-cast v1, LNm/i;

    iget-object v2, p0, LHb/h;->g:Ljava/lang/Object;

    check-cast v2, Lzo/l;

    iget-object p0, p0, LHb/h;->e:Ljava/lang/Object;

    check-cast p0, LVm/k;

    invoke-direct {v0, p3, p0, v1, v2}, LHb/h;-><init>(LLm/c;LVm/k;LVm/n;Lzo/l;)V

    iput-object p1, v0, LHb/h;->c:Ljava/lang/Object;

    iput-object p2, v0, LHb/h;->d:Ljava/lang/Object;

    sget-object p0, LHm/B;->a:LHm/B;

    invoke-virtual {v0, p0}, LHb/h;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_0
    check-cast p1, Lzo/m;

    check-cast p3, LLm/c;

    new-instance v0, LHb/h;

    iget-object v1, p0, LHb/h;->g:Ljava/lang/Object;

    check-cast v1, LNm/i;

    iget-object v2, p0, LHb/h;->f:Ljava/lang/Object;

    check-cast v2, LVm/k;

    iget-object p0, p0, LHb/h;->e:Ljava/lang/Object;

    check-cast p0, LVm/k;

    invoke-direct {v0, p3, p0, v2, v1}, LHb/h;-><init>(LLm/c;LVm/k;LVm/k;LVm/n;)V

    iput-object p1, v0, LHb/h;->c:Ljava/lang/Object;

    iput-object p2, v0, LHb/h;->d:Ljava/lang/Object;

    sget-object p0, LHm/B;->a:LHm/B;

    invoke-virtual {v0, p0}, LHb/h;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1
    check-cast p1, Lzo/m;

    check-cast p2, Lzc/c;

    check-cast p3, LLm/c;

    new-instance v0, LHb/h;

    iget-object v1, p0, LHb/h;->e:Ljava/lang/Object;

    check-cast v1, Ljava/time/LocalDate;

    iget-object v2, p0, LHb/h;->f:Ljava/lang/Object;

    check-cast v2, Lcom/eightsleep/data_metrics/data/repository/MetricsTrendsRepository;

    iget-object p0, p0, LHb/h;->g:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-direct {v0, v2, p0, v1, p3}, LHb/h;-><init>(Lcom/eightsleep/data_metrics/data/repository/MetricsTrendsRepository;Ljava/lang/String;Ljava/time/LocalDate;LLm/c;)V

    iput-object p1, v0, LHb/h;->c:Ljava/lang/Object;

    iput-object p2, v0, LHb/h;->d:Ljava/lang/Object;

    sget-object p0, LHm/B;->a:LHm/B;

    invoke-virtual {v0, p0}, LHb/h;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_2
    check-cast p1, Loc/a;

    check-cast p2, Ljava/lang/String;

    check-cast p3, LLm/c;

    new-instance v0, LHb/h;

    iget-object v1, p0, LHb/h;->g:Ljava/lang/Object;

    check-cast v1, Lcom/eightsleep/data_metrics/data/model/MenopauseTreatmentPatch;

    iget-object v2, p0, LHb/h;->f:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object p0, p0, LHb/h;->e:Ljava/lang/Object;

    check-cast p0, Ljava/time/LocalDate;

    invoke-direct {v0, v2, p0, v1, p3}, LHb/h;-><init>(Ljava/lang/String;Ljava/time/LocalDate;Lcom/eightsleep/data_metrics/data/model/MenopauseTreatmentPatch;LLm/c;)V

    iput-object p1, v0, LHb/h;->c:Ljava/lang/Object;

    iput-object p2, v0, LHb/h;->d:Ljava/lang/Object;

    sget-object p0, LHm/B;->a:LHm/B;

    invoke-virtual {v0, p0}, LHb/h;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_3
    check-cast p1, Loc/a;

    check-cast p2, Ljava/lang/String;

    move-object v4, p3

    check-cast v4, LLm/c;

    new-instance v0, LHb/h;

    iget-object p3, p0, LHb/h;->g:Ljava/lang/Object;

    move-object v3, p3

    check-cast v3, Ljava/time/ZoneId;

    iget-object p3, p0, LHb/h;->e:Ljava/lang/Object;

    move-object v1, p3

    check-cast v1, Ljava/time/LocalDate;

    iget-object p0, p0, LHb/h;->f:Ljava/lang/Object;

    move-object v2, p0

    check-cast v2, Ljava/time/LocalDate;

    const/4 v5, 0x4

    invoke-direct/range {v0 .. v5}, LHb/h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;LLm/c;I)V

    iput-object p1, v0, LHb/h;->c:Ljava/lang/Object;

    iput-object p2, v0, LHb/h;->d:Ljava/lang/Object;

    sget-object p0, LHm/B;->a:LHm/B;

    invoke-virtual {v0, p0}, LHb/h;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_4
    check-cast p1, Lzo/m;

    check-cast p3, LLm/c;

    new-instance v0, LHb/h;

    iget-object v1, p0, LHb/h;->g:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, LHb/h;->e:Ljava/lang/Object;

    check-cast v2, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;

    iget-object p0, p0, LHb/h;->f:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-direct {v0, p3, v2, p0, v1}, LHb/h;-><init>(LLm/c;Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;Ljava/lang/String;Ljava/lang/String;)V

    iput-object p1, v0, LHb/h;->c:Ljava/lang/Object;

    iput-object p2, v0, LHb/h;->d:Ljava/lang/Object;

    sget-object p0, LHm/B;->a:LHm/B;

    invoke-virtual {v0, p0}, LHb/h;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_5
    check-cast p1, Lzo/m;

    check-cast p2, Ljava/lang/Throwable;

    check-cast p3, LLm/c;

    new-instance p1, LHb/h;

    iget-object p2, p0, LHb/h;->f:Ljava/lang/Object;

    check-cast p2, LYa/B;

    iget-object p0, p0, LHb/h;->g:Ljava/lang/Object;

    invoke-direct {p1, p2, p0, p3}, LHb/h;-><init>(LYa/B;Ljava/lang/Object;LLm/c;)V

    sget-object p0, LHm/B;->a:LHm/B;

    invoke-virtual {p1, p0}, LHb/h;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_6
    check-cast p1, Lzo/m;

    check-cast p2, Ljava/lang/Throwable;

    move-object v4, p3

    check-cast v4, LLm/c;

    new-instance v0, LHb/h;

    iget-object p3, p0, LHb/h;->f:Ljava/lang/Object;

    move-object v2, p3

    check-cast v2, Ljava/lang/String;

    iget-object p3, p0, LHb/h;->e:Ljava/lang/Object;

    move-object v1, p3

    check-cast v1, LKa/c;

    iget-object p0, p0, LHb/h;->g:Ljava/lang/Object;

    move-object v3, p0

    check-cast v3, LNa/b;

    const/4 v5, 0x1

    invoke-direct/range {v0 .. v5}, LHb/h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;LLm/c;I)V

    iput-object p1, v0, LHb/h;->c:Ljava/lang/Object;

    iput-object p2, v0, LHb/h;->d:Ljava/lang/Object;

    sget-object p0, LHm/B;->a:LHm/B;

    invoke-virtual {v0, p0}, LHb/h;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_7
    check-cast p1, Lzo/m;

    check-cast p2, Ljava/lang/Throwable;

    move-object v4, p3

    check-cast v4, LLm/c;

    new-instance v0, LHb/h;

    iget-object p3, p0, LHb/h;->g:Ljava/lang/Object;

    move-object v3, p3

    check-cast v3, Lcom/eightsleep/data_home/data/repository/WeeklyRecapRepository;

    iget-object p3, p0, LHb/h;->e:Ljava/lang/Object;

    move-object v1, p3

    check-cast v1, Ljava/time/LocalDate;

    iget-object p0, p0, LHb/h;->f:Ljava/lang/Object;

    move-object v2, p0

    check-cast v2, Ljava/time/LocalDate;

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, LHb/h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;LLm/c;I)V

    iput-object p1, v0, LHb/h;->c:Ljava/lang/Object;

    iput-object p2, v0, LHb/h;->d:Ljava/lang/Object;

    sget-object p0, LHm/B;->a:LHm/B;

    invoke-virtual {v0, p0}, LHb/h;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12

    iget v0, p0, LHb/h;->a:I

    packed-switch v0, :pswitch_data_0

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, LHb/h;->b:I

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eqz v1, :cond_2

    if-eq v1, v3, :cond_1

    if-ne v1, v2, :cond_0

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto/16 :goto_2

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    iget-object v1, p0, LHb/h;->c:Ljava/lang/Object;

    check-cast v1, Lzo/m;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, LHb/h;->c:Ljava/lang/Object;

    move-object v1, p1

    check-cast v1, Lzo/m;

    iget-object p1, p0, LHb/h;->d:Ljava/lang/Object;

    check-cast p1, Lya/j;

    instance-of v4, p1, Lya/f;

    if-eqz v4, :cond_3

    sget-object p1, Lya/f;->b:Lya/f;

    new-instance v3, LJ8/e;

    const/16 v4, 0x9

    invoke-direct {v3, p1, v4}, LJ8/e;-><init>(Ljava/lang/Object;I)V

    goto :goto_1

    :cond_3
    instance-of v4, p1, Lya/e;

    if-eqz v4, :cond_4

    new-instance v3, Lya/e;

    check-cast p1, Lya/e;

    iget-object p1, p1, Lya/e;->b:Ljava/lang/Throwable;

    invoke-direct {v3, p1}, Lya/e;-><init>(Ljava/lang/Throwable;)V

    new-instance p1, LJ8/e;

    const/16 v4, 0x9

    invoke-direct {p1, v3, v4}, LJ8/e;-><init>(Ljava/lang/Object;I)V

    move-object v3, p1

    goto :goto_1

    :cond_4
    instance-of v4, p1, Lya/g;

    if-eqz v4, :cond_8

    check-cast p1, Lya/g;

    iget-object v4, p1, Lya/g;->b:Ljava/lang/Object;

    iget-object v5, p0, LHb/h;->e:Ljava/lang/Object;

    check-cast v5, LVm/k;

    invoke-interface {v5, v4}, LVm/k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_6

    iput-object v1, p0, LHb/h;->c:Ljava/lang/Object;

    iput v3, p0, LHb/h;->b:I

    iget-object v3, p0, LHb/h;->f:Ljava/lang/Object;

    check-cast v3, LNm/i;

    iget-object p1, p1, Lya/g;->b:Ljava/lang/Object;

    invoke-interface {v3, p1, p0}, LVm/n;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_5

    goto :goto_3

    :cond_5
    :goto_0
    move-object v3, p1

    check-cast v3, Lzo/l;

    goto :goto_1

    :cond_6
    new-instance p1, Lya/e;

    new-instance v3, Ljava/lang/Throwable;

    const-string v4, "Data failed predicate check"

    invoke-direct {v3, v4}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, v3}, Lya/e;-><init>(Ljava/lang/Throwable;)V

    new-instance v3, LJ8/e;

    const/16 v4, 0x9

    invoke-direct {v3, p1, v4}, LJ8/e;-><init>(Ljava/lang/Object;I)V

    :goto_1
    const/4 p1, 0x0

    iput-object p1, p0, LHb/h;->c:Ljava/lang/Object;

    iput v2, p0, LHb/h;->b:I

    invoke-static {v1, v3, p0}, Lzo/s;->r(Lzo/m;Lzo/l;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_7

    goto :goto_3

    :cond_7
    :goto_2
    sget-object v0, LHm/B;->a:LHm/B;

    :goto_3
    return-object v0

    :cond_8
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0

    :pswitch_0
    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, LHb/h;->b:I

    const/4 v2, 0x1

    if-eqz v1, :cond_a

    if-ne v1, v2, :cond_9

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_4

    :cond_9
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_a
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, LHb/h;->c:Ljava/lang/Object;

    check-cast p1, Lzo/m;

    iget-object v1, p0, LHb/h;->d:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Lya/j;

    new-instance v3, Lya/o;

    iget-object v1, p0, LHb/h;->g:Ljava/lang/Object;

    move-object v7, v1

    check-cast v7, LNm/i;

    iget-object v1, p0, LHb/h;->f:Ljava/lang/Object;

    move-object v6, v1

    check-cast v6, LVm/k;

    iget-object v1, p0, LHb/h;->e:Ljava/lang/Object;

    move-object v5, v1

    check-cast v5, LVm/k;

    const/4 v8, 0x0

    invoke-direct/range {v3 .. v8}, Lya/o;-><init>(Lya/j;LVm/k;LVm/k;LVm/n;LLm/c;)V

    new-instance v1, Lzo/u0;

    invoke-direct {v1, v3}, Lzo/u0;-><init>(LVm/n;)V

    iput v2, p0, LHb/h;->b:I

    invoke-static {p1, v1, p0}, Lzo/s;->r(Lzo/m;Lzo/l;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_b

    goto :goto_5

    :cond_b
    :goto_4
    sget-object v0, LHm/B;->a:LHm/B;

    :goto_5
    return-object v0

    :pswitch_1
    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, LHb/h;->b:I

    iget-object v2, p0, LHb/h;->e:Ljava/lang/Object;

    move-object v6, v2

    check-cast v6, Ljava/time/LocalDate;

    iget-object v2, p0, LHb/h;->g:Ljava/lang/Object;

    move-object v5, v2

    check-cast v5, Ljava/lang/String;

    iget-object v2, p0, LHb/h;->f:Ljava/lang/Object;

    move-object v3, v2

    check-cast v3, Lcom/eightsleep/data_metrics/data/repository/MetricsTrendsRepository;

    const/4 v2, 0x5

    const/4 v4, 0x4

    const/4 v10, 0x3

    const/4 v7, 0x2

    const/4 v8, 0x1

    const/4 v11, 0x0

    if-eqz v1, :cond_10

    if-eq v1, v8, :cond_f

    if-eq v1, v7, :cond_e

    if-eq v1, v10, :cond_d

    if-eq v1, v4, :cond_d

    if-ne v1, v2, :cond_c

    goto :goto_6

    :cond_c
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_d
    :goto_6
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto/16 :goto_9

    :cond_e
    iget-object v1, p0, LHb/h;->c:Ljava/lang/Object;

    check-cast v1, Lzo/m;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    move-object v7, p0

    goto :goto_8

    :cond_f
    iget-object v1, p0, LHb/h;->c:Ljava/lang/Object;

    check-cast v1, Lzo/m;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_7

    :cond_10
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, LHb/h;->c:Ljava/lang/Object;

    check-cast p1, Lzo/m;

    iget-object v1, p0, LHb/h;->d:Ljava/lang/Object;

    check-cast v1, Lzc/c;

    if-nez v1, :cond_13

    sget-object v1, Lya/f;->b:Lya/f;

    iput-object p1, p0, LHb/h;->c:Ljava/lang/Object;

    iput v8, p0, LHb/h;->b:I

    invoke-interface {p1, v1, p0}, Lzo/m;->emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_11

    goto :goto_a

    :cond_11
    move-object v1, p1

    :goto_7
    invoke-static {}, Ljava/time/ZoneId;->systemDefault()Ljava/time/ZoneId;

    move-result-object v8

    const-string p1, "systemDefault(...)"

    invoke-static {v8, p1}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v1, p0, LHb/h;->c:Ljava/lang/Object;

    iput v7, p0, LHb/h;->b:I

    const/4 v9, 0x0

    move-object v7, v6

    move-object v4, p0

    invoke-virtual/range {v3 .. v9}, Lcom/eightsleep/data_metrics/data/repository/MetricsTrendsRepository;->a(LLm/c;Ljava/lang/String;Ljava/time/LocalDate;Ljava/time/LocalDate;Ljava/time/ZoneId;Z)Ljava/lang/Object;

    move-result-object p1

    move-object v7, v4

    if-ne p1, v0, :cond_12

    goto :goto_a

    :cond_12
    :goto_8
    check-cast p1, Lzo/l;

    new-instance p0, Ld9/E;

    const/16 v2, 0x15

    invoke-direct {p0, v1, v2}, Ld9/E;-><init>(Lzo/m;I)V

    iput-object v11, v7, LHb/h;->c:Ljava/lang/Object;

    iput v10, v7, LHb/h;->b:I

    invoke-interface {p1, p0, v7}, Lzo/l;->collect(Lzo/m;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_15

    goto :goto_a

    :cond_13
    move-object v7, p0

    invoke-virtual {v1}, Lzc/c;->b()Z

    move-result p0

    iget-object v1, v1, Lzc/c;->d:Lcom/eightsleep/data_metrics/domain/model/RawDailyTrends;

    if-eqz p0, :cond_14

    invoke-static {v3, v5, v6, v6}, Lcom/eightsleep/data_metrics/data/repository/MetricsTrendsRepository;->access$fetchTrendsFireAndForget(Lcom/eightsleep/data_metrics/data/repository/MetricsTrendsRepository;Ljava/lang/String;Ljava/time/LocalDate;Ljava/time/LocalDate;)V

    new-instance p0, Lya/g;

    invoke-direct {p0, v1}, Lya/g;-><init>(Ljava/lang/Object;)V

    iput-object v11, v7, LHb/h;->c:Ljava/lang/Object;

    iput v4, v7, LHb/h;->b:I

    invoke-interface {p1, p0, v7}, Lzo/m;->emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_15

    goto :goto_a

    :cond_14
    new-instance p0, Lya/g;

    invoke-direct {p0, v1}, Lya/g;-><init>(Ljava/lang/Object;)V

    iput-object v11, v7, LHb/h;->c:Ljava/lang/Object;

    iput v2, v7, LHb/h;->b:I

    invoke-interface {p1, p0, v7}, Lzo/m;->emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_15

    goto :goto_a

    :cond_15
    :goto_9
    sget-object v0, LHm/B;->a:LHm/B;

    :goto_a
    return-object v0

    :pswitch_2
    move-object v7, p0

    sget-object p0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v0, v7, LHb/h;->b:I

    const/4 v1, 0x1

    if-eqz v0, :cond_17

    if-ne v0, v1, :cond_16

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_b

    :cond_16
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_17
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, v7, LHb/h;->c:Ljava/lang/Object;

    move-object v2, p1

    check-cast v2, Loc/a;

    iget-object p1, v7, LHb/h;->d:Ljava/lang/Object;

    move-object v3, p1

    check-cast v3, Ljava/lang/String;

    const/4 p1, 0x0

    iput-object p1, v7, LHb/h;->c:Ljava/lang/Object;

    iput v1, v7, LHb/h;->b:I

    iget-object p1, v7, LHb/h;->g:Ljava/lang/Object;

    move-object v6, p1

    check-cast v6, Lcom/eightsleep/data_metrics/data/model/MenopauseTreatmentPatch;

    iget-object p1, v7, LHb/h;->f:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Ljava/lang/String;

    iget-object p1, v7, LHb/h;->e:Ljava/lang/Object;

    move-object v5, p1

    check-cast v5, Ljava/time/LocalDate;

    invoke-interface/range {v2 .. v7}, Loc/a;->g(Ljava/lang/String;Ljava/lang/String;Ljava/time/LocalDate;Lcom/eightsleep/data_metrics/data/model/MenopauseTreatmentPatch;LLm/c;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, p0, :cond_18

    move-object p1, p0

    :cond_18
    :goto_b
    return-object p1

    :pswitch_3
    move-object v7, p0

    sget-object p0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v0, v7, LHb/h;->b:I

    const/4 v1, 0x1

    if-eqz v0, :cond_1a

    if-ne v0, v1, :cond_19

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_c

    :cond_19
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1a
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, v7, LHb/h;->c:Ljava/lang/Object;

    move-object v2, p1

    check-cast v2, Loc/a;

    iget-object p1, v7, LHb/h;->d:Ljava/lang/Object;

    move-object v3, p1

    check-cast v3, Ljava/lang/String;

    const/4 p1, 0x0

    iput-object p1, v7, LHb/h;->c:Ljava/lang/Object;

    iput v1, v7, LHb/h;->b:I

    iget-object p1, v7, LHb/h;->e:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Ljava/time/LocalDate;

    iget-object p1, v7, LHb/h;->g:Ljava/lang/Object;

    move-object v6, p1

    check-cast v6, Ljava/time/ZoneId;

    move-object v9, v7

    const-string v7, "sleep,sleep.sum"

    const-string v8, "day"

    iget-object p1, v9, LHb/h;->f:Ljava/lang/Object;

    move-object v5, p1

    check-cast v5, Ljava/time/LocalDate;

    invoke-interface/range {v2 .. v9}, Loc/a;->i(Ljava/lang/String;Ljava/time/LocalDate;Ljava/time/LocalDate;Ljava/time/ZoneId;Ljava/lang/String;Ljava/lang/String;LLm/c;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, p0, :cond_1b

    move-object p1, p0

    :cond_1b
    :goto_c
    return-object p1

    :pswitch_4
    move-object v7, p0

    sget-object p0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v0, v7, LHb/h;->b:I

    const/4 v1, 0x1

    if-eqz v0, :cond_1d

    if-ne v0, v1, :cond_1c

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_e

    :cond_1c
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1d
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, v7, LHb/h;->c:Ljava/lang/Object;

    check-cast p1, Lzo/m;

    iget-object v0, v7, LHb/h;->d:Ljava/lang/Object;

    check-cast v0, Lgc/j;

    if-nez v0, :cond_1e

    iget-object v0, v7, LHb/h;->f:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v2, v7, LHb/h;->g:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v3, v7, LHb/h;->e:Ljava/lang/Object;

    check-cast v3, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;

    invoke-virtual {v3, v0, v2, v1}, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;->getPlan(Ljava/lang/String;Ljava/lang/String;Z)Lzo/l;

    move-result-object v0

    goto :goto_d

    :cond_1e
    new-instance v2, Lya/g;

    invoke-direct {v2, v0}, Lya/g;-><init>(Ljava/lang/Object;)V

    new-instance v0, LJ8/e;

    const/16 v3, 0x9

    invoke-direct {v0, v2, v3}, LJ8/e;-><init>(Ljava/lang/Object;I)V

    :goto_d
    iput v1, v7, LHb/h;->b:I

    invoke-static {p1, v0, v7}, Lzo/s;->r(Lzo/m;Lzo/l;LLm/c;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, p0, :cond_1f

    goto :goto_f

    :cond_1f
    :goto_e
    sget-object p0, LHm/B;->a:LHm/B;

    :goto_f
    return-object p0

    :pswitch_5
    move-object v7, p0

    sget-object p0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v0, v7, LHb/h;->b:I

    const/4 v1, 0x1

    if-eqz v0, :cond_21

    if-ne v0, v1, :cond_20

    iget-object p0, v7, LHb/h;->e:Ljava/lang/Object;

    iget-object v0, v7, LHb/h;->d:Ljava/lang/Object;

    check-cast v0, LYa/B;

    iget-object v1, v7, LHb/h;->c:Ljava/lang/Object;

    check-cast v1, LGo/c;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_10

    :cond_20
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_21
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, v7, LHb/h;->f:Ljava/lang/Object;

    move-object v0, p1

    check-cast v0, LYa/B;

    iget-object p1, v0, LYa/B;->e:LGo/c;

    iput-object p1, v7, LHb/h;->c:Ljava/lang/Object;

    iput-object v0, v7, LHb/h;->d:Ljava/lang/Object;

    iget-object v2, v7, LHb/h;->g:Ljava/lang/Object;

    iput-object v2, v7, LHb/h;->e:Ljava/lang/Object;

    iput v1, v7, LHb/h;->b:I

    invoke-virtual {p1, v7}, LGo/c;->e(LLm/c;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p0, :cond_22

    goto :goto_11

    :cond_22
    move-object v1, p1

    move-object p0, v2

    :goto_10
    const/4 p1, 0x0

    :try_start_0
    iget-object v0, v0, LYa/B;->d:Ljava/util/LinkedHashMap;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v1, p1}, LGo/c;->g(Ljava/lang/Object;)V

    sget-object p0, LHm/B;->a:LHm/B;

    :goto_11
    return-object p0

    :catchall_0
    move-exception v0

    move-object p0, v0

    invoke-virtual {v1, p1}, LGo/c;->g(Ljava/lang/Object;)V

    throw p0

    :pswitch_6
    move-object v7, p0

    sget-object p0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v0, v7, LHb/h;->b:I

    const/4 v1, 0x1

    if-eqz v0, :cond_24

    if-ne v0, v1, :cond_23

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_12

    :cond_23
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_24
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, v7, LHb/h;->c:Ljava/lang/Object;

    check-cast p1, Lzo/m;

    iget-object v0, v7, LHb/h;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Throwable;

    iget-object v2, v7, LHb/h;->e:Ljava/lang/Object;

    check-cast v2, LKa/c;

    invoke-interface {v2, v0}, LKa/c;->c(Ljava/lang/Throwable;)Z

    move-result v3

    if-nez v3, :cond_27

    iget-object v3, v7, LHb/h;->f:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2, v3, v0}, LKa/c;->a(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_25

    iget-object v5, v7, LHb/h;->g:Ljava/lang/Object;

    check-cast v5, LNa/b;

    invoke-static {v5, v4}, LP2/b;->n(LNa/b;Ljava/lang/String;)V

    :cond_25
    invoke-interface {v2, v3, v0}, LKa/c;->d(Ljava/lang/String;Ljava/lang/Throwable;)Lya/j;

    move-result-object v0

    const/4 v2, 0x0

    iput-object v2, v7, LHb/h;->c:Ljava/lang/Object;

    iput v1, v7, LHb/h;->b:I

    invoke-interface {p1, v0, v7}, Lzo/m;->emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, p0, :cond_26

    goto :goto_13

    :cond_26
    :goto_12
    sget-object p0, LHm/B;->a:LHm/B;

    :goto_13
    return-object p0

    :cond_27
    throw v0

    :pswitch_7
    move-object v7, p0

    sget-object p0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v0, v7, LHb/h;->b:I

    const/4 v1, 0x1

    if-eqz v0, :cond_29

    if-ne v0, v1, :cond_28

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto/16 :goto_18

    :cond_28
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_29
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, v7, LHb/h;->c:Ljava/lang/Object;

    check-cast p1, Lzo/m;

    iget-object v0, v7, LHb/h;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Throwable;

    instance-of v2, v0, Ljava/util/concurrent/CancellationException;

    if-nez v2, :cond_2f

    instance-of v2, v0, Lretrofit2/HttpException;

    const/4 v3, 0x0

    if-eqz v2, :cond_2a

    move-object v2, v0

    check-cast v2, Lretrofit2/HttpException;

    goto :goto_14

    :cond_2a
    move-object v2, v3

    :goto_14
    if-eqz v2, :cond_2c

    const/16 v4, 0x1a6

    iget v5, v2, Lretrofit2/HttpException;->a:I

    if-ne v5, v4, :cond_2b

    goto :goto_15

    :cond_2b
    move-object v2, v3

    :goto_15
    if-eqz v2, :cond_2c

    iget-object v4, v7, LHb/h;->g:Ljava/lang/Object;

    check-cast v4, Lcom/eightsleep/data_home/data/repository/WeeklyRecapRepository;

    invoke-static {v4, v2}, Lcom/eightsleep/data_home/data/repository/WeeklyRecapRepository;->access$parseInsufficientDataNights(Lcom/eightsleep/data_home/data/repository/WeeklyRecapRepository;Lretrofit2/HttpException;)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_16

    :cond_2c
    move-object v2, v3

    :goto_16
    if-eqz v2, :cond_2d

    new-instance v0, Lya/g;

    new-instance v4, LJb/h;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget-object v5, v7, LHb/h;->e:Ljava/lang/Object;

    check-cast v5, Ljava/time/LocalDate;

    invoke-static {v5}, Lkotlin/jvm/internal/l;->g(Ljava/lang/Object;)V

    iget-object v6, v7, LHb/h;->f:Ljava/lang/Object;

    check-cast v6, Ljava/time/LocalDate;

    invoke-static {v6}, Lkotlin/jvm/internal/l;->g(Ljava/lang/Object;)V

    invoke-direct {v4, v2, v5, v6}, LJb/h;-><init>(ILjava/time/LocalDate;Ljava/time/LocalDate;)V

    invoke-direct {v0, v4}, Lya/g;-><init>(Ljava/lang/Object;)V

    goto :goto_17

    :cond_2d
    new-instance v2, Lya/e;

    invoke-direct {v2, v0}, Lya/e;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v2

    :goto_17
    iput-object v3, v7, LHb/h;->c:Ljava/lang/Object;

    iput v1, v7, LHb/h;->b:I

    invoke-interface {p1, v0, v7}, Lzo/m;->emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, p0, :cond_2e

    goto :goto_19

    :cond_2e
    :goto_18
    sget-object p0, LHm/B;->a:LHm/B;

    :goto_19
    return-object p0

    :cond_2f
    throw v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
