.class final Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# annotations
.annotation runtime LNm/e;
    c = "com.eightsleep.presentation_metrics.viewmodel.HotFlashDetailsViewModel$1$1$1"
    f = "HotFlashDetailsViewModel.kt"
    l = {
        0x34,
        0x35,
        0x36
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
        "LVm/n;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0010\u0000\n\u0002\u0008\u0002\u0010\u0006\u001a\u0016\u0012\u0012\u0012\u0010\u0012\u000c\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u00040\u00000\u00032\u000c\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00010\u0000H\n\u00a2\u0006\u0004\u0008\u0006\u0010\u0007"
    }
    d2 = {
        "Lya/j;",
        "LHm/B;",
        "it",
        "Lzo/l;",
        "",
        "",
        "<anonymous>",
        "(Lya/j;)Lzo/l;"
    }
    k = 0x3
    mv = {
        0x2,
        0x0,
        0x0
    }
.end annotation


# instance fields
.field final synthetic $date:Ljava/time/LocalDate;

.field L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;


# direct methods
.method public constructor <init>(Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;Ljava/time/LocalDate;LLm/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;",
            "Ljava/time/LocalDate;",
            "LLm/c<",
            "-",
            "Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->this$0:Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;

    iput-object p2, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->$date:Ljava/time/LocalDate;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, LNm/i;-><init>(ILLm/c;)V

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

    new-instance p1, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;

    iget-object v0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->this$0:Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;

    iget-object p0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->$date:Ljava/time/LocalDate;

    invoke-direct {p1, v0, p0, p2}, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;-><init>(Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;Ljava/time/LocalDate;LLm/c;)V

    return-object p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lya/j;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->invoke(Lya/j;LLm/c;)Ljava/lang/Object;

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
            "Lzo/l;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->label:I

    const/4 v2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz v1, :cond_3

    if-eq v1, v4, :cond_2

    if-eq v1, v3, :cond_1

    if-ne v1, v2, :cond_0

    iget-object v0, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->L$2:Ljava/lang/Object;

    check-cast v0, Lzo/l;

    iget-object v1, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->L$1:Ljava/lang/Object;

    check-cast v1, Lzo/l;

    iget-object v2, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->L$0:Ljava/lang/Object;

    check-cast v2, Lya/d;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    move-object v9, v2

    move-object v2, v0

    move-object v0, v9

    move-object v9, p0

    goto/16 :goto_3

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    iget-object v1, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->L$1:Ljava/lang/Object;

    check-cast v1, Lzo/l;

    iget-object v3, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->L$0:Ljava/lang/Object;

    check-cast v3, Lya/d;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_1

    :cond_2
    iget-object v1, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->L$0:Ljava/lang/Object;

    check-cast v1, Lya/d;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_0

    :cond_3
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    sget-object v1, Lya/j;->a:Lya/d;

    iget-object p1, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->this$0:Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;

    invoke-static {p1}, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;->access$getGetAppUserUseCase$p(Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;)Lxd/i;

    move-result-object p1

    iput-object v1, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->L$0:Ljava/lang/Object;

    iput v4, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->label:I

    invoke-static {p1, p0}, Lkj/e;->O(Lxd/i;LLm/c;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_4

    goto :goto_2

    :cond_4
    :goto_0
    check-cast p1, Lzo/l;

    iget-object v4, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->this$0:Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;

    invoke-static {v4}, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;->access$getObserveTrendByDateUseCase$p(Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;)Luc/u0;

    move-result-object v4

    iget-object v5, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->$date:Ljava/time/LocalDate;

    iput-object v1, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->L$0:Ljava/lang/Object;

    iput-object p1, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->L$1:Ljava/lang/Object;

    iput v3, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->label:I

    check-cast v4, Luc/z0;

    invoke-virtual {v4, v5, p0}, Luc/z0;->a(Ljava/time/LocalDate;LNm/i;)LAo/n;

    move-result-object v3

    if-ne v3, v0, :cond_5

    goto :goto_2

    :cond_5
    move-object v11, v1

    move-object v1, p1

    move-object p1, v3

    move-object v3, v11

    :goto_1
    check-cast p1, Lzo/l;

    iget-object v4, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->this$0:Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;

    invoke-static {v4}, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;->access$getObserveMetricAggregatesByDatesUseCase$p(Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel;)Luc/p0;

    move-result-object v5

    iget-object v7, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->$date:Ljava/time/LocalDate;

    iput-object v3, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->L$0:Ljava/lang/Object;

    iput-object v1, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->L$1:Ljava/lang/Object;

    iput-object p1, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->L$2:Ljava/lang/Object;

    iput v2, p0, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->label:I

    const/4 v8, 0x0

    const/4 v10, 0x5

    const/4 v6, 0x0

    move-object v9, p0

    invoke-static/range {v5 .. v10}, LP2/b;->H(Luc/p0;Ljava/lang/String;Ljava/time/LocalDate;Lcom/eightsleep/data_metrics/enums/AggregateMetricPeriod;LNm/c;I)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_6

    :goto_2
    return-object v0

    :cond_6
    move-object v2, p1

    move-object v0, v3

    move-object p1, p0

    :goto_3
    move-object v3, p1

    check-cast v3, Lzo/l;

    new-instance v5, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1$1;

    iget-object p0, v9, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1;->$date:Ljava/time/LocalDate;

    invoke-direct {v5, p0}, Lcom/eightsleep/presentation_metrics/viewmodel/HotFlashDetailsViewModel$1$1$1$1;-><init>(Ljava/time/LocalDate;)V

    const/16 v6, 0x18

    const/4 v4, 0x0

    invoke-static/range {v0 .. v6}, Lya/d;->c(Lya/d;Lzo/l;Lzo/l;Lzo/l;LJh/b;LVm/o;I)Lzo/o0;

    move-result-object p0

    return-object p0
.end method
