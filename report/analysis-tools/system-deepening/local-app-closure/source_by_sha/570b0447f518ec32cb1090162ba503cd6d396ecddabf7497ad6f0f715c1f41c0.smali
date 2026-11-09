.class final Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$observeNapStatus$1$1$1;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# annotations
.annotation runtime LNm/e;
    c = "com.eightsleep.presentation_home.viewmodel.NapModeActionBannerViewModel$observeNapStatus$1$1$1"
    f = "NapModeActionBannerViewModel.kt"
    l = {}
    m = "invokeSuspend"
.end annotation

.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$observeNapStatus$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
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
        "\u0000\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0010\u0003\u001a\u00020\u00022\u0008\u0010\u0001\u001a\u0004\u0018\u00010\u0000H\n\u00a2\u0006\u0004\u0008\u0003\u0010\u0004"
    }
    d2 = {
        "Lkd/c;",
        "nap",
        "LHm/B;",
        "<anonymous>",
        "(Lkd/c;)V"
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
            "Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$observeNapStatus$1$1$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$observeNapStatus$1$1$1;->this$0:Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method

.method public static synthetic g(Ljava/time/Instant;Ljava/time/Instant;Lkd/c;LDf/l0;)LDf/l0;
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$observeNapStatus$1$1$1;->invokeSuspend$lambda$0(Ljava/time/Instant;Ljava/time/Instant;Lkd/c;LDf/l0;)LDf/l0;

    move-result-object p0

    return-object p0
.end method

.method private static final invokeSuspend$lambda$0(Ljava/time/Instant;Ljava/time/Instant;Lkd/c;LDf/l0;)LDf/l0;
    .locals 0

    invoke-static {p0, p1}, Ljava/time/Duration;->between(Ljava/time/temporal/Temporal;Ljava/time/temporal/Temporal;)Ljava/time/Duration;

    move-result-object p0

    invoke-virtual {p0}, Ljava/time/Duration;->toMinutes()J

    move-result-wide p0

    long-to-int p0, p0

    iget-boolean p1, p2, Lkd/c;->d:Z

    if-eqz p1, :cond_0

    iget-object p1, p2, Lkd/c;->b:LGa/s;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    new-instance p2, LDf/l0;

    const/16 p3, 0x13

    invoke-direct {p2, p1, p0, p3}, LDf/l0;-><init>(LGa/s;II)V

    return-object p2
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

    new-instance v0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$observeNapStatus$1$1$1;

    iget-object p0, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$observeNapStatus$1$1$1;->this$0:Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;

    invoke-direct {v0, p0, p2}, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$observeNapStatus$1$1$1;-><init>(Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;LLm/c;)V

    iput-object p1, v0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$observeNapStatus$1$1$1;->L$0:Ljava/lang/Object;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lkd/c;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$observeNapStatus$1$1$1;->invoke(Lkd/c;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invoke(Lkd/c;LLm/c;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkd/c;",
            "LLm/c<",
            "-",
            "LHm/B;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$observeNapStatus$1$1$1;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$observeNapStatus$1$1$1;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$observeNapStatus$1$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v0, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$observeNapStatus$1$1$1;->label:I

    if-nez v0, :cond_3

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$observeNapStatus$1$1$1;->L$0:Ljava/lang/Object;

    check-cast p1, Lkd/c;

    if-eqz p1, :cond_0

    iget-object v0, p1, Lkd/c;->a:LGa/s;

    iget-object v1, p1, Lkd/c;->b:LGa/s;

    iget-object v2, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$observeNapStatus$1$1$1;->this$0:Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;

    new-instance v3, Lcom/eightsleep/presentation_home/viewmodel/N;

    iget-object v0, v0, LGa/s;->a:Ljava/time/Instant;

    iget-object v1, v1, LGa/s;->a:Ljava/time/Instant;

    const/4 v4, 0x0

    invoke-direct {v3, v0, v1, p1, v4}, Lcom/eightsleep/presentation_home/viewmodel/N;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    const/4 p1, 0x1

    invoke-static {v2, v3, p1}, Landroid/support/v4/media/session/b;->I(LY7/o;LVm/k;I)V

    iget-object p0, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$observeNapStatus$1$1$1;->this$0:Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;

    invoke-static {p0, v0, v1}, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;->access$startCountdown(Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;Ljava/time/Instant;Ljava/time/Instant;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$observeNapStatus$1$1$1;->this$0:Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;

    invoke-static {p1}, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;->access$getCountdownJob$p(Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;)Lwo/h0;

    move-result-object p1

    if-eqz p1, :cond_1

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lwo/h0;->b(Ljava/util/concurrent/CancellationException;)V

    :cond_1
    iget-object p0, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$observeNapStatus$1$1$1;->this$0:Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;

    invoke-static {p0}, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;->access$getOnDismiss$p(Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;)LVm/a;

    move-result-object p0

    if-eqz p0, :cond_2

    invoke-interface {p0}, LVm/a;->invoke()Ljava/lang/Object;

    :cond_2
    :goto_0
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0

    :cond_3
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
