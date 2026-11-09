.class public final Lgd/B;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzo/m;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lzo/m;

.field public final synthetic c:Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lzo/m;Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;Ljava/lang/String;I)V
    .locals 0

    .line 1
    iput p4, p0, Lgd/B;->a:I

    iput-object p1, p0, Lgd/B;->b:Lzo/m;

    iput-object p2, p0, Lgd/B;->c:Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;

    iput-object p3, p0, Lgd/B;->d:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lzo/m;Ljava/lang/String;Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lgd/B;->a:I

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgd/B;->b:Lzo/m;

    iput-object p2, p0, Lgd/B;->d:Ljava/lang/String;

    iput-object p3, p0, Lgd/B;->c:Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;

    return-void
.end method


# virtual methods
.method public final emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;
    .locals 11

    iget v0, p0, Lgd/B;->a:I

    packed-switch v0, :pswitch_data_0

    instance-of v0, p2, Lgd/f0;

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, Lgd/f0;

    iget v1, v0, Lgd/f0;->b:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lgd/f0;->b:I

    goto :goto_0

    :cond_0
    new-instance v0, Lgd/f0;

    invoke-direct {v0, p0, p2}, Lgd/f0;-><init>(Lgd/B;LLm/c;)V

    :goto_0
    iget-object p2, v0, Lgd/f0;->a:Ljava/lang/Object;

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, v0, Lgd/f0;->b:I

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz v2, :cond_3

    if-eq v2, v4, :cond_2

    if-ne v2, v3, :cond_1

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_2

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    iget-object p0, v0, Lgd/f0;->f:Lya/g;

    iget-object p1, v0, Lgd/f0;->e:Lzo/m;

    iget-object v2, v0, Lgd/f0;->c:Lgd/B;

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    move-object v10, p1

    move-object p1, p0

    move-object p0, v2

    move-object v2, v10

    goto :goto_1

    :cond_3
    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    check-cast p1, Lya/j;

    instance-of p2, p1, Lya/g;

    iget-object v2, p0, Lgd/B;->b:Lzo/m;

    if-eqz p2, :cond_4

    move-object p2, p1

    check-cast p2, Lya/g;

    iget-object p2, p2, Lya/g;->b:Ljava/lang/Object;

    check-cast p2, Lcom/eightsleep/data_temperature/data/model/TemperatureSettingsResponse;

    iput-object p0, v0, Lgd/f0;->c:Lgd/B;

    iput-object v2, v0, Lgd/f0;->e:Lzo/m;

    move-object v5, p1

    check-cast v5, Lya/g;

    iput-object v5, v0, Lgd/f0;->f:Lya/g;

    iput v4, v0, Lgd/f0;->b:I

    iget-object v4, p0, Lgd/B;->c:Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;

    iget-object v5, p0, Lgd/B;->d:Ljava/lang/String;

    invoke-static {v4, p2, v5, v0}, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->access$cacheBedtimeSchedules(Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;Lcom/eightsleep/data_temperature/data/model/TemperatureSettingsResponse;Ljava/lang/String;LLm/c;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_4

    goto :goto_3

    :cond_4
    :goto_1
    new-instance p2, LBe/r;

    iget-object v4, p0, Lgd/B;->d:Ljava/lang/String;

    iget-object p0, p0, Lgd/B;->c:Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;

    const/16 v5, 0x16

    invoke-direct {p2, v5, v4, p0}, LBe/r;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-static {p1, p2}, Lya/j;->b(Lya/j;LVm/k;)Lya/j;

    move-result-object p0

    const/4 p1, 0x0

    iput-object p1, v0, Lgd/f0;->c:Lgd/B;

    iput-object p1, v0, Lgd/f0;->e:Lzo/m;

    iput-object p1, v0, Lgd/f0;->f:Lya/g;

    iput v3, v0, Lgd/f0;->b:I

    invoke-interface {v2, p0, v0}, Lzo/m;->emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_5

    goto :goto_3

    :cond_5
    :goto_2
    sget-object v1, LHm/B;->a:LHm/B;

    :goto_3
    return-object v1

    :pswitch_0
    instance-of v0, p2, Lgd/I;

    if-eqz v0, :cond_6

    move-object v0, p2

    check-cast v0, Lgd/I;

    iget v1, v0, Lgd/I;->b:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_6

    sub-int/2addr v1, v2

    iput v1, v0, Lgd/I;->b:I

    goto :goto_4

    :cond_6
    new-instance v0, Lgd/I;

    invoke-direct {v0, p0, p2}, Lgd/I;-><init>(Lgd/B;LLm/c;)V

    :goto_4
    iget-object p2, v0, Lgd/I;->a:Ljava/lang/Object;

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, v0, Lgd/I;->b:I

    sget-object v3, LHm/B;->a:LHm/B;

    const/4 v4, 0x0

    const/4 v5, 0x3

    const/4 v6, 0x1

    const/4 v7, 0x2

    if-eqz v2, :cond_b

    if-eq v2, v6, :cond_a

    if-eq v2, v7, :cond_9

    if-ne v2, v5, :cond_8

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    :cond_7
    move-object v1, v3

    goto/16 :goto_8

    :cond_8
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_9
    iget-object p0, v0, Lgd/I;->c:Lzo/m;

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_6

    :cond_a
    iget-object p0, v0, Lgd/I;->c:Lzo/m;

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_5

    :cond_b
    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    check-cast p1, Lya/j;

    instance-of p2, p1, Lya/e;

    iget-object v2, p0, Lgd/B;->b:Lzo/m;

    if-eqz p2, :cond_c

    new-instance p0, Lya/e;

    check-cast p1, Lya/e;

    iget-object p1, p1, Lya/e;->b:Ljava/lang/Throwable;

    invoke-direct {p0, p1}, Lya/e;-><init>(Ljava/lang/Throwable;)V

    goto :goto_7

    :cond_c
    instance-of p2, p1, Lya/f;

    if-eqz p2, :cond_d

    sget-object p0, Lya/f;->b:Lya/f;

    goto :goto_7

    :cond_d
    instance-of p1, p1, Lya/g;

    if-eqz p1, :cond_10

    iput-object v2, v0, Lgd/I;->c:Lzo/m;

    iput v6, v0, Lgd/I;->b:I

    iget-object p1, p0, Lgd/B;->c:Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;

    iget-object p0, p0, Lgd/B;->d:Ljava/lang/String;

    invoke-virtual {p1, p0, v0}, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->refreshTemperatureSettings$data_temperature_tencentRelease(Ljava/lang/String;LLm/c;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_e

    goto :goto_8

    :cond_e
    move-object p0, v2

    :goto_5
    check-cast p2, Lzo/l;

    new-instance p1, Lgd/K;

    invoke-direct {p1, v7, v4}, LNm/i;-><init>(ILLm/c;)V

    iput-object p0, v0, Lgd/I;->c:Lzo/m;

    iput v7, v0, Lgd/I;->b:I

    invoke-static {p2, p1, v0}, Lzo/s;->m(Lzo/l;LVm/n;LLm/c;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_f

    goto :goto_8

    :cond_f
    :goto_6
    new-instance p1, Lya/g;

    invoke-direct {p1, v3}, Lya/g;-><init>(Ljava/lang/Object;)V

    move-object v2, p0

    move-object p0, p1

    :goto_7
    iput-object v4, v0, Lgd/I;->c:Lzo/m;

    iput v5, v0, Lgd/I;->b:I

    invoke-interface {v2, p0, v0}, Lzo/m;->emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_7

    :goto_8
    return-object v1

    :cond_10
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0

    :pswitch_1
    instance-of v0, p2, Lgd/A;

    if-eqz v0, :cond_11

    move-object v0, p2

    check-cast v0, Lgd/A;

    iget v1, v0, Lgd/A;->b:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_11

    sub-int/2addr v1, v2

    iput v1, v0, Lgd/A;->b:I

    goto :goto_9

    :cond_11
    new-instance v0, Lgd/A;

    invoke-direct {v0, p0, p2}, Lgd/A;-><init>(Lgd/B;LLm/c;)V

    :goto_9
    iget-object p2, v0, Lgd/A;->a:Ljava/lang/Object;

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, v0, Lgd/A;->b:I

    sget-object v3, LHm/B;->a:LHm/B;

    const/4 v4, 0x0

    const/4 v5, 0x3

    const/4 v6, 0x1

    const/4 v7, 0x2

    if-eqz v2, :cond_16

    if-eq v2, v6, :cond_15

    if-eq v2, v7, :cond_14

    if-ne v2, v5, :cond_13

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    :cond_12
    move-object v1, v3

    goto/16 :goto_d

    :cond_13
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_14
    iget-object p0, v0, Lgd/A;->c:Lzo/m;

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_b

    :cond_15
    iget-object p0, v0, Lgd/A;->c:Lzo/m;

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_a

    :cond_16
    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    check-cast p1, Lya/j;

    instance-of p2, p1, Lya/e;

    iget-object v2, p0, Lgd/B;->b:Lzo/m;

    if-eqz p2, :cond_17

    new-instance p0, Lya/e;

    check-cast p1, Lya/e;

    iget-object p1, p1, Lya/e;->b:Ljava/lang/Throwable;

    invoke-direct {p0, p1}, Lya/e;-><init>(Ljava/lang/Throwable;)V

    goto :goto_c

    :cond_17
    instance-of p2, p1, Lya/f;

    if-eqz p2, :cond_18

    sget-object p0, Lya/f;->b:Lya/f;

    goto :goto_c

    :cond_18
    instance-of p2, p1, Lya/g;

    if-eqz p2, :cond_1b

    check-cast p1, Lya/g;

    iget-object p1, p1, Lya/g;->b:Ljava/lang/Object;

    check-cast p1, Lcom/eightsleep/data_temperature/data/model/ActivateHotFlashModeResponse;

    iget-object p2, p0, Lgd/B;->d:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/eightsleep/data_temperature/data/model/ActivateHotFlashModeResponse;->toDomain(Ljava/lang/String;)Ljd/q;

    move-result-object p1

    new-instance v8, LBo/a;

    const/16 v9, 0x8

    invoke-direct {v8, p1, v9}, LBo/a;-><init>(Ljava/lang/Object;I)V

    iget-object p0, p0, Lgd/B;->c:Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;

    invoke-static {p0, p2, v8}, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->access$updateUserTemperatureSettingsMap(Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;Ljava/lang/String;LVm/k;)V

    iput-object v2, v0, Lgd/A;->c:Lzo/m;

    iput v6, v0, Lgd/A;->b:I

    invoke-virtual {p0, p2, v0}, Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;->refreshTemperatureSettings$data_temperature_tencentRelease(Ljava/lang/String;LLm/c;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_19

    goto :goto_d

    :cond_19
    move-object p0, v2

    :goto_a
    check-cast p2, Lzo/l;

    new-instance p1, Lgd/E;

    invoke-direct {p1, v7, v4}, LNm/i;-><init>(ILLm/c;)V

    iput-object p0, v0, Lgd/A;->c:Lzo/m;

    iput v7, v0, Lgd/A;->b:I

    invoke-static {p2, p1, v0}, Lzo/s;->m(Lzo/l;LVm/n;LLm/c;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_1a

    goto :goto_d

    :cond_1a
    :goto_b
    new-instance p1, Lya/g;

    invoke-direct {p1, v3}, Lya/g;-><init>(Ljava/lang/Object;)V

    move-object v2, p0

    move-object p0, p1

    :goto_c
    iput-object v4, v0, Lgd/A;->c:Lzo/m;

    iput v5, v0, Lgd/A;->b:I

    invoke-interface {v2, p0, v0}, Lzo/m;->emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_12

    :goto_d
    return-object v1

    :cond_1b
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
