.class public final Lhc/q;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public synthetic a:Ljava/lang/Object;

.field public final synthetic b:LGa/f;


# direct methods
.method public constructor <init>(LGa/f;LLm/c;)V
    .locals 0

    iput-object p1, p0, Lhc/q;->b:LGa/f;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 1

    new-instance v0, Lhc/q;

    iget-object p0, p0, Lhc/q;->b:LGa/f;

    invoke-direct {v0, p0, p2}, Lhc/q;-><init>(LGa/f;LLm/c;)V

    iput-object p1, v0, Lhc/q;->a:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lgc/i;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lhc/q;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lhc/q;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lhc/q;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 22

    move-object/from16 v0, p0

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    invoke-static/range {p1 .. p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object v1, v0, Lhc/q;->a:Ljava/lang/Object;

    check-cast v1, Lgc/i;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, v0, Lhc/q;->b:LGa/f;

    const-string v0, "displaySettings"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v3, Ljava/util/ArrayList;

    iget-object v0, v1, Lgc/i;->a:Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {v0, v1}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v3, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lgc/h;

    iget-object v5, v4, Lgc/h;->k:Ljava/lang/String;

    const-string v6, ". Defaulting to UTC."

    iget-object v7, v4, Lgc/h;->f:Ljava/lang/String;

    new-instance v13, LGa/s;

    iget-object v8, v2, LGa/f;->d:Lcom/eightsleep/data_core/enums/ClockSystem;

    iget-object v0, v4, Lgc/h;->e:Ljava/time/Instant;

    invoke-direct {v13, v0, v8}, LGa/s;-><init>(Ljava/time/Instant;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    const/4 v9, 0x0

    :try_start_0
    invoke-static {v7}, Ljava/time/ZoneOffset;->of(Ljava/lang/String;)Ljava/time/ZoneOffset;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    move-object v14, v0

    goto :goto_2

    :catch_0
    move-exception v0

    sget-object v10, Ltimber/log/Timber;->a:Lbr/a;

    const-string v11, "Error parsing departure timezone offset: "

    invoke-static {v11, v7, v6}, LB/h;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    new-array v11, v9, [Ljava/lang/Object;

    invoke-virtual {v10, v7, v0, v11}, Lbr/a;->c(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    sget-object v0, Ljava/time/ZoneOffset;->UTC:Ljava/time/ZoneOffset;

    goto :goto_1

    :goto_2
    invoke-static {v14}, Lkotlin/jvm/internal/l;->g(Ljava/lang/Object;)V

    new-instance v7, LGa/s;

    iget-object v0, v4, Lgc/h;->j:Ljava/time/Instant;

    invoke-direct {v7, v0, v8}, LGa/s;-><init>(Ljava/time/Instant;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    :try_start_1
    invoke-static {v5}, Ljava/time/ZoneOffset;->of(Ljava/lang/String;)Ljava/time/ZoneOffset;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :goto_3
    move-object/from16 v19, v0

    goto :goto_4

    :catch_1
    move-exception v0

    sget-object v8, Ltimber/log/Timber;->a:Lbr/a;

    const-string v10, "Error parsing arrival timezone offset: "

    invoke-static {v10, v5, v6}, LB/h;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    new-array v6, v9, [Ljava/lang/Object;

    invoke-virtual {v8, v5, v0, v6}, Lbr/a;->c(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    sget-object v0, Ljava/time/ZoneOffset;->UTC:Ljava/time/ZoneOffset;

    goto :goto_3

    :goto_4
    invoke-static/range {v19 .. v19}, Lkotlin/jvm/internal/l;->g(Ljava/lang/Object;)V

    new-instance v8, Lgc/a;

    iget-object v0, v4, Lgc/h;->l:Ljava/lang/String;

    iget-object v5, v4, Lgc/h;->m:Ljava/lang/String;

    iget-object v9, v4, Lgc/h;->a:Ljava/lang/String;

    iget-object v10, v4, Lgc/h;->b:Ljava/lang/String;

    iget-object v11, v4, Lgc/h;->c:Ljava/lang/String;

    iget-object v12, v4, Lgc/h;->d:Ljava/lang/String;

    iget-object v15, v4, Lgc/h;->g:Ljava/lang/String;

    iget-object v6, v4, Lgc/h;->h:Ljava/lang/String;

    iget-object v4, v4, Lgc/h;->i:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v17, v4

    move-object/from16 v21, v5

    move-object/from16 v16, v6

    move-object/from16 v18, v7

    invoke-direct/range {v8 .. v21}, Lgc/a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;LGa/s;Ljava/time/ZoneOffset;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;LGa/s;Ljava/time/ZoneOffset;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    new-instance v0, Lgc/b;

    invoke-direct {v0, v3}, Lgc/b;-><init>(Ljava/util/ArrayList;)V

    return-object v0
.end method
