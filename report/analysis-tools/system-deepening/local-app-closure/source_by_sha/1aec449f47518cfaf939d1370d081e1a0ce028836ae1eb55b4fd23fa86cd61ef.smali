.class final Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$startCountdown$1;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# annotations
.annotation runtime LNm/e;
    c = "com.eightsleep.presentation_home.viewmodel.NapModeActionBannerViewModel$startCountdown$1"
    f = "NapModeActionBannerViewModel.kt"
    l = {
        0x82
    }
    m = "invokeSuspend"
.end annotation

.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;->startCountdown(Ljava/time/Instant;Ljava/time/Instant;)V
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
.field final synthetic $endTime:Ljava/time/Instant;

.field final synthetic $timeRemainingMs:Lkotlin/jvm/internal/z;

.field final synthetic $totalDurationMs:J

.field label:I

.field final synthetic this$0:Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;


# direct methods
.method public constructor <init>(Lkotlin/jvm/internal/z;JLcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;Ljava/time/Instant;LLm/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/internal/z;",
            "J",
            "Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;",
            "Ljava/time/Instant;",
            "LLm/c<",
            "-",
            "Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$startCountdown$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$startCountdown$1;->$timeRemainingMs:Lkotlin/jvm/internal/z;

    iput-wide p2, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$startCountdown$1;->$totalDurationMs:J

    iput-object p4, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$startCountdown$1;->this$0:Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;

    iput-object p5, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$startCountdown$1;->$endTime:Ljava/time/Instant;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p6}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method

.method public static synthetic g(ZLkotlin/jvm/internal/z;IJLDf/l0;)LDf/l0;
    .locals 0

    invoke-static/range {p0 .. p5}, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$startCountdown$1;->invokeSuspend$lambda$0(ZLkotlin/jvm/internal/z;IJLDf/l0;)LDf/l0;

    move-result-object p0

    return-object p0
.end method

