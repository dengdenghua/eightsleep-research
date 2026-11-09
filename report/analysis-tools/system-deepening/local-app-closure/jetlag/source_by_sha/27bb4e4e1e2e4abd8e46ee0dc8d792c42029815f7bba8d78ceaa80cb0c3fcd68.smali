.class public final Lhc/V;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhc/S;


# instance fields
.field public final a:Lu5/e;

.field public final b:Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;


# direct methods
.method public constructor <init>(Lu5/e;Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhc/V;->a:Lu5/e;

    iput-object p2, p0, Lhc/V;->b:Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/Integer;LNm/c;)Ljava/lang/Object;
    .locals 13

    move-object/from16 v0, p5

    instance-of v1, v0, Lhc/T;

    if-eqz v1, :cond_0

    move-object v1, v0

    check-cast v1, Lhc/T;

    iget v2, v1, Lhc/T;->h:I

    const/high16 v3, -0x80000000

    and-int v4, v2, v3

    if-eqz v4, :cond_0

    sub-int/2addr v2, v3

    iput v2, v1, Lhc/T;->h:I

    goto :goto_0

    :cond_0
    new-instance v1, Lhc/T;

    invoke-direct {v1, p0, v0}, Lhc/T;-><init>(Lhc/V;LNm/c;)V

    :goto_0
    iget-object v0, v1, Lhc/T;->f:Ljava/lang/Object;

    sget-object v2, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v3, v1, Lhc/T;->h:I

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v3, :cond_3

    if-eq v3, v5, :cond_2

    if-ne v3, v4, :cond_1

    invoke-static {v0}, LX4/x;->M(Ljava/lang/Object;)V

    return-object v0

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    iget-boolean p0, v1, Lhc/T;->e:Z

    iget-object p1, v1, Lhc/T;->d:Ljava/lang/Integer;

    iget-object v3, v1, Lhc/T;->c:Ljava/util/List;

    iget-object v5, v1, Lhc/T;->b:Ljava/lang/String;

    iget-object v6, v1, Lhc/T;->a:Lhc/V;

    invoke-static {v0}, LX4/x;->M(Ljava/lang/Object;)V

    move v10, p0

    move-object v11, p1

    move-object v9, v3

    move-object v8, v5

    move-object v7, v6

    goto :goto_1

    :cond_3
    invoke-static {v0}, LX4/x;->M(Ljava/lang/Object;)V

    iput-object p0, v1, Lhc/T;->a:Lhc/V;

    iput-object p1, v1, Lhc/T;->b:Ljava/lang/String;

    iput-object p2, v1, Lhc/T;->c:Ljava/util/List;

    move-object/from16 v3, p4

    iput-object v3, v1, Lhc/T;->d:Ljava/lang/Integer;

    move/from16 v6, p3

    iput-boolean v6, v1, Lhc/T;->e:Z

    iput v5, v1, Lhc/T;->h:I

    iget-object v5, p0, Lhc/V;->a:Lu5/e;

    invoke-virtual {v5, v1}, Lu5/e;->C(LNm/c;)Ljava/lang/Object;

    move-result-object v5

    if-ne v5, v2, :cond_4

    goto :goto_2

    :cond_4
    move-object v7, p0

    move-object v8, p1

    move-object v9, p2

    move-object v11, v3

    move-object v0, v5

    move v10, v6

    :goto_1
    check-cast v0, Lzo/l;

    new-instance v6, Lhc/U;

    const/4 v12, 0x0

    invoke-direct/range {v6 .. v12}, Lhc/U;-><init>(Lhc/V;Ljava/lang/String;Ljava/util/List;ZLjava/lang/Integer;LLm/c;)V

    const/4 p0, 0x0

    iput-object p0, v1, Lhc/T;->a:Lhc/V;

    iput-object p0, v1, Lhc/T;->b:Ljava/lang/String;

    iput-object p0, v1, Lhc/T;->c:Ljava/util/List;

    iput-object p0, v1, Lhc/T;->d:Ljava/lang/Integer;

    iput v4, v1, Lhc/T;->h:I

    const/4 p1, 0x3

    invoke-static {v0, p0, v6, p1}, LP2/q;->u(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object p0

    if-ne p0, v2, :cond_5

    :goto_2
    return-object v2

    :cond_5
    return-object p0
.end method
