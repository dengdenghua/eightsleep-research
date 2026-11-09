.class final Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$stopNap$1;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# annotations
.annotation runtime LNm/e;
    c = "com.eightsleep.presentation_home.viewmodel.NapModeActionBannerViewModel$stopNap$1"
    f = "NapModeActionBannerViewModel.kt"
    l = {
        0x8a,
        0x8a
    }
    m = "invokeSuspend"
.end annotation

.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;->stopNap()V
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

.field final synthetic this$0:Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;


# direct methods
.method public constructor <init>(Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;LLm/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;",
            "LLm/c<",
            "-",
            "Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$stopNap$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$stopNap$1;->this$0:Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;

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

    new-instance p1, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$stopNap$1;

    iget-object p0, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$stopNap$1;->this$0:Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;

    invoke-direct {p1, p0, p2}, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$stopNap$1;-><init>(Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;LLm/c;)V

    return-object p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lwo/z;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$stopNap$1;->invoke(Lwo/z;LLm/c;)Ljava/lang/Object;

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
    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$stopNap$1;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$stopNap$1;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$stopNap$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$stopNap$1;->label:I

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

    iget-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$stopNap$1;->this$0:Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;

    invoke-static {p1}, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;->access$getStopNapUseCase$p(Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;)Lmd/D;

    move-result-object p1

    iput v4, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$stopNap$1;->label:I

    check-cast p1, Lmd/I;

    iget-object v1, p1, Lmd/I;->a:LDa/b;

    iget-object v1, v1, LDa/b;->a:Lzo/M0;

    new-instance v4, Lmd/H;

    invoke-direct {v4, p1, v2}, Lmd/H;-><init>(Lmd/I;LLm/c;)V

    const/4 p1, 0x3

    invoke-static {v1, v2, v4, p1}, LP2/q;->u(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object p1

    if-ne p1, v0, :cond_3

    goto :goto_1

    :cond_3
    :goto_0
    check-cast p1, Lzo/l;

    new-instance v1, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$stopNap$1$1;

    iget-object v4, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$stopNap$1;->this$0:Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;

    invoke-direct {v1, v4, v2}, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$stopNap$1$1;-><init>(Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;LLm/c;)V

    iput v3, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$stopNap$1;->label:I

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