.method private static final invokeSuspend$lambda$0(ZLkotlin/jvm/internal/z;IJLDf/l0;)LDf/l0;
    .locals 8

    if-eqz p0, :cond_0

    sget p0, Lmo/b;->d:I

    iget-wide v0, p1, Lkotlin/jvm/internal/z;->a:J

    sget-object p0, Lmo/d;->MILLISECONDS:Lmo/d;

    invoke-static {v0, v1, p0}, LP2/G;->W(JLmo/d;)J

    move-result-wide v0

    sget-object p0, Lmo/d;->HOURS:Lmo/d;

    invoke-static {v0, v1, p0}, Lmo/b;->m(JLmo/d;)J

    invoke-static {v0, v1}, Lmo/b;->h(J)I

    move-result p0

    invoke-static {v0, v1}, Lmo/b;->j(J)I

    move-result v2

    invoke-static {v0, v1}, Lmo/b;->i(J)I

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x2

    invoke-static {v0, p0}, Llo/n;->u0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Llo/n;->u0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ":"

    invoke-static {p0, v1, v0}, Lj/m;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :goto_0
    move-object v1, p0

    goto :goto_1

    :cond_0
    sget p0, Lmo/b;->d:I

    iget-wide v0, p1, Lkotlin/jvm/internal/z;->a:J

    sget-object p0, Lmo/d;->MILLISECONDS:Lmo/d;

    invoke-static {v0, v1, p0}, LP2/G;->W(JLmo/d;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lbn/J;->R(J)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :goto_1
    iget-wide p0, p1, Lkotlin/jvm/internal/z;->a:J

    sub-long/2addr p3, p0

    sget-object p0, Lmo/d;->MILLISECONDS:Lmo/d;

    invoke-static {p3, p4, p0}, LP2/G;->W(JLmo/d;)J

    move-result-wide p0

    sget-object p3, Lmo/d;->MINUTES:Lmo/d;

    const-string p4, "unit"

    invoke-static {p3, p4}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0, p1, p3}, Lmo/b;->m(JLmo/d;)J

    move-result-wide v2

    const-wide/32 v4, -0x80000000

    const-wide/32 v6, 0x7fffffff

    invoke-static/range {v2 .. v7}, LP2/H;->E(JJJ)J

    move-result-wide p0

    long-to-int v5, p0

    iget-object v3, p5, LDf/l0;->c:LGa/s;

    const-string p0, "timeRemainingString"

    invoke-static {v1, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, LDf/l0;

    iget v4, p5, LDf/l0;->d:I

    move v2, p2

    invoke-direct/range {v0 .. v5}, LDf/l0;-><init>(Ljava/lang/String;ILGa/s;II)V

    return-object v0
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 7
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

    new-instance v0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$startCountdown$1;

    iget-object v1, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$startCountdown$1;->$timeRemainingMs:Lkotlin/jvm/internal/z;

    iget-wide v2, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$startCountdown$1;->$totalDurationMs:J

    iget-object v4, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$startCountdown$1;->this$0:Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;

    iget-object v5, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$startCountdown$1;->$endTime:Ljava/time/Instant;

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$startCountdown$1;-><init>(Lkotlin/jvm/internal/z;JLcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;Ljava/time/Instant;LLm/c;)V

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lwo/z;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$startCountdown$1;->invoke(Lwo/z;LLm/c;)Ljava/lang/Object;

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
    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$startCountdown$1;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$startCountdown$1;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$startCountdown$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$startCountdown$1;->label:I

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    if-ne v1, v2, :cond_0

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_3

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    :goto_0
    iget-object v5, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$startCountdown$1;->$timeRemainingMs:Lkotlin/jvm/internal/z;

    iget-wide v3, v5, Lkotlin/jvm/internal/z;->a:J

    const-wide/16 v6, 0x0

    cmp-long p1, v3, v6

    if-lez p1, :cond_5

    move-wide v9, v6

    iget-wide v7, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$startCountdown$1;->$totalDurationMs:J

    cmp-long p1, v7, v9

    const/4 v1, 0x0

    if-lez p1, :cond_2

    sub-long v9, v7, v3

    long-to-float p1, v9

    long-to-float v6, v7

    div-float/2addr p1, v6

    const/16 v6, 0x64

    int-to-float v6, v6

    mul-float/2addr p1, v6

    float-to-int p1, p1

    move v6, p1

    goto :goto_1

    :cond_2
    move v6, v1

    :goto_1
    const-wide/32 v9, 0x36ee80

    cmp-long p1, v3, v9

    if-gez p1, :cond_3

    move v4, v2

    goto :goto_2

    :cond_3
    move v4, v1

    :goto_2
    iget-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$startCountdown$1;->this$0:Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel;

    new-instance v3, Lcom/eightsleep/presentation_home/viewmodel/O;

    invoke-direct/range {v3 .. v8}, Lcom/eightsleep/presentation_home/viewmodel/O;-><init>(ZLkotlin/jvm/internal/z;IJ)V

    invoke-static {p1, v3, v2}, Landroid/support/v4/media/session/b;->I(LY7/o;LVm/k;I)V

    iput v2, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$startCountdown$1;->label:I

    const-wide/16 v3, 0x3e8

    invoke-static {v3, v4, p0}, Lwo/C;->n(JLLm/c;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_4

    return-object v0

    :cond_4
    :goto_3
    iget-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$startCountdown$1;->$timeRemainingMs:Lkotlin/jvm/internal/z;

    invoke-static {}, Ljava/time/Instant;->now()Ljava/time/Instant;

    move-result-object v1

    iget-object v3, p0, Lcom/eightsleep/presentation_home/viewmodel/NapModeActionBannerViewModel$startCountdown$1;->$endTime:Ljava/time/Instant;

    invoke-static {v1, v3}, Ljava/time/Duration;->between(Ljava/time/temporal/Temporal;Ljava/time/temporal/Temporal;)Ljava/time/Duration;

    move-result-object v1

    invoke-virtual {v1}, Ljava/time/Duration;->toMillis()J

    move-result-wide v3

    iput-wide v3, p1, Lkotlin/jvm/internal/z;->a:J

    goto :goto_0

    :cond_5
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0
.end method
