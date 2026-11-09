.class public final LAo/l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzo/m;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    iput p5, p0, LAo/l;->a:I

    iput-object p1, p0, LAo/l;->b:Ljava/lang/Object;

    iput-object p2, p0, LAo/l;->c:Ljava/lang/Object;

    iput-object p3, p0, LAo/l;->d:Ljava/lang/Object;

    iput-object p4, p0, LAo/l;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/eightsleep/data_bedtime/data/repository/RecommendedBedtimeRepository;Lzo/m;Lba/d;)V
    .locals 1

    const/4 v0, 0x4

    iput v0, p0, LAo/l;->a:I

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LAo/l;->b:Ljava/lang/Object;

    iput-object p2, p0, LAo/l;->c:Ljava/lang/Object;

    iput-object p3, p0, LAo/l;->e:Ljava/lang/Object;

    iput-object p4, p0, LAo/l;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/z;Lwo/z;Lm0/Z;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, LAo/l;->a:I

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LAo/l;->b:Ljava/lang/Object;

    iput-object p2, p0, LAo/l;->d:Ljava/lang/Object;

    iput-object p3, p0, LAo/l;->c:Ljava/lang/Object;

    iput-object p4, p0, LAo/l;->e:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lzo/m;LNa/b;Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0

    .line 4
    iput p5, p0, LAo/l;->a:I

    iput-object p1, p0, LAo/l;->e:Ljava/lang/Object;

    iput-object p2, p0, LAo/l;->b:Ljava/lang/Object;

    iput-object p3, p0, LAo/l;->c:Ljava/lang/Object;

    iput-object p4, p0, LAo/l;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lya/j;LLm/c;)Ljava/lang/Object;
    .locals 10

    instance-of v0, p2, LU9/g;

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, LU9/g;

    iget v1, v0, LU9/g;->e:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, LU9/g;->e:I

    goto :goto_0

    :cond_0
    new-instance v0, LU9/g;

    invoke-direct {v0, p0, p2}, LU9/g;-><init>(LAo/l;LLm/c;)V

    :goto_0
    iget-object p2, v0, LU9/g;->c:Ljava/lang/Object;

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, v0, LU9/g;->e:I

    sget-object v3, LHm/B;->a:LHm/B;

    const/4 v4, 0x4

    const/4 v5, 0x3

    const/4 v6, 0x2

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-eqz v2, :cond_5

    if-eq v2, v7, :cond_4

    if-eq v2, v6, :cond_3

    if-eq v2, v5, :cond_2

    if-ne v2, v4, :cond_1

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    return-object v3

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    return-object v3

    :cond_3
    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    return-object v3

    :cond_4
    iget-object p0, v0, LU9/g;->b:Lba/d;

    iget-object p1, v0, LU9/g;->a:LAo/l;

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    move-object v9, p1

    move-object p1, p0

    move-object p0, v9

    goto :goto_1

    :cond_5
    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    instance-of p2, p1, Lya/g;

    if-eqz p2, :cond_7

    check-cast p1, Lya/g;

    iget-object p1, p1, Lya/g;->b:Ljava/lang/Object;

    check-cast p1, Lcom/eightsleep/data_bedtime/data/model/RecommendedBedtimeResponse;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-object p2, p0, LAo/l;->b:Ljava/lang/Object;

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p1, p2, v4, v5}, Lcom/eightsleep/data_bedtime/data/model/RecommendedBedtimeResponse;->toEntity(Ljava/lang/String;J)Lba/d;

    move-result-object p1

    iget-object v2, p0, LAo/l;->c:Ljava/lang/Object;

    check-cast v2, Lcom/eightsleep/data_bedtime/data/repository/RecommendedBedtimeRepository;

    invoke-static {v2}, Lcom/eightsleep/data_bedtime/data/repository/RecommendedBedtimeRepository;->access$getCache$p(Lcom/eightsleep/data_bedtime/data/repository/RecommendedBedtimeRepository;)LZ9/b;

    move-result-object v2

    iput-object p0, v0, LU9/g;->a:LAo/l;

    iput-object p1, v0, LU9/g;->b:Lba/d;

    iput v7, v0, LU9/g;->e:I

    invoke-virtual {v2, p1, p2, v0}, LZ9/b;->h(Lba/d;Ljava/lang/String;LLm/c;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_6

    goto :goto_2

    :cond_6
    :goto_1
    iget-object p0, p0, LAo/l;->e:Ljava/lang/Object;

    check-cast p0, Lzo/m;

    new-instance p2, Lya/g;

    invoke-virtual {p1}, Lba/d;->a()LW9/g;

    move-result-object p1

    invoke-direct {p2, p1}, Lya/g;-><init>(Ljava/lang/Object;)V

    iput-object v8, v0, LU9/g;->a:LAo/l;

    iput-object v8, v0, LU9/g;->b:Lba/d;

    iput v6, v0, LU9/g;->e:I

    invoke-interface {p0, p2, v0}, Lzo/m;->emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_9

    goto :goto_2

    :cond_7
    instance-of p2, p1, Lya/e;

    if-eqz p2, :cond_a

    sget-object p2, Ltimber/log/Timber;->a:Lbr/a;

    check-cast p1, Lya/e;

    iget-object p1, p1, Lya/e;->b:Ljava/lang/Throwable;

    const/4 v2, 0x0

    new-array v6, v2, [Ljava/lang/Object;

    const-string v7, "Failed to fetch recommended bedtime"

    invoke-virtual {p2, v7, p1, v6}, Lbr/a;->c(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    iget-object p1, p0, LAo/l;->e:Ljava/lang/Object;

    check-cast p1, Lzo/m;

    iget-object p0, p0, LAo/l;->d:Ljava/lang/Object;

    check-cast p0, Lba/d;

    if-eqz p0, :cond_8

    const-string v4, "Returning stale cached recommended bedtime"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p2, v4, v2}, Lbr/a;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance p2, Lya/g;

    invoke-virtual {p0}, Lba/d;->a()LW9/g;

    move-result-object p0

    invoke-direct {p2, p0}, Lya/g;-><init>(Ljava/lang/Object;)V

    iput v5, v0, LU9/g;->e:I

    invoke-interface {p1, p2, v0}, Lzo/m;->emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_9

    goto :goto_2

    :cond_8
    new-instance p0, Lya/g;

    invoke-direct {p0, v8}, Lya/g;-><init>(Ljava/lang/Object;)V

    iput v4, v0, LU9/g;->e:I

    invoke-interface {p1, p0, v0}, Lzo/m;->emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_9

    :goto_2
    return-object v1

    :cond_9
    return-object v3

    :cond_a
    instance-of p0, p1, Lya/f;

    if-eqz p0, :cond_b

    return-object v3

    :cond_b
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0
.end method

.method public final emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;
    .locals 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    const/16 v3, 0xa

    sget-object v5, Lya/f;->b:Lya/f;

    const/4 v6, 0x2

    const/4 v7, 0x0

    const-string v8, "call to \'resume\' before \'invoke\' with coroutine"

    const/high16 v9, -0x80000000

    const/4 v10, 0x1

    iget-object v11, v0, LAo/l;->e:Ljava/lang/Object;

    iget-object v12, v0, LAo/l;->c:Ljava/lang/Object;

    iget-object v13, v0, LAo/l;->d:Ljava/lang/Object;

    sget-object v14, LHm/B;->a:LHm/B;

    iget-object v15, v0, LAo/l;->b:Ljava/lang/Object;

    iget v4, v0, LAo/l;->a:I

    packed-switch v4, :pswitch_data_0

    move-object v0, v1

    check-cast v0, LE/k;

    instance-of v1, v0, LE/n;

    check-cast v13, Lkotlin/jvm/internal/y;

    check-cast v12, Lkotlin/jvm/internal/y;

    check-cast v15, Lkotlin/jvm/internal/y;

    if-eqz v1, :cond_0

    iget v0, v15, Lkotlin/jvm/internal/y;->a:I

    add-int/2addr v0, v10

    iput v0, v15, Lkotlin/jvm/internal/y;->a:I

    goto :goto_0

    :cond_0
    instance-of v1, v0, LE/o;

    if-eqz v1, :cond_1

    iget v0, v15, Lkotlin/jvm/internal/y;->a:I

    add-int/lit8 v0, v0, -0x1

    iput v0, v15, Lkotlin/jvm/internal/y;->a:I

    goto :goto_0

    :cond_1
    instance-of v1, v0, LE/m;

    if-eqz v1, :cond_2

    iget v0, v15, Lkotlin/jvm/internal/y;->a:I

    add-int/lit8 v0, v0, -0x1

    iput v0, v15, Lkotlin/jvm/internal/y;->a:I

    goto :goto_0

    :cond_2
    instance-of v1, v0, LE/h;

    if-eqz v1, :cond_3

    iget v0, v12, Lkotlin/jvm/internal/y;->a:I

    add-int/2addr v0, v10

    iput v0, v12, Lkotlin/jvm/internal/y;->a:I

    goto :goto_0

    :cond_3
    instance-of v1, v0, LE/i;

    if-eqz v1, :cond_4

    iget v0, v12, Lkotlin/jvm/internal/y;->a:I

    add-int/lit8 v0, v0, -0x1

    iput v0, v12, Lkotlin/jvm/internal/y;->a:I

    goto :goto_0

    :cond_4
    instance-of v1, v0, LE/d;

    if-eqz v1, :cond_5

    iget v0, v13, Lkotlin/jvm/internal/y;->a:I

    add-int/2addr v0, v10

    iput v0, v13, Lkotlin/jvm/internal/y;->a:I

    goto :goto_0

    :cond_5
    instance-of v0, v0, LE/e;

    if-eqz v0, :cond_6

    iget v0, v13, Lkotlin/jvm/internal/y;->a:I

    add-int/lit8 v0, v0, -0x1

    iput v0, v13, Lkotlin/jvm/internal/y;->a:I

    :cond_6
    :goto_0
    iget v0, v15, Lkotlin/jvm/internal/y;->a:I

    if-lez v0, :cond_7

    move v0, v10

    goto :goto_1

    :cond_7
    const/4 v0, 0x0

    :goto_1
    iget v1, v12, Lkotlin/jvm/internal/y;->a:I

    if-lez v1, :cond_8

    move v1, v10

    goto :goto_2

    :cond_8
    const/4 v1, 0x0

    :goto_2
    iget v2, v13, Lkotlin/jvm/internal/y;->a:I

    if-lez v2, :cond_9

    move v2, v10

    goto :goto_3

    :cond_9
    const/4 v2, 0x0

    :goto_3
    check-cast v11, Ly/P;

    iget-boolean v3, v11, Ly/P;->b:Z

    if-eq v3, v0, :cond_a

    iput-boolean v0, v11, Ly/P;->b:Z

    move v4, v10

    goto :goto_4

    :cond_a
    const/4 v4, 0x0

    :goto_4
    iget-boolean v0, v11, Ly/P;->c:Z

    if-eq v0, v1, :cond_b

    iput-boolean v1, v11, Ly/P;->c:Z

    move v4, v10

    :cond_b
    iget-boolean v0, v11, Ly/P;->d:Z

    if-eq v0, v2, :cond_c

    iput-boolean v2, v11, Ly/P;->d:Z

    goto :goto_5

    :cond_c
    move v10, v4

    :goto_5
    if-eqz v10, :cond_d

    invoke-static {v11}, LZ0/l;->l(LZ0/o;)V

    :cond_d
    return-object v14

    :pswitch_0
    instance-of v3, v2, Lpc/g0;

    if-eqz v3, :cond_e

    move-object v3, v2

    check-cast v3, Lpc/g0;

    iget v4, v3, Lpc/g0;->b:I

    and-int v17, v4, v9

    if-eqz v17, :cond_e

    sub-int/2addr v4, v9

    iput v4, v3, Lpc/g0;->b:I

    goto :goto_6

    :cond_e
    new-instance v3, Lpc/g0;

    invoke-direct {v3, v0, v2}, Lpc/g0;-><init>(LAo/l;LLm/c;)V

    :goto_6
    iget-object v0, v3, Lpc/g0;->a:Ljava/lang/Object;

    sget-object v2, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v4, v3, Lpc/g0;->b:I

    if-eqz v4, :cond_11

    if-eq v4, v10, :cond_10

    if-ne v4, v6, :cond_f

    invoke-static {v0}, LX4/x;->M(Ljava/lang/Object;)V

    goto/16 :goto_b

    :cond_f
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_10
    iget-object v1, v3, Lpc/g0;->c:Lzo/m;

    invoke-static {v0}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_7

    :cond_11
    invoke-static {v0}, LX4/x;->M(Ljava/lang/Object;)V

    move-object v0, v1

    check-cast v0, Lya/j;

    instance-of v1, v0, Lya/g;

    move-object v4, v11

    check-cast v4, Lzo/m;

    if-eqz v1, :cond_16

    check-cast v15, Lcom/eightsleep/data_metrics/data/repository/MetricsTrendsRepository;

    invoke-static {v15}, Lcom/eightsleep/data_metrics/data/repository/MetricsTrendsRepository;->access$getCache$p(Lcom/eightsleep/data_metrics/data/repository/MetricsTrendsRepository;)Lxc/f;

    move-result-object v0

    check-cast v12, Ljava/lang/String;

    check-cast v13, Ljava/time/LocalDate;

    invoke-virtual {v0, v12, v13, v13}, Lxc/f;->h(Ljava/lang/String;Ljava/time/LocalDate;Ljava/time/LocalDate;)Lzo/l;

    move-result-object v0

    iput-object v4, v3, Lpc/g0;->c:Lzo/m;

    iput v10, v3, Lpc/g0;->b:I

    invoke-static {v0, v3}, Lzo/s;->u(Lzo/l;LLm/c;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v2, :cond_12

    goto :goto_a

    :cond_12
    move-object v1, v4

    :goto_7
    check-cast v0, Ljava/lang/Iterable;

    instance-of v4, v0, Ljava/util/Collection;

    if-eqz v4, :cond_14

    move-object v4, v0

    check-cast v4, Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_14

    :cond_13
    const/4 v4, 0x0

    goto :goto_8

    :cond_14
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_15
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_13

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lzc/c;

    iget-object v4, v4, Lzc/c;->d:Lcom/eightsleep/data_metrics/domain/model/RawDailyTrends;

    if-eqz v4, :cond_15

    move v4, v10

    :goto_8
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    new-instance v5, Lya/g;

    invoke-direct {v5, v0}, Lya/g;-><init>(Ljava/lang/Object;)V

    move-object v4, v1

    goto :goto_9

    :cond_16
    instance-of v1, v0, Lya/e;

    if-eqz v1, :cond_17

    new-instance v5, Lya/e;

    check-cast v0, Lya/e;

    iget-object v0, v0, Lya/e;->b:Ljava/lang/Throwable;

    invoke-direct {v5, v0}, Lya/e;-><init>(Ljava/lang/Throwable;)V

    goto :goto_9

    :cond_17
    instance-of v0, v0, Lya/f;

    if-eqz v0, :cond_19

    :goto_9
    iput-object v7, v3, Lpc/g0;->c:Lzo/m;

    iput v6, v3, Lpc/g0;->b:I

    invoke-interface {v4, v5, v3}, Lzo/m;->emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v2, :cond_18

    :goto_a
    move-object v14, v2

    :cond_18
    :goto_b
    return-object v14

    :cond_19
    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    :pswitch_1
    move-object v0, v1

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    check-cast v15, LI/A;

    iget-object v0, v15, LI/A;->e:LI/t;

    iget-object v1, v0, LI/t;->b:Lm0/f0;

    invoke-virtual {v1}, Lm0/f0;->k()I

    move-result v1

    div-int/lit8 v1, v1, 0xc

    iget-object v0, v0, LI/t;->b:Lm0/f0;

    invoke-virtual {v0}, Lm0/f0;->k()I

    move-result v0

    rem-int/lit8 v0, v0, 0xc

    add-int/2addr v0, v10

    check-cast v11, Lan/k;

    iget v2, v11, Lan/i;->a:I

    add-int/2addr v2, v1

    check-cast v13, Lk0/G;

    check-cast v13, Lk0/I;

    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v2, v0, v10}, Ljava/time/LocalDate;->of(III)Ljava/time/LocalDate;

    move-result-object v0

    invoke-virtual {v13, v0}, Lk0/I;->e(Ljava/time/LocalDate;)Lk0/J;

    move-result-object v0

    new-instance v1, Ljava/lang/Long;

    iget-wide v2, v0, Lk0/J;->e:J

    invoke-direct {v1, v2, v3}, Ljava/lang/Long;-><init>(J)V

    check-cast v12, LVm/k;

    invoke-interface {v12, v1}, LVm/k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-object v14

    :pswitch_2
    instance-of v4, v2, Lec/e;

    if-eqz v4, :cond_1a

    move-object v4, v2

    check-cast v4, Lec/e;

    move/from16 v16, v9

    iget v9, v4, Lec/e;->b:I

    and-int v17, v9, v16

    if-eqz v17, :cond_1a

    sub-int v9, v9, v16

    iput v9, v4, Lec/e;->b:I

    goto :goto_c

    :cond_1a
    new-instance v4, Lec/e;

    invoke-direct {v4, v0, v2}, Lec/e;-><init>(LAo/l;LLm/c;)V

    :goto_c
    iget-object v0, v4, Lec/e;->a:Ljava/lang/Object;

    sget-object v2, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v9, v4, Lec/e;->b:I

    if-eqz v9, :cond_1d

    if-eq v9, v10, :cond_1c

    if-ne v9, v6, :cond_1b

    invoke-static {v0}, LX4/x;->M(Ljava/lang/Object;)V

    goto/16 :goto_11

    :cond_1b
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1c
    iget-object v1, v4, Lec/e;->e:Lya/e;

    iget-object v3, v4, Lec/e;->c:Lzo/m;

    invoke-static {v0}, LX4/x;->M(Ljava/lang/Object;)V

    goto/16 :goto_e

    :cond_1d
    invoke-static {v0}, LX4/x;->M(Ljava/lang/Object;)V

    check-cast v1, Lya/j;

    instance-of v0, v1, Lya/f;

    move-object v8, v11

    check-cast v8, Lzo/m;

    if-eqz v0, :cond_1e

    goto :goto_f

    :cond_1e
    instance-of v0, v1, Lya/g;

    if-eqz v0, :cond_1f

    new-instance v5, Lya/g;

    invoke-direct {v5, v14}, Lya/g;-><init>(Ljava/lang/Object;)V

    goto :goto_f

    :cond_1f
    instance-of v0, v1, Lya/e;

    if-eqz v0, :cond_23

    check-cast v15, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;

    invoke-static {v15}, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;->access$getCache$p(Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;)Ljc/d;

    move-result-object v0

    new-instance v5, Ljava/util/ArrayList;

    check-cast v12, Ljava/util/List;

    invoke-static {v12, v3}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v5, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v12}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_20

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lgc/f;

    iget-object v11, v9, Lgc/f;->a:Ljava/lang/String;

    iget-object v12, v9, Lgc/f;->d:Lgc/d;

    const-string v15, "id"

    invoke-static {v11, v15}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v15, "type"

    iget-object v9, v9, Lgc/f;->b:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    invoke-static {v9, v15}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v15, v13

    check-cast v15, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    const-string v6, "status"

    invoke-static {v15, v6}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v6, Lgc/f;

    invoke-direct {v6, v11, v9, v15, v12}, Lgc/f;-><init>(Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;Lgc/d;)V

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v6, 0x2

    goto :goto_d

    :cond_20
    iput-object v8, v4, Lec/e;->c:Lzo/m;

    move-object v3, v1

    check-cast v3, Lya/e;

    iput-object v3, v4, Lec/e;->e:Lya/e;

    iput v10, v4, Lec/e;->b:I

    invoke-virtual {v0, v5, v4}, Ljc/d;->h(Ljava/util/List;LNm/c;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v2, :cond_21

    goto :goto_10

    :cond_21
    move-object v3, v8

    :goto_e
    new-instance v5, Lya/e;

    check-cast v1, Lya/e;

    iget-object v0, v1, Lya/e;->b:Ljava/lang/Throwable;

    invoke-direct {v5, v0}, Lya/e;-><init>(Ljava/lang/Throwable;)V

    move-object v8, v3

    :goto_f
    iput-object v7, v4, Lec/e;->c:Lzo/m;

    iput-object v7, v4, Lec/e;->e:Lya/e;

    const/4 v0, 0x2

    iput v0, v4, Lec/e;->b:I

    invoke-interface {v8, v5, v4}, Lzo/m;->emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v2, :cond_22

    :goto_10
    move-object v14, v2

    :cond_22
    :goto_11
    return-object v14

    :cond_23
    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    :pswitch_3
    move/from16 v16, v9

    instance-of v4, v2, Lec/c;

    if-eqz v4, :cond_24

    move-object v4, v2

    check-cast v4, Lec/c;

    iget v6, v4, Lec/c;->b:I

    and-int v9, v6, v16

    if-eqz v9, :cond_24

    sub-int v6, v6, v16

    iput v6, v4, Lec/c;->b:I

    goto :goto_12

    :cond_24
    new-instance v4, Lec/c;

    invoke-direct {v4, v0, v2}, Lec/c;-><init>(LAo/l;LLm/c;)V

    :goto_12
    iget-object v0, v4, Lec/c;->a:Ljava/lang/Object;

    sget-object v2, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v6, v4, Lec/c;->b:I

    if-eqz v6, :cond_27

    if-eq v6, v10, :cond_26

    const/4 v1, 0x2

    if-ne v6, v1, :cond_25

    invoke-static {v0}, LX4/x;->M(Ljava/lang/Object;)V

    goto/16 :goto_18

    :cond_25
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_26
    iget-object v1, v4, Lec/c;->e:Llc/d;

    iget-object v3, v4, Lec/c;->d:Lzo/m;

    invoke-static {v0}, LX4/x;->M(Ljava/lang/Object;)V

    goto/16 :goto_15

    :cond_27
    invoke-static {v0}, LX4/x;->M(Ljava/lang/Object;)V

    move-object v0, v1

    check-cast v0, Lya/j;

    instance-of v1, v0, Lya/g;

    move-object v6, v11

    check-cast v6, Lzo/m;

    if-eqz v1, :cond_2c

    check-cast v0, Lya/g;

    iget-object v0, v0, Lya/g;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-static {v0}, LIm/r;->b1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;

    check-cast v13, Ljava/lang/String;

    if-eqz v0, :cond_2b

    check-cast v12, Ljava/lang/String;

    invoke-virtual {v0, v12, v13}, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->toEntity(Ljava/lang/String;Ljava/lang/String;)Llc/a;

    move-result-object v1

    invoke-virtual {v0}, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->getTasks()Ljava/util/List;

    move-result-object v0

    new-instance v5, Ljava/util/ArrayList;

    invoke-static {v0, v3}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v5, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_13
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_28

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;

    invoke-virtual {v3}, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->toEntity()Llc/c;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_13

    :cond_28
    new-instance v0, Llc/d;

    invoke-direct {v0, v1, v5}, Llc/d;-><init>(Llc/a;Ljava/util/ArrayList;)V

    check-cast v15, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;

    invoke-static {v15}, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;->access$getCache$p(Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;)Ljc/d;

    move-result-object v1

    iput-object v6, v4, Lec/c;->d:Lzo/m;

    iput-object v0, v4, Lec/c;->e:Llc/d;

    iput v10, v4, Lec/c;->b:I

    iget-object v1, v1, Ljc/d;->a:Lkc/d;

    new-instance v3, Lhf/c;

    const/16 v5, 0xb

    invoke-direct {v3, v5, v1, v0}, Lhf/c;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    iget-object v1, v1, Lkc/d;->a:Ljava/lang/Object;

    check-cast v1, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-static {v1, v3, v4}, LP2/E;->M(LE4/t;LVm/k;LLm/c;)Ljava/lang/Object;

    move-result-object v1

    sget-object v3, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    if-ne v1, v3, :cond_29

    goto :goto_14

    :cond_29
    move-object v1, v14

    :goto_14
    if-ne v1, v2, :cond_2a

    goto :goto_17

    :cond_2a
    move-object v1, v0

    move-object v3, v6

    :goto_15
    new-instance v5, Lya/g;

    invoke-virtual {v1}, Llc/d;->a()Lgc/j;

    move-result-object v0

    invoke-direct {v5, v0}, Lya/g;-><init>(Ljava/lang/Object;)V

    move-object v6, v3

    goto :goto_16

    :cond_2b
    new-instance v5, Lya/e;

    new-instance v0, Ljava/lang/Throwable;

    const-string v1, "No plan found for tripId: "

    invoke-virtual {v1, v13}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v0}, Lya/e;-><init>(Ljava/lang/Throwable;)V

    goto :goto_16

    :cond_2c
    instance-of v1, v0, Lya/e;

    if-eqz v1, :cond_2d

    new-instance v5, Lya/e;

    check-cast v0, Lya/e;

    iget-object v0, v0, Lya/e;->b:Ljava/lang/Throwable;

    invoke-direct {v5, v0}, Lya/e;-><init>(Ljava/lang/Throwable;)V

    goto :goto_16

    :cond_2d
    invoke-static {v0, v5}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2f

    :goto_16
    iput-object v7, v4, Lec/c;->d:Lzo/m;

    iput-object v7, v4, Lec/c;->e:Llc/d;

    const/4 v0, 0x2

    iput v0, v4, Lec/c;->b:I

    invoke-interface {v6, v5, v4}, Lzo/m;->emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v2, :cond_2e

    :goto_17
    move-object v14, v2

    :cond_2e
    :goto_18
    return-object v14

    :cond_2f
    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    :pswitch_4
    move/from16 v16, v9

    instance-of v3, v2, Lcb/H0;

    if-eqz v3, :cond_30

    move-object v3, v2

    check-cast v3, Lcb/H0;

    iget v4, v3, Lcb/H0;->b:I

    and-int v5, v4, v16

    if-eqz v5, :cond_30

    sub-int v4, v4, v16

    iput v4, v3, Lcb/H0;->b:I

    goto :goto_19

    :cond_30
    new-instance v3, Lcb/H0;

    invoke-direct {v3, v0, v2}, Lcb/H0;-><init>(LAo/l;LLm/c;)V

    :goto_19
    iget-object v0, v3, Lcb/H0;->a:Ljava/lang/Object;

    sget-object v2, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v4, v3, Lcb/H0;->b:I

    if-eqz v4, :cond_32

    if-ne v4, v10, :cond_31

    invoke-static {v0}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_1a

    :cond_31
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_32
    invoke-static {v0}, LX4/x;->M(Ljava/lang/Object;)V

    move-object v0, v1

    check-cast v0, Lya/j;

    instance-of v1, v0, Lya/e;

    if-eqz v1, :cond_33

    check-cast v0, Lya/e;

    iget-object v0, v0, Lya/e;->b:Ljava/lang/Throwable;

    check-cast v12, Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;

    invoke-virtual {v12}, Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    const-string v4, "Error fetching security key for device "

    invoke-static {v4, v1}, LB/h;->k(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    check-cast v15, Lcom/eightsleep/data_device/data/repository/OfflineRepository;

    invoke-static {v15, v0, v1}, Lcom/eightsleep/data_device/data/repository/OfflineRepository;->access$log(Lcom/eightsleep/data_device/data/repository/OfflineRepository;Ljava/lang/Throwable;Ljava/lang/String;)V

    new-instance v0, Lya/g;

    check-cast v13, Lcom/eightsleep/data_device/data/model/offline/OfflineModeData;

    invoke-direct {v0, v13}, Lya/g;-><init>(Ljava/lang/Object;)V

    :cond_33
    iput v10, v3, Lcb/H0;->b:I

    check-cast v11, Lzo/m;

    invoke-interface {v11, v0, v3}, Lzo/m;->emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v2, :cond_34

    move-object v14, v2

    :cond_34
    :goto_1a
    return-object v14

    :pswitch_5
    move/from16 v16, v9

    instance-of v3, v2, LYd/m;

    if-eqz v3, :cond_35

    move-object v3, v2

    check-cast v3, LYd/m;

    iget v4, v3, LYd/m;->b:I

    and-int v5, v4, v16

    if-eqz v5, :cond_35

    sub-int v4, v4, v16

    iput v4, v3, LYd/m;->b:I

    goto :goto_1b

    :cond_35
    new-instance v3, LYd/m;

    invoke-direct {v3, v0, v2}, LYd/m;-><init>(LAo/l;LLm/c;)V

    :goto_1b
    iget-object v0, v3, LYd/m;->a:Ljava/lang/Object;

    sget-object v2, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v4, v3, LYd/m;->b:I

    if-eqz v4, :cond_37

    if-ne v4, v10, :cond_36

    invoke-static {v0}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_1d

    :cond_36
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_37
    invoke-static {v0}, LX4/x;->M(Ljava/lang/Object;)V

    move-object v0, v1

    check-cast v0, Lya/j;

    instance-of v1, v0, Lya/f;

    if-eqz v1, :cond_38

    goto :goto_1c

    :cond_38
    instance-of v1, v0, Lya/g;

    check-cast v13, Ljava/lang/String;

    check-cast v12, Ljava/lang/String;

    check-cast v15, Lcom/eightsleep/data_wismo/data/repository/OrderRepository;

    if-eqz v1, :cond_39

    invoke-static {v15, v12, v13}, Lcom/eightsleep/data_wismo/data/repository/OrderRepository;->access$releaseLiveClaimLocally(Lcom/eightsleep/data_wismo/data/repository/OrderRepository;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1c

    :cond_39
    instance-of v1, v0, Lya/e;

    if-eqz v1, :cond_3c

    move-object v1, v0

    check-cast v1, Lya/e;

    iget-object v1, v1, Lya/e;->b:Ljava/lang/Throwable;

    invoke-static {v15, v1}, Lcom/eightsleep/data_wismo/data/repository/OrderRepository;->access$setupStatusRuling(Lcom/eightsleep/data_wismo/data/repository/OrderRepository;Ljava/lang/Throwable;)LVm/k;

    move-result-object v1

    if-nez v1, :cond_3a

    goto :goto_1c

    :cond_3a
    invoke-static {v15, v12, v13, v1}, Lcom/eightsleep/data_wismo/data/repository/OrderRepository;->access$updateSetupStatusLocally(Lcom/eightsleep/data_wismo/data/repository/OrderRepository;Ljava/lang/String;Ljava/lang/String;LVm/k;)V

    new-instance v0, Lya/g;

    invoke-direct {v0, v14}, Lya/g;-><init>(Ljava/lang/Object;)V

    :goto_1c
    iput v10, v3, LYd/m;->b:I

    check-cast v11, Lzo/m;

    invoke-interface {v11, v0, v3}, Lzo/m;->emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v2, :cond_3b

    move-object v14, v2

    :cond_3b
    :goto_1d
    return-object v14

    :cond_3c
    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    :pswitch_6
    check-cast v1, Lya/j;

    invoke-virtual {v0, v1, v2}, LAo/l;->a(Lya/j;LLm/c;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_7
    move-object v0, v1

    check-cast v0, Lya/j;

    check-cast v15, Lkotlin/jvm/internal/v;

    iget-boolean v1, v15, Lkotlin/jvm/internal/v;->a:Z

    if-nez v1, :cond_3e

    instance-of v1, v0, Lya/f;

    if-nez v1, :cond_3e

    iput-boolean v10, v15, Lkotlin/jvm/internal/v;->a:Z

    check-cast v12, LRb/E0;

    iget-object v1, v12, LRb/E0;->f:LOa/a;

    instance-of v3, v0, Lya/e;

    check-cast v13, Ljava/lang/String;

    const-string v4, "device_id"

    const-string v5, "outcome"

    if-eqz v3, :cond_3d

    new-instance v3, LHm/k;

    const-string v6, "failure"

    invoke-direct {v3, v5, v6}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v5, LHm/k;

    invoke-direct {v5, v4, v13}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    move-object v4, v0

    check-cast v4, Lya/e;

    iget-object v4, v4, Lya/e;->b:Ljava/lang/Throwable;

    invoke-virtual {v4}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v6, LHm/k;

    const-string v7, "error_description"

    invoke-direct {v6, v7, v4}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {v3, v5, v6}, [LHm/k;

    move-result-object v3

    invoke-static {v3}, LIm/F;->R([LHm/k;)Ljava/util/Map;

    move-result-object v3

    goto :goto_1e

    :cond_3d
    new-instance v3, LHm/k;

    const-string v6, "success"

    invoke-direct {v3, v5, v6}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v5, LHm/k;

    invoke-direct {v5, v4, v13}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {v3, v5}, [LHm/k;

    move-result-object v3

    invoke-static {v3}, LIm/F;->R([LHm/k;)Ljava/util/Map;

    move-result-object v3

    :goto_1e
    const-string v4, "onboarding_device_registration"

    invoke-virtual {v1, v4, v3}, LOa/a;->a(Ljava/lang/String;Ljava/util/Map;)V

    :cond_3e
    check-cast v11, Lzo/m;

    invoke-interface {v11, v0, v2}, Lzo/m;->emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    if-ne v0, v1, :cond_3f

    move-object v14, v0

    :cond_3f
    return-object v14

    :pswitch_8
    move-object v0, v1

    check-cast v0, LE/k;

    instance-of v1, v0, LE/n;

    check-cast v13, Lkotlin/jvm/internal/z;

    check-cast v15, Lkotlin/jvm/internal/A;

    check-cast v11, Lm0/Z;

    if-eqz v1, :cond_41

    iget-object v0, v15, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    check-cast v0, Lwo/h0;

    if-eqz v0, :cond_40

    invoke-interface {v0, v7}, Lwo/h0;->b(Ljava/util/concurrent/CancellationException;)V

    :cond_40
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, v13, Lkotlin/jvm/internal/z;->a:J

    sget v0, LQg/w;->a:F

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v11, v0}, Lm0/Z;->setValue(Ljava/lang/Object;)V

    goto :goto_1f

    :cond_41
    instance-of v1, v0, LE/o;

    if-nez v1, :cond_42

    instance-of v0, v0, LE/m;

    if-eqz v0, :cond_44

    :cond_42
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-wide v2, v13, Lkotlin/jvm/internal/z;->a:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x82

    sub-long/2addr v2, v0

    const-wide/16 v0, 0x0

    cmp-long v4, v2, v0

    if-gez v4, :cond_43

    move-wide v2, v0

    :cond_43
    new-instance v0, LQg/t;

    invoke-direct {v0, v2, v3, v11, v7}, LQg/t;-><init>(JLm0/Z;LLm/c;)V

    check-cast v12, Lwo/z;

    const/4 v1, 0x3

    invoke-static {v12, v7, v7, v0, v1}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    move-result-object v0

    iput-object v0, v15, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    :cond_44
    :goto_1f
    return-object v14

    :pswitch_9
    move-object v0, v1

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    check-cast v15, LP/o0;

    if-eqz v0, :cond_45

    invoke-virtual {v15}, LP/o0;->b()Z

    move-result v0

    if-eqz v0, :cond_45

    check-cast v13, Ld0/d0;

    invoke-virtual {v13}, Ld0/d0;->n()Lp1/w;

    move-result-object v0

    iget-object v1, v13, Ld0/d0;->b:Lp1/p;

    check-cast v12, Lp1/x;

    check-cast v11, Lp1/j;

    invoke-static {v12, v15, v0, v11, v1}, LP/H;->A(Lp1/x;LP/o0;Lp1/w;Lp1/j;Lp1/p;)V

    goto :goto_20

    :cond_45
    invoke-static {v15}, LP/H;->q(LP/o0;)V

    :goto_20
    return-object v14

    :pswitch_a
    move/from16 v16, v9

    instance-of v3, v2, LAo/k;

    if-eqz v3, :cond_46

    move-object v3, v2

    check-cast v3, LAo/k;

    iget v4, v3, LAo/k;->e:I

    and-int v5, v4, v16

    if-eqz v5, :cond_46

    sub-int v4, v4, v16

    iput v4, v3, LAo/k;->e:I

    goto :goto_21

    :cond_46
    new-instance v3, LAo/k;

    invoke-direct {v3, v0, v2}, LAo/k;-><init>(LAo/l;LLm/c;)V

    :goto_21
    iget-object v2, v3, LAo/k;->c:Ljava/lang/Object;

    sget-object v4, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v5, v3, LAo/k;->e:I

    if-eqz v5, :cond_48

    if-ne v5, v10, :cond_47

    iget-object v0, v3, LAo/k;->b:Ljava/lang/Object;

    iget-object v1, v3, LAo/k;->a:LAo/l;

    invoke-static {v2}, LX4/x;->M(Ljava/lang/Object;)V

    move-object/from16 v18, v1

    move-object v1, v0

    move-object/from16 v0, v18

    goto :goto_22

    :cond_47
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_48
    invoke-static {v2}, LX4/x;->M(Ljava/lang/Object;)V

    check-cast v15, Lkotlin/jvm/internal/A;

    iget-object v2, v15, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    check-cast v2, Lwo/h0;

    if-eqz v2, :cond_49

    new-instance v5, Lkotlinx/coroutines/flow/internal/ChildCancelledException;

    invoke-direct {v5}, Lkotlinx/coroutines/flow/internal/ChildCancelledException;-><init>()V

    invoke-interface {v2, v5}, Lwo/h0;->b(Ljava/util/concurrent/CancellationException;)V

    iput-object v0, v3, LAo/k;->a:LAo/l;

    iput-object v1, v3, LAo/k;->b:Ljava/lang/Object;

    iput v10, v3, LAo/k;->e:I

    invoke-interface {v2, v3}, Lwo/h0;->u(LLm/c;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v4, :cond_49

    move-object v14, v4

    goto :goto_23

    :cond_49
    :goto_22
    iget-object v2, v0, LAo/l;->b:Ljava/lang/Object;

    check-cast v2, Lkotlin/jvm/internal/A;

    sget-object v3, Lwo/B;->UNDISPATCHED:Lwo/B;

    new-instance v4, LAo/j;

    iget-object v5, v0, LAo/l;->e:Ljava/lang/Object;

    check-cast v5, Lzo/m;

    iget-object v6, v0, LAo/l;->d:Ljava/lang/Object;

    check-cast v6, LAo/n;

    invoke-direct {v4, v6, v5, v1, v7}, LAo/j;-><init>(LAo/n;Lzo/m;Ljava/lang/Object;LLm/c;)V

    iget-object v0, v0, LAo/l;->c:Ljava/lang/Object;

    check-cast v0, Lwo/z;

    invoke-static {v0, v7, v3, v4, v10}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    move-result-object v0

    iput-object v0, v2, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    :goto_23
    return-object v14

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_8
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
