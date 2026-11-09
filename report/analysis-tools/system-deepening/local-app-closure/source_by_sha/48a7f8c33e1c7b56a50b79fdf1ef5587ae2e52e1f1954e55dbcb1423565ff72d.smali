.class public final Lmd/C;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmd/y;


# instance fields
.field public final a:Lu5/e;

.field public final b:Lxd/p;

.field public final c:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;


# direct methods
.method public constructor <init>(Lu5/e;Lxd/p;Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;)V
    .locals 1

    const-string v0, "napModeRepository"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmd/C;->a:Lu5/e;

    iput-object p2, p0, Lmd/C;->b:Lxd/p;

    iput-object p3, p0, Lmd/C;->c:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;

    return-void
.end method


# virtual methods
.method public final a(LGa/b;LGa/b;IIZLjava/lang/String;LNm/c;)Ljava/lang/Object;
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p6

    move-object/from16 v2, p7

    instance-of v3, v2, Lmd/z;

    if-eqz v3, :cond_0

    move-object v3, v2

    check-cast v3, Lmd/z;

    iget v4, v3, Lmd/z;->k:I

    const/high16 v5, -0x80000000

    and-int v6, v4, v5

    if-eqz v6, :cond_0

    sub-int/2addr v4, v5

    iput v4, v3, Lmd/z;->k:I

    goto :goto_0

    :cond_0
    new-instance v3, Lmd/z;

    invoke-direct {v3, v0, v2}, Lmd/z;-><init>(Lmd/C;LNm/c;)V

    :goto_0
    iget-object v2, v3, Lmd/z;->i:Ljava/lang/Object;

    sget-object v4, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v5, v3, Lmd/z;->k:I

    const/4 v6, 0x3

    const/4 v7, 0x2

    const/4 v8, 0x1

    if-eqz v5, :cond_4

    if-eq v5, v8, :cond_3

    if-eq v5, v7, :cond_2

    if-ne v5, v6, :cond_1

    invoke-static {v2}, LX4/x;->M(Ljava/lang/Object;)V

    return-object v2

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    iget-boolean v0, v3, Lmd/z;->h:Z

    iget v1, v3, Lmd/z;->g:I

    iget v5, v3, Lmd/z;->f:I

    iget-object v7, v3, Lmd/z;->e:Lzo/l;

    check-cast v7, Lzo/l;

    iget-object v8, v3, Lmd/z;->d:Lya/d;

    iget-object v9, v3, Lmd/z;->c:LGa/b;

    iget-object v10, v3, Lmd/z;->b:LGa/b;

    iget-object v11, v3, Lmd/z;->a:Lmd/C;

    invoke-static {v2}, LX4/x;->M(Ljava/lang/Object;)V

    goto/16 :goto_3

    :cond_3
    iget-boolean v0, v3, Lmd/z;->h:Z

    iget v1, v3, Lmd/z;->g:I

    iget v5, v3, Lmd/z;->f:I

    iget-object v8, v3, Lmd/z;->d:Lya/d;

    iget-object v9, v3, Lmd/z;->c:LGa/b;

    iget-object v10, v3, Lmd/z;->b:LGa/b;

    iget-object v11, v3, Lmd/z;->a:Lmd/C;

    invoke-static {v2}, LX4/x;->M(Ljava/lang/Object;)V

    goto/16 :goto_1

    :cond_4
    invoke-static {v2}, LX4/x;->M(Ljava/lang/Object;)V

    sget-object v2, Lya/j;->a:Lya/d;

    if-eqz v1, :cond_5

    new-instance v5, Lya/g;

    invoke-direct {v5, v1}, Lya/g;-><init>(Ljava/lang/Object;)V

    new-instance v1, LJ8/e;

    const/16 v8, 0x9

    invoke-direct {v1, v5, v8}, LJ8/e;-><init>(Ljava/lang/Object;I)V

    move-object/from16 v10, p1

    move-object/from16 v9, p2

    move/from16 v5, p3

    move-object v11, v0

    move-object v8, v2

    move/from16 v0, p5

    move-object v2, v1

    move/from16 v1, p4

    goto :goto_2

    :cond_5
    iput-object v0, v3, Lmd/z;->a:Lmd/C;

    move-object/from16 v1, p1

    iput-object v1, v3, Lmd/z;->b:LGa/b;

    move-object/from16 v5, p2

    iput-object v5, v3, Lmd/z;->c:LGa/b;

    iput-object v2, v3, Lmd/z;->d:Lya/d;

    move/from16 v9, p3

    iput v9, v3, Lmd/z;->f:I

    move/from16 v10, p4

    iput v10, v3, Lmd/z;->g:I

    move/from16 v11, p5

    iput-boolean v11, v3, Lmd/z;->h:Z

    iput v8, v3, Lmd/z;->k:I

    iget-object v8, v0, Lmd/C;->a:Lu5/e;

    invoke-virtual {v8, v3}, Lu5/e;->C(LNm/c;)Ljava/lang/Object;

    move-result-object v8

    if-ne v8, v4, :cond_6

    goto/16 :goto_4

    :cond_6
    move v15, v11

    move-object v11, v0

    move v0, v15

    move v15, v10

    move-object v10, v1

    move v1, v15

    move-object v15, v8

    move-object v8, v2

    move-object v2, v15

    move v15, v9

    move-object v9, v5

    move v5, v15

    :goto_1
    check-cast v2, Lzo/l;

    :goto_2
    iget-object v12, v11, Lmd/C;->b:Lxd/p;

    iput-object v11, v3, Lmd/z;->a:Lmd/C;

    iput-object v10, v3, Lmd/z;->b:LGa/b;

    iput-object v9, v3, Lmd/z;->c:LGa/b;

    iput-object v8, v3, Lmd/z;->d:Lya/d;

    move-object v13, v2

    check-cast v13, Lzo/l;

    iput-object v13, v3, Lmd/z;->e:Lzo/l;

    iput v5, v3, Lmd/z;->f:I

    iput v1, v3, Lmd/z;->g:I

    iput-boolean v0, v3, Lmd/z;->h:Z

    iput v7, v3, Lmd/z;->k:I

    invoke-virtual {v12, v3}, Lxd/p;->a(LNm/c;)Ljava/lang/Object;

    move-result-object v7

    if-ne v7, v4, :cond_7

    goto :goto_4

    :cond_7
    move-object v15, v7

    move-object v7, v2

    move-object v2, v15

    :goto_3
    check-cast v2, Lzo/l;

    new-instance v12, Lmd/f;

    const/4 v13, 0x4

    invoke-direct {v12, v13}, Lmd/f;-><init>(I)V

    const/16 v13, 0xc

    const/4 v14, 0x0

    move-object/from16 p2, v2

    move-object/from16 p1, v7

    move-object/from16 p0, v8

    move-object/from16 p4, v12

    move/from16 p5, v13

    move-object/from16 p3, v14

    invoke-static/range {p0 .. p5}, Lya/d;->b(Lya/d;Lzo/l;Lzo/l;Lcom/eightsleep/presentation_onboarding/viewmodel/h;LVm/n;I)LGc/h;

    move-result-object v2

    new-instance v7, Lmd/B;

    const/4 v8, 0x0

    move/from16 p6, v0

    move/from16 p5, v1

    move/from16 p4, v5

    move-object/from16 p0, v7

    move-object/from16 p7, v8

    move-object/from16 p3, v9

    move-object/from16 p2, v10

    move-object/from16 p1, v11

    invoke-direct/range {p0 .. p7}, Lmd/B;-><init>(Lmd/C;LGa/b;LGa/b;IIZLLm/c;)V

    move-object/from16 v0, p0

    const/4 v1, 0x0

    iput-object v1, v3, Lmd/z;->a:Lmd/C;

    iput-object v1, v3, Lmd/z;->b:LGa/b;

    iput-object v1, v3, Lmd/z;->c:LGa/b;

    iput-object v1, v3, Lmd/z;->d:Lya/d;

    iput-object v1, v3, Lmd/z;->e:Lzo/l;

    iput v6, v3, Lmd/z;->k:I

    invoke-static {v2, v1, v0, v6}, LP2/q;->u(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object v0

    if-ne v0, v4, :cond_8

    :goto_4
    return-object v4

    :cond_8
    return-object v0
.end method
