.class public final Lhc/a0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhc/W;


# instance fields
.field public final a:Lxd/p;

.field public final b:Lu5/e;

.field public final c:Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;


# direct methods
.method public constructor <init>(Lxd/p;Lu5/e;Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhc/a0;->a:Lxd/p;

    iput-object p2, p0, Lhc/a0;->b:Lu5/e;

    iput-object p3, p0, Lhc/a0;->c:Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/TripStatus;LNm/c;)Ljava/lang/Object;
    .locals 22

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    instance-of v2, v1, Lhc/X;

    if-eqz v2, :cond_0

    move-object v2, v1

    check-cast v2, Lhc/X;

    iget v3, v2, Lhc/X;->j:I

    const/high16 v4, -0x80000000

    and-int v5, v3, v4

    if-eqz v5, :cond_0

    sub-int/2addr v3, v4

    iput v3, v2, Lhc/X;->j:I

    goto :goto_0

    :cond_0
    new-instance v2, Lhc/X;

    invoke-direct {v2, v0, v1}, Lhc/X;-><init>(Lhc/a0;LNm/c;)V

    :goto_0
    iget-object v1, v2, Lhc/X;->h:Ljava/lang/Object;

    sget-object v3, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v4, v2, Lhc/X;->j:I

    const/4 v5, 0x3

    const/4 v6, 0x0

    const/4 v7, 0x2

    const/4 v8, 0x1

    if-eqz v4, :cond_4

    if-eq v4, v8, :cond_3

    if-eq v4, v7, :cond_2

    if-ne v4, v5, :cond_1

    invoke-static {v1}, LX4/x;->M(Ljava/lang/Object;)V

    return-object v1

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    iget-object v0, v2, Lhc/X;->g:Lzo/l;

    check-cast v0, Lzo/l;

    iget-object v4, v2, Lhc/X;->f:Lya/d;

    iget-object v7, v2, Lhc/X;->e:Ljava/util/List;

    iget-object v8, v2, Lhc/X;->d:Ljava/lang/String;

    iget-object v9, v2, Lhc/X;->c:Lcom/eightsleep/data_jetlag/enums/TripStatus;

    iget-object v10, v2, Lhc/X;->b:Ljava/lang/String;

    iget-object v11, v2, Lhc/X;->a:Lhc/a0;

    invoke-static {v1}, LX4/x;->M(Ljava/lang/Object;)V

    move-object v13, v0

    move-object v12, v4

    move-object/from16 v19, v7

    move-object/from16 v18, v8

    goto/16 :goto_2

    :cond_3
    iget-object v0, v2, Lhc/X;->f:Lya/d;

    iget-object v4, v2, Lhc/X;->e:Ljava/util/List;

    iget-object v8, v2, Lhc/X;->d:Ljava/lang/String;

    iget-object v9, v2, Lhc/X;->c:Lcom/eightsleep/data_jetlag/enums/TripStatus;

    iget-object v10, v2, Lhc/X;->b:Ljava/lang/String;

    iget-object v11, v2, Lhc/X;->a:Lhc/a0;

    invoke-static {v1}, LX4/x;->M(Ljava/lang/Object;)V

    move-object/from16 v21, v8

    move-object v8, v0

    move-object v0, v11

    move-object/from16 v11, v21

    move-object/from16 v21, v10

    move-object v10, v4

    move-object/from16 v4, v21

    goto :goto_1

    :cond_4
    invoke-static {v1}, LX4/x;->M(Ljava/lang/Object;)V

    sget-object v1, Lya/j;->a:Lya/d;

    iput-object v0, v2, Lhc/X;->a:Lhc/a0;

    move-object/from16 v4, p1

    iput-object v4, v2, Lhc/X;->b:Ljava/lang/String;

    move-object/from16 v9, p2

    iput-object v9, v2, Lhc/X;->c:Lcom/eightsleep/data_jetlag/enums/TripStatus;

    iput-object v6, v2, Lhc/X;->d:Ljava/lang/String;

    iput-object v6, v2, Lhc/X;->e:Ljava/util/List;

    iput-object v1, v2, Lhc/X;->f:Lya/d;

    iput v8, v2, Lhc/X;->j:I

    iget-object v8, v0, Lhc/a0;->b:Lu5/e;

    invoke-virtual {v8, v2}, Lu5/e;->C(LNm/c;)Ljava/lang/Object;

    move-result-object v8

    if-ne v8, v3, :cond_5

    goto/16 :goto_3

    :cond_5
    move-object v10, v8

    move-object v8, v1

    move-object v1, v10

    move-object v10, v6

    move-object v11, v10

    :goto_1
    check-cast v1, Lzo/l;

    iget-object v12, v0, Lhc/a0;->a:Lxd/p;

    iput-object v0, v2, Lhc/X;->a:Lhc/a0;

    iput-object v4, v2, Lhc/X;->b:Ljava/lang/String;

    iput-object v9, v2, Lhc/X;->c:Lcom/eightsleep/data_jetlag/enums/TripStatus;

    iput-object v11, v2, Lhc/X;->d:Ljava/lang/String;

    iput-object v10, v2, Lhc/X;->e:Ljava/util/List;

    iput-object v8, v2, Lhc/X;->f:Lya/d;

    move-object v13, v1

    check-cast v13, Lzo/l;

    iput-object v13, v2, Lhc/X;->g:Lzo/l;

    iput v7, v2, Lhc/X;->j:I

    invoke-virtual {v12, v2}, Lxd/p;->a(LNm/c;)Ljava/lang/Object;

    move-result-object v7

    if-ne v7, v3, :cond_6

    goto :goto_3

    :cond_6
    move-object v13, v1

    move-object v1, v7

    move-object v12, v8

    move-object/from16 v19, v10

    move-object/from16 v18, v11

    move-object v11, v0

    move-object v10, v4

    :goto_2
    move-object v14, v1

    check-cast v14, Lzo/l;

    new-instance v0, LXe/l1;

    const/16 v1, 0x1d

    invoke-direct {v0, v1}, LXe/l1;-><init>(I)V

    const/16 v17, 0xc

    const/4 v15, 0x0

    move-object/from16 v16, v0

    invoke-static/range {v12 .. v17}, Lya/d;->b(Lya/d;Lzo/l;Lzo/l;Lcom/eightsleep/presentation_onboarding/viewmodel/h;LVm/n;I)LGc/h;

    move-result-object v0

    new-instance v14, Lhc/Z;

    const/16 v20, 0x0

    move-object/from16 v17, v9

    move-object/from16 v16, v10

    move-object v15, v11

    invoke-direct/range {v14 .. v20}, Lhc/Z;-><init>(Lhc/a0;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/TripStatus;Ljava/lang/String;Ljava/util/List;LLm/c;)V

    iput-object v6, v2, Lhc/X;->a:Lhc/a0;

    iput-object v6, v2, Lhc/X;->b:Ljava/lang/String;

    iput-object v6, v2, Lhc/X;->c:Lcom/eightsleep/data_jetlag/enums/TripStatus;

    iput-object v6, v2, Lhc/X;->d:Ljava/lang/String;

    iput-object v6, v2, Lhc/X;->e:Ljava/util/List;

    iput-object v6, v2, Lhc/X;->f:Lya/d;

    iput-object v6, v2, Lhc/X;->g:Lzo/l;

    iput v5, v2, Lhc/X;->j:I

    invoke-static {v0, v6, v14, v5}, LP2/q;->u(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object v0

    if-ne v0, v3, :cond_7

    :goto_3
    return-object v3

    :cond_7
    return-object v0
.end method
