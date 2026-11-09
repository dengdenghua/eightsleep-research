.class final Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# annotations
.annotation runtime LNm/e;
    c = "com.eightsleep.presentation_home.viewmodel.dynamic_home.DynamicHomeViewModel$observeInsights$1$3"
    f = "DynamicHomeViewModel.kt"
    l = {}
    m = "invokeSuspend"
.end annotation

.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "LNm/i;",
        "LVm/n;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0001\u001a\u00020\u0000H\n\u00a2\u0006\u0004\u0008\u0003\u0010\u0004"
    }
    d2 = {
        "LFf/j0;",
        "observedSources",
        "LHm/B;",
        "<anonymous>",
        "(LFf/j0;)V"
    }
    k = 0x3
    mv = {
        0x2,
        0x0,
        0x0
    }
.end annotation


# instance fields
.field synthetic L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;


# direct methods
.method public constructor <init>(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;LLm/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;",
            "LLm/c<",
            "-",
            "Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method

.method public static synthetic g(LFf/j0;Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;LFf/v;)LFf/v;
    .locals 0

    invoke-static/range {p0 .. p6}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->invokeSuspend$lambda$6(LFf/j0;Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;LFf/v;)LFf/v;

    move-result-object p0

    return-object p0
.end method

.method private static final invokeSuspend$lambda$6(LFf/j0;Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;LFf/v;)LFf/v;
    .locals 59

    move-object/from16 v0, p0

    move-object/from16 v1, p6

    const/4 v6, 0x6

    const/4 v7, 0x5

    const/4 v8, 0x4

    const/4 v9, 0x1

    const/4 v10, 0x3

    const/4 v14, 0x2

    iget-object v15, v0, LFf/j0;->c:Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;

    sget-object v16, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v15}, Ljava/lang/Enum;->ordinal()I

    move-result v15

    aget v15, v16, v15

    if-eq v15, v9, :cond_9d

    const v16, 0x7f0802b1

    iget-object v4, v0, LFf/j0;->C:LFf/k0;

    const/16 v17, 0xa

    iget-object v12, v0, LFf/j0;->e:Ljava/util/List;

    if-eq v15, v14, :cond_95

    sget-object v20, LIm/z;->a:LIm/z;

    const/16 v24, 0x7

    iget-object v2, v0, LFf/j0;->k:Ljava/util/Set;

    iget-object v13, v0, LFf/j0;->l:Ljava/util/List;

    iget-object v5, v0, LFf/j0;->F:Ljd/j;

    iget-object v3, v0, LFf/j0;->P:Lsc/i;

    move/from16 v28, v14

    iget-object v14, v0, LFf/j0;->e0:Ljava/lang/String;

    iget-object v11, v0, LFf/j0;->a:LQb/p;

    iget-object v9, v0, LFf/j0;->m:Ljava/util/List;

    if-eq v15, v10, :cond_3c

    if-eq v15, v8, :cond_28

    if-ne v15, v7, :cond_27

    invoke-static/range {p1 .. p1}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->access$getFeatureFlags(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;)LWc/b;

    move-result-object v2

    iget-object v2, v2, LWc/b;->F:LYc/c;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v2}, Lcom/launchdarkly/sdk/android/L;->H(LYc/e;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v4, v0, LFf/j0;->b:LQb/j;

    iget-object v13, v0, LFf/j0;->d:Ljava/time/LocalDate;

    if-eqz v13, :cond_1e

    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    move-object v15, v9

    check-cast v15, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;

    iget-object v15, v15, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->a:Ljava/time/LocalDate;

    invoke-static {v15, v13}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_0

    goto :goto_0

    :cond_1
    const/4 v9, 0x0

    :goto_0
    move-object/from16 v32, v9

    check-cast v32, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v12}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_3

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    move-object v15, v12

    check-cast v15, Lc9/f;

    iget-object v15, v15, Lc9/f;->e:Lc9/g;

    move/from16 v45, v7

    sget-object v7, Lcom/eightsleep/data_ai_insights/enums/AiInsightSleepState;->POST_SLEEP:Lcom/eightsleep/data_ai_insights/enums/AiInsightSleepState;

    iget-object v15, v15, Lc9/g;->c:Lcom/eightsleep/data_ai_insights/enums/AiInsightSleepState;

    if-ne v15, v7, :cond_2

    invoke-virtual {v2, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    move/from16 v7, v45

    goto :goto_1

    :cond_3
    move/from16 v45, v7

    new-instance v7, LCh/I1;

    invoke-direct {v7, v6}, LCh/I1;-><init>(I)V

    invoke-static {v2, v7}, LIm/r;->J1(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v31

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget-object v7, v1, LFf/v;->d:Ljava/util/List;

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_4
    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_5

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    instance-of v15, v12, LFf/T;

    if-eqz v15, :cond_4

    invoke-virtual {v2, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_5
    invoke-static {v2}, LIm/r;->b1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, LFf/T;

    if-eqz v11, :cond_6

    iget-object v9, v11, LQb/p;->i:Ljava/lang/String;

    move-object/from16 v35, v9

    goto :goto_3

    :cond_6
    const/16 v35, 0x0

    :goto_3
    iget-object v9, v0, LFf/j0;->f:LC8/o;

    invoke-virtual {v9}, LC8/o;->a()Ljava/lang/Object;

    move-result-object v12

    move-object/from16 v44, v12

    check-cast v44, Lc9/w;

    sget-object v42, LFf/h0;->INSIGHT:LFf/h0;

    const/16 v41, 0x0

    const/16 v43, 0x0

    iget-object v12, v0, LFf/j0;->v:Ljava/lang/Long;

    const/16 v36, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x0

    const/16 v39, 0x0

    iget-object v15, v0, LFf/j0;->h:LGa/f;

    move-object/from16 v33, v12

    move-object/from16 v40, v15

    move-object/from16 v34, v32

    move-object/from16 v32, v2

    invoke-static/range {v31 .. v44}, LIm/M;->E(Ljava/util/List;LFf/T;Ljava/lang/Long;Lcom/eightsleep/data_metrics/domain/model/DailyTrends;Ljava/lang/String;Ljava/lang/String;Lrb/c;ZLrb/a;LGa/f;ZLFf/h0;ZLc9/w;)LFf/T;

    move-result-object v2

    move-object/from16 v32, v34

    iget-boolean v12, v2, LFf/T;->b:Z

    if-nez v12, :cond_7

    goto :goto_4

    :cond_7
    const/4 v2, 0x0

    :goto_4
    sget-object v12, LFf/I0;->d:Ljava/util/List;

    invoke-virtual {v9}, LC8/o;->a()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lc9/w;

    if-eqz v9, :cond_8

    iget-object v9, v9, Lc9/w;->a:Ljava/util/List;

    move-object/from16 v31, v9

    goto :goto_5

    :cond_8
    move-object/from16 v31, v20

    :goto_5
    iget-object v9, v0, LFf/j0;->n:Ljava/util/List;

    invoke-static {v9}, LIm/r;->b1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v9

    move-object/from16 v33, v9

    check-cast v33, Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_9
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_a

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    move-object v15, v12

    check-cast v15, Lc8/c;

    instance-of v15, v15, LFf/I0;

    if-eqz v15, :cond_9

    goto :goto_6

    :cond_a
    const/4 v12, 0x0

    :goto_6
    instance-of v9, v12, LFf/I0;

    if-eqz v9, :cond_b

    check-cast v12, LFf/I0;

    goto :goto_7

    :cond_b
    const/4 v12, 0x0

    :goto_7
    if-eqz v12, :cond_c

    iget-boolean v9, v12, LFf/I0;->b:Z

    const/4 v12, 0x1

    if-ne v9, v12, :cond_c

    const/16 v38, 0x1

    goto :goto_8

    :cond_c
    const/16 v38, 0x0

    :goto_8
    iget-boolean v9, v0, LFf/j0;->a0:Z

    iget-object v12, v0, LFf/j0;->O:LFf/p;

    iget-boolean v15, v0, LFf/j0;->b0:Z

    move/from16 v39, v8

    iget-boolean v8, v0, LFf/j0;->f0:Z

    move/from16 v35, v8

    move/from16 v36, v9

    move-object/from16 v37, v12

    move/from16 v34, v15

    invoke-static/range {v31 .. v38}, LP2/n;->O(Ljava/util/List;Lcom/eightsleep/data_metrics/domain/model/DailyTrends;Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;ZZZLFf/p;Z)LFf/I0;

    move-result-object v8

    move-object/from16 v9, v32

    const/4 v12, 0x0

    invoke-static {v8, v12, v13, v10}, LFf/I0;->c(LFf/I0;ZLjava/time/LocalDate;I)LFf/I0;

    move-result-object v8

    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_9
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_e

    move/from16 v31, v10

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    instance-of v6, v10, LFf/k;

    if-eqz v6, :cond_d

    invoke-virtual {v12, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_d
    move/from16 v10, v31

    const/4 v6, 0x6

    goto :goto_9

    :cond_e
    move/from16 v31, v10

    invoke-static {v12}, LIm/r;->b1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, LFf/k;

    if-eqz v6, :cond_f

    iget-object v6, v6, LFf/k;->b:Lwg/G0;

    iget-object v6, v6, Lwg/G0;->a:Ljava/lang/String;

    goto :goto_a

    :cond_f
    const/4 v6, 0x0

    :goto_a
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_10
    :goto_b
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_11

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    instance-of v15, v12, LFf/j;

    if-eqz v15, :cond_10

    invoke-virtual {v10, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_b

    :cond_11
    invoke-static {v10}, LIm/r;->b1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, LFf/j;

    if-eqz v7, :cond_12

    iget-object v7, v7, LFf/j;->c:LFf/S0;

    iget-boolean v10, v7, LFf/S0;->b:Z

    if-eqz v10, :cond_12

    goto :goto_c

    :cond_12
    const/4 v7, 0x0

    :goto_c
    const-string v10, "household"

    invoke-static {v4, v10}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v4}, LQb/j;->g()LQb/e;

    move-result-object v10

    if-eqz v10, :cond_13

    iget-object v10, v10, LQb/e;->a:Ljava/lang/String;

    goto :goto_d

    :cond_13
    const/4 v10, 0x0

    :goto_d
    invoke-virtual {v4}, LQb/j;->e()LQb/p;

    move-result-object v12

    if-eqz v12, :cond_16

    iget-object v12, v12, LQb/p;->e:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_e
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_15

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    move-object v1, v15

    check-cast v1, LQb/t;

    iget-object v1, v1, LQb/t;->a:Ljava/lang/String;

    invoke-static {v1, v10}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    goto :goto_f

    :cond_14
    move-object/from16 v1, p6

    goto :goto_e

    :cond_15
    const/4 v15, 0x0

    :goto_f
    check-cast v15, LQb/t;

    if-eqz v15, :cond_16

    iget-object v1, v15, LQb/t;->b:Ljava/time/LocalDate;

    goto :goto_10

    :cond_16
    const/4 v1, 0x0

    :goto_10
    invoke-static {v4}, LP2/p;->z(LQb/j;)LFf/S0;

    move-result-object v4

    new-instance v10, LFf/j;

    invoke-direct {v10, v1, v13, v4}, LFf/j;-><init>(Ljava/time/LocalDate;Ljava/time/LocalDate;LFf/S0;)V

    if-eqz v7, :cond_17

    iget-object v1, v7, LFf/S0;->c:LYa/H;

    const/4 v12, 0x1

    invoke-static {v4, v12, v1, v12}, LFf/S0;->c(LFf/S0;ZLYa/H;I)LFf/S0;

    move-result-object v1

    invoke-static {v10, v1}, LFf/j;->c(LFf/j;LFf/S0;)LFf/j;

    move-result-object v10

    :cond_17
    sget-object v1, Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;->AWAY:Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;

    move-object v4, v2

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-boolean v7, v0, LFf/j0;->b0:Z

    if-eqz v7, :cond_18

    move-object v12, v8

    goto :goto_11

    :cond_18
    move-object v12, v4

    :goto_11
    if-eqz v7, :cond_19

    goto :goto_12

    :cond_19
    move-object v4, v8

    :goto_12
    if-eqz v9, :cond_1a

    new-instance v7, LFf/k;

    invoke-static {v9, v6}, LP2/I;->H(Lcom/eightsleep/data_metrics/domain/model/DailyTrends;Ljava/lang/String;)Lwg/G0;

    move-result-object v6

    invoke-direct {v7, v9, v6}, LFf/k;-><init>(Lcom/eightsleep/data_metrics/domain/model/DailyTrends;Lwg/G0;)V

    goto :goto_13

    :cond_1a
    const/4 v7, 0x0

    :goto_13
    if-eqz v11, :cond_1b

    iget-object v6, v11, LQb/p;->a:Ljava/lang/String;

    if-eqz v6, :cond_1b

    invoke-virtual {v6, v14}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    const/4 v8, 0x1

    if-ne v6, v8, :cond_1b

    const/4 v6, 0x1

    goto :goto_14

    :cond_1b
    const/4 v6, 0x0

    :goto_14
    if-eqz v3, :cond_1d

    if-eqz v6, :cond_1c

    goto :goto_15

    :cond_1c
    const/4 v3, 0x0

    :goto_15
    if-eqz v3, :cond_1d

    new-instance v6, Lyf/m;

    invoke-direct {v6, v3}, Lyf/m;-><init>(Lsc/i;)V

    goto :goto_16

    :cond_1d
    const/4 v6, 0x0

    :goto_16
    iget-object v0, v0, LFf/j0;->G:Luc/N0;

    invoke-static {v5, v13, v0}, LP2/o;->y(Ljd/j;Ljava/time/LocalDate;Luc/N0;)LFf/N0;

    move-result-object v0

    const/4 v3, 0x6

    new-array v3, v3, [Lc8/c;

    const/16 v29, 0x0

    aput-object v10, v3, v29

    const/16 v30, 0x1

    aput-object v12, v3, v30

    aput-object v4, v3, v28

    aput-object v7, v3, v31

    aput-object v6, v3, v39

    aput-object v0, v3, v45

    invoke-static {v3}, LIm/n;->h0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/16 v11, 0xfec

    move-object/from16 v0, p6

    invoke-static/range {v0 .. v11}, LFf/v;->u(LFf/v;Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;Ljava/lang/Integer;Ljava/util/List;LFf/q1;ZZZLjava/util/List;ZLFf/p1;I)LFf/v;

    move-result-object v1

    move-object/from16 v3, p6

    goto/16 :goto_1f

    :cond_1e
    move/from16 v31, v10

    sget-object v1, Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;->AWAY:Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;

    iget-object v0, v0, LFf/j0;->r:LHm/k;

    if-eqz v2, :cond_1f

    iget-object v3, v0, LHm/k;->a:Ljava/lang/Object;

    if-eqz v3, :cond_1f

    const v3, 0x7f0802b0

    goto :goto_17

    :cond_1f
    const v3, 0x7f0802af

    :goto_17
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    if-eqz v2, :cond_20

    iget-object v5, v0, LHm/k;->a:Ljava/lang/Object;

    if-eqz v5, :cond_20

    const/4 v5, 0x1

    goto :goto_18

    :cond_20
    const/4 v5, 0x0

    :goto_18
    new-instance v6, LFf/i;

    invoke-direct {v6, v5}, LFf/i;-><init>(Z)V

    iget-object v5, v0, LHm/k;->a:Ljava/lang/Object;

    check-cast v5, Lgc/o;

    iget-object v0, v0, LHm/k;->b:Ljava/lang/Object;

    check-cast v0, Lgc/c;

    if-eqz v0, :cond_21

    invoke-virtual {v0}, Lgc/c;->a()Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    move-result-object v0

    goto :goto_19

    :cond_21
    const/4 v0, 0x0

    :goto_19
    new-instance v7, LFf/a0;

    new-instance v8, Lng/f;

    if-eqz v5, :cond_25

    new-instance v9, Lng/d;

    iget-object v10, v5, Lgc/o;->d:Ljava/util/ArrayList;

    invoke-static {v10}, LIm/r;->k1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lgc/p;

    iget-object v11, v11, Lgc/p;->c:Lgc/q;

    invoke-static {v10}, LIm/r;->b1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lgc/p;

    if-eqz v10, :cond_22

    iget-object v10, v10, Lgc/p;->d:LGa/s;

    if-eqz v10, :cond_22

    sget-object v12, Ljava/time/temporal/ChronoUnit;->HOURS:Ljava/time/temporal/ChronoUnit;

    invoke-static {}, Ljava/time/Instant;->now()Ljava/time/Instant;

    move-result-object v13

    iget-object v10, v10, LGa/s;->a:Ljava/time/Instant;

    invoke-virtual {v12, v13, v10}, Ljava/time/temporal/ChronoUnit;->between(Ljava/time/temporal/Temporal;Ljava/time/temporal/Temporal;)J

    move-result-wide v12

    long-to-int v10, v12

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    goto :goto_1a

    :cond_22
    const/4 v10, 0x0

    :goto_1a
    if-eqz v10, :cond_23

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    goto :goto_1b

    :cond_23
    const/4 v10, 0x0

    :goto_1b
    if-nez v0, :cond_24

    sget-object v0, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;->UNKNOWN:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    :cond_24
    iget-object v5, v5, Lgc/o;->b:Ljava/lang/String;

    iget-object v11, v11, Lgc/q;->a:Ljava/lang/String;

    invoke-direct {v9, v5, v11, v10, v0}, Lng/d;-><init>(Ljava/lang/String;Ljava/lang/String;ILcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;)V

    :goto_1c
    const/4 v12, 0x1

    goto :goto_1d

    :cond_25
    const/4 v9, 0x0

    goto :goto_1c

    :goto_1d
    invoke-direct {v8, v12, v9}, Lng/f;-><init>(ZLng/d;)V

    invoke-direct {v7, v8}, LFf/a0;-><init>(Lng/f;)V

    if-eqz v2, :cond_26

    goto :goto_1e

    :cond_26
    const/4 v7, 0x0

    :goto_1e
    invoke-static {v4}, LP2/p;->z(LQb/j;)LFf/S0;

    move-result-object v0

    move/from16 v2, v31

    new-array v2, v2, [Lc8/c;

    const/16 v29, 0x0

    aput-object v6, v2, v29

    aput-object v7, v2, v12

    aput-object v0, v2, v28

    invoke-static {v2}, LIm/n;->h0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    const/4 v8, 0x0

    const/16 v11, 0xfec

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v2, v3

    move-object v3, v0

    move-object/from16 v0, p6

    invoke-static/range {v0 .. v11}, LFf/v;->u(LFf/v;Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;Ljava/lang/Integer;Ljava/util/List;LFf/q1;ZZZLjava/util/List;ZLFf/p1;I)LFf/v;

    move-result-object v1

    move-object v3, v0

    :goto_1f
    move-object v2, v1

    move-object v0, v3

    :goto_20
    const/16 v25, 0x0

    goto/16 :goto_7e

    :cond_27
    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    :cond_28
    move-object v3, v1

    move/from16 v39, v8

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v9}, LP2/d;->O(Ljava/util/List;)Lcom/eightsleep/data_metrics/domain/model/DailyTrends;

    move-result-object v1

    iget-object v5, v3, LFf/v;->d:Ljava/util/List;

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_29
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2a

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v7, v6

    check-cast v7, Lc8/c;

    instance-of v7, v7, LGf/e;

    if-eqz v7, :cond_29

    goto :goto_21

    :cond_2a
    const/4 v6, 0x0

    :goto_21
    instance-of v5, v6, LGf/e;

    if-eqz v5, :cond_2b

    check-cast v6, LGf/e;

    goto :goto_22

    :cond_2b
    const/4 v6, 0x0

    :goto_22
    sget-object v5, Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;->IN_SESSION:Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;

    const v7, 0x7f0802b2

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    if-nez v4, :cond_2c

    const/4 v8, 0x0

    goto :goto_23

    :cond_2c
    new-instance v8, LFf/l0;

    sget-object v9, LGa/t;->TIME:LGa/t;

    iget-object v10, v4, LFf/k0;->d:LGa/s;

    move/from16 v11, v28

    invoke-static {v10, v9, v11}, LGa/s;->f(LGa/s;LGa/t;I)Ljava/lang/String;

    move-result-object v9

    iget-object v10, v4, LFf/k0;->b:Ljava/lang/String;

    iget-object v11, v4, LFf/k0;->c:Ljava/lang/String;

    iget-object v4, v4, LFf/k0;->a:Ljava/lang/String;

    invoke-direct {v8, v4, v10, v11, v9}, LFf/l0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_23
    new-instance v18, LFf/W;

    if-eqz v1, :cond_2d

    invoke-virtual {v1}, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->a()Lcom/eightsleep/data_metrics/domain/model/Session;

    move-result-object v4

    if-eqz v4, :cond_2d

    iget-object v4, v4, Lcom/eightsleep/data_metrics/domain/model/Session;->e:LGa/s;

    move-object/from16 v19, v4

    goto :goto_24

    :cond_2d
    const/16 v19, 0x0

    :goto_24
    if-eqz v1, :cond_2e

    invoke-virtual {v1}, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->f()Ljava/lang/Long;

    move-result-object v4

    move-object/from16 v20, v4

    goto :goto_25

    :cond_2e
    const/16 v20, 0x0

    :goto_25
    if-eqz v1, :cond_2f

    invoke-virtual {v1}, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->a()Lcom/eightsleep/data_metrics/domain/model/Session;

    move-result-object v4

    if-eqz v4, :cond_2f

    iget-object v4, v4, Lcom/eightsleep/data_metrics/domain/model/Session;->b:LGa/s;

    move-object/from16 v21, v4

    goto :goto_26

    :cond_2f
    const/16 v21, 0x0

    :goto_26
    if-eqz v1, :cond_31

    invoke-virtual {v1}, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->a()Lcom/eightsleep/data_metrics/domain/model/Session;

    move-result-object v4

    if-eqz v4, :cond_31

    sget-object v9, Lcom/eightsleep/data_metrics/domain/model/Session;->v:Ljava/time/Duration;

    invoke-static {}, Ljava/time/Instant;->now()Ljava/time/Instant;

    move-result-object v9

    const-string v10, "now"

    invoke-static {v9, v10}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v4, v4, Lcom/eightsleep/data_metrics/domain/model/Session;->b:LGa/s;

    iget-object v4, v4, LGa/s;->a:Ljava/time/Instant;

    if-nez v4, :cond_30

    goto :goto_27

    :cond_30
    invoke-static {v4, v9}, Ljava/time/Duration;->between(Ljava/time/temporal/Temporal;Ljava/time/temporal/Temporal;)Ljava/time/Duration;

    move-result-object v4

    sget-object v9, Lcom/eightsleep/data_metrics/domain/model/Session;->v:Ljava/time/Duration;

    invoke-virtual {v4, v9}, Ljava/time/Duration;->compareTo(Ljava/time/Duration;)I

    move-result v4

    if-ltz v4, :cond_31

    const/16 v22, 0x1

    goto :goto_28

    :cond_31
    :goto_27
    const/16 v22, 0x0

    :goto_28
    const/16 v23, 0x18

    invoke-direct/range {v18 .. v23}, LFf/W;-><init>(LGa/s;Ljava/lang/Long;LGa/s;ZI)V

    invoke-virtual/range {v18 .. v18}, LFf/W;->d()LFf/W;

    move-result-object v4

    if-eqz v1, :cond_36

    iget-object v9, v1, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->C:Ljava/util/List;

    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-nez v10, :cond_32

    const/4 v10, 0x0

    goto :goto_29

    :cond_32
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-nez v11, :cond_33

    goto :goto_29

    :cond_33
    move-object v11, v10

    check-cast v11, Lcom/eightsleep/data_metrics/domain/model/Session;

    iget-object v11, v11, Lcom/eightsleep/data_metrics/domain/model/Session;->b:LGa/s;

    iget-object v11, v11, LGa/s;->a:Ljava/time/Instant;

    invoke-virtual {v11}, Ljava/time/Instant;->toEpochMilli()J

    move-result-wide v11

    :cond_34
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    move-object v15, v14

    check-cast v15, Lcom/eightsleep/data_metrics/domain/model/Session;

    iget-object v15, v15, Lcom/eightsleep/data_metrics/domain/model/Session;->b:LGa/s;

    iget-object v15, v15, LGa/s;->a:Ljava/time/Instant;

    invoke-virtual {v15}, Ljava/time/Instant;->toEpochMilli()J

    move-result-wide v15

    cmp-long v18, v11, v15

    if-gez v18, :cond_35

    move-object v10, v14

    move-wide v11, v15

    :cond_35
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-nez v14, :cond_34

    :goto_29
    check-cast v10, Lcom/eightsleep/data_metrics/domain/model/Session;

    goto :goto_2a

    :cond_36
    const/4 v10, 0x0

    :goto_2a
    new-instance v9, LFf/x;

    if-eqz v1, :cond_37

    invoke-virtual {v1}, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->a()Lcom/eightsleep/data_metrics/domain/model/Session;

    move-result-object v11

    if-eqz v11, :cond_37

    iget-object v11, v11, Lcom/eightsleep/data_metrics/domain/model/Session;->a:Ljava/lang/String;

    goto :goto_2b

    :cond_37
    const/4 v11, 0x0

    :goto_2b
    if-eqz v10, :cond_38

    iget-object v10, v10, Lcom/eightsleep/data_metrics/domain/model/Session;->b:LGa/s;

    goto :goto_2c

    :cond_38
    const/4 v10, 0x0

    :goto_2c
    if-eqz v1, :cond_39

    iget-boolean v12, v1, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->D:Z

    const/4 v14, 0x1

    if-ne v12, v14, :cond_3a

    goto :goto_2d

    :cond_39
    const/4 v14, 0x1

    :cond_3a
    if-eqz v1, :cond_3b

    iget-boolean v12, v1, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->G:Z

    if-ne v12, v14, :cond_3b

    :goto_2d
    invoke-virtual {v1}, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->e()Z

    move-result v1

    if-eqz v1, :cond_3b

    const/4 v1, 0x1

    goto :goto_2e

    :cond_3b
    const/4 v1, 0x0

    :goto_2e
    invoke-direct {v9, v11, v1, v10}, LFf/x;-><init>(Ljava/lang/String;ZLGa/s;)V

    sget-object v1, LGf/e;->f:Ljava/util/List;

    invoke-static {v0}, LP2/j;->o(LFf/j0;)Ljava/util/List;

    move-result-object v1

    invoke-static {v1, v13, v6, v2}, LP2/b;->E(Ljava/util/List;Ljava/util/List;LGf/e;Ljava/util/Set;)LGf/e;

    move-result-object v18

    invoke-static {v0}, LP2/j;->p(LFf/j0;)LDi/c;

    move-result-object v22

    const/16 v19, 0x0

    const/16 v23, 0x7

    const/16 v20, 0x0

    const/16 v21, 0x0

    invoke-static/range {v18 .. v23}, LGf/e;->e(LGf/e;Ljava/util/List;LC8/J;LHm/k;LDi/c;I)LGf/e;

    move-result-object v0

    move/from16 v1, v39

    new-array v1, v1, [Lc8/c;

    const/16 v29, 0x0

    aput-object v8, v1, v29

    const/16 v30, 0x1

    aput-object v4, v1, v30

    const/16 v28, 0x2

    aput-object v9, v1, v28

    const/16 v31, 0x3

    aput-object v0, v1, v31

    invoke-static {v1}, LIm/n;->h0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    const/4 v8, 0x0

    const/16 v11, 0xfec

    const/4 v4, 0x0

    move-object v1, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v2, v7

    const/4 v7, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object/from16 v58, v3

    move-object v3, v0

    move-object/from16 v0, v58

    invoke-static/range {v0 .. v11}, LFf/v;->u(LFf/v;Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;Ljava/lang/Integer;Ljava/util/List;LFf/q1;ZZZLjava/util/List;ZLFf/p1;I)LFf/v;

    move-result-object v1

    move-object v6, v0

    move-object v2, v1

    move-object v0, v6

    goto/16 :goto_20

    :cond_3c
    move-object v6, v1

    move/from16 v45, v7

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v12}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_3d
    :goto_2f
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3e

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    move-object v10, v8

    check-cast v10, Lc9/f;

    iget-object v10, v10, Lc9/f;->e:Lc9/g;

    sget-object v12, Lcom/eightsleep/data_ai_insights/enums/AiInsightSleepState;->PRE_SLEEP:Lcom/eightsleep/data_ai_insights/enums/AiInsightSleepState;

    iget-object v10, v10, Lc9/g;->c:Lcom/eightsleep/data_ai_insights/enums/AiInsightSleepState;

    if-ne v10, v12, :cond_3d

    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2f

    :cond_3e
    new-instance v7, LCh/I1;

    const/16 v8, 0x8

    invoke-direct {v7, v8}, LCh/I1;-><init>(I)V

    invoke-static {v1, v7}, LIm/r;->J1(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v18

    iget-object v1, v6, LFf/v;->d:Ljava/util/List;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_3f
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_40

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    move-object v10, v8

    check-cast v10, Lc8/c;

    instance-of v10, v10, LFf/y;

    if-eqz v10, :cond_3f

    goto :goto_30

    :cond_40
    const/4 v8, 0x0

    :goto_30
    instance-of v7, v8, LFf/y;

    if-eqz v7, :cond_41

    check-cast v8, LFf/y;

    move-object/from16 v21, v8

    goto :goto_31

    :cond_41
    const/16 v21, 0x0

    :goto_31
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_42
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_43

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    move-object v10, v8

    check-cast v10, Lc8/c;

    instance-of v10, v10, LGf/e;

    if-eqz v10, :cond_42

    goto :goto_32

    :cond_43
    const/4 v8, 0x0

    :goto_32
    instance-of v7, v8, LGf/e;

    if-eqz v7, :cond_44

    check-cast v8, LGf/e;

    goto :goto_33

    :cond_44
    const/4 v8, 0x0

    :goto_33
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_45
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_46

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    move-object v10, v7

    check-cast v10, Lc8/c;

    instance-of v10, v10, LFf/O0;

    if-eqz v10, :cond_45

    goto :goto_34

    :cond_46
    const/4 v7, 0x0

    :goto_34
    instance-of v1, v7, LFf/O0;

    if-eqz v1, :cond_47

    check-cast v7, LFf/O0;

    goto :goto_35

    :cond_47
    const/4 v7, 0x0

    :goto_35
    sget-object v1, LFf/J;->a:LFf/J;

    iget-boolean v10, v0, LFf/j0;->c0:Z

    iget-boolean v12, v0, LFf/j0;->y:Z

    if-eqz v10, :cond_48

    if-eqz v12, :cond_48

    goto :goto_36

    :cond_48
    const/4 v1, 0x0

    :goto_36
    sget-object v10, Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;->NIGHT:Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;

    invoke-interface/range {v18 .. v18}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_37
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_4b

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v19, v3

    move-object/from16 v3, v16

    check-cast v3, Lc9/f;

    iget-object v3, v3, Lc9/f;->e:Lc9/g;

    iget-object v3, v3, Lc9/g;->g:Lc9/p;

    if-eqz v3, :cond_49

    iget-object v3, v3, Lc9/p;->a:Ljava/lang/String;

    goto :goto_38

    :cond_49
    const/4 v3, 0x0

    :goto_38
    if-eqz v3, :cond_4a

    goto :goto_39

    :cond_4a
    move-object/from16 v3, v19

    goto :goto_37

    :cond_4b
    move-object/from16 v19, v3

    const/16 v16, 0x0

    :goto_39
    move-object/from16 v3, v16

    check-cast v3, Lc9/f;

    if-eqz v3, :cond_4c

    iget-object v3, v3, Lc9/f;->e:Lc9/g;

    iget-object v3, v3, Lc9/g;->g:Lc9/p;

    if-eqz v3, :cond_4c

    iget-object v3, v3, Lc9/p;->a:Ljava/lang/String;

    move-object/from16 v34, v3

    goto :goto_3a

    :cond_4c
    const/16 v34, 0x0

    :goto_3a
    const/16 v35, 0x0

    const/16 v38, 0xe

    iget-object v3, v6, LFf/v;->e:LFf/q1;

    const/16 v36, 0x0

    const/16 v37, 0x0

    move-object/from16 v33, v3

    invoke-static/range {v33 .. v38}, LFf/q1;->a(LFf/q1;Ljava/lang/String;ZIZI)LFf/q1;

    move-result-object v3

    if-nez v4, :cond_4d

    move-object/from16 v16, v3

    move-object/from16 v22, v9

    move-object/from16 v33, v10

    const/4 v15, 0x0

    goto :goto_3b

    :cond_4d
    new-instance v15, LFf/l0;

    move-object/from16 v16, v3

    sget-object v3, LGa/t;->TIME:LGa/t;

    move-object/from16 v22, v9

    iget-object v9, v4, LFf/k0;->d:LGa/s;

    move-object/from16 v33, v10

    const/4 v10, 0x2

    invoke-static {v9, v3, v10}, LGa/s;->f(LGa/s;LGa/t;I)Ljava/lang/String;

    move-result-object v3

    iget-object v9, v4, LFf/k0;->b:Ljava/lang/String;

    iget-object v10, v4, LFf/k0;->c:Ljava/lang/String;

    iget-object v4, v4, LFf/k0;->a:Ljava/lang/String;

    invoke-direct {v15, v4, v9, v10, v3}, LFf/l0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_3b
    iget-object v3, v0, LFf/j0;->i:Ljd/b;

    const-string v4, "temperatureSettings"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface/range {v18 .. v18}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_3c
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_50

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    move-object v10, v9

    check-cast v10, Lc9/f;

    move-object/from16 v23, v4

    iget-object v4, v10, Lc9/f;->e:Lc9/g;

    move-object/from16 v34, v9

    sget-object v9, Lcom/eightsleep/data_ai_insights/enums/AiInsightSleepState;->PRE_SLEEP:Lcom/eightsleep/data_ai_insights/enums/AiInsightSleepState;

    iget-object v4, v4, Lc9/g;->c:Lcom/eightsleep/data_ai_insights/enums/AiInsightSleepState;

    if-ne v4, v9, :cond_4f

    sget-object v4, Lcom/eightsleep/data_ai_insights/enums/AiInsightType;->RECOMMENDATION:Lcom/eightsleep/data_ai_insights/enums/AiInsightType;

    iget-object v9, v10, Lc9/f;->c:Lcom/eightsleep/data_ai_insights/enums/AiInsightType;

    if-ne v9, v4, :cond_4f

    iget-object v4, v10, Lc9/f;->f:Lc9/l;

    if-eqz v4, :cond_4f

    iget-object v4, v10, Lc9/f;->g:Lc9/j;

    if-eqz v4, :cond_4e

    iget-object v4, v4, Lc9/j;->a:Ljava/lang/Boolean;

    goto :goto_3d

    :cond_4e
    const/4 v4, 0x0

    :goto_3d
    if-nez v4, :cond_4f

    move-object/from16 v9, v34

    goto :goto_3e

    :cond_4f
    move-object/from16 v4, v23

    goto :goto_3c

    :cond_50
    const/4 v9, 0x0

    :goto_3e
    check-cast v9, Lc9/f;

    iget-object v4, v3, Ljd/b;->e:LGa/n;

    const-string v10, ""

    if-nez v9, :cond_52

    move-object/from16 v38, v2

    move-object/from16 v37, v5

    move-object/from16 v23, v10

    move/from16 v34, v12

    move-object/from16 v35, v15

    :cond_51
    :goto_3f
    const/16 v46, 0x0

    goto/16 :goto_4a

    :cond_52
    move-object/from16 v23, v10

    iget-object v10, v9, Lc9/f;->f:Lc9/l;

    move/from16 v34, v12

    if-eqz v10, :cond_53

    iget-object v12, v10, Lc9/l;->b:Lc9/m;

    if-eqz v12, :cond_53

    iget-object v12, v12, Lc9/m;->b:LGa/b;

    goto :goto_40

    :cond_53
    const/4 v12, 0x0

    :goto_40
    if-eqz v12, :cond_54

    sget-object v12, Lcom/eightsleep/data_core/enums/SleepPhase;->NIGHT:Lcom/eightsleep/data_core/enums/SleepPhase;

    :goto_41
    move-object/from16 v50, v12

    goto :goto_43

    :cond_54
    if-eqz v10, :cond_55

    iget-object v12, v10, Lc9/l;->b:Lc9/m;

    if-eqz v12, :cond_55

    iget-object v12, v12, Lc9/m;->c:LGa/b;

    goto :goto_42

    :cond_55
    const/4 v12, 0x0

    :goto_42
    if-eqz v12, :cond_56

    sget-object v12, Lcom/eightsleep/data_core/enums/SleepPhase;->DAWN:Lcom/eightsleep/data_core/enums/SleepPhase;

    goto :goto_41

    :cond_56
    sget-object v12, Lcom/eightsleep/data_core/enums/SleepPhase;->BEDTIME:Lcom/eightsleep/data_core/enums/SleepPhase;

    goto :goto_41

    :goto_43
    sget-object v12, LFf/P0;->a:[I

    invoke-virtual/range {v50 .. v50}, Ljava/lang/Enum;->ordinal()I

    move-result v35

    move-object/from16 v36, v12

    aget v12, v36, v35

    move-object/from16 v35, v15

    iget-object v15, v4, LGa/n;->a:LGa/b;

    iget-object v6, v4, LGa/n;->b:LGa/b;

    move-object/from16 v37, v5

    iget-object v5, v4, LGa/n;->c:LGa/b;

    move-object/from16 v38, v2

    const/4 v2, 0x1

    if-eq v12, v2, :cond_59

    const/4 v2, 0x2

    if-eq v12, v2, :cond_58

    const/4 v2, 0x3

    if-eq v12, v2, :cond_57

    const/4 v2, 0x0

    goto :goto_44

    :cond_57
    move-object v2, v5

    goto :goto_44

    :cond_58
    move-object v2, v6

    goto :goto_44

    :cond_59
    iget-object v2, v3, Ljd/b;->j:LW9/b;

    if-eqz v2, :cond_5a

    iget-object v2, v2, LW9/b;->f:LW9/c;

    iget-object v2, v2, LW9/c;->a:LGa/b;

    if-nez v2, :cond_5b

    :cond_5a
    move-object v2, v15

    :cond_5b
    :goto_44
    invoke-virtual/range {v50 .. v50}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    aget v3, v36, v3

    const/4 v12, 0x1

    if-eq v3, v12, :cond_5f

    const/4 v12, 0x2

    if-eq v3, v12, :cond_5e

    const/4 v12, 0x3

    if-eq v3, v12, :cond_5d

    :cond_5c
    const/4 v3, 0x0

    goto :goto_45

    :cond_5d
    if-eqz v10, :cond_5c

    iget-object v3, v10, Lc9/l;->b:Lc9/m;

    if-eqz v3, :cond_5c

    iget-object v3, v3, Lc9/m;->c:LGa/b;

    goto :goto_45

    :cond_5e
    if-eqz v10, :cond_5c

    iget-object v3, v10, Lc9/l;->b:Lc9/m;

    if-eqz v3, :cond_5c

    iget-object v3, v3, Lc9/m;->b:LGa/b;

    goto :goto_45

    :cond_5f
    if-eqz v10, :cond_5c

    iget-object v3, v10, Lc9/l;->b:Lc9/m;

    if-eqz v3, :cond_5c

    iget-object v3, v3, Lc9/m;->a:LGa/b;

    :goto_45
    if-eqz v2, :cond_51

    if-nez v3, :cond_60

    goto/16 :goto_3f

    :cond_60
    new-instance v10, LDl/A0;

    const/16 v12, 0xe

    invoke-direct {v10, v12}, LDl/A0;-><init>(I)V

    invoke-virtual {v2, v10}, LGa/b;->c(LFa/d;)Ljava/lang/String;

    move-result-object v10

    move-object/from16 v51, v2

    new-instance v2, LDl/A0;

    invoke-direct {v2, v12}, LDl/A0;-><init>(I)V

    invoke-virtual {v3, v2}, LGa/b;->c(LFa/d;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v10, v2}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_61

    goto/16 :goto_3f

    :cond_61
    new-instance v46, LFf/Q0;

    iget-object v2, v9, Lc9/f;->d:Lc9/n;

    if-eqz v2, :cond_63

    iget-object v10, v2, Lc9/n;->b:Ljava/lang/String;

    if-nez v10, :cond_62

    goto :goto_46

    :cond_62
    move-object/from16 v48, v10

    goto :goto_47

    :cond_63
    :goto_46
    move-object/from16 v48, v23

    :goto_47
    if-eqz v2, :cond_65

    iget-object v2, v2, Lc9/n;->d:Ljava/lang/String;

    if-nez v2, :cond_64

    goto :goto_48

    :cond_64
    move-object/from16 v49, v2

    goto :goto_49

    :cond_65
    :goto_48
    move-object/from16 v49, v23

    :goto_49
    new-instance v2, LC8/H;

    invoke-direct {v2, v15, v5, v6}, LC8/H;-><init>(LGa/b;LGa/b;LGa/b;)V

    const/16 v54, 0x3

    iget-object v5, v9, Lc9/f;->a:Ljava/lang/String;

    move-object/from16 v53, v2

    move-object/from16 v52, v3

    move-object/from16 v47, v5

    invoke-direct/range {v46 .. v54}, LFf/Q0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_core/enums/SleepPhase;LGa/b;LGa/b;LC8/H;I)V

    :goto_4a
    if-eqz v7, :cond_66

    iget-boolean v12, v7, LFf/O0;->i:Z

    goto :goto_4b

    :cond_66
    const/4 v12, 0x0

    :goto_4b
    iget-boolean v2, v0, LFf/j0;->E:Z

    if-nez v2, :cond_67

    :goto_4c
    const/16 v47, 0x0

    goto :goto_4f

    :cond_67
    iget-object v2, v0, LFf/j0;->D:Ljd/n;

    if-nez v2, :cond_68

    goto :goto_4c

    :cond_68
    sget-object v3, Ljd/l;->PENDING:Ljd/l;

    iget-object v5, v2, Ljd/n;->a:Ljd/l;

    if-eq v5, v3, :cond_69

    goto :goto_4c

    :cond_69
    new-instance v47, LFf/O0;

    if-eqz v37, :cond_6a

    invoke-virtual/range {v37 .. v37}, Ljd/j;->b()Z

    move-result v3

    const/4 v5, 0x1

    if-ne v3, v5, :cond_6a

    const/16 v57, 0x1

    goto :goto_4d

    :cond_6a
    const/16 v57, 0x0

    :goto_4d
    iget-object v3, v2, Ljd/n;->c:LGa/b;

    iget-object v5, v2, Ljd/n;->d:LGa/b;

    iget-object v6, v2, Ljd/n;->e:LGa/b;

    iget v2, v2, Ljd/n;->b:I

    iget-object v7, v4, LGa/n;->a:LGa/b;

    iget-object v9, v4, LGa/n;->b:LGa/b;

    iget-object v4, v4, LGa/n;->c:LGa/b;

    const/4 v10, 0x3

    and-int/lit16 v15, v10, 0x200

    if-eqz v15, :cond_6b

    const/16 v56, 0x0

    goto :goto_4e

    :cond_6b
    move/from16 v56, v12

    :goto_4e
    const-string v48, "pregnancy_recommendation_section"

    move/from16 v49, v2

    move-object/from16 v53, v3

    move-object/from16 v52, v4

    move-object/from16 v54, v5

    move-object/from16 v55, v6

    move-object/from16 v50, v7

    move-object/from16 v51, v9

    invoke-direct/range {v47 .. v57}, LFf/O0;-><init>(Ljava/lang/String;ILGa/b;LGa/b;LGa/b;LGa/b;LGa/b;LGa/b;ZZ)V

    :goto_4f
    if-eqz v1, :cond_6c

    move-object/from16 v48, v1

    move-object v15, v13

    const/4 v6, 0x0

    goto/16 :goto_65

    :cond_6c
    sget-object v2, LFf/A;->j:Ljava/time/Duration;

    invoke-static/range {v22 .. v22}, LP2/d;->O(Ljava/util/List;)Lcom/eightsleep/data_metrics/domain/model/DailyTrends;

    move-result-object v2

    const-string v3, "deviceSetTemperatureSettings"

    iget-object v4, v0, LFf/j0;->j:Ljava/util/List;

    invoke-static {v4, v3}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface/range {v18 .. v18}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_6d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Lc9/f;

    iget-object v6, v6, Lc9/f;->c:Lcom/eightsleep/data_ai_insights/enums/AiInsightType;

    sget-object v7, Lcom/eightsleep/data_ai_insights/enums/AiInsightType;->HEADLINE:Lcom/eightsleep/data_ai_insights/enums/AiInsightType;

    if-ne v6, v7, :cond_6d

    goto :goto_50

    :cond_6e
    const/4 v5, 0x0

    :goto_50
    check-cast v5, Lc9/f;

    iget-object v3, v0, LFf/j0;->s:LW9/h;

    if-eqz v3, :cond_6f

    iget-object v3, v3, LW9/h;->a:LGa/s;

    const-wide/32 v6, 0xdbba0

    invoke-virtual {v3, v6, v7}, LGa/s;->o(J)LGa/s;

    move-result-object v9

    invoke-static {v9}, LP2/g;->K(LGa/s;)LGa/s;

    move-result-object v9

    invoke-virtual {v3, v6, v7}, LGa/s;->q(J)LGa/s;

    move-result-object v3

    invoke-static {v3}, LP2/g;->K(LGa/s;)LGa/s;

    move-result-object v3

    new-instance v6, LFf/n;

    invoke-direct {v6, v9, v3}, LFf/n;-><init>(LGa/s;LGa/s;)V

    move-object v15, v13

    goto :goto_51

    :cond_6f
    if-eqz v2, :cond_70

    iget-object v3, v2, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->K:Lcom/eightsleep/data_metrics/domain/model/SleepRoutineScore;

    iget-object v3, v3, Lcom/eightsleep/data_metrics/domain/model/SleepRoutineScore;->d:Lrc/l;

    iget-object v3, v3, Lrc/l;->a:LGa/s;

    invoke-static {v3}, LP2/g;->K(LGa/s;)LGa/s;

    move-result-object v3

    invoke-static {v3}, LP2/g;->v(LGa/s;)Lrg/a;

    move-result-object v6

    new-instance v7, LFf/n;

    sget-object v9, LGa/s;->c:LGa/s;

    iget-wide v9, v6, Lrg/a;->a:J

    invoke-static {v9, v10}, Ljava/time/Instant;->ofEpochMilli(J)Ljava/time/Instant;

    move-result-object v9

    const-string v10, "ofEpochMilli(...)"

    invoke-static {v9, v10}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v3, v3, LGa/s;->b:Lcom/eightsleep/data_core/enums/ClockSystem;

    invoke-static {v9, v3}, LDl/A0;->y(Ljava/time/Instant;Lcom/eightsleep/data_core/enums/ClockSystem;)LGa/s;

    move-result-object v9

    move-object v15, v13

    iget-wide v12, v6, Lrg/a;->b:J

    invoke-static {v12, v13}, Ljava/time/Instant;->ofEpochMilli(J)Ljava/time/Instant;

    move-result-object v6

    invoke-static {v6, v10}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v6, v3}, LDl/A0;->y(Ljava/time/Instant;Lcom/eightsleep/data_core/enums/ClockSystem;)LGa/s;

    move-result-object v3

    invoke-direct {v7, v9, v3}, LFf/n;-><init>(LGa/s;LGa/s;)V

    move-object v6, v7

    goto :goto_51

    :cond_70
    move-object v15, v13

    const/4 v6, 0x0

    :goto_51
    if-eqz v6, :cond_71

    const/4 v3, 0x1

    goto :goto_52

    :cond_71
    const/4 v3, 0x0

    :goto_52
    if-eqz v6, :cond_72

    iget-object v7, v6, LFf/n;->a:LGa/s;

    goto :goto_53

    :cond_72
    const/4 v7, 0x0

    :goto_53
    if-eqz v6, :cond_73

    iget-object v6, v6, LFf/n;->b:LGa/s;

    goto :goto_54

    :cond_73
    const/4 v6, 0x0

    :goto_54
    if-nez v5, :cond_75

    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_75

    if-eqz v34, :cond_74

    goto :goto_55

    :cond_74
    const/4 v9, 0x0

    goto :goto_56

    :cond_75
    :goto_55
    const/4 v9, 0x1

    :goto_56
    if-eqz v34, :cond_76

    :goto_57
    const/16 v49, 0x0

    goto :goto_58

    :cond_76
    if-eqz v5, :cond_78

    iget-object v10, v5, Lc9/f;->b:Lcom/eightsleep/data_ai_insights/enums/AiInsightState;

    if-eqz v10, :cond_78

    invoke-virtual {v10}, Lcom/eightsleep/data_ai_insights/enums/AiInsightState;->isProcessing()Z

    move-result v10

    const/4 v12, 0x1

    if-ne v10, v12, :cond_78

    :cond_77
    const/16 v49, 0x1

    goto :goto_58

    :cond_78
    if-eqz v9, :cond_77

    goto :goto_57

    :goto_58
    if-eqz v2, :cond_79

    iget-object v2, v2, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->K:Lcom/eightsleep/data_metrics/domain/model/SleepRoutineScore;

    iget-object v2, v2, Lcom/eightsleep/data_metrics/domain/model/SleepRoutineScore;->b:Lrc/l;

    iget-object v2, v2, Lrc/l;->a:LGa/s;

    goto :goto_59

    :cond_79
    const/4 v2, 0x0

    :goto_59
    if-eqz v2, :cond_7c

    if-eqz v6, :cond_7c

    iget-object v10, v2, LGa/s;->a:Ljava/time/Instant;

    :goto_5a
    iget-object v12, v6, LGa/s;->a:Ljava/time/Instant;

    invoke-virtual {v10, v12}, Ljava/time/Instant;->isBefore(Ljava/time/Instant;)Z

    move-result v13

    if-nez v13, :cond_7b

    invoke-virtual {v10, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_7a

    goto :goto_5b

    :cond_7a
    invoke-static {v2, v10}, LGa/s;->b(LGa/s;Ljava/time/Instant;)LGa/s;

    move-result-object v2

    goto :goto_5c

    :cond_7b
    :goto_5b
    const-wide/16 v12, 0x18

    invoke-static {v12, v13}, Ljava/time/Duration;->ofHours(J)Ljava/time/Duration;

    move-result-object v12

    invoke-virtual {v10, v12}, Ljava/time/Instant;->plus(Ljava/time/temporal/TemporalAmount;)Ljava/time/Instant;

    move-result-object v10

    goto :goto_5a

    :cond_7c
    if-eqz v2, :cond_7d

    goto :goto_5c

    :cond_7d
    if-nez v7, :cond_7e

    const/4 v2, 0x0

    goto :goto_5c

    :cond_7e
    sget-object v2, LFf/A;->j:Ljava/time/Duration;

    iget-object v10, v7, LGa/s;->a:Ljava/time/Instant;

    invoke-virtual {v10, v2}, Ljava/time/Instant;->plus(Ljava/time/temporal/TemporalAmount;)Ljava/time/Instant;

    move-result-object v2

    const-string v10, "plus(...)"

    invoke-static {v2, v10}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v7, v2}, LGa/s;->b(LGa/s;Ljava/time/Instant;)LGa/s;

    move-result-object v2

    :goto_5c
    invoke-static {}, Ljava/time/Instant;->now()Ljava/time/Instant;

    move-result-object v10

    if-eqz v3, :cond_7f

    invoke-static {v10}, Lkotlin/jvm/internal/l;->g(Ljava/lang/Object;)V

    invoke-static {v7, v6, v2, v10}, LIm/G;->y(LGa/s;LGa/s;LGa/s;Ljava/time/Instant;)LYa/H;

    move-result-object v10

    move-object/from16 v54, v6

    const/4 v6, 0x0

    :goto_5d
    move-object/from16 v51, v10

    goto :goto_5e

    :cond_7f
    new-instance v10, LYa/H;

    const v12, 0x7f120c5b

    move-object/from16 v54, v6

    const/4 v6, 0x0

    const/4 v13, 0x6

    invoke-direct {v10, v12, v6, v6, v13}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    goto :goto_5d

    :goto_5e
    if-nez v3, :cond_80

    if-nez v34, :cond_80

    if-eqz v9, :cond_80

    if-nez v5, :cond_80

    const/16 v57, 0x1

    goto :goto_5f

    :cond_80
    const/16 v57, 0x0

    :goto_5f
    if-eqz v5, :cond_82

    iget-object v3, v5, Lc9/f;->a:Ljava/lang/String;

    if-nez v3, :cond_81

    goto :goto_60

    :cond_81
    move-object/from16 v50, v3

    goto :goto_61

    :cond_82
    :goto_60
    move-object/from16 v50, v23

    :goto_61
    if-eqz v5, :cond_84

    iget-object v3, v5, Lc9/f;->d:Lc9/n;

    if-eqz v3, :cond_84

    iget-object v3, v3, Lc9/n;->d:Ljava/lang/String;

    if-nez v3, :cond_83

    goto :goto_62

    :cond_83
    move-object/from16 v52, v3

    goto :goto_63

    :cond_84
    :goto_62
    move-object/from16 v52, v23

    :goto_63
    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_86

    :cond_85
    const/16 v56, 0x0

    goto :goto_64

    :cond_86
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_87
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_85

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljd/b;

    iget-object v4, v4, Ljd/b;->j:LW9/b;

    if-eqz v4, :cond_87

    const/16 v56, 0x1

    :goto_64
    new-instance v48, LFf/A;

    move-object/from16 v55, v2

    move-object/from16 v53, v7

    invoke-direct/range {v48 .. v57}, LFf/A;-><init>(ZLjava/lang/String;LYa/H;Ljava/lang/String;LGa/s;LGa/s;LGa/s;ZZ)V

    :goto_65
    invoke-static {v1, v0}, LFf/v;->v(LFf/J;LFf/j0;)LFf/S;

    move-result-object v1

    iget-boolean v2, v0, LFf/j0;->k0:Z

    if-nez v2, :cond_89

    iget-boolean v2, v0, LFf/j0;->l0:Z

    if-eqz v2, :cond_88

    goto :goto_66

    :cond_88
    const/4 v2, 0x0

    goto :goto_67

    :cond_89
    :goto_66
    const/4 v2, 0x1

    :goto_67
    new-instance v3, Lyf/q;

    invoke-direct {v3}, Lyf/q;-><init>()V

    iget-object v4, v0, LFf/j0;->j0:Ljd/c;

    if-eqz v4, :cond_8a

    iget-boolean v4, v4, Ljd/c;->b:Z

    if-nez v4, :cond_8a

    if-nez v2, :cond_8a

    goto :goto_68

    :cond_8a
    move-object v3, v6

    :goto_68
    if-eqz v11, :cond_8b

    iget-object v2, v11, LQb/p;->a:Ljava/lang/String;

    if-eqz v2, :cond_8b

    invoke-virtual {v2, v14}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v12, 0x1

    if-ne v2, v12, :cond_8b

    const/4 v2, 0x1

    goto :goto_69

    :cond_8b
    const/4 v2, 0x0

    :goto_69
    if-eqz v19, :cond_8d

    if-eqz v2, :cond_8c

    move-object/from16 v2, v19

    goto :goto_6a

    :cond_8c
    move-object v2, v6

    :goto_6a
    if-eqz v2, :cond_8d

    new-instance v4, Lyf/m;

    invoke-direct {v4, v2}, Lyf/m;-><init>(Lsc/i;)V

    goto :goto_6b

    :cond_8d
    move-object v4, v6

    :goto_6b
    invoke-static {v0}, LP2/j;->n(LFf/j0;)Lc8/c;

    move-result-object v2

    const-string v5, "orders"

    iget-object v7, v0, LFf/j0;->n0:Ljava/util/List;

    invoke-static {v7, v5}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-boolean v5, v0, LFf/j0;->m0:Z

    if-nez v5, :cond_8e

    :goto_6c
    move-object v9, v6

    goto :goto_6d

    :cond_8e
    invoke-static {v7}, Lae/g;->b(Ljava/util/List;)Lae/a;

    move-result-object v12

    if-nez v12, :cond_8f

    goto :goto_6c

    :cond_8f
    new-instance v9, LFf/s;

    const-string v10, "delivered_order_section"

    const/4 v11, 0x0

    iget-boolean v13, v0, LFf/j0;->o0:Z

    iget-boolean v14, v0, LFf/j0;->p0:Z

    invoke-direct/range {v9 .. v14}, LFf/s;-><init>(Ljava/lang/String;ZLae/a;ZZ)V

    :goto_6d
    iget-boolean v5, v0, LFf/j0;->Y:Z

    if-nez v5, :cond_90

    :goto_6e
    move-object v7, v6

    goto :goto_6f

    :cond_90
    iget-object v5, v0, LFf/j0;->Z:LFf/J0;

    if-nez v5, :cond_91

    goto :goto_6e

    :cond_91
    new-instance v7, LFf/K0;

    const/4 v12, 0x1

    invoke-direct {v7, v5, v12}, LFf/K0;-><init>(LFf/J0;Z)V

    :goto_6f
    const-string v5, "state"

    iget-object v10, v0, LFf/j0;->u:Lc9/A;

    invoke-static {v10, v5}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "healthConnectState"

    iget-object v11, v0, LFf/j0;->t:Lrb/a;

    invoke-static {v11, v5}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v10}, Lc9/A;->a()Lc9/B;

    move-result-object v5

    sget-object v12, Lc9/B;->HIDDEN:Lc9/B;

    if-ne v5, v12, :cond_92

    move-object/from16 v49, v6

    goto :goto_70

    :cond_92
    new-instance v49, LFf/I;

    invoke-virtual {v10}, Lc9/A;->a()Lc9/B;

    move-result-object v50

    iget-boolean v5, v10, Lc9/A;->c:Z

    iget-boolean v12, v10, Lc9/A;->d:Z

    iget-boolean v13, v10, Lc9/A;->a:Z

    iget-boolean v10, v10, Lc9/A;->b:Z

    move/from16 v53, v5

    move/from16 v52, v10

    move-object/from16 v55, v11

    move/from16 v54, v12

    move/from16 v51, v13

    invoke-direct/range {v49 .. v55}, LFf/I;-><init>(Lc9/B;ZZZZLrb/a;)V

    :goto_70
    sget-object v5, LGf/e;->f:Ljava/util/List;

    invoke-static {v0}, LP2/j;->o(LFf/j0;)Ljava/util/List;

    move-result-object v5

    move-object/from16 v10, v38

    invoke-static {v5, v15, v8, v10}, LP2/b;->E(Ljava/util/List;Ljava/util/List;LGf/e;Ljava/util/Set;)LGf/e;

    move-result-object v50

    invoke-static {v0}, LP2/j;->p(LFf/j0;)LDi/c;

    move-result-object v54

    const/16 v51, 0x0

    const/16 v55, 0x7

    const/16 v52, 0x0

    const/16 v53, 0x0

    invoke-static/range {v50 .. v55}, LGf/e;->e(LGf/e;Ljava/util/List;LC8/J;LHm/k;LDi/c;I)LGf/e;

    move-result-object v5

    if-eqz v37, :cond_94

    move-object/from16 v8, v37

    iget-boolean v8, v8, Ljd/j;->a:Z

    const/4 v12, 0x1

    if-ne v8, v12, :cond_93

    move v8, v12

    goto :goto_72

    :cond_93
    :goto_71
    const/4 v8, 0x0

    goto :goto_72

    :cond_94
    const/4 v12, 0x1

    goto :goto_71

    :goto_72
    xor-int/lit8 v22, v8, 0x1

    iget-object v8, v0, LFf/j0;->o:Ljava/util/Map;

    iget-boolean v10, v0, LFf/j0;->S:Z

    move-object/from16 v19, v8

    move/from16 v23, v10

    invoke-static/range {v18 .. v23}, LIm/s;->a0(Ljava/util/List;Ljava/util/Map;Ljava/util/List;LFf/y;ZZ)LFf/y;

    move-result-object v8

    invoke-static {v0}, LP2/j;->q(LFf/j0;)LFf/T0;

    move-result-object v10

    iget-object v0, v0, LFf/j0;->Q:Lyf/k;

    const/16 v11, 0xf

    new-array v11, v11, [Lc8/c;

    const/16 v29, 0x0

    aput-object v35, v11, v29

    aput-object v46, v11, v12

    const/16 v28, 0x2

    aput-object v47, v11, v28

    const/16 v31, 0x3

    aput-object v48, v11, v31

    const/16 v39, 0x4

    aput-object v1, v11, v39

    aput-object v0, v11, v45

    const/16 v32, 0x6

    aput-object v3, v11, v32

    aput-object v4, v11, v24

    const/16 v27, 0x8

    aput-object v2, v11, v27

    const/16 v0, 0x9

    aput-object v9, v11, v0

    aput-object v7, v11, v17

    const/16 v0, 0xb

    aput-object v49, v11, v0

    const/16 v0, 0xc

    aput-object v5, v11, v0

    const/16 v0, 0xd

    aput-object v8, v11, v0

    const/16 v26, 0xe

    aput-object v10, v11, v26

    invoke-static {v11}, LIm/n;->h0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    const v0, 0x7f0802b4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v8, 0x0

    const/16 v11, 0xf8c

    move-object/from16 v0, p6

    iget-boolean v5, v0, LFf/v;->f:Z

    move-object/from16 v25, v6

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object/from16 v4, v16

    move-object/from16 v1, v33

    invoke-static/range {v0 .. v11}, LFf/v;->u(LFf/v;Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;Ljava/lang/Integer;Ljava/util/List;LFf/q1;ZZZLjava/util/List;ZLFf/p1;I)LFf/v;

    move-result-object v1

    :goto_73
    move-object v3, v0

    move-object v2, v1

    move-object v0, v3

    goto/16 :goto_7e

    :cond_95
    move-object v3, v1

    move/from16 v45, v7

    const/16 v25, 0x0

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v12}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_96
    :goto_74
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_97

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Lc9/f;

    iget-object v6, v6, Lc9/f;->e:Lc9/g;

    sget-object v7, Lcom/eightsleep/data_ai_insights/enums/AiInsightSleepState;->POST_SLEEP:Lcom/eightsleep/data_ai_insights/enums/AiInsightSleepState;

    iget-object v6, v6, Lc9/g;->c:Lcom/eightsleep/data_ai_insights/enums/AiInsightSleepState;

    if-ne v6, v7, :cond_96

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_74

    :cond_97
    new-instance v2, LCh/I1;

    move/from16 v5, v45

    invoke-direct {v2, v5}, LCh/I1;-><init>(I)V

    invoke-static {v1, v2}, LIm/r;->J1(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v1

    sget-object v2, Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;->AFTERNOON:Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_98
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_9a

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v7, v6

    check-cast v7, Lc9/f;

    iget-object v7, v7, Lc9/f;->e:Lc9/g;

    iget-object v7, v7, Lc9/g;->g:Lc9/p;

    if-eqz v7, :cond_99

    iget-object v7, v7, Lc9/p;->a:Ljava/lang/String;

    goto :goto_75

    :cond_99
    move-object/from16 v7, v25

    :goto_75
    if-eqz v7, :cond_98

    goto :goto_76

    :cond_9a
    move-object/from16 v6, v25

    :goto_76
    check-cast v6, Lc9/f;

    if-eqz v6, :cond_9b

    iget-object v5, v6, Lc9/f;->e:Lc9/g;

    iget-object v5, v5, Lc9/g;->g:Lc9/p;

    if-eqz v5, :cond_9b

    iget-object v6, v5, Lc9/p;->a:Ljava/lang/String;

    move-object v8, v6

    goto :goto_77

    :cond_9b
    move-object/from16 v8, v25

    :goto_77
    const/4 v9, 0x0

    const/16 v12, 0xe

    iget-object v7, v3, LFf/v;->e:LFf/q1;

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-static/range {v7 .. v12}, LFf/q1;->a(LFf/q1;Ljava/lang/String;ZIZI)LFf/q1;

    move-result-object v5

    if-nez v4, :cond_9c

    move-object/from16 v6, v25

    goto :goto_78

    :cond_9c
    new-instance v6, LFf/l0;

    sget-object v7, LGa/t;->TIME:LGa/t;

    iget-object v8, v4, LFf/k0;->d:LGa/s;

    const/4 v10, 0x2

    invoke-static {v8, v7, v10}, LGa/s;->f(LGa/s;LGa/t;I)Ljava/lang/String;

    move-result-object v7

    iget-object v8, v4, LFf/k0;->b:Ljava/lang/String;

    iget-object v9, v4, LFf/k0;->c:Ljava/lang/String;

    iget-object v4, v4, LFf/k0;->a:Ljava/lang/String;

    invoke-direct {v6, v4, v8, v9, v7}, LFf/l0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_78
    invoke-static {v6}, LIm/s;->h0(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    iget-object v6, v3, LFf/v;->d:Ljava/util/List;

    invoke-static {v6}, LIm/r;->T1(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v6

    invoke-static {v6, v1, v0}, LFf/v;->w(Ljava/util/List;Ljava/util/List;LFf/j0;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0, v4}, LIm/r;->B1(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v0

    const v1, 0x7f0802ae

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v8, 0x0

    const/16 v11, 0xfcc

    move-object v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object/from16 v58, v3

    move-object v3, v0

    move-object/from16 v0, v58

    move-object/from16 v58, v2

    move-object v2, v1

    move-object/from16 v1, v58

    invoke-static/range {v0 .. v11}, LFf/v;->u(LFf/v;Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;Ljava/lang/Integer;Ljava/util/List;LFf/q1;ZZZLjava/util/List;ZLFf/p1;I)LFf/v;

    move-result-object v1

    goto/16 :goto_73

    :cond_9d
    move-object v3, v1

    const v16, 0x7f0802b1

    const/16 v17, 0xa

    const/16 v24, 0x7

    const/16 v25, 0x0

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v2, v0, LFf/j0;->e:Ljava/util/List;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_9e
    :goto_79
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_9f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Lc9/f;

    iget-object v5, v5, Lc9/f;->e:Lc9/g;

    sget-object v6, Lcom/eightsleep/data_ai_insights/enums/AiInsightSleepState;->POST_SLEEP:Lcom/eightsleep/data_ai_insights/enums/AiInsightSleepState;

    iget-object v5, v5, Lc9/g;->c:Lcom/eightsleep/data_ai_insights/enums/AiInsightSleepState;

    if-ne v5, v6, :cond_9e

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_79

    :cond_9f
    new-instance v2, LCh/I1;

    move/from16 v4, v24

    invoke-direct {v2, v4}, LCh/I1;-><init>(I)V

    invoke-static {v1, v2}, LIm/r;->J1(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v1

    sget-object v2, Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;->DAWN:Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_a0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_a2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v5, v6

    check-cast v5, Lc9/f;

    iget-object v5, v5, Lc9/f;->e:Lc9/g;

    iget-object v5, v5, Lc9/g;->g:Lc9/p;

    if-eqz v5, :cond_a1

    iget-object v5, v5, Lc9/p;->a:Ljava/lang/String;

    goto :goto_7a

    :cond_a1
    move-object/from16 v5, v25

    :goto_7a
    if-eqz v5, :cond_a0

    goto :goto_7b

    :cond_a2
    move-object/from16 v6, v25

    :goto_7b
    check-cast v6, Lc9/f;

    if-eqz v6, :cond_a3

    iget-object v4, v6, Lc9/f;->e:Lc9/g;

    iget-object v4, v4, Lc9/g;->g:Lc9/p;

    if-eqz v4, :cond_a3

    iget-object v6, v4, Lc9/p;->a:Ljava/lang/String;

    move-object v8, v6

    goto :goto_7c

    :cond_a3
    move-object/from16 v8, v25

    :goto_7c
    const/4 v10, 0x0

    const/4 v11, 0x0

    iget-object v7, v3, LFf/v;->e:LFf/q1;

    const/4 v9, 0x0

    const/16 v12, 0xe

    invoke-static/range {v7 .. v12}, LFf/q1;->a(LFf/q1;Ljava/lang/String;ZIZI)LFf/q1;

    move-result-object v4

    iget-object v5, v0, LFf/j0;->C:LFf/k0;

    if-nez v5, :cond_a4

    move-object/from16 v6, v25

    goto :goto_7d

    :cond_a4
    new-instance v6, LFf/l0;

    sget-object v7, LGa/t;->TIME:LGa/t;

    iget-object v8, v5, LFf/k0;->d:LGa/s;

    const/4 v10, 0x2

    invoke-static {v8, v7, v10}, LGa/s;->f(LGa/s;LGa/t;I)Ljava/lang/String;

    move-result-object v7

    iget-object v8, v5, LFf/k0;->c:Ljava/lang/String;

    iget-object v9, v5, LFf/k0;->a:Ljava/lang/String;

    iget-object v5, v5, LFf/k0;->b:Ljava/lang/String;

    invoke-direct {v6, v9, v5, v8, v7}, LFf/l0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_7d
    invoke-static {v6}, LIm/s;->h0(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    iget-object v6, v3, LFf/v;->d:Ljava/util/List;

    invoke-static {v6}, LIm/r;->T1(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v6

    invoke-static {v6, v1, v0}, LFf/v;->w(Ljava/util/List;Ljava/util/List;LFf/j0;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0, v5}, LIm/r;->B1(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/16 v11, 0xfcc

    move-object/from16 v58, v3

    move-object v3, v0

    move-object/from16 v0, v58

    move-object/from16 v58, v2

    move-object v2, v1

    move-object/from16 v1, v58

    invoke-static/range {v0 .. v11}, LFf/v;->u(LFf/v;Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;Ljava/lang/Integer;Ljava/util/List;LFf/q1;ZZZLjava/util/List;ZLFf/p1;I)LFf/v;

    move-result-object v1

    move-object v2, v1

    :goto_7e
    iget-object v1, v2, LFf/v;->d:Ljava/util/List;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_a5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_a6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v4, v6

    check-cast v4, Lc8/c;

    instance-of v4, v4, LFf/s;

    if-eqz v4, :cond_a5

    goto :goto_7f

    :cond_a6
    move-object/from16 v6, v25

    :goto_7f
    check-cast v6, LFf/s;

    if-eqz v6, :cond_a7

    iget-object v3, v6, LFf/s;->c:Lae/a;

    iget-object v6, v3, Lae/a;->a:Ljava/lang/String;

    :goto_80
    move-object/from16 v3, p2

    goto :goto_81

    :cond_a7
    move-object/from16 v6, v25

    goto :goto_80

    :goto_81
    iput-object v6, v3, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    iget-object v0, v0, LFf/v;->d:Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a9

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v3, v6

    check-cast v3, Lc8/c;

    instance-of v3, v3, LFf/g0;

    if-eqz v3, :cond_a8

    goto :goto_82

    :cond_a9
    move-object/from16 v6, v25

    :goto_82
    check-cast v6, LFf/g0;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_aa
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_ab

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lc8/c;

    instance-of v3, v3, LFf/g0;

    if-eqz v3, :cond_aa

    move-object v13, v1

    goto :goto_83

    :cond_ab
    move-object/from16 v13, v25

    :goto_83
    check-cast v13, LFf/g0;

    if-eqz v6, :cond_ae

    if-eqz v13, :cond_ae

    iget-boolean v0, v13, LFf/g0;->l:Z

    if-eqz v0, :cond_ae

    iget-object v0, v6, LFf/g0;->n:Ljava/util/Set;

    move-object/from16 v1, p3

    iput-object v0, v1, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    iget-object v0, v13, LFf/g0;->n:Ljava/util/Set;

    move-object/from16 v1, p4

    iput-object v0, v1, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    iget-object v0, v6, LFf/g0;->a:Lwg/k1;

    iget-object v0, v0, Lwg/k1;->c:Ljava/util/List;

    move/from16 v1, v17

    invoke-static {v0, v1}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-static {v1}, LIm/G;->J(I)I

    move-result v1

    const/16 v3, 0x10

    if-ge v1, v3, :cond_ac

    move v1, v3

    :cond_ac
    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_84
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_ad

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lyd/x;

    iget-object v4, v1, Lyd/x;->a:Ljava/lang/String;

    iget-object v1, v1, Lyd/x;->c:Ljava/lang/String;

    invoke-interface {v3, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_84

    :cond_ad
    move-object/from16 v1, p5

    iput-object v3, v1, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    :cond_ae
    invoke-static/range {p1 .. p1}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->access$getRefreshingInsights$p(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;)Z

    move-result v8

    invoke-static/range {p1 .. p1}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->access$getRefreshingProcessingHero$p(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;)Z

    move-result v9

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v10, 0x0

    const/16 v13, 0xe7f

    invoke-static/range {v2 .. v13}, LFf/v;->u(LFf/v;Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;Ljava/lang/Integer;Ljava/util/List;LFf/q1;ZZZLjava/util/List;ZLFf/p1;I)LFf/v;

    move-result-object v0

    invoke-static/range {p1 .. p1}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->access$getLatestCustomizations$p(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;)Lzo/r0;

    move-result-object v1

    check-cast v1, Lzo/M0;

    invoke-virtual {v1}, Lzo/M0;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/eightsleep/data_user/domain/model/DynamicHomeCustomizations;

    invoke-static {v0, v1}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModelKt;->access$withCustomizations(LFf/v;Lcom/eightsleep/data_user/domain/model/DynamicHomeCustomizations;)LFf/v;

    move-result-object v0

    invoke-static/range {p1 .. p1}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->access$getFeatureFlags(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;)LWc/b;

    move-result-object v1

    iget-object v1, v1, LWc/b;->i0:LYc/c;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Lcom/launchdarkly/sdk/android/L;->H(LYc/e;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-static {v0, v1}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModelKt;->access$withTemperatureAdjustments(LFf/v;Z)LFf/v;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "LLm/c<",
            "*>;)",
            "LLm/c<",
            "LHm/B;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;

    iget-object p0, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    invoke-direct {v0, p0, p2}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;-><init>(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;LLm/c;)V

    iput-object p1, v0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->L$0:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(LFf/j0;LLm/c;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LFf/j0;",
            "LLm/c<",
            "-",
            "LHm/B;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, LFf/j0;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->invoke(LFf/j0;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v0, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->label:I

    if-nez v0, :cond_17

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->L$0:Ljava/lang/Object;

    move-object v1, p1

    check-cast v1, LFf/j0;

    iget-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Observed sources: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->access$logD(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    invoke-static {p1}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->access$getTagPatternCards$p(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;)Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/TagPatternCardsHolder;

    move-result-object p1

    iget-object v0, v1, LFf/j0;->o:Ljava/util/Map;

    invoke-virtual {p1, v0}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/TagPatternCardsHolder;->onSavedTags(Ljava/util/Map;)V

    iget-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    invoke-virtual {p1}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->getUserInsightsLoadedTimeMs()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long p1, v2, v4

    if-gez p1, :cond_0

    iget-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {p1, v2, v3}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->setUserInsightsLoadedTimeMs(J)V

    :cond_0
    iget-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    iget-object v0, v1, LFf/j0;->e:Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v8, 0x0

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lc9/f;

    iget-object v3, v3, Lc9/f;->e:Lc9/g;

    iget-object v3, v3, Lc9/g;->g:Lc9/p;

    if-eqz v3, :cond_2

    iget-object v3, v3, Lc9/p;->a:Ljava/lang/String;

    goto :goto_0

    :cond_2
    move-object v3, v8

    :goto_0
    if-eqz v3, :cond_1

    goto :goto_1

    :cond_3
    move-object v2, v8

    :goto_1
    check-cast v2, Lc9/f;

    if-eqz v2, :cond_4

    iget-object v0, v2, Lc9/f;->e:Lc9/g;

    iget-object v0, v0, Lc9/g;->g:Lc9/p;

    if-eqz v0, :cond_4

    iget-object v0, v0, Lc9/p;->a:Ljava/lang/String;

    goto :goto_2

    :cond_4
    move-object v0, v8

    :goto_2
    invoke-virtual {p1, v0}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->setQualityVariation(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    invoke-static {p1, v1}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->access$maybeHandleInsightSettingsChange(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;LFf/j0;)V

    iget-object p1, v1, LFf/j0;->d:Ljava/time/LocalDate;

    if-eqz p1, :cond_7

    iget-object p1, v1, LFf/j0;->e:Ljava/util/List;

    if-eqz p1, :cond_5

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5

    goto :goto_3

    :cond_5
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_6
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc9/f;

    iget-object v2, v0, Lc9/f;->e:Lc9/g;

    iget-object v2, v2, Lc9/g;->c:Lcom/eightsleep/data_ai_insights/enums/AiInsightSleepState;

    sget-object v3, Lcom/eightsleep/data_ai_insights/enums/AiInsightSleepState;->POST_SLEEP:Lcom/eightsleep/data_ai_insights/enums/AiInsightSleepState;

    if-ne v2, v3, :cond_6

    iget-object v0, v0, Lc9/f;->b:Lcom/eightsleep/data_ai_insights/enums/AiInsightState;

    invoke-virtual {v0}, Lcom/eightsleep/data_ai_insights/enums/AiInsightState;->isProcessing()Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    invoke-static {p1, v8}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->access$setAwayInsightsRefreshKey$p(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;LHm/k;)V

    :cond_7
    :goto_3
    new-instance v4, Lkotlin/jvm/internal/A;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    new-instance v5, Lkotlin/jvm/internal/A;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    new-instance v6, Lkotlin/jvm/internal/A;

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    sget-object p1, LIm/A;->a:LIm/A;

    iput-object p1, v6, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    new-instance v3, Lkotlin/jvm/internal/A;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iget-object v2, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    new-instance v0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/d;

    const/4 v7, 0x1

    invoke-direct/range {v0 .. v7}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/d;-><init>(Ljava/lang/Object;LL8/m;Ljava/lang/Object;Ljava/io/Serializable;Ljava/io/Serializable;Ljava/io/Serializable;I)V

    const/4 p1, 0x1

    invoke-static {v2, v0, p1}, Landroid/support/v4/media/session/b;->I(LY7/o;LVm/k;I)V

    iget-object v0, v3, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_8

    iget-object v2, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    invoke-static {v2}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->access$getDeliveredOrderCard$p(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;)Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DeliveredOrderCardHolder;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DeliveredOrderCardHolder;->reportShown(Ljava/lang/String;)V

    :cond_8
    iget-object v0, v4, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/Set;

    iget-object v2, v5, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    check-cast v2, Ljava/util/Set;

    if-eqz v0, :cond_e

    if-eqz v2, :cond_e

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_e

    iget-object v3, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    invoke-static {v3}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->access$getTagPatternCards$p(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;)Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/TagPatternCardsHolder;

    move-result-object v3

    iget-object v4, v1, LFf/j0;->o:Ljava/util/Map;

    invoke-static {v4}, Landroidx/glance/appwidget/protobuf/f0;->G(Ljava/util/Map;)Ljava/util/List;

    move-result-object v4

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_9
    :goto_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_a

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    move-object v9, v7

    check-cast v9, Lyd/x;

    iget-boolean v10, v9, Lyd/x;->b:Z

    if-eqz v10, :cond_9

    move-object v10, v0

    check-cast v10, Ljava/lang/Iterable;

    invoke-static {v2, v10}, LIm/M;->I(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v10

    iget-object v9, v9, Lyd/x;->a:Ljava/lang/String;

    invoke-interface {v10, v9}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_9

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    :cond_a
    check-cast v2, Ljava/lang/Iterable;

    invoke-static {v0, v2}, LIm/M;->I(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    new-instance v2, Ljava/util/LinkedHashMap;

    const/16 v4, 0xa

    invoke-static {v0, v4}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-static {v4}, LIm/G;->J(I)I

    move-result v4

    const/16 v7, 0x10

    if-ge v4, v7, :cond_b

    move v4, v7

    :cond_b
    invoke-direct {v2, v4}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Ljava/lang/String;

    iget-object v9, v6, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    check-cast v9, Ljava/util/Map;

    invoke-interface {v9, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    if-nez v9, :cond_c

    goto :goto_6

    :cond_c
    move-object v7, v9

    :goto_6
    invoke-interface {v2, v4, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5

    :cond_d
    invoke-virtual {v3, v5, v2}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/TagPatternCardsHolder;->onSavedTagsChanged(Ljava/util/List;Ljava/util/Map;)V

    :cond_e
    iget-object v0, v1, LFf/j0;->c:Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;

    sget-object v2, Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;->IN_SESSION:Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;

    if-ne v0, v2, :cond_f

    iget-object v0, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    invoke-static {v0}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->access$startInSessionTimerIfNeeded(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;)V

    goto :goto_7

    :cond_f
    iget-object v0, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    invoke-static {v0}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->access$getInSessionTimerJob$p(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;)Lwo/h0;

    move-result-object v0

    if-eqz v0, :cond_10

    invoke-interface {v0, v8}, Lwo/h0;->b(Ljava/util/concurrent/CancellationException;)V

    :cond_10
    :goto_7
    iget-object v0, v1, LFf/j0;->j0:Ljd/c;

    if-eqz v0, :cond_11

    iget-boolean v0, v0, Ljd/c;->b:Z

    if-ne v0, p1, :cond_11

    iget-boolean p1, v1, LFf/j0;->k0:Z

    if-nez p1, :cond_11

    iget-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    invoke-static {p1}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->access$getAppUserId(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_11

    iget-object v0, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    invoke-static {v0}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->access$getRapidCoolingSetupDoneUserId$p(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;)Lzo/r0;

    move-result-object v2

    check-cast v2, Lzo/M0;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2, v8, p1}, Lzo/M0;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    const-string v2, "menopauseRapidCoolingSetupBanner-complete"

    invoke-static {v0, p1, v2}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->access$recordMessage(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;Ljava/lang/String;Ljava/lang/String;)V

    :cond_11
    iget-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    invoke-static {p1}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->access$getInitStateFlow$p(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;)Lzo/r0;

    move-result-object p1

    new-instance v0, Lya/g;

    sget-object v2, LHm/B;->a:LHm/B;

    invoke-direct {v0, v2}, Lya/g;-><init>(Ljava/lang/Object;)V

    check-cast p1, Lzo/M0;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, v8, v0}, Lzo/M0;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    invoke-static {p1}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->access$getPerformanceService$p(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;)LPa/c;

    move-result-object p1

    check-cast p1, LPa/g;

    invoke-virtual {p1}, LPa/g;->c()V

    iget-boolean p1, v1, LFf/j0;->T:Z

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iget-object v0, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    invoke-static {v0}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->access$getSentTagBreakdownEnabled$p(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_13

    iget-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    iget-boolean v0, v1, LFf/j0;->T:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->access$setSentTagBreakdownEnabled$p(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;Ljava/lang/Boolean;)V

    iget-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    invoke-virtual {p1}, LL8/e;->getAnalytics()LRc/b;

    move-result-object p1

    iget-boolean v0, v1, LFf/j0;->T:Z

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, LXo/a;->DEBUG:LXo/a;

    sget-object v4, LXo/d;->a:LXo/b;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v4, LXo/b;->b:LXo/d;

    invoke-interface {v4, v3}, LXo/d;->b(LXo/a;)Z

    move-result v5

    if-eqz v5, :cond_12

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Setting user property tag_breakdown_enabled="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Analytics"

    invoke-interface {v4, v3, v6, v5}, LXo/d;->a(LXo/a;Ljava/lang/String;Ljava/lang/String;)V

    :cond_12
    iget-object p1, p1, LRc/b;->a:LRc/a;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lf5/j;

    const/16 v4, 0xd

    invoke-direct {v3, v4}, Lf5/j;-><init>(I)V

    sget-object v4, LN5/c;->SET:LN5/c;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v5, "tag_breakdown_enabled"

    invoke-virtual {v3, v4, v5, v0}, Lf5/j;->F(LN5/c;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p1, p1, LRc/a;->a:LA5/f;

    invoke-static {p1, v3}, LA5/f;->h(LA5/f;Lf5/j;)V

    :cond_13
    iget-boolean p1, v1, LFf/j0;->T:Z

    if-eqz p1, :cond_15

    iget-object p1, v1, LFf/j0;->c:Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;

    sget-object v0, Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;->DAWN:Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;

    if-eq p1, v0, :cond_14

    sget-object v0, Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;->AFTERNOON:Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;

    if-ne p1, v0, :cond_16

    :cond_14
    iget-object p0, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    invoke-static {p0}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->access$getTagPatternCards$p(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;)Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/TagPatternCardsHolder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/TagPatternCardsHolder;->start()V

    return-object v2

    :cond_15
    iget-object p1, v1, LFf/j0;->c:Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;

    sget-object v0, Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;->AWAY:Lcom/eightsleep/data_ai_insights/enums/AiInsightsViewState;

    if-eq p1, v0, :cond_16

    iget-object p0, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$observeInsights$1$3;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    iget-object p1, v1, LFf/j0;->o:Ljava/util/Map;

    invoke-static {p1}, Landroidx/glance/appwidget/protobuf/f0;->G(Ljava/util/Map;)Ljava/util/List;

    move-result-object p1

    iget-object v0, v1, LFf/j0;->p:Ljava/util/List;

    invoke-static {p0, p1, v0}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->access$maybeTriggerTagAnalysesOneTime(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;Ljava/util/List;Ljava/util/List;)V

    :cond_16
    return-object v2

    :cond_17
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
