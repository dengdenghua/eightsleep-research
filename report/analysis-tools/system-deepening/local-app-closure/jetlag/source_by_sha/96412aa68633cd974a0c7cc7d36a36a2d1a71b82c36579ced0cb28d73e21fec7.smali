.class final Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# annotations
.annotation runtime LNm/e;
    c = "com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1"
    f = "JetLagTripViewModel.kt"
    l = {
        0x414,
        0x416,
        0x41b
    }
    m = "invokeSuspend"
.end annotation

.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;->createTripAndJetLagPlan(Lng/k;Ljava/util/List;Z)V
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
.field final synthetic $destinations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lng/a;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $includeSupplements:Z

.field final synthetic $origin:Lng/k;

.field label:I

.field final synthetic this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;


# direct methods
.method public constructor <init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;Lng/k;Ljava/util/List;ZLLm/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;",
            "Lng/k;",
            "Ljava/util/List<",
            "Lng/a;",
            ">;Z",
            "LLm/c<",
            "-",
            "Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;

    iput-object p2, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;->$origin:Lng/k;

    iput-object p3, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;->$destinations:Ljava/util/List;

    iput-boolean p4, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;->$includeSupplements:Z

    const/4 p1, 0x2

    invoke-direct {p0, p1, p5}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 6
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

    new-instance v0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;

    iget-object v1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;

    iget-object v2, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;->$origin:Lng/k;

    iget-object v3, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;->$destinations:Ljava/util/List;

    iget-boolean v4, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;->$includeSupplements:Z

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;-><init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;Lng/k;Ljava/util/List;ZLLm/c;)V

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lwo/z;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;->invoke(Lwo/z;LLm/c;)Ljava/lang/Object;

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
    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 18

    move-object/from16 v0, p0

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, v0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;->label:I

    const/4 v3, 0x3

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x1

    if-eqz v2, :cond_3

    if-eq v2, v6, :cond_2

    if-eq v2, v5, :cond_1

    if-ne v2, v3, :cond_0

    invoke-static/range {p1 .. p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto/16 :goto_8

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    invoke-static/range {p1 .. p1}, LX4/x;->M(Ljava/lang/Object;)V

    move-object/from16 v2, p1

    move v5, v3

    goto/16 :goto_6

    :cond_2
    invoke-static/range {p1 .. p1}, LX4/x;->M(Ljava/lang/Object;)V

    move-object/from16 v2, p1

    goto/16 :goto_5

    :cond_3
    invoke-static/range {p1 .. p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object v2, v0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;

    invoke-static {v2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;->access$getCreateTripUseCase$p(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;)Lhc/f;

    move-result-object v2

    iget-object v7, v0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;->$origin:Lng/k;

    iget-object v8, v0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;->$destinations:Ljava/util/List;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v9, "destinations"

    invoke-static {v8, v9}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_6

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lng/a;

    new-instance v11, Lgc/p;

    new-instance v13, Lgc/q;

    iget-object v12, v7, Lng/k;->b:Ljava/lang/String;

    iget-object v14, v7, Lng/k;->a:Ljava/lang/String;

    iget-object v7, v7, Lng/k;->c:Ljava/time/ZoneOffset;

    invoke-direct {v13, v14, v12, v7}, Lgc/q;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/time/ZoneOffset;)V

    iget-object v12, v10, Lng/a;->a:Lng/k;

    new-instance v14, Lgc/q;

    iget-object v15, v12, Lng/k;->b:Ljava/lang/String;

    iget-object v3, v12, Lng/k;->c:Ljava/time/ZoneOffset;

    iget-object v12, v12, Lng/k;->a:Ljava/lang/String;

    invoke-direct {v14, v12, v15, v3}, Lgc/q;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/time/ZoneOffset;)V

    invoke-virtual {v10}, Lng/a;->b()Z

    move-result v3

    iget-object v12, v10, Lng/a;->b:Lng/o;

    if-eqz v3, :cond_4

    iget-object v3, v12, Lng/o;->b:LGa/s;

    invoke-virtual {v3, v7}, LGa/s;->n(Ljava/time/ZoneOffset;)LGa/s;

    move-result-object v3

    :goto_1
    move-object v15, v3

    goto :goto_2

    :cond_4
    iget-object v3, v12, Lng/o;->b:LGa/s;

    goto :goto_1

    :goto_2
    invoke-virtual {v10}, Lng/a;->b()Z

    move-result v3

    iget-object v7, v10, Lng/a;->a:Lng/k;

    if-eqz v3, :cond_5

    iget-object v3, v12, Lng/o;->c:LGa/s;

    iget-object v10, v7, Lng/k;->c:Ljava/time/ZoneOffset;

    invoke-virtual {v3, v10}, LGa/s;->n(Ljava/time/ZoneOffset;)LGa/s;

    move-result-object v3

    :goto_3
    move-object/from16 v16, v3

    goto :goto_4

    :cond_5
    iget-object v3, v12, Lng/o;->c:LGa/s;

    goto :goto_3

    :goto_4
    const/16 v17, 0x0

    const-string v12, ""

    invoke-direct/range {v11 .. v17}, Lgc/p;-><init>(Ljava/lang/String;Lgc/q;Lgc/q;LGa/s;LGa/s;Ljava/lang/String;)V

    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v3, 0x3

    goto :goto_0

    :cond_6
    iput v6, v0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;->label:I

    check-cast v2, Lhc/j;

    invoke-virtual {v2, v9, v0}, Lhc/j;->a(Ljava/util/ArrayList;LNm/c;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v1, :cond_7

    goto :goto_7

    :cond_7
    :goto_5
    check-cast v2, Lzo/l;

    new-instance v3, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1$1;

    iget-object v6, v0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;

    iget-boolean v7, v0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;->$includeSupplements:Z

    invoke-direct {v3, v6, v7, v4}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1$1;-><init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;ZLLm/c;)V

    iput v5, v0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;->label:I

    const/4 v5, 0x3

    invoke-static {v2, v4, v3, v5}, LP2/q;->u(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object v2

    if-ne v2, v1, :cond_8

    goto :goto_7

    :cond_8
    :goto_6
    check-cast v2, Lzo/l;

    new-instance v3, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1$2;

    iget-object v6, v0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;

    invoke-direct {v3, v6, v4}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1$2;-><init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;LLm/c;)V

    iput v5, v0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;->label:I

    invoke-static {v2, v3, v0}, Lzo/s;->m(Lzo/l;LVm/n;LLm/c;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v1, :cond_9

    :goto_7
    return-object v1

    :cond_9
    :goto_8
    sget-object v0, LHm/B;->a:LHm/B;

    return-object v0
.end method
