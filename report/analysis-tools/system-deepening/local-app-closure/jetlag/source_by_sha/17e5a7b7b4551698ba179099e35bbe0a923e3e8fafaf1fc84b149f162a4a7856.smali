.class public final Lmg/h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public constructor <init>(III)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lmg/h;->a:I

    iput p2, p0, Lmg/h;->b:I

    iput p3, p0, Lmg/h;->c:I

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v8, p1

    check-cast v8, Lm0/l;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    and-int/lit8 v1, v1, 0x3

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    move-object v1, v8

    check-cast v1, Lm0/q;

    invoke-virtual {v1}, Lm0/q;->H()Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Lm0/q;->Y()V

    goto/16 :goto_3

    :cond_1
    :goto_0
    sget-object v1, Lih/h;->d:Lih/h;

    const v2, 0x7f120803

    invoke-static {v8, v2}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v8}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v3

    iget-object v3, v3, Lhh/h;->k:Lhh/v;

    iget-wide v5, v3, Lhh/v;->d:J

    const/4 v13, 0x0

    const/16 v14, 0x3f6

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v7, 0x0

    move-object v11, v8

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v12, 0x0

    invoke-virtual/range {v1 .. v14}, Lih/h;->o(Ljava/lang/String;LA0/r;Lk1/U;JIZIILm0/l;III)V

    move-object v8, v11

    sget-object v11, LA0/o;->a:LA0/o;

    const/high16 v12, 0x3f800000    # 1.0f

    invoke-static {v11, v12}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v1

    const/16 v2, 0xc

    int-to-float v2, v2

    const/4 v3, 0x0

    const/4 v13, 0x1

    invoke-static {v1, v3, v2, v13}, LG/e;->J(LA0/r;FFI)LA0/r;

    move-result-object v1

    sget-object v2, LG/l;->a:LG/d;

    sget-object v3, LA0/d;->j:LA0/h;

    const/4 v14, 0x0

    invoke-static {v2, v3, v8, v14}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v2

    move-object v15, v8

    check-cast v15, Lm0/q;

    iget-wide v3, v15, Lm0/q;->T:J

    invoke-static {v3, v4}, Ljava/lang/Long;->hashCode(J)I

    move-result v3

    invoke-virtual {v15}, Lm0/q;->m()Lm0/o0;

    move-result-object v4

    invoke-static {v1, v8}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v1

    sget-object v5, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v5, LZ0/g;->b:LZ0/f;

    invoke-virtual {v15}, Lm0/q;->j0()V

    iget-boolean v6, v15, Lm0/q;->S:Z

    if-eqz v6, :cond_2

    invoke-virtual {v15, v5}, Lm0/q;->l(LVm/a;)V

    goto :goto_1

    :cond_2
    invoke-virtual {v15}, Lm0/q;->t0()V

    :goto_1
    sget-object v5, LZ0/g;->f:LZ0/e;

    invoke-static {v5, v2, v8}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v2, LZ0/g;->e:LZ0/e;

    invoke-static {v2, v4, v8}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sget-object v3, LZ0/g;->g:LZ0/e;

    invoke-static {v8, v2, v3}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v2, LZ0/g;->h:LZ0/d;

    invoke-static {v8, v2}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v2, LZ0/g;->d:LZ0/e;

    invoke-static {v2, v1, v8}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v1, Lg8/h0;->a:Lg8/h0;

    float-to-double v2, v12

    const-wide/16 v4, 0x0

    cmpl-double v2, v2, v4

    if-lez v2, :cond_3

    goto :goto_2

    :cond_3
    const-string v2, "invalid weight; must be greater than zero"

    invoke-static {v2}, LH/a;->a(Ljava/lang/String;)V

    :goto_2
    new-instance v4, LG/x0;

    invoke-direct {v4, v12, v13}, LG/x0;-><init>(FZ)V

    iget v2, v0, Lmg/h;->c:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f120802

    invoke-static {v3, v2, v8}, LP2/j;->H(I[Ljava/lang/Object;Lm0/l;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v8}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v2

    iget-object v2, v2, Lhh/h;->k:Lhh/v;

    iget-wide v2, v2, Lhh/v;->a:J

    new-instance v5, LH0/w;

    invoke-direct {v5, v2, v3}, LH0/w;-><init>(J)V

    new-instance v9, Lv1/k;

    const/4 v2, 0x5

    invoke-direct {v9, v2}, Lv1/k;-><init>(I)V

    const/16 v3, 0x68

    const/4 v10, 0x0

    const/4 v7, 0x0

    const/4 v2, 0x0

    invoke-virtual/range {v1 .. v10}, Lg8/h0;->m(IILA0/r;LH0/w;Ljava/lang/String;Lk1/U;Lm0/l;Lv1/k;Z)V

    iget v10, v0, Lmg/h;->a:I

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget v0, v0, Lmg/h;->b:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v3, v4}, [Ljava/lang/Object;

    move-result-object v3

    const v4, 0x7f120807

    invoke-static {v4, v3, v8}, LP2/j;->H(I[Ljava/lang/Object;Lm0/l;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v8}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v3

    iget-object v3, v3, Lhh/h;->k:Lhh/v;

    iget-wide v3, v3, Lhh/v;->d:J

    new-instance v6, LH0/w;

    invoke-direct {v6, v3, v4}, LH0/w;-><init>(J)V

    move-object v7, v8

    new-instance v8, Lv1/k;

    const/4 v3, 0x6

    invoke-direct {v8, v3}, Lv1/k;-><init>(I)V

    const/4 v3, 0x0

    move v4, v0

    move-object v0, v1

    move v1, v2

    const/16 v2, 0x6c

    const/4 v9, 0x0

    move/from16 v16, v4

    move-object v4, v6

    const/4 v6, 0x0

    move/from16 v14, v16

    invoke-virtual/range {v0 .. v9}, Lg8/h0;->o(IILA0/r;LH0/w;Ljava/lang/String;Lk1/U;Lm0/l;Lv1/k;Z)V

    move-object v8, v7

    invoke-virtual {v15, v13}, Lm0/q;->q(Z)V

    const/16 v0, 0xa

    int-to-float v0, v0

    invoke-static {v11, v0}, Landroidx/compose/foundation/layout/b;->e(LA0/r;F)LA0/r;

    move-result-object v0

    invoke-static {v0, v12}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v1

    sget-wide v2, LH0/w;->d:J

    invoke-static {v8}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v0

    iget-object v0, v0, Lhh/h;->d:Lhh/g;

    iget-wide v4, v0, Lhh/g;->d:J

    const v0, -0x42d398e5

    invoke-virtual {v15, v0}, Lm0/q;->f0(I)V

    invoke-virtual {v15, v10}, Lm0/q;->e(I)Z

    move-result v0

    invoke-virtual {v15, v14}, Lm0/q;->e(I)Z

    move-result v6

    or-int/2addr v0, v6

    invoke-virtual {v15}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v6

    if-nez v0, :cond_4

    sget-object v0, Lm0/k;->a:Lm0/e;

    if-ne v6, v0, :cond_5

    :cond_4
    new-instance v6, Lmg/g;

    invoke-direct {v6, v10, v14}, Lmg/g;-><init>(II)V

    invoke-virtual {v15, v6}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_5
    move-object v0, v6

    check-cast v0, LVm/a;

    const/4 v6, 0x0

    invoke-virtual {v15, v6}, Lm0/q;->q(Z)V

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/16 v9, 0x1b0

    invoke-static/range {v0 .. v9}, LP2/n;->n(LVm/a;LA0/r;JJFLVm/k;Lm0/l;I)V

    :goto_3
    sget-object v0, LHm/B;->a:LHm/B;

    return-object v0
.end method
