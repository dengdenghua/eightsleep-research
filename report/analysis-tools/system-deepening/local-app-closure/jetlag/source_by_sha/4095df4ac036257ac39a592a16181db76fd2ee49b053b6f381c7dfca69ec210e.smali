.class final Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1$1;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# annotations
.annotation runtime LNm/e;
    c = "com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1$1"
    f = "JetLagTripViewModel.kt"
    l = {
        0x417
    }
    m = "invokeSuspend"
.end annotation

.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
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
        "\u0000\u0016\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0010\u0005\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00040\u00030\u00022\u0006\u0010\u0001\u001a\u00020\u0000H\n\u00a2\u0006\u0004\u0008\u0005\u0010\u0006"
    }
    d2 = {
        "Lgc/o;",
        "it",
        "Lzo/l;",
        "Lya/j;",
        "Lgc/c;",
        "<anonymous>",
        "(Lgc/o;)Lzo/l;"
    }
    k = 0x3
    mv = {
        0x2,
        0x0,
        0x0
    }
.end annotation


# instance fields
.field final synthetic $includeSupplements:Z

.field synthetic L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;


# direct methods
.method public constructor <init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;ZLLm/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;",
            "Z",
            "LLm/c<",
            "-",
            "Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;

    iput-boolean p2, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1$1;->$includeSupplements:Z

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, LNm/i;-><init>(ILLm/c;)V

    return-void
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

    new-instance v0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1$1;

    iget-object v1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;

    iget-boolean p0, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1$1;->$includeSupplements:Z

    invoke-direct {v0, v1, p0, p2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1$1;-><init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;ZLLm/c;)V

    iput-object p1, v0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1$1;->L$0:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Lgc/o;LLm/c;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgc/o;",
            "LLm/c<",
            "-",
            "Lzo/l;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1$1;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1$1;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, Lgc/o;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1$1;->invoke(Lgc/o;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1$1;->label:I

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    if-ne v1, v2, :cond_0

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    return-object p1

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1$1;->L$0:Ljava/lang/Object;

    check-cast p1, Lgc/o;

    iget-object v1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;

    invoke-static {v1}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;->access$getCreateJetLagPlanUseCase$p(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;)Lhc/a;

    move-result-object v1

    iget-object p1, p1, Lgc/o;->b:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1$1;->$includeSupplements:Z

    iput v2, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$createTripAndJetLagPlan$1$1;->label:I

    check-cast v1, Lhc/e;

    invoke-virtual {v1, p0, p1, v3}, Lhc/e;->a(LNm/c;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_2

    return-object v0

    :cond_2
    return-object p0
.end method
