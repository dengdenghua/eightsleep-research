.class public final Lgd/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzo/m;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lzo/m;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;


# direct methods
.method public synthetic constructor <init>(Lzo/m;Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;Ljava/lang/String;I)V
    .locals 0

    .line 1
    iput p4, p0, Lgd/b;->a:I

    iput-object p1, p0, Lgd/b;->b:Lzo/m;

    iput-object p2, p0, Lgd/b;->d:Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;

    iput-object p3, p0, Lgd/b;->c:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lzo/m;Ljava/lang/String;Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;I)V
    .locals 0

    .line 2
    iput p4, p0, Lgd/b;->a:I

    iput-object p1, p0, Lgd/b;->b:Lzo/m;

    iput-object p2, p0, Lgd/b;->c:Ljava/lang/String;

    iput-object p3, p0, Lgd/b;->d:Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;
    .locals 8

    iget v0, p0, Lgd/b;->a:I

    packed-switch v0, :pswitch_data_0

    instance-of v0, p2, Lgd/j;

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, Lgd/j;

    iget v1, v0, Lgd/j;->b:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lgd/j;->b:I

    goto :goto_0

    :cond_0
    new-instance v0, Lgd/j;

    invoke-direct {v0, p0, p2}, Lgd/j;-><init>(Lgd/b;LLm/c;)V

    :goto_0
    iget-object p2, v0, Lgd/j;->a:Ljava/lang/Object;

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, v0, Lgd/j;->b:I

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz v2, :cond_3

    if-eq v2, v4, :cond_2

    if-ne v2, v3, :cond_1

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    goto/16 :goto_3

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    iget-object p0, v0, Lgd/j;->e:Lrd/c;

    iget-object p1, v0, Lgd/j;->c:Lzo/m;

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_1

    :cond_3
    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    check-cast p1, Lya/j;

    instance-of p2, p1, Lya/e;

    iget-object v2, p0, Lgd/b;->b:Lzo/m;

    if-eqz p2, :cond_4

    new-instance p0, Lya/e;

    check-cast p1, Lya/e;

    iget-object p1, p1, Lya/e;->b:Ljava/lang/Throwable;

    invoke-direct {p0, p1}, Lya/e;-><init>(Ljava/lang/Throwable;)V

    goto :goto_2

    :cond_4
    instance-of p2, p1, Lya/f;

    if-eqz p2, :cond_5

    sget-object p0, Lya/f;->b:Lya/f;

    goto :goto_2

    :cond_5
    instance-of p2, p1, Lya/g;

    if-eqz p2, :cond_8

    check-cast p1, Lya/g;

    iget-object p1, p1, Lya/g;->b:Ljava/lang/Object;

    check-cast p1, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsResponse;

    iget-object p2, p0, Lgd/b;->c:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsResponse;->toEntity(Ljava/lang/String;)Lrd/c;

    move-result-object p1

    iget-object p0, p0, Lgd/b;->d:Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;

    invoke-static {p0}, Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;->access$getHotFlashModeSettingsCache$p(Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;)Lrd/b;

    move-result-object p0

    iput-object v2, v0, Lgd/j;->c:Lzo/m;

    iput-object p1, v0, Lgd/j;->e:Lrd/c;

    iput v4, v0, Lgd/j;->b:I

    invoke-virtual {p0, p1, p2, v0}, Lrd/b;->h(Lrd/c;Ljava/lang/String;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_6

    goto :goto_4

    :cond_6
    move-object p0, p1

    move-object p1, v2

    :goto_1
    new-instance p2, Lya/g;

    invoke-virtual {p0}, Lrd/c;->a()Ljd/c;

    move-result-object p0

    invoke-direct {p2, p0}, Lya/g;-><init>(Ljava/lang/Object;)V

    move-object v2, p1

    move-object p0, p2

    :goto_2
    const/4 p1, 0x0

    iput-object p1, v0, Lgd/j;->c:Lzo/m;

    iput-object p1, v0, Lgd/j;->e:Lrd/c;

    iput v3, v0, Lgd/j;->b:I

    invoke-interface {v2, p0, v0}, Lzo/m;->emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_7

    goto :goto_4

    :cond_7
    :goto_3
    sget-object v1, LHm/B;->a:LHm/B;

    :goto_4
    return-object v1

    :cond_8
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0

    :pswitch_0
    instance-of v0, p2, Lgd/h;

    if-eqz v0, :cond_9

    move-object v0, p2

    check-cast v0, Lgd/h;

    iget v1, v0, Lgd/h;->b:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_9

    sub-int/2addr v1, v2

    iput v1, v0, Lgd/h;->b:I

    goto :goto_5

    :cond_9
    new-instance v0, Lgd/h;

    invoke-direct {v0, p0, p2}, Lgd/h;-><init>(Lgd/b;LLm/c;)V

    :goto_5
    iget-object p2, v0, Lgd/h;->a:Ljava/lang/Object;

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, v0, Lgd/h;->b:I

    sget-object v3, LHm/B;->a:LHm/B;

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v2, :cond_d

    if-eq v2, v5, :cond_c

    if-ne v2, v4, :cond_b

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    :cond_a
    move-object v1, v3

    goto/16 :goto_9

    :cond_b
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_c
    iget-object p0, v0, Lgd/h;->c:Lzo/m;

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_7

    :cond_d
    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    check-cast p1, Lya/j;

    instance-of p2, p1, Lya/e;

    iget-object v2, p0, Lgd/b;->b:Lzo/m;

    if-eqz p2, :cond_e

    new-instance p0, Lya/e;

    check-cast p1, Lya/e;

    iget-object p1, p1, Lya/e;->b:Ljava/lang/Throwable;

    invoke-direct {p0, p1}, Lya/e;-><init>(Ljava/lang/Throwable;)V

    goto :goto_8

    :cond_e
    instance-of p2, p1, Lya/f;

    if-eqz p2, :cond_f

    sget-object p0, Lya/f;->b:Lya/f;

    goto :goto_8

    :cond_f
    instance-of p1, p1, Lya/g;

    if-eqz p1, :cond_12

    iget-object p1, p0, Lgd/b;->d:Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;

    invoke-static {p1}, Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;->access$getHotFlashModeSettingsCache$p(Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;)Lrd/b;

    move-result-object p1

    iput-object v2, v0, Lgd/h;->c:Lzo/m;

    iput v5, v0, Lgd/h;->b:I

    iget-object p1, p1, Lrd/b;->a:Lqd/a;

    iget-object p0, p0, Lgd/b;->c:Ljava/lang/String;

    new-instance p2, Laa/e;

    const/16 v5, 0x1b

    invoke-direct {p2, v5, p1, p0}, Laa/e;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    iget-object p0, p1, Lqd/a;->a:Ljava/lang/Object;

    check-cast p0, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-static {p0, p2, v0}, LP2/A;->K(LE4/t;Ljava/util/concurrent/Callable;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_10

    goto :goto_6

    :cond_10
    move-object p0, v3

    :goto_6
    if-ne p0, v1, :cond_11

    goto :goto_9

    :cond_11
    move-object p0, v2

    :goto_7
    new-instance p1, Lya/g;

    invoke-direct {p1, v3}, Lya/g;-><init>(Ljava/lang/Object;)V

    move-object v2, p0

    move-object p0, p1

    :goto_8
    const/4 p1, 0x0

    iput-object p1, v0, Lgd/h;->c:Lzo/m;

    iput v4, v0, Lgd/h;->b:I

    invoke-interface {v2, p0, v0}, Lzo/m;->emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_a

    :goto_9
    return-object v1

    :cond_12
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0

    :pswitch_1
    instance-of v0, p2, Lgd/f;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lgd/f;

    iget v1, v0, Lgd/f;->b:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lgd/f;->b:I

    goto :goto_a

    :cond_13
    new-instance v0, Lgd/f;

    invoke-direct {v0, p0, p2}, Lgd/f;-><init>(Lgd/b;LLm/c;)V

    :goto_a
    iget-object p2, v0, Lgd/f;->a:Ljava/lang/Object;

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, v0, Lgd/f;->b:I

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_16

    if-eq v2, v4, :cond_15

    if-ne v2, v3, :cond_14

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    goto/16 :goto_f

    :cond_14
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_15
    iget-object p0, v0, Lgd/f;->e:Lrd/c;

    iget-object p1, v0, Lgd/f;->c:Lzo/m;

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_c

    :cond_16
    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    check-cast p1, Lya/j;

    instance-of p2, p1, Lya/e;

    iget-object v2, p0, Lgd/b;->b:Lzo/m;

    if-eqz p2, :cond_17

    new-instance p0, Lya/e;

    check-cast p1, Lya/e;

    iget-object p1, p1, Lya/e;->b:Ljava/lang/Throwable;

    invoke-direct {p0, p1}, Lya/e;-><init>(Ljava/lang/Throwable;)V

    goto :goto_e

    :cond_17
    instance-of p2, p1, Lya/f;

    if-eqz p2, :cond_18

    sget-object p0, Lya/f;->b:Lya/f;

    goto :goto_e

    :cond_18
    instance-of p2, p1, Lya/g;

    if-eqz p2, :cond_1d

    check-cast p1, Lya/g;

    iget-object p1, p1, Lya/g;->b:Ljava/lang/Object;

    check-cast p1, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsResponse;

    iget-object p2, p0, Lgd/b;->c:Ljava/lang/String;

    if-eqz p1, :cond_19

    invoke-virtual {p1, p2}, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsResponse;->toEntity(Ljava/lang/String;)Lrd/c;

    move-result-object p1

    goto :goto_b

    :cond_19
    move-object p1, v5

    :goto_b
    iget-object p0, p0, Lgd/b;->d:Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;

    invoke-static {p0}, Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;->access$getHotFlashModeSettingsCache$p(Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;)Lrd/b;

    move-result-object p0

    iput-object v2, v0, Lgd/f;->c:Lzo/m;

    iput-object p1, v0, Lgd/f;->e:Lrd/c;

    iput v4, v0, Lgd/f;->b:I

    invoke-virtual {p0, p1, p2, v0}, Lrd/b;->h(Lrd/c;Ljava/lang/String;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_1a

    goto :goto_10

    :cond_1a
    move-object p0, p1

    move-object p1, v2

    :goto_c
    new-instance p2, Lya/g;

    if-eqz p0, :cond_1b

    invoke-virtual {p0}, Lrd/c;->a()Ljd/c;

    move-result-object p0

    goto :goto_d

    :cond_1b
    move-object p0, v5

    :goto_d
    invoke-direct {p2, p0}, Lya/g;-><init>(Ljava/lang/Object;)V

    move-object v2, p1

    move-object p0, p2

    :goto_e
    iput-object v5, v0, Lgd/f;->c:Lzo/m;

    iput-object v5, v0, Lgd/f;->e:Lrd/c;

    iput v3, v0, Lgd/f;->b:I

    invoke-interface {v2, p0, v0}, Lzo/m;->emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_1c

    goto :goto_10

    :cond_1c
    :goto_f
    sget-object v1, LHm/B;->a:LHm/B;

    :goto_10
    return-object v1

    :cond_1d
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0

    :pswitch_2
    instance-of v0, p2, Lgd/a;

    if-eqz v0, :cond_1e

    move-object v0, p2

    check-cast v0, Lgd/a;

    iget v1, v0, Lgd/a;->b:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_1e

    sub-int/2addr v1, v2

    iput v1, v0, Lgd/a;->b:I

    goto :goto_11

    :cond_1e
    new-instance v0, Lgd/a;

    invoke-direct {v0, p0, p2}, Lgd/a;-><init>(Lgd/b;LLm/c;)V

    :goto_11
    iget-object p2, v0, Lgd/a;->a:Ljava/lang/Object;

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, v0, Lgd/a;->b:I

    const/4 v3, 0x3

    const/4 v4, 0x1

    const/4 v5, 0x2

    const/4 v6, 0x0

    if-eqz v2, :cond_22

    if-eq v2, v4, :cond_21

    if-eq v2, v5, :cond_20

    if-ne v2, v3, :cond_1f

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    goto/16 :goto_16

    :cond_1f
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_20
    iget-object p0, v0, Lgd/a;->e:Lrd/c;

    iget-object p1, v0, Lgd/a;->c:Lzo/m;

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_13

    :cond_21
    iget-object p0, v0, Lgd/a;->c:Lzo/m;

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_12

    :cond_22
    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    check-cast p1, Lrd/c;

    iget-object p2, p0, Lgd/b;->c:Ljava/lang/String;

    iget-object v2, p0, Lgd/b;->d:Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;

    iget-object p0, p0, Lgd/b;->b:Lzo/m;

    if-nez p1, :cond_24

    invoke-virtual {v2, p2}, Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;->refreshHotFlashModeSettings(Ljava/lang/String;)Lzo/l;

    move-result-object p1

    new-instance p2, Lgd/d;

    invoke-direct {p2, v5, v6}, LNm/i;-><init>(ILLm/c;)V

    iput-object p0, v0, Lgd/a;->c:Lzo/m;

    iput v4, v0, Lgd/a;->b:I

    invoke-static {p1, p2, v0}, Lzo/s;->m(Lzo/l;LVm/n;LLm/c;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_23

    goto :goto_17

    :cond_23
    :goto_12
    sget-object p1, Lya/f;->b:Lya/f;

    goto :goto_15

    :cond_24
    invoke-static {v2}, Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;->access$getHotFlashModeSettingsCache$p(Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;)Lrd/b;

    move-result-object v4

    invoke-interface {v4}, LQa/b;->b()Z

    move-result v4

    if-eqz v4, :cond_26

    invoke-virtual {v2, p2}, Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;->refreshHotFlashModeSettings(Ljava/lang/String;)Lzo/l;

    move-result-object p2

    new-instance v2, Lgd/e;

    invoke-direct {v2, v5, v6}, LNm/i;-><init>(ILLm/c;)V

    iput-object p0, v0, Lgd/a;->c:Lzo/m;

    iput-object p1, v0, Lgd/a;->e:Lrd/c;

    iput v5, v0, Lgd/a;->b:I

    invoke-static {p2, v2, v0}, Lzo/s;->m(Lzo/l;LVm/n;LLm/c;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_25

    goto :goto_17

    :cond_25
    move-object v7, p1

    move-object p1, p0

    move-object p0, v7

    :goto_13
    new-instance p2, Lya/g;

    invoke-virtual {p0}, Lrd/c;->a()Ljd/c;

    move-result-object p0

    invoke-direct {p2, p0}, Lya/g;-><init>(Ljava/lang/Object;)V

    move-object p0, p1

    :goto_14
    move-object p1, p2

    goto :goto_15

    :cond_26
    new-instance p2, Lya/g;

    invoke-virtual {p1}, Lrd/c;->a()Ljd/c;

    move-result-object p1

    invoke-direct {p2, p1}, Lya/g;-><init>(Ljava/lang/Object;)V

    goto :goto_14

    :goto_15
    iput-object v6, v0, Lgd/a;->c:Lzo/m;

    iput-object v6, v0, Lgd/a;->e:Lrd/c;

    iput v3, v0, Lgd/a;->b:I

    invoke-interface {p0, p1, v0}, Lzo/m;->emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_27

    goto :goto_17

    :cond_27
    :goto_16
    sget-object v1, LHm/B;->a:LHm/B;

    :goto_17
    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
