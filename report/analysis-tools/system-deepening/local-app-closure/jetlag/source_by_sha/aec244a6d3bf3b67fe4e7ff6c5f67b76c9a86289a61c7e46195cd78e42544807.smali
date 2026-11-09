.class final Lcom/eightsleep/presentation_home/viewmodel/SettingsMainMenuViewModel$getJetLagTrips$1$1$1;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# annotations
.annotation runtime LNm/e;
    c = "com.eightsleep.presentation_home.viewmodel.SettingsMainMenuViewModel$getJetLagTrips$1$1$1"
    f = "SettingsMainMenuViewModel.kt"
    l = {}
    m = "invokeSuspend"
.end annotation

.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/eightsleep/presentation_home/viewmodel/SettingsMainMenuViewModel$getJetLagTrips$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
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
        "\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0010\u0005\u001a\u00020\u00042\u0016\u0010\u0003\u001a\u0012\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0000H\n\u00a2\u0006\u0004\u0008\u0005\u0010\u0006"
    }
    d2 = {
        "LHm/k;",
        "Lgc/o;",
        "Lgc/c;",
        "<destruct>",
        "LHm/B;",
        "<anonymous>",
        "(LHm/k;)V"
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

.field final synthetic this$0:Lcom/eightsleep/presentation_home/viewmodel/SettingsMainMenuViewModel;


# direct methods
.method public constructor <init>(Lcom/eightsleep/presentation_home/viewmodel/SettingsMainMenuViewModel;LLm/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/eightsleep/presentation_home/viewmodel/SettingsMainMenuViewModel;",
            "LLm/c<",
            "-",
            "Lcom/eightsleep/presentation_home/viewmodel/SettingsMainMenuViewModel$getJetLagTrips$1$1$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/SettingsMainMenuViewModel$getJetLagTrips$1$1$1;->this$0:Lcom/eightsleep/presentation_home/viewmodel/SettingsMainMenuViewModel;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method

.method public static synthetic g(Lgc/o;Lgc/c;LDf/R0;)LDf/R0;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/eightsleep/presentation_home/viewmodel/SettingsMainMenuViewModel$getJetLagTrips$1$1$1;->invokeSuspend$lambda$0(Lgc/o;Lgc/c;LDf/R0;)LDf/R0;

    move-result-object p0

    return-object p0
.end method

.method private static final invokeSuspend$lambda$0(Lgc/o;Lgc/c;LDf/R0;)LDf/R0;
    .locals 13

    iget-object v0, p2, LDf/R0;->i:LDf/Z0;

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lgc/c;->a()Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    move-result-object p1

    goto :goto_0

    :cond_0
    move-object p1, v1

    :goto_0
    if-eqz p0, :cond_4

    new-instance v2, Lng/d;

    iget-object v3, p0, Lgc/o;->d:Ljava/util/ArrayList;

    invoke-static {v3}, LIm/r;->k1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lgc/p;

    iget-object v4, v4, Lgc/p;->c:Lgc/q;

    invoke-static {v3}, LIm/r;->b1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lgc/p;

    if-eqz v3, :cond_1

    iget-object v3, v3, Lgc/p;->d:LGa/s;

    if-eqz v3, :cond_1

    sget-object v1, Ljava/time/temporal/ChronoUnit;->HOURS:Ljava/time/temporal/ChronoUnit;

    invoke-static {}, Ljava/time/Instant;->now()Ljava/time/Instant;

    move-result-object v5

    iget-object v3, v3, LGa/s;->a:Ljava/time/Instant;

    invoke-virtual {v1, v5, v3}, Ljava/time/temporal/ChronoUnit;->between(Ljava/time/temporal/Temporal;Ljava/time/temporal/Temporal;)J

    move-result-wide v5

    long-to-int v1, v5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :cond_1
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_1
    if-nez p1, :cond_3

    sget-object p1, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;->UNKNOWN:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    :cond_3
    iget-object p0, p0, Lgc/o;->b:Ljava/lang/String;

    iget-object v3, v4, Lgc/q;->a:Ljava/lang/String;

    invoke-direct {v2, p0, v3, v1, p1}, Lng/d;-><init>(Ljava/lang/String;Ljava/lang/String;ILcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;)V

    move-object v1, v2

    :cond_4
    iget-object p0, v0, LDf/Z0;->a:Lng/f;

    iget-boolean p1, p0, Lng/f;->a:Z

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lng/f;

    invoke-direct {p0, p1, v1}, Lng/f;-><init>(ZLng/d;)V

    new-instance v10, LDf/Z0;

    invoke-direct {v10, p0}, LDf/Z0;-><init>(Lng/f;)V

    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/16 v12, 0x2ff

    move-object v2, p2

    invoke-static/range {v2 .. v12}, LDf/R0;->u(LDf/R0;ZLjava/util/List;Ljava/lang/String;ZZLcom/eightsleep/data_user/enums/ReferralPromotion;ZLDf/Z0;LC8/J;I)LDf/R0;

    move-result-object p0

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

    new-instance v0, Lcom/eightsleep/presentation_home/viewmodel/SettingsMainMenuViewModel$getJetLagTrips$1$1$1;

    iget-object p0, p0, Lcom/eightsleep/presentation_home/viewmodel/SettingsMainMenuViewModel$getJetLagTrips$1$1$1;->this$0:Lcom/eightsleep/presentation_home/viewmodel/SettingsMainMenuViewModel;

    invoke-direct {v0, p0, p2}, Lcom/eightsleep/presentation_home/viewmodel/SettingsMainMenuViewModel$getJetLagTrips$1$1$1;-><init>(Lcom/eightsleep/presentation_home/viewmodel/SettingsMainMenuViewModel;LLm/c;)V

    iput-object p1, v0, Lcom/eightsleep/presentation_home/viewmodel/SettingsMainMenuViewModel$getJetLagTrips$1$1$1;->L$0:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(LHm/k;LLm/c;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LHm/k;",
            "LLm/c<",
            "-",
            "LHm/B;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_home/viewmodel/SettingsMainMenuViewModel$getJetLagTrips$1$1$1;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lcom/eightsleep/presentation_home/viewmodel/SettingsMainMenuViewModel$getJetLagTrips$1$1$1;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lcom/eightsleep/presentation_home/viewmodel/SettingsMainMenuViewModel$getJetLagTrips$1$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, LHm/k;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_home/viewmodel/SettingsMainMenuViewModel$getJetLagTrips$1$1$1;->invoke(LHm/k;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v0, p0, Lcom/eightsleep/presentation_home/viewmodel/SettingsMainMenuViewModel$getJetLagTrips$1$1$1;->label:I

    if-nez v0, :cond_0

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/SettingsMainMenuViewModel$getJetLagTrips$1$1$1;->L$0:Ljava/lang/Object;

    check-cast p1, LHm/k;

    iget-object v0, p1, LHm/k;->a:Ljava/lang/Object;

    check-cast v0, Lgc/o;

    iget-object p1, p1, LHm/k;->b:Ljava/lang/Object;

    check-cast p1, Lgc/c;

    iget-object p0, p0, Lcom/eightsleep/presentation_home/viewmodel/SettingsMainMenuViewModel$getJetLagTrips$1$1$1;->this$0:Lcom/eightsleep/presentation_home/viewmodel/SettingsMainMenuViewModel;

    new-instance v1, Lcom/eightsleep/presentation_home/viewmodel/o;

    const/16 v2, 0x9

    invoke-direct {v1, v2, v0, p1}, Lcom/eightsleep/presentation_home/viewmodel/o;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    const/4 p1, 0x1

    invoke-static {p0, v1, p1}, Landroid/support/v4/media/session/b;->I(LY7/o;LVm/k;I)V

    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
