.class public final Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$invokeSuspend$$inlined$flatMapLatest$1;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/o;


# annotations
.annotation runtime LNm/e;
    c = "com.eightsleep.presentation_metrics.viewmodel.HotFlashDetailsViewModel$1$invokeSuspend$$inlined$flatMapLatest$1"
    f = "HotFlashDetailsViewModel.kt"
    l = {
        0xc0,
        0xbd
    }
    m = "invokeSuspend"
.end annotation

.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "LNm/i;",
        "LVm/o;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0005\u001a\u00020\u0004\"\u0004\u0008\u0000\u0010\u0000\"\u0004\u0008\u0001\u0010\u0001*\u0008\u0012\u0004\u0012\u00028\u00000\u00022\u0006\u0010\u0003\u001a\u00028\u0001H\n"
    }
    d2 = {
        "R",
        "T",
        "Lzo/m;",
        "it",
        "LHm/B;",
        "<anonymous>"
    }
    k = 0x3
    mv = {
        0x2,
        0x0,
        0x0
    }
.end annotation


# instance fields
.field private synthetic L$0:Ljava/lang/Object;

.field synthetic L$1:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;


# direct methods
.method public constructor <init>(LLm/c;Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;)V
    .locals 0

    iput-object p2, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$invokeSuspend$$inlined$flatMapLatest$1;->this$0:Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;

    const/4 p2, 0x3

    invoke-direct {p0, p2, p1}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lzo/m;

    check-cast p3, LLm/c;

    invoke-virtual {p0, p1, p2, p3}, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$invokeSuspend$$inlined$flatMapLatest$1;->invoke(Lzo/m;Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invoke(Lzo/m;Ljava/lang/Object;LLm/c;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lzo/m;",
            "Ljava/time/LocalDate;",
            "LLm/c<",
            "-",
            "LHm/B;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 2
    new-instance v0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$invokeSuspend$$inlined$flatMapLatest$1;

    iget-object p0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$invokeSuspend$$inlined$flatMapLatest$1;->this$0:Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;

    invoke-direct {v0, p3, p0}, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$invokeSuspend$$inlined$flatMapLatest$1;-><init>(LLm/c;Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;)V

    iput-object p1, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$invokeSuspend$$inlined$flatMapLatest$1;->L$0:Ljava/lang/Object;

    iput-object p2, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$invokeSuspend$$inlined$flatMapLatest$1;->L$1:Ljava/lang/Object;

    sget-object p0, LHm/B;->a:LHm/B;

    invoke-virtual {v0, p0}, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$invokeSuspend$$inlined$flatMapLatest$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$invokeSuspend$$inlined$flatMapLatest$1;->label:I

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
    iget-object v1, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$invokeSuspend$$inlined$flatMapLatest$1;->L$1:Ljava/lang/Object;

    check-cast v1, Ljava/time/LocalDate;

    iget-object v4, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$invokeSuspend$$inlined$flatMapLatest$1;->L$0:Ljava/lang/Object;

    check-cast v4, Lzo/m;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$invokeSuspend$$inlined$flatMapLatest$1;->L$0:Ljava/lang/Object;

    check-cast p1, Lzo/m;

    iget-object v1, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$invokeSuspend$$inlined$flatMapLatest$1;->L$1:Ljava/lang/Object;

    check-cast v1, Ljava/time/LocalDate;

    iget-object v5, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$invokeSuspend$$inlined$flatMapLatest$1;->this$0:Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;

    invoke-static {v5, v1}, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;->access$setSelectedDate$p(Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;Ljava/time/LocalDate;)V

    iget-object v5, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$invokeSuspend$$inlined$flatMapLatest$1;->this$0:Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;

    invoke-static {v5}, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;->access$getSmartFetchMetricAggregatesUseCase$p(Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;)Luc/f1;

    move-result-object v5

    iput-object p1, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$invokeSuspend$$inlined$flatMapLatest$1;->L$0:Ljava/lang/Object;

    iput-object v1, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$invokeSuspend$$inlined$flatMapLatest$1;->L$1:Ljava/lang/Object;

    iput v4, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$invokeSuspend$$inlined$flatMapLatest$1;->label:I

    const/16 v4, 0xe

    invoke-static {v5, v1, v2, v2, v4}, LP2/c;->y(Luc/f1;Ljava/time/LocalDate;Ljava/util/List;Ljava/util/List;I)LAo/n;

    move-result-object v4

    if-ne v4, v0, :cond_3

    goto :goto_1

    :cond_3
    move-object v7, v4

    move-object v4, p1

    move-object p1, v7

    :goto_0
    check-cast p1, Lzo/l;

    new-instance v5, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;

    iget-object v6, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$invokeSuspend$$inlined$flatMapLatest$1;->this$0:Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;

    invoke-direct {v5, v6, v1, v2}, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;-><init>(Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;Ljava/time/LocalDate;LLm/c;)V

    invoke-static {p1, v5}, Lzo/s;->y(Lzo/l;LVm/n;)LJ8/e;

    move-result-object p1

    iput-object v2, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$invokeSuspend$$inlined$flatMapLatest$1;->L$0:Ljava/lang/Object;

    iput-object v2, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$invokeSuspend$$inlined$flatMapLatest$1;->L$1:Ljava/lang/Object;

    iput v3, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$invokeSuspend$$inlined$flatMapLatest$1;->label:I

    invoke-static {v4, p1, p0}, Lzo/s;->r(Lzo/m;Lzo/l;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_4

    :goto_1
    return-object v0

    :cond_4
    :goto_2
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0
.end method
