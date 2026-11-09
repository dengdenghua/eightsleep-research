.class final Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$pollTimeAtDestination$1;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# annotations
.annotation runtime LNm/e;
    c = "com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$pollTimeAtDestination$1"
    f = "JetLagPlanViewModel.kt"
    l = {
        0x20c
    }
    m = "invokeSuspend"
.end annotation

.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->pollTimeAtDestination(Lgc/o;)V
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
.field final synthetic $trip:Lgc/o;

.field private synthetic L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;


# direct methods
.method public constructor <init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Lgc/o;LLm/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;",
            "Lgc/o;",
            "LLm/c<",
            "-",
            "Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$pollTimeAtDestination$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$pollTimeAtDestination$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;

    iput-object p2, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$pollTimeAtDestination$1;->$trip:Lgc/o;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method

.method public static synthetic g(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Lgc/o;Lng/e;)Lng/e;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$pollTimeAtDestination$1;->invokeSuspend$lambda$0(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Lgc/o;Lng/e;)Lng/e;

    move-result-object p0

    return-object p0
.end method

.method private static final invokeSuspend$lambda$0(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Lgc/o;Lng/e;)Lng/e;
    .locals 16

    move-object/from16 v0, p1

    iget-object v0, v0, Lgc/o;->d:Ljava/util/ArrayList;

    invoke-static {v0}, LIm/r;->k1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgc/p;

    iget-object v0, v0, Lgc/p;->c:Lgc/q;

    move-object/from16 v1, p0

    invoke-static {v1, v0}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->access$calculateTimeAtDestination(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Lgc/q;)LGa/s;

    move-result-object v13

    const/4 v12, 0x0

    const/4 v14, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/16 v15, 0x17ff

    move-object/from16 v1, p2

    invoke-static/range {v1 .. v15}, Lng/e;->u(Lng/e;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/presentation_jetlag/enums/PlanScheduleType;Lng/a;Lng/a;Ljava/lang/String;Lng/g;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;Ljava/util/List;ILjava/lang/String;LGa/s;Ljava/lang/String;I)Lng/e;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 2
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

    new-instance v0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$pollTimeAtDestination$1;

    iget-object v1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$pollTimeAtDestination$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;

    iget-object p0, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$pollTimeAtDestination$1;->$trip:Lgc/o;

    invoke-direct {v0, v1, p0, p2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$pollTimeAtDestination$1;-><init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Lgc/o;LLm/c;)V

    iput-object p1, v0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$pollTimeAtDestination$1;->L$0:Ljava/lang/Object;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lwo/z;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$pollTimeAtDestination$1;->invoke(Lwo/z;LLm/c;)Ljava/lang/Object;

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
    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$pollTimeAtDestination$1;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$pollTimeAtDestination$1;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$pollTimeAtDestination$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$pollTimeAtDestination$1;->label:I

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$pollTimeAtDestination$1;->L$0:Ljava/lang/Object;

    check-cast v1, Lwo/z;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$pollTimeAtDestination$1;->L$0:Ljava/lang/Object;

    check-cast p1, Lwo/z;

    move-object v1, p1

    :cond_2
    :goto_0
    invoke-static {v1}, Lwo/C;->A(Lwo/z;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$pollTimeAtDestination$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;

    iget-object v3, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$pollTimeAtDestination$1;->$trip:Lgc/o;

    new-instance v4, Lcom/eightsleep/presentation_jetlag/viewmodel/f;

    const/4 v5, 0x0

    invoke-direct {v4, v5, p1, v3}, Lcom/eightsleep/presentation_jetlag/viewmodel/f;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-static {p1, v4, v2}, Landroid/support/v4/media/session/b;->I(LY7/o;LVm/k;I)V

    iput-object v1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$pollTimeAtDestination$1;->L$0:Ljava/lang/Object;

    iput v2, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$pollTimeAtDestination$1;->label:I

    const-wide/16 v3, 0x3a98

    invoke-static {v3, v4, p0}, Lwo/C;->n(JLLm/c;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_2

    return-object v0

    :cond_3
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0
.end method
