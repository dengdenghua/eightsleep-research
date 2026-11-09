.class public final synthetic Lhf/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LVm/k;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Lhf/c;->a:I

    iput-object p2, p0, Lhf/c;->c:Ljava/lang/Object;

    iput-object p3, p0, Lhf/c;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(LVm/k;ILjava/lang/Object;)V
    .locals 0

    .line 2
    iput p2, p0, Lhf/c;->a:I

    iput-object p1, p0, Lhf/c;->b:Ljava/lang/Object;

    iput-object p3, p0, Lhf/c;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lj0/i3;Lw/y0;Lm0/Z;)V
    .locals 0

    .line 3
    const/16 p1, 0x8

    iput p1, p0, Lhf/c;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lhf/c;->c:Ljava/lang/Object;

    iput-object p3, p0, Lhf/c;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget v2, v0, Lhf/c;->a:I

    packed-switch v2, :pswitch_data_0

    check-cast v1, Ljava/time/LocalTime;

    const-string v2, "localTime"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v2, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v2, LGa/s;

    invoke-static {v2, v1}, LGa/s;->d(LGa/s;Ljava/time/LocalTime;)LGa/s;

    move-result-object v1

    iget-object v0, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v0, LVm/k;

    invoke-interface {v0, v1}, LVm/k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, LHm/B;->a:LHm/B;

    return-object v0

    :pswitch_0
    check-cast v1, LI/j;

    const-string v2, "$this$LazyColumn"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v2, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v2, Lte/i;

    iget-object v2, v2, Lte/i;->d:Ljava/util/List;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lte/e;

    new-instance v4, Lue/A;

    iget-object v5, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v5, Landroid/content/Context;

    const/4 v6, 0x1

    invoke-direct {v4, v3, v5, v6}, Lue/A;-><init>(Lte/e;Landroid/content/Context;I)V

    new-instance v3, Lu0/d;

    const v5, 0x60f78c8a

    const/4 v6, 0x1

    invoke-direct {v3, v4, v6, v5}, Lu0/d;-><init>(Ljava/lang/Object;ZI)V

    const/4 v4, 0x3

    const/4 v5, 0x0

    invoke-static {v1, v5, v3, v4}, LI/j;->r(LI/j;Ljava/lang/String;Lu0/d;I)V

    goto :goto_0

    :cond_0
    sget-object v0, LHm/B;->a:LHm/B;

    return-object v0

    :pswitch_1
    iget-object v2, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v2, Lcom/eightsleep/presentation_onboarding/feature/autopilotprofile/viewmodel/AutopilotProfileOnboardingViewModel;

    check-cast v1, Lqh/b;

    iget-object v0, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v0, Lrh/e;

    invoke-static {v0, v2, v1}, Lcom/eightsleep/presentation_onboarding/feature/autopilotprofile/viewmodel/AutopilotProfileOnboardingViewModel;->v(Lrh/e;Lcom/eightsleep/presentation_onboarding/feature/autopilotprofile/viewmodel/AutopilotProfileOnboardingViewModel;Lqh/b;)Lqh/b;

    move-result-object v0

    return-object v0

    :pswitch_2
    check-cast v1, Lqh/b;

    iget-object v2, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v2, LN9/m;

    iget-object v0, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v0, Lqh/f;

    invoke-static {v2, v0, v1}, Lcom/eightsleep/presentation_onboarding/feature/autopilotprofile/viewmodel/AutopilotProfileOnboardingViewModel;->w(LN9/m;Lqh/f;Lqh/b;)Lqh/b;

    move-result-object v0

    return-object v0

    :pswitch_3
    check-cast v1, Ljava/lang/String;

    const-string v2, "it"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v1, LVm/k;

    iget-object v0, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v0, Lte/e;

    invoke-interface {v1, v0}, LVm/k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, LHm/B;->a:LHm/B;

    return-object v0

    :pswitch_4
    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    iget-object v2, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v2, LVm/n;

    iget-object v0, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v0, Lte/e;

    invoke-interface {v2, v0, v1}, LVm/n;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, LHm/B;->a:LHm/B;

    return-object v0

    :pswitch_5
    check-cast v1, Lcom/eightsleep/presentation_onboarding/viewmodel/FillPodOnboardingViewModel$Factory;

    const-string v2, "factory"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v4, 0x0

    const/4 v5, 0x4

    iget-object v2, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v0, v0, Lhf/c;->b:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lcom/eightsleep/data_core/enums/PrimingTaskMetaId;

    const/4 v6, 0x0

    invoke-static/range {v1 .. v6}, Lcom/eightsleep/presentation_onboarding/viewmodel/FillPodOnboardingViewModel$Factory$DefaultImpls;->create$default(Lcom/eightsleep/presentation_onboarding/viewmodel/FillPodOnboardingViewModel$Factory;Ljava/lang/String;Lcom/eightsleep/data_core/enums/PrimingTaskMetaId;IILjava/lang/Object;)Lcom/eightsleep/presentation_onboarding/viewmodel/FillPodOnboardingViewModel;

    move-result-object v0

    return-object v0

    :pswitch_6
    check-cast v1, Lp1/g;

    iget-object v2, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v2, Lp1/g;

    if-ne v2, v1, :cond_1

    const-string v2, " > "

    goto :goto_1

    :cond_1
    const-string v2, "   "

    :goto_1
    invoke-static {v2}, Lj/m;->r(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v0, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v0, Lm4/B;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v0, v1, Lp1/a;

    const/16 v3, 0x29

    const-string v4, ", newCursorPosition="

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v5, "CommitTextCommand(text.length="

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    check-cast v1, Lp1/a;

    iget-object v5, v1, Lp1/a;->a:Lk1/h;

    iget-object v5, v5, Lk1/h;->b:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, v1, Lp1/a;->b:I

    :goto_2
    invoke-static {v0, v1, v3}, Lcom/eightsleep/data_bioage/data/model/a;->k(Ljava/lang/StringBuilder;IC)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_3

    :cond_2
    instance-of v0, v1, Lp1/u;

    if-eqz v0, :cond_3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v5, "SetComposingTextCommand(text.length="

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    check-cast v1, Lp1/u;

    iget-object v5, v1, Lp1/u;->a:Lk1/h;

    iget-object v5, v5, Lk1/h;->b:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, v1, Lp1/u;->b:I

    goto :goto_2

    :cond_3
    instance-of v0, v1, Lp1/t;

    if-eqz v0, :cond_4

    check-cast v1, Lp1/t;

    invoke-virtual {v1}, Lp1/t;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    :cond_4
    instance-of v0, v1, Lp1/e;

    if-eqz v0, :cond_5

    check-cast v1, Lp1/e;

    invoke-virtual {v1}, Lp1/e;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    :cond_5
    instance-of v0, v1, Lp1/f;

    if-eqz v0, :cond_6

    check-cast v1, Lp1/f;

    invoke-virtual {v1}, Lp1/f;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    :cond_6
    instance-of v0, v1, Lp1/v;

    if-eqz v0, :cond_7

    check-cast v1, Lp1/v;

    invoke-virtual {v1}, Lp1/v;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    :cond_7
    instance-of v0, v1, Lp1/h;

    if-eqz v0, :cond_8

    check-cast v1, Lp1/h;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "FinishComposingTextCommand()"

    goto :goto_3

    :cond_8
    instance-of v0, v1, Lp1/d;

    if-eqz v0, :cond_9

    check-cast v1, Lp1/d;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "DeleteAllCommand()"

    goto :goto_3

    :cond_9
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    sget-object v1, Lkotlin/jvm/internal/B;->a:Lkotlin/jvm/internal/C;

    invoke-virtual {v1, v0}, Lkotlin/jvm/internal/C;->b(Ljava/lang/Class;)Lbn/d;

    move-result-object v0

    invoke-interface {v0}, Lbn/d;->k()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_a

    const-string v0, "{anonymous EditCommand}"

    :cond_a
    const-string v1, "Unknown EditCommand: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_3
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_7
    iget-object v2, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v2, Lm4/F;

    iget-object v0, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v0, Lo1/C;

    check-cast v1, Lo1/F;

    iget-object v3, v2, Lm4/F;->a:Ljava/lang/Object;

    check-cast v3, LX4/a;

    monitor-enter v3

    :try_start_0
    invoke-interface {v1}, Lo1/F;->b()Z

    move-result v4

    if-eqz v4, :cond_b

    iget-object v2, v2, Lm4/F;->b:Ljava/lang/Object;

    check-cast v2, Lt/t;

    invoke-virtual {v2, v0, v1}, Lt/t;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lo1/F;

    goto :goto_4

    :catchall_0
    move-exception v0

    goto :goto_5

    :cond_b
    iget-object v1, v2, Lm4/F;->b:Ljava/lang/Object;

    check-cast v1, Lt/t;

    invoke-virtual {v1, v0}, Lt/t;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lo1/F;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_4
    monitor-exit v3

    sget-object v0, LHm/B;->a:LHm/B;

    return-object v0

    :goto_5
    monitor-exit v3

    throw v0

    :pswitch_8
    iget-object v2, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v2, Lo1/j;

    iget-object v0, v0, Lhf/c;->b:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Lo1/C;

    move-object v8, v1

    check-cast v8, LVm/k;

    iget-object v0, v2, Lo1/j;->d:Lo1/o;

    iget-object v9, v2, Lo1/j;->a:LKj/k;

    iget-object v1, v2, Lo1/j;->f:Lle/a;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v3, v6, Lo1/C;->a:Lo1/i;

    instance-of v4, v3, Lo1/l;

    if-nez v4, :cond_c

    const/4 v4, 0x0

    goto/16 :goto_20

    :cond_c
    check-cast v3, Lo1/l;

    iget-object v3, v3, Lo1/l;->f:Ljava/util/List;

    iget-object v4, v6, Lo1/C;->b:Lo1/t;

    iget v5, v6, Lo1/C;->c:I

    new-instance v7, Ljava/util/ArrayList;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v12

    invoke-direct {v7, v12}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v12

    const/4 v14, 0x0

    :goto_6
    if-ge v14, v12, :cond_e

    invoke-interface {v3, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    move-object v11, v15

    check-cast v11, Lo1/z;

    iget-object v11, v11, Lo1/z;->b:Lo1/t;

    invoke-static {v11, v4}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_d

    if-nez v5, :cond_d

    invoke-virtual {v7, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_d
    add-int/lit8 v14, v14, 0x1

    goto :goto_6

    :cond_e
    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_f

    goto/16 :goto_18

    :cond_f
    new-instance v7, Ljava/util/ArrayList;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v11

    invoke-direct {v7, v11}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v11

    const/4 v12, 0x0

    :goto_7
    if-ge v12, v11, :cond_11

    invoke-interface {v3, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    move-object v15, v14

    check-cast v15, Lo1/z;

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-nez v5, :cond_10

    invoke-virtual {v7, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_10
    add-int/lit8 v12, v12, 0x1

    goto :goto_7

    :cond_11
    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_12

    goto :goto_8

    :cond_12
    move-object v3, v7

    :goto_8
    sget-object v5, Lo1/t;->c:Lo1/t;

    invoke-virtual {v4, v5}, Lo1/t;->a(Lo1/t;)I

    move-result v5

    iget v7, v4, Lo1/t;->a:I

    if-gez v5, :cond_1b

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v4

    const/4 v5, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    :goto_9
    if-ge v5, v4, :cond_18

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lo1/z;

    iget-object v14, v14, Lo1/z;->b:Lo1/t;

    iget v15, v14, Lo1/t;->a:I

    invoke-static {v15, v7}, Lkotlin/jvm/internal/l;->k(II)I

    move-result v15

    iget v10, v14, Lo1/t;->a:I

    if-gez v15, :cond_14

    if-eqz v11, :cond_13

    iget v15, v11, Lo1/t;->a:I

    invoke-static {v10, v15}, Lkotlin/jvm/internal/l;->k(II)I

    move-result v10

    if-lez v10, :cond_16

    :cond_13
    move-object v11, v14

    goto :goto_a

    :cond_14
    invoke-static {v10, v7}, Lkotlin/jvm/internal/l;->k(II)I

    move-result v15

    if-lez v15, :cond_17

    if-eqz v12, :cond_15

    iget v15, v12, Lo1/t;->a:I

    invoke-static {v10, v15}, Lkotlin/jvm/internal/l;->k(II)I

    move-result v10

    if-gez v10, :cond_16

    :cond_15
    move-object v12, v14

    :cond_16
    :goto_a
    add-int/lit8 v5, v5, 0x1

    goto :goto_9

    :cond_17
    move-object v11, v14

    move-object v12, v11

    :cond_18
    if-nez v11, :cond_19

    move-object v11, v12

    :cond_19
    new-instance v7, Ljava/util/ArrayList;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v7, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v4

    const/4 v5, 0x0

    :goto_b
    if-ge v5, v4, :cond_39

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    move-object v12, v10

    check-cast v12, Lo1/z;

    iget-object v12, v12, Lo1/z;->b:Lo1/t;

    invoke-static {v12, v11}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1a

    invoke-virtual {v7, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1a
    add-int/lit8 v5, v5, 0x1

    goto :goto_b

    :cond_1b
    sget-object v5, Lo1/t;->d:Lo1/t;

    invoke-virtual {v4, v5}, Lo1/t;->a(Lo1/t;)I

    move-result v4

    if-lez v4, :cond_24

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v4

    const/4 v5, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_c
    if-ge v11, v4, :cond_21

    invoke-interface {v3, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lo1/z;

    iget-object v12, v12, Lo1/z;->b:Lo1/t;

    iget v14, v12, Lo1/t;->a:I

    invoke-static {v14, v7}, Lkotlin/jvm/internal/l;->k(II)I

    move-result v14

    iget v15, v12, Lo1/t;->a:I

    if-gez v14, :cond_1d

    if-eqz v5, :cond_1c

    iget v14, v5, Lo1/t;->a:I

    invoke-static {v15, v14}, Lkotlin/jvm/internal/l;->k(II)I

    move-result v14

    if-lez v14, :cond_1f

    :cond_1c
    move-object v5, v12

    goto :goto_d

    :cond_1d
    invoke-static {v15, v7}, Lkotlin/jvm/internal/l;->k(II)I

    move-result v14

    if-lez v14, :cond_20

    if-eqz v10, :cond_1e

    iget v14, v10, Lo1/t;->a:I

    invoke-static {v15, v14}, Lkotlin/jvm/internal/l;->k(II)I

    move-result v14

    if-gez v14, :cond_1f

    :cond_1e
    move-object v10, v12

    :cond_1f
    :goto_d
    add-int/lit8 v11, v11, 0x1

    goto :goto_c

    :cond_20
    move-object v5, v12

    move-object v10, v5

    :cond_21
    if-nez v10, :cond_22

    goto :goto_e

    :cond_22
    move-object v5, v10

    :goto_e
    new-instance v7, Ljava/util/ArrayList;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v7, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v4

    const/4 v10, 0x0

    :goto_f
    if-ge v10, v4, :cond_39

    invoke-interface {v3, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    move-object v12, v11

    check-cast v12, Lo1/z;

    iget-object v12, v12, Lo1/z;->b:Lo1/t;

    invoke-static {v12, v5}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_23

    invoke-virtual {v7, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_23
    add-int/lit8 v10, v10, 0x1

    goto :goto_f

    :cond_24
    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v4

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    :goto_10
    if-ge v12, v4, :cond_2b

    invoke-interface {v3, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lo1/z;

    iget-object v14, v14, Lo1/z;->b:Lo1/t;

    iget v15, v14, Lo1/t;->a:I

    iget v13, v5, Lo1/t;->a:I

    invoke-static {v15, v13}, Lkotlin/jvm/internal/l;->k(II)I

    move-result v13

    if-lez v13, :cond_25

    goto :goto_11

    :cond_25
    iget v13, v14, Lo1/t;->a:I

    invoke-static {v13, v7}, Lkotlin/jvm/internal/l;->k(II)I

    move-result v13

    iget v15, v14, Lo1/t;->a:I

    if-gez v13, :cond_27

    if-eqz v10, :cond_26

    iget v13, v10, Lo1/t;->a:I

    invoke-static {v15, v13}, Lkotlin/jvm/internal/l;->k(II)I

    move-result v13

    if-lez v13, :cond_29

    :cond_26
    move-object v10, v14

    goto :goto_11

    :cond_27
    invoke-static {v15, v7}, Lkotlin/jvm/internal/l;->k(II)I

    move-result v13

    if-lez v13, :cond_2a

    if-eqz v11, :cond_28

    iget v13, v11, Lo1/t;->a:I

    invoke-static {v15, v13}, Lkotlin/jvm/internal/l;->k(II)I

    move-result v13

    if-gez v13, :cond_29

    :cond_28
    move-object v11, v14

    :cond_29
    :goto_11
    add-int/lit8 v12, v12, 0x1

    goto :goto_10

    :cond_2a
    move-object v10, v14

    move-object v11, v10

    :cond_2b
    if-nez v11, :cond_2c

    goto :goto_12

    :cond_2c
    move-object v10, v11

    :goto_12
    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v5

    const/4 v11, 0x0

    :goto_13
    if-ge v11, v5, :cond_2e

    invoke-interface {v3, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    move-object v13, v12

    check-cast v13, Lo1/z;

    iget-object v13, v13, Lo1/z;->b:Lo1/t;

    invoke-static {v13, v10}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2d

    invoke-virtual {v4, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2d
    add-int/lit8 v11, v11, 0x1

    goto :goto_13

    :cond_2e
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_38

    sget-object v4, Lo1/t;->d:Lo1/t;

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v5

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    :goto_14
    if-ge v12, v5, :cond_35

    invoke-interface {v3, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lo1/z;

    iget-object v13, v13, Lo1/z;->b:Lo1/t;

    if-eqz v4, :cond_2f

    iget v14, v13, Lo1/t;->a:I

    iget v15, v4, Lo1/t;->a:I

    invoke-static {v14, v15}, Lkotlin/jvm/internal/l;->k(II)I

    move-result v14

    if-gez v14, :cond_2f

    goto :goto_15

    :cond_2f
    iget v14, v13, Lo1/t;->a:I

    invoke-static {v14, v7}, Lkotlin/jvm/internal/l;->k(II)I

    move-result v14

    iget v15, v13, Lo1/t;->a:I

    if-gez v14, :cond_31

    if-eqz v10, :cond_30

    iget v14, v10, Lo1/t;->a:I

    invoke-static {v15, v14}, Lkotlin/jvm/internal/l;->k(II)I

    move-result v14

    if-lez v14, :cond_33

    :cond_30
    move-object v10, v13

    goto :goto_15

    :cond_31
    invoke-static {v15, v7}, Lkotlin/jvm/internal/l;->k(II)I

    move-result v14

    if-lez v14, :cond_34

    if-eqz v11, :cond_32

    iget v14, v11, Lo1/t;->a:I

    invoke-static {v15, v14}, Lkotlin/jvm/internal/l;->k(II)I

    move-result v14

    if-gez v14, :cond_33

    :cond_32
    move-object v11, v13

    :cond_33
    :goto_15
    add-int/lit8 v12, v12, 0x1

    goto :goto_14

    :cond_34
    move-object v10, v13

    move-object v11, v10

    :cond_35
    if-nez v11, :cond_36

    goto :goto_16

    :cond_36
    move-object v10, v11

    :goto_16
    new-instance v7, Ljava/util/ArrayList;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v7, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v4

    const/4 v5, 0x0

    :goto_17
    if-ge v5, v4, :cond_39

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    move-object v12, v11

    check-cast v12, Lo1/z;

    iget-object v12, v12, Lo1/z;->b:Lo1/t;

    invoke-static {v12, v10}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_37

    invoke-virtual {v7, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_37
    add-int/lit8 v5, v5, 0x1

    goto :goto_17

    :cond_38
    move-object v7, v4

    :cond_39
    :goto_18
    iget-object v3, v0, Lo1/o;->a:Lf5/s;

    invoke-interface {v7}, Ljava/util/Collection;->size()I

    move-result v4

    if-lez v4, :cond_3e

    const/4 v4, 0x0

    invoke-interface {v7, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lo1/z;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v5, v3, Lf5/s;->c:Ljava/lang/Object;

    check-cast v5, LX4/a;

    monitor-enter v5

    :try_start_1
    new-instance v7, Lo1/e;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v7, v4}, Lo1/e;-><init>(Lo1/z;)V

    iget-object v10, v3, Lf5/s;->a:Ljava/lang/Object;

    check-cast v10, Lt/t;

    invoke-virtual {v10, v7}, Lt/t;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lo1/d;

    if-nez v10, :cond_3a

    iget-object v10, v3, Lf5/s;->b:Ljava/lang/Object;

    check-cast v10, Lt/H;

    invoke-virtual {v10, v7}, Lt/H;->g(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    move-object v10, v7

    check-cast v10, Lo1/d;

    goto :goto_19

    :catchall_1
    move-exception v0

    goto :goto_1e

    :cond_3a
    :goto_19
    if-eqz v10, :cond_3b

    iget-object v3, v10, Lo1/d;->a:Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    monitor-exit v5

    goto :goto_1c

    :cond_3b
    monitor-exit v5

    :try_start_2
    invoke-virtual {v9, v4}, LKj/k;->b(Lo1/z;)Landroid/graphics/Typeface;

    move-result-object v5
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1a

    :catch_0
    invoke-virtual {v1, v6}, Lle/a;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    :goto_1a
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v7, Lo1/e;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v7, v4}, Lo1/e;-><init>(Lo1/z;)V

    iget-object v10, v3, Lf5/s;->c:Ljava/lang/Object;

    check-cast v10, LX4/a;

    monitor-enter v10

    if-nez v5, :cond_3c

    :try_start_3
    iget-object v3, v3, Lf5/s;->b:Ljava/lang/Object;

    check-cast v3, Lt/H;

    new-instance v11, Lo1/d;

    const/4 v12, 0x0

    invoke-direct {v11, v12}, Lo1/d;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v3, v7, v11}, Lt/H;->m(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_1b

    :catchall_2
    move-exception v0

    goto :goto_1d

    :cond_3c
    iget-object v3, v3, Lf5/s;->a:Ljava/lang/Object;

    check-cast v3, Lt/t;

    new-instance v11, Lo1/d;

    invoke-direct {v11, v5}, Lo1/d;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v3, v7, v11}, Lt/t;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :goto_1b
    monitor-exit v10

    move-object v3, v5

    :goto_1c
    if-nez v3, :cond_3d

    invoke-virtual {v1, v6}, Lle/a;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    :cond_3d
    iget v1, v6, Lo1/C;->d:I

    iget-object v5, v6, Lo1/C;->b:Lo1/t;

    iget v7, v6, Lo1/C;->c:I

    invoke-static {v1, v3, v4, v5, v7}, Llj/o;->K(ILjava/lang/Object;Lo1/z;Lo1/t;I)Ljava/lang/Object;

    move-result-object v1

    new-instance v3, LHm/k;

    const/4 v4, 0x0

    invoke-direct {v3, v4, v1}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_1f

    :goto_1d
    monitor-exit v10

    throw v0

    :goto_1e
    monitor-exit v5

    throw v0

    :cond_3e
    invoke-virtual {v1, v6}, Lle/a;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    new-instance v3, LHm/k;

    const/4 v4, 0x0

    invoke-direct {v3, v4, v1}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_1f
    iget-object v1, v3, LHm/k;->a:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Ljava/util/List;

    iget-object v5, v3, LHm/k;->b:Ljava/lang/Object;

    if-nez v4, :cond_3f

    new-instance v0, Lo1/E;

    const/4 v1, 0x1

    invoke-direct {v0, v5, v1}, Lo1/E;-><init>(Ljava/lang/Object;Z)V

    move-object v4, v0

    goto :goto_20

    :cond_3f
    const/4 v1, 0x1

    new-instance v3, Lo1/c;

    iget-object v7, v0, Lo1/o;->a:Lf5/s;

    invoke-direct/range {v3 .. v9}, Lo1/c;-><init>(Ljava/util/List;Ljava/lang/Object;Lo1/C;Lf5/s;LVm/k;LKj/k;)V

    iget-object v0, v0, Lo1/o;->b:LCo/c;

    sget-object v4, Lwo/B;->UNDISPATCHED:Lwo/B;

    new-instance v5, Lo1/m;

    const/4 v7, 0x0

    invoke-direct {v5, v3, v7}, Lo1/m;-><init>(Lo1/c;LLm/c;)V

    invoke-static {v0, v7, v4, v5, v1}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    new-instance v4, Lo1/D;

    invoke-direct {v4, v3}, Lo1/D;-><init>(Lo1/c;)V

    :goto_20
    if-nez v4, :cond_45

    iget-object v0, v2, Lo1/j;->e:LY5/f;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v6, Lo1/C;->a:Lo1/i;

    iget v1, v6, Lo1/C;->c:I

    iget-object v2, v6, Lo1/C;->b:Lo1/t;

    if-eqz v0, :cond_40

    instance-of v3, v0, Lo1/f;

    if-eqz v3, :cond_41

    :cond_40
    const/4 v4, 0x0

    goto :goto_21

    :cond_41
    instance-of v3, v0, Lo1/v;

    if-eqz v3, :cond_42

    check-cast v0, Lo1/v;

    iget-object v0, v0, Lo1/v;->f:Ljava/lang/String;

    invoke-static {v0, v2, v1}, LXb/a;->c(Ljava/lang/String;Lo1/t;I)Landroid/graphics/Typeface;

    move-result-object v0

    goto :goto_22

    :cond_42
    instance-of v1, v0, Lo1/w;

    if-eqz v1, :cond_43

    check-cast v0, Lo1/w;

    iget-object v0, v0, Lo1/w;->f:Ld2/d;

    iget-object v0, v0, Ld2/d;->b:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Typeface;

    goto :goto_22

    :cond_43
    const/4 v10, 0x0

    goto :goto_23

    :goto_21
    invoke-static {v4, v2, v1}, LXb/a;->c(Ljava/lang/String;Lo1/t;I)Landroid/graphics/Typeface;

    move-result-object v0

    :goto_22
    new-instance v10, Lo1/E;

    const/4 v1, 0x1

    invoke-direct {v10, v0, v1}, Lo1/E;-><init>(Ljava/lang/Object;Z)V

    :goto_23
    if-eqz v10, :cond_44

    move-object v4, v10

    goto :goto_24

    :cond_44
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Could not load font"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_45
    :goto_24
    return-object v4

    :pswitch_9
    check-cast v1, Lcoil3/compose/AsyncImagePainter$State;

    const-string v2, "state"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    instance-of v2, v1, Lcoil3/compose/AsyncImagePainter$State$Success;

    if-nez v2, :cond_46

    instance-of v1, v1, Lcoil3/compose/AsyncImagePainter$State$Error;

    if-eqz v1, :cond_47

    :cond_46
    new-instance v1, Lmh/a;

    iget-object v2, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v2, Landroid/net/Uri;

    invoke-direct {v1, v2}, Lmh/a;-><init>(Landroid/net/Uri;)V

    iget-object v0, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v0, LVm/k;

    invoke-interface {v0, v1}, LVm/k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_47
    sget-object v0, LHm/B;->a:LHm/B;

    return-object v0

    :pswitch_a
    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    iget-object v1, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v1, LVm/n;

    if-eqz v1, :cond_48

    iget-object v0, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v0, Lng/h;

    iget-boolean v2, v0, Lng/h;->e:Z

    xor-int/lit8 v2, v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v1, v0, v2}, LVm/n;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_48
    sget-object v0, LHm/B;->a:LHm/B;

    return-object v0

    :pswitch_b
    iget-object v2, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v2, Lm0/B0;

    iget-object v0, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Throwable;

    check-cast v1, Ljava/lang/Throwable;

    iget-object v3, v2, Lm0/B0;->d:Ljava/lang/Object;

    monitor-enter v3

    const/4 v4, 0x0

    if-eqz v0, :cond_4a

    if-eqz v1, :cond_4b

    :try_start_4
    instance-of v5, v1, Ljava/util/concurrent/CancellationException;

    if-nez v5, :cond_49

    goto :goto_25

    :cond_49
    move-object v1, v4

    :goto_25
    if-eqz v1, :cond_4b

    invoke-static {v0, v1}, LTb/a;->V(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    goto :goto_26

    :catchall_3
    move-exception v0

    goto :goto_27

    :cond_4a
    move-object v0, v4

    :cond_4b
    :goto_26
    iput-object v0, v2, Lm0/B0;->f:Ljava/lang/Throwable;

    iget-object v0, v2, Lm0/B0;->v:Lzo/M0;

    sget-object v1, Lm0/v0;->ShutDown:Lm0/v0;

    invoke-virtual {v0, v1}, Lzo/M0;->j(Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    monitor-exit v3

    sget-object v0, LHm/B;->a:LHm/B;

    return-object v0

    :goto_27
    monitor-exit v3

    throw v0

    :pswitch_c
    iget-object v2, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v2, Lm0/x;

    invoke-virtual {v2, v1}, Lm0/x;->z(Ljava/lang/Object;)V

    iget-object v0, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v0, Lt/I;

    if-eqz v0, :cond_4c

    invoke-virtual {v0, v1}, Lt/I;->a(Ljava/lang/Object;)Z

    :cond_4c
    sget-object v0, LHm/B;->a:LHm/B;

    return-object v0

    :pswitch_d
    check-cast v1, Lcom/eightsleep/data_core/enums/SystemStatusState;

    iget-object v2, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v2, Lld/H0;

    iget-object v0, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v0, Lcom/eightsleep/data_temperature/data/model/TemperatureBleCommand;

    if-eqz v0, :cond_4d

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v0, v1}, Lcom/eightsleep/data_temperature/data/model/TemperatureBleCommand;->toHardwareActionEvent(Lcom/eightsleep/data_core/enums/SystemStatusState;)LZa/q;

    move-result-object v0

    if-nez v0, :cond_4e

    :cond_4d
    invoke-virtual {v2, v1}, Lld/H0;->a(Lcom/eightsleep/data_core/enums/SystemStatusState;)LZa/q;

    move-result-object v0

    :cond_4e
    return-object v0

    :pswitch_e
    check-cast v1, Lkm/c;

    const-string v2, "area"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v2, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v2, Lkm/g;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v0, Lkm/m;

    if-eqz v0, :cond_50

    iget-object v0, v1, Lkm/c;->c:Lm0/e0;

    invoke-virtual {v0}, Lm0/e0;->k()F

    move-result v0

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_4f

    goto :goto_28

    :cond_4f
    const/4 v0, 0x0

    goto :goto_29

    :cond_50
    :goto_28
    const/4 v0, 0x1

    :goto_29
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_f
    check-cast v1, LJ0/e;

    const-string v2, "$this$drawScaledContent"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v2, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v2, LWf/i0;

    iget-object v0, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v0, LK0/c;

    invoke-virtual {v2, v1, v0}, LWf/i0;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, LHm/B;->a:LHm/B;

    return-object v0

    :pswitch_10
    check-cast v1, LLm/c;

    iget-object v2, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v2, Lkc/i;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-static {v2, v0, v1}, LP2/s;->A(Lkc/i;Ljava/util/List;LLm/c;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_11
    check-cast v1, LLm/c;

    iget-object v2, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v2, Lkc/d;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v0, Llc/d;

    invoke-static {v2, v0, v1}, LP2/r;->N(Lkc/d;Llc/d;LLm/c;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_12
    check-cast v1, LJ0/e;

    iget-object v2, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v2, Lj0/g3;

    invoke-virtual {v2}, Lj0/g3;->a()J

    move-result-wide v2

    iget-object v0, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v0, LH0/F;

    invoke-static {v1, v0, v2, v3}, LH0/F;->q(LJ0/e;LH0/F;J)V

    sget-object v0, LHm/B;->a:LHm/B;

    return-object v0

    :pswitch_13
    check-cast v1, LE0/e;

    iget-object v2, v1, LE0/e;->a:LE0/b;

    invoke-interface {v2}, LE0/b;->b()J

    move-result-wide v2

    iget-object v4, v1, LE0/e;->a:LE0/b;

    invoke-interface {v4}, LE0/b;->getLayoutDirection()Lw1/m;

    move-result-object v4

    iget-object v5, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v5, LH0/X;

    invoke-interface {v5, v2, v3, v4, v1}, LH0/X;->a(JLw1/m;Lw1/c;)LH0/F;

    move-result-object v2

    new-instance v3, Lhf/c;

    iget-object v0, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v0, Lj0/g3;

    const/16 v4, 0xa

    invoke-direct {v3, v4, v2, v0}, Lhf/c;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, LE0/d;

    const/4 v2, 0x0

    invoke-direct {v0, v2, v3}, LE0/d;-><init>(ILVm/k;)V

    invoke-virtual {v1, v0}, LE0/e;->a(LVm/k;)Lu5/d;

    move-result-object v0

    return-object v0

    :pswitch_14
    check-cast v1, LG0/e;

    iget-object v2, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v2, Lw/y0;

    iget-object v2, v2, Lw/y0;->j:Lm0/i0;

    invoke-virtual {v2}, Lm0/i0;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->floatValue()F

    move-result v2

    iget-wide v3, v1, LG0/e;->a:J

    const/16 v5, 0x20

    shr-long/2addr v3, v5

    long-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v3

    mul-float/2addr v3, v2

    iget-wide v6, v1, LG0/e;->a:J

    const-wide v8, 0xffffffffL

    and-long/2addr v6, v8

    long-to-int v1, v6

    invoke-static {v1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v1

    mul-float/2addr v1, v2

    iget-object v0, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v0, Lm0/Z;

    invoke-interface {v0}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, LG0/e;

    iget-wide v6, v2, LG0/e;->a:J

    shr-long/2addr v6, v5

    long-to-int v2, v6

    invoke-static {v2}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v2

    cmpg-float v2, v2, v3

    if-nez v2, :cond_51

    invoke-interface {v0}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, LG0/e;

    iget-wide v6, v2, LG0/e;->a:J

    and-long/2addr v6, v8

    long-to-int v2, v6

    invoke-static {v2}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v2

    cmpg-float v2, v2, v1

    if-nez v2, :cond_51

    goto :goto_2a

    :cond_51
    invoke-static {v3}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v2

    int-to-long v2, v2

    invoke-static {v1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v1

    int-to-long v6, v1

    shl-long v1, v2, v5

    and-long v3, v6, v8

    or-long/2addr v1, v3

    new-instance v3, LG0/e;

    invoke-direct {v3, v1, v2}, LG0/e;-><init>(J)V

    invoke-interface {v0, v3}, Lm0/Z;->setValue(Ljava/lang/Object;)V

    :goto_2a
    sget-object v0, LHm/B;->a:LHm/B;

    return-object v0

    :pswitch_15
    check-cast v1, LF0/B;

    new-instance v2, Lk0/E;

    iget-object v3, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v3, Lj0/F3;

    const/4 v4, 0x0

    invoke-direct {v2, v1, v3, v4}, Lk0/E;-><init>(LF0/B;Lj0/F3;LLm/c;)V

    const/4 v1, 0x3

    iget-object v0, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v0, Lwo/z;

    invoke-static {v0, v4, v4, v2, v1}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    sget-object v0, LHm/B;->a:LHm/B;

    return-object v0

    :pswitch_16
    check-cast v1, Landroidx/lifecycle/o;

    sget-object v2, Landroidx/lifecycle/o;->ON_RESUME:Landroidx/lifecycle/o;

    if-ne v1, v2, :cond_53

    iget-object v1, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v1, Lk0/Y;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iget-object v3, v1, Lk0/Y;->b:Lm0/i0;

    invoke-virtual {v3, v2}, Lm0/i0;->setValue(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityManager;->addAccessibilityStateChangeListener(Landroid/view/accessibility/AccessibilityManager$AccessibilityStateChangeListener;)Z

    iget-object v2, v1, Lk0/Y;->c:Lk0/X;

    if-eqz v2, :cond_52

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isTouchExplorationEnabled()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    iget-object v4, v2, Lk0/X;->a:Lm0/i0;

    invoke-virtual {v4, v3}, Lm0/i0;->setValue(Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Landroid/view/accessibility/AccessibilityManager;->addTouchExplorationStateChangeListener(Landroid/view/accessibility/AccessibilityManager$TouchExplorationStateChangeListener;)Z

    :cond_52
    iget-object v1, v1, Lk0/Y;->d:Lk0/W;

    if-eqz v1, :cond_53

    invoke-static {v0}, Lk0/Y;->c(Landroid/view/accessibility/AccessibilityManager;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iget-object v3, v1, Lk0/W;->a:Lm0/i0;

    invoke-virtual {v3, v2}, Lm0/i0;->setValue(Ljava/lang/Object;)V

    invoke-static {v0}, Lk0/Y;->f(Landroid/view/accessibility/AccessibilityManager;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iget-object v3, v1, Lk0/W;->b:Lm0/i0;

    invoke-virtual {v3, v2}, Lm0/i0;->setValue(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityManager;->addAccessibilityServicesStateChangeListener(Landroid/view/accessibility/AccessibilityManager$AccessibilityServicesStateChangeListener;)V

    :cond_53
    sget-object v0, LHm/B;->a:LHm/B;

    return-object v0

    :pswitch_17
    check-cast v1, LG/g1;

    new-instance v2, LG/M;

    iget-object v3, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v3, LG/g1;

    invoke-direct {v2, v3, v1}, LG/M;-><init>(LG/g1;LG/g1;)V

    iget-object v0, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v0, Lk0/a0;

    iget-object v0, v0, Lk0/a0;->a:Lm0/i0;

    invoke-virtual {v0, v2}, Lm0/i0;->setValue(Ljava/lang/Object;)V

    sget-object v0, LHm/B;->a:LHm/B;

    return-object v0

    :pswitch_18
    check-cast v1, Lh1/y;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v1, v2}, Lh1/w;->q(Lh1/y;F)V

    iget-object v2, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-static {v2, v1}, Lh1/w;->f(Ljava/lang/String;Lh1/y;)V

    new-instance v2, Lg8/Z0;

    iget-object v0, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v0, LVm/a;

    const/4 v3, 0x7

    invoke-direct {v2, v3, v0}, Lg8/Z0;-><init>(ILVm/a;)V

    const/4 v0, 0x0

    invoke-static {v1, v0, v2}, Lh1/w;->b(Lh1/y;Ljava/lang/String;LVm/a;)V

    sget-object v0, LHm/B;->a:LHm/B;

    return-object v0

    :pswitch_19
    check-cast v1, LH0/U;

    iget-object v2, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v2, Lj0/w2;

    iget-object v2, v2, Lj0/w2;->d:Lfe/d;

    iget-object v2, v2, Lfe/d;->j:Ljava/lang/Object;

    check-cast v2, Lm0/e0;

    invoke-virtual {v2}, Lm0/e0;->k()F

    move-result v2

    iget-wide v3, v1, LH0/U;->r:J

    const-wide v5, 0xffffffffL

    and-long/2addr v3, v5

    long-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v3

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v4

    if-nez v4, :cond_55

    invoke-static {v3}, Ljava/lang/Float;->isNaN(F)Z

    move-result v4

    if-nez v4, :cond_55

    const/4 v4, 0x0

    cmpg-float v4, v3, v4

    if-nez v4, :cond_54

    goto :goto_2b

    :cond_54
    iget-object v0, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v0, Lw/d;

    invoke-virtual {v0}, Lw/d;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    invoke-static {v1, v0}, Lj0/s1;->d(LH0/U;F)F

    move-result v4

    invoke-virtual {v1, v4}, LH0/U;->q(F)V

    invoke-static {v1, v0}, Lj0/s1;->e(LH0/U;F)F

    move-result v0

    invoke-virtual {v1, v0}, LH0/U;->r(F)V

    add-float/2addr v2, v3

    div-float/2addr v2, v3

    const/high16 v0, 0x3f000000    # 0.5f

    invoke-static {v0, v2}, LH0/F;->l(FF)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, LH0/U;->y(J)V

    :cond_55
    :goto_2b
    sget-object v0, LHm/B;->a:LHm/B;

    return-object v0

    :pswitch_1a
    check-cast v1, Ljava/util/List;

    new-instance v2, Lj0/w0;

    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    const/4 v4, 0x1

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    move-object v6, v5

    new-instance v5, Lan/k;

    const/4 v7, 0x2

    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    const-string v8, "null cannot be cast to non-null type kotlin.Int"

    invoke-static {v7, v8}, Lkotlin/jvm/internal/l;->h(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const/4 v9, 0x3

    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-static {v9, v8}, Lkotlin/jvm/internal/l;->h(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    invoke-direct {v5, v7, v9, v4}, Lan/i;-><init>(III)V

    const/4 v4, 0x4

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1, v8}, Lkotlin/jvm/internal/l;->h(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v4, v0, Lhf/c;->c:Ljava/lang/Object;

    move-object v7, v4

    check-cast v7, Lj0/l2;

    iget-object v0, v0, Lhf/c;->b:Ljava/lang/Object;

    move-object v8, v0

    check-cast v8, Ljava/util/Locale;

    move-object v4, v6

    move v6, v1

    invoke-direct/range {v2 .. v8}, Lj0/w0;-><init>(Ljava/lang/Long;Ljava/lang/Long;Lan/k;ILj0/l2;Ljava/util/Locale;)V

    return-object v2

    :pswitch_1b
    check-cast v1, LDg/J;

    if-eqz v1, :cond_56

    new-instance v2, Lig/a;

    iget-object v3, v1, LDg/J;->b:LG0/c;

    invoke-virtual {v3}, LG0/c;->d()J

    move-result-wide v4

    const/16 v6, 0x20

    shr-long/2addr v4, v6

    long-to-int v4, v4

    invoke-static {v4}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v4

    iget-object v5, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v5, Ly/B0;

    iget-object v5, v5, Ly/B0;->a:Lm0/f0;

    invoke-virtual {v5}, Lm0/f0;->k()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v4, v5

    iget v1, v1, LDg/J;->a:I

    iget v3, v3, LG0/c;->d:F

    invoke-direct {v2, v4, v3, v1}, Lig/a;-><init>(FFI)V

    goto :goto_2c

    :cond_56
    const/4 v2, 0x0

    :goto_2c
    iget-object v0, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v0, LVm/k;

    invoke-interface {v0, v2}, LVm/k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, LHm/B;->a:LHm/B;

    return-object v0

    :pswitch_1c
    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_57

    iget-object v0, v0, Lhf/c;->c:Ljava/lang/Object;

    check-cast v0, Lgf/a;

    iget-object v0, v0, Lgf/a;->b:LVm/a;

    if-eqz v0, :cond_58

    invoke-interface {v0}, LVm/a;->invoke()Ljava/lang/Object;

    goto :goto_2d

    :cond_57
    iget-object v0, v0, Lhf/c;->b:Ljava/lang/Object;

    check-cast v0, LVm/k;

    invoke-interface {v0, v1}, LVm/k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_58
    :goto_2d
    sget-object v0, LHm/B;->a:LHm/B;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
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
