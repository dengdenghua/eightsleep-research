.class final Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1$1;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# annotations
.annotation runtime LNm/e;
    c = "com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$deleteTrip$1$1$1"
    f = "JetLagPlanViewModel.kt"
    l = {}
    m = "invokeSuspend"
.end annotation

.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
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
        "\u0000\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0010\u0002\u001a\u00020\u00002\u0006\u0010\u0001\u001a\u00020\u0000H\n\u00a2\u0006\u0004\u0008\u0002\u0010\u0003"
    }
    d2 = {
        "LHm/B;",
        "it",
        "<anonymous>",
        "(V)V"
    }
    k = 0x3
    mv = {
        0x2,
        0x0,
        0x0
    }
.end annotation


# instance fields
.field label:I

.field final synthetic this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;


# direct methods
.method public constructor <init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;LLm/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;",
            "LLm/c<",
            "-",
            "Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 0
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

    new-instance p1, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1$1;

    iget-object p0, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;

    invoke-direct {p1, p0, p2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1$1;-><init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;LLm/c;)V

    return-object p1
.end method

.method public final invoke(LHm/B;LLm/c;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LHm/B;",
            "LLm/c<",
            "-",
            "LHm/B;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1$1;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1$1;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, LHm/B;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1$1;->invoke(LHm/B;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v0, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1$1;->label:I

    if-nez v0, :cond_0

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p0, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;

    new-instance p1, Lcom/eightsleep/corepresentation/navigation/route/Route$HomeGraph;

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p1, v1, v0, v1}, Lcom/eightsleep/corepresentation/navigation/route/Route$HomeGraph;-><init>(Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    const/4 v0, 0x0

    const/4 v2, 0x2

    invoke-static {p0, p1, v0, v2, v1}, LL8/e;->goTo$default(LL8/e;Lcom/eightsleep/corepresentation/navigation/route/NavRoute;ZILjava/lang/Object;)V

    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
