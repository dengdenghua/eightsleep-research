.class final Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# annotations
.annotation runtime LNm/e;
    c = "com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$deleteTrip$1$1"
    f = "JetLagPlanViewModel.kt"
    l = {
        0xf3,
        0xf5
    }
    m = "invokeSuspend"
.end annotation

.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
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
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0010\u0003\u001a\u00020\u00012\u000c\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00010\u0000H\n\u00a2\u0006\u0004\u0008\u0003\u0010\u0004"
    }
    d2 = {
        "Lya/j;",
        "LHm/B;",
        "it",
        "<anonymous>",
        "(Lya/j;)V"
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
            "Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method

.method private static final invokeSuspend$lambda$0(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;)LHm/B;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x3

    invoke-static {p0, v0, v0, v1}, Landroid/support/v4/media/session/b;->K(LY7/o;Lc8/e;LVm/k;I)V

    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0
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

    new-instance v0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1;

    iget-object p0, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;

    invoke-direct {v0, p0, p2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1;-><init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;LLm/c;)V

    iput-object p1, v0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1;->L$0:Ljava/lang/Object;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lya/j;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1;->invoke(Lya/j;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invoke(Lya/j;LLm/c;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lya/j;",
            "LLm/c<",
            "-",
            "LHm/B;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1;->label:I

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz v1, :cond_2

    if-eq v1, v4, :cond_1

    if-ne v1, v3, :cond_0

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_2

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1;->L$0:Ljava/lang/Object;

    check-cast p1, Lya/j;

    new-instance v1, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1$1;

    iget-object v5, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;

    invoke-direct {v1, v5, v2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1$1;-><init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;LLm/c;)V

    iput v4, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1;->label:I

    invoke-virtual {p1, p0, v1}, Lya/j;->d(LLm/c;LVm/n;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_3

    goto :goto_1

    :cond_3
    :goto_0
    check-cast p1, Lya/j;

    new-instance v1, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1$2;

    iget-object v4, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;

    invoke-direct {v1, v4, v2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1$2;-><init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;LLm/c;)V

    iput v3, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1;->label:I

    invoke-virtual {p1, p0, v1}, Lya/j;->c(LLm/c;LVm/n;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_4

    :goto_1
    return-object v0

    :cond_4
    :goto_2
    check-cast p1, Lya/j;

    iget-object p0, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of p1, p1, Lya/f;

    if-eqz p1, :cond_5

    invoke-static {p0}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1$1;->invokeSuspend$lambda$0(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;)LHm/B;

    :cond_5
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0
.end method
