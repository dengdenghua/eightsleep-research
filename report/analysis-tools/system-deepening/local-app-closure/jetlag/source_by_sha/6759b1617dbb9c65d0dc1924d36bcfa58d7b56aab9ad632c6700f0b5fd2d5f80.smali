.class final Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# annotations
.annotation runtime LNm/e;
    c = "com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$onTaskCompletionToggled$1"
    f = "JetLagPlanViewModel.kt"
    l = {
        0x105,
        0x10f
    }
    m = "invokeSuspend"
.end annotation

.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->onTaskCompletionToggled(Ljava/lang/String;Ljava/util/List;ZLjava/lang/Integer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "LNm/i;",
        "LVm/n;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n\u00a2\u0006\u0004\u0008\u0002\u0010\u0003"
    }
    d2 = {
        "Lwo/z;",
        "LHm/B;",
        "<anonymous>",
        "(Lwo/z;)V"
    }
    k = 0x3
    mv = {
        0x2,
        0x0,
        0x0
    }
.end annotation


# instance fields
.field final synthetic $isComplete:Z

.field final synthetic $planId:Ljava/lang/String;

.field final synthetic $supplementCount:Ljava/lang/Integer;

.field final synthetic $tasks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lng/h;",
            ">;"
        }
    .end annotation
.end field

.field label:I

.field final synthetic this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;


# direct methods
.method public constructor <init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/lang/String;Ljava/util/List;ZLjava/lang/Integer;LLm/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lng/h;",
            ">;Z",
            "Ljava/lang/Integer;",
            "LLm/c<",
            "-",
            "Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;

    iput-object p2, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;->$planId:Ljava/lang/String;

    iput-object p3, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;->$tasks:Ljava/util/List;

    iput-boolean p4, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;->$isComplete:Z

    iput-object p5, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;->$supplementCount:Ljava/lang/Integer;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p6}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 7
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

    new-instance v0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;

    iget-object v1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;

    iget-object v2, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;->$planId:Ljava/lang/String;

    iget-object v3, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;->$tasks:Ljava/util/List;

    iget-boolean v4, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;->$isComplete:Z

    iget-object v5, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;->$supplementCount:Ljava/lang/Integer;

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;-><init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/lang/String;Ljava/util/List;ZLjava/lang/Integer;LLm/c;)V

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lwo/z;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;->invoke(Lwo/z;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invoke(Lwo/z;LLm/c;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lwo/z;",
            "LLm/c<",
            "-",
            "LHm/B;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 16

    move-object/from16 v5, p0

    sget-object v6, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v0, v5, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;->label:I

    const/4 v7, 0x2

    const/4 v1, 0x1

    const/4 v8, 0x0

    if-eqz v0, :cond_2

    if-eq v0, v1, :cond_1

    if-ne v0, v7, :cond_0

    invoke-static/range {p1 .. p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto/16 :goto_6

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    invoke-static/range {p1 .. p1}, LX4/x;->M(Ljava/lang/Object;)V

    move-object/from16 v0, p1

    goto/16 :goto_4

    :cond_2
    invoke-static/range {p1 .. p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object v0, v5, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;

    invoke-static {v0}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->access$getToggleJetLagTaskCompletionUseCase$p(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;)Lhc/S;

    move-result-object v0

    iget-object v2, v5, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;->$planId:Ljava/lang/String;

    iget-object v3, v5, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;->$tasks:Ljava/util/List;

    iget-boolean v4, v5, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;->$isComplete:Z

    iget-object v9, v5, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;->$supplementCount:Ljava/lang/Integer;

    move-object v10, v2

    new-instance v2, Ljava/util/ArrayList;

    const/16 v11, 0xa

    invoke-static {v3, v11}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v11

    invoke-direct {v2, v11}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lng/h;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v12, Ltimber/log/Timber;->a:Lbr/a;

    iget-object v13, v11, Lng/h;->j:Lng/m;

    if-eqz v13, :cond_3

    iget v13, v13, Lng/m;->a:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    goto :goto_1

    :cond_3
    move-object v13, v8

    :goto_1
    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "Mapping supplements in JetLagTaskUiModel toUpdate: type: "

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v15, v11, Lng/h;->f:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v7, " num taken "

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v13, 0x0

    new-array v13, v13, [Ljava/lang/Object;

    invoke-virtual {v12, v7, v13}, Lbr/a;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v7, Lgc/f;

    if-eqz v4, :cond_4

    sget-object v12, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;->COMPLETE:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    goto :goto_2

    :cond_4
    sget-object v12, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;->PENDING:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    :goto_2
    new-instance v13, Lgc/d;

    sget-object v14, Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;->SUPPLEMENT:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    if-ne v15, v14, :cond_5

    move-object v14, v9

    goto :goto_3

    :cond_5
    move-object v14, v8

    :goto_3
    invoke-direct {v13, v14, v8}, Lgc/d;-><init>(Ljava/lang/Integer;Ljava/lang/String;)V

    iget-object v11, v11, Lng/h;->a:Ljava/lang/String;

    invoke-direct {v7, v11, v15, v12, v13}, Lgc/f;-><init>(Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;Lgc/d;)V

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v7, 0x2

    goto :goto_0

    :cond_6
    iget-boolean v3, v5, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;->$isComplete:Z

    iget-object v4, v5, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;->$supplementCount:Ljava/lang/Integer;

    iput v1, v5, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;->label:I

    check-cast v0, Lhc/V;

    move-object v1, v10

    invoke-virtual/range {v0 .. v5}, Lhc/V;->a(Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/Integer;LNm/c;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v6, :cond_7

    goto :goto_5

    :cond_7
    :goto_4
    check-cast v0, Lzo/l;

    new-instance v1, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1$2;

    iget-object v2, v5, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;

    invoke-direct {v1, v2, v8}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1$2;-><init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;LLm/c;)V

    const/4 v2, 0x2

    iput v2, v5, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;->label:I

    invoke-static {v0, v1, v5}, Lzo/s;->m(Lzo/l;LVm/n;LLm/c;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v6, :cond_8

    :goto_5
    return-object v6

    :cond_8
    :goto_6
    sget-object v0, LHm/B;->a:LHm/B;

    return-object v0
.end method
