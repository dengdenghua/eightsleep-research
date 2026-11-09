.class final Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$onNotificationsEnabled$1;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# annotations
.annotation runtime LNm/e;
    c = "com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$onNotificationsEnabled$1"
    f = "JetLagTripViewModel.kt"
    l = {
        0x1c6,
        0x1ce
    }
    m = "invokeSuspend"
.end annotation

.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;->onNotificationsEnabled()V
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
.field label:I

.field final synthetic this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;


# direct methods
.method public constructor <init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;LLm/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;",
            "LLm/c<",
            "-",
            "Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$onNotificationsEnabled$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$onNotificationsEnabled$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;

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

    new-instance p1, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$onNotificationsEnabled$1;

    iget-object p0, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$onNotificationsEnabled$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;

    invoke-direct {p1, p0, p2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$onNotificationsEnabled$1;-><init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;LLm/c;)V

    return-object p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lwo/z;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$onNotificationsEnabled$1;->invoke(Lwo/z;LLm/c;)Ljava/lang/Object;

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
    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$onNotificationsEnabled$1;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$onNotificationsEnabled$1;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$onNotificationsEnabled$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 14

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$onNotificationsEnabled$1;->label:I

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eqz v1, :cond_2

    if-eq v1, v3, :cond_1

    if-ne v1, v2, :cond_0

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

    iget-object p1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$onNotificationsEnabled$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;

    invoke-static {p1}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;->access$getUpdateAppUserUseCase$p(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;)Lxd/h0;

    move-result-object p1

    new-instance v4, Lyd/U;

    new-instance v9, Lyd/e;

    invoke-direct {v9, v3, v3, v3}, Lyd/e;-><init>(ZZZ)V

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v10, 0x0

    const/16 v13, 0x1df

    invoke-direct/range {v4 .. v13}, Lyd/U;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/time/LocalDate;Lcom/eightsleep/data_core/enums/Gender;Lyd/e;LGa/f;Lcom/eightsleep/data_core/enums/TemperatureSetting;Lcom/eightsleep/data_core/enums/TemperatureSetting;I)V

    iput v3, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$onNotificationsEnabled$1;->label:I

    check-cast p1, Lxd/k0;

    invoke-virtual {p1, v4, p0}, Lxd/k0;->a(Lyd/U;LNm/c;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_3

    goto :goto_1

    :cond_3
    :goto_0
    check-cast p1, Lzo/l;

    new-instance v1, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$onNotificationsEnabled$1$1;

    iget-object v3, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$onNotificationsEnabled$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;

    const/4 v4, 0x0

    invoke-direct {v1, v3, v4}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$onNotificationsEnabled$1$1;-><init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;LLm/c;)V

    iput v2, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel$onNotificationsEnabled$1;->label:I

    invoke-static {p1, v1, p0}, Lzo/s;->m(Lzo/l;LVm/n;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_4

    :goto_1
    return-object v0

    :cond_4
    :goto_2
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0
.end method
