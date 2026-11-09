.class public abstract Lio/sentry/config/a;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final A(LG/C;LKi/c;LVm/k;Lc8/e;Lm0/l;I)V
    .locals 30

    move-object/from16 v1, p0

    move-object/from16 v3, p2

    move/from16 v5, p5

    const-string v0, "<this>"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "model"

    move-object/from16 v2, p1

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onUiAction"

    invoke-static {v3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v0, p4

    check-cast v0, Lm0/q;

    const v4, 0x5e10e860

    invoke-virtual {v0, v4}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v4, v5, 0x6

    if-nez v4, :cond_1

    invoke-virtual {v0, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v4, 0x4

    goto :goto_0

    :cond_0
    const/4 v4, 0x2

    :goto_0
    or-int/2addr v4, v5

    goto :goto_1

    :cond_1
    move v4, v5

    :goto_1
    and-int/lit16 v6, v5, 0x180

    const/16 v7, 0x100

    if-nez v6, :cond_3

    invoke-virtual {v0, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    move v6, v7

    goto :goto_2

    :cond_2
    const/16 v6, 0x80

    :goto_2
    or-int/2addr v4, v6

    :cond_3
    and-int/lit16 v6, v4, 0x83

    const/16 v8, 0x82

    if-ne v6, v8, :cond_5

    invoke-virtual {v0}, Lm0/q;->H()Z

    move-result v6

    if-nez v6, :cond_4

    goto :goto_3

    :cond_4
    invoke-virtual {v0}, Lm0/q;->Y()V

    move-object/from16 v24, v0

    goto/16 :goto_5

    :cond_5
    :goto_3
    const v6, 0x7f121523

    invoke-static {v0, v6}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v0}, Lhh/j;->e(Lm0/l;)Lhh/k;

    move-result-object v8

    iget-object v8, v8, Lhh/k;->t:Lk1/U;

    invoke-static {v0}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v9

    iget-object v9, v9, Lhh/h;->k:Lhh/v;

    iget-wide v9, v9, Lhh/v;->a:J

    const/16 v22, 0x0

    const/16 v25, 0x0

    move v11, v7

    const/4 v7, 0x0

    move-object/from16 v23, v8

    move-wide v8, v9

    const/4 v10, 0x0

    move v13, v11

    const-wide/16 v11, 0x0

    move v15, v13

    const-wide/16 v13, 0x0

    move/from16 v16, v15

    const/4 v15, 0x0

    move/from16 v18, v16

    const-wide/16 v16, 0x0

    move/from16 v19, v18

    const/16 v18, 0x0

    move/from16 v20, v19

    const/16 v19, 0x0

    move/from16 v21, v20

    const/16 v20, 0x0

    move/from16 v24, v21

    const/16 v21, 0x0

    const/16 v26, 0x0

    const v27, 0x1fffa

    move/from16 v29, v24

    move-object/from16 v24, v0

    move/from16 v0, v29

    invoke-static/range {v6 .. v27}, Lj0/o3;->c(Ljava/lang/String;LA0/r;JLP/f;JJLv1/k;JIZIILVm/k;Lk1/U;Lm0/l;III)V

    move-object/from16 v6, v24

    const/4 v7, 0x0

    invoke-static {v6, v7}, LP2/z;->M(Lm0/l;I)V

    const v8, 0x7f121522

    invoke-static {v6, v8}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6}, Lhh/j;->e(Lm0/l;)Lhh/k;

    move-result-object v9

    iget-object v9, v9, Lhh/k;->k:Lk1/U;

    invoke-static {v6}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v10

    iget-object v10, v10, Lhh/h;->k:Lhh/v;

    iget-wide v10, v10, Lhh/v;->c:J

    const/16 v22, 0x0

    const/16 v25, 0x0

    move v12, v7

    const/4 v7, 0x0

    move-object/from16 v24, v6

    move-object v6, v8

    move-object/from16 v23, v9

    move-wide v8, v10

    const/4 v10, 0x0

    move v13, v12

    const-wide/16 v11, 0x0

    move v15, v13

    const-wide/16 v13, 0x0

    move/from16 v16, v15

    const/4 v15, 0x0

    move/from16 v18, v16

    const-wide/16 v16, 0x0

    move/from16 v19, v18

    const/16 v18, 0x0

    move/from16 v20, v19

    const/16 v19, 0x0

    move/from16 v21, v20

    const/16 v20, 0x0

    move/from16 v26, v21

    const/16 v21, 0x0

    move/from16 v27, v26

    const/16 v26, 0x0

    move/from16 v28, v27

    const v27, 0x1fffa

    invoke-static/range {v6 .. v27}, Lj0/o3;->c(Ljava/lang/String;LA0/r;JLP/f;JJLv1/k;JIZIILVm/k;Lk1/U;Lm0/l;III)V

    move-object/from16 v6, v24

    and-int/lit8 v7, v4, 0xe

    invoke-static {v1, v6, v7}, LP2/z;->I(LG/C;Lm0/l;I)V

    sget-object v7, LOg/e;->b:LOg/e;

    const v8, 0x7f12151f

    invoke-static {v6, v8}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v8

    const v9, -0xd8993d

    invoke-virtual {v6, v9}, Lm0/q;->f0(I)V

    and-int/lit16 v4, v4, 0x380

    if-ne v4, v0, :cond_6

    const/4 v0, 0x1

    goto :goto_4

    :cond_6
    const/4 v0, 0x0

    :goto_4
    invoke-virtual {v6}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v4

    if-nez v0, :cond_7

    sget-object v0, Lm0/k;->a:Lm0/e;

    if-ne v4, v0, :cond_8

    :cond_7
    new-instance v4, LMf/g;

    const/16 v0, 0x1d

    invoke-direct {v4, v0, v3}, LMf/g;-><init>(ILVm/k;)V

    invoke-virtual {v6, v4}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_8
    move-object/from16 v16, v4

    check-cast v16, LVm/a;

    const/4 v12, 0x0

    invoke-virtual {v6, v12}, Lm0/q;->q(Z)V

    const/4 v15, 0x0

    const/16 v18, 0x0

    move-object/from16 v24, v6

    move-object v6, v7

    const/4 v7, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x3fd

    move-object/from16 v17, v24

    invoke-virtual/range {v6 .. v20}, LOg/e;->g(LA0/r;Ljava/lang/String;Ljava/lang/Integer;Lhh/n;Lhh/d;ZZLhh/e;LJg/b;LVm/a;Lm0/l;III)V

    :goto_5
    invoke-virtual/range {v24 .. v24}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_9

    new-instance v0, LMi/x;

    const/4 v6, 0x1

    move-object/from16 v4, p3

    invoke-direct/range {v0 .. v6}, LMi/x;-><init>(LG/C;LKi/c;LVm/k;Lc8/e;II)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_9
    return-void
.end method

.method public static final B(Ljava/lang/String;Ljava/util/List;Lan/h;Lcom/eightsleep/data_core/enums/ClockSystem;LVm/k;LVm/k;Lm0/l;I)V
    .locals 26

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v0, p4

    move-object/from16 v10, p5

    move-object/from16 v8, p6

    check-cast v8, Lm0/q;

    const v4, 0x30b787e7

    invoke-virtual {v8, v4}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v8, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v4, 0x4

    goto :goto_0

    :cond_0
    const/4 v4, 0x2

    :goto_0
    or-int v4, p7, v4

    invoke-virtual {v8, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    const/16 v5, 0x20

    goto :goto_1

    :cond_1
    const/16 v5, 0x10

    :goto_1
    or-int/2addr v4, v5

    invoke-virtual {v8, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    const/16 v5, 0x100

    goto :goto_2

    :cond_2
    const/16 v5, 0x80

    :goto_2
    or-int/2addr v4, v5

    move-object/from16 v5, p3

    invoke-virtual {v8, v5}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    const/16 v6, 0x800

    goto :goto_3

    :cond_3
    const/16 v6, 0x400

    :goto_3
    or-int/2addr v4, v6

    invoke-virtual {v8, v0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    const/16 v7, 0x4000

    if-eqz v6, :cond_4

    move v6, v7

    goto :goto_4

    :cond_4
    const/16 v6, 0x2000

    :goto_4
    or-int/2addr v4, v6

    invoke-virtual {v8, v10}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    const/high16 v9, 0x20000

    if-eqz v6, :cond_5

    move v6, v9

    goto :goto_5

    :cond_5
    const/high16 v6, 0x10000

    :goto_5
    or-int v24, v4, v6

    const v4, 0x12493

    and-int v4, v24, v4

    const v6, 0x12492

    if-ne v4, v6, :cond_7

    invoke-virtual {v8}, Lm0/q;->H()Z

    move-result v4

    if-nez v4, :cond_6

    goto :goto_6

    :cond_6
    invoke-virtual {v8}, Lm0/q;->Y()V

    goto/16 :goto_f

    :cond_7
    :goto_6
    sget-object v4, LA0/o;->a:LA0/o;

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-static {v4, v6}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v4

    sget-object v6, LG/l;->c:LG/f;

    sget-object v11, LA0/d;->m:LA0/g;

    const/4 v12, 0x0

    invoke-static {v6, v11, v8, v12}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v6

    iget-wide v13, v8, Lm0/q;->T:J

    invoke-static {v13, v14}, Ljava/lang/Long;->hashCode(J)I

    move-result v11

    invoke-virtual {v8}, Lm0/q;->m()Lm0/o0;

    move-result-object v13

    invoke-static {v4, v8}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v4

    sget-object v14, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v14, LZ0/g;->b:LZ0/f;

    invoke-virtual {v8}, Lm0/q;->j0()V

    iget-boolean v15, v8, Lm0/q;->S:Z

    if-eqz v15, :cond_8

    invoke-virtual {v8, v14}, Lm0/q;->l(LVm/a;)V

    goto :goto_7

    :cond_8
    invoke-virtual {v8}, Lm0/q;->t0()V

    :goto_7
    sget-object v14, LZ0/g;->f:LZ0/e;

    invoke-static {v14, v6, v8}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v6, LZ0/g;->e:LZ0/e;

    invoke-static {v6, v13, v8}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    sget-object v11, LZ0/g;->g:LZ0/e;

    invoke-static {v8, v6, v11}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v6, LZ0/g;->h:LZ0/d;

    invoke-static {v8, v6}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v6, LZ0/g;->d:LZ0/e;

    invoke-static {v6, v4, v8}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const v4, -0x462c49fc

    invoke-virtual {v8, v4}, Lm0/q;->f0(I)V

    const v4, 0x7f120ae9

    invoke-static {v8, v4}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v11

    const-string v4, "I didn\'t wake up overnight"

    invoke-static {v1, v4}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    const v6, 0x3fcd20ea

    invoke-virtual {v8, v6}, Lm0/q;->f0(I)V

    const v6, 0xe000

    and-int v6, v24, v6

    const/4 v13, 0x1

    if-ne v6, v7, :cond_9

    move v6, v13

    goto :goto_8

    :cond_9
    move v6, v12

    :goto_8
    invoke-virtual {v8}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v7

    sget-object v14, Lm0/k;->a:Lm0/e;

    if-nez v6, :cond_a

    if-ne v7, v14, :cond_b

    :cond_a
    new-instance v7, LAe/L;

    const/16 v6, 0x17

    invoke-direct {v7, v6, v0}, LAe/L;-><init>(ILVm/k;)V

    invoke-virtual {v8, v7}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_b
    move-object/from16 v16, v7

    check-cast v16, LVm/k;

    invoke-virtual {v8, v12}, Lm0/q;->q(Z)V

    move-object v6, v14

    const/4 v14, 0x0

    const/4 v15, 0x0

    move v7, v13

    const/4 v13, 0x0

    const/16 v18, 0x6000

    const/16 v19, 0x2c

    move/from16 v17, v12

    move v12, v4

    move/from16 v4, v17

    move-object/from16 v17, v8

    invoke-static/range {v11 .. v19}, LP2/C;->b(Ljava/lang/String;ZZLcom/eightsleep/corepresentation/enums/CellVariant;ZLVm/k;Lm0/l;II)V

    if-nez v3, :cond_c

    invoke-virtual {v8, v4}, Lm0/q;->q(Z)V

    goto/16 :goto_e

    :cond_c
    invoke-static {v8, v4}, LP2/z;->Q(Lm0/l;I)V

    sget-object v11, Lih/h;->b:Lih/h;

    const v12, 0x7f120ae6

    invoke-static {v8, v12}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v12

    const/16 v19, 0x0

    const/16 v21, 0x0

    const/4 v13, 0x0

    const-wide/16 v14, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x3fe

    move-object/from16 v20, v8

    invoke-virtual/range {v11 .. v23}, Lih/h;->h(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    const v11, 0x3fcd54c9

    invoke-virtual {v8, v11}, Lm0/q;->f0(I)V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    move v12, v4

    :goto_9
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    const/high16 v14, 0x70000

    if-eqz v13, :cond_14

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    add-int/lit8 v15, v12, 0x1

    if-ltz v12, :cond_13

    check-cast v13, Lwg/c;

    invoke-static {v8, v4}, LP2/z;->Q(Lm0/l;I)V

    const v7, 0x5fec59c9

    invoke-virtual {v8, v7}, Lm0/q;->f0(I)V

    and-int v7, v24, v14

    if-ne v7, v9, :cond_d

    const/4 v14, 0x1

    goto :goto_a

    :cond_d
    move v14, v4

    :goto_a
    invoke-virtual {v8, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v16

    or-int v14, v14, v16

    invoke-virtual {v8, v12}, Lm0/q;->e(I)Z

    move-result v16

    or-int v14, v14, v16

    invoke-virtual {v8}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v9

    if-nez v14, :cond_e

    if-ne v9, v6, :cond_f

    :cond_e
    new-instance v9, LBg/u;

    const/4 v14, 0x0

    invoke-direct {v9, v10, v2, v12, v14}, LBg/u;-><init>(Ljava/lang/Object;Ljava/lang/Object;II)V

    invoke-virtual {v8, v9}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_f
    check-cast v9, LVm/k;

    invoke-virtual {v8, v4}, Lm0/q;->q(Z)V

    const v14, 0x5fec6c5d

    invoke-virtual {v8, v14}, Lm0/q;->f0(I)V

    const/high16 v14, 0x20000

    if-ne v7, v14, :cond_10

    const/4 v7, 0x1

    goto :goto_b

    :cond_10
    move v7, v4

    :goto_b
    invoke-virtual {v8, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v16

    or-int v7, v7, v16

    invoke-virtual {v8, v12}, Lm0/q;->e(I)Z

    move-result v16

    or-int v7, v7, v16

    invoke-virtual {v8}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v14

    if-nez v7, :cond_11

    if-ne v14, v6, :cond_12

    :cond_11
    new-instance v14, LBg/v;

    const/4 v7, 0x0

    invoke-direct {v14, v10, v2, v12, v7}, LBg/v;-><init>(Ljava/lang/Object;Ljava/lang/Object;II)V

    invoke-virtual {v8, v14}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_12
    move-object v7, v14

    check-cast v7, LVm/a;

    invoke-virtual {v8, v4}, Lm0/q;->q(Z)V

    shr-int/lit8 v12, v24, 0x3

    and-int/lit16 v12, v12, 0x3f0

    move v14, v4

    move-object v4, v3

    move-object v3, v13

    move v13, v14

    move-object v14, v6

    move-object v6, v9

    move v9, v12

    const/high16 v12, 0x20000

    invoke-static/range {v3 .. v9}, Lio/sentry/config/a;->d(Lwg/c;Lan/h;Lcom/eightsleep/data_core/enums/ClockSystem;LVm/k;LVm/a;Lm0/l;I)V

    move-object/from16 v5, p3

    move-object v3, v4

    move v9, v12

    move v4, v13

    move-object v6, v14

    move v12, v15

    const/4 v7, 0x1

    goto/16 :goto_9

    :cond_13
    invoke-static {}, LIm/s;->s0()V

    const/4 v0, 0x0

    throw v0

    :cond_14
    move v13, v4

    move v12, v9

    move v4, v14

    move-object v14, v6

    invoke-virtual {v8, v13}, Lm0/q;->q(Z)V

    const v5, 0x3fcd98c2

    invoke-virtual {v8, v5}, Lm0/q;->f0(I)V

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    const/16 v6, 0xa

    if-ge v5, v6, :cond_18

    invoke-static {v8, v13}, LP2/z;->Q(Lm0/l;I)V

    sget-object v11, LOg/e;->d:LOg/e;

    const v5, 0x7f120ae5

    invoke-static {v8, v5}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v5

    const v6, 0x7f080230

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    const v6, 0x3fcdbcde

    invoke-virtual {v8, v6}, Lm0/q;->f0(I)V

    invoke-virtual {v8, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    and-int v4, v24, v4

    if-ne v4, v12, :cond_15

    move v12, v7

    goto :goto_c

    :cond_15
    move v12, v13

    :goto_c
    or-int v4, v6, v12

    invoke-virtual {v8, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    or-int/2addr v4, v6

    invoke-virtual {v8}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v6

    if-nez v4, :cond_16

    if-ne v6, v14, :cond_17

    :cond_16
    new-instance v6, LAe/o;

    const/4 v4, 0x4

    invoke-direct {v6, v3, v10, v2, v4}, LAe/o;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    invoke-virtual {v8, v6}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_17
    move-object/from16 v21, v6

    check-cast v21, LVm/a;

    invoke-virtual {v8, v13}, Lm0/q;->q(Z)V

    const/16 v20, 0x0

    const/16 v23, 0x0

    const/4 v12, 0x0

    const/4 v14, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x7f5

    move-object/from16 v22, v8

    move v4, v13

    move-object v13, v5

    invoke-virtual/range {v11 .. v25}, LOg/e;->c(LA0/r;Ljava/lang/String;LH0/w;Ljava/lang/Integer;Lhh/n;Lhh/d;ZZLJg/b;LVm/a;Lm0/l;III)V

    goto :goto_d

    :cond_18
    move v4, v13

    :goto_d
    invoke-virtual {v8, v4}, Lm0/q;->q(Z)V

    invoke-virtual {v8, v4}, Lm0/q;->q(Z)V

    :goto_e
    invoke-virtual {v8, v7}, Lm0/q;->q(Z)V

    :goto_f
    invoke-virtual {v8}, Lm0/q;->u()Lm0/t0;

    move-result-object v9

    if-eqz v9, :cond_19

    new-instance v0, LAe/d0;

    const/4 v8, 0x1

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move/from16 v7, p7

    move-object v6, v10

    invoke-direct/range {v0 .. v8}, LAe/d0;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;LVm/k;LVm/k;II)V

    iput-object v0, v9, Lm0/t0;->d:LVm/n;

    :cond_19
    return-void
.end method

.method public static final C(Ljava/lang/String;Lm0/l;I)V
    .locals 15

    move/from16 v0, p2

    move-object/from16 v6, p1

    check-cast v6, Lm0/q;

    const v1, 0x38d83285

    invoke-virtual {v6, v1}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v6, p0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x2

    if-eqz v1, :cond_0

    const/4 v1, 0x4

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    or-int v9, v0, v1

    and-int/lit8 v1, v9, 0x3

    if-ne v1, v2, :cond_2

    invoke-virtual {v6}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v6}, Lm0/q;->Y()V

    goto/16 :goto_3

    :cond_2
    :goto_1
    sget-object v1, LA0/o;->a:LA0/o;

    invoke-static {v6}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v2

    iget v2, v2, Lhh/i;->i:F

    invoke-static {v2}, LO/e;->b(F)LO/d;

    move-result-object v2

    invoke-static {v1, v2}, LE0/i;->c(LA0/r;LH0/X;)LA0/r;

    move-result-object v2

    invoke-static {v6}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v3

    iget-object v3, v3, Lhh/h;->d:Lhh/g;

    iget-wide v3, v3, Lhh/g;->e:J

    sget-object v5, LH0/F;->b:LH0/S;

    invoke-static {v2, v3, v4, v5}, Ly/x;->g(LA0/r;JLH0/X;)LA0/r;

    move-result-object v2

    invoke-static {v6}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v3

    iget v3, v3, Lhh/i;->a:F

    invoke-static {v6}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v4

    iget v4, v4, Lhh/i;->b:F

    invoke-static {v6}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v5

    iget v5, v5, Lhh/i;->a:F

    invoke-static {v6}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v7

    iget v7, v7, Lhh/i;->a:F

    invoke-static {v2, v3, v5, v4, v7}, LG/e;->K(LA0/r;FFFF)LA0/r;

    move-result-object v2

    sget-object v3, LA0/d;->k:LA0/h;

    sget-object v4, LG/l;->a:LG/d;

    const/16 v5, 0x30

    invoke-static {v4, v3, v6, v5}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v3

    iget-wide v4, v6, Lm0/q;->T:J

    invoke-static {v4, v5}, Ljava/lang/Long;->hashCode(J)I

    move-result v4

    invoke-virtual {v6}, Lm0/q;->m()Lm0/o0;

    move-result-object v5

    invoke-static {v2, v6}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v2

    sget-object v7, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v7, LZ0/g;->b:LZ0/f;

    invoke-virtual {v6}, Lm0/q;->j0()V

    iget-boolean v8, v6, Lm0/q;->S:Z

    if-eqz v8, :cond_3

    invoke-virtual {v6, v7}, Lm0/q;->l(LVm/a;)V

    goto :goto_2

    :cond_3
    invoke-virtual {v6}, Lm0/q;->t0()V

    :goto_2
    sget-object v7, LZ0/g;->f:LZ0/e;

    invoke-static {v7, v3, v6}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v3, LZ0/g;->e:LZ0/e;

    invoke-static {v3, v5, v6}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    sget-object v4, LZ0/g;->g:LZ0/e;

    invoke-static {v6, v3, v4}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v3, LZ0/g;->h:LZ0/d;

    invoke-static {v6, v3}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v3, LZ0/g;->d:LZ0/e;

    invoke-static {v3, v2, v6}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const v2, 0x7f08025f

    const/4 v3, 0x6

    invoke-static {v2, v3, v6}, LIm/s;->w0(IILm0/l;)LM0/f;

    move-result-object v2

    invoke-static {v6}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v3

    iget-object v3, v3, Lhh/h;->k:Lhh/v;

    iget-wide v4, v3, Lhh/v;->a:J

    invoke-static {v6}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v3

    iget v3, v3, Lhh/i;->e:F

    invoke-static {v1, v3}, Landroidx/compose/foundation/layout/b;->n(LA0/r;F)LA0/r;

    move-result-object v3

    const/4 v8, 0x0

    move-object v1, v2

    const/4 v2, 0x0

    const/16 v7, 0x30

    invoke-static/range {v1 .. v8}, Lj0/I0;->b(LM0/f;Ljava/lang/String;LA0/r;JLm0/l;II)V

    const/4 v1, 0x0

    invoke-static {v6, v1}, LP2/z;->m(Lm0/l;I)V

    sget-object v1, Lih/h;->b:Lih/h;

    and-int/lit8 v12, v9, 0xe

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    move-object v11, v6

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v13, 0x0

    const/16 v14, 0x3fe

    move-object v2, p0

    invoke-virtual/range {v1 .. v14}, Lih/h;->z(Ljava/lang/String;LA0/r;JIZIILVm/k;Lm0/l;III)V

    move-object v6, v11

    const/4 v1, 0x1

    invoke-virtual {v6, v1}, Lm0/q;->q(Z)V

    :goto_3
    invoke-virtual {v6}, Lm0/q;->u()Lm0/t0;

    move-result-object v1

    if-eqz v1, :cond_4

    new-instance v3, LAg/f0;

    const/4 v4, 0x7

    invoke-direct {v3, p0, v0, v4}, LAg/f0;-><init>(Ljava/lang/String;II)V

    iput-object v3, v1, Lm0/t0;->d:LVm/n;

    :cond_4
    return-void
.end method

.method public static final D(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;LVm/k;ZLu0/d;Lm0/l;II)V
    .locals 26

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move/from16 v7, p7

    move-object/from16 v15, p6

    check-cast v15, Lm0/q;

    const v0, 0x49bcceae    # 1546709.8f

    invoke-virtual {v15, v0}, Lm0/q;->h0(I)Lm0/q;

    move-object/from16 v13, p0

    invoke-virtual {v15, v13}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int/2addr v0, v7

    move-object/from16 v2, p1

    invoke-virtual {v15, v2}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x20

    goto :goto_1

    :cond_1
    const/16 v1, 0x10

    :goto_1
    or-int/2addr v0, v1

    invoke-virtual {v15, v3}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x100

    goto :goto_2

    :cond_2
    const/16 v1, 0x80

    :goto_2
    or-int/2addr v0, v1

    invoke-virtual {v15, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/16 v1, 0x800

    goto :goto_3

    :cond_3
    const/16 v1, 0x400

    :goto_3
    or-int/2addr v0, v1

    and-int/lit8 v1, p8, 0x10

    if-eqz v1, :cond_5

    or-int/lit16 v0, v0, 0x6000

    :cond_4
    move/from16 v6, p4

    goto :goto_5

    :cond_5
    and-int/lit16 v6, v7, 0x6000

    if-nez v6, :cond_4

    move/from16 v6, p4

    invoke-virtual {v15, v6}, Lm0/q;->h(Z)Z

    move-result v8

    if-eqz v8, :cond_6

    const/16 v8, 0x4000

    goto :goto_4

    :cond_6
    const/16 v8, 0x2000

    :goto_4
    or-int/2addr v0, v8

    :goto_5
    const v8, 0x12493

    and-int/2addr v8, v0

    const v9, 0x12492

    if-ne v8, v9, :cond_8

    invoke-virtual {v15}, Lm0/q;->H()Z

    move-result v8

    if-nez v8, :cond_7

    goto :goto_6

    :cond_7
    invoke-virtual {v15}, Lm0/q;->Y()V

    move-object v7, v4

    move v5, v6

    move-object/from16 v6, p5

    goto/16 :goto_11

    :cond_8
    :goto_6
    const/4 v8, 0x1

    if-eqz v1, :cond_9

    move v6, v8

    :cond_9
    sget-object v1, LA0/o;->a:LA0/o;

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-static {v1, v9}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v10

    new-instance v11, Lfh/a;

    const/4 v12, 0x0

    if-eqz v6, :cond_a

    int-to-float v14, v8

    goto :goto_7

    :cond_a
    int-to-float v14, v12

    :goto_7
    invoke-static {v15}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v5

    iget-object v5, v5, Lhh/h;->d:Lhh/g;

    iget-wide v8, v5, Lhh/g;->d:J

    invoke-direct {v11, v8, v9, v14}, Lfh/a;-><init>(JF)V

    const/4 v5, 0x7

    const/4 v8, 0x0

    invoke-static {v10, v8, v8, v11, v5}, LP2/q;->p(LA0/r;Lfh/a;Lfh/a;Lfh/a;I)LA0/r;

    move-result-object v5

    sget-object v8, LG/l;->c:LG/f;

    sget-object v9, LA0/d;->m:LA0/g;

    invoke-static {v8, v9, v15, v12}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v10

    iget-wide v12, v15, Lm0/q;->T:J

    invoke-static {v12, v13}, Ljava/lang/Long;->hashCode(J)I

    move-result v12

    invoke-virtual {v15}, Lm0/q;->m()Lm0/o0;

    move-result-object v13

    invoke-static {v5, v15}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v5

    sget-object v14, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v14, LZ0/g;->b:LZ0/f;

    invoke-virtual {v15}, Lm0/q;->j0()V

    iget-boolean v11, v15, Lm0/q;->S:Z

    if-eqz v11, :cond_b

    invoke-virtual {v15, v14}, Lm0/q;->l(LVm/a;)V

    goto :goto_8

    :cond_b
    invoke-virtual {v15}, Lm0/q;->t0()V

    :goto_8
    sget-object v11, LZ0/g;->f:LZ0/e;

    invoke-static {v11, v10, v15}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v10, LZ0/g;->e:LZ0/e;

    invoke-static {v10, v13, v15}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    sget-object v13, LZ0/g;->g:LZ0/e;

    invoke-static {v15, v12, v13}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v12, LZ0/g;->h:LZ0/d;

    invoke-static {v15, v12}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v2, LZ0/g;->d:LZ0/e;

    invoke-static {v2, v5, v15}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v5, LG/D;->a:LG/D;

    move-object/from16 v18, v5

    sget-object v5, LG/l;->g:LG/g;

    move/from16 v19, v6

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-static {v1, v6}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v7

    sget-object v6, LA0/d;->j:LA0/h;

    const/4 v4, 0x6

    invoke-static {v5, v6, v15, v4}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v4

    move v5, v0

    move-object/from16 v20, v1

    iget-wide v0, v15, Lm0/q;->T:J

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result v0

    invoke-virtual {v15}, Lm0/q;->m()Lm0/o0;

    move-result-object v1

    invoke-static {v7, v15}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v7

    invoke-virtual {v15}, Lm0/q;->j0()V

    move/from16 v21, v5

    iget-boolean v5, v15, Lm0/q;->S:Z

    if-eqz v5, :cond_c

    invoke-virtual {v15, v14}, Lm0/q;->l(LVm/a;)V

    goto :goto_9

    :cond_c
    invoke-virtual {v15}, Lm0/q;->t0()V

    :goto_9
    invoke-static {v11, v4, v15}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v10, v1, v15}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v0, v15, v13, v15, v12}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    invoke-static {v2, v7, v15}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const/high16 v0, 0x3f800000    # 1.0f

    float-to-double v4, v0

    const-wide/16 v22, 0x0

    cmpl-double v1, v4, v22

    if-lez v1, :cond_d

    goto :goto_a

    :cond_d
    const-string v1, "invalid weight; must be greater than zero"

    invoke-static {v1}, LH/a;->a(Ljava/lang/String;)V

    :goto_a
    new-instance v1, LG/x0;

    const/4 v4, 0x1

    invoke-direct {v1, v0, v4}, LG/x0;-><init>(FZ)V

    const/4 v0, 0x0

    invoke-static {v8, v9, v15, v0}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v5

    iget-wide v7, v15, Lm0/q;->T:J

    invoke-static {v7, v8}, Ljava/lang/Long;->hashCode(J)I

    move-result v7

    invoke-virtual {v15}, Lm0/q;->m()Lm0/o0;

    move-result-object v8

    invoke-static {v1, v15}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v1

    invoke-virtual {v15}, Lm0/q;->j0()V

    iget-boolean v9, v15, Lm0/q;->S:Z

    if-eqz v9, :cond_e

    invoke-virtual {v15, v14}, Lm0/q;->l(LVm/a;)V

    goto :goto_b

    :cond_e
    invoke-virtual {v15}, Lm0/q;->t0()V

    :goto_b
    invoke-static {v11, v5, v15}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v10, v8, v15}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v7, v15, v13, v15, v12}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    invoke-static {v2, v1, v15}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v8, Lg8/h0;->a:Lg8/h0;

    and-int/lit8 v9, v21, 0xe

    const/16 v16, 0x0

    move-object v1, v14

    const/4 v14, 0x0

    move-object v5, v12

    const/4 v12, 0x0

    move-object v7, v11

    const/4 v11, 0x0

    const/16 v17, 0x0

    move-object/from16 v22, v10

    const/16 v10, 0x7e

    move-object/from16 v25, v5

    move-object/from16 v24, v13

    move-object/from16 v5, v22

    move-object/from16 v13, p0

    invoke-virtual/range {v8 .. v17}, Lg8/h0;->a(IILA0/r;LH0/w;Ljava/lang/String;Lk1/U;Lm0/l;Lv1/k;Z)V

    invoke-static {v15, v0}, LP2/z;->S(Lm0/l;I)V

    invoke-static {v15}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v9

    iget-object v9, v9, Lhh/h;->k:Lhh/v;

    iget-wide v9, v9, Lhh/v;->d:J

    new-instance v12, LH0/w;

    invoke-direct {v12, v9, v10}, LH0/w;-><init>(J)V

    shr-int/lit8 v9, v21, 0x3

    and-int/lit8 v9, v9, 0xe

    const/16 v16, 0x0

    const/4 v14, 0x0

    const/4 v11, 0x0

    const/16 v17, 0x0

    const/16 v10, 0x7c

    move-object/from16 v13, p1

    invoke-virtual/range {v8 .. v17}, Lg8/h0;->a(IILA0/r;LH0/w;Ljava/lang/String;Lk1/U;Lm0/l;Lv1/k;Z)V

    invoke-virtual {v15, v4}, Lm0/q;->q(Z)V

    sget-object v8, LG/l;->a:LG/d;

    invoke-static {v8, v6, v15, v0}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v6

    iget-wide v8, v15, Lm0/q;->T:J

    invoke-static {v8, v9}, Ljava/lang/Long;->hashCode(J)I

    move-result v8

    invoke-virtual {v15}, Lm0/q;->m()Lm0/o0;

    move-result-object v9

    move-object/from16 v10, v20

    invoke-static {v10, v15}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v10

    invoke-virtual {v15}, Lm0/q;->j0()V

    iget-boolean v11, v15, Lm0/q;->S:Z

    if-eqz v11, :cond_f

    invoke-virtual {v15, v1}, Lm0/q;->l(LVm/a;)V

    goto :goto_c

    :cond_f
    invoke-virtual {v15}, Lm0/q;->t0()V

    :goto_c
    invoke-static {v7, v6, v15}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v5, v9, v15}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object/from16 v1, v24

    move-object/from16 v5, v25

    invoke-static {v8, v15, v1, v15, v5}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    invoke-static {v2, v10, v15}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v8, LDg/l0;->a:LDg/l0;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v12

    const v1, 0x58a8b564

    invoke-virtual {v15, v1}, Lm0/q;->f0(I)V

    move/from16 v5, v21

    and-int/lit16 v1, v5, 0x1c00

    const/16 v2, 0x800

    if-ne v1, v2, :cond_10

    move v2, v4

    goto :goto_d

    :cond_10
    move v2, v0

    :goto_d
    invoke-virtual {v15}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v5

    sget-object v6, Lm0/k;->a:Lm0/e;

    if-nez v2, :cond_12

    if-ne v5, v6, :cond_11

    goto :goto_e

    :cond_11
    move-object/from16 v7, p3

    goto :goto_f

    :cond_12
    :goto_e
    new-instance v5, LAe/O;

    const/16 v2, 0x16

    move-object/from16 v7, p3

    invoke-direct {v5, v2, v7}, LAe/O;-><init>(ILVm/k;)V

    invoke-virtual {v15, v5}, Lm0/q;->q0(Ljava/lang/Object;)V

    :goto_f
    move-object v13, v5

    check-cast v13, LVm/a;

    invoke-virtual {v15, v0}, Lm0/q;->q(Z)V

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v9, 0x0

    move-object v14, v15

    const/high16 v15, 0x30000

    invoke-virtual/range {v8 .. v15}, LDg/l0;->b(LDg/m0;FFZLVm/a;Lm0/l;I)V

    move-object v15, v14

    invoke-static {v15, v0}, LP2/z;->k(Lm0/l;I)V

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {v3, v2}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v12

    const v5, 0x58a8cdc5

    invoke-virtual {v15, v5}, Lm0/q;->f0(I)V

    const/16 v5, 0x800

    if-ne v1, v5, :cond_13

    move v1, v4

    goto :goto_10

    :cond_13
    move v1, v0

    :goto_10
    invoke-virtual {v15}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v5

    if-nez v1, :cond_14

    if-ne v5, v6, :cond_15

    :cond_14
    new-instance v5, LAe/O;

    const/16 v1, 0x14

    invoke-direct {v5, v1, v7}, LAe/O;-><init>(ILVm/k;)V

    invoke-virtual {v15, v5}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_15
    move-object v13, v5

    check-cast v13, LVm/a;

    invoke-virtual {v15, v0}, Lm0/q;->q(Z)V

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v9, 0x0

    move-object v14, v15

    const/high16 v15, 0x30000

    invoke-virtual/range {v8 .. v15}, LDg/l0;->a(LDg/m0;FFZLVm/a;Lm0/l;I)V

    move-object v15, v14

    invoke-virtual {v15, v4}, Lm0/q;->q(Z)V

    invoke-virtual {v15, v4}, Lm0/q;->q(Z)V

    invoke-static {v3, v2}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    new-instance v1, LBg/I;

    const/4 v2, 0x0

    move-object/from16 v6, p5

    invoke-direct {v1, v6, v2}, LBg/I;-><init>(Lu0/d;I)V

    const v2, -0x3263c860

    invoke-static {v2, v1, v15}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v14

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const v16, 0x180006

    const/16 v17, 0x1e

    move-object/from16 v8, v18

    invoke-static/range {v8 .. v17}, Lv/d;->b(LG/C;ZLA0/r;Lv/c0;Lv/d0;Ljava/lang/String;Lu0/d;Lm0/l;II)V

    invoke-static {v15, v0}, LP2/z;->M(Lm0/l;I)V

    invoke-virtual {v15, v4}, Lm0/q;->q(Z)V

    move/from16 v5, v19

    :goto_11
    invoke-virtual {v15}, Lm0/q;->u()Lm0/t0;

    move-result-object v9

    if-eqz v9, :cond_16

    new-instance v0, LBg/t;

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v8, p8

    move-object v4, v7

    move/from16 v7, p7

    invoke-direct/range {v0 .. v8}, LBg/t;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;LVm/k;ZLu0/d;II)V

    iput-object v0, v9, Lm0/t0;->d:LVm/n;

    :cond_16
    return-void
.end method

.method public static final E(Ljava/lang/String;Ljava/time/Instant;LGa/s;Lan/h;LVm/k;Lm0/l;I)V
    .locals 23

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v13, p5

    check-cast v13, Lm0/q;

    const v0, 0x418ff4c2

    invoke-virtual {v13, v0}, Lm0/q;->h0(I)Lm0/q;

    move-object/from16 v11, p0

    invoke-virtual {v13, v11}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int v0, p6, v0

    invoke-virtual {v13, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x20

    goto :goto_1

    :cond_1
    const/16 v1, 0x10

    :goto_1
    or-int/2addr v0, v1

    invoke-virtual {v13, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x100

    goto :goto_2

    :cond_2
    const/16 v1, 0x80

    :goto_2
    or-int/2addr v0, v1

    invoke-virtual {v13, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/16 v1, 0x800

    goto :goto_3

    :cond_3
    const/16 v1, 0x400

    :goto_3
    or-int/2addr v0, v1

    invoke-virtual {v13, v5}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const/16 v1, 0x4000

    goto :goto_4

    :cond_4
    const/16 v1, 0x2000

    :goto_4
    or-int/2addr v0, v1

    and-int/lit16 v1, v0, 0x2493

    const/16 v7, 0x2492

    if-ne v1, v7, :cond_6

    invoke-virtual {v13}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_5

    goto :goto_5

    :cond_5
    invoke-virtual {v13}, Lm0/q;->Y()V

    goto/16 :goto_e

    :cond_6
    :goto_5
    invoke-static {}, Ljava/time/ZoneId;->systemDefault()Ljava/time/ZoneId;

    move-result-object v1

    sget-object v7, LA0/o;->a:LA0/o;

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-static {v7, v8}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v9

    sget-object v10, LG/l;->c:LG/f;

    sget-object v12, LA0/d;->m:LA0/g;

    const/4 v14, 0x0

    invoke-static {v10, v12, v13, v14}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v10

    move-object v12, v7

    iget-wide v6, v13, Lm0/q;->T:J

    invoke-static {v6, v7}, Ljava/lang/Long;->hashCode(J)I

    move-result v6

    invoke-virtual {v13}, Lm0/q;->m()Lm0/o0;

    move-result-object v7

    invoke-static {v9, v13}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v9

    sget-object v15, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v15, LZ0/g;->b:LZ0/f;

    invoke-virtual {v13}, Lm0/q;->j0()V

    iget-boolean v8, v13, Lm0/q;->S:Z

    if-eqz v8, :cond_7

    invoke-virtual {v13, v15}, Lm0/q;->l(LVm/a;)V

    goto :goto_6

    :cond_7
    invoke-virtual {v13}, Lm0/q;->t0()V

    :goto_6
    sget-object v8, LZ0/g;->f:LZ0/e;

    invoke-static {v8, v10, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v8, LZ0/g;->e:LZ0/e;

    invoke-static {v8, v7, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    sget-object v7, LZ0/g;->g:LZ0/e;

    invoke-static {v13, v6, v7}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v6, LZ0/g;->h:LZ0/d;

    invoke-static {v13, v6}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v6, LZ0/g;->d:LZ0/e;

    invoke-static {v6, v9, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v6, Lg8/h0;->a:Lg8/h0;

    and-int/lit8 v7, v0, 0xe

    move v8, v14

    const/4 v14, 0x0

    move-object v9, v12

    const/4 v12, 0x0

    const/4 v10, 0x0

    move-object v15, v9

    const/4 v9, 0x0

    move-object/from16 v17, v15

    const/4 v15, 0x0

    move/from16 v18, v8

    const/16 v8, 0x7e

    move/from16 v19, v0

    move-object/from16 p5, v1

    move-object/from16 v22, v17

    move/from16 v0, v18

    const/16 v1, 0x4000

    invoke-virtual/range {v6 .. v15}, Lg8/h0;->a(IILA0/r;LH0/w;Ljava/lang/String;Lk1/U;Lm0/l;Lv1/k;Z)V

    invoke-static {v13, v0}, LP2/z;->S(Lm0/l;I)V

    const v7, 0x7f120aed

    invoke-static {v13, v7}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v11

    invoke-static {v13}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v7

    iget-object v7, v7, Lhh/h;->k:Lhh/v;

    iget-wide v7, v7, Lhh/v;->d:J

    new-instance v10, LH0/w;

    invoke-direct {v10, v7, v8}, LH0/w;-><init>(J)V

    const/4 v12, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    const/4 v15, 0x0

    const/4 v14, 0x0

    const/16 v8, 0x7c

    invoke-virtual/range {v6 .. v15}, Lg8/h0;->a(IILA0/r;LH0/w;Ljava/lang/String;Lk1/U;Lm0/l;Lv1/k;Z)V

    invoke-static {v13, v0}, LP2/z;->Q(Lm0/l;I)V

    const/4 v14, 0x1

    if-nez v4, :cond_8

    const v1, -0xf2f1576

    invoke-virtual {v13, v1}, Lm0/q;->f0(I)V

    invoke-virtual {v13, v0}, Lm0/q;->q(Z)V

    move v1, v14

    goto/16 :goto_d

    :cond_8
    sget-object v6, LOg/e;->d:LOg/e;

    sget-object v7, Lm0/k;->a:Lm0/e;

    const v8, 0xe000

    if-nez v2, :cond_c

    const v9, -0xf2f0f14

    invoke-virtual {v13, v9}, Lm0/q;->f0(I)V

    const v9, 0x7f12036e

    invoke-static {v13, v9}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v9

    const v10, -0xf2f00d8

    invoke-virtual {v13, v10}, Lm0/q;->f0(I)V

    and-int v8, v19, v8

    if-ne v8, v1, :cond_9

    move v1, v14

    goto :goto_7

    :cond_9
    move v1, v0

    :goto_7
    invoke-virtual {v13, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v8

    or-int/2addr v1, v8

    invoke-virtual {v13, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v8

    or-int/2addr v1, v8

    invoke-virtual {v13}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v8

    if-nez v1, :cond_a

    if-ne v8, v7, :cond_b

    :cond_a
    new-instance v8, LAe/o;

    const/4 v1, 0x5

    invoke-direct {v8, v5, v3, v4, v1}, LAe/o;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    invoke-virtual {v13, v8}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_b
    move-object/from16 v17, v8

    check-cast v17, LVm/a;

    invoke-virtual {v13, v0}, Lm0/q;->q(Z)V

    const/16 v16, 0x0

    const/16 v19, 0x0

    const/4 v7, 0x0

    move-object v8, v9

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object/from16 v18, v13

    const/4 v13, 0x0

    move v1, v14

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x7fd

    invoke-virtual/range {v6 .. v21}, LOg/e;->j(LA0/r;Ljava/lang/String;LH0/w;Ljava/lang/Integer;Lhh/n;Lhh/d;ZZLhh/e;LJg/b;LVm/a;Lm0/l;III)V

    move-object/from16 v13, v18

    invoke-virtual {v13, v0}, Lm0/q;->q(Z)V

    goto/16 :goto_d

    :cond_c
    move-object/from16 v20, v6

    move v6, v14

    const v9, 0x2951e3a6

    invoke-virtual {v13, v9}, Lm0/q;->f0(I)V

    move-object/from16 v9, v22

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-static {v9, v10}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v9

    move-object/from16 v10, p5

    invoke-static {v2, v10}, Ljava/time/LocalDateTime;->ofInstant(Ljava/time/Instant;Ljava/time/ZoneId;)Ljava/time/LocalDateTime;

    move-result-object v11

    const-string v12, "ofInstant(...)"

    invoke-static {v11, v12}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v14, v4, Lan/h;->a:Ljava/lang/Comparable;

    move-object v15, v14

    check-cast v15, Ljava/time/Instant;

    invoke-static {v15, v10}, Ljava/time/LocalDateTime;->ofInstant(Ljava/time/Instant;Ljava/time/ZoneId;)Ljava/time/LocalDateTime;

    move-result-object v15

    invoke-static {v15, v12}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    move/from16 p5, v8

    iget-object v8, v4, Lan/h;->b:Ljava/lang/Comparable;

    move-object v0, v8

    check-cast v0, Ljava/time/Instant;

    invoke-static {v0, v10}, Ljava/time/LocalDateTime;->ofInstant(Ljava/time/Instant;Ljava/time/ZoneId;)Ljava/time/LocalDateTime;

    move-result-object v0

    invoke-static {v0, v12}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v12, Lan/k;

    check-cast v14, Ljava/time/Instant;

    invoke-static {v14, v10}, Ljava/time/LocalDateTime;->ofInstant(Ljava/time/Instant;Ljava/time/ZoneId;)Ljava/time/LocalDateTime;

    move-result-object v14

    invoke-virtual {v14}, Ljava/time/LocalDateTime;->getYear()I

    move-result v14

    check-cast v8, Ljava/time/Instant;

    invoke-static {v8, v10}, Ljava/time/LocalDateTime;->ofInstant(Ljava/time/Instant;Ljava/time/ZoneId;)Ljava/time/LocalDateTime;

    move-result-object v8

    invoke-virtual {v8}, Ljava/time/LocalDateTime;->getYear()I

    move-result v8

    invoke-direct {v12, v14, v8, v6}, Lan/i;-><init>(III)V

    if-eqz v3, :cond_d

    iget-object v8, v3, LGa/s;->b:Lcom/eightsleep/data_core/enums/ClockSystem;

    goto :goto_8

    :cond_d
    const/4 v8, 0x0

    :goto_8
    if-nez v8, :cond_e

    const/4 v8, -0x1

    goto :goto_9

    :cond_e
    sget-object v14, LBg/J;->a:[I

    invoke-virtual {v8}, Ljava/lang/Enum;->ordinal()I

    move-result v8

    aget v8, v14, v8

    :goto_9
    if-ne v8, v6, :cond_f

    sget-object v8, LYl/V;->HOUR_24:LYl/V;

    goto :goto_a

    :cond_f
    sget-object v8, LYl/V;->AM_PM:LYl/V;

    :goto_a
    const v14, -0xf2e89ad

    invoke-virtual {v13, v14}, Lm0/q;->f0(I)V

    and-int v14, v19, p5

    if-ne v14, v1, :cond_10

    move/from16 v16, v6

    goto :goto_b

    :cond_10
    const/16 v16, 0x0

    :goto_b
    invoke-virtual {v13, v10}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v17

    or-int v16, v16, v17

    invoke-virtual {v13, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v17

    or-int v16, v16, v17

    invoke-virtual {v13}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v6

    if-nez v16, :cond_11

    if-ne v6, v7, :cond_12

    :cond_11
    new-instance v6, LBg/w;

    const/4 v1, 0x0

    invoke-direct {v6, v5, v10, v2, v1}, LBg/w;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    invoke-virtual {v13, v6}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_12
    move-object/from16 v16, v6

    check-cast v16, LVm/k;

    const/4 v1, 0x0

    invoke-virtual {v13, v1}, Lm0/q;->q(Z)V

    move-object v1, v7

    move-object v7, v11

    move-object v11, v8

    move-object v8, v15

    const/4 v15, 0x0

    const/16 v18, 0x6

    move-object v10, v12

    move-object/from16 v17, v13

    const/4 v6, 0x1

    const-wide/16 v12, 0x0

    move/from16 v19, v14

    const/4 v14, 0x0

    move/from16 v21, v19

    const/16 v19, 0x7c0

    move-object v6, v9

    move-object v9, v0

    move-object v0, v1

    move/from16 v1, v21

    invoke-static/range {v6 .. v19}, LIm/G;->m(LA0/r;Ljava/time/LocalDateTime;Ljava/time/LocalDateTime;Ljava/time/LocalDateTime;Lan/k;LYl/V;JILG/Q;LVm/k;Lm0/l;II)V

    move-object/from16 v13, v17

    const v6, 0x7f120357

    invoke-static {v13, v6}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v8

    const v6, -0xf2e64a3

    invoke-virtual {v13, v6}, Lm0/q;->f0(I)V

    const/16 v6, 0x4000

    if-ne v1, v6, :cond_13

    const/4 v14, 0x1

    goto :goto_c

    :cond_13
    const/4 v14, 0x0

    :goto_c
    invoke-virtual {v13}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v1

    if-nez v14, :cond_14

    if-ne v1, v0, :cond_15

    :cond_14
    new-instance v1, LAe/O;

    const/16 v0, 0x15

    invoke-direct {v1, v0, v5}, LAe/O;-><init>(ILVm/k;)V

    invoke-virtual {v13, v1}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_15
    move-object/from16 v17, v1

    check-cast v17, LVm/a;

    const/4 v0, 0x0

    invoke-virtual {v13, v0}, Lm0/q;->q(Z)V

    const/16 v16, 0x0

    const/16 v19, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object/from16 v18, v13

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v6, v20

    const/16 v20, 0x0

    const/16 v21, 0x7fd

    invoke-virtual/range {v6 .. v21}, LOg/e;->j(LA0/r;Ljava/lang/String;LH0/w;Ljava/lang/Integer;Lhh/n;Lhh/d;ZZLhh/e;LJg/b;LVm/a;Lm0/l;III)V

    move-object/from16 v13, v18

    const/4 v0, 0x0

    invoke-virtual {v13, v0}, Lm0/q;->q(Z)V

    const/4 v1, 0x1

    :goto_d
    invoke-virtual {v13, v1}, Lm0/q;->q(Z)V

    :goto_e
    invoke-virtual {v13}, Lm0/q;->u()Lm0/t0;

    move-result-object v8

    if-eqz v8, :cond_16

    new-instance v0, LAe/t;

    const/4 v7, 0x2

    move-object/from16 v1, p0

    move/from16 v6, p6

    invoke-direct/range {v0 .. v7}, LAe/t;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Comparable;Ljava/lang/Object;LVm/k;II)V

    iput-object v0, v8, Lm0/t0;->d:LVm/n;

    :cond_16
    return-void
.end method

.method public static final F(Lcom/squareup/moshi/Moshi;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/squareup/moshi/Moshi;->adapter(Ljava/lang/Class;)Lcom/squareup/moshi/JsonAdapter;

    move-result-object p0

    invoke-virtual {p0, p2}, Lcom/squareup/moshi/JsonAdapter;->fromJson(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    sget-object p1, Ltimber/log/Timber;->a:Lbr/a;

    invoke-virtual {p1, p0}, Lbr/a;->e(Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static final G(LI5/e;LT0/r;J)V
    .locals 17

    move-object/from16 v0, p1

    move-wide/from16 v1, p2

    move-object/from16 v3, p0

    iget-object v3, v3, LI5/e;->b:Ljava/lang/Object;

    check-cast v3, LU0/b;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, LT0/q;->b(LT0/r;)Z

    move-result v4

    const-wide/16 v5, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    iget-object v9, v3, LU0/b;->c:Ljava/lang/Object;

    check-cast v9, LC7/c;

    iget-object v10, v3, LU0/b;->b:Ljava/lang/Object;

    check-cast v10, LC7/c;

    if-eqz v4, :cond_0

    iget-object v4, v10, LC7/c;->e:Ljava/lang/Object;

    check-cast v4, [LU0/a;

    invoke-static {v4, v7}, LIm/n;->g0([Ljava/lang/Object;LCo/s;)V

    iput v8, v10, LC7/c;->c:I

    iget-object v4, v9, LC7/c;->e:Ljava/lang/Object;

    check-cast v4, [LU0/a;

    invoke-static {v4, v7}, LIm/n;->g0([Ljava/lang/Object;LCo/s;)V

    iput v8, v9, LC7/c;->c:I

    iput-wide v5, v3, LU0/b;->a:J

    :cond_0
    invoke-static {v0}, LT0/q;->d(LT0/r;)Z

    move-result v4

    iget-wide v11, v0, LT0/r;->b:J

    if-nez v4, :cond_3

    iget-object v4, v0, LT0/r;->k:Ljava/util/ArrayList;

    if-nez v4, :cond_1

    sget-object v4, LIm/z;->a:LIm/z;

    :cond_1
    invoke-interface {v4}, Ljava/util/Collection;->size()I

    move-result v13

    move v14, v8

    :goto_0
    if-ge v14, v13, :cond_2

    invoke-interface {v4, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, LT0/b;

    iget-wide v5, v15, LT0/b;->a:J

    move-object/from16 v16, v9

    iget-wide v8, v15, LT0/b;->c:J

    invoke-static {v8, v9, v1, v2}, LG0/b;->j(JJ)J

    move-result-wide v8

    invoke-virtual {v3, v5, v6, v8, v9}, LU0/b;->a(JJ)V

    add-int/lit8 v14, v14, 0x1

    move-object/from16 v9, v16

    const-wide/16 v5, 0x0

    const/4 v8, 0x0

    goto :goto_0

    :cond_2
    move-object/from16 v16, v9

    iget-wide v4, v0, LT0/r;->l:J

    invoke-static {v4, v5, v1, v2}, LG0/b;->j(JJ)J

    move-result-wide v1

    invoke-virtual {v3, v11, v12, v1, v2}, LU0/b;->a(JJ)V

    goto :goto_1

    :cond_3
    move-object/from16 v16, v9

    :goto_1
    invoke-static {v0}, LT0/q;->d(LT0/r;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-wide v0, v3, LU0/b;->a:J

    sub-long v0, v11, v0

    const-wide/16 v4, 0x28

    cmp-long v0, v0, v4

    if-lez v0, :cond_4

    iget-object v0, v10, LC7/c;->e:Ljava/lang/Object;

    check-cast v0, [LU0/a;

    invoke-static {v0, v7}, LIm/n;->g0([Ljava/lang/Object;LCo/s;)V

    const/4 v0, 0x0

    iput v0, v10, LC7/c;->c:I

    move-object/from16 v9, v16

    iget-object v1, v9, LC7/c;->e:Ljava/lang/Object;

    check-cast v1, [LU0/a;

    invoke-static {v1, v7}, LIm/n;->g0([Ljava/lang/Object;LCo/s;)V

    iput v0, v9, LC7/c;->c:I

    const-wide/16 v0, 0x0

    iput-wide v0, v3, LU0/b;->a:J

    :cond_4
    iput-wide v11, v3, LU0/b;->a:J

    return-void
.end method

.method public static final H(ILjava/lang/String;)V
    .locals 2

    invoke-virtual {p1, p0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2d

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    const-string v0, "Expected \'-\' (hyphen) at index "

    const-string v1, ", but was \'"

    invoke-static {p0, v0, v1}, Lr4/K;->u(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1, p0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 p0, 0x27

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static I(JLjava/lang/String;)V
    .locals 2

    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-ltz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " ("

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, ") must be >= 0"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static J([[S)[[S
    .locals 3

    array-length v0, p0

    new-array v0, v0, [[S

    const/4 v1, 0x0

    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_1

    aget-object v2, p0, v1

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_1

    :cond_0
    invoke-virtual {v2}, [S->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [S

    :goto_1
    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public static K([[[S)[[[S
    .locals 6

    array-length v0, p0

    const/4 v1, 0x0

    aget-object v2, p0, v1

    array-length v2, v2

    const/4 v3, 0x2

    new-array v3, v3, [I

    const/4 v4, 0x1

    aput v2, v3, v4

    aput v0, v3, v1

    const-class v0, [S

    invoke-static {v0, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[[S

    move v2, v1

    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_2

    move v3, v1

    :goto_1
    aget-object v4, p0, v1

    array-length v4, v4

    if-ge v3, v4, :cond_1

    aget-object v4, v0, v2

    aget-object v5, p0, v2

    aget-object v5, v5, v3

    if-nez v5, :cond_0

    const/4 v5, 0x0

    goto :goto_2

    :cond_0
    invoke-virtual {v5}, [S->clone()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [S

    :goto_2
    aput-object v5, v4, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method public static final L(Lln/h;Lln/h;)Lln/h;
    .locals 3

    const-string v0, "first"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "second"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p0}, Lln/h;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p1

    :cond_0
    invoke-interface {p1}, Lln/h;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    return-object p0

    :cond_1
    new-instance v0, Lln/i;

    const/4 v1, 0x2

    new-array v1, v1, [Lln/h;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    const/4 p0, 0x1

    aput-object p1, v1, p0

    invoke-direct {v0, v1}, Lln/i;-><init>([Lln/h;)V

    return-object v0
.end method

.method public static M([BILA3/Z;)I
    .locals 2

    invoke-static {p0, p1, p2}, Lio/sentry/config/a;->U([BILA3/Z;)I

    move-result p1

    iget v0, p2, LA3/Z;->a:I

    if-ltz v0, :cond_2

    array-length v1, p0

    sub-int/2addr v1, p1

    if-gt v0, v1, :cond_1

    if-nez v0, :cond_0

    sget-object p0, Lcom/google/crypto/tink/shaded/protobuf/h;->b:Lcom/google/crypto/tink/shaded/protobuf/g;

    iput-object p0, p2, LA3/Z;->c:Ljava/lang/Object;

    return p1

    :cond_0
    invoke-static {p0, p1, v0}, Lcom/google/crypto/tink/shaded/protobuf/h;->g([BII)Lcom/google/crypto/tink/shaded/protobuf/g;

    move-result-object p0

    iput-object p0, p2, LA3/Z;->c:Ljava/lang/Object;

    add-int/2addr p1, v0

    return p1

    :cond_1
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->g()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    throw p0

    :cond_2
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->e()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    throw p0
.end method

.method public static N(I[B)I
    .locals 2

    aget-byte v0, p1, p0

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v1, p0, 0x1

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    add-int/lit8 v1, p0, 0x2

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    add-int/lit8 p0, p0, 0x3

    aget-byte p0, p1, p0

    and-int/lit16 p0, p0, 0xff

    shl-int/lit8 p0, p0, 0x18

    or-int/2addr p0, v0

    return p0
.end method

.method public static O(I[B)J
    .locals 7

    aget-byte v0, p1, p0

    int-to-long v0, v0

    const-wide/16 v2, 0xff

    and-long/2addr v0, v2

    add-int/lit8 v4, p0, 0x1

    aget-byte v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x8

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p0, 0x2

    aget-byte v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x10

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p0, 0x3

    aget-byte v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x18

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p0, 0x4

    aget-byte v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x20

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p0, 0x5

    aget-byte v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x28

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p0, 0x6

    aget-byte v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x30

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 p0, p0, 0x7

    aget-byte p0, p1, p0

    int-to-long p0, p0

    and-long/2addr p0, v2

    const/16 v2, 0x38

    shl-long/2addr p0, v2

    or-long/2addr p0, v0

    return-wide p0
.end method

.method public static P(Lcom/google/crypto/tink/shaded/protobuf/f0;I[BIILcom/google/crypto/tink/shaded/protobuf/D;LA3/Z;)I
    .locals 7

    invoke-interface {p0}, Lcom/google/crypto/tink/shaded/protobuf/f0;->d()Ljava/lang/Object;

    move-result-object v0

    move-object v1, p0

    move-object v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p6

    invoke-static/range {v0 .. v5}, Lio/sentry/config/a;->l0(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/f0;[BIILA3/Z;)I

    move-result p0

    invoke-interface {v1, v0}, Lcom/google/crypto/tink/shaded/protobuf/f0;->b(Ljava/lang/Object;)V

    iput-object v0, v5, LA3/Z;->c:Ljava/lang/Object;

    invoke-interface {p5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_0
    if-ge p0, v4, :cond_1

    move-object v6, v5

    move v5, v4

    invoke-static {v2, p0, v6}, Lio/sentry/config/a;->U([BILA3/Z;)I

    move-result v4

    iget p2, v6, LA3/Z;->a:I

    if-eq p1, p2, :cond_0

    goto :goto_1

    :cond_0
    move-object v3, v2

    move-object v2, v1

    invoke-interface {v2}, Lcom/google/crypto/tink/shaded/protobuf/f0;->d()Ljava/lang/Object;

    move-result-object v1

    invoke-static/range {v1 .. v6}, Lio/sentry/config/a;->l0(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/f0;[BIILA3/Z;)I

    move-result p0

    move-object p2, v1

    move-object v1, v2

    move-object v2, v3

    move v4, v5

    move-object v5, v6

    invoke-interface {v1, p2}, Lcom/google/crypto/tink/shaded/protobuf/f0;->b(Ljava/lang/Object;)V

    iput-object p2, v5, LA3/Z;->c:Ljava/lang/Object;

    invoke-interface {p5, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    :goto_1
    return p0
.end method

.method public static Q([BILA3/Z;)I
    .locals 3

    invoke-static {p0, p1, p2}, Lio/sentry/config/a;->U([BILA3/Z;)I

    move-result p1

    iget v0, p2, LA3/Z;->a:I

    if-ltz v0, :cond_1

    if-nez v0, :cond_0

    const-string p0, ""

    iput-object p0, p2, LA3/Z;->c:Ljava/lang/Object;

    return p1

    :cond_0
    new-instance v1, Ljava/lang/String;

    sget-object v2, Lcom/google/crypto/tink/shaded/protobuf/E;->a:Ljava/nio/charset/Charset;

    invoke-direct {v1, p0, p1, v0, v2}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    iput-object v1, p2, LA3/Z;->c:Ljava/lang/Object;

    add-int/2addr p1, v0

    return p1

    :cond_1
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->e()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    throw p0
.end method

.method public static R([BILA3/Z;)I
    .locals 2

    invoke-static {p0, p1, p2}, Lio/sentry/config/a;->U([BILA3/Z;)I

    move-result p1

    iget v0, p2, LA3/Z;->a:I

    if-ltz v0, :cond_1

    if-nez v0, :cond_0

    const-string p0, ""

    iput-object p0, p2, LA3/Z;->c:Ljava/lang/Object;

    return p1

    :cond_0
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/u0;->a:Loe/y;

    invoke-virtual {v1, p0, p1, v0}, Loe/y;->w([BII)Ljava/lang/String;

    move-result-object p0

    iput-object p0, p2, LA3/Z;->c:Ljava/lang/Object;

    add-int/2addr p1, v0

    return p1

    :cond_1
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->e()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    throw p0
.end method

.method public static S(I[BIILcom/google/crypto/tink/shaded/protobuf/i0;LA3/Z;)I
    .locals 7

    ushr-int/lit8 v0, p0, 0x3

    if-eqz v0, :cond_b

    and-int/lit8 v0, p0, 0x7

    if-eqz v0, :cond_a

    const/4 v1, 0x1

    if-eq v0, v1, :cond_9

    const/4 v1, 0x2

    if-eq v0, v1, :cond_5

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    const/4 p3, 0x5

    if-ne v0, p3, :cond_0

    invoke-static {p2, p1}, Lio/sentry/config/a;->N(I[B)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p4, p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->d(ILjava/lang/Object;)V

    add-int/lit8 p2, p2, 0x4

    return p2

    :cond_0
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->a()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    throw p0

    :cond_1
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/i0;->c()Lcom/google/crypto/tink/shaded/protobuf/i0;

    move-result-object v4

    and-int/lit8 v0, p0, -0x8

    or-int/lit8 v6, v0, 0x4

    const/4 v0, 0x0

    :goto_0
    if-ge p2, p3, :cond_2

    invoke-static {p1, p2, p5}, Lio/sentry/config/a;->U([BILA3/Z;)I

    move-result v2

    iget v0, p5, LA3/Z;->a:I

    if-ne v0, v6, :cond_3

    move p2, v2

    :cond_2
    move v3, p3

    goto :goto_1

    :cond_3
    move-object v1, p1

    move v3, p3

    move-object v5, p5

    invoke-static/range {v0 .. v5}, Lio/sentry/config/a;->S(I[BIILcom/google/crypto/tink/shaded/protobuf/i0;LA3/Z;)I

    move-result p2

    goto :goto_0

    :goto_1
    if-gt p2, v3, :cond_4

    if-ne v0, v6, :cond_4

    invoke-virtual {p4, p0, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->d(ILjava/lang/Object;)V

    return p2

    :cond_4
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->f()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    throw p0

    :cond_5
    move-object v1, p1

    move-object v5, p5

    invoke-static {v1, p2, v5}, Lio/sentry/config/a;->U([BILA3/Z;)I

    move-result p1

    iget p2, v5, LA3/Z;->a:I

    if-ltz p2, :cond_8

    array-length p3, v1

    sub-int/2addr p3, p1

    if-gt p2, p3, :cond_7

    if-nez p2, :cond_6

    sget-object p3, Lcom/google/crypto/tink/shaded/protobuf/h;->b:Lcom/google/crypto/tink/shaded/protobuf/g;

    invoke-virtual {p4, p0, p3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->d(ILjava/lang/Object;)V

    goto :goto_2

    :cond_6
    invoke-static {v1, p1, p2}, Lcom/google/crypto/tink/shaded/protobuf/h;->g([BII)Lcom/google/crypto/tink/shaded/protobuf/g;

    move-result-object p3

    invoke-virtual {p4, p0, p3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->d(ILjava/lang/Object;)V

    :goto_2
    add-int/2addr p1, p2

    return p1

    :cond_7
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->g()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    throw p0

    :cond_8
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->e()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    throw p0

    :cond_9
    move-object v1, p1

    invoke-static {p2, v1}, Lio/sentry/config/a;->O(I[B)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p4, p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->d(ILjava/lang/Object;)V

    add-int/lit8 p2, p2, 0x8

    return p2

    :cond_a
    move-object v1, p1

    move-object v5, p5

    invoke-static {v1, p2, v5}, Lio/sentry/config/a;->W([BILA3/Z;)I

    move-result p1

    iget-wide p2, v5, LA3/Z;->b:J

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {p4, p0, p2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->d(ILjava/lang/Object;)V

    return p1

    :cond_b
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->a()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    throw p0
.end method

.method public static T(I[BILA3/Z;)I
    .locals 2

    and-int/lit8 p0, p0, 0x7f

    add-int/lit8 v0, p2, 0x1

    aget-byte v1, p1, p2

    if-ltz v1, :cond_0

    shl-int/lit8 p1, v1, 0x7

    or-int/2addr p0, p1

    iput p0, p3, LA3/Z;->a:I

    return v0

    :cond_0
    and-int/lit8 v1, v1, 0x7f

    shl-int/lit8 v1, v1, 0x7

    or-int/2addr p0, v1

    add-int/lit8 v1, p2, 0x2

    aget-byte v0, p1, v0

    if-ltz v0, :cond_1

    shl-int/lit8 p1, v0, 0xe

    or-int/2addr p0, p1

    iput p0, p3, LA3/Z;->a:I

    return v1

    :cond_1
    and-int/lit8 v0, v0, 0x7f

    shl-int/lit8 v0, v0, 0xe

    or-int/2addr p0, v0

    add-int/lit8 v0, p2, 0x3

    aget-byte v1, p1, v1

    if-ltz v1, :cond_2

    shl-int/lit8 p1, v1, 0x15

    or-int/2addr p0, p1

    iput p0, p3, LA3/Z;->a:I

    return v0

    :cond_2
    and-int/lit8 v1, v1, 0x7f

    shl-int/lit8 v1, v1, 0x15

    or-int/2addr p0, v1

    add-int/lit8 p2, p2, 0x4

    aget-byte v0, p1, v0

    if-ltz v0, :cond_3

    shl-int/lit8 p1, v0, 0x1c

    or-int/2addr p0, p1

    iput p0, p3, LA3/Z;->a:I

    return p2

    :cond_3
    and-int/lit8 v0, v0, 0x7f

    shl-int/lit8 v0, v0, 0x1c

    or-int/2addr p0, v0

    :goto_0
    add-int/lit8 v0, p2, 0x1

    aget-byte p2, p1, p2

    if-gez p2, :cond_4

    move p2, v0

    goto :goto_0

    :cond_4
    iput p0, p3, LA3/Z;->a:I

    return v0
.end method

.method public static U([BILA3/Z;)I
    .locals 1

    add-int/lit8 v0, p1, 0x1

    aget-byte p1, p0, p1

    if-ltz p1, :cond_0

    iput p1, p2, LA3/Z;->a:I

    return v0

    :cond_0
    invoke-static {p1, p0, v0, p2}, Lio/sentry/config/a;->T(I[BILA3/Z;)I

    move-result p0

    return p0
.end method

.method public static V(I[BIILcom/google/crypto/tink/shaded/protobuf/D;LA3/Z;)I
    .locals 2

    check-cast p4, Lcom/google/crypto/tink/shaded/protobuf/A;

    invoke-static {p1, p2, p5}, Lio/sentry/config/a;->U([BILA3/Z;)I

    move-result p2

    iget v0, p5, LA3/Z;->a:I

    invoke-virtual {p4, v0}, Lcom/google/crypto/tink/shaded/protobuf/A;->f(I)V

    :goto_0
    if-ge p2, p3, :cond_1

    invoke-static {p1, p2, p5}, Lio/sentry/config/a;->U([BILA3/Z;)I

    move-result v0

    iget v1, p5, LA3/Z;->a:I

    if-eq p0, v1, :cond_0

    goto :goto_1

    :cond_0
    invoke-static {p1, v0, p5}, Lio/sentry/config/a;->U([BILA3/Z;)I

    move-result p2

    iget v0, p5, LA3/Z;->a:I

    invoke-virtual {p4, v0}, Lcom/google/crypto/tink/shaded/protobuf/A;->f(I)V

    goto :goto_0

    :cond_1
    :goto_1
    return p2
.end method

.method public static W([BILA3/Z;)I
    .locals 9

    add-int/lit8 v0, p1, 0x1

    aget-byte v1, p0, p1

    int-to-long v1, v1

    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-ltz v3, :cond_0

    iput-wide v1, p2, LA3/Z;->b:J

    return v0

    :cond_0
    const-wide/16 v3, 0x7f

    and-long/2addr v1, v3

    add-int/lit8 p1, p1, 0x2

    aget-byte v0, p0, v0

    and-int/lit8 v3, v0, 0x7f

    int-to-long v3, v3

    const/4 v5, 0x7

    shl-long/2addr v3, v5

    or-long/2addr v1, v3

    move v3, v5

    :goto_0
    if-gez v0, :cond_1

    add-int/lit8 v0, p1, 0x1

    aget-byte p1, p0, p1

    add-int/2addr v3, v5

    and-int/lit8 v4, p1, 0x7f

    int-to-long v6, v4

    shl-long/2addr v6, v3

    or-long/2addr v1, v6

    move v8, v0

    move v0, p1

    move p1, v8

    goto :goto_0

    :cond_1
    iput-wide v1, p2, LA3/Z;->b:J

    return p1
.end method

.method public static final X([F[F)F
    .locals 5

    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    aget v3, p0, v2

    aget v4, p1, v2

    mul-float/2addr v3, v4

    add-float/2addr v1, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return v1
.end method

.method public static Y(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0

    if-eq p0, p1, :cond_1

    if-eqz p0, :cond_0

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public static final Z(J[BIII)V
    .locals 4

    rsub-int/lit8 p4, p4, 0x7

    rsub-int/lit8 p5, p5, 0x8

    if-gt p5, p4, :cond_0

    :goto_0
    shl-int/lit8 v0, p4, 0x3

    shr-long v0, p0, v0

    const-wide/16 v2, 0xff

    and-long/2addr v0, v2

    long-to-int v0, v0

    sget-object v1, Llo/d;->a:[I

    aget v0, v1, v0

    add-int/lit8 v1, p3, 0x1

    shr-int/lit8 v2, v0, 0x8

    int-to-byte v2, v2

    aput-byte v2, p2, p3

    add-int/lit8 p3, p3, 0x2

    int-to-byte v0, v0

    aput-byte v0, p2, v1

    if-eq p4, p5, :cond_0

    add-int/lit8 p4, p4, -0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static final a(Ljava/util/ArrayList;Lm0/l;I)V
    .locals 8

    const/4 v0, 0x2

    check-cast p1, Lm0/q;

    const v1, 0x6c6698bb

    invoke-virtual {p1, v1}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {p1, p0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x4

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    or-int/2addr v1, p2

    and-int/lit8 v1, v1, 0x3

    if-ne v1, v0, :cond_2

    invoke-virtual {p1}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {p1}, Lm0/q;->Y()V

    goto :goto_4

    :cond_2
    :goto_1
    sget-object v1, LG/l;->a:LG/d;

    invoke-static {p1}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v1

    iget v1, v1, Lhh/i;->b:F

    invoke-static {v1}, LG/l;->g(F)LG/j;

    move-result-object v1

    sget-object v2, LA0/o;->a:LA0/o;

    sget-object v3, LA0/d;->m:LA0/g;

    const/4 v4, 0x0

    invoke-static {v1, v3, p1, v4}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v1

    iget-wide v5, p1, Lm0/q;->T:J

    invoke-static {v5, v6}, Ljava/lang/Long;->hashCode(J)I

    move-result v3

    invoke-virtual {p1}, Lm0/q;->m()Lm0/o0;

    move-result-object v5

    invoke-static {v2, p1}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v2

    sget-object v6, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v6, LZ0/g;->b:LZ0/f;

    invoke-virtual {p1}, Lm0/q;->j0()V

    iget-boolean v7, p1, Lm0/q;->S:Z

    if-eqz v7, :cond_3

    invoke-virtual {p1, v6}, Lm0/q;->l(LVm/a;)V

    goto :goto_2

    :cond_3
    invoke-virtual {p1}, Lm0/q;->t0()V

    :goto_2
    sget-object v6, LZ0/g;->f:LZ0/e;

    invoke-static {v6, v1, p1}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v1, LZ0/g;->e:LZ0/e;

    invoke-static {v1, v5, p1}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v3, LZ0/g;->g:LZ0/e;

    invoke-static {p1, v1, v3}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v1, LZ0/g;->h:LZ0/d;

    invoke-static {p1, v1}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v1, LZ0/g;->d:LZ0/e;

    invoke-static {v1, v2, p1}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const v1, 0x437be721

    invoke-virtual {p1, v1}, Lm0/q;->f0(I)V

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, LFf/U;

    invoke-static {v2, p1, v4}, Lio/sentry/config/a;->b(LFf/U;Lm0/l;I)V

    goto :goto_3

    :cond_4
    invoke-virtual {p1, v4}, Lm0/q;->q(Z)V

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Lm0/q;->q(Z)V

    :goto_4
    invoke-virtual {p1}, Lm0/q;->u()Lm0/t0;

    move-result-object p1

    if-eqz p1, :cond_5

    new-instance v1, LPe/m;

    invoke-direct {v1, p0, p2, v0}, LPe/m;-><init>(Ljava/util/ArrayList;II)V

    iput-object v1, p1, Lm0/t0;->d:LVm/n;

    :cond_5
    return-void
.end method

.method public static a0(LC/N0;Lar/a;Z)Lar/c;
    .locals 2

    const-string v0, "orientation"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "padding"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Lar/b;->a:[I

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_1

    const/4 v1, 0x2

    if-ne p0, v1, :cond_0

    new-instance p0, Lar/c;

    iget v1, p1, Lar/a;->a:F

    iget p1, p1, Lar/a;->b:F

    invoke-direct {p0, v1, p1}, Lar/c;-><init>(FF)V

    goto :goto_0

    :cond_0
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0

    :cond_1
    new-instance p0, Lar/c;

    iget v1, p1, Lar/a;->c:F

    iget p1, p1, Lar/a;->d:F

    invoke-direct {p0, v1, p1}, Lar/c;-><init>(FF)V

    :goto_0
    if-ne p2, v0, :cond_2

    new-instance p1, Lar/c;

    iget p2, p0, Lar/c;->b:F

    iget p0, p0, Lar/c;->a:F

    invoke-direct {p1, p2, p0}, Lar/c;-><init>(FF)V

    return-object p1

    :cond_2
    if-nez p2, :cond_3

    return-object p0

    :cond_3
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0
.end method

.method public static final b(LFf/U;Lm0/l;I)V
    .locals 40

    move-object/from16 v0, p0

    move-object/from16 v12, p1

    check-cast v12, Lm0/q;

    const v2, 0x793cb911

    invoke-virtual {v12, v2}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v12, v0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x2

    if-eqz v2, :cond_0

    const/4 v2, 0x4

    goto :goto_0

    :cond_0
    move v2, v3

    :goto_0
    or-int v2, p2, v2

    and-int/lit8 v2, v2, 0x3

    if-ne v2, v3, :cond_2

    invoke-virtual {v12}, Lm0/q;->H()Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v12}, Lm0/q;->Y()V

    move-object v1, v0

    move-object v13, v12

    goto/16 :goto_7

    :cond_2
    :goto_1
    sget-object v2, LA0/o;->a:LA0/o;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v2, v3}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v4

    invoke-static {v12}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v5

    iget v5, v5, Lhh/i;->d:F

    invoke-static {v5}, LO/e;->b(F)LO/d;

    move-result-object v5

    invoke-static {v4, v5}, LE0/i;->c(LA0/r;LH0/X;)LA0/r;

    move-result-object v4

    invoke-static {v12}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v5

    iget-object v5, v5, Lhh/h;->d:Lhh/g;

    iget-wide v5, v5, Lhh/g;->d:J

    sget-object v7, LH0/F;->b:LH0/S;

    invoke-static {v4, v5, v6, v7}, Ly/x;->g(LA0/r;JLH0/X;)LA0/r;

    move-result-object v4

    invoke-static {v12}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v5

    iget v5, v5, Lhh/i;->c:F

    invoke-static {v4, v5}, LG/e;->H(LA0/r;F)LA0/r;

    move-result-object v4

    sget-object v5, LA0/d;->k:LA0/h;

    sget-object v6, LG/l;->a:LG/d;

    const/16 v8, 0x30

    invoke-static {v6, v5, v12, v8}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v9

    iget-wide v10, v12, Lm0/q;->T:J

    invoke-static {v10, v11}, Ljava/lang/Long;->hashCode(J)I

    move-result v10

    invoke-virtual {v12}, Lm0/q;->m()Lm0/o0;

    move-result-object v11

    invoke-static {v4, v12}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v4

    sget-object v13, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v13, LZ0/g;->b:LZ0/f;

    invoke-virtual {v12}, Lm0/q;->j0()V

    iget-boolean v14, v12, Lm0/q;->S:Z

    if-eqz v14, :cond_3

    invoke-virtual {v12, v13}, Lm0/q;->l(LVm/a;)V

    goto :goto_2

    :cond_3
    invoke-virtual {v12}, Lm0/q;->t0()V

    :goto_2
    sget-object v14, LZ0/g;->f:LZ0/e;

    invoke-static {v14, v9, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v9, LZ0/g;->e:LZ0/e;

    invoke-static {v9, v11, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    sget-object v11, LZ0/g;->g:LZ0/e;

    invoke-static {v12, v10, v11}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v10, LZ0/g;->h:LZ0/d;

    invoke-static {v12, v10}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v15, LZ0/g;->d:LZ0/e;

    invoke-static {v15, v4, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    iget-object v4, v0, LFf/U;->a:Ljava/lang/String;

    invoke-static {v12}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v3

    iget v3, v3, Lhh/i;->g:F

    invoke-static {v2, v3}, Landroidx/compose/foundation/layout/b;->n(LA0/r;F)LA0/r;

    move-result-object v3

    invoke-static {v12}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v8

    iget v8, v8, Lhh/i;->b:F

    invoke-static {v8}, LO/e;->b(F)LO/d;

    move-result-object v8

    invoke-static {v3, v8}, LE0/i;->c(LA0/r;LH0/X;)LA0/r;

    move-result-object v3

    move-object v8, v13

    move-object v13, v12

    const/4 v12, 0x0

    move-object/from16 v17, v14

    const/4 v14, 0x0

    move-object/from16 v18, v2

    move-object v2, v4

    move-object v4, v3

    iget-object v3, v0, LFf/U;->b:Ljava/lang/String;

    move-object/from16 v19, v5

    const/4 v5, 0x0

    move-object/from16 v20, v6

    const/4 v6, 0x0

    move-object/from16 v21, v7

    const/4 v7, 0x0

    move-object/from16 v22, v8

    const/4 v8, 0x0

    move-object/from16 v23, v9

    const/4 v9, 0x0

    move-object/from16 v24, v10

    const/4 v10, 0x0

    move-object/from16 v25, v11

    const/4 v11, 0x0

    move-object/from16 v26, v15

    const/4 v15, 0x0

    const/16 v27, 0x30

    const/16 v16, 0x7f8

    move-object/from16 v32, v17

    move-object/from16 v29, v19

    move-object/from16 v30, v20

    move-object/from16 v28, v21

    move-object/from16 v31, v22

    move-object/from16 v33, v23

    move-object/from16 v35, v24

    move-object/from16 v34, v25

    move-object/from16 v36, v26

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static/range {v2 .. v16}, Lcoil3/compose/SingletonAsyncImageKt;->AsyncImage-10Xjiaw(Ljava/lang/Object;Ljava/lang/String;LA0/r;LVm/k;LVm/k;LA0/e;LX0/q;FLH0/x;IZLm0/l;III)V

    invoke-static {v13, v14}, LP2/z;->k(Lm0/l;I)V

    float-to-double v2, v1

    const-wide/16 v4, 0x0

    cmpl-double v2, v2, v4

    if-lez v2, :cond_4

    goto :goto_3

    :cond_4
    const-string v2, "invalid weight; must be greater than zero"

    invoke-static {v2}, LH/a;->a(Ljava/lang/String;)V

    :goto_3
    new-instance v2, LG/x0;

    const/4 v15, 0x1

    invoke-direct {v2, v1, v15}, LG/x0;-><init>(FZ)V

    sget-object v1, LG/l;->c:LG/f;

    sget-object v3, LA0/d;->m:LA0/g;

    invoke-static {v1, v3, v13, v14}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v1

    iget-wide v3, v13, Lm0/q;->T:J

    invoke-static {v3, v4}, Ljava/lang/Long;->hashCode(J)I

    move-result v3

    invoke-virtual {v13}, Lm0/q;->m()Lm0/o0;

    move-result-object v4

    invoke-static {v2, v13}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v2

    invoke-virtual {v13}, Lm0/q;->j0()V

    iget-boolean v5, v13, Lm0/q;->S:Z

    if-eqz v5, :cond_5

    move-object/from16 v5, v31

    invoke-virtual {v13, v5}, Lm0/q;->l(LVm/a;)V

    :goto_4
    move-object/from16 v6, v32

    goto :goto_5

    :cond_5
    move-object/from16 v5, v31

    invoke-virtual {v13}, Lm0/q;->t0()V

    goto :goto_4

    :goto_5
    invoke-static {v6, v1, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object/from16 v1, v33

    invoke-static {v1, v4, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object/from16 v4, v34

    move-object/from16 v7, v35

    invoke-static {v3, v13, v4, v13, v7}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    move-object/from16 v3, v36

    invoke-static {v3, v2, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v2, Lih/h;->e:Lih/h;

    const/4 v9, 0x0

    const/4 v11, 0x0

    move-object/from16 v36, v3

    iget-object v3, v0, LFf/U;->b:Ljava/lang/String;

    move-object/from16 v34, v4

    const/4 v4, 0x0

    move-object/from16 v31, v5

    move-object/from16 v17, v6

    const-wide/16 v5, 0x0

    move-object/from16 v35, v7

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/16 v12, 0x3fe

    move-object v10, v13

    move-object/from16 v14, v17

    move-object/from16 v13, v31

    move-object/from16 v15, v34

    move-object/from16 v0, v35

    move-object/from16 v37, v36

    invoke-virtual/range {v2 .. v12}, Lih/h;->u(Ljava/lang/String;LA0/r;JZIILm0/l;II)V

    move-object v12, v10

    move-object/from16 v2, v29

    move-object/from16 v3, v30

    const/16 v4, 0x30

    invoke-static {v3, v2, v12, v4}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v2

    iget-wide v3, v12, Lm0/q;->T:J

    invoke-static {v3, v4}, Ljava/lang/Long;->hashCode(J)I

    move-result v3

    invoke-virtual {v12}, Lm0/q;->m()Lm0/o0;

    move-result-object v4

    move-object/from16 v5, v18

    invoke-static {v5, v12}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v6

    invoke-virtual {v12}, Lm0/q;->j0()V

    iget-boolean v7, v12, Lm0/q;->S:Z

    if-eqz v7, :cond_6

    invoke-virtual {v12, v13}, Lm0/q;->l(LVm/a;)V

    goto :goto_6

    :cond_6
    invoke-virtual {v12}, Lm0/q;->t0()V

    :goto_6
    invoke-static {v14, v2, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v1, v4, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v3, v12, v15, v12, v0}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    move-object/from16 v3, v37

    invoke-static {v3, v6, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v2, Lih/h;->b:Lih/h;

    invoke-static {v12}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v0

    iget-object v0, v0, Lhh/h;->k:Lhh/v;

    iget-wide v0, v0, Lhh/v;->d:J

    move-object/from16 v3, p0

    iget-object v4, v3, LFf/U;->c:Ljava/lang/String;

    const/4 v11, 0x0

    const/4 v13, 0x0

    move-object v3, v4

    const/4 v4, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v14, 0x0

    const/16 v15, 0x3f6

    move-wide/from16 v38, v0

    move-object v1, v5

    move-wide/from16 v5, v38

    const/4 v0, 0x0

    invoke-virtual/range {v2 .. v15}, Lih/h;->z(Ljava/lang/String;LA0/r;JIZIILVm/k;Lm0/l;III)V

    move-object v13, v12

    invoke-static {v13, v0}, LP2/z;->m(Lm0/l;I)V

    invoke-static {v13}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v3

    iget v3, v3, Lhh/i;->a:F

    invoke-static {v1, v3}, Landroidx/compose/foundation/layout/b;->n(LA0/r;F)LA0/r;

    move-result-object v1

    sget-object v3, LO/e;->a:LO/d;

    invoke-static {v1, v3}, LE0/i;->c(LA0/r;LH0/X;)LA0/r;

    move-result-object v1

    invoke-static {v13}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v3

    iget-object v3, v3, Lhh/h;->k:Lhh/v;

    iget-wide v3, v3, Lhh/v;->d:J

    move-object/from16 v5, v28

    invoke-static {v1, v3, v4, v5}, Ly/x;->g(LA0/r;JLH0/X;)LA0/r;

    move-result-object v1

    invoke-static {v1, v13, v0}, LG/t;->a(LA0/r;Lm0/l;I)V

    invoke-static {v13, v0}, LP2/z;->m(Lm0/l;I)V

    invoke-static {v13}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v1

    iget-object v1, v1, Lhh/h;->k:Lhh/v;

    iget-wide v5, v1, Lhh/v;->d:J

    const/4 v11, 0x0

    move-object v12, v13

    const/4 v13, 0x0

    move-object/from16 v1, p0

    iget-object v3, v1, LFf/U;->d:Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v14, 0x0

    const/16 v15, 0x3f6

    invoke-virtual/range {v2 .. v15}, Lih/h;->z(Ljava/lang/String;LA0/r;JIZIILVm/k;Lm0/l;III)V

    move-object v13, v12

    const/4 v2, 0x1

    invoke-virtual {v13, v2}, Lm0/q;->q(Z)V

    invoke-virtual {v13, v2}, Lm0/q;->q(Z)V

    iget-object v3, v1, LFf/U;->e:Ljava/lang/String;

    invoke-static {v3, v13, v0}, Lio/sentry/config/a;->C(Ljava/lang/String;Lm0/l;I)V

    invoke-virtual {v13, v2}, Lm0/q;->q(Z)V

    :goto_7
    invoke-virtual {v13}, Lm0/q;->u()Lm0/t0;

    move-result-object v0

    if-eqz v0, :cond_7

    new-instance v2, LWf/i0;

    const/4 v3, 0x1

    move/from16 v4, p2

    invoke-direct {v2, v1, v4, v3}, LWf/i0;-><init>(Ljava/lang/Object;II)V

    iput-object v2, v0, Lm0/t0;->d:LVm/n;

    :cond_7
    return-void
.end method

.method public static b0(Lcom/google/gson/o;)LD7/B;
    .locals 5

    const-string v0, "Unable to parse json into type Os"

    :try_start_0
    const-string v1, "build"

    invoke-virtual {p0, v1}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/google/gson/m;->k()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_2

    :catch_1
    move-exception p0

    goto :goto_3

    :catch_2
    move-exception p0

    goto :goto_4

    :cond_0
    move-object v1, v2

    :goto_0
    const-string v3, "name"

    invoke-virtual {p0, v3}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lcom/google/gson/m;->k()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    :cond_1
    move-object v3, v2

    :goto_1
    const-string v4, "version"

    invoke-virtual {p0, v4}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object p0

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Lcom/google/gson/m;->k()Ljava/lang/String;

    move-result-object v2

    :cond_2
    new-instance p0, LD7/B;

    invoke-direct {p0, v1, v3, v2}, LD7/B;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :goto_2
    new-instance v1, Lcom/google/gson/JsonParseException;

    invoke-direct {v1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :goto_3
    new-instance v1, Lcom/google/gson/JsonParseException;

    invoke-direct {v1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :goto_4
    new-instance v1, Lcom/google/gson/JsonParseException;

    invoke-direct {v1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static final c(LVm/a;Lu0/d;Lm0/l;I)V
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p3

    sget-object v3, LA0/o;->a:LA0/o;

    move-object/from16 v11, p2

    check-cast v11, Lm0/q;

    const v4, -0x5d6befe9

    invoke-virtual {v11, v4}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v4, v2, 0x6

    if-nez v4, :cond_1

    invoke-virtual {v11, v3}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v4, 0x4

    goto :goto_0

    :cond_0
    const/4 v4, 0x2

    :goto_0
    or-int/2addr v4, v2

    goto :goto_1

    :cond_1
    move v4, v2

    :goto_1
    and-int/lit8 v5, v2, 0x30

    const/16 v6, 0x20

    if-nez v5, :cond_3

    invoke-virtual {v11, v0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    move v5, v6

    goto :goto_2

    :cond_2
    const/16 v5, 0x10

    :goto_2
    or-int/2addr v4, v5

    :cond_3
    and-int/lit16 v5, v2, 0x180

    if-nez v5, :cond_5

    invoke-virtual {v11, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    const/16 v5, 0x100

    goto :goto_3

    :cond_4
    const/16 v5, 0x80

    :goto_3
    or-int/2addr v4, v5

    :cond_5
    and-int/lit16 v5, v4, 0x93

    const/16 v7, 0x92

    if-ne v5, v7, :cond_7

    invoke-virtual {v11}, Lm0/q;->H()Z

    move-result v5

    if-nez v5, :cond_6

    goto :goto_4

    :cond_6
    invoke-virtual {v11}, Lm0/q;->Y()V

    goto/16 :goto_7

    :cond_7
    :goto_4
    sget-object v5, Lg8/c;->a:LO/d;

    invoke-static {v3, v5}, LE0/i;->c(LA0/r;LH0/X;)LA0/r;

    move-result-object v12

    const/4 v3, 0x0

    const/4 v5, 0x1

    if-eqz v0, :cond_8

    move v13, v5

    goto :goto_5

    :cond_8
    move v13, v3

    :goto_5
    const v7, 0x102bac27

    invoke-virtual {v11, v7}, Lm0/q;->f0(I)V

    and-int/lit8 v4, v4, 0x70

    if-ne v4, v6, :cond_9

    goto :goto_6

    :cond_9
    move v5, v3

    :goto_6
    invoke-virtual {v11}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v4

    sget-object v6, Lm0/k;->a:Lm0/e;

    if-nez v5, :cond_a

    if-ne v4, v6, :cond_b

    :cond_a
    new-instance v4, LWf/k0;

    const/16 v5, 0x17

    invoke-direct {v4, v5, v0}, LWf/k0;-><init>(ILVm/a;)V

    invoke-virtual {v11, v4}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_b
    move-object/from16 v16, v4

    check-cast v16, LVm/a;

    invoke-virtual {v11, v3}, Lm0/q;->q(Z)V

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v17, 0xe

    invoke-static/range {v12 .. v17}, Landroidx/compose/foundation/b;->c(LA0/r;ZLjava/lang/String;Lh1/j;LVm/a;I)LA0/r;

    move-result-object v4

    invoke-static {v11}, Lhh/j;->c(Lm0/l;)Lme/u;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v5, Lme/u;->c:Lme/t;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v5, Lme/t;->b:Lme/m;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lme/m;->b()J

    move-result-wide v7

    new-instance v5, LH0/w;

    invoke-direct {v5, v7, v8}, LH0/w;-><init>(J)V

    invoke-static {v11}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v7

    iget-object v7, v7, Lhh/h;->a:Lhh/a;

    iget-wide v7, v7, Lhh/a;->a:J

    const/high16 v9, 0x3f000000    # 0.5f

    invoke-static {v7, v8, v9}, LH0/w;->b(JF)J

    move-result-wide v7

    new-instance v9, LH0/w;

    invoke-direct {v9, v7, v8}, LH0/w;-><init>(J)V

    filled-new-array {v5, v9}, [LH0/w;

    move-result-object v5

    invoke-static {v5}, LIm/s;->g0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    const v7, 0x102bd149

    invoke-virtual {v11, v7}, Lm0/q;->f0(I)V

    invoke-virtual {v11}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v7

    if-ne v7, v6, :cond_c

    new-instance v7, Ldg/g;

    const/16 v8, 0xc

    invoke-direct {v7, v8}, Ldg/g;-><init>(I)V

    invoke-virtual {v11, v7}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_c
    check-cast v7, LVm/k;

    const v8, 0x102bd6f7

    invoke-static {v8, v11, v3}, Lcom/eightsleep/data_bioage/data/model/a;->f(ILm0/q;Z)Ljava/lang/Object;

    move-result-object v8

    if-ne v8, v6, :cond_d

    new-instance v8, Ldg/g;

    const/16 v6, 0xd

    invoke-direct {v8, v6}, Ldg/g;-><init>(I)V

    invoke-virtual {v11, v8}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_d
    check-cast v8, LVm/k;

    invoke-virtual {v11, v3}, Lm0/q;->q(Z)V

    sget-object v9, LA0/d;->e:LA0/i;

    new-instance v3, LBg/I;

    const/16 v6, 0xa

    invoke-direct {v3, v1, v6}, LBg/I;-><init>(Lu0/d;I)V

    const v6, -0x24c65fdc

    invoke-static {v6, v3, v11}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v10

    const/4 v13, 0x0

    const/high16 v6, 0x44480000    # 800.0f

    const v12, 0x1b6d80

    invoke-static/range {v4 .. v13}, LP2/t;->m(LA0/r;Ljava/util/List;FLVm/k;LVm/k;LA0/i;Lu0/d;Lm0/l;II)V

    :goto_7
    invoke-virtual {v11}, Lm0/q;->u()Lm0/t0;

    move-result-object v3

    if-eqz v3, :cond_e

    new-instance v4, Lg8/f;

    invoke-direct {v4, v0, v1, v2}, Lg8/f;-><init>(LVm/a;Lu0/d;I)V

    iput-object v4, v3, Lm0/t0;->d:LVm/n;

    :cond_e
    return-void
.end method

.method public static c0(Lcom/google/gson/o;)Lz7/H;
    .locals 3

    const-string v0, "Unable to parse json into type LongTask"

    :try_start_0
    const-string v1, "count"

    invoke-virtual {p0, v1}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/gson/m;->i()J

    move-result-wide v1

    new-instance p0, Lz7/H;

    invoke-direct {p0, v1, v2}, Lz7/H;-><init>(J)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    goto :goto_1

    :catch_2
    move-exception p0

    goto :goto_2

    :goto_0
    new-instance v1, Lcom/google/gson/JsonParseException;

    invoke-direct {v1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :goto_1
    new-instance v1, Lcom/google/gson/JsonParseException;

    invoke-direct {v1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :goto_2
    new-instance v1, Lcom/google/gson/JsonParseException;

    invoke-direct {v1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static final d(Lwg/c;Lan/h;Lcom/eightsleep/data_core/enums/ClockSystem;LVm/k;LVm/a;Lm0/l;I)V
    .locals 25

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v7, p6

    move-object/from16 v12, p5

    check-cast v12, Lm0/q;

    const v0, -0x23c086dc

    invoke-virtual {v12, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, v7, 0x6

    if-nez v0, :cond_1

    invoke-virtual {v12, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int/2addr v0, v7

    goto :goto_1

    :cond_1
    move v0, v7

    :goto_1
    and-int/lit8 v3, v7, 0x30

    if-nez v3, :cond_3

    invoke-virtual {v12, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/16 v3, 0x20

    goto :goto_2

    :cond_2
    const/16 v3, 0x10

    :goto_2
    or-int/2addr v0, v3

    :cond_3
    and-int/lit16 v3, v7, 0x180

    move-object/from16 v10, p2

    if-nez v3, :cond_5

    invoke-virtual {v12, v10}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    const/16 v3, 0x100

    goto :goto_3

    :cond_4
    const/16 v3, 0x80

    :goto_3
    or-int/2addr v0, v3

    :cond_5
    and-int/lit16 v3, v7, 0xc00

    if-nez v3, :cond_7

    move-object/from16 v3, p3

    invoke-virtual {v12, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    const/16 v5, 0x800

    goto :goto_4

    :cond_6
    const/16 v5, 0x400

    :goto_4
    or-int/2addr v0, v5

    goto :goto_5

    :cond_7
    move-object/from16 v3, p3

    :goto_5
    and-int/lit16 v5, v7, 0x6000

    if-nez v5, :cond_9

    move-object/from16 v5, p4

    invoke-virtual {v12, v5}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    const/16 v6, 0x4000

    goto :goto_6

    :cond_8
    const/16 v6, 0x2000

    :goto_6
    or-int/2addr v0, v6

    :goto_7
    move v6, v0

    goto :goto_8

    :cond_9
    move-object/from16 v5, p4

    goto :goto_7

    :goto_8
    and-int/lit16 v0, v6, 0x2493

    const/16 v8, 0x2492

    if-ne v0, v8, :cond_b

    invoke-virtual {v12}, Lm0/q;->H()Z

    move-result v0

    if-nez v0, :cond_a

    goto :goto_9

    :cond_a
    invoke-virtual {v12}, Lm0/q;->Y()V

    goto/16 :goto_f

    :cond_b
    :goto_9
    const v0, 0x37c791ef

    invoke-virtual {v12, v0}, Lm0/q;->f0(I)V

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v0

    sget-object v14, Lm0/k;->a:Lm0/e;

    if-ne v0, v14, :cond_c

    const/4 v0, 0x0

    invoke-static {v0}, Lm0/r;->C(Ljava/lang/Object;)Lm0/i0;

    move-result-object v0

    invoke-virtual {v12, v0}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_c
    check-cast v0, Lm0/Z;

    const/4 v15, 0x0

    invoke-virtual {v12, v15}, Lm0/q;->q(Z)V

    const v8, 0x7f120aeb

    invoke-static {v12, v8}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v8

    sget-object v9, LA0/o;->a:LA0/o;

    const/high16 v11, 0x3f800000    # 1.0f

    invoke-static {v9, v11}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v11

    invoke-static {v12}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v13

    iget-object v13, v13, Lhh/h;->d:Lhh/g;

    iget-wide v4, v13, Lhh/g;->b:J

    invoke-static {v12}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v13

    iget v13, v13, Lhh/i;->c:F

    invoke-static {v13}, LO/e;->b(F)LO/d;

    move-result-object v13

    invoke-static {v11, v4, v5, v13}, Ly/x;->g(LA0/r;JLH0/X;)LA0/r;

    move-result-object v4

    invoke-static {v12}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v5

    iget v5, v5, Lhh/i;->e:F

    invoke-static {v4, v5}, LG/e;->H(LA0/r;F)LA0/r;

    move-result-object v4

    sget-object v5, LG/l;->c:LG/f;

    sget-object v11, LA0/d;->m:LA0/g;

    invoke-static {v5, v11, v12, v15}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v5

    move-object v11, v8

    iget-wide v7, v12, Lm0/q;->T:J

    invoke-static {v7, v8}, Ljava/lang/Long;->hashCode(J)I

    move-result v7

    invoke-virtual {v12}, Lm0/q;->m()Lm0/o0;

    move-result-object v8

    invoke-static {v4, v12}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v4

    sget-object v13, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v13, LZ0/g;->b:LZ0/f;

    invoke-virtual {v12}, Lm0/q;->j0()V

    iget-boolean v15, v12, Lm0/q;->S:Z

    if-eqz v15, :cond_d

    invoke-virtual {v12, v13}, Lm0/q;->l(LVm/a;)V

    goto :goto_a

    :cond_d
    invoke-virtual {v12}, Lm0/q;->t0()V

    :goto_a
    sget-object v13, LZ0/g;->f:LZ0/e;

    invoke-static {v13, v5, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v5, LZ0/g;->e:LZ0/e;

    invoke-static {v5, v8, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    sget-object v7, LZ0/g;->g:LZ0/e;

    invoke-static {v12, v5, v7}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v5, LZ0/g;->h:LZ0/d;

    invoke-static {v12, v5}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v5, LZ0/g;->d:LZ0/e;

    invoke-static {v5, v4, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const v4, 0x7f120aea

    invoke-static {v12, v4}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v8

    move-object v4, v9

    iget-object v9, v1, Lwg/c;->a:Ljava/time/Instant;

    const v5, 0xf2383fa

    invoke-virtual {v12, v5}, Lm0/q;->f0(I)V

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v5

    if-ne v5, v14, :cond_e

    new-instance v5, LBg/y;

    const/4 v7, 0x0

    invoke-direct {v5, v0, v7}, LBg/y;-><init>(Lm0/Z;I)V

    invoke-virtual {v12, v5}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_e
    check-cast v5, LVm/a;

    const/4 v7, 0x0

    invoke-virtual {v12, v7}, Lm0/q;->q(Z)V

    and-int/lit16 v15, v6, 0x380

    or-int/lit16 v13, v15, 0xc00

    move-object/from16 v24, v5

    move-object v5, v4

    move-object v4, v11

    move-object/from16 v11, v24

    invoke-static/range {v8 .. v13}, Lio/sentry/config/a;->e(Ljava/lang/String;Ljava/time/Instant;Lcom/eightsleep/data_core/enums/ClockSystem;LVm/a;Lm0/l;I)V

    invoke-static {v12, v7}, LP2/z;->Q(Lm0/l;I)V

    const v7, 0x7f120aec

    invoke-static {v12, v7}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v8

    const v7, 0xf23a5fb

    invoke-virtual {v12, v7}, Lm0/q;->f0(I)V

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v7

    if-ne v7, v14, :cond_f

    new-instance v7, LBg/y;

    const/4 v9, 0x1

    invoke-direct {v7, v0, v9}, LBg/y;-><init>(Lm0/Z;I)V

    invoke-virtual {v12, v7}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_f
    move-object v11, v7

    check-cast v11, LVm/a;

    const/4 v7, 0x0

    invoke-virtual {v12, v7}, Lm0/q;->q(Z)V

    iget-object v9, v1, Lwg/c;->b:Ljava/time/Instant;

    move-object/from16 v10, p2

    invoke-static/range {v8 .. v13}, Lio/sentry/config/a;->e(Ljava/lang/String;Ljava/time/Instant;Lcom/eightsleep/data_core/enums/ClockSystem;LVm/a;Lm0/l;I)V

    invoke-static {v12, v7}, LP2/z;->Q(Lm0/l;I)V

    sget-object v8, LOg/e;->d:LOg/e;

    const v7, 0xf23b80d

    invoke-virtual {v12, v7}, Lm0/q;->f0(I)V

    invoke-virtual {v12, v4}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v7

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v9

    if-nez v7, :cond_10

    if-ne v9, v14, :cond_11

    :cond_10
    new-instance v9, LBg/z;

    const/4 v7, 0x0

    invoke-direct {v9, v4, v7}, LBg/z;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v12, v9}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_11
    check-cast v9, LVm/k;

    const/4 v7, 0x0

    invoke-virtual {v12, v7}, Lm0/q;->q(Z)V

    invoke-static {v5, v7, v9}, Lh1/o;->c(LA0/r;ZLVm/k;)LA0/r;

    move-result-object v9

    const v4, 0x7f12036a

    invoke-static {v12, v4}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v12}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v4

    iget-object v4, v4, Lhh/h;->k:Lhh/v;

    iget-wide v4, v4, Lhh/v;->h:J

    new-instance v11, LH0/w;

    invoke-direct {v11, v4, v5}, LH0/w;-><init>(J)V

    const v4, 0x7f080267

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    shr-int/lit8 v5, v6, 0x9

    and-int/lit8 v21, v5, 0x70

    const/16 v17, 0x0

    const/16 v20, 0x0

    const/4 v13, 0x0

    move-object v5, v14

    const/4 v14, 0x0

    move/from16 v16, v15

    const/4 v15, 0x0

    move/from16 v18, v16

    const/16 v16, 0x0

    const/16 v22, 0x7f0

    move-object/from16 v19, v12

    move/from16 v23, v18

    move-object/from16 v18, p4

    move-object v12, v4

    move-object v4, v5

    invoke-virtual/range {v8 .. v22}, LOg/e;->c(LA0/r;Ljava/lang/String;LH0/w;Ljava/lang/Integer;Lhh/n;Lhh/d;ZZLJg/b;LVm/a;Lm0/l;III)V

    move-object/from16 v12, v19

    const/4 v15, 0x1

    invoke-virtual {v12, v15}, Lm0/q;->q(Z)V

    invoke-interface {v0}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    if-nez v5, :cond_12

    goto/16 :goto_f

    :cond_12
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_13

    iget-object v8, v1, Lwg/c;->a:Ljava/time/Instant;

    goto :goto_b

    :cond_13
    iget-object v8, v1, Lwg/c;->b:Ljava/time/Instant;

    :goto_b
    const v9, 0xf2416ec

    invoke-virtual {v12, v9}, Lm0/q;->f0(I)V

    invoke-virtual {v12, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v9

    invoke-virtual {v12, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v10

    or-int/2addr v9, v10

    and-int/lit16 v10, v6, 0x1c00

    const/16 v11, 0x800

    if-ne v10, v11, :cond_14

    goto :goto_c

    :cond_14
    move v15, v7

    :goto_c
    or-int/2addr v9, v15

    invoke-virtual {v12, v5}, Lm0/q;->h(Z)Z

    move-result v10

    or-int/2addr v9, v10

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v10

    if-nez v9, :cond_15

    if-ne v10, v4, :cond_16

    :cond_15
    move-object v9, v4

    move v4, v5

    move-object v5, v0

    goto :goto_d

    :cond_16
    move-object v5, v0

    move-object v9, v4

    goto :goto_e

    :goto_d
    new-instance v0, LBg/A;

    invoke-direct/range {v0 .. v5}, LBg/A;-><init>(Lwg/c;Lan/h;LVm/k;ZLm0/Z;)V

    invoke-virtual {v12, v0}, Lm0/q;->q0(Ljava/lang/Object;)V

    move-object v10, v0

    :goto_e
    move-object v3, v10

    check-cast v3, LVm/k;

    const v0, 0xf24595a

    invoke-static {v0, v12, v7}, Lcom/eightsleep/data_bioage/data/model/a;->f(ILm0/q;Z)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v9, :cond_17

    new-instance v0, LBg/y;

    const/4 v1, 0x2

    invoke-direct {v0, v5, v1}, LBg/y;-><init>(Lm0/Z;I)V

    invoke-virtual {v12, v0}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_17
    move-object v4, v0

    check-cast v4, LVm/a;

    invoke-virtual {v12, v7}, Lm0/q;->q(Z)V

    and-int/lit8 v0, v6, 0x70

    or-int/lit16 v0, v0, 0x6000

    or-int v6, v0, v23

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v0, v8

    move-object v5, v12

    invoke-static/range {v0 .. v6}, Lio/sentry/config/a;->f(Ljava/time/Instant;Lan/h;Lcom/eightsleep/data_core/enums/ClockSystem;LVm/k;LVm/a;Lm0/l;I)V

    :goto_f
    invoke-virtual {v12}, Lm0/q;->u()Lm0/t0;

    move-result-object v8

    if-eqz v8, :cond_18

    new-instance v0, LBe/a;

    const/4 v7, 0x2

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move/from16 v6, p6

    invoke-direct/range {v0 .. v7}, LBe/a;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;LVm/a;II)V

    iput-object v0, v8, Lm0/t0;->d:LVm/n;

    :cond_18
    return-void
.end method

.method public static d0(Lcom/google/gson/o;)Lz7/a2;
    .locals 5

    const-string v0, "Unable to parse json into type Connect"

    :try_start_0
    const-string v1, "duration"

    invoke-virtual {p0, v1}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/gson/m;->i()J

    move-result-wide v1

    const-string v3, "start"

    invoke-virtual {p0, v3}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/gson/m;->i()J

    move-result-wide v3

    new-instance p0, Lz7/a2;

    invoke-direct {p0, v1, v2, v3, v4}, Lz7/a2;-><init>(JJ)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    goto :goto_1

    :catch_2
    move-exception p0

    goto :goto_2

    :goto_0
    new-instance v1, Lcom/google/gson/JsonParseException;

    invoke-direct {v1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :goto_1
    new-instance v1, Lcom/google/gson/JsonParseException;

    invoke-direct {v1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :goto_2
    new-instance v1, Lcom/google/gson/JsonParseException;

    invoke-direct {v1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static final e(Ljava/lang/String;Ljava/time/Instant;Lcom/eightsleep/data_core/enums/ClockSystem;LVm/a;Lm0/l;I)V
    .locals 20

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    move/from16 v1, p5

    move-object/from16 v15, p4

    check-cast v15, Lm0/q;

    const v0, -0xa73cb85

    invoke-virtual {v15, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, v1, 0x6

    move-object/from16 v3, p0

    if-nez v0, :cond_1

    invoke-virtual {v15, v3}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int/2addr v0, v1

    goto :goto_1

    :cond_1
    move v0, v1

    :goto_1
    and-int/lit8 v2, v1, 0x30

    if-nez v2, :cond_3

    invoke-virtual {v15, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/16 v2, 0x20

    goto :goto_2

    :cond_2
    const/16 v2, 0x10

    :goto_2
    or-int/2addr v0, v2

    :cond_3
    and-int/lit16 v2, v1, 0x180

    if-nez v2, :cond_5

    invoke-virtual {v15, v5}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    const/16 v2, 0x100

    goto :goto_3

    :cond_4
    const/16 v2, 0x80

    :goto_3
    or-int/2addr v0, v2

    :cond_5
    and-int/lit16 v2, v1, 0xc00

    if-nez v2, :cond_7

    move-object/from16 v2, p3

    invoke-virtual {v15, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    const/16 v6, 0x800

    goto :goto_4

    :cond_6
    const/16 v6, 0x400

    :goto_4
    or-int/2addr v0, v6

    goto :goto_5

    :cond_7
    move-object/from16 v2, p3

    :goto_5
    and-int/lit16 v6, v0, 0x493

    const/16 v7, 0x492

    if-ne v6, v7, :cond_9

    invoke-virtual {v15}, Lm0/q;->H()Z

    move-result v6

    if-nez v6, :cond_8

    goto :goto_6

    :cond_8
    invoke-virtual {v15}, Lm0/q;->Y()V

    goto/16 :goto_b

    :cond_9
    :goto_6
    sget-object v6, LA0/o;->a:LA0/o;

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-static {v6, v7}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v6

    sget-object v8, LA0/d;->k:LA0/h;

    sget-object v9, LG/l;->a:LG/d;

    const/16 v10, 0x30

    invoke-static {v9, v8, v15, v10}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v8

    iget-wide v9, v15, Lm0/q;->T:J

    invoke-static {v9, v10}, Ljava/lang/Long;->hashCode(J)I

    move-result v9

    invoke-virtual {v15}, Lm0/q;->m()Lm0/o0;

    move-result-object v10

    invoke-static {v6, v15}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v6

    sget-object v11, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v11, LZ0/g;->b:LZ0/f;

    invoke-virtual {v15}, Lm0/q;->j0()V

    iget-boolean v12, v15, Lm0/q;->S:Z

    if-eqz v12, :cond_a

    invoke-virtual {v15, v11}, Lm0/q;->l(LVm/a;)V

    goto :goto_7

    :cond_a
    invoke-virtual {v15}, Lm0/q;->t0()V

    :goto_7
    sget-object v11, LZ0/g;->f:LZ0/e;

    invoke-static {v11, v8, v15}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v8, LZ0/g;->e:LZ0/e;

    invoke-static {v8, v10, v15}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    sget-object v9, LZ0/g;->g:LZ0/e;

    invoke-static {v15, v8, v9}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v8, LZ0/g;->h:LZ0/d;

    invoke-static {v15, v8}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v8, LZ0/g;->d:LZ0/e;

    invoke-static {v8, v6, v15}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v6, Lih/h;->b:Lih/h;

    invoke-static {v15}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v8

    iget-object v8, v8, Lhh/h;->k:Lhh/v;

    iget-wide v9, v8, Lhh/v;->c:J

    float-to-double v11, v7

    const-wide/16 v13, 0x0

    cmpl-double v8, v11, v13

    if-lez v8, :cond_b

    goto :goto_8

    :cond_b
    const-string v8, "invalid weight; must be greater than zero"

    invoke-static {v8}, LH/a;->a(Ljava/lang/String;)V

    :goto_8
    new-instance v8, LG/x0;

    const/4 v11, 0x1

    invoke-direct {v8, v7, v11}, LG/x0;-><init>(FZ)V

    and-int/lit8 v16, v0, 0xe

    const/4 v13, 0x0

    const/4 v14, 0x0

    move v7, v11

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x3f4

    move/from16 v19, v7

    move-object v7, v3

    move/from16 v3, v19

    invoke-virtual/range {v6 .. v18}, Lih/h;->h(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    sget-object v6, LOg/e;->c:LOg/e;

    if-nez v5, :cond_c

    const/4 v7, -0x1

    goto :goto_9

    :cond_c
    sget-object v7, LBg/J;->a:[I

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v8

    aget v7, v7, v8

    :goto_9
    if-ne v7, v3, :cond_d

    const-string v7, "EEE HH:mm"

    goto :goto_a

    :cond_d
    const-string v7, "EEE h:mm a"

    :goto_a
    invoke-static {v7}, Ljava/time/format/DateTimeFormatter;->ofPattern(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    move-result-object v7

    invoke-static {}, Ljava/time/ZoneId;->systemDefault()Ljava/time/ZoneId;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/time/Instant;->atZone(Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/time/format/DateTimeFormatter;->format(Ljava/time/temporal/TemporalAccessor;)Ljava/lang/String;

    move-result-object v8

    shr-int/lit8 v0, v0, 0x6

    and-int/lit8 v17, v0, 0x70

    const/4 v13, 0x0

    const/16 v16, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/16 v18, 0x7fb

    move-object v14, v2

    invoke-virtual/range {v6 .. v18}, LOg/e;->e(LA0/r;Ljava/lang/String;Ljava/lang/Integer;Lhh/n;Lhh/d;ZLJg/b;LVm/a;Lm0/l;III)V

    invoke-virtual {v15, v3}, Lm0/q;->q(Z)V

    :goto_b
    invoke-virtual {v15}, Lm0/q;->u()Lm0/t0;

    move-result-object v8

    if-eqz v8, :cond_e

    new-instance v0, LAe/f;

    const/4 v2, 0x4

    const/4 v7, 0x0

    move-object/from16 v3, p0

    move-object/from16 v6, p3

    invoke-direct/range {v0 .. v7}, LAe/f;-><init>(IILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Z)V

    iput-object v0, v8, Lm0/t0;->d:LVm/n;

    :cond_e
    return-void
.end method

.method public static e0(Ltq/b;IIIZ)[[[S
    .locals 8

    const/4 v0, 0x2

    if-eqz p4, :cond_0

    add-int/lit8 v1, p2, 0x1

    mul-int/2addr v1, p2

    div-int/2addr v1, v0

    mul-int/2addr v1, p1

    goto :goto_0

    :cond_0
    mul-int v1, p1, p2

    mul-int/2addr v1, p3

    :goto_0
    new-array v1, v1, [B

    invoke-virtual {p0, v1}, Ltq/b;->nextBytes([B)V

    const/4 p0, 0x3

    new-array p0, p0, [I

    aput p3, p0, v0

    const/4 v0, 0x1

    aput p2, p0, v0

    const/4 v0, 0x0

    aput p1, p0, v0

    sget-object v2, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-static {v2, p0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [[[S

    move v2, v0

    move v3, v2

    :goto_1
    if-ge v2, p2, :cond_4

    move v4, v0

    :goto_2
    if-ge v4, p3, :cond_3

    move v5, v0

    :goto_3
    if-ge v5, p1, :cond_2

    if-eqz p4, :cond_1

    if-le v2, v4, :cond_1

    goto :goto_4

    :cond_1
    aget-object v6, p0, v5

    aget-object v6, v6, v2

    add-int/lit8 v7, v3, 0x1

    aget-byte v3, v1, v3

    and-int/lit16 v3, v3, 0xff

    int-to-short v3, v3

    aput-short v3, v6, v4

    move v3, v7

    :goto_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_4
    return-object p0
.end method

.method public static final f(Ljava/time/Instant;Lan/h;Lcom/eightsleep/data_core/enums/ClockSystem;LVm/k;LVm/a;Lm0/l;I)V
    .locals 12

    move-object/from16 v5, p4

    move/from16 v8, p6

    move-object/from16 v9, p5

    check-cast v9, Lm0/q;

    const v0, 0x2fbb3a2a

    invoke-virtual {v9, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, v8, 0x6

    if-nez v0, :cond_1

    invoke-virtual {v9, p0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int/2addr v0, v8

    goto :goto_1

    :cond_1
    move v0, v8

    :goto_1
    and-int/lit8 v1, v8, 0x30

    if-nez v1, :cond_3

    invoke-virtual {v9, p1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x20

    goto :goto_2

    :cond_2
    const/16 v1, 0x10

    :goto_2
    or-int/2addr v0, v1

    :cond_3
    and-int/lit16 v1, v8, 0x180

    if-nez v1, :cond_5

    invoke-virtual {v9, p2}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const/16 v1, 0x100

    goto :goto_3

    :cond_4
    const/16 v1, 0x80

    :goto_3
    or-int/2addr v0, v1

    :cond_5
    and-int/lit16 v1, v8, 0xc00

    if-nez v1, :cond_7

    invoke-virtual {v9, p3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    const/16 v1, 0x800

    goto :goto_4

    :cond_6
    const/16 v1, 0x400

    :goto_4
    or-int/2addr v0, v1

    :cond_7
    and-int/lit16 v1, v8, 0x6000

    if-nez v1, :cond_9

    invoke-virtual {v9, v5}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v1, 0x4000

    goto :goto_5

    :cond_8
    const/16 v1, 0x2000

    :goto_5
    or-int/2addr v0, v1

    :cond_9
    move v10, v0

    and-int/lit16 v0, v10, 0x2493

    const/16 v1, 0x2492

    if-ne v0, v1, :cond_b

    invoke-virtual {v9}, Lm0/q;->H()Z

    move-result v0

    if-nez v0, :cond_a

    goto :goto_6

    :cond_a
    invoke-virtual {v9}, Lm0/q;->Y()V

    goto :goto_7

    :cond_b
    :goto_6
    invoke-static {}, Ljava/time/ZoneId;->systemDefault()Ljava/time/ZoneId;

    move-result-object v3

    const v0, 0x1e12a581

    invoke-virtual {v9, v0}, Lm0/q;->f0(I)V

    invoke-virtual {v9, p1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {v9}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lm0/k;->a:Lm0/e;

    if-nez v0, :cond_c

    if-ne v1, v2, :cond_d

    :cond_c
    invoke-static/range {p0 .. p1}, LP2/H;->I(Ljava/time/Instant;Lan/h;)Ljava/lang/Comparable;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ljava/time/Instant;

    invoke-virtual {v9, v1}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_d
    check-cast v1, Ljava/time/Instant;

    const/4 v0, 0x0

    invoke-virtual {v9, v0}, Lm0/q;->q(Z)V

    const v6, 0x1e12aedd

    invoke-virtual {v9, v6}, Lm0/q;->f0(I)V

    invoke-virtual {v9, p1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v6

    invoke-virtual {v9}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v7

    if-nez v6, :cond_e

    if-ne v7, v2, :cond_f

    :cond_e
    invoke-static {v1}, Lm0/r;->C(Ljava/lang/Object;)Lm0/i0;

    move-result-object v7

    invoke-virtual {v9, v7}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_f
    check-cast v7, Lm0/Z;

    invoke-virtual {v9, v0}, Lm0/q;->q(Z)V

    new-instance v11, LA1/D;

    const/4 v0, 0x3

    invoke-direct {v11, v0}, LA1/D;-><init>(I)V

    new-instance v0, LBg/F;

    move-object v4, p2

    move-object v2, v1

    move-object v6, v5

    move-object v5, v7

    move-object v1, p1

    move-object v7, p3

    invoke-direct/range {v0 .. v7}, LBg/F;-><init>(Lan/h;Ljava/time/Instant;Ljava/time/ZoneId;Lcom/eightsleep/data_core/enums/ClockSystem;Lm0/Z;LVm/a;LVm/k;)V

    move-object v5, v6

    const v1, -0x77a9610c

    invoke-static {v1, v0, v9}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v0

    shr-int/lit8 v1, v10, 0xc

    and-int/lit8 v1, v1, 0xe

    or-int/lit16 v1, v1, 0x1b0

    invoke-static {v5, v11, v0, v9, v1}, La7/d;->g(LVm/a;LA1/D;Lu0/d;Lm0/l;I)V

    :goto_7
    invoke-virtual {v9}, Lm0/q;->u()Lm0/t0;

    move-result-object v9

    if-eqz v9, :cond_10

    new-instance v0, LBe/a;

    const/4 v7, 0x3

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v6, v8

    invoke-direct/range {v0 .. v7}, LBe/a;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;LVm/a;II)V

    iput-object v0, v9, Lm0/t0;->d:LVm/n;

    :cond_10
    return-void
.end method

.method public static f0(Ltq/b;II)[[S
    .locals 6

    mul-int v0, p1, p2

    new-array v0, v0, [B

    invoke-virtual {p0, v0}, Ltq/b;->nextBytes([B)V

    const/4 p0, 0x2

    new-array p0, p0, [I

    const/4 v1, 0x1

    aput p2, p0, v1

    const/4 v1, 0x0

    aput p1, p0, v1

    sget-object v2, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-static {v2, p0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [[S

    move v2, v1

    :goto_0
    if-ge v2, p2, :cond_1

    move v3, v1

    :goto_1
    if-ge v3, p1, :cond_0

    aget-object v4, p0, v3

    mul-int v5, v2, p1

    add-int/2addr v5, v3

    aget-byte v5, v0, v5

    and-int/lit16 v5, v5, 0xff

    int-to-short v5, v5

    aput-short v5, v4, v2

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object p0
.end method

.method public static final g(Lwg/E;LVm/n;Lm0/l;I)V
    .locals 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v3, "model"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "onUpdateResponse"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v14, p2

    check-cast v14, Lm0/q;

    const v3, -0x1b0c762

    invoke-virtual {v14, v3}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v14, v0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x4

    goto :goto_0

    :cond_0
    const/4 v3, 0x2

    :goto_0
    or-int v3, p3, v3

    invoke-virtual {v14, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    const/16 v5, 0x20

    if-eqz v4, :cond_1

    move v4, v5

    goto :goto_1

    :cond_1
    const/16 v4, 0x10

    :goto_1
    or-int/2addr v3, v4

    and-int/lit8 v4, v3, 0x13

    const/16 v6, 0x12

    if-ne v4, v6, :cond_3

    invoke-virtual {v14}, Lm0/q;->H()Z

    move-result v4

    if-nez v4, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v14}, Lm0/q;->Y()V

    goto/16 :goto_7

    :cond_3
    :goto_2
    sget-object v4, LA0/o;->a:LA0/o;

    sget-object v6, LG/l;->c:LG/f;

    sget-object v7, LA0/d;->m:LA0/g;

    const/4 v8, 0x0

    invoke-static {v6, v7, v14, v8}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v6

    iget-wide v9, v14, Lm0/q;->T:J

    invoke-static {v9, v10}, Ljava/lang/Long;->hashCode(J)I

    move-result v7

    invoke-virtual {v14}, Lm0/q;->m()Lm0/o0;

    move-result-object v9

    invoke-static {v4, v14}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v4

    sget-object v10, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v10, LZ0/g;->b:LZ0/f;

    invoke-virtual {v14}, Lm0/q;->j0()V

    iget-boolean v11, v14, Lm0/q;->S:Z

    if-eqz v11, :cond_4

    invoke-virtual {v14, v10}, Lm0/q;->l(LVm/a;)V

    goto :goto_3

    :cond_4
    invoke-virtual {v14}, Lm0/q;->t0()V

    :goto_3
    sget-object v10, LZ0/g;->f:LZ0/e;

    invoke-static {v10, v6, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v6, LZ0/g;->e:LZ0/e;

    invoke-static {v6, v9, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    sget-object v7, LZ0/g;->g:LZ0/e;

    invoke-static {v14, v6, v7}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v6, LZ0/g;->h:LZ0/d;

    invoke-static {v14, v6}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v6, LZ0/g;->d:LZ0/e;

    invoke-static {v6, v4, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v4, Lih/h;->d:Lih/h;

    const v6, 0x7f120692

    invoke-static {v14, v6}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v14}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v7

    iget-object v7, v7, Lhh/h;->k:Lhh/v;

    iget-wide v9, v7, Lhh/v;->c:J

    const/4 v13, 0x0

    const/4 v15, 0x0

    move v7, v5

    move-object v5, v6

    const/4 v6, 0x0

    move v11, v7

    const/4 v7, 0x0

    move v12, v8

    move-wide v8, v9

    const/4 v10, 0x0

    move/from16 v16, v11

    const/4 v11, 0x0

    move/from16 v17, v12

    const/4 v12, 0x0

    move/from16 v18, v16

    const/16 v16, 0x0

    move/from16 v19, v17

    const/16 v17, 0x3f6

    move/from16 p2, v3

    move/from16 v2, v18

    move/from16 v3, v19

    invoke-virtual/range {v4 .. v17}, Lih/h;->o(Ljava/lang/String;LA0/r;Lk1/U;JIZIILm0/l;III)V

    invoke-static {v14, v3}, LP2/z;->Q(Lm0/l;I)V

    const v4, 0x80eccfe

    invoke-virtual {v14, v4}, Lm0/q;->f0(I)V

    iget-object v4, v0, Lwg/E;->i:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    check-cast v4, Ljava/lang/Iterable;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_5
    :goto_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    instance-of v7, v6, Lwg/v1;

    if-eqz v7, :cond_5

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    :cond_6
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_5
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v8, 0x1

    if-eqz v4, :cond_a

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lwg/v1;

    invoke-interface {v4}, Lwg/v1;->c()I

    move-result v5

    invoke-static {v14, v5}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4}, Lwg/h0;->g()Ljava/lang/Boolean;

    move-result-object v6

    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v6, v7}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    const v7, -0x5c364741

    invoke-virtual {v14, v7}, Lm0/q;->f0(I)V

    and-int/lit8 v7, p2, 0x70

    if-ne v7, v2, :cond_7

    goto :goto_6

    :cond_7
    move v8, v3

    :goto_6
    invoke-virtual {v14, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    or-int/2addr v7, v8

    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v8

    if-nez v7, :cond_8

    sget-object v7, Lm0/k;->a:Lm0/e;

    if-ne v8, v7, :cond_9

    :cond_8
    new-instance v8, LAe/b;

    const/16 v7, 0x8

    invoke-direct {v8, v7, v1, v4}, LAe/b;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v14, v8}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_9
    move-object v9, v8

    check-cast v9, LVm/k;

    invoke-virtual {v14, v3}, Lm0/q;->q(Z)V

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v4, v5

    move v5, v6

    const/4 v6, 0x0

    const/4 v11, 0x0

    const/16 v12, 0x3c

    move-object v10, v14

    invoke-static/range {v4 .. v12}, LP2/C;->b(Ljava/lang/String;ZZLcom/eightsleep/corepresentation/enums/CellVariant;ZLVm/k;Lm0/l;II)V

    goto :goto_5

    :cond_a
    invoke-virtual {v14, v3}, Lm0/q;->q(Z)V

    invoke-static {v14, v3}, LP2/z;->M(Lm0/l;I)V

    invoke-virtual {v14, v8}, Lm0/q;->q(Z)V

    :goto_7
    invoke-virtual {v14}, Lm0/q;->u()Lm0/t0;

    move-result-object v2

    if-eqz v2, :cond_b

    new-instance v3, LBg/m;

    const/4 v4, 0x1

    move/from16 v5, p3

    invoke-direct {v3, v0, v1, v5, v4}, LBg/m;-><init>(Lwg/E;LVm/n;II)V

    iput-object v3, v2, Lm0/t0;->d:LVm/n;

    :cond_b
    return-void
.end method

.method public static g0([[S)[B
    .locals 8

    array-length v0, p0

    const/4 v1, 0x0

    aget-object v2, p0, v1

    array-length v2, v2

    mul-int v3, v0, v2

    new-array v3, v3, [B

    move v4, v1

    :goto_0
    if-ge v4, v2, :cond_1

    move v5, v1

    :goto_1
    if-ge v5, v0, :cond_0

    mul-int v6, v4, v0

    add-int/2addr v6, v5

    aget-object v7, p0, v5

    aget-short v7, v7, v4

    int-to-byte v7, v7

    aput-byte v7, v3, v6

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    return-object v3
.end method

.method public static final h(LA0/r;LOe/e;LVm/a;Lm0/l;I)V
    .locals 50

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    const-string v0, "bioAge"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onClick"

    invoke-static {v3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v12, p3

    check-cast v12, Lm0/q;

    const v0, -0x6dee34e6

    invoke-virtual {v12, v0}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v12, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    const/4 v9, 0x2

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    move v0, v9

    :goto_0
    or-int v0, p4, v0

    invoke-virtual {v12, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/16 v4, 0x20

    goto :goto_1

    :cond_1
    const/16 v4, 0x10

    :goto_1
    or-int/2addr v0, v4

    invoke-virtual {v12, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    const/16 v4, 0x100

    goto :goto_2

    :cond_2
    const/16 v4, 0x80

    :goto_2
    or-int/2addr v0, v4

    and-int/lit16 v0, v0, 0x93

    const/16 v4, 0x92

    if-ne v0, v4, :cond_4

    invoke-virtual {v12}, Lm0/q;->H()Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_3

    :cond_3
    invoke-virtual {v12}, Lm0/q;->Y()V

    move-object v0, v2

    move-object v13, v12

    goto/16 :goto_20

    :cond_4
    :goto_3
    sget v0, LPe/b;->d:I

    iget-object v0, v2, LOe/e;->e:LOe/d;

    const-string v4, "appearance"

    invoke-static {v0, v4}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v4, LPe/a;->a:[I

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    aget v0, v4, v0

    const/4 v10, 0x1

    if-eq v0, v10, :cond_7

    if-eq v0, v9, :cond_6

    const/4 v4, 0x3

    if-ne v0, v4, :cond_5

    sget-wide v4, LPe/b;->c:J

    :goto_4
    move-wide v13, v4

    goto :goto_5

    :cond_5
    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    :cond_6
    sget-wide v4, LPe/b;->b:J

    goto :goto_4

    :cond_7
    sget-wide v4, LPe/b;->a:J

    goto :goto_4

    :goto_5
    const-string v0, "MMM d"

    const-string v4, "MMMd"

    invoke-static {v0, v4, v12}, Lio/sentry/config/a;->n0(Ljava/lang/String;Ljava/lang/String;Lm0/l;)Ljava/time/format/DateTimeFormatter;

    move-result-object v0

    const v4, -0x3e1b1f69

    invoke-virtual {v12, v4}, Lm0/q;->f0(I)V

    const v11, 0x7f1204dc

    invoke-static {v12, v11}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v4

    const v5, -0x149307c3

    invoke-virtual {v12, v5}, Lm0/q;->f0(I)V

    iget-object v15, v2, LOe/e;->a:Ljava/lang/Object;

    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v5

    const/4 v6, 0x0

    if-lt v5, v9, :cond_8

    move v5, v10

    goto :goto_6

    :cond_8
    move v5, v6

    :goto_6
    move-object/from16 v16, v15

    const-string v15, "MMMM d"

    const-string v11, "MMMMd"

    move/from16 v17, v5

    const v5, 0x7f1204e1

    iget-object v7, v2, LOe/e;->c:Ljava/time/LocalDate;

    if-nez v17, :cond_9

    invoke-static {v12, v5}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v10

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ", "

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v12, v6}, Lm0/q;->q(Z)V

    invoke-virtual {v12, v6}, Lm0/q;->q(Z)V

    const v3, 0x7f120757

    goto/16 :goto_b

    :cond_9
    invoke-virtual {v12, v6}, Lm0/q;->q(Z)V

    invoke-static {v12}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v5

    iget-object v5, v5, Lhh/h;->k:Lhh/v;

    iget-wide v9, v5, Lhh/v;->a:J

    invoke-static {v2, v9, v10, v12}, Lio/sentry/config/a;->i0(LOe/e;JLm0/l;)Lk1/h;

    move-result-object v5

    sget-object v9, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->a:Lm0/B;

    invoke-virtual {v12, v9}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/content/res/Configuration;

    invoke-static {v9}, LP2/p;->w(Landroid/content/res/Configuration;)Ljava/util/Locale;

    move-result-object v9

    invoke-static/range {v16 .. v16}, LIm/r;->b1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Double;

    invoke-static/range {v16 .. v16}, LIm/r;->m1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v6, v20

    check-cast v6, Ljava/lang/Double;

    filled-new-array {v10, v6}, [Ljava/lang/Double;

    move-result-object v6

    invoke-static {v6}, LIm/n;->h0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    new-instance v10, Ljava/util/ArrayList;

    const/16 v8, 0xa

    invoke-static {v6, v8}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v8

    invoke-direct {v10, v8}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v6, Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_7
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_a

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    invoke-static {v2, v3, v9}, LPe/o;->c(DLjava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    goto :goto_7

    :cond_a
    invoke-static {v15, v11, v12}, Lio/sentry/config/a;->n0(Ljava/lang/String;Ljava/lang/String;Lm0/l;)Ljava/time/format/DateTimeFormatter;

    move-result-object v2

    if-nez v7, :cond_b

    const/4 v2, 0x0

    const v3, 0x7f120757

    goto :goto_8

    :cond_b
    invoke-virtual {v7, v2}, Ljava/time/LocalDate;->format(Ljava/time/format/DateTimeFormatter;)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f120757

    invoke-static {v3, v2, v12}, LP2/j;->H(I[Ljava/lang/Object;Lm0/l;)Ljava/lang/String;

    move-result-object v2

    :goto_8
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v9, 0x2

    if-ne v6, v9, :cond_c

    move-object/from16 v21, v10

    goto :goto_9

    :cond_c
    const/16 v21, 0x0

    :goto_9
    if-eqz v21, :cond_d

    const/16 v24, 0x0

    const/16 v26, 0x3e

    const-string v22, ", "

    const/16 v23, 0x0

    const/16 v25, 0x0

    invoke-static/range {v21 .. v26}, LIm/r;->i1(Ljava/lang/Iterable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;LVm/k;I)Ljava/lang/String;

    move-result-object v6

    goto :goto_a

    :cond_d
    const/4 v6, 0x0

    :goto_a
    iget-object v5, v5, Lk1/h;->b:Ljava/lang/String;

    filled-new-array {v4, v2, v5, v6}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, LIm/n;->h0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v21

    const/16 v24, 0x0

    const/16 v26, 0x3e

    const-string v22, ", "

    const/16 v23, 0x0

    const/16 v25, 0x0

    invoke-static/range {v21 .. v26}, LIm/r;->i1(Ljava/lang/Iterable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;LVm/k;I)Ljava/lang/String;

    move-result-object v4

    const/4 v2, 0x0

    invoke-virtual {v12, v2}, Lm0/q;->q(Z)V

    :goto_b
    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v1, v2}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v5

    const v6, -0x7eceafd7

    invoke-virtual {v12, v6}, Lm0/q;->f0(I)V

    invoke-virtual {v12, v4}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v6

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v8

    if-nez v6, :cond_e

    sget-object v6, Lm0/k;->a:Lm0/e;

    if-ne v8, v6, :cond_f

    :cond_e
    new-instance v8, LBg/z;

    const/16 v6, 0x12

    invoke-direct {v8, v4, v6}, LBg/z;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v12, v8}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_f
    check-cast v8, LVm/k;

    const/4 v4, 0x0

    invoke-virtual {v12, v4}, Lm0/q;->q(Z)V

    const/4 v6, 0x1

    invoke-static {v5, v6, v8}, Lh1/o;->c(LA0/r;ZLVm/k;)LA0/r;

    move-result-object v5

    invoke-static {v12}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v6

    iget v6, v6, Lhh/i;->e:F

    invoke-static {v6}, LO/e;->b(F)LO/d;

    move-result-object v6

    invoke-static {v5, v6}, LE0/i;->c(LA0/r;LH0/X;)LA0/r;

    move-result-object v5

    invoke-static {v12}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v6

    iget-object v6, v6, Lhh/h;->a:Lhh/a;

    iget-wide v3, v6, Lhh/a;->b:J

    sget-object v6, LH0/F;->b:LH0/S;

    invoke-static {v5, v3, v4, v6}, Ly/x;->g(LA0/r;JLH0/X;)LA0/r;

    move-result-object v3

    sget-wide v4, LH0/w;->g:J

    new-instance v6, LH0/w;

    invoke-direct {v6, v4, v5}, LH0/w;-><init>(J)V

    const v4, 0x3e2e147b    # 0.17f

    invoke-static {v13, v14, v4}, LH0/w;->b(JF)J

    move-result-wide v4

    new-instance v8, LH0/w;

    invoke-direct {v8, v4, v5}, LH0/w;-><init>(J)V

    filled-new-array {v6, v8}, [LH0/w;

    move-result-object v4

    invoke-static {v4}, LIm/s;->g0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    const/16 v5, 0xe

    const/4 v6, 0x0

    invoke-static {v6, v6, v5, v4}, Lkl/b;->p(FFILjava/util/List;)LH0/J;

    move-result-object v4

    const/4 v5, 0x6

    const/4 v8, 0x0

    invoke-static {v3, v4, v8, v6, v5}, Ly/x;->f(LA0/r;LH0/t;LO/d;FI)LA0/r;

    move-result-object v3

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object/from16 v18, v8

    const/16 v8, 0xf

    move-object/from16 v27, v7

    const/4 v10, 0x0

    move-object/from16 v7, p2

    invoke-static/range {v3 .. v8}, Landroidx/compose/foundation/b;->c(LA0/r;ZLjava/lang/String;Lh1/j;LVm/a;I)LA0/r;

    move-result-object v3

    invoke-static {v12}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v4

    iget v4, v4, Lhh/i;->d:F

    invoke-static {v12}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v5

    iget v5, v5, Lhh/i;->e:F

    invoke-static {v3, v4, v5}, LG/e;->I(LA0/r;FF)LA0/r;

    move-result-object v3

    sget-object v4, LA0/d;->a:LA0/i;

    invoke-static {v4, v10}, LG/t;->d(LA0/e;Z)LX0/h0;

    move-result-object v4

    iget-wide v5, v12, Lm0/q;->T:J

    invoke-static {v5, v6}, Ljava/lang/Long;->hashCode(J)I

    move-result v5

    invoke-virtual {v12}, Lm0/q;->m()Lm0/o0;

    move-result-object v6

    invoke-static {v3, v12}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v3

    sget-object v7, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v7, LZ0/g;->b:LZ0/f;

    invoke-virtual {v12}, Lm0/q;->j0()V

    iget-boolean v8, v12, Lm0/q;->S:Z

    if-eqz v8, :cond_10

    invoke-virtual {v12, v7}, Lm0/q;->l(LVm/a;)V

    goto :goto_c

    :cond_10
    invoke-virtual {v12}, Lm0/q;->t0()V

    :goto_c
    sget-object v8, LZ0/g;->f:LZ0/e;

    invoke-static {v8, v4, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v4, LZ0/g;->e:LZ0/e;

    invoke-static {v4, v6, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    sget-object v6, LZ0/g;->g:LZ0/e;

    invoke-static {v12, v5, v6}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v5, LZ0/g;->h:LZ0/d;

    invoke-static {v12, v5}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v9, LZ0/g;->d:LZ0/e;

    invoke-static {v9, v3, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v3, LG/l;->a:LG/d;

    invoke-static {v12}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v3

    iget v3, v3, Lhh/i;->b:F

    invoke-static {v3}, LG/l;->g(F)LG/j;

    move-result-object v3

    move-object/from16 v19, v11

    sget-object v11, LA0/o;->a:LA0/o;

    sget-object v2, LA0/d;->m:LA0/g;

    invoke-static {v3, v2, v12, v10}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v2

    move-object v3, v11

    iget-wide v10, v12, Lm0/q;->T:J

    invoke-static {v10, v11}, Ljava/lang/Long;->hashCode(J)I

    move-result v10

    invoke-virtual {v12}, Lm0/q;->m()Lm0/o0;

    move-result-object v11

    invoke-static {v3, v12}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v1

    invoke-virtual {v12}, Lm0/q;->j0()V

    move-wide/from16 v21, v13

    iget-boolean v13, v12, Lm0/q;->S:Z

    if-eqz v13, :cond_11

    invoke-virtual {v12, v7}, Lm0/q;->l(LVm/a;)V

    goto :goto_d

    :cond_11
    invoke-virtual {v12}, Lm0/q;->t0()V

    :goto_d
    invoke-static {v8, v2, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v4, v11, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v10, v12, v6, v12, v5}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    invoke-static {v9, v1, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v1, LA0/d;->k:LA0/h;

    sget-object v2, LG/l;->a:LG/d;

    const/16 v10, 0x30

    invoke-static {v2, v1, v12, v10}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v2

    iget-wide v13, v12, Lm0/q;->T:J

    invoke-static {v13, v14}, Ljava/lang/Long;->hashCode(J)I

    move-result v11

    invoke-virtual {v12}, Lm0/q;->m()Lm0/o0;

    move-result-object v13

    invoke-static {v3, v12}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v14

    invoke-virtual {v12}, Lm0/q;->j0()V

    iget-boolean v10, v12, Lm0/q;->S:Z

    if-eqz v10, :cond_12

    invoke-virtual {v12, v7}, Lm0/q;->l(LVm/a;)V

    goto :goto_e

    :cond_12
    invoke-virtual {v12}, Lm0/q;->t0()V

    :goto_e
    invoke-static {v8, v2, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v4, v13, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v11, v12, v6, v12, v5}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    invoke-static {v9, v14, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object v2, v3

    sget-object v3, Lih/h;->d:Lih/h;

    const/high16 v10, 0x3f800000    # 1.0f

    float-to-double v13, v10

    const-wide/16 v24, 0x0

    cmpl-double v11, v13, v24

    const-string v26, "invalid weight; must be greater than zero"

    if-lez v11, :cond_13

    :goto_f
    move-object v11, v5

    goto :goto_10

    :cond_13
    invoke-static/range {v26 .. v26}, LH/a;->a(Ljava/lang/String;)V

    goto :goto_f

    :goto_10
    new-instance v5, LG/x0;

    const v28, 0x7f7fffff    # Float.MAX_VALUE

    cmpl-float v13, v10, v28

    if-lez v13, :cond_14

    move/from16 v10, v28

    :goto_11
    const/4 v13, 0x1

    goto :goto_12

    :cond_14
    const/high16 v10, 0x3f800000    # 1.0f

    goto :goto_11

    :goto_12
    invoke-direct {v5, v10, v13}, LG/x0;-><init>(FZ)V

    const v10, 0x7f1204dc

    invoke-static {v12, v10}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v12}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v14

    iget-object v14, v14, Lhh/h;->k:Lhh/v;

    iget-wide v13, v14, Lhh/v;->a:J

    move-object/from16 v29, v8

    move-wide/from16 v48, v13

    move-object v14, v7

    move-object v13, v12

    move-wide/from16 v7, v48

    const/4 v12, 0x0

    move-object/from16 v30, v14

    const/4 v14, 0x0

    move-object/from16 v31, v6

    const/4 v6, 0x0

    move-object/from16 v32, v9

    const/4 v9, 0x0

    move-object/from16 v33, v4

    move-object v4, v10

    const/4 v10, 0x0

    move-object/from16 v34, v11

    const/4 v11, 0x0

    move-object/from16 v35, v15

    const/4 v15, 0x0

    move-object/from16 v36, v16

    const/16 v16, 0x3f4

    move-object/from16 p3, v0

    move-object/from16 v40, v19

    move-wide/from16 v37, v21

    move-object/from16 v42, v29

    move-object/from16 v41, v30

    move-object/from16 v44, v31

    move-object/from16 v46, v32

    move-object/from16 v43, v33

    move-object/from16 v45, v34

    move-object/from16 v39, v35

    const/16 v0, 0x30

    invoke-virtual/range {v3 .. v16}, Lih/h;->o(Ljava/lang/String;LA0/r;Lk1/U;JIZIILm0/l;III)V

    invoke-static {v13}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v3

    iget v3, v3, Lhh/i;->e:F

    invoke-static {v2, v3}, Landroidx/compose/foundation/layout/b;->n(LA0/r;F)LA0/r;

    move-result-object v5

    const v3, 0x7f080186

    const/4 v4, 0x0

    invoke-static {v3, v4, v13}, LP2/i;->E(IILm0/l;)LL0/a;

    move-result-object v3

    sget v4, LL0/a;->$stable:I

    or-int/lit8 v11, v4, 0x30

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/16 v12, 0x78

    move-object v10, v13

    invoke-static/range {v3 .. v12}, Ly/x;->c(LL0/a;Ljava/lang/String;LA0/r;LA0/e;LX0/q;FLH0/p;Lm0/l;II)V

    const/4 v6, 0x1

    invoke-virtual {v13, v6}, Lm0/q;->q(Z)V

    invoke-interface/range {v36 .. v36}, Ljava/util/List;->size()I

    move-result v3

    const/4 v9, 0x2

    if-lt v3, v9, :cond_15

    const/4 v10, 0x1

    goto :goto_13

    :cond_15
    const/4 v10, 0x0

    :goto_13
    sget-object v3, Lih/h;->b:Lih/h;

    if-eqz v10, :cond_1e

    const v4, -0x280feb79

    invoke-virtual {v13, v4}, Lm0/q;->f0(I)V

    const v4, -0x32d7388a    # -1.7697776E8f

    invoke-virtual {v13, v4}, Lm0/q;->f0(I)V

    move-object/from16 v4, v27

    if-nez v4, :cond_16

    move-object/from16 v47, v4

    :goto_14
    const/4 v4, 0x0

    goto :goto_15

    :cond_16
    move-object/from16 v5, v39

    move-object/from16 v6, v40

    invoke-static {v5, v6, v13}, Lio/sentry/config/a;->n0(Ljava/lang/String;Ljava/lang/String;Lm0/l;)Ljava/time/format/DateTimeFormatter;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/time/LocalDate;->format(Ljava/time/format/DateTimeFormatter;)Ljava/lang/String;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    const v6, 0x7f120757

    invoke-static {v6, v5, v13}, LP2/j;->H(I[Ljava/lang/Object;Lm0/l;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v13}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v6

    iget-object v6, v6, Lhh/h;->k:Lhh/v;

    iget-wide v6, v6, Lhh/v;->c:J

    const/4 v12, 0x0

    const/4 v14, 0x0

    move-object/from16 v27, v4

    move-object v4, v5

    const/4 v5, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x3f6

    move-object/from16 v47, v27

    invoke-virtual/range {v3 .. v16}, Lih/h;->z(Ljava/lang/String;LA0/r;JIZIILVm/k;Lm0/l;III)V

    goto :goto_14

    :goto_15
    invoke-virtual {v13, v4}, Lm0/q;->q(Z)V

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-static {v2, v10}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v2

    invoke-static {v13}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v3

    iget v3, v3, Lhh/i;->b:F

    invoke-static {v3}, LG/l;->g(F)LG/j;

    move-result-object v3

    invoke-static {v3, v1, v13, v0}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v0

    iget-wide v3, v13, Lm0/q;->T:J

    invoke-static {v3, v4}, Ljava/lang/Long;->hashCode(J)I

    move-result v1

    invoke-virtual {v13}, Lm0/q;->m()Lm0/o0;

    move-result-object v3

    invoke-static {v2, v13}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v2

    invoke-virtual {v13}, Lm0/q;->j0()V

    iget-boolean v4, v13, Lm0/q;->S:Z

    if-eqz v4, :cond_17

    move-object/from16 v14, v41

    invoke-virtual {v13, v14}, Lm0/q;->l(LVm/a;)V

    :goto_16
    move-object/from16 v4, v42

    goto :goto_17

    :cond_17
    invoke-virtual {v13}, Lm0/q;->t0()V

    goto :goto_16

    :goto_17
    invoke-static {v4, v0, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object/from16 v0, v43

    invoke-static {v0, v3, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object/from16 v0, v44

    move-object/from16 v11, v45

    invoke-static {v1, v13, v0, v13, v11}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    move-object/from16 v0, v46

    invoke-static {v0, v2, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v3, Lih/h;->e:Lih/h;

    const/high16 v10, 0x3f800000    # 1.0f

    float-to-double v0, v10

    cmpl-double v0, v0, v24

    if-lez v0, :cond_18

    goto :goto_18

    :cond_18
    invoke-static/range {v26 .. v26}, LH/a;->a(Ljava/lang/String;)V

    :goto_18
    new-instance v5, LG/x0;

    cmpl-float v0, v10, v28

    if-lez v0, :cond_19

    move/from16 v2, v28

    :goto_19
    const/4 v6, 0x1

    goto :goto_1a

    :cond_19
    const/high16 v2, 0x3f800000    # 1.0f

    goto :goto_19

    :goto_1a
    invoke-direct {v5, v2, v6}, LG/x0;-><init>(FZ)V

    move-object/from16 v0, p1

    move-wide/from16 v1, v37

    invoke-static {v0, v1, v2, v13}, Lio/sentry/config/a;->i0(LOe/e;JLm0/l;)Lk1/h;

    move-result-object v4

    invoke-static {v13}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v1

    iget-object v1, v1, Lhh/h;->k:Lhh/v;

    iget-wide v6, v1, Lhh/v;->a:J

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v12, v13

    const/4 v13, 0x0

    invoke-virtual/range {v3 .. v13}, Lih/h;->c(Lk1/h;LA0/r;JZIILVm/k;Lm0/l;I)V

    move-object v13, v12

    invoke-static/range {v36 .. v36}, LIm/r;->b1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Ljava/lang/Double;

    invoke-static/range {v36 .. v36}, LIm/r;->m1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Ljava/lang/Double;

    iget-object v1, v0, LOe/e;->d:Ljava/time/LocalDate;

    move-object/from16 v2, p3

    if-eqz v1, :cond_1a

    invoke-virtual {v1, v2}, Ljava/time/LocalDate;->format(Ljava/time/format/DateTimeFormatter;)Ljava/lang/String;

    move-result-object v7

    goto :goto_1b

    :cond_1a
    move-object/from16 v7, v18

    :goto_1b
    const-string v1, ""

    if-nez v7, :cond_1b

    move-object v7, v1

    :cond_1b
    move-object/from16 v4, v47

    if-eqz v4, :cond_1c

    invoke-virtual {v4, v2}, Ljava/time/LocalDate;->format(Ljava/time/format/DateTimeFormatter;)Ljava/lang/String;

    move-result-object v2

    goto :goto_1c

    :cond_1c
    move-object/from16 v2, v18

    :goto_1c
    if-nez v2, :cond_1d

    move-object v8, v1

    goto :goto_1d

    :cond_1d
    move-object v8, v2

    :goto_1d
    const/4 v3, 0x0

    iget-object v4, v0, LOe/e;->e:LOe/d;

    const/4 v10, 0x0

    move-object v9, v13

    invoke-static/range {v3 .. v10}, LPe/o;->a(LA0/r;LOe/d;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/String;Ljava/lang/String;Lm0/l;I)V

    const/4 v6, 0x1

    invoke-virtual {v13, v6}, Lm0/q;->q(Z)V

    const/4 v4, 0x0

    invoke-virtual {v13, v4}, Lm0/q;->q(Z)V

    :goto_1e
    const/4 v6, 0x1

    goto :goto_1f

    :cond_1e
    move-object/from16 v0, p1

    const v1, -0x27f7580c

    invoke-virtual {v13, v1}, Lm0/q;->f0(I)V

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-static {v2, v10}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v5

    const v1, 0x7f1204e1

    invoke-static {v13, v1}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v13}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v1

    iget-object v1, v1, Lhh/h;->k:Lhh/v;

    iget-wide v6, v1, Lhh/v;->c:J

    const/4 v11, 0x0

    move-object v12, v13

    const/16 v13, 0x30

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v14, 0x0

    const/16 v15, 0x3f4

    invoke-virtual/range {v3 .. v15}, Lih/h;->n(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    move-object v13, v12

    const/4 v4, 0x0

    invoke-virtual {v13, v4}, Lm0/q;->q(Z)V

    goto :goto_1e

    :goto_1f
    invoke-virtual {v13, v6}, Lm0/q;->q(Z)V

    invoke-virtual {v13, v6}, Lm0/q;->q(Z)V

    :goto_20
    invoke-virtual {v13}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_1f

    new-instance v0, LBg/D;

    const/16 v5, 0x13

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v4, p4

    invoke-direct/range {v0 .. v5}, LBg/D;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_1f
    return-void
.end method

.method public static h0([[[SZ)[B
    .locals 10

    array-length v0, p0

    const/4 v1, 0x0

    aget-object v2, p0, v1

    array-length v3, v2

    aget-object v2, v2, v1

    array-length v2, v2

    if-eqz p1, :cond_0

    add-int/lit8 v4, v3, 0x1

    mul-int/2addr v4, v3

    div-int/lit8 v4, v4, 0x2

    mul-int/2addr v4, v0

    goto :goto_0

    :cond_0
    mul-int v4, v0, v3

    mul-int/2addr v4, v2

    :goto_0
    new-array v4, v4, [B

    move v5, v1

    move v6, v5

    :goto_1
    if-ge v5, v3, :cond_4

    move v7, v1

    :goto_2
    if-ge v7, v2, :cond_3

    move v8, v1

    :goto_3
    if-ge v8, v0, :cond_2

    if-eqz p1, :cond_1

    if-le v5, v7, :cond_1

    goto :goto_4

    :cond_1
    aget-object v9, p0, v8

    aget-object v9, v9, v5

    aget-short v9, v9, v7

    int-to-byte v9, v9

    aput-byte v9, v4, v6

    add-int/lit8 v6, v6, 0x1

    :goto_4
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_4
    return-object v4
.end method

.method public static final i(IILA0/o;Ljava/lang/String;Lm0/l;)V
    .locals 8

    check-cast p4, Lm0/q;

    const v0, -0x7f40169

    invoke-virtual {p4, v0}, Lm0/q;->h0(I)Lm0/q;

    or-int/lit8 v0, p1, 0x6

    invoke-virtual {p4, p0}, Lm0/q;->e(I)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0x20

    goto :goto_0

    :cond_0
    const/16 v1, 0x10

    :goto_0
    or-int/2addr v0, v1

    invoke-virtual {p4, p3}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x100

    goto :goto_1

    :cond_1
    const/16 v1, 0x80

    :goto_1
    or-int/2addr v0, v1

    and-int/lit16 v0, v0, 0x93

    const/16 v1, 0x92

    if-ne v0, v1, :cond_3

    invoke-virtual {p4}, Lm0/q;->H()Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_3

    :cond_2
    invoke-virtual {p4}, Lm0/q;->Y()V

    :goto_2
    move-object v3, p2

    goto :goto_4

    :cond_3
    :goto_3
    sget-object p2, LA0/o;->a:LA0/o;

    new-instance v0, LSe/b;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p3, v1}, LSe/b;-><init>(ILjava/lang/String;I)V

    const v1, 0x3fcf6736

    invoke-static {v1, v0, p4}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v0

    const/16 v1, 0x36

    invoke-static {v0, p4, v1}, Loe/y;->q(Lu0/d;Lm0/l;I)V

    goto :goto_2

    :goto_4
    invoke-virtual {p4}, Lm0/q;->u()Lm0/t0;

    move-result-object p2

    if-eqz p2, :cond_4

    new-instance v2, LSe/a;

    const/4 v7, 0x1

    move v4, p0

    move v6, p1

    move-object v5, p3

    invoke-direct/range {v2 .. v7}, LSe/a;-><init>(LA0/o;ILjava/lang/String;II)V

    iput-object v2, p2, Lm0/t0;->d:LVm/n;

    :cond_4
    return-void
.end method

.method public static final i0(LOe/e;JLm0/l;)Lk1/h;
    .locals 28

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    check-cast v1, Lm0/q;

    const v2, 0x65485f1

    invoke-virtual {v1, v2}, Lm0/q;->f0(I)V

    new-instance v2, Lk1/e;

    invoke-direct {v2}, Lk1/e;-><init>()V

    iget-object v3, v0, LOe/e;->e:LOe/d;

    sget-object v4, LPe/k;->a:[I

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    aget v3, v4, v3

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x3

    if-eq v3, v6, :cond_2

    const/4 v6, 0x2

    if-eq v3, v6, :cond_1

    if-ne v3, v7, :cond_0

    const v3, -0x5d63400d

    const v6, 0x7f12075c

    :goto_0
    invoke-static {v1, v3, v6, v1, v5}, Lcom/eightsleep/data_bioage/data/model/a;->n(Lm0/q;IILm0/q;Z)Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    :cond_0
    const v0, -0x5d6368b7

    invoke-static {v0, v1, v5}, Lj/m;->t(ILm0/q;Z)Lkotlin/NoWhenBranchMatchedException;

    move-result-object v0

    throw v0

    :cond_1
    const v3, -0x5d635035

    const v6, 0x7f120759

    goto :goto_0

    :cond_2
    const v3, -0x5d635fb3

    const v6, 0x7f12075a

    goto :goto_0

    :goto_1
    iget-object v0, v0, LOe/e;->e:LOe/d;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    aget v0, v4, v0

    if-ne v0, v7, :cond_3

    const v0, -0x5d63296c

    invoke-virtual {v1, v0}, Lm0/q;->f0(I)V

    const v0, 0x7f12075b

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v0, v4, v1}, LP2/j;->H(I[Ljava/lang/Object;Lm0/l;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v5}, Lm0/q;->q(Z)V

    goto :goto_2

    :cond_3
    const v0, -0x5d631eb0

    invoke-virtual {v1, v0}, Lm0/q;->f0(I)V

    const v0, 0x7f120758

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v0, v4, v1}, LP2/j;->H(I[Ljava/lang/Object;Lm0/l;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v5}, Lm0/q;->q(Z)V

    :goto_2
    const/4 v4, 0x6

    invoke-static {v0, v3, v5, v5, v4}, Llo/n;->o0(Ljava/lang/CharSequence;Ljava/lang/String;IZI)I

    move-result v4

    if-gez v4, :cond_4

    invoke-virtual {v2, v0}, Lk1/e;->a(Ljava/lang/String;)V

    goto :goto_3

    :cond_4
    invoke-virtual {v0, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    const-string v7, "substring(...)"

    invoke-static {v6, v7}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v2, v6}, Lk1/e;->a(Ljava/lang/String;)V

    new-instance v8, Lk1/K;

    const/16 v25, 0x0

    const/16 v26, 0x0

    const-wide/16 v11, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const-wide/16 v18, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const-wide/16 v23, 0x0

    const v27, 0xfffe

    move-wide/from16 v9, p1

    invoke-direct/range {v8 .. v27}, Lk1/K;-><init>(JJLo1/t;Lo1/p;Lo1/q;Lo1/i;Ljava/lang/String;JLv1/a;Lv1/p;Lr1/b;JLv1/l;LH0/W;I)V

    invoke-virtual {v2, v8}, Lk1/e;->f(Lk1/K;)I

    move-result v6

    :try_start_0
    invoke-virtual {v2, v3}, Lk1/e;->a(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v2, v6}, Lk1/e;->d(I)V

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v7}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Lk1/e;->a(Ljava/lang/String;)V

    :goto_3
    invoke-virtual {v2}, Lk1/e;->g()Lk1/h;

    move-result-object v0

    invoke-virtual {v1, v5}, Lm0/q;->q(Z)V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-virtual {v2, v6}, Lk1/e;->d(I)V

    throw v0
.end method

.method public static final j(LA0/r;Ljava/lang/String;ZLu0/d;Lu0/d;Lu0/d;Lu0/d;ZLVm/a;Lm0/l;II)V
    .locals 16

    move-object/from16 v2, p1

    move-object/from16 v7, p8

    move/from16 v10, p10

    const-string v0, "title"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onClick"

    invoke-static {v7, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v11, p9

    check-cast v11, Lm0/q;

    const v0, 0x35f4d836

    invoke-virtual {v11, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, v10, 0x6

    move-object/from16 v12, p0

    if-nez v0, :cond_1

    invoke-virtual {v11, v12}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int/2addr v0, v10

    goto :goto_1

    :cond_1
    move v0, v10

    :goto_1
    and-int/lit8 v1, v10, 0x30

    if-nez v1, :cond_3

    invoke-virtual {v11, v2}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x20

    goto :goto_2

    :cond_2
    const/16 v1, 0x10

    :goto_2
    or-int/2addr v0, v1

    :cond_3
    and-int/lit16 v1, v10, 0x180

    if-nez v1, :cond_5

    move/from16 v1, p2

    invoke-virtual {v11, v1}, Lm0/q;->h(Z)Z

    move-result v3

    if-eqz v3, :cond_4

    const/16 v3, 0x100

    goto :goto_3

    :cond_4
    const/16 v3, 0x80

    :goto_3
    or-int/2addr v0, v3

    goto :goto_4

    :cond_5
    move/from16 v1, p2

    :goto_4
    and-int/lit8 v3, p11, 0x8

    if-eqz v3, :cond_7

    or-int/lit16 v0, v0, 0xc00

    :cond_6
    move-object/from16 v4, p3

    goto :goto_6

    :cond_7
    and-int/lit16 v4, v10, 0xc00

    if-nez v4, :cond_6

    move-object/from16 v4, p3

    invoke-virtual {v11, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    const/16 v5, 0x800

    goto :goto_5

    :cond_8
    const/16 v5, 0x400

    :goto_5
    or-int/2addr v0, v5

    :goto_6
    and-int/lit8 v5, p11, 0x10

    if-eqz v5, :cond_a

    or-int/lit16 v0, v0, 0x6000

    :cond_9
    move-object/from16 v6, p4

    goto :goto_8

    :cond_a
    and-int/lit16 v6, v10, 0x6000

    if-nez v6, :cond_9

    move-object/from16 v6, p4

    invoke-virtual {v11, v6}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_b

    const/16 v8, 0x4000

    goto :goto_7

    :cond_b
    const/16 v8, 0x2000

    :goto_7
    or-int/2addr v0, v8

    :goto_8
    const/high16 v8, 0x30000

    and-int/2addr v8, v10

    move-object/from16 v9, p5

    if-nez v8, :cond_d

    invoke-virtual {v11, v9}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_c

    const/high16 v8, 0x20000

    goto :goto_9

    :cond_c
    const/high16 v8, 0x10000

    :goto_9
    or-int/2addr v0, v8

    :cond_d
    const/high16 v8, 0x180000

    and-int/2addr v8, v10

    if-nez v8, :cond_f

    move-object/from16 v8, p6

    invoke-virtual {v11, v8}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_e

    const/high16 v13, 0x100000

    goto :goto_a

    :cond_e
    const/high16 v13, 0x80000

    :goto_a
    or-int/2addr v0, v13

    goto :goto_b

    :cond_f
    move-object/from16 v8, p6

    :goto_b
    const/high16 v13, 0xc00000

    and-int/2addr v13, v10

    if-nez v13, :cond_11

    move/from16 v13, p7

    invoke-virtual {v11, v13}, Lm0/q;->h(Z)Z

    move-result v14

    if-eqz v14, :cond_10

    const/high16 v14, 0x800000

    goto :goto_c

    :cond_10
    const/high16 v14, 0x400000

    :goto_c
    or-int/2addr v0, v14

    goto :goto_d

    :cond_11
    move/from16 v13, p7

    :goto_d
    const/high16 v14, 0x6000000

    and-int/2addr v14, v10

    if-nez v14, :cond_13

    invoke-virtual {v11, v7}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_12

    const/high16 v14, 0x4000000

    goto :goto_e

    :cond_12
    const/high16 v14, 0x2000000

    :goto_e
    or-int/2addr v0, v14

    :cond_13
    move v14, v0

    const v0, 0x2492493

    and-int/2addr v0, v14

    const v15, 0x2492492

    if-ne v0, v15, :cond_15

    invoke-virtual {v11}, Lm0/q;->H()Z

    move-result v0

    if-nez v0, :cond_14

    goto :goto_f

    :cond_14
    invoke-virtual {v11}, Lm0/q;->Y()V

    move-object v7, v4

    move-object v5, v6

    move-object v4, v11

    goto :goto_10

    :cond_15
    :goto_f
    const/4 v0, 0x0

    if-eqz v3, :cond_16

    move-object v4, v0

    :cond_16
    if-eqz v5, :cond_17

    move-object v6, v0

    :cond_17
    sget-object v0, La1/k0;->l:Lm0/c1;

    invoke-virtual {v11, v0}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LO0/a;

    invoke-static {v11}, LP2/g;->q(Lm0/l;)LG/N0;

    move-result-object v15

    move-object v2, v4

    move-object v4, v6

    move-object v6, v0

    new-instance v0, LYf/a;

    move-object/from16 v3, p1

    move v5, v13

    invoke-direct/range {v0 .. v9}, LYf/a;-><init>(ZLVm/n;Ljava/lang/String;LVm/o;ZLO0/a;LVm/a;Lu0/d;Lu0/d;)V

    move-object v7, v2

    move-object v8, v4

    const v1, 0x790a15c4

    invoke-static {v1, v0, v11}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v3

    and-int/lit8 v0, v14, 0xe

    or-int/lit16 v0, v0, 0xc00

    shr-int/lit8 v1, v14, 0x12

    and-int/lit16 v1, v1, 0x380

    or-int v5, v0, v1

    const/4 v6, 0x0

    move-object/from16 v2, p8

    move-object v4, v11

    move-object v0, v12

    move-object v1, v15

    invoke-static/range {v0 .. v6}, LP2/m;->w(LA0/r;LG/N0;LVm/a;Lu0/d;Lm0/l;II)V

    move-object v5, v8

    :goto_10
    invoke-virtual {v4}, Lm0/q;->u()Lm0/t0;

    move-result-object v12

    if-eqz v12, :cond_18

    new-instance v0, LAh/W;

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move-object/from16 v6, p5

    move/from16 v8, p7

    move-object/from16 v9, p8

    move/from16 v11, p11

    move-object v4, v7

    move-object/from16 v7, p6

    invoke-direct/range {v0 .. v11}, LAh/W;-><init>(LA0/r;Ljava/lang/String;ZLu0/d;Lu0/d;Lu0/d;Lu0/d;ZLVm/a;II)V

    iput-object v0, v12, Lm0/t0;->d:LVm/n;

    :cond_18
    return-void
.end method

.method public static j0([[S[BI)I
    .locals 7

    array-length v0, p0

    const/4 v1, 0x0

    aget-object v2, p0, v1

    array-length v2, v2

    move v3, v1

    :goto_0
    if-ge v3, v2, :cond_1

    move v4, v1

    :goto_1
    if-ge v4, v0, :cond_0

    aget-object v5, p0, v4

    mul-int v6, v3, v0

    add-int/2addr v6, p2

    add-int/2addr v6, v4

    aget-byte v6, p1, v6

    and-int/lit16 v6, v6, 0xff

    int-to-short v6, v6

    aput-short v6, v5, v3

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    mul-int/2addr v0, v2

    return v0
.end method

.method public static final k(Ljava/lang/String;ILjava/lang/String;ZLVm/a;Lm0/l;II)V
    .locals 27

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v3, p2

    move-object/from16 v8, p4

    const-string v2, "title"

    invoke-static {v3, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "onClick"

    invoke-static {v8, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v2, p5

    check-cast v2, Lm0/q;

    const v4, 0x762afa3

    invoke-virtual {v2, v4}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v2, v0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v4, 0x4

    goto :goto_0

    :cond_0
    const/4 v4, 0x2

    :goto_0
    or-int v4, p6, v4

    invoke-virtual {v2, v1}, Lm0/q;->e(I)Z

    move-result v5

    if-eqz v5, :cond_1

    const/16 v5, 0x20

    goto :goto_1

    :cond_1
    const/16 v5, 0x10

    :goto_1
    or-int/2addr v4, v5

    invoke-virtual {v2, v3}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    const/16 v5, 0x100

    goto :goto_2

    :cond_2
    const/16 v5, 0x80

    :goto_2
    or-int/2addr v4, v5

    and-int/lit8 v5, p7, 0x8

    if-eqz v5, :cond_3

    or-int/lit16 v4, v4, 0xc00

    move/from16 v6, p3

    goto :goto_4

    :cond_3
    move/from16 v6, p3

    invoke-virtual {v2, v6}, Lm0/q;->h(Z)Z

    move-result v7

    if-eqz v7, :cond_4

    const/16 v7, 0x800

    goto :goto_3

    :cond_4
    const/16 v7, 0x400

    :goto_3
    or-int/2addr v4, v7

    :goto_4
    invoke-virtual {v2, v8}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    const/16 v7, 0x4000

    goto :goto_5

    :cond_5
    const/16 v7, 0x2000

    :goto_5
    or-int v10, v4, v7

    and-int/lit16 v4, v10, 0x2493

    const/16 v7, 0x2492

    if-ne v4, v7, :cond_7

    invoke-virtual {v2}, Lm0/q;->H()Z

    move-result v4

    if-nez v4, :cond_6

    goto :goto_6

    :cond_6
    invoke-virtual {v2}, Lm0/q;->Y()V

    move-object v7, v2

    move v4, v6

    goto/16 :goto_c

    :cond_7
    :goto_6
    const/4 v11, 0x1

    if-eqz v5, :cond_8

    move v5, v11

    goto :goto_7

    :cond_8
    move v5, v6

    :goto_7
    sget-object v4, LG/l;->a:LG/d;

    invoke-static {v2}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v4

    iget v4, v4, Lhh/i;->g:F

    invoke-static {v4}, LG/l;->g(F)LG/j;

    move-result-object v12

    sget-object v4, LA0/o;->a:LA0/o;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/16 v9, 0xe

    invoke-static/range {v4 .. v9}, Landroidx/compose/foundation/b;->c(LA0/r;ZLjava/lang/String;Lh1/j;LVm/a;I)LA0/r;

    move-result-object v6

    move-object v13, v4

    move/from16 v24, v5

    invoke-static {v2}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v4

    iget v4, v4, Lhh/i;->c:F

    const/4 v5, 0x0

    invoke-static {v6, v5, v4, v11}, LG/e;->J(LA0/r;FFI)LA0/r;

    move-result-object v4

    sget-object v5, LA0/d;->k:LA0/h;

    const/16 v6, 0x30

    invoke-static {v12, v5, v2, v6}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v5

    iget-wide v6, v2, Lm0/q;->T:J

    invoke-static {v6, v7}, Ljava/lang/Long;->hashCode(J)I

    move-result v6

    invoke-virtual {v2}, Lm0/q;->m()Lm0/o0;

    move-result-object v7

    invoke-static {v4, v2}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v4

    sget-object v8, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v12, LZ0/g;->b:LZ0/f;

    invoke-virtual {v2}, Lm0/q;->j0()V

    iget-boolean v8, v2, Lm0/q;->S:Z

    if-eqz v8, :cond_9

    invoke-virtual {v2, v12}, Lm0/q;->l(LVm/a;)V

    goto :goto_8

    :cond_9
    invoke-virtual {v2}, Lm0/q;->t0()V

    :goto_8
    sget-object v14, LZ0/g;->f:LZ0/e;

    invoke-static {v14, v5, v2}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v15, LZ0/g;->e:LZ0/e;

    invoke-static {v15, v7, v2}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    sget-object v6, LZ0/g;->g:LZ0/e;

    invoke-static {v2, v5, v6}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v5, LZ0/g;->h:LZ0/d;

    invoke-static {v2, v5}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v7, LZ0/g;->d:LZ0/e;

    invoke-static {v7, v4, v2}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    and-int/lit8 v4, v10, 0x70

    or-int/lit8 v4, v4, 0x6

    invoke-static {v1, v4, v2}, LIm/s;->w0(IILm0/l;)LM0/f;

    move-result-object v4

    invoke-static {v2}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v8

    iget-object v8, v8, Lhh/h;->k:Lhh/v;

    iget-wide v8, v8, Lhh/v;->a:J

    const/16 v11, 0x14

    int-to-float v11, v11

    invoke-static {v13, v11}, Landroidx/compose/foundation/layout/b;->n(LA0/r;F)LA0/r;

    move-result-object v11

    shr-int/lit8 v16, v10, 0x3

    and-int/lit8 v0, v16, 0x70

    or-int/lit16 v0, v0, 0x180

    move-object/from16 v16, v5

    move-wide/from16 v25, v8

    move-object v8, v6

    move-wide/from16 v5, v25

    const/4 v9, 0x0

    move-object v1, v8

    move v8, v0

    move-object v0, v1

    move-object v1, v7

    move-object v7, v2

    move-object v2, v4

    move-object v4, v11

    move-object/from16 v11, v16

    invoke-static/range {v2 .. v9}, Lj0/I0;->b(LM0/f;Ljava/lang/String;LA0/r;JLm0/l;II)V

    invoke-static {v7}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v2

    iget v2, v2, Lhh/i;->b:F

    invoke-static {v2}, LG/l;->g(F)LG/j;

    move-result-object v2

    sget-object v3, LA0/d;->m:LA0/g;

    const/4 v4, 0x0

    invoke-static {v2, v3, v7, v4}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v2

    iget-wide v5, v7, Lm0/q;->T:J

    invoke-static {v5, v6}, Ljava/lang/Long;->hashCode(J)I

    move-result v3

    invoke-virtual {v7}, Lm0/q;->m()Lm0/o0;

    move-result-object v5

    invoke-static {v13, v7}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v6

    invoke-virtual {v7}, Lm0/q;->j0()V

    iget-boolean v8, v7, Lm0/q;->S:Z

    if-eqz v8, :cond_a

    invoke-virtual {v7, v12}, Lm0/q;->l(LVm/a;)V

    goto :goto_9

    :cond_a
    invoke-virtual {v7}, Lm0/q;->t0()V

    :goto_9
    invoke-static {v14, v2, v7}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v15, v5, v7}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v3, v7, v0, v7, v11}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    invoke-static {v1, v6, v7}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v7}, Lhh/j;->e(Lm0/l;)Lhh/k;

    move-result-object v0

    iget-object v0, v0, Lhh/k;->l:Lk1/U;

    shr-int/lit8 v1, v10, 0x6

    and-int/lit8 v21, v1, 0xe

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/4 v3, 0x0

    move v1, v4

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    move-object/from16 v20, v7

    const-wide/16 v7, 0x0

    move v2, v10

    const-wide/16 v9, 0x0

    const/4 v11, 0x0

    const-wide/16 v12, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v22, 0x0

    const v23, 0x1fffe

    move-object/from16 v19, v0

    move v0, v2

    const/4 v1, 0x1

    move-object/from16 v2, p2

    invoke-static/range {v2 .. v23}, Lj0/o3;->c(Ljava/lang/String;LA0/r;JLP/f;JJLv1/k;JIZIILVm/k;Lk1/U;Lm0/l;III)V

    move-object/from16 v7, v20

    const v2, -0x26cd9e4

    invoke-virtual {v7, v2}, Lm0/q;->f0(I)V

    if-eqz p0, :cond_b

    invoke-static {v7}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v2

    iget-object v2, v2, Lhh/h;->k:Lhh/v;

    iget-wide v2, v2, Lhh/v;->d:J

    invoke-static {v7}, Lhh/j;->e(Lm0/l;)Lhh/k;

    move-result-object v4

    iget-object v4, v4, Lhh/k;->k:Lk1/U;

    and-int/lit8 v19, v0, 0xe

    const/4 v15, 0x0

    const/16 v16, 0x0

    move v0, v1

    const/4 v1, 0x0

    move-object/from16 v17, v4

    const/4 v4, 0x0

    const-wide/16 v5, 0x0

    move-object/from16 v20, v7

    const-wide/16 v7, 0x0

    const/4 v9, 0x0

    const-wide/16 v10, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    move-object/from16 v18, v20

    const/16 v20, 0x0

    const v21, 0x1fffa

    move-object/from16 v0, p0

    invoke-static/range {v0 .. v21}, Lj0/o3;->c(Ljava/lang/String;LA0/r;JLP/f;JJLv1/k;JIZIILVm/k;Lk1/U;Lm0/l;III)V

    move-object/from16 v7, v18

    const/4 v0, 0x1

    :goto_a
    const/4 v1, 0x0

    goto :goto_b

    :cond_b
    move v0, v1

    goto :goto_a

    :goto_b
    invoke-static {v7, v1, v0, v0}, Ly2/K;->d(Lm0/q;ZZZ)V

    move/from16 v4, v24

    :goto_c
    invoke-virtual {v7}, Lm0/q;->u()Lm0/t0;

    move-result-object v8

    if-eqz v8, :cond_c

    new-instance v0, LBg/l;

    move-object/from16 v1, p0

    move/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v5, p4

    move/from16 v6, p6

    move/from16 v7, p7

    invoke-direct/range {v0 .. v7}, LBg/l;-><init>(Ljava/lang/String;ILjava/lang/String;ZLVm/a;II)V

    iput-object v0, v8, Lm0/t0;->d:LVm/n;

    :cond_c
    return-void
.end method

.method public static k0([[[S[BIZ)I
    .locals 10

    array-length v0, p0

    const/4 v1, 0x0

    aget-object v2, p0, v1

    array-length v3, v2

    aget-object v2, v2, v1

    array-length v2, v2

    move v4, v1

    move v5, v4

    :goto_0
    if-ge v4, v3, :cond_3

    move v6, v1

    :goto_1
    if-ge v6, v2, :cond_2

    move v7, v1

    :goto_2
    if-ge v7, v0, :cond_1

    if-eqz p3, :cond_0

    if-le v4, v6, :cond_0

    goto :goto_3

    :cond_0
    aget-object v8, p0, v7

    aget-object v8, v8, v4

    add-int/lit8 v9, v5, 0x1

    add-int/2addr v5, p2

    aget-byte v5, p1, v5

    and-int/lit16 v5, v5, 0xff

    int-to-short v5, v5

    aput-short v5, v8, v6

    move v5, v9

    :goto_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_3
    return v5
.end method

.method public static final l(ILA0/r;LVm/k;LVm/k;Lm0/l;)V
    .locals 17

    move/from16 v1, p0

    move-object/from16 v4, p1

    move-object/from16 v3, p2

    move-object/from16 v5, p3

    const-string v0, "onNavEvent"

    invoke-static {v3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onOneTimeEvent"

    invoke-static {v5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v11, p4

    check-cast v11, Lm0/q;

    const v0, 0x4a0d8039    # 2318350.2f

    invoke-virtual {v11, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, v1, 0x6

    if-nez v0, :cond_1

    invoke-virtual {v11, v4}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int/2addr v0, v1

    goto :goto_1

    :cond_1
    move v0, v1

    :goto_1
    and-int/lit8 v2, v1, 0x30

    if-nez v2, :cond_3

    invoke-virtual {v11, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/16 v2, 0x20

    goto :goto_2

    :cond_2
    const/16 v2, 0x10

    :goto_2
    or-int/2addr v0, v2

    :cond_3
    and-int/lit16 v2, v1, 0x180

    if-nez v2, :cond_5

    invoke-virtual {v11, v5}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    const/16 v2, 0x100

    goto :goto_3

    :cond_4
    const/16 v2, 0x80

    :goto_3
    or-int/2addr v0, v2

    :cond_5
    and-int/lit16 v2, v0, 0x93

    const/16 v6, 0x92

    if-ne v2, v6, :cond_7

    invoke-virtual {v11}, Lm0/q;->H()Z

    move-result v2

    if-nez v2, :cond_6

    goto :goto_4

    :cond_6
    invoke-virtual {v11}, Lm0/q;->Y()V

    goto :goto_7

    :cond_7
    :goto_4
    const v2, 0x70b323c8

    invoke-virtual {v11, v2}, Lm0/q;->g0(I)V

    invoke-static {v11}, Lh3/a;->a(Lm0/l;)Landroidx/lifecycle/i0;

    move-result-object v7

    if-eqz v7, :cond_a

    const/4 v2, 0x0

    invoke-static {v7, v11, v2}, Landroidx/hilt/navigation/compose/HiltViewModelKt;->createHiltViewModelFactory(Landroidx/lifecycle/i0;Lm0/l;I)Landroidx/lifecycle/d0;

    move-result-object v9

    const v6, 0x671a9c9b

    invoke-virtual {v11, v6}, Lm0/q;->g0(I)V

    instance-of v6, v7, Landroidx/lifecycle/j;

    if-eqz v6, :cond_8

    move-object v6, v7

    check-cast v6, Landroidx/lifecycle/j;

    invoke-interface {v6}, Landroidx/lifecycle/j;->getDefaultViewModelCreationExtras()Lg3/c;

    move-result-object v6

    :goto_5
    move-object v10, v6

    goto :goto_6

    :cond_8
    sget-object v6, Lg3/a;->b:Lg3/a;

    goto :goto_5

    :goto_6
    const-class v6, Lcom/eightsleep/corepresentation/viewmodel/ContactUsViewModel;

    const/4 v8, 0x0

    invoke-static/range {v6 .. v11}, LP2/c;->O(Ljava/lang/Class;Landroidx/lifecycle/i0;Ljava/lang/String;Landroidx/lifecycle/d0;Lg3/c;Lm0/l;)Landroidx/lifecycle/b0;

    move-result-object v6

    invoke-virtual {v11, v2}, Lm0/q;->q(Z)V

    invoke-virtual {v11, v2}, Lm0/q;->q(Z)V

    check-cast v6, Lcom/eightsleep/corepresentation/viewmodel/ContactUsViewModel;

    new-instance v2, LAe/Q;

    const/16 v7, 0x1a

    invoke-direct {v2, v4, v7}, LAe/Q;-><init>(LA0/r;I)V

    const v7, -0x4d7857ba

    invoke-static {v7, v2, v11}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v13

    and-int/lit16 v2, v0, 0x380

    const v7, 0x6c06000

    or-int/2addr v2, v7

    shl-int/lit8 v0, v0, 0x6

    and-int/lit16 v0, v0, 0x1c00

    or-int v15, v2, v0

    move-object v14, v11

    const/4 v11, 0x0

    const-string v12, "contact_us"

    const/4 v5, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/16 v16, 0x61

    move-object/from16 v7, p3

    move-object v8, v3

    invoke-static/range {v5 .. v16}, LP2/o;->g(LA0/r;LL8/e;LVm/k;LVm/k;ZZLH0/w;Ljava/lang/String;LVm/r;Lm0/l;II)V

    move-object v11, v14

    :goto_7
    invoke-virtual {v11}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_9

    new-instance v0, LAe/s;

    const/4 v2, 0x7

    move-object/from16 v3, p2

    move-object/from16 v5, p3

    invoke-direct/range {v0 .. v5}, LAe/s;-><init>(IILVm/k;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_9
    return-void

    :cond_a
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No ViewModelStoreOwner was provided via LocalViewModelStoreOwner"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static l0(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/f0;[BIILA3/Z;)I
    .locals 6

    add-int/lit8 v0, p3, 0x1

    aget-byte p3, p2, p3

    if-gez p3, :cond_0

    invoke-static {p3, p2, v0, p5}, Lio/sentry/config/a;->T(I[BILA3/Z;)I

    move-result v0

    iget p3, p5, LA3/Z;->a:I

    :cond_0
    move v3, v0

    if-ltz p3, :cond_1

    sub-int/2addr p4, v3

    if-gt p3, p4, :cond_1

    add-int v4, v3, p3

    move-object v1, p0

    move-object v0, p1

    move-object v2, p2

    move-object v5, p5

    invoke-interface/range {v0 .. v5}, Lcom/google/crypto/tink/shaded/protobuf/f0;->e(Ljava/lang/Object;[BIILA3/Z;)V

    iput-object v1, v5, LA3/Z;->c:Ljava/lang/Object;

    return v4

    :cond_1
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;->g()Lcom/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    throw p0
.end method

.method public static final m(LC8/g;LA0/r;LVm/k;Lc8/e;Lm0/l;I)V
    .locals 26

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move/from16 v5, p5

    const/16 v0, 0x10

    const/4 v6, 0x0

    const/4 v7, 0x1

    const-string v8, "model"

    invoke-static {v1, v8}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v8, "modifier"

    invoke-static {v2, v8}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v8, "onUiAction"

    invoke-static {v3, v8}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v14, p4

    check-cast v14, Lm0/q;

    const v8, 0x1efcec15

    invoke-virtual {v14, v8}, Lm0/q;->h0(I)Lm0/q;

    const/4 v8, 0x6

    and-int/lit8 v9, v5, 0x6

    const/4 v10, 0x2

    if-nez v9, :cond_1

    invoke-virtual {v14, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    const/4 v9, 0x4

    goto :goto_0

    :cond_0
    move v9, v10

    :goto_0
    or-int/2addr v9, v5

    goto :goto_1

    :cond_1
    move v9, v5

    :goto_1
    and-int/lit8 v12, v5, 0x30

    if-nez v12, :cond_3

    invoke-virtual {v14, v2}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2

    const/16 v12, 0x20

    goto :goto_2

    :cond_2
    move v12, v0

    :goto_2
    or-int/2addr v9, v12

    :cond_3
    and-int/lit16 v12, v5, 0x180

    const/16 v13, 0x100

    if-nez v12, :cond_5

    invoke-virtual {v14, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4

    move v12, v13

    goto :goto_3

    :cond_4
    const/16 v12, 0x80

    :goto_3
    or-int/2addr v9, v12

    :cond_5
    and-int/lit16 v12, v5, 0xc00

    if-nez v12, :cond_8

    and-int/lit16 v12, v5, 0x1000

    if-nez v12, :cond_6

    invoke-virtual {v14, v4}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v12

    goto :goto_4

    :cond_6
    invoke-virtual {v14, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v12

    :goto_4
    if-eqz v12, :cond_7

    const/16 v12, 0x800

    goto :goto_5

    :cond_7
    const/16 v12, 0x400

    :goto_5
    or-int/2addr v9, v12

    :cond_8
    and-int/lit16 v12, v9, 0x493

    const/16 v15, 0x492

    if-ne v12, v15, :cond_a

    invoke-virtual {v14}, Lm0/q;->H()Z

    move-result v12

    if-nez v12, :cond_9

    goto :goto_6

    :cond_9
    invoke-virtual {v14}, Lm0/q;->Y()V

    goto/16 :goto_1c

    :cond_a
    :goto_6
    const/high16 v12, 0x3f800000    # 1.0f

    invoke-static {v2, v12}, Landroidx/compose/foundation/layout/b;->b(LA0/r;F)LA0/r;

    move-result-object v12

    invoke-static {v14}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v15

    iget v15, v15, Lhh/i;->f:F

    const/4 v11, 0x0

    invoke-static {v12, v15, v11, v10}, LG/e;->J(LA0/r;FFI)LA0/r;

    move-result-object v10

    invoke-static {v14}, Ly/x;->n(Lm0/l;)Ly/B0;

    move-result-object v11

    invoke-static {v10, v11, v7}, Ly/x;->o(LA0/r;Ly/B0;Z)LA0/r;

    move-result-object v10

    sget-object v11, LG/l;->a:LG/d;

    invoke-static {v14}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v11

    iget v11, v11, Lhh/i;->f:F

    invoke-static {v11}, LG/l;->g(F)LG/j;

    move-result-object v11

    sget-object v12, LA0/d;->m:LA0/g;

    invoke-static {v11, v12, v14, v6}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v11

    iget-wide v7, v14, Lm0/q;->T:J

    invoke-static {v7, v8}, Ljava/lang/Long;->hashCode(J)I

    move-result v7

    invoke-virtual {v14}, Lm0/q;->m()Lm0/o0;

    move-result-object v8

    invoke-static {v10, v14}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v10

    sget-object v12, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v12, LZ0/g;->b:LZ0/f;

    invoke-virtual {v14}, Lm0/q;->j0()V

    iget-boolean v15, v14, Lm0/q;->S:Z

    if-eqz v15, :cond_b

    invoke-virtual {v14, v12}, Lm0/q;->l(LVm/a;)V

    goto :goto_7

    :cond_b
    invoke-virtual {v14}, Lm0/q;->t0()V

    :goto_7
    sget-object v12, LZ0/g;->f:LZ0/e;

    invoke-static {v12, v11, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v11, LZ0/g;->e:LZ0/e;

    invoke-static {v11, v8, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    sget-object v8, LZ0/g;->g:LZ0/e;

    invoke-static {v14, v7, v8}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v7, LZ0/g;->h:LZ0/d;

    invoke-static {v14, v7}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v7, LZ0/g;->d:LZ0/e;

    invoke-static {v7, v10, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v7, LG/D;->a:LG/D;

    sget-object v8, LOg/e;->c:LOg/e;

    sget-object v10, Lm0/k;->a:Lm0/e;

    iget-boolean v11, v1, LC8/g;->e:Z

    const-string v12, "%s"

    iget-object v15, v1, LC8/g;->d:Ljava/lang/String;

    if-eqz v11, :cond_18

    const v11, 0x586c05e9

    invoke-virtual {v14, v11}, Lm0/q;->f0(I)V

    const v11, 0x7f1203ed

    invoke-static {v14, v11}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v11

    move-object/from16 v16, v12

    const v12, 0x7f1203e6

    move-object/from16 v18, v11

    invoke-static {v14, v12}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v11

    const v12, -0x567c2df

    invoke-virtual {v14, v12}, Lm0/q;->f0(I)V

    and-int/lit16 v12, v9, 0x380

    if-ne v12, v13, :cond_c

    const/16 v20, 0x1

    goto :goto_8

    :cond_c
    move/from16 v20, v6

    :goto_8
    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v13

    if-nez v20, :cond_d

    if-ne v13, v10, :cond_e

    :cond_d
    new-instance v13, LHe/q;

    invoke-direct {v13, v0, v3}, LHe/q;-><init>(ILVm/k;)V

    invoke-virtual {v14, v13}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_e
    check-cast v13, LVm/a;

    invoke-virtual {v14, v6}, Lm0/q;->q(Z)V

    move-object v0, v10

    const v10, 0x7f08017d

    move/from16 v20, v12

    const/4 v12, 0x0

    move-object/from16 v22, v15

    const/4 v15, 0x0

    move-object/from16 v23, v16

    const/16 v16, 0x8

    move-object/from16 v25, v0

    move v0, v9

    move-object/from16 v9, v18

    move/from16 v4, v20

    move-object/from16 v2, v22

    move-object/from16 v6, v23

    invoke-static/range {v9 .. v16}, Lio/sentry/config/a;->k(Ljava/lang/String;ILjava/lang/String;ZLVm/a;Lm0/l;II)V

    const v9, 0x7f1203e3

    invoke-static {v14, v9}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v9

    const v10, 0x7f1203e4

    invoke-static {v14, v10}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10, v6, v2}, Llo/u;->a0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const v2, -0x5678cd0

    invoke-virtual {v14, v2}, Lm0/q;->f0(I)V

    const/16 v2, 0x100

    if-ne v4, v2, :cond_f

    const/4 v2, 0x1

    goto :goto_9

    :cond_f
    const/4 v2, 0x0

    :goto_9
    and-int/lit8 v0, v0, 0xe

    const/4 v6, 0x4

    if-ne v0, v6, :cond_10

    const/4 v0, 0x1

    goto :goto_a

    :cond_10
    const/4 v0, 0x0

    :goto_a
    or-int/2addr v0, v2

    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v2

    if-nez v0, :cond_12

    move-object/from16 v0, v25

    if-ne v2, v0, :cond_11

    goto :goto_b

    :cond_11
    const/4 v6, 0x0

    goto :goto_c

    :cond_12
    move-object/from16 v0, v25

    :goto_b
    new-instance v2, LI8/d;

    const/4 v6, 0x0

    invoke-direct {v2, v3, v1, v6}, LI8/d;-><init>(LVm/k;LC8/g;I)V

    invoke-virtual {v14, v2}, Lm0/q;->q0(Ljava/lang/Object;)V

    :goto_c
    move-object v13, v2

    check-cast v13, LVm/a;

    invoke-virtual {v14, v6}, Lm0/q;->q(Z)V

    const v10, 0x7f080225

    const/4 v12, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x8

    invoke-static/range {v9 .. v16}, Lio/sentry/config/a;->k(Ljava/lang/String;ILjava/lang/String;ZLVm/a;Lm0/l;II)V

    const/4 v2, 0x6

    invoke-static {v7, v14, v2}, LP2/z;->I(LG/C;Lm0/l;I)V

    const v2, 0x7f1203e6

    invoke-static {v14, v2}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v12

    if-nez p3, :cond_13

    const/16 v16, 0x1

    goto :goto_d

    :cond_13
    const/16 v16, 0x0

    :goto_d
    if-eqz p3, :cond_14

    const/16 v17, 0x1

    goto :goto_e

    :cond_14
    const/16 v17, 0x0

    :goto_e
    const v2, -0x5674f9f

    invoke-virtual {v14, v2}, Lm0/q;->f0(I)V

    const/16 v2, 0x100

    if-ne v4, v2, :cond_15

    const/4 v2, 0x1

    goto :goto_f

    :cond_15
    const/4 v2, 0x0

    :goto_f
    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v4

    if-nez v2, :cond_16

    if-ne v4, v0, :cond_17

    :cond_16
    new-instance v4, LHe/q;

    const/16 v0, 0x11

    invoke-direct {v4, v0, v3}, LHe/q;-><init>(ILVm/k;)V

    invoke-virtual {v14, v4}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_17
    move-object/from16 v20, v4

    check-cast v20, LVm/a;

    const/4 v6, 0x0

    invoke-virtual {v14, v6}, Lm0/q;->q(Z)V

    const/16 v19, 0x0

    const/16 v22, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v13, 0x0

    move-object/from16 v21, v14

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v18, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x67b

    move-object v9, v8

    invoke-virtual/range {v9 .. v24}, LOg/e;->h(LA0/r;Lkm/o;Ljava/lang/String;Ljava/lang/Integer;Lhh/n;Lhh/d;ZZLhh/e;LJg/b;LVm/a;Lm0/l;III)V

    move-object/from16 v14, v21

    const/4 v6, 0x0

    invoke-virtual {v14, v6}, Lm0/q;->q(Z)V

    :goto_10
    const/4 v2, 0x1

    goto/16 :goto_1b

    :cond_18
    move-object v4, v8

    move v0, v9

    move-object v8, v10

    move-object v6, v12

    move-object v2, v15

    const v9, 0x587fcc7a

    invoke-virtual {v14, v9}, Lm0/q;->f0(I)V

    const v9, 0x7f1203e7

    invoke-static {v14, v9}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v9

    const v10, 0x7f1203e8

    invoke-static {v14, v10}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v11

    iget-object v10, v1, LC8/g;->a:Ljava/lang/String;

    iget-object v12, v1, LC8/g;->b:Ljava/lang/String;

    if-eqz v10, :cond_19

    if-eqz v12, :cond_19

    const/4 v13, 0x1

    goto :goto_11

    :cond_19
    const/4 v13, 0x0

    :goto_11
    const v15, -0x56711a7

    invoke-virtual {v14, v15}, Lm0/q;->f0(I)V

    invoke-virtual {v14, v10}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v15

    invoke-virtual {v14, v12}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v16

    or-int v15, v15, v16

    move/from16 v16, v15

    and-int/lit16 v15, v0, 0x380

    move/from16 v18, v0

    const/16 v0, 0x100

    if-ne v15, v0, :cond_1a

    const/4 v0, 0x1

    goto :goto_12

    :cond_1a
    const/4 v0, 0x0

    :goto_12
    or-int v0, v16, v0

    move/from16 v16, v0

    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v0

    if-nez v16, :cond_1c

    if-ne v0, v8, :cond_1b

    goto :goto_13

    :cond_1b
    move-object/from16 v19, v4

    const/4 v4, 0x0

    goto :goto_14

    :cond_1c
    :goto_13
    new-instance v0, LI8/e;

    move-object/from16 v19, v4

    const/4 v4, 0x0

    invoke-direct {v0, v10, v12, v3, v4}, LI8/e;-><init>(Ljava/lang/String;Ljava/lang/String;LVm/k;I)V

    invoke-virtual {v14, v0}, Lm0/q;->q0(Ljava/lang/Object;)V

    :goto_14
    check-cast v0, LVm/a;

    invoke-virtual {v14, v4}, Lm0/q;->q(Z)V

    const/16 v16, 0x0

    move-object v4, v10

    const v10, 0x7f08017d

    move/from16 v20, v15

    const/4 v15, 0x0

    move v5, v13

    move-object v13, v0

    move-object v0, v12

    move v12, v5

    move/from16 v5, v20

    invoke-static/range {v9 .. v16}, Lio/sentry/config/a;->k(Ljava/lang/String;ILjava/lang/String;ZLVm/a;Lm0/l;II)V

    const v9, 0x7f1203e9

    invoke-static {v14, v9}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v9

    iget-object v10, v1, LC8/g;->c:Ljava/lang/String;

    invoke-static {v9, v6, v10}, Llo/u;->a0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const v10, 0x7f1203ea

    invoke-static {v14, v10}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v11

    const v10, -0x566aa1c

    invoke-virtual {v14, v10}, Lm0/q;->f0(I)V

    const/16 v10, 0x100

    if-ne v5, v10, :cond_1d

    const/4 v10, 0x1

    goto :goto_15

    :cond_1d
    const/4 v10, 0x0

    :goto_15
    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v12

    if-nez v10, :cond_1e

    if-ne v12, v8, :cond_1f

    :cond_1e
    new-instance v12, LHe/q;

    const/16 v10, 0x12

    invoke-direct {v12, v10, v3}, LHe/q;-><init>(ILVm/k;)V

    invoke-virtual {v14, v12}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_1f
    move-object v13, v12

    check-cast v13, LVm/a;

    const/4 v10, 0x0

    invoke-virtual {v14, v10}, Lm0/q;->q(Z)V

    const v10, 0x7f0801af

    const/4 v12, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x8

    invoke-static/range {v9 .. v16}, Lio/sentry/config/a;->k(Ljava/lang/String;ILjava/lang/String;ZLVm/a;Lm0/l;II)V

    const v9, 0x7f1203e2

    invoke-static {v14, v9}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v6, v2}, Llo/u;->a0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const v2, 0x7f1203e5

    invoke-static {v14, v2}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v11

    const v2, -0x5667490

    invoke-virtual {v14, v2}, Lm0/q;->f0(I)V

    const/16 v2, 0x100

    if-ne v5, v2, :cond_20

    const/4 v2, 0x1

    goto :goto_16

    :cond_20
    const/4 v2, 0x0

    :goto_16
    and-int/lit8 v6, v18, 0xe

    const/4 v10, 0x4

    if-ne v6, v10, :cond_21

    const/4 v6, 0x1

    goto :goto_17

    :cond_21
    const/4 v6, 0x0

    :goto_17
    or-int/2addr v2, v6

    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v6

    if-nez v2, :cond_22

    if-ne v6, v8, :cond_23

    :cond_22
    new-instance v6, LI8/d;

    const/4 v2, 0x1

    invoke-direct {v6, v3, v1, v2}, LI8/d;-><init>(LVm/k;LC8/g;I)V

    invoke-virtual {v14, v6}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_23
    move-object v13, v6

    check-cast v13, LVm/a;

    const/4 v6, 0x0

    invoke-virtual {v14, v6}, Lm0/q;->q(Z)V

    const v10, 0x7f080225

    const/4 v12, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x8

    invoke-static/range {v9 .. v16}, Lio/sentry/config/a;->k(Ljava/lang/String;ILjava/lang/String;ZLVm/a;Lm0/l;II)V

    const/4 v2, 0x6

    invoke-static {v7, v14, v2}, LP2/z;->I(LG/C;Lm0/l;I)V

    const v2, 0x7f1203ec

    invoke-static {v14, v2}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v12

    if-nez p3, :cond_24

    if-eqz v4, :cond_24

    if-eqz v0, :cond_24

    const/16 v16, 0x1

    goto :goto_18

    :cond_24
    const/16 v16, 0x0

    :goto_18
    if-eqz p3, :cond_25

    const/16 v17, 0x1

    goto :goto_19

    :cond_25
    const/16 v17, 0x0

    :goto_19
    const v2, -0x5663186

    invoke-virtual {v14, v2}, Lm0/q;->f0(I)V

    invoke-virtual {v14, v4}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v14, v0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v6

    or-int/2addr v2, v6

    const/16 v10, 0x100

    if-ne v5, v10, :cond_26

    const/4 v5, 0x1

    goto :goto_1a

    :cond_26
    const/4 v5, 0x0

    :goto_1a
    or-int/2addr v2, v5

    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v5

    if-nez v2, :cond_27

    if-ne v5, v8, :cond_28

    :cond_27
    new-instance v5, LI8/e;

    const/4 v2, 0x1

    invoke-direct {v5, v4, v0, v3, v2}, LI8/e;-><init>(Ljava/lang/String;Ljava/lang/String;LVm/k;I)V

    invoke-virtual {v14, v5}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_28
    move-object/from16 v20, v5

    check-cast v20, LVm/a;

    const/4 v6, 0x0

    invoke-virtual {v14, v6}, Lm0/q;->q(Z)V

    move-object/from16 v9, v19

    const/16 v19, 0x0

    const/16 v22, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v13, 0x0

    move-object/from16 v21, v14

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v18, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x67b

    invoke-virtual/range {v9 .. v24}, LOg/e;->h(LA0/r;Lkm/o;Ljava/lang/String;Ljava/lang/Integer;Lhh/n;Lhh/d;ZZLhh/e;LJg/b;LVm/a;Lm0/l;III)V

    move-object/from16 v14, v21

    const/4 v6, 0x0

    invoke-virtual {v14, v6}, Lm0/q;->q(Z)V

    goto/16 :goto_10

    :goto_1b
    invoke-virtual {v14, v2}, Lm0/q;->q(Z)V

    :goto_1c
    invoke-virtual {v14}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_29

    new-instance v0, LAe/f;

    const/16 v6, 0xc

    move-object/from16 v2, p1

    move-object/from16 v4, p3

    move/from16 v5, p5

    invoke-direct/range {v0 .. v6}, LAe/f;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_29
    return-void
.end method

.method public static final m0([F[FI[F)V
    .locals 16

    move/from16 v0, p2

    if-nez v0, :cond_0

    const-string v1, "At least one point must be provided"

    invoke-static {v1}, LW0/a;->a(Ljava/lang/String;)V

    :cond_0
    const/4 v1, 0x2

    if-lt v1, v0, :cond_1

    add-int/lit8 v1, v0, -0x1

    :cond_1
    add-int/lit8 v2, v1, 0x1

    new-array v3, v2, [[F

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, v2, :cond_2

    new-array v6, v0, [F

    aput-object v6, v3, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_2
    move v5, v4

    :goto_1
    const/high16 v6, 0x3f800000    # 1.0f

    if-ge v5, v0, :cond_4

    aget-object v7, v3, v4

    aput v6, v7, v5

    const/4 v6, 0x1

    :goto_2
    if-ge v6, v2, :cond_3

    add-int/lit8 v7, v6, -0x1

    aget-object v7, v3, v7

    aget v7, v7, v5

    aget v8, p0, v5

    mul-float/2addr v7, v8

    aget-object v8, v3, v6

    aput v7, v8, v5

    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_4
    new-array v5, v2, [[F

    move v7, v4

    :goto_3
    if-ge v7, v2, :cond_5

    new-array v8, v0, [F

    aput-object v8, v5, v7

    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    :cond_5
    new-array v7, v2, [[F

    move v8, v4

    :goto_4
    if-ge v8, v2, :cond_6

    new-array v9, v2, [F

    aput-object v9, v7, v8

    add-int/lit8 v8, v8, 0x1

    goto :goto_4

    :cond_6
    move v8, v4

    :goto_5
    if-ge v8, v2, :cond_d

    aget-object v9, v5, v8

    aget-object v10, v3, v8

    const-string v11, "<this>"

    invoke-static {v10, v11}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v11, "destination"

    invoke-static {v9, v11}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v10, v4, v9, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move v10, v4

    :goto_6
    if-ge v10, v8, :cond_8

    aget-object v11, v5, v10

    invoke-static {v9, v11}, Lio/sentry/config/a;->X([F[F)F

    move-result v12

    move v13, v4

    :goto_7
    if-ge v13, v0, :cond_7

    aget v14, v9, v13

    aget v15, v11, v13

    mul-float/2addr v15, v12

    sub-float/2addr v14, v15

    aput v14, v9, v13

    add-int/lit8 v13, v13, 0x1

    goto :goto_7

    :cond_7
    add-int/lit8 v10, v10, 0x1

    goto :goto_6

    :cond_8
    invoke-static {v9, v9}, Lio/sentry/config/a;->X([F[F)F

    move-result v10

    float-to-double v10, v10

    invoke-static {v10, v11}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v10

    double-to-float v10, v10

    const v11, 0x358637bd    # 1.0E-6f

    cmpg-float v12, v10, v11

    if-gez v12, :cond_9

    move v10, v11

    :cond_9
    div-float v10, v6, v10

    move v11, v4

    :goto_8
    if-ge v11, v0, :cond_a

    aget v12, v9, v11

    mul-float/2addr v12, v10

    aput v12, v9, v11

    add-int/lit8 v11, v11, 0x1

    goto :goto_8

    :cond_a
    aget-object v10, v7, v8

    move v11, v4

    :goto_9
    if-ge v11, v2, :cond_c

    if-ge v11, v8, :cond_b

    const/4 v12, 0x0

    goto :goto_a

    :cond_b
    aget-object v12, v3, v11

    invoke-static {v9, v12}, Lio/sentry/config/a;->X([F[F)F

    move-result v12

    :goto_a
    aput v12, v10, v11

    add-int/lit8 v11, v11, 0x1

    goto :goto_9

    :cond_c
    add-int/lit8 v8, v8, 0x1

    goto :goto_5

    :cond_d
    move v0, v1

    :goto_b
    const/4 v2, -0x1

    if-ge v2, v0, :cond_f

    aget-object v2, v5, v0

    move-object/from16 v3, p1

    invoke-static {v2, v3}, Lio/sentry/config/a;->X([F[F)F

    move-result v2

    aget-object v4, v7, v0

    add-int/lit8 v6, v0, 0x1

    if-gt v6, v1, :cond_e

    move v8, v1

    :goto_c
    aget v9, v4, v8

    aget v10, p3, v8

    mul-float/2addr v9, v10

    sub-float/2addr v2, v9

    if-eq v8, v6, :cond_e

    add-int/lit8 v8, v8, -0x1

    goto :goto_c

    :cond_e
    aget v4, v4, v0

    div-float/2addr v2, v4

    aput v2, p3, v0

    add-int/lit8 v0, v0, -0x1

    goto :goto_b

    :cond_f
    return-void
.end method

.method public static final n(LFf/V;Lm0/l;I)V
    .locals 8

    const/4 v0, 0x4

    check-cast p1, Lm0/q;

    const v1, 0x6fb49fed

    invoke-virtual {p1, v1}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v1, p2, 0x6

    const/4 v2, 0x2

    if-nez v1, :cond_1

    invoke-virtual {p1, p0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    or-int/2addr v1, p2

    goto :goto_1

    :cond_1
    move v1, p2

    :goto_1
    and-int/lit8 v1, v1, 0x3

    if-ne v1, v2, :cond_3

    invoke-virtual {p1}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {p1}, Lm0/q;->Y()V

    goto :goto_4

    :cond_3
    :goto_2
    sget-object v1, LG/l;->a:LG/d;

    invoke-static {p1}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v1

    iget v1, v1, Lhh/i;->e:F

    invoke-static {v1}, LG/l;->g(F)LG/j;

    move-result-object v1

    sget-object v2, LA0/o;->a:LA0/o;

    sget-object v3, LA0/d;->m:LA0/g;

    const/4 v4, 0x0

    invoke-static {v1, v3, p1, v4}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v1

    iget-wide v5, p1, Lm0/q;->T:J

    invoke-static {v5, v6}, Ljava/lang/Long;->hashCode(J)I

    move-result v3

    invoke-virtual {p1}, Lm0/q;->m()Lm0/o0;

    move-result-object v5

    invoke-static {v2, p1}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v2

    sget-object v6, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v6, LZ0/g;->b:LZ0/f;

    invoke-virtual {p1}, Lm0/q;->j0()V

    iget-boolean v7, p1, Lm0/q;->S:Z

    if-eqz v7, :cond_4

    invoke-virtual {p1, v6}, Lm0/q;->l(LVm/a;)V

    goto :goto_3

    :cond_4
    invoke-virtual {p1}, Lm0/q;->t0()V

    :goto_3
    sget-object v6, LZ0/g;->f:LZ0/e;

    invoke-static {v6, v1, p1}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v1, LZ0/g;->e:LZ0/e;

    invoke-static {v1, v5, p1}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v3, LZ0/g;->g:LZ0/e;

    invoke-static {p1, v1, v3}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v1, LZ0/g;->h:LZ0/d;

    invoke-static {p1, v1}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v1, LZ0/g;->d:LZ0/e;

    invoke-static {v1, v2, p1}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    iget v1, p0, LFf/V;->a:I

    invoke-static {v1, v4, p1}, Lio/sentry/config/a;->t(IILm0/l;)V

    const v1, -0x2c080ee6

    invoke-virtual {p1, v1}, Lm0/q;->f0(I)V

    iget-object v1, p0, LFf/V;->b:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5

    invoke-static {v1, p1, v4}, Lio/sentry/config/a;->a(Ljava/util/ArrayList;Lm0/l;I)V

    :cond_5
    invoke-virtual {p1, v4}, Lm0/q;->q(Z)V

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Lm0/q;->q(Z)V

    :goto_4
    invoke-virtual {p1}, Lm0/q;->u()Lm0/t0;

    move-result-object p1

    if-eqz p1, :cond_6

    new-instance v1, LI/k;

    invoke-direct {v1, p0, p2, v0}, LI/k;-><init>(Ljava/lang/Object;II)V

    iput-object v1, p1, Lm0/t0;->d:LVm/n;

    :cond_6
    return-void
.end method

.method public static final n0(Ljava/lang/String;Ljava/lang/String;Lm0/l;)Ljava/time/format/DateTimeFormatter;
    .locals 3

    check-cast p2, Lm0/q;

    const v0, -0x69992d2

    invoke-virtual {p2, v0}, Lm0/q;->f0(I)V

    sget-object v0, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->a:Lm0/B;

    invoke-virtual {p2, v0}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/res/Configuration;

    invoke-static {v0}, LP2/p;->w(Landroid/content/res/Configuration;)Ljava/util/Locale;

    move-result-object v0

    const v1, -0x4730ad1

    invoke-virtual {p2, v1}, Lm0/q;->f0(I)V

    invoke-virtual {p2, v0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {p2}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v2

    if-nez v1, :cond_0

    sget-object v1, Lm0/k;->a:Lm0/e;

    if-ne v2, v1, :cond_2

    :cond_0
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    invoke-static {v0, p1}, Landroid/text/format/DateFormat;->getBestDateTimePattern(Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :goto_0
    invoke-static {p0, v0}, Ljava/time/format/DateTimeFormatter;->ofPattern(Ljava/lang/String;Ljava/util/Locale;)Ljava/time/format/DateTimeFormatter;

    move-result-object v2

    invoke-virtual {p2, v2}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_2
    check-cast v2, Ljava/time/format/DateTimeFormatter;

    const/4 p0, 0x0

    invoke-virtual {p2, p0}, Lm0/q;->q(Z)V

    invoke-static {v2}, Lkotlin/jvm/internal/l;->g(Ljava/lang/Object;)V

    invoke-virtual {p2, p0}, Lm0/q;->q(Z)V

    return-object v2
.end method

.method public static final o(Lcom/eightsleep/presentation_metrics/viewmodel/EditSleepSessionViewModel;LA0/r;LVm/k;LVm/k;Lm0/l;I)V
    .locals 12

    move-object v3, p3

    const-string v0, "viewModel"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "modifier"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onOneTimeEvent"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onNavEvent"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v9, p4

    check-cast v9, Lm0/q;

    const v0, 0x38034876

    invoke-virtual {v9, v0}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v9, p0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int v0, p5, v0

    invoke-virtual {v9, p1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/16 v4, 0x20

    goto :goto_1

    :cond_1
    const/16 v4, 0x10

    :goto_1
    or-int/2addr v0, v4

    invoke-virtual {v9, p2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    const/16 v4, 0x100

    goto :goto_2

    :cond_2
    const/16 v4, 0x80

    :goto_2
    or-int/2addr v0, v4

    invoke-virtual {v9, p3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    const/16 v4, 0x800

    goto :goto_3

    :cond_3
    const/16 v4, 0x400

    :goto_3
    or-int/2addr v0, v4

    and-int/lit16 v4, v0, 0x493

    const/16 v5, 0x492

    if-ne v4, v5, :cond_5

    invoke-virtual {v9}, Lm0/q;->H()Z

    move-result v4

    if-nez v4, :cond_4

    goto :goto_4

    :cond_4
    invoke-virtual {v9}, Lm0/q;->Y()V

    goto :goto_5

    :cond_5
    :goto_4
    new-instance v4, LMi/s;

    const/16 v5, 0xc

    invoke-direct {v4, p1, v5}, LMi/s;-><init>(LA0/r;I)V

    const v5, 0x2431215a

    invoke-static {v5, v4, v9}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v8

    shl-int/lit8 v4, v0, 0x3

    and-int/lit8 v4, v4, 0x70

    const/high16 v5, 0x6c00000

    or-int/2addr v4, v5

    and-int/lit16 v5, v0, 0x380

    or-int/2addr v4, v5

    and-int/lit16 v0, v0, 0x1c00

    or-int v10, v4, v0

    const/4 v6, 0x0

    const-string v7, "edit_sleep_session"

    const/4 v0, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v11, 0x71

    move-object v1, p0

    move-object v2, p2

    invoke-static/range {v0 .. v11}, LP2/o;->g(LA0/r;LL8/e;LVm/k;LVm/k;ZZLH0/w;Ljava/lang/String;LVm/r;Lm0/l;II)V

    :goto_5
    invoke-virtual {v9}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_6

    new-instance v0, LXe/j1;

    const/16 v6, 0xf

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move/from16 v5, p5

    invoke-direct/range {v0 .. v6}, LXe/j1;-><init>(Ljava/lang/Object;Ljava/lang/Object;LVm/k;LVm/k;II)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_6
    return-void
.end method

.method public static o0(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 0

    if-eqz p0, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final p(Lwg/C;Lc8/e;LA0/r;LVm/k;Lm0/l;I)V
    .locals 29

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move/from16 v5, p5

    const-string v0, "model"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "modifier"

    invoke-static {v3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onUiAction"

    invoke-static {v4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v13, p4

    check-cast v13, Lm0/q;

    const v0, -0x340f51be    # -3.15465E7f

    invoke-virtual {v13, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, v5, 0x6

    if-nez v0, :cond_1

    invoke-virtual {v13, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int/2addr v0, v5

    goto :goto_1

    :cond_1
    move v0, v5

    :goto_1
    and-int/lit8 v6, v5, 0x30

    if-nez v6, :cond_3

    invoke-virtual {v13, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    const/16 v6, 0x20

    goto :goto_2

    :cond_2
    const/16 v6, 0x10

    :goto_2
    or-int/2addr v0, v6

    :cond_3
    and-int/lit16 v6, v5, 0x180

    if-nez v6, :cond_5

    invoke-virtual {v13, v3}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    const/16 v6, 0x100

    goto :goto_3

    :cond_4
    const/16 v6, 0x80

    :goto_3
    or-int/2addr v0, v6

    :cond_5
    and-int/lit16 v6, v5, 0xc00

    if-nez v6, :cond_7

    invoke-virtual {v13, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    const/16 v6, 0x800

    goto :goto_4

    :cond_6
    const/16 v6, 0x400

    :goto_4
    or-int/2addr v0, v6

    :cond_7
    and-int/lit16 v6, v0, 0x493

    const/16 v7, 0x492

    if-ne v6, v7, :cond_9

    invoke-virtual {v13}, Lm0/q;->H()Z

    move-result v6

    if-nez v6, :cond_8

    goto :goto_5

    :cond_8
    invoke-virtual {v13}, Lm0/q;->Y()V

    goto/16 :goto_e

    :cond_9
    :goto_5
    invoke-virtual {v13}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v6

    sget-object v14, Lm0/k;->a:Lm0/e;

    if-ne v6, v14, :cond_a

    invoke-static {v13}, Lm0/r;->q(Lm0/l;)Lwo/z;

    move-result-object v6

    invoke-virtual {v13, v6}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_a
    move-object v15, v6

    check-cast v15, Lwo/z;

    sget-object v6, Landroidx/compose/foundation/layout/b;->c:Landroidx/compose/foundation/layout/FillElement;

    invoke-interface {v3, v6}, LA0/r;->then(LA0/r;)LA0/r;

    move-result-object v6

    sget-object v7, LG/l;->c:LG/f;

    sget-object v8, LA0/d;->m:LA0/g;

    const/4 v9, 0x0

    invoke-static {v7, v8, v13, v9}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v7

    iget-wide v10, v13, Lm0/q;->T:J

    invoke-static {v10, v11}, Ljava/lang/Long;->hashCode(J)I

    move-result v8

    invoke-virtual {v13}, Lm0/q;->m()Lm0/o0;

    move-result-object v10

    invoke-static {v6, v13}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v6

    sget-object v11, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v11, LZ0/g;->b:LZ0/f;

    invoke-virtual {v13}, Lm0/q;->j0()V

    iget-boolean v12, v13, Lm0/q;->S:Z

    if-eqz v12, :cond_b

    invoke-virtual {v13, v11}, Lm0/q;->l(LVm/a;)V

    goto :goto_6

    :cond_b
    invoke-virtual {v13}, Lm0/q;->t0()V

    :goto_6
    sget-object v11, LZ0/g;->f:LZ0/e;

    invoke-static {v11, v7, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v7, LZ0/g;->e:LZ0/e;

    invoke-static {v7, v10, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    sget-object v8, LZ0/g;->g:LZ0/e;

    invoke-static {v13, v7, v8}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v7, LZ0/g;->h:LZ0/d;

    invoke-static {v13, v7}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v7, LZ0/g;->d:LZ0/e;

    invoke-static {v7, v6, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v12, LG/D;->a:LG/D;

    const v6, 0x2bae26c

    invoke-virtual {v13, v6}, Lm0/q;->f0(I)V

    invoke-virtual {v13, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    invoke-virtual {v13}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v7

    if-nez v6, :cond_c

    if-ne v7, v14, :cond_d

    :cond_c
    new-instance v7, Lko/n;

    const/16 v6, 0x14

    invoke-direct {v7, v1, v6}, Lko/n;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v13, v7}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_d
    move-object v8, v7

    check-cast v8, LVm/a;

    invoke-virtual {v13, v9}, Lm0/q;->q(Z)V

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x3

    move-object/from16 v28, v13

    move v13, v9

    move-object/from16 v9, v28

    invoke-static/range {v6 .. v11}, LL/I;->b(IFLVm/a;Lm0/l;II)LL/b;

    move-result-object v6

    const/4 v7, 0x3

    invoke-static {v13, v13, v7, v9}, LI/D;->a(IIILm0/l;)LI/A;

    move-result-object v7

    const v8, 0x2baf07f

    invoke-virtual {v9, v8}, Lm0/q;->f0(I)V

    invoke-virtual {v6}, LL/b;->m()I

    move-result v8

    const/4 v10, 0x1

    iget-object v11, v1, Lwg/C;->b:Ljava/util/List;

    move-object/from16 v16, v12

    iget-object v12, v6, LL/E;->d:LA3/n;

    if-le v8, v10, :cond_10

    iget-object v8, v12, LA3/n;->c:Ljava/lang/Object;

    check-cast v8, Lm0/f0;

    invoke-virtual {v8}, Lm0/f0;->k()I

    move-result v8

    invoke-static {v8, v11}, LIm/r;->c1(ILjava/util/List;)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v17, v8

    new-instance v8, Lzg/h;

    const/4 v10, 0x0

    invoke-direct {v8, v1, v10}, Lzg/h;-><init>(Lwg/C;I)V

    sget-object v10, Lzg/i;->a:Lzg/i;

    const v13, 0x2bb45a7

    invoke-virtual {v9, v13}, Lm0/q;->f0(I)V

    invoke-virtual {v9, v15}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v13

    invoke-virtual {v9, v6}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v20

    or-int v13, v13, v20

    invoke-virtual {v9, v7}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v20

    or-int v13, v13, v20

    invoke-virtual {v9}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v3

    if-nez v13, :cond_e

    if-ne v3, v14, :cond_f

    :cond_e
    new-instance v3, Ly8/a;

    invoke-direct {v3, v15, v6, v7}, Ly8/a;-><init>(Lwo/z;LL/b;LI/A;)V

    invoke-virtual {v9, v3}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_f
    check-cast v3, LVm/n;

    const/4 v13, 0x0

    invoke-virtual {v9, v13}, Lm0/q;->q(Z)V

    move-object v7, v11

    const/4 v11, 0x0

    move-object v15, v12

    const/4 v12, 0x0

    move-object/from16 v19, v7

    iget-object v7, v1, Lwg/C;->b:Ljava/util/List;

    move-object/from16 v20, v14

    const/4 v14, 0x0

    move-object/from16 v21, v15

    const/16 v15, 0x60

    move-object/from16 v23, v10

    move-object v10, v3

    move v3, v13

    move-object v13, v9

    move-object/from16 v9, v23

    move-object/from16 v24, v16

    move-object/from16 v26, v19

    move-object/from16 v23, v20

    move-object/from16 v27, v21

    move-object/from16 v16, v6

    move-object/from16 v6, v17

    invoke-static/range {v6 .. v15}, LLg/l;->a(Ljava/lang/Object;Ljava/util/List;LVm/o;LVm/o;LVm/n;ZLu0/d;Lm0/l;II)V

    goto :goto_7

    :cond_10
    move-object/from16 v26, v11

    move-object/from16 v27, v12

    move v3, v13

    move-object/from16 v23, v14

    move-object/from16 v24, v16

    move-object/from16 v16, v6

    move-object v13, v9

    :goto_7
    invoke-virtual {v13, v3}, Lm0/q;->q(Z)V

    sget-object v6, LA0/o;->a:LA0/o;

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-static {v6, v7}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v6

    move-object/from16 v8, v24

    const/4 v9, 0x1

    invoke-virtual {v8, v6, v7, v9}, LG/D;->c(LA0/r;FZ)LA0/r;

    move-result-object v7

    new-instance v6, LBe/g;

    const/16 v10, 0x10

    invoke-direct {v6, v10, v1, v4}, LBe/g;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    const v10, -0x518bab07

    invoke-static {v10, v6, v13}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v19

    const/16 v18, 0x0

    const/high16 v21, 0x6000000

    move-object v6, v8

    const/4 v8, 0x0

    move/from16 v25, v9

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object/from16 v17, v13

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v24, v6

    move-object/from16 v6, v16

    const/16 v16, 0x0

    move-object/from16 v20, v17

    const/16 v17, 0x0

    const/16 v22, 0x3efc

    invoke-static/range {v6 .. v22}, LP2/g;->j(LL/E;LA0/r;LG/N0;LL/j;IFLA0/h;LD/i;ZLVm/k;LL/a;LD/o;Ly/t;Lu0/d;Lm0/l;II)V

    move-object/from16 v13, v20

    new-instance v6, Lzg/h;

    const/4 v7, 0x1

    invoke-direct {v6, v1, v7}, Lzg/h;-><init>(Lwg/C;I)V

    const v7, -0x53c7fcf0

    invoke-static {v7, v6, v13}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v12

    const/4 v10, 0x0

    const/4 v11, 0x0

    iget-boolean v7, v1, Lwg/C;->e:Z

    const/4 v8, 0x0

    const/4 v9, 0x0

    const v14, 0x180006

    const/16 v15, 0x1e

    move-object/from16 v6, v24

    invoke-static/range {v6 .. v15}, Lv/d;->b(LG/C;ZLA0/r;Lv/c0;Lv/d0;Ljava/lang/String;Lu0/d;Lm0/l;II)V

    const/4 v7, 0x6

    invoke-static {v6, v13, v7}, LP2/z;->I(LG/C;Lm0/l;I)V

    move-object/from16 v15, v27

    iget-object v6, v15, LA3/n;->c:Ljava/lang/Object;

    check-cast v6, Lm0/f0;

    invoke-virtual {v6}, Lm0/f0;->k()I

    move-result v6

    move-object/from16 v7, v26

    invoke-static {v6, v7}, LIm/r;->c1(ILjava/util/List;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lwg/B;

    sget-object v7, LOg/e;->b:LOg/e;

    const v8, 0x7f12036c

    invoke-static {v13, v8}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v8

    sget-object v9, Lcom/eightsleep/presentation_metrics/enums/EditSleepSessionLoadingKey;->SAVE_SLEEP_SESSION:Lcom/eightsleep/presentation_metrics/enums/EditSleepSessionLoadingKey;

    if-ne v2, v9, :cond_11

    const/4 v10, 0x1

    goto :goto_8

    :cond_11
    move v10, v3

    :goto_8
    iget-boolean v11, v1, Lwg/C;->d:Z

    if-eqz v11, :cond_12

    if-eq v2, v9, :cond_12

    if-eqz v6, :cond_12

    const/4 v12, 0x1

    goto :goto_9

    :cond_12
    move v12, v3

    :goto_9
    const v11, 0x2bcd07f

    invoke-virtual {v13, v11}, Lm0/q;->f0(I)V

    invoke-virtual {v13, v6}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v11

    and-int/lit16 v0, v0, 0x1c00

    const/16 v14, 0x800

    if-ne v0, v14, :cond_13

    const/4 v14, 0x1

    goto :goto_a

    :cond_13
    move v14, v3

    :goto_a
    or-int/2addr v11, v14

    invoke-virtual {v13}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v14

    if-nez v11, :cond_14

    move-object/from16 v11, v23

    if-ne v14, v11, :cond_15

    goto :goto_b

    :cond_14
    move-object/from16 v11, v23

    :goto_b
    new-instance v14, Lzg/f;

    const/4 v15, 0x0

    invoke-direct {v14, v6, v4, v15}, Lzg/f;-><init>(Lwg/B;LVm/k;I)V

    invoke-virtual {v13, v14}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_15
    move-object/from16 v16, v14

    check-cast v16, LVm/a;

    invoke-virtual {v13, v3}, Lm0/q;->q(Z)V

    const/4 v15, 0x0

    const/16 v19, 0x0

    move-object v14, v6

    move-object v6, v7

    const/4 v7, 0x0

    move-object/from16 v17, v9

    const/4 v9, 0x0

    move-object/from16 v20, v13

    move v13, v10

    const/4 v10, 0x0

    move-object/from16 v23, v11

    const/4 v11, 0x0

    move-object/from16 v18, v14

    const/4 v14, 0x0

    move-object/from16 v21, v18

    const/16 v18, 0x0

    move-object/from16 v22, v17

    move-object/from16 v17, v20

    const/16 v20, 0x33d

    move-object/from16 v1, v21

    move-object/from16 v5, v22

    move-object/from16 v3, v23

    invoke-virtual/range {v6 .. v20}, LOg/e;->g(LA0/r;Ljava/lang/String;Ljava/lang/Integer;Lhh/n;Lhh/d;ZZLhh/e;LJg/b;LVm/a;Lm0/l;III)V

    move-object/from16 v13, v17

    sget-object v6, LOg/e;->d:LOg/e;

    const v7, 0x7f12037f

    invoke-static {v13, v7}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v13}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v7

    iget-object v7, v7, Lhh/h;->k:Lhh/v;

    iget-wide v9, v7, Lhh/v;->h:J

    new-instance v7, LH0/w;

    invoke-direct {v7, v9, v10}, LH0/w;-><init>(J)V

    if-eq v2, v5, :cond_16

    if-eqz v1, :cond_16

    const/4 v9, 0x1

    goto :goto_c

    :cond_16
    const/4 v9, 0x0

    :goto_c
    const v5, 0x2bd0bf2

    invoke-virtual {v13, v5}, Lm0/q;->f0(I)V

    invoke-virtual {v13, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    const/16 v14, 0x800

    if-ne v0, v14, :cond_17

    const/4 v0, 0x1

    goto :goto_d

    :cond_17
    const/4 v0, 0x0

    :goto_d
    or-int/2addr v0, v5

    invoke-virtual {v13}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v5

    if-nez v0, :cond_18

    if-ne v5, v3, :cond_19

    :cond_18
    new-instance v5, Lzg/f;

    const/4 v0, 0x1

    invoke-direct {v5, v1, v4, v0}, Lzg/f;-><init>(Lwg/B;LVm/k;I)V

    invoke-virtual {v13, v5}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_19
    move-object/from16 v17, v5

    check-cast v17, LVm/a;

    const/4 v3, 0x0

    invoke-virtual {v13, v3}, Lm0/q;->q(Z)V

    const/16 v16, 0x0

    const/16 v19, 0x0

    move-object/from16 v20, v13

    move v13, v9

    move-object v9, v7

    const/4 v7, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v18, v20

    const/16 v20, 0x0

    const/16 v21, 0x779

    invoke-virtual/range {v6 .. v21}, LOg/e;->j(LA0/r;Ljava/lang/String;LH0/w;Ljava/lang/Integer;Lhh/n;Lhh/d;ZZLhh/e;LJg/b;LVm/a;Lm0/l;III)V

    move-object/from16 v13, v18

    const/4 v9, 0x1

    invoke-virtual {v13, v9}, Lm0/q;->q(Z)V

    :goto_e
    invoke-virtual {v13}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_1a

    new-instance v0, LXe/n0;

    const/16 v6, 0x16

    move-object/from16 v1, p0

    move-object/from16 v3, p2

    move/from16 v5, p5

    invoke-direct/range {v0 .. v6}, LXe/n0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_1a
    return-void
.end method

.method public static final p0(ILcom/eightsleep/data_core/enums/TemperatureDisplaySetting;)LGa/b;
    .locals 1

    const-string v0, "temperatureDisplaySetting"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, LGa/b;

    invoke-direct {v0, p0, p1}, LGa/b;-><init>(ILcom/eightsleep/data_core/enums/TemperatureDisplaySetting;)V

    return-object v0
.end method

.method public static final q(Ljava/lang/String;LVm/k;Lm0/l;I)V
    .locals 31

    move-object/from16 v9, p0

    move-object/from16 v10, p1

    const-string v0, "comments"

    invoke-static {v9, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onCommentsChange"

    invoke-static {v10, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v0, p2

    check-cast v0, Lm0/q;

    const v1, -0x9b7b073

    invoke-virtual {v0, v1}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v0, v9}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x4

    goto :goto_0

    :cond_0
    const/4 v1, 0x2

    :goto_0
    or-int v1, p3, v1

    invoke-virtual {v0, v10}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/16 v2, 0x20

    goto :goto_1

    :cond_1
    const/16 v2, 0x10

    :goto_1
    or-int/2addr v1, v2

    and-int/lit8 v2, v1, 0x13

    const/16 v3, 0x12

    if-ne v2, v3, :cond_3

    invoke-virtual {v0}, Lm0/q;->H()Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v0}, Lm0/q;->Y()V

    goto/16 :goto_4

    :cond_3
    :goto_2
    sget-object v2, LA0/o;->a:LA0/o;

    sget-object v3, LG/l;->c:LG/f;

    sget-object v4, LA0/d;->m:LA0/g;

    const/4 v5, 0x0

    invoke-static {v3, v4, v0, v5}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v3

    iget-wide v6, v0, Lm0/q;->T:J

    invoke-static {v6, v7}, Ljava/lang/Long;->hashCode(J)I

    move-result v4

    invoke-virtual {v0}, Lm0/q;->m()Lm0/o0;

    move-result-object v6

    invoke-static {v2, v0}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v7

    sget-object v8, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v8, LZ0/g;->b:LZ0/f;

    invoke-virtual {v0}, Lm0/q;->j0()V

    iget-boolean v11, v0, Lm0/q;->S:Z

    if-eqz v11, :cond_4

    invoke-virtual {v0, v8}, Lm0/q;->l(LVm/a;)V

    goto :goto_3

    :cond_4
    invoke-virtual {v0}, Lm0/q;->t0()V

    :goto_3
    sget-object v8, LZ0/g;->f:LZ0/e;

    invoke-static {v8, v3, v0}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v3, LZ0/g;->e:LZ0/e;

    invoke-static {v3, v6, v0}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    sget-object v4, LZ0/g;->g:LZ0/e;

    invoke-static {v0, v3, v4}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v3, LZ0/g;->h:LZ0/d;

    invoke-static {v0, v3}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v3, LZ0/g;->d:LZ0/e;

    invoke-static {v3, v7, v0}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v11, Lih/h;->d:Lih/h;

    const v3, 0x7f120ac3

    invoke-static {v0, v3}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v12

    invoke-static {v0}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v3

    iget-object v3, v3, Lhh/h;->k:Lhh/v;

    iget-wide v3, v3, Lhh/v;->c:J

    const/16 v20, 0x0

    const/16 v22, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x3f6

    move-object/from16 v21, v0

    move-wide v15, v3

    invoke-virtual/range {v11 .. v24}, Lih/h;->o(Ljava/lang/String;LA0/r;Lk1/U;JIZIILm0/l;III)V

    invoke-static {v0, v5}, LP2/z;->Q(Lm0/l;I)V

    sget-object v11, Lih/h;->b:Lih/h;

    const v3, 0x7f120ac2

    invoke-static {v0, v3}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v12

    invoke-static {v0}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v3

    iget-object v3, v3, Lhh/h;->k:Lhh/v;

    iget-wide v14, v3, Lhh/v;->c:J

    const/16 v19, 0x0

    const/16 v21, 0x0

    const/4 v13, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x3f6

    move-object/from16 v20, v0

    invoke-virtual/range {v11 .. v23}, Lih/h;->h(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    invoke-static {v0, v5}, LP2/z;->Q(Lm0/l;I)V

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v2, v3}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v11

    shl-int/lit8 v2, v1, 0x1b

    const/high16 v3, 0x70000000

    and-int v26, v2, v3

    shr-int/lit8 v1, v1, 0x3

    and-int/lit8 v1, v1, 0xe

    or-int/lit8 v27, v1, 0x30

    const-wide/16 v22, 0x0

    const/16 v24, 0x0

    move-object/from16 v20, v0

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move v6, v5

    const/4 v5, 0x0

    move v7, v6

    const/4 v6, 0x0

    move v8, v7

    const/4 v7, 0x0

    move v12, v8

    const/4 v8, 0x0

    move v13, v12

    const/4 v12, 0x0

    move v14, v13

    const/4 v13, 0x0

    move v15, v14

    const/4 v14, 0x0

    move/from16 v16, v15

    const/4 v15, 0x0

    move/from16 v17, v16

    const/16 v16, 0x0

    move/from16 v18, v17

    const/16 v17, 0x0

    move/from16 v19, v18

    const/16 v18, 0x0

    move/from16 v21, v19

    const/16 v19, 0x0

    move-object/from16 v25, v20

    const/16 v20, 0x3

    move/from16 v28, v21

    const/16 v21, 0x0

    move/from16 v29, v28

    const/16 v28, 0x6

    move/from16 v30, v29

    const v29, 0xeff1ff

    invoke-static/range {v0 .. v29}, LP2/p;->d(Ljava/lang/String;Ljava/lang/String;LVm/a;Ljava/lang/String;Lp1/l;ZLVm/a;LVm/a;Ljava/util/List;Ljava/lang/String;LVm/k;LA0/r;ZZLu0/d;Lu0/d;Lp1/E;LP/n0;LP/m0;ZIIJLE/l;Lm0/l;IIII)V

    move-object/from16 v0, v25

    const/4 v6, 0x0

    invoke-static {v0, v6}, LP2/z;->M(Lm0/l;I)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lm0/q;->q(Z)V

    :goto_4
    invoke-virtual {v0}, Lm0/q;->u()Lm0/t0;

    move-result-object v0

    if-eqz v0, :cond_5

    new-instance v1, LBg/C;

    const/4 v2, 0x0

    move/from16 v3, p3

    invoke-direct {v1, v9, v3, v2, v10}, LBg/C;-><init>(Ljava/lang/String;IILVm/k;)V

    iput-object v1, v0, Lm0/t0;->d:LVm/n;

    :cond_5
    return-void
.end method

.method public static q0(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    const-string p0, "Clip"

    return-object p0

    :cond_0
    const/4 v0, 0x2

    if-ne p0, v0, :cond_1

    const-string p0, "Ellipsis"

    return-object p0

    :cond_1
    const/4 v0, 0x5

    if-ne p0, v0, :cond_2

    const-string p0, "MiddleEllipsis"

    return-object p0

    :cond_2
    const/4 v0, 0x3

    if-ne p0, v0, :cond_3

    const-string p0, "Visible"

    return-object p0

    :cond_3
    const/4 v0, 0x4

    if-ne p0, v0, :cond_4

    const-string p0, "StartEllipsis"

    return-object p0

    :cond_4
    const-string p0, "Invalid"

    return-object p0
.end method

.method public static final r(Lm0/l;I)V
    .locals 16

    move/from16 v0, p1

    const/4 v1, 0x1

    move-object/from16 v9, p0

    check-cast v9, Lm0/q;

    const v2, -0x1dfa80a3

    invoke-virtual {v9, v2}, Lm0/q;->h0(I)Lm0/q;

    if-nez v0, :cond_1

    invoke-virtual {v9}, Lm0/q;->H()Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v9}, Lm0/q;->Y()V

    goto/16 :goto_2

    :cond_1
    :goto_0
    sget-object v2, LA0/d;->k:LA0/h;

    sget-object v3, LG/l;->a:LG/d;

    invoke-static {v9}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v3

    iget v3, v3, Lhh/i;->b:F

    invoke-static {v3}, LG/l;->g(F)LG/j;

    move-result-object v3

    sget-object v4, LA0/o;->a:LA0/o;

    const/16 v5, 0x30

    invoke-static {v3, v2, v9, v5}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v2

    iget-wide v6, v9, Lm0/q;->T:J

    invoke-static {v6, v7}, Ljava/lang/Long;->hashCode(J)I

    move-result v3

    invoke-virtual {v9}, Lm0/q;->m()Lm0/o0;

    move-result-object v6

    invoke-static {v4, v9}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v4

    sget-object v7, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v7, LZ0/g;->b:LZ0/f;

    invoke-virtual {v9}, Lm0/q;->j0()V

    iget-boolean v8, v9, Lm0/q;->S:Z

    if-eqz v8, :cond_2

    invoke-virtual {v9, v7}, Lm0/q;->l(LVm/a;)V

    goto :goto_1

    :cond_2
    invoke-virtual {v9}, Lm0/q;->t0()V

    :goto_1
    sget-object v7, LZ0/g;->f:LZ0/e;

    invoke-static {v7, v2, v9}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v2, LZ0/g;->e:LZ0/e;

    invoke-static {v2, v6, v9}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sget-object v3, LZ0/g;->g:LZ0/e;

    invoke-static {v9, v2, v3}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v2, LZ0/g;->h:LZ0/d;

    invoke-static {v9, v2}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v2, LZ0/g;->d:LZ0/e;

    invoke-static {v2, v4, v9}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const v2, 0x7f0802a3

    const/4 v3, 0x0

    invoke-static {v2, v3, v9}, LP2/i;->E(IILm0/l;)LL0/a;

    move-result-object v2

    invoke-static {v9}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v3

    iget v3, v3, Lhh/i;->d:F

    invoke-static {v3}, LP2/r;->r(F)LA0/r;

    move-result-object v4

    sget v3, LL0/a;->$stable:I

    or-int/lit8 v10, v3, 0x30

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/16 v11, 0x78

    invoke-static/range {v2 .. v11}, Ly/x;->c(LL0/a;Ljava/lang/String;LA0/r;LA0/e;LX0/q;FLH0/p;Lm0/l;II)V

    sget-object v2, Lih/h;->d:Lih/h;

    const v3, 0x7f12055a

    invoke-static {v9, v3}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v3

    const/4 v11, 0x0

    const/4 v13, 0x0

    const/4 v4, 0x0

    const-wide/16 v6, 0x0

    const/4 v8, 0x0

    move-object v12, v9

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v14, 0x0

    const/16 v15, 0x3fe

    invoke-virtual/range {v2 .. v15}, Lih/h;->o(Ljava/lang/String;LA0/r;Lk1/U;JIZIILm0/l;III)V

    move-object v9, v12

    invoke-virtual {v9, v1}, Lm0/q;->q(Z)V

    :goto_2
    invoke-virtual {v9}, Lm0/q;->u()Lm0/t0;

    move-result-object v2

    if-eqz v2, :cond_3

    new-instance v3, LWf/m0;

    invoke-direct {v3, v0, v1}, LWf/m0;-><init>(II)V

    iput-object v3, v2, Lm0/t0;->d:LVm/n;

    :cond_3
    return-void
.end method

.method public static final r0(Ljava/lang/String;)Ljava/time/ZoneOffset;
    .locals 6

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "UTC"

    invoke-static {p0, v0}, Llo/n;->w0(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "GMT"

    invoke-static {v1, v2}, Llo/n;->w0(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    goto/16 :goto_1

    :cond_0
    const-string v2, "+0"

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "-0"

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "0"

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto/16 :goto_1

    :cond_1
    const-string v0, "[+-]\\d{1,2}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    const-string v2, "compile(...)"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x3

    if-eqz v0, :cond_2

    invoke-static {v5, v1}, Llo/n;->u0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v3, p0}, Llo/n;->h0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x2

    invoke-static {v1, p0}, Llo/n;->u0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ":00"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_2
    const-string v0, "[+-]\\d{4}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-virtual {v1, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const-string v2, "substring(...)"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v3, 0x5

    invoke-virtual {v1, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ":"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_3
    const-string v0, "[+-]\\d{1,2}:\\d{2}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_4

    :goto_0
    invoke-static {v1}, Ljava/time/ZoneOffset;->of(Ljava/lang/String;)Ljava/time/ZoneOffset;

    move-result-object p0

    const-string v0, "of(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0

    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid UTC offset format: "

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    :goto_1
    sget-object p0, Ljava/time/ZoneOffset;->UTC:Ljava/time/ZoneOffset;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static final s(LA0/o;LFf/V;LVm/a;Lm0/l;I)V
    .locals 16

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v0, p4

    const-string v1, "onDismiss"

    invoke-static {v3, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v11, p3

    check-cast v11, Lm0/q;

    const v1, 0x186cf797

    invoke-virtual {v11, v1}, Lm0/q;->h0(I)Lm0/q;

    or-int/lit8 v1, v0, 0x6

    and-int/lit8 v4, v0, 0x30

    if-nez v4, :cond_1

    invoke-virtual {v11, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/16 v4, 0x20

    goto :goto_0

    :cond_0
    const/16 v4, 0x10

    :goto_0
    or-int/2addr v1, v4

    :cond_1
    and-int/lit16 v4, v0, 0x180

    if-nez v4, :cond_3

    invoke-virtual {v11, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    const/16 v4, 0x100

    goto :goto_1

    :cond_2
    const/16 v4, 0x80

    :goto_1
    or-int/2addr v1, v4

    :cond_3
    and-int/lit16 v4, v1, 0x93

    const/16 v5, 0x92

    if-ne v4, v5, :cond_5

    invoke-virtual {v11}, Lm0/q;->H()Z

    move-result v4

    if-nez v4, :cond_4

    goto :goto_2

    :cond_4
    invoke-virtual {v11}, Lm0/q;->Y()V

    move-object/from16 v1, p0

    goto/16 :goto_5

    :cond_5
    :goto_2
    sget-object v14, LA0/o;->a:LA0/o;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v14, v4}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v4

    invoke-static {v11}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v5

    iget v5, v5, Lhh/i;->f:F

    invoke-static {v5}, LO/e;->b(F)LO/d;

    move-result-object v5

    invoke-static {v4, v5}, LE0/i;->c(LA0/r;LH0/X;)LA0/r;

    move-result-object v4

    invoke-static {v11}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v5

    iget-object v5, v5, Lhh/h;->d:Lhh/g;

    iget-wide v5, v5, Lhh/g;->e:J

    sget-object v7, LH0/F;->b:LH0/S;

    invoke-static {v4, v5, v6, v7}, Ly/x;->g(LA0/r;JLH0/X;)LA0/r;

    move-result-object v4

    invoke-static {v11}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v5

    iget v5, v5, Lhh/i;->e:F

    invoke-static {v4, v5}, LG/e;->H(LA0/r;F)LA0/r;

    move-result-object v4

    sget-object v5, LA0/d;->a:LA0/i;

    const/4 v6, 0x0

    invoke-static {v5, v6}, LG/t;->d(LA0/e;Z)LX0/h0;

    move-result-object v5

    iget-wide v7, v11, Lm0/q;->T:J

    invoke-static {v7, v8}, Ljava/lang/Long;->hashCode(J)I

    move-result v7

    invoke-virtual {v11}, Lm0/q;->m()Lm0/o0;

    move-result-object v8

    invoke-static {v4, v11}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v4

    sget-object v9, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v9, LZ0/g;->b:LZ0/f;

    invoke-virtual {v11}, Lm0/q;->j0()V

    iget-boolean v10, v11, Lm0/q;->S:Z

    if-eqz v10, :cond_6

    invoke-virtual {v11, v9}, Lm0/q;->l(LVm/a;)V

    goto :goto_3

    :cond_6
    invoke-virtual {v11}, Lm0/q;->t0()V

    :goto_3
    sget-object v10, LZ0/g;->f:LZ0/e;

    invoke-static {v10, v5, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v5, LZ0/g;->e:LZ0/e;

    invoke-static {v5, v8, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    sget-object v8, LZ0/g;->g:LZ0/e;

    invoke-static {v11, v7, v8}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v7, LZ0/g;->h:LZ0/d;

    invoke-static {v11, v7}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v12, LZ0/g;->d:LZ0/e;

    invoke-static {v12, v4, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v4, LG/x;->a:LG/x;

    sget-object v13, LG/l;->a:LG/d;

    invoke-static {v11}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v13

    iget v13, v13, Lhh/i;->g:F

    invoke-static {v13}, LG/l;->g(F)LG/j;

    move-result-object v13

    sget-object v15, LA0/d;->m:LA0/g;

    invoke-static {v13, v15, v11, v6}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v13

    move-object/from16 p3, v7

    iget-wide v6, v11, Lm0/q;->T:J

    invoke-static {v6, v7}, Ljava/lang/Long;->hashCode(J)I

    move-result v6

    invoke-virtual {v11}, Lm0/q;->m()Lm0/o0;

    move-result-object v7

    invoke-static {v14, v11}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v15

    invoke-virtual {v11}, Lm0/q;->j0()V

    iget-boolean v0, v11, Lm0/q;->S:Z

    if-eqz v0, :cond_7

    invoke-virtual {v11, v9}, Lm0/q;->l(LVm/a;)V

    goto :goto_4

    :cond_7
    invoke-virtual {v11}, Lm0/q;->t0()V

    :goto_4
    invoke-static {v10, v13, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v5, v7, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object/from16 v0, p3

    invoke-static {v6, v11, v8, v11, v0}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    invoke-static {v12, v15, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const/4 v0, 0x0

    invoke-static {v11, v0}, Lio/sentry/config/a;->r(Lm0/l;I)V

    shr-int/lit8 v0, v1, 0x3

    and-int/lit8 v0, v0, 0xe

    invoke-static {v2, v11, v0}, Lio/sentry/config/a;->n(LFf/V;Lm0/l;I)V

    const/4 v0, 0x1

    invoke-virtual {v11, v0}, Lm0/q;->q(Z)V

    sget-object v5, LA0/d;->c:LA0/i;

    invoke-virtual {v4, v14, v5}, LG/x;->align(LA0/r;LA0/e;)LA0/r;

    move-result-object v4

    move-object v3, v4

    sget-wide v4, LH0/w;->g:J

    shl-int/lit8 v1, v1, 0x9

    const/high16 v6, 0x70000

    and-int/2addr v1, v6

    or-int/lit8 v12, v1, 0x30

    const-wide/16 v7, 0x0

    const/4 v9, 0x0

    const/4 v6, 0x0

    const/16 v13, 0x1c

    move-object/from16 v10, p2

    invoke-static/range {v3 .. v13}, LOl/a;->d(LA0/r;JFJFLVm/a;Lm0/l;II)V

    invoke-virtual {v11, v0}, Lm0/q;->q(Z)V

    move-object v1, v14

    :goto_5
    invoke-virtual {v11}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_8

    new-instance v0, LP/T0;

    const/4 v5, 0x7

    move-object/from16 v3, p2

    move/from16 v4, p4

    invoke-direct/range {v0 .. v5}, LP/T0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_8
    return-void
.end method

.method public static final t(IILm0/l;)V
    .locals 17

    move/from16 v0, p0

    move/from16 v1, p1

    const/4 v2, 0x2

    move-object/from16 v11, p2

    check-cast v11, Lm0/q;

    const v3, 0x206e24c3

    invoke-virtual {v11, v3}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v11, v0}, Lm0/q;->e(I)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x4

    goto :goto_0

    :cond_0
    move v3, v2

    :goto_0
    or-int/2addr v3, v1

    and-int/lit8 v3, v3, 0x3

    if-ne v3, v2, :cond_2

    invoke-virtual {v11}, Lm0/q;->H()Z

    move-result v3

    if-nez v3, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v11}, Lm0/q;->Y()V

    goto/16 :goto_3

    :cond_2
    :goto_1
    sget-object v3, LA0/d;->k:LA0/h;

    sget-object v4, LG/l;->a:LG/d;

    invoke-static {v11}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v4

    iget v4, v4, Lhh/i;->e:F

    invoke-static {v4}, LG/l;->g(F)LG/j;

    move-result-object v4

    sget-object v5, LA0/o;->a:LA0/o;

    const/16 v6, 0x30

    invoke-static {v4, v3, v11, v6}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v3

    iget-wide v6, v11, Lm0/q;->T:J

    invoke-static {v6, v7}, Ljava/lang/Long;->hashCode(J)I

    move-result v4

    invoke-virtual {v11}, Lm0/q;->m()Lm0/o0;

    move-result-object v6

    invoke-static {v5, v11}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v5

    sget-object v7, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v7, LZ0/g;->b:LZ0/f;

    invoke-virtual {v11}, Lm0/q;->j0()V

    iget-boolean v8, v11, Lm0/q;->S:Z

    if-eqz v8, :cond_3

    invoke-virtual {v11, v7}, Lm0/q;->l(LVm/a;)V

    goto :goto_2

    :cond_3
    invoke-virtual {v11}, Lm0/q;->t0()V

    :goto_2
    sget-object v7, LZ0/g;->f:LZ0/e;

    invoke-static {v7, v3, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v3, LZ0/g;->e:LZ0/e;

    invoke-static {v3, v6, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    sget-object v4, LZ0/g;->g:LZ0/e;

    invoke-static {v11, v3, v4}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v3, LZ0/g;->h:LZ0/d;

    invoke-static {v11, v3}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v3, LZ0/g;->d:LZ0/e;

    invoke-static {v3, v5, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v3, Lih/h;->f:Lih/h;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const/4 v14, 0x1

    invoke-static {v4, v14}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v4

    const-string v5, "%,d"

    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const/4 v10, 0x0

    const/4 v12, 0x0

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/16 v13, 0x3fe

    invoke-virtual/range {v3 .. v13}, Lih/h;->r(Ljava/lang/String;LA0/r;JZIILm0/l;II)V

    sget-object v3, Lih/h;->e:Lih/h;

    const v4, 0x7f12055b

    invoke-static {v11, v4}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v4

    move-object v12, v11

    const/4 v11, 0x0

    const/4 v13, 0x0

    move v15, v14

    const/4 v14, 0x0

    move/from16 v16, v15

    const/16 v15, 0x3fe

    move/from16 v2, v16

    invoke-virtual/range {v3 .. v15}, Lih/h;->h(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    move-object v11, v12

    invoke-virtual {v11, v2}, Lm0/q;->q(Z)V

    :goto_3
    invoke-virtual {v11}, Lm0/q;->u()Lm0/t0;

    move-result-object v2

    if-eqz v2, :cond_4

    new-instance v3, LPe/h;

    const/4 v4, 0x2

    invoke-direct {v3, v0, v1, v4}, LPe/h;-><init>(III)V

    iput-object v3, v2, Lm0/t0;->d:LVm/n;

    :cond_4
    return-void
.end method

.method public static final u(LVm/k;LVm/k;Lm0/l;I)V
    .locals 30

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p3

    const/4 v3, 0x0

    const/4 v4, 0x4

    const-string v5, "onNavEvent"

    invoke-static {v0, v5}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v11, p2

    check-cast v11, Lm0/q;

    const v5, 0xae994ce

    invoke-virtual {v11, v5}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v11, v0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v5, v4

    goto :goto_0

    :cond_0
    const/4 v5, 0x2

    :goto_0
    or-int/2addr v5, v2

    invoke-virtual {v11, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    const/16 v6, 0x20

    goto :goto_1

    :cond_1
    const/16 v6, 0x10

    :goto_1
    or-int/2addr v5, v6

    and-int/lit8 v5, v5, 0x13

    const/16 v6, 0x12

    if-ne v5, v6, :cond_3

    invoke-virtual {v11}, Lm0/q;->H()Z

    move-result v5

    if-nez v5, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v11}, Lm0/q;->Y()V

    move-object/from16 v26, v11

    goto/16 :goto_5

    :cond_3
    :goto_2
    sget-object v5, Lm0/k;->a:Lm0/e;

    const v6, 0x70b323c8

    invoke-virtual {v11, v6}, Lm0/q;->g0(I)V

    invoke-static {v11}, Lh3/a;->a(Lm0/l;)Landroidx/lifecycle/i0;

    move-result-object v7

    if-eqz v7, :cond_8

    invoke-static {v7, v11, v3}, Landroidx/hilt/navigation/compose/HiltViewModelKt;->createHiltViewModelFactory(Landroidx/lifecycle/i0;Lm0/l;I)Landroidx/lifecycle/d0;

    move-result-object v9

    const v6, 0x671a9c9b

    invoke-virtual {v11, v6}, Lm0/q;->g0(I)V

    instance-of v6, v7, Landroidx/lifecycle/j;

    if-eqz v6, :cond_4

    move-object v6, v7

    check-cast v6, Landroidx/lifecycle/j;

    invoke-interface {v6}, Landroidx/lifecycle/j;->getDefaultViewModelCreationExtras()Lg3/c;

    move-result-object v6

    :goto_3
    move-object v10, v6

    goto :goto_4

    :cond_4
    sget-object v6, Lg3/a;->b:Lg3/a;

    goto :goto_3

    :goto_4
    const-class v6, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;

    const/4 v8, 0x0

    invoke-static/range {v6 .. v11}, LP2/c;->O(Ljava/lang/Class;Landroidx/lifecycle/i0;Ljava/lang/String;Landroidx/lifecycle/d0;Lg3/c;Lm0/l;)Landroidx/lifecycle/b0;

    move-result-object v6

    invoke-virtual {v11, v3}, Lm0/q;->q(Z)V

    invoke-virtual {v11, v3}, Lm0/q;->q(Z)V

    check-cast v6, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;

    invoke-static {v11}, Lh0/c;->a(Lm0/l;)Lh0/b;

    move-result-object v7

    const/4 v8, 0x1

    new-array v8, v8, [Lr4/V;

    aput-object v7, v8, v3

    invoke-static {v8, v11}, LP2/K;->I([Lr4/V;Lm0/l;)Lr4/G;

    move-result-object v7

    invoke-static {v7, v11}, LP2/K;->s(Lr4/G;Lm0/l;)Lm0/Z;

    sget-object v8, LA0/o;->a:LA0/o;

    const v9, -0x485a3d28

    invoke-virtual {v11, v9}, Lm0/q;->f0(I)V

    invoke-virtual {v11, v6}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v9

    invoke-virtual {v11}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v10

    if-nez v9, :cond_5

    if-ne v10, v5, :cond_6

    :cond_5
    new-instance v10, Lko/n;

    invoke-direct {v10, v6, v4}, Lko/n;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v11, v10}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_6
    move-object/from16 v23, v10

    check-cast v23, LVm/a;

    invoke-virtual {v11, v3}, Lm0/q;->q(Z)V

    new-instance v3, Lqg/D;

    invoke-direct {v3, v0, v7, v6, v1}, Lqg/D;-><init>(LVm/k;Lr4/G;Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;LVm/k;)V

    const v4, 0x16e6e2f8

    invoke-static {v4, v3, v11}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v25

    const/16 v24, 0x0

    const/16 v27, 0x6

    const/4 v7, 0x0

    move-object v6, v8

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object/from16 v26, v11

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x1

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const v28, 0x30000c00

    const v29, 0x5dffe

    invoke-static/range {v6 .. v29}, LP2/n;->g(LA0/r;LA0/r;LG/g1;Lu0/d;LC8/K;Lu0/d;Lu0/d;Ljava/lang/Integer;LH0/w;LG/g1;Ljava/lang/String;Lr4/G;LVm/n;ZIZLu0/d;LVm/a;LVm/k;Lu0/d;Lm0/l;III)V

    :goto_5
    invoke-virtual/range {v26 .. v26}, Lm0/q;->u()Lm0/t0;

    move-result-object v3

    if-eqz v3, :cond_7

    new-instance v4, LGe/g;

    const/4 v5, 0x5

    invoke-direct {v4, v0, v1, v2, v5}, LGe/g;-><init>(LVm/k;LVm/k;II)V

    iput-object v4, v3, Lm0/t0;->d:LVm/n;

    :cond_7
    return-void

    :cond_8
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No ViewModelStoreOwner was provided via LocalViewModelStoreOwner"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static final v(LDf/L0;LVm/k;Lm0/l;I)V
    .locals 21

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p3

    const-string v3, "removeUser"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "onUiAction"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v12, p2

    check-cast v12, Lm0/q;

    const v3, 0x469c5d9c

    invoke-virtual {v12, v3}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v3, v2, 0x6

    if-nez v3, :cond_2

    and-int/lit8 v3, v2, 0x8

    if-nez v3, :cond_0

    invoke-virtual {v12, v0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v3

    goto :goto_0

    :cond_0
    invoke-virtual {v12, v0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v3

    :goto_0
    if-eqz v3, :cond_1

    const/4 v3, 0x4

    goto :goto_1

    :cond_1
    const/4 v3, 0x2

    :goto_1
    or-int/2addr v3, v2

    goto :goto_2

    :cond_2
    move v3, v2

    :goto_2
    and-int/lit8 v4, v2, 0x30

    const/16 v5, 0x20

    if-nez v4, :cond_4

    invoke-virtual {v12, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    move v4, v5

    goto :goto_3

    :cond_3
    const/16 v4, 0x10

    :goto_3
    or-int/2addr v3, v4

    :cond_4
    and-int/lit8 v4, v3, 0x13

    const/16 v6, 0x12

    if-ne v4, v6, :cond_6

    invoke-virtual {v12}, Lm0/q;->H()Z

    move-result v4

    if-nez v4, :cond_5

    goto :goto_4

    :cond_5
    invoke-virtual {v12}, Lm0/q;->Y()V

    goto/16 :goto_b

    :cond_6
    :goto_4
    sget-object v4, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->b:Lm0/c1;

    invoke-virtual {v12, v4}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/Context;

    instance-of v6, v0, LDf/K0;

    if-eqz v6, :cond_7

    const v7, 0x7f12037a

    goto :goto_5

    :cond_7
    const v7, 0x7f120379

    :goto_5
    instance-of v8, v0, LDf/J0;

    if-eqz v8, :cond_8

    new-instance v6, Lof/I5;

    move-object v8, v0

    check-cast v8, LDf/J0;

    iget-object v8, v8, LDf/J0;->a:Ljava/lang/String;

    invoke-direct {v6, v8}, Lof/I5;-><init>(Ljava/lang/String;)V

    goto :goto_6

    :cond_8
    instance-of v8, v0, LDf/I0;

    if-eqz v8, :cond_9

    new-instance v6, Lof/C5;

    move-object v8, v0

    check-cast v8, LDf/I0;

    iget-object v8, v8, LDf/I0;->a:Ljava/lang/String;

    invoke-direct {v6, v8}, Lof/C5;-><init>(Ljava/lang/String;)V

    goto :goto_6

    :cond_9
    if-eqz v6, :cond_15

    new-instance v6, Lof/J5;

    move-object v8, v0

    check-cast v8, LDf/K0;

    iget-object v9, v8, LDf/K0;->a:Ljava/lang/String;

    iget-object v8, v8, LDf/K0;->d:Lcom/eightsleep/data_core/enums/Bedside;

    invoke-direct {v6, v9, v8}, Lof/J5;-><init>(Ljava/lang/String;Lcom/eightsleep/data_core/enums/Bedside;)V

    :goto_6
    const v8, -0x4816759f

    invoke-virtual {v12, v8}, Lm0/q;->f0(I)V

    and-int/lit8 v3, v3, 0x70

    const/4 v8, 0x1

    const/4 v9, 0x0

    if-ne v3, v5, :cond_a

    move v10, v8

    goto :goto_7

    :cond_a
    move v10, v9

    :goto_7
    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v11

    sget-object v13, Lm0/k;->a:Lm0/e;

    if-nez v10, :cond_b

    if-ne v11, v13, :cond_c

    :cond_b
    new-instance v11, LKf/c0;

    const/16 v10, 0x14

    invoke-direct {v11, v10, v1}, LKf/c0;-><init>(ILVm/k;)V

    invoke-virtual {v12, v11}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_c
    check-cast v11, LVm/a;

    invoke-virtual {v12, v9}, Lm0/q;->q(Z)V

    invoke-interface {v0}, LDf/L0;->getTitle()LYa/H;

    move-result-object v10

    invoke-virtual {v10, v4}, LYa/H;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v0}, LDf/L0;->getBody()LYa/H;

    move-result-object v14

    if-eqz v14, :cond_d

    invoke-virtual {v14, v4}, LYa/H;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    goto :goto_8

    :cond_d
    const/4 v4, 0x0

    :goto_8
    invoke-static {v12, v7}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v15

    const v7, 0x7f1203b0

    invoke-static {v12, v7}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v16

    const v7, -0x4816418b

    invoke-virtual {v12, v7}, Lm0/q;->f0(I)V

    if-ne v3, v5, :cond_e

    move v7, v8

    goto :goto_9

    :cond_e
    move v7, v9

    :goto_9
    invoke-virtual {v12, v6}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v14

    or-int/2addr v7, v14

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v14

    if-nez v7, :cond_f

    if-ne v14, v13, :cond_10

    :cond_f
    new-instance v14, LKf/L0;

    const/4 v7, 0x2

    invoke-direct {v14, v7, v1, v6}, LKf/L0;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v12, v14}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_10
    move-object/from16 v18, v14

    check-cast v18, LVm/a;

    invoke-virtual {v12, v9}, Lm0/q;->q(Z)V

    const v6, -0x48163a63

    invoke-virtual {v12, v6}, Lm0/q;->f0(I)V

    if-ne v3, v5, :cond_11

    goto :goto_a

    :cond_11
    move v8, v9

    :goto_a
    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v3

    if-nez v8, :cond_12

    if-ne v3, v13, :cond_13

    :cond_12
    new-instance v3, LKf/c0;

    const/16 v5, 0x15

    invoke-direct {v3, v5, v1}, LKf/c0;-><init>(ILVm/k;)V

    invoke-virtual {v12, v3}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_13
    move-object/from16 v19, v3

    check-cast v19, LVm/a;

    invoke-virtual {v12, v9}, Lm0/q;->q(Z)V

    new-instance v14, LXg/e;

    const/16 v17, 0x0

    const/16 v20, 0xc

    invoke-direct/range {v14 .. v20}, LXg/e;-><init>(Ljava/lang/String;Ljava/lang/String;ZLVm/a;LVm/a;I)V

    const/4 v9, 0x0

    move-object v6, v10

    const/4 v10, 0x1

    move-object v7, v4

    const/4 v4, 0x1

    const/4 v8, 0x0

    const v13, 0x180006

    move-object v5, v11

    move-object v11, v14

    const/16 v14, 0x30

    invoke-static/range {v4 .. v14}, LP2/H;->i(ZLVm/a;Ljava/lang/String;Ljava/lang/String;ZZZLXg/f;Lm0/l;II)V

    :goto_b
    invoke-virtual {v12}, Lm0/q;->u()Lm0/t0;

    move-result-object v3

    if-eqz v3, :cond_14

    new-instance v4, LKf/L1;

    const/4 v5, 0x0

    invoke-direct {v4, v0, v1, v2, v5}, LKf/L1;-><init>(LDf/L0;LVm/k;II)V

    iput-object v4, v3, Lm0/t0;->d:LVm/n;

    :cond_14
    return-void

    :cond_15
    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0
.end method

.method public static final w(Lwg/D0;LVm/n;LVm/n;Lm0/l;I)V
    .locals 10

    move-object v6, p3

    check-cast v6, Lm0/q;

    const p3, -0x3d6fab94

    invoke-virtual {v6, p3}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v6, p0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result p3

    const/4 v0, 0x4

    if-eqz p3, :cond_0

    move p3, v0

    goto :goto_0

    :cond_0
    const/4 p3, 0x2

    :goto_0
    or-int/2addr p3, p4

    invoke-virtual {v6, p1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    const/16 v2, 0x20

    if-eqz v1, :cond_1

    move v1, v2

    goto :goto_1

    :cond_1
    const/16 v1, 0x10

    :goto_1
    or-int/2addr p3, v1

    invoke-virtual {v6, p2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x100

    goto :goto_2

    :cond_2
    const/16 v1, 0x80

    :goto_2
    or-int/2addr p3, v1

    and-int/lit16 v1, p3, 0x93

    const/16 v3, 0x92

    if-ne v1, v3, :cond_4

    invoke-virtual {v6}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_3

    :cond_3
    invoke-virtual {v6}, Lm0/q;->Y()V

    goto :goto_5

    :cond_4
    :goto_3
    invoke-interface {p0}, Lwg/h0;->getTitleResId()I

    move-result v1

    invoke-static {v6, v1}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0}, Lwg/D0;->b()LYa/H;

    move-result-object v3

    sget-object v4, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->b:Lm0/c1;

    invoke-virtual {v6, v4}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/Context;

    invoke-virtual {v3, v4}, LYa/H;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    move v4, v2

    invoke-interface {p0}, Lwg/h0;->g()Ljava/lang/Boolean;

    move-result-object v2

    const v5, 0x6850f1ef

    invoke-virtual {v6, v5}, Lm0/q;->f0(I)V

    and-int/lit8 v5, p3, 0x70

    const/4 v7, 0x0

    const/4 v8, 0x1

    if-ne v5, v4, :cond_5

    move v4, v8

    goto :goto_4

    :cond_5
    move v4, v7

    :goto_4
    and-int/lit8 p3, p3, 0xe

    if-eq p3, v0, :cond_6

    move v8, v7

    :cond_6
    or-int p3, v4, v8

    invoke-virtual {v6}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v0

    if-nez p3, :cond_7

    sget-object p3, Lm0/k;->a:Lm0/e;

    if-ne v0, p3, :cond_8

    :cond_7
    new-instance v0, LBg/r;

    const/4 p3, 0x1

    invoke-direct {v0, p1, p0, p3}, LBg/r;-><init>(LVm/n;Lwg/D0;I)V

    invoke-virtual {v6, v0}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_8
    check-cast v0, LVm/k;

    invoke-virtual {v6, v7}, Lm0/q;->q(Z)V

    new-instance p3, LAe/y;

    const/4 v4, 0x2

    invoke-direct {p3, v4, p0, p2}, LAe/y;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    const v4, 0x38421161

    invoke-static {v4, p3, v6}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v5

    const/16 v8, 0x10

    const/4 v4, 0x0

    const/high16 v7, 0x30000

    move-object v9, v3

    move-object v3, v0

    move-object v0, v1

    move-object v1, v9

    invoke-static/range {v0 .. v8}, Lio/sentry/config/a;->D(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;LVm/k;ZLu0/d;Lm0/l;II)V

    :goto_5
    invoke-virtual {v6}, Lm0/q;->u()Lm0/t0;

    move-result-object p3

    if-eqz p3, :cond_9

    new-instance v0, LBg/D;

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p4

    invoke-direct/range {v0 .. v5}, LBg/D;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object v0, p3, Lm0/t0;->d:LVm/n;

    :cond_9
    return-void
.end method

.method public static final x(Lwg/E;LVm/n;LVm/n;LVm/k;LVm/n;LVm/k;Lm0/l;I)V
    .locals 28

    move-object/from16 v2, p0

    move-object/from16 v7, p1

    move-object/from16 v6, p2

    move-object/from16 v11, p3

    move-object/from16 v4, p4

    move-object/from16 v8, p5

    const-string v0, "model"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onUpdateResponse"

    invoke-static {v7, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onUpdateOptionalFeedback"

    invoke-static {v6, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onUpdateHealthCheckResponse"

    invoke-static {v11, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onCorrectTime"

    invoke-static {v4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onUpdateAwakePeriods"

    invoke-static {v8, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v14, p6

    check-cast v14, Lm0/q;

    const v0, -0x6452cd88

    invoke-virtual {v14, v0}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v14, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int v0, p7, v0

    invoke-virtual {v14, v7}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x20

    goto :goto_1

    :cond_1
    const/16 v1, 0x10

    :goto_1
    or-int/2addr v0, v1

    invoke-virtual {v14, v6}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x100

    goto :goto_2

    :cond_2
    const/16 v1, 0x80

    :goto_2
    or-int/2addr v0, v1

    invoke-virtual {v14, v11}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/16 v1, 0x800

    goto :goto_3

    :cond_3
    const/16 v1, 0x400

    :goto_3
    or-int/2addr v0, v1

    invoke-virtual {v14, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const/16 v1, 0x4000

    goto :goto_4

    :cond_4
    const/16 v1, 0x2000

    :goto_4
    or-int/2addr v0, v1

    invoke-virtual {v14, v8}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    const/high16 v1, 0x20000

    goto :goto_5

    :cond_5
    const/high16 v1, 0x10000

    :goto_5
    or-int v10, v0, v1

    const v0, 0x12493

    and-int/2addr v0, v10

    const v1, 0x12492

    if-ne v0, v1, :cond_7

    invoke-virtual {v14}, Lm0/q;->H()Z

    move-result v0

    if-nez v0, :cond_6

    goto :goto_6

    :cond_6
    invoke-virtual {v14}, Lm0/q;->Y()V

    move-object v3, v6

    goto/16 :goto_13

    :cond_7
    :goto_6
    const v0, -0x1d585e71

    invoke-virtual {v14, v0}, Lm0/q;->f0(I)V

    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lm0/k;->a:Lm0/e;

    if-ne v0, v1, :cond_8

    invoke-static {}, Ljava/time/Instant;->now()Ljava/time/Instant;

    move-result-object v0

    invoke-virtual {v14, v0}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_8
    move-object v3, v0

    check-cast v3, Ljava/time/Instant;

    const/4 v0, 0x0

    invoke-virtual {v14, v0}, Lm0/q;->q(Z)V

    sget-object v5, LA0/o;->a:LA0/o;

    sget-object v12, LG/l;->c:LG/f;

    sget-object v13, LA0/d;->m:LA0/g;

    invoke-static {v12, v13, v14, v0}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v12

    move/from16 v26, v10

    iget-wide v9, v14, Lm0/q;->T:J

    invoke-static {v9, v10}, Ljava/lang/Long;->hashCode(J)I

    move-result v9

    invoke-virtual {v14}, Lm0/q;->m()Lm0/o0;

    move-result-object v10

    invoke-static {v5, v14}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v5

    sget-object v13, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v13, LZ0/g;->b:LZ0/f;

    invoke-virtual {v14}, Lm0/q;->j0()V

    iget-boolean v15, v14, Lm0/q;->S:Z

    if-eqz v15, :cond_9

    invoke-virtual {v14, v13}, Lm0/q;->l(LVm/a;)V

    goto :goto_7

    :cond_9
    invoke-virtual {v14}, Lm0/q;->t0()V

    :goto_7
    sget-object v13, LZ0/g;->f:LZ0/e;

    invoke-static {v13, v12, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v12, LZ0/g;->e:LZ0/e;

    invoke-static {v12, v10, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    sget-object v10, LZ0/g;->g:LZ0/e;

    invoke-static {v14, v9, v10}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v9, LZ0/g;->h:LZ0/d;

    invoke-static {v14, v9}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v9, LZ0/g;->d:LZ0/e;

    invoke-static {v9, v5, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v12, Lih/h;->d:Lih/h;

    const v5, 0x7f120698

    invoke-static {v14, v5}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v14}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v5

    iget-object v5, v5, Lhh/h;->k:Lhh/v;

    iget-wide v9, v5, Lhh/v;->c:J

    const/16 v21, 0x0

    const/16 v23, 0x0

    move-object/from16 v18, v14

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v22, v18

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x3f6

    move-wide/from16 v16, v9

    invoke-virtual/range {v12 .. v25}, Lih/h;->o(Ljava/lang/String;LA0/r;Lk1/U;JIZIILm0/l;III)V

    move-object/from16 v14, v22

    invoke-static {v14, v0}, LP2/z;->M(Lm0/l;I)V

    sget-object v5, Lcom/eightsleep/presentation_metrics/enums/MetricsFeedbackAnswerKey;->FELL_ASLEEP_TIME:Lcom/eightsleep/presentation_metrics/enums/MetricsFeedbackAnswerKey;

    iget-object v9, v2, Lwg/E;->i:Ljava/util/Map;

    invoke-interface {v9, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    instance-of v10, v5, Lwg/v0;

    const/16 v21, 0x0

    if-eqz v10, :cond_a

    check-cast v5, Lwg/v0;

    goto :goto_8

    :cond_a
    move-object/from16 v5, v21

    :goto_8
    const v10, 0x19475cf3

    invoke-virtual {v14, v10}, Lm0/q;->f0(I)V

    if-nez v5, :cond_b

    move-object v10, v1

    goto :goto_a

    :cond_b
    const v12, 0x7f120ace

    invoke-static {v14, v12}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v12

    const v13, 0x4de83b1f    # 4.8702358E8f

    invoke-virtual {v14, v13}, Lm0/q;->f0(I)V

    and-int/lit8 v13, v26, 0x70

    const/16 v15, 0x20

    if-ne v13, v15, :cond_c

    const/4 v13, 0x1

    goto :goto_9

    :cond_c
    move v13, v0

    :goto_9
    invoke-virtual {v14, v5}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v15

    or-int/2addr v13, v15

    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v15

    if-nez v13, :cond_d

    if-ne v15, v1, :cond_e

    :cond_d
    new-instance v15, LBg/s;

    const/4 v13, 0x0

    invoke-direct {v15, v7, v5, v13}, LBg/s;-><init>(LVm/n;Lwg/v0;I)V

    invoke-virtual {v14, v15}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_e
    check-cast v15, LVm/k;

    invoke-virtual {v14, v0}, Lm0/q;->q(Z)V

    move v13, v0

    new-instance v0, LBg/G;

    move-object/from16 v16, v1

    move-object v1, v5

    const/4 v5, 0x0

    move-object/from16 v10, v16

    invoke-direct/range {v0 .. v5}, LBg/G;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    const v2, 0x63a0d8ac

    invoke-static {v2, v0, v14}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v17

    move-object/from16 v18, v14

    iget-object v14, v1, Lwg/v0;->a:Ljava/lang/Boolean;

    const/16 v16, 0x0

    iget-object v0, v1, Lwg/v0;->c:Ljava/lang/String;

    const/high16 v19, 0x30000

    const/16 v20, 0x10

    move/from16 v27, v13

    move-object v13, v0

    move/from16 v0, v27

    invoke-static/range {v12 .. v20}, Lio/sentry/config/a;->D(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;LVm/k;ZLu0/d;Lm0/l;II)V

    move-object/from16 v14, v18

    :goto_a
    invoke-virtual {v14, v0}, Lm0/q;->q(Z)V

    sget-object v1, Lcom/eightsleep/presentation_metrics/enums/MetricsFeedbackAnswerKey;->WOKE_UP_TIME:Lcom/eightsleep/presentation_metrics/enums/MetricsFeedbackAnswerKey;

    invoke-interface {v9, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Lwg/C0;

    if-eqz v2, :cond_f

    check-cast v1, Lwg/C0;

    goto :goto_b

    :cond_f
    move-object/from16 v1, v21

    :goto_b
    const v2, 0x1947c927

    invoke-virtual {v14, v2}, Lm0/q;->f0(I)V

    if-nez v1, :cond_10

    goto :goto_d

    :cond_10
    const v2, 0x7f120ae3

    invoke-static {v14, v2}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v12

    const v2, 0x4de8a6df    # 4.8790627E8f

    invoke-virtual {v14, v2}, Lm0/q;->f0(I)V

    and-int/lit8 v2, v26, 0x70

    const/16 v15, 0x20

    if-ne v2, v15, :cond_11

    const/4 v2, 0x1

    goto :goto_c

    :cond_11
    move v2, v0

    :goto_c
    invoke-virtual {v14, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    or-int/2addr v2, v4

    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v4

    if-nez v2, :cond_12

    if-ne v4, v10, :cond_13

    :cond_12
    new-instance v4, LBg/x;

    const/4 v2, 0x0

    invoke-direct {v4, v7, v1, v2}, LBg/x;-><init>(LVm/n;Lwg/C0;I)V

    invoke-virtual {v14, v4}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_13
    move-object v15, v4

    check-cast v15, LVm/k;

    invoke-virtual {v14, v0}, Lm0/q;->q(Z)V

    move v13, v0

    new-instance v0, LBg/G;

    const/4 v5, 0x1

    move-object/from16 v2, p0

    move-object/from16 v4, p4

    invoke-direct/range {v0 .. v5}, LBg/G;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    const v2, -0x38068a25

    invoke-static {v2, v0, v14}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v17

    move-object/from16 v18, v14

    iget-object v14, v1, Lwg/C0;->a:Ljava/lang/Boolean;

    const/16 v16, 0x0

    iget-object v0, v1, Lwg/C0;->c:Ljava/lang/String;

    const/high16 v19, 0x30000

    const/16 v20, 0x10

    move/from16 v27, v13

    move-object v13, v0

    move/from16 v0, v27

    invoke-static/range {v12 .. v20}, Lio/sentry/config/a;->D(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;LVm/k;ZLu0/d;Lm0/l;II)V

    move-object/from16 v14, v18

    :goto_d
    invoke-virtual {v14, v0}, Lm0/q;->q(Z)V

    sget-object v1, Lcom/eightsleep/presentation_metrics/enums/MetricsFeedbackAnswerKey;->SLEEP_INTERRUPTIONS:Lcom/eightsleep/presentation_metrics/enums/MetricsFeedbackAnswerKey;

    invoke-interface {v9, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Lwg/z0;

    if-eqz v2, :cond_14

    move-object/from16 v21, v1

    check-cast v21, Lwg/z0;

    :cond_14
    move-object/from16 v1, v21

    const v2, 0x194836a9

    invoke-virtual {v14, v2}, Lm0/q;->f0(I)V

    if-nez v1, :cond_15

    move-object/from16 v2, p0

    move v8, v0

    move-object v3, v6

    goto :goto_f

    :cond_15
    const v2, 0x7f120aa1

    invoke-static {v14, v2}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v12

    const v2, 0x7f120ae8

    invoke-static {v14, v2}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v13

    const v2, 0x4de91a3f    # 4.8885142E8f

    invoke-virtual {v14, v2}, Lm0/q;->f0(I)V

    and-int/lit8 v2, v26, 0x70

    const/16 v15, 0x20

    if-ne v2, v15, :cond_16

    const/4 v2, 0x1

    goto :goto_e

    :cond_16
    move v2, v0

    :goto_e
    invoke-virtual {v14, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    or-int/2addr v2, v4

    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v4

    if-nez v2, :cond_17

    if-ne v4, v10, :cond_18

    :cond_17
    new-instance v4, LBg/B;

    const/4 v2, 0x0

    invoke-direct {v4, v7, v1, v2}, LBg/B;-><init>(LVm/n;Lwg/z0;I)V

    invoke-virtual {v14, v4}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_18
    move-object v15, v4

    check-cast v15, LVm/k;

    invoke-virtual {v14, v0}, Lm0/q;->q(Z)V

    move v2, v0

    new-instance v0, LBg/H;

    const/4 v6, 0x0

    move-object/from16 v4, p2

    move-object v5, v8

    move v8, v2

    move-object/from16 v2, p0

    invoke-direct/range {v0 .. v6}, LBg/H;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    move-object v3, v4

    const v4, -0x6c5ddbc7

    invoke-static {v4, v0, v14}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v17

    iget-object v0, v1, Lwg/z0;->a:Ljava/lang/Boolean;

    const/16 v16, 0x0

    const/high16 v19, 0x30000

    const/16 v20, 0x10

    move-object/from16 v18, v14

    move-object v14, v0

    invoke-static/range {v12 .. v20}, Lio/sentry/config/a;->D(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;LVm/k;ZLu0/d;Lm0/l;II)V

    move-object/from16 v14, v18

    :goto_f
    invoke-virtual {v14, v8}, Lm0/q;->q(Z)V

    sget-object v0, Lcom/eightsleep/presentation_metrics/enums/MetricsFeedbackAnswerKey;->SLEEP_FITNESS_SCORE:Lcom/eightsleep/presentation_metrics/enums/MetricsFeedbackAnswerKey;

    invoke-interface {v9, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwg/h0;

    const v1, 0x1948b488

    invoke-virtual {v14, v1}, Lm0/q;->f0(I)V

    if-nez v0, :cond_19

    move/from16 v1, v26

    goto :goto_10

    :cond_19
    check-cast v0, Lwg/D0;

    move/from16 v1, v26

    and-int/lit16 v4, v1, 0x3f0

    invoke-static {v0, v7, v3, v14, v4}, Lio/sentry/config/a;->w(Lwg/D0;LVm/n;LVm/n;Lm0/l;I)V

    :goto_10
    invoke-virtual {v14, v8}, Lm0/q;->q(Z)V

    sget-object v0, Lcom/eightsleep/presentation_metrics/enums/MetricsFeedbackAnswerKey;->SNORING:Lcom/eightsleep/presentation_metrics/enums/MetricsFeedbackAnswerKey;

    invoke-interface {v9, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwg/h0;

    const v4, 0x1948db88

    invoke-virtual {v14, v4}, Lm0/q;->f0(I)V

    if-nez v0, :cond_1a

    goto :goto_11

    :cond_1a
    check-cast v0, Lwg/D0;

    and-int/lit16 v4, v1, 0x3f0

    invoke-static {v0, v7, v3, v14, v4}, Lio/sentry/config/a;->w(Lwg/D0;LVm/n;LVm/n;Lm0/l;I)V

    :goto_11
    invoke-virtual {v14, v8}, Lm0/q;->q(Z)V

    const v0, 0x1948fe3e

    invoke-virtual {v14, v0}, Lm0/q;->f0(I)V

    iget-object v0, v2, Lwg/E;->g:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1b

    const v0, 0x7f1206f0

    invoke-static {v14, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v0

    const v4, 0x7f120ac4

    invoke-static {v14, v4}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v9

    new-instance v4, LAe/q;

    const/4 v5, 0x2

    invoke-direct {v4, v2, v7, v3, v5}, LAe/q;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    const v5, 0x3f8d2bbe

    invoke-static {v5, v4, v14}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v13

    and-int/lit16 v1, v1, 0x1c00

    const v4, 0x36000

    or-int v15, v1, v4

    iget-object v10, v2, Lwg/E;->e:Ljava/lang/Boolean;

    const/4 v12, 0x0

    const/16 v16, 0x0

    move v1, v8

    move-object v8, v0

    move v0, v1

    const/4 v1, 0x1

    invoke-static/range {v8 .. v16}, Lio/sentry/config/a;->D(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;LVm/k;ZLu0/d;Lm0/l;II)V

    goto :goto_12

    :cond_1b
    move v0, v8

    const/4 v1, 0x1

    :goto_12
    invoke-virtual {v14, v0}, Lm0/q;->q(Z)V

    invoke-virtual {v14, v1}, Lm0/q;->q(Z)V

    :goto_13
    invoke-virtual {v14}, Lm0/q;->u()Lm0/t0;

    move-result-object v8

    if-eqz v8, :cond_1c

    new-instance v0, LAe/d0;

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object v1, v2

    move-object v2, v7

    move/from16 v7, p7

    invoke-direct/range {v0 .. v7}, LAe/d0;-><init>(Lwg/E;LVm/n;LVm/n;LVm/k;LVm/n;LVm/k;I)V

    iput-object v0, v8, Lm0/t0;->d:LVm/n;

    :cond_1c
    return-void
.end method

.method public static final y(LA0/r;Lcom/eightsleep/presentation_home/viewmodel/NapModeSettingsViewModel;LVm/k;LVm/k;Lm0/l;I)V
    .locals 12

    const-string v0, "viewModel"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onOneTimeEvent"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onNavEvent"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v9, p4

    check-cast v9, Lm0/q;

    const v0, -0x71479bdb

    invoke-virtual {v9, v0}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v9, p0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int v0, p5, v0

    invoke-virtual {v9, p1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/16 v4, 0x20

    goto :goto_1

    :cond_1
    const/16 v4, 0x10

    :goto_1
    or-int/2addr v0, v4

    invoke-virtual {v9, p2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    const/16 v4, 0x100

    goto :goto_2

    :cond_2
    const/16 v4, 0x80

    :goto_2
    or-int/2addr v0, v4

    invoke-virtual {v9, p3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    const/16 v4, 0x800

    goto :goto_3

    :cond_3
    const/16 v4, 0x400

    :goto_3
    or-int/2addr v0, v4

    and-int/lit16 v4, v0, 0x493

    const/16 v5, 0x492

    if-ne v4, v5, :cond_5

    invoke-virtual {v9}, Lm0/q;->H()Z

    move-result v4

    if-nez v4, :cond_4

    goto :goto_4

    :cond_4
    invoke-virtual {v9}, Lm0/q;->Y()V

    goto :goto_5

    :cond_5
    :goto_4
    sget-object v4, Landroidx/compose/foundation/layout/b;->c:Landroidx/compose/foundation/layout/FillElement;

    invoke-interface {p0, v4}, LA0/r;->then(LA0/r;)LA0/r;

    move-result-object v4

    sget-object v8, Leg/d;->a:Lu0/d;

    and-int/lit8 v5, v0, 0x70

    const v6, 0x6006000

    or-int/2addr v5, v6

    and-int/lit16 v6, v0, 0x380

    or-int/2addr v5, v6

    and-int/lit16 v0, v0, 0x1c00

    or-int v10, v5, v0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, v4

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/16 v11, 0xe0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v11}, LP2/o;->g(LA0/r;LL8/e;LVm/k;LVm/k;ZZLH0/w;Ljava/lang/String;LVm/r;Lm0/l;II)V

    :goto_5
    invoke-virtual {v9}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_6

    new-instance v0, Leg/i;

    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move/from16 v5, p5

    invoke-direct/range {v0 .. v6}, Leg/i;-><init>(LA0/r;Lcom/eightsleep/presentation_home/viewmodel/NapModeSettingsViewModel;LVm/k;LVm/k;II)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_6
    return-void
.end method

.method public static final z(LA0/r;LVm/k;LVm/k;Lcom/eightsleep/presentation_user/viewmodel/PhoneNumberConfirmationViewModel;Lm0/l;I)V
    .locals 13

    move-object/from16 v1, p3

    move/from16 v12, p5

    const-string v0, "onNavEvent"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onOneTimeEvent"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "viewModel"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v9, p4

    check-cast v9, Lm0/q;

    const v0, -0x42dd5c3c

    invoke-virtual {v9, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, v12, 0x6

    if-nez v0, :cond_1

    invoke-virtual {v9, p0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int/2addr v0, v12

    goto :goto_1

    :cond_1
    move v0, v12

    :goto_1
    and-int/lit8 v3, v12, 0x30

    if-nez v3, :cond_3

    invoke-virtual {v9, p1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/16 v3, 0x20

    goto :goto_2

    :cond_2
    const/16 v3, 0x10

    :goto_2
    or-int/2addr v0, v3

    :cond_3
    and-int/lit16 v3, v12, 0x180

    if-nez v3, :cond_5

    invoke-virtual {v9, p2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    const/16 v3, 0x100

    goto :goto_3

    :cond_4
    const/16 v3, 0x80

    :goto_3
    or-int/2addr v0, v3

    :cond_5
    and-int/lit16 v3, v12, 0xc00

    if-nez v3, :cond_7

    invoke-virtual {v9, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    const/16 v3, 0x800

    goto :goto_4

    :cond_6
    const/16 v3, 0x400

    :goto_4
    or-int/2addr v0, v3

    :cond_7
    and-int/lit16 v3, v0, 0x493

    const/16 v4, 0x492

    if-ne v3, v4, :cond_9

    invoke-virtual {v9}, Lm0/q;->H()Z

    move-result v3

    if-nez v3, :cond_8

    goto :goto_5

    :cond_8
    invoke-virtual {v9}, Lm0/q;->Y()V

    goto :goto_6

    :cond_9
    :goto_5
    sget-object v3, Landroidx/compose/foundation/layout/b;->c:Landroidx/compose/foundation/layout/FillElement;

    invoke-interface {p0, v3}, LA0/r;->then(LA0/r;)LA0/r;

    move-result-object v3

    sget-object v8, LMi/l;->a:Lu0/d;

    shr-int/lit8 v4, v0, 0x6

    and-int/lit8 v4, v4, 0x70

    const/high16 v5, 0x6c30000

    or-int/2addr v4, v5

    and-int/lit16 v5, v0, 0x380

    or-int/2addr v4, v5

    shl-int/lit8 v0, v0, 0x6

    and-int/lit16 v0, v0, 0x1c00

    or-int v10, v4, v0

    const/4 v6, 0x0

    const-string v7, "phone_confirmation_success"

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/16 v11, 0x50

    move-object v2, p2

    move-object v0, v3

    move-object v3, p1

    invoke-static/range {v0 .. v11}, LP2/o;->g(LA0/r;LL8/e;LVm/k;LVm/k;ZZLH0/w;Ljava/lang/String;LVm/r;Lm0/l;II)V

    :goto_6
    invoke-virtual {v9}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_a

    new-instance v0, LMi/a;

    const/4 v6, 0x3

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object/from16 v4, p3

    move v5, v12

    invoke-direct/range {v0 .. v6}, LMi/a;-><init>(LA0/r;LVm/k;LVm/k;Lcom/eightsleep/presentation_user/viewmodel/PhoneNumberConfirmationViewModel;II)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_a
    return-void
.end method
