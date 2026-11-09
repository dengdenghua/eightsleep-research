.class final Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$3;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# annotations
.annotation runtime LNm/e;
    c = "com.eightsleep.presentation_metrics.viewmodel.HotFlashDetailsViewModel$1$3"
    f = "HotFlashDetailsViewModel.kt"
    l = {}
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
        "LVm/n;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0010 \n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0010\u0004\u001a\u00020\u00032\u000e\u0010\u0002\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0000H\n\u00a2\u0006\u0004\u0008\u0004\u0010\u0005"
    }
    d2 = {
        "",
        "",
        "result",
        "LHm/B;",
        "<anonymous>",
        "(Ljava/util/List;)V"
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

.field final synthetic this$0:Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;


# direct methods
.method public constructor <init>(Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;LLm/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;",
            "LLm/c<",
            "-",
            "Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$3;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$3;->this$0:Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, LNm/i;-><init>(ILLm/c;)V

    return-void
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

    new-instance v0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$3;

    iget-object p0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$3;->this$0:Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;

    invoke-direct {v0, p0, p2}, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$3;-><init>(Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;LLm/c;)V

    iput-object p1, v0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$3;->L$0:Ljava/lang/Object;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/util/List;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$3;->invoke(Ljava/util/List;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invoke(Ljava/util/List;LLm/c;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Ljava/lang/Object;",
            ">;",
            "LLm/c<",
            "-",
            "LHm/B;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$3;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$3;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$3;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$3;->label:I

    if-nez v0, :cond_0

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$3;->L$0:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    iget-object p0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$3;->this$0:Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type java.time.LocalDate"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/l;->h(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/time/LocalDate;

    const/4 v1, 0x2

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;

    const/4 v2, 0x3

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "null cannot be cast to non-null type kotlin.collections.List<com.eightsleep.data_metrics.domain.model.AggregatePeriod>"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/l;->h(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Ljava/util/List;

    invoke-static {v2}, LIm/r;->b1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;

    const/4 v3, 0x1

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    const-string v3, "null cannot be cast to non-null type com.eightsleep.data_user.domain.model.User"

    invoke-static {p1, v3}, Lkotlin/jvm/internal/l;->h(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lyd/S;

    iget-object p1, p1, Lyd/S;->o:LGa/f;

    invoke-static {p0, v0, v1, v2, p1}, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;->access$updateContent(Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;Ljava/time/LocalDate;Lcom/eightsleep/data_metrics/domain/model/DailyTrends;Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;LGa/f;)V

    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
