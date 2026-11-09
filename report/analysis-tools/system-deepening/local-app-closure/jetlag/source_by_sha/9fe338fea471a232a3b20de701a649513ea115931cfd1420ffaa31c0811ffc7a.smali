.class final Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$getPlanAndTasks$1$2$1;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# annotations
.annotation runtime LNm/e;
    c = "com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$getPlanAndTasks$1$2$1"
    f = "JetLagPlanViewModel.kt"
    l = {}
    m = "invokeSuspend"
.end annotation

.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$getPlanAndTasks$1$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
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
        "\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0010\u0005\u001a\u00020\u00042\u0012\u0010\u0003\u001a\u000e\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\u00020\u0000H\n\u00a2\u0006\u0004\u0008\u0005\u0010\u0006"
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
            "Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$getPlanAndTasks$1$2$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$getPlanAndTasks$1$2$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method

.method public static synthetic g(Lgc/c;Lgc/o;Lng/g;Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/util/List;Lng/e;)Lng/e;
    .locals 0

    invoke-static/range {p0 .. p5}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$getPlanAndTasks$1$2$1;->invokeSuspend$lambda$3(Lgc/c;Lgc/o;Lng/g;Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/util/List;Lng/e;)Lng/e;

    move-result-object p0

    return-object p0
.end method

.method private static final invokeSuspend$lambda$3(Lgc/c;Lgc/o;Lng/g;Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/util/List;Lng/e;)Lng/e;
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v7, p2

    move-object/from16 v2, p3

    iget-object v3, v0, Lgc/c;->a:Ljava/lang/String;

    iget-object v4, v1, Lgc/o;->b:Ljava/lang/String;

    iget-object v5, v1, Lgc/o;->d:Ljava/util/ArrayList;

    invoke-static {v5}, LIm/r;->Z0(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lgc/p;

    move-object v8, v4

    new-instance v4, Lng/a;

    new-instance v9, Lng/k;

    iget-object v10, v6, Lgc/p;->b:Lgc/q;

    sget-object v11, Lcom/eightsleep/presentation_jetlag/enums/TripLocationType;->ORIGIN:Lcom/eightsleep/presentation_jetlag/enums/TripLocationType;

    iget-object v12, v10, Lgc/q;->a:Ljava/lang/String;

    iget-object v13, v10, Lgc/q;->b:Ljava/lang/String;

    iget-object v10, v10, Lgc/q;->c:Ljava/time/ZoneOffset;

    invoke-direct {v9, v12, v13, v10, v11}, Lng/k;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/time/ZoneOffset;Lcom/eightsleep/presentation_jetlag/enums/TripLocationType;)V

    new-instance v10, Lng/o;

    invoke-static {v2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->access$getDisplaySettings$p(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;)LGa/f;

    move-result-object v11

    invoke-direct {v10, v11}, Lng/o;-><init>(LGa/f;)V

    iget-object v11, v6, Lgc/p;->b:Lgc/q;

    iget-object v6, v6, Lgc/p;->d:LGa/s;

    iget-object v11, v11, Lgc/q;->c:Ljava/time/ZoneOffset;

    invoke-virtual {v6, v11}, LGa/s;->n(Ljava/time/ZoneOffset;)LGa/s;

    move-result-object v6

    const/4 v11, 0x5

    const/4 v12, 0x0

    invoke-static {v10, v12, v6, v12, v11}, Lng/o;->a(Lng/o;Lng/n;LGa/s;LGa/s;I)Lng/o;

    move-result-object v6

    const/16 v10, 0x1c

    invoke-direct {v4, v9, v6, v12, v10}, Lng/a;-><init>(Lng/k;Lng/o;Lng/c;I)V

    invoke-static {v5}, LIm/r;->k1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lgc/p;

    move-object v9, v5

    new-instance v5, Lng/a;

    new-instance v11, Lng/k;

    iget-object v13, v6, Lgc/p;->c:Lgc/q;

    sget-object v14, Lcom/eightsleep/presentation_jetlag/enums/TripLocationType;->DESTINATION:Lcom/eightsleep/presentation_jetlag/enums/TripLocationType;

    iget-object v15, v13, Lgc/q;->a:Ljava/lang/String;

    iget-object v10, v13, Lgc/q;->b:Ljava/lang/String;

    iget-object v13, v13, Lgc/q;->c:Ljava/time/ZoneOffset;

    invoke-direct {v11, v15, v10, v13, v14}, Lng/k;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/time/ZoneOffset;Lcom/eightsleep/presentation_jetlag/enums/TripLocationType;)V

    new-instance v10, Lng/o;

    invoke-static {v2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->access$getDisplaySettings$p(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;)LGa/f;

    move-result-object v13

    invoke-direct {v10, v13}, Lng/o;-><init>(LGa/f;)V

    iget-object v13, v6, Lgc/p;->c:Lgc/q;

    iget-object v6, v6, Lgc/p;->e:LGa/s;

    iget-object v13, v13, Lgc/q;->c:Ljava/time/ZoneOffset;

    invoke-virtual {v6, v13}, LGa/s;->n(Ljava/time/ZoneOffset;)LGa/s;

    move-result-object v6

    const/4 v13, 0x3

    invoke-static {v10, v12, v12, v6, v13}, Lng/o;->a(Lng/o;Lng/n;LGa/s;LGa/s;I)Lng/o;

    move-result-object v6

    const/16 v10, 0x1c

    invoke-direct {v5, v11, v6, v12, v10}, Lng/a;-><init>(Lng/k;Lng/o;Lng/c;I)V

    if-eqz v7, :cond_0

    iget-object v6, v7, Lng/g;->d:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    if-nez v6, :cond_1

    :cond_0
    sget-object v6, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;->PRE_FLIGHT:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    :cond_1
    sget-object v10, Ljava/time/temporal/ChronoUnit;->DAYS:Ljava/time/temporal/ChronoUnit;

    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object v11

    iget-object v0, v0, Lgc/c;->h:Ljava/time/LocalDate;

    invoke-virtual {v10, v11, v0}, Ljava/time/temporal/ChronoUnit;->between(Ljava/time/temporal/Temporal;Ljava/time/temporal/Temporal;)J

    move-result-wide v10

    long-to-int v10, v10

    invoke-static {v9}, LIm/r;->Z0(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgc/p;

    iget-object v0, v0, Lgc/p;->d:LGa/s;

    iget-object v0, v0, LGa/s;->a:Ljava/time/Instant;

    invoke-static {v0}, LYa/d;->f(Ljava/time/Instant;)Ljava/time/LocalDateTime;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->access$formatTimeUntilDeparture(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/time/LocalDateTime;)Ljava/lang/String;

    move-result-object v11

    iget-object v0, v1, Lgc/o;->g:Lgc/n;

    if-eqz v0, :cond_2

    iget v0, v0, Lgc/n;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    :cond_2
    invoke-static {v2, v12}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->access$formatTimezoneOffset(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v13

    iget-object v0, v1, Lgc/o;->i:Ljava/lang/String;

    const/4 v12, 0x0

    move-object v1, v3

    const/4 v3, 0x0

    const/16 v14, 0x804

    move-object/from16 v9, p4

    move-object v2, v8

    move-object v8, v6

    move-object v6, v0

    move-object/from16 v0, p5

    invoke-static/range {v0 .. v14}, Lng/e;->u(Lng/e;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/presentation_jetlag/enums/PlanScheduleType;Lng/a;Lng/a;Ljava/lang/String;Lng/g;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;Ljava/util/List;ILjava/lang/String;LGa/s;Ljava/lang/String;I)Lng/e;

    move-result-object v0

    return-object v0
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

    new-instance v0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$getPlanAndTasks$1$2$1;

    iget-object p0, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$getPlanAndTasks$1$2$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;

    invoke-direct {v0, p0, p2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$getPlanAndTasks$1$2$1;-><init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;LLm/c;)V

    iput-object p1, v0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$getPlanAndTasks$1$2$1;->L$0:Ljava/lang/Object;

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
    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$getPlanAndTasks$1$2$1;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$getPlanAndTasks$1$2$1;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$getPlanAndTasks$1$2$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, LHm/k;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$getPlanAndTasks$1$2$1;->invoke(LHm/k;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v0, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$getPlanAndTasks$1$2$1;->label:I

    if-nez v0, :cond_2

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$getPlanAndTasks$1$2$1;->L$0:Ljava/lang/Object;

    check-cast p1, LHm/k;

    iget-object v0, p1, LHm/k;->a:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lgc/o;

    iget-object p1, p1, LHm/k;->b:Ljava/lang/Object;

    move-object v2, p1

    check-cast v2, Lgc/c;

    iget-object p1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$getPlanAndTasks$1$2$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;

    invoke-static {p1, v3, v2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->access$mapPlanToUiModel(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Lgc/o;Lgc/c;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lng/g;

    iget-boolean v1, v1, Lng/g;->b:Z

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    move-object v4, v0

    check-cast v4, Lng/g;

    iget-object v5, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$getPlanAndTasks$1$2$1;->this$0:Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;

    new-instance v1, Lcom/eightsleep/presentation_jetlag/viewmodel/e;

    invoke-direct/range {v1 .. v6}, Lcom/eightsleep/presentation_jetlag/viewmodel/e;-><init>(Lgc/c;Lgc/o;Lng/g;Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/util/List;)V

    const/4 p0, 0x1

    invoke-static {v5, v1, p0}, Landroid/support/v4/media/session/b;->I(LY7/o;LVm/k;I)V

    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0

    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
