.class public final Lj0/y3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LVm/o;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;I)V
    .locals 0

    iput p2, p0, Lj0/y3;->a:I

    iput-object p1, p0, Lj0/y3;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 32

    move-object/from16 v0, p0

    const-string v4, "$this$AnimatedVisibility"

    const/4 v5, 0x1

    const/16 v6, 0x30

    const/high16 v7, 0x3f800000    # 1.0f

    sget-object v8, LA0/o;->a:LA0/o;

    const/16 v10, 0x10

    sget-object v11, LHm/B;->a:LHm/B;

    iget-object v12, v0, Lj0/y3;->b:Ljava/lang/Object;

    iget v0, v0, Lj0/y3;->a:I

    packed-switch v0, :pswitch_data_0

    move-object/from16 v13, p1

    check-cast v13, LA0/r;

    move-object/from16 v0, p2

    check-cast v0, Lm0/l;

    move-object/from16 v1, p3

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    const-string v2, "legendModifier"

    invoke-static {v13, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    and-int/lit8 v2, v1, 0x6

    if-nez v2, :cond_1

    move-object v2, v0

    check-cast v2, Lm0/q;

    invoke-virtual {v2, v13}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v3, 0x4

    goto :goto_0

    :cond_0
    const/4 v3, 0x2

    :goto_0
    or-int/2addr v1, v3

    :cond_1
    and-int/lit8 v2, v1, 0x13

    const/16 v3, 0x12

    if-ne v2, v3, :cond_3

    move-object v2, v0

    check-cast v2, Lm0/q;

    invoke-virtual {v2}, Lm0/q;->H()Z

    move-result v3

    if-nez v3, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {v2}, Lm0/q;->Y()V

    goto :goto_2

    :cond_3
    :goto_1
    check-cast v12, Lsc/h;

    invoke-static {v12, v0}, Lxf/m;->x(Lsc/h;Lm0/l;)J

    move-result-wide v2

    const v4, 0x7f1209b3

    invoke-static {v0, v4}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v14

    const v4, 0x3df5c28f    # 0.12f

    invoke-static {v2, v3, v4}, LH0/w;->b(JF)J

    move-result-wide v17

    and-int/lit8 v20, v1, 0xe

    const/16 v21, 0x0

    move-object/from16 v19, v0

    move-wide v15, v2

    invoke-static/range {v13 .. v21}, LV5/s;->G(LA0/r;Ljava/lang/String;JJLm0/l;II)V

    :goto_2
    return-object v11

    :pswitch_0
    move-object/from16 v0, p1

    check-cast v0, LG/V0;

    move-object/from16 v6, p2

    check-cast v6, Lm0/l;

    move-object/from16 v1, p3

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    const-string v2, "$this$TextButton"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    and-int/lit8 v0, v1, 0x11

    if-ne v0, v10, :cond_5

    move-object v0, v6

    check-cast v0, Lm0/q;

    invoke-virtual {v0}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_4

    goto :goto_3

    :cond_4
    invoke-virtual {v0}, Lm0/q;->Y()V

    goto/16 :goto_6

    :cond_5
    :goto_3
    sget-object v13, Lg8/h0;->a:Lg8/h0;

    check-cast v12, Lcom/eightsleep/data_core/enums/WifiSecurityType;

    invoke-virtual {v12}, Lcom/eightsleep/data_core/enums/WifiSecurityType;->getLabelResId()I

    move-result v0

    invoke-static {v6, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v18

    const/4 v14, 0x0

    const/16 v15, 0x7e

    const/16 v17, 0x0

    const/16 v16, 0x0

    const/16 v22, 0x0

    const/16 v21, 0x0

    const/16 v19, 0x0

    move-object/from16 v20, v6

    invoke-virtual/range {v13 .. v22}, Lg8/h0;->c(IILA0/r;LH0/w;Ljava/lang/String;Lk1/U;Lm0/l;Lv1/k;Z)V

    sget-object v0, LP2/d;->a:LM0/f;

    if-eqz v0, :cond_6

    :goto_4
    move-object v1, v0

    goto :goto_5

    :cond_6
    new-instance v21, LM0/e;

    const/16 v29, 0x0

    const/16 v30, 0x0

    const-string v22, "Filled.ArrowDropDown"

    const/high16 v23, 0x41c00000    # 24.0f

    const/high16 v24, 0x41c00000    # 24.0f

    const/high16 v25, 0x41c00000    # 24.0f

    const/high16 v26, 0x41c00000    # 24.0f

    const-wide/16 v27, 0x0

    const/16 v31, 0x60

    invoke-direct/range {v21 .. v31}, LM0/e;-><init>(Ljava/lang/String;FFFFJIZI)V

    move-object/from16 v0, v21

    sget v1, LM0/H;->a:I

    new-instance v1, LH0/Z;

    sget-wide v2, LH0/w;->b:J

    invoke-direct {v1, v2, v3}, LH0/Z;-><init>(J)V

    new-instance v2, Ljava/util/ArrayList;

    const/16 v3, 0x20

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v3, LM0/n;

    const/high16 v4, 0x40e00000    # 7.0f

    const/high16 v5, 0x41200000    # 10.0f

    invoke-direct {v3, v4, v5}, LM0/n;-><init>(FF)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v3, LM0/u;

    const/high16 v4, 0x40a00000    # 5.0f

    invoke-direct {v3, v4, v4}, LM0/u;-><init>(FF)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v3, LM0/u;

    const/high16 v5, -0x3f600000    # -5.0f

    invoke-direct {v3, v4, v5}, LM0/u;-><init>(FF)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v3, LM0/j;->c:LM0/j;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v0, v2, v1}, LM0/e;->a(LM0/e;Ljava/util/ArrayList;LH0/Z;)V

    invoke-virtual {v0}, LM0/e;->b()LM0/f;

    move-result-object v0

    sput-object v0, LP2/d;->a:LM0/f;

    goto :goto_4

    :goto_5
    const/16 v7, 0x30

    const/16 v8, 0xc

    const-string v2, "Open"

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    move-object/from16 v6, v20

    invoke-static/range {v1 .. v8}, Lj0/I0;->b(LM0/f;Ljava/lang/String;LA0/r;JLm0/l;II)V

    :goto_6
    return-object v11

    :pswitch_1
    move-object/from16 v0, p1

    check-cast v0, LG/C;

    move-object/from16 v4, p2

    check-cast v4, Lm0/l;

    move-object/from16 v13, p3

    check-cast v13, Ljava/lang/Number;

    invoke-virtual {v13}, Ljava/lang/Number;->intValue()I

    move-result v13

    const-string v14, "$this$ModeOnboardingScaffold"

    invoke-static {v0, v14}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    and-int/lit8 v0, v13, 0x11

    if-ne v0, v10, :cond_8

    move-object v0, v4

    check-cast v0, Lm0/q;

    invoke-virtual {v0}, Lm0/q;->H()Z

    move-result v10

    if-nez v10, :cond_7

    goto :goto_7

    :cond_7
    invoke-virtual {v0}, Lm0/q;->Y()V

    move-object/from16 v30, v11

    goto/16 :goto_f

    :cond_8
    :goto_7
    invoke-static {v8, v7}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v0

    invoke-static {v4}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v10

    iget v10, v10, Lhh/i;->i:F

    invoke-static {v4}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v13

    iget v13, v13, Lhh/i;->g:F

    invoke-static {v0, v10, v13}, LG/e;->I(LA0/r;FF)LA0/r;

    move-result-object v0

    sget-object v10, LA0/d;->n:LA0/g;

    sget-object v13, LG/l;->a:LG/d;

    invoke-static {v4}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v13

    iget v13, v13, Lhh/i;->c:F

    invoke-static {v13}, LG/l;->g(F)LG/j;

    move-result-object v13

    invoke-static {v13, v10, v4, v6}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v10

    move-object v13, v4

    check-cast v13, Lm0/q;

    iget-wide v14, v13, Lm0/q;->T:J

    invoke-static {v14, v15}, Ljava/lang/Long;->hashCode(J)I

    move-result v14

    invoke-virtual {v13}, Lm0/q;->m()Lm0/o0;

    move-result-object v15

    invoke-static {v0, v4}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v0

    sget-object v16, LZ0/h;->l0:LZ0/g;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, LZ0/g;->b:LZ0/f;

    invoke-virtual {v13}, Lm0/q;->j0()V

    iget-boolean v9, v13, Lm0/q;->S:Z

    if-eqz v9, :cond_9

    invoke-virtual {v13, v1}, Lm0/q;->l(LVm/a;)V

    goto :goto_8

    :cond_9
    invoke-virtual {v13}, Lm0/q;->t0()V

    :goto_8
    sget-object v9, LZ0/g;->f:LZ0/e;

    invoke-static {v9, v10, v4}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v10, LZ0/g;->e:LZ0/e;

    invoke-static {v10, v15, v4}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    sget-object v15, LZ0/g;->g:LZ0/e;

    invoke-static {v4, v14, v15}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v14, LZ0/g;->h:LZ0/d;

    invoke-static {v4, v14}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v6, LZ0/g;->d:LZ0/e;

    invoke-static {v6, v0, v4}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const v0, 0x7f12075e

    invoke-static {v4, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v0

    move-object/from16 v16, v15

    sget-object v15, LZg/m;->SOLID:LZg/m;

    new-instance v2, LZg/j;

    const v3, 0x7f080202

    invoke-direct {v2, v3}, LZg/j;-><init>(I)V

    const/16 v20, 0x180

    const/16 v21, 0x6a

    move-object v3, v14

    const/4 v14, 0x0

    move-object/from16 v17, v16

    const/16 v16, 0x0

    const/16 v18, 0x0

    move-object/from16 v19, v4

    move-object v4, v13

    move-object v13, v0

    move-object/from16 v0, v17

    move-object/from16 v17, v2

    invoke-static/range {v13 .. v21}, LZg/h;->a(Ljava/lang/String;LA0/r;LZg/m;LZg/l;LZg/k;LH0/w;Lm0/l;II)V

    move-object/from16 v2, v19

    sget-object v13, Lih/h;->g:Lih/h;

    const v14, 0x7f120b82

    invoke-static {v2, v14}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v14

    const/16 v24, 0x0

    const/16 v25, 0x3ee

    const/4 v15, 0x0

    const-wide/16 v16, 0x0

    const/16 v18, 0x3

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v23, 0x0

    move-object/from16 v22, v2

    invoke-virtual/range {v13 .. v25}, Lih/h;->f(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    sget-object v13, Lih/h;->b:Lih/h;

    const v14, 0x7f120a0d

    invoke-static {v2, v14}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual/range {v13 .. v25}, Lih/h;->h(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    move-object/from16 v20, v13

    invoke-virtual {v4, v5}, Lm0/q;->q(Z)V

    invoke-static {v8, v7}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v13

    invoke-static {v2}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v14

    iget v14, v14, Lhh/i;->h:F

    const/4 v5, 0x0

    const/4 v15, 0x2

    invoke-static {v13, v14, v5, v15}, LG/e;->J(LA0/r;FFI)LA0/r;

    move-result-object v5

    invoke-static {v2}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v13

    iget v13, v13, Lhh/i;->e:F

    invoke-static {v13}, LG/l;->g(F)LG/j;

    move-result-object v13

    sget-object v14, LA0/d;->j:LA0/h;

    const/16 v15, 0x30

    invoke-static {v13, v14, v2, v15}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v13

    iget-wide v14, v4, Lm0/q;->T:J

    invoke-static {v14, v15}, Ljava/lang/Long;->hashCode(J)I

    move-result v14

    invoke-virtual {v4}, Lm0/q;->m()Lm0/o0;

    move-result-object v15

    invoke-static {v5, v2}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v5

    invoke-virtual {v4}, Lm0/q;->j0()V

    iget-boolean v7, v4, Lm0/q;->S:Z

    if-eqz v7, :cond_a

    invoke-virtual {v4, v1}, Lm0/q;->l(LVm/a;)V

    goto :goto_9

    :cond_a
    invoke-virtual {v4}, Lm0/q;->t0()V

    :goto_9
    invoke-static {v9, v13, v2}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v10, v15, v2}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v14, v2, v0, v2, v3}, Lcom/eightsleep/data_bioage/data/model/a;->r(ILm0/l;LZ0/e;Lm0/l;LZ0/d;)V

    invoke-static {v6, v5, v2}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v5, LG/W0;->a:LG/W0;

    invoke-static {}, Ljava/text/NumberFormat;->getIntegerInstance()Ljava/text/NumberFormat;

    move-result-object v7

    check-cast v12, Lsc/o;

    if-eqz v12, :cond_b

    iget v13, v12, Lsc/o;->a:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v7, v13}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    goto :goto_a

    :cond_b
    const/4 v13, 0x0

    :goto_a
    const v14, 0x7f120b84

    invoke-static {v2, v14}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v14

    move-object/from16 p0, v6

    move-object/from16 v30, v11

    const/4 v11, 0x1

    const/high16 v15, 0x3f800000    # 1.0f

    invoke-virtual {v5, v8, v15, v11}, LG/W0;->b(LA0/r;FZ)LA0/r;

    move-result-object v6

    const/4 v11, 0x0

    invoke-static {v13, v14, v6, v2, v11}, LP2/v;->o(Ljava/lang/String;Ljava/lang/String;LA0/r;Lm0/l;I)V

    if-eqz v12, :cond_c

    iget v6, v12, Lsc/o;->b:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v7, v6}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    goto :goto_b

    :cond_c
    const/4 v6, 0x0

    :goto_b
    const v7, 0x7f120a0f

    invoke-static {v2, v7}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v7

    const/4 v11, 0x1

    const/high16 v15, 0x3f800000    # 1.0f

    invoke-virtual {v5, v8, v15, v11}, LG/W0;->b(LA0/r;FZ)LA0/r;

    move-result-object v13

    const/4 v11, 0x0

    invoke-static {v6, v7, v13, v2, v11}, LP2/v;->o(Ljava/lang/String;Ljava/lang/String;LA0/r;Lm0/l;I)V

    const v6, 0x63053c44

    invoke-virtual {v4, v6}, Lm0/q;->f0(I)V

    if-nez v12, :cond_d

    const/4 v6, 0x0

    :goto_c
    const/4 v11, 0x0

    goto :goto_d

    :cond_d
    iget v6, v12, Lsc/o;->c:I

    div-int/lit8 v7, v6, 0x3c

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    rem-int/lit8 v6, v6, 0x3c

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    filled-new-array {v7, v6}, [Ljava/lang/Object;

    move-result-object v6

    const v7, 0x7f1204c5

    invoke-static {v7, v6, v2}, LP2/j;->H(I[Ljava/lang/Object;Lm0/l;)Ljava/lang/String;

    move-result-object v6

    goto :goto_c

    :goto_d
    invoke-virtual {v4, v11}, Lm0/q;->q(Z)V

    const v7, 0x7f120a0e

    invoke-static {v2, v7}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v7

    const/4 v12, 0x1

    const/high16 v15, 0x3f800000    # 1.0f

    invoke-virtual {v5, v8, v15, v12}, LG/W0;->b(LA0/r;FZ)LA0/r;

    move-result-object v5

    invoke-static {v6, v7, v5, v2, v11}, LP2/v;->o(Ljava/lang/String;Ljava/lang/String;LA0/r;Lm0/l;I)V

    invoke-virtual {v4, v12}, Lm0/q;->q(Z)V

    invoke-static {v2}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v5

    iget v5, v5, Lhh/i;->e:F

    invoke-static {v2}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v6

    iget v6, v6, Lhh/i;->l:F

    invoke-static {v8, v5, v6}, LG/e;->I(LA0/r;FF)LA0/r;

    move-result-object v5

    const/high16 v15, 0x3f800000    # 1.0f

    invoke-static {v5, v15}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v13

    sget-object v14, Leh/a;->THIN:Leh/a;

    invoke-static {v2}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v5

    iget v15, v5, Lhh/i;->g:F

    const/16 v16, 0x0

    const/16 v18, 0x30

    const/16 v19, 0x4

    move-object/from16 v17, v2

    invoke-static/range {v13 .. v19}, Llj/o;->D(LA0/r;Leh/a;FLkm/o;Lm0/l;II)LA0/r;

    move-result-object v2

    move-object/from16 v5, v17

    invoke-static {v5}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v6

    iget v6, v6, Lhh/i;->e:F

    invoke-static {v2, v6}, LG/e;->H(LA0/r;F)LA0/r;

    move-result-object v2

    invoke-static {v5}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v6

    iget v6, v6, Lhh/i;->e:F

    invoke-static {v6}, LG/l;->g(F)LG/j;

    move-result-object v6

    sget-object v7, LA0/d;->m:LA0/g;

    const/4 v11, 0x0

    invoke-static {v6, v7, v5, v11}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v6

    iget-wide v7, v4, Lm0/q;->T:J

    invoke-static {v7, v8}, Ljava/lang/Long;->hashCode(J)I

    move-result v7

    invoke-virtual {v4}, Lm0/q;->m()Lm0/o0;

    move-result-object v8

    invoke-static {v2, v5}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v2

    invoke-virtual {v4}, Lm0/q;->j0()V

    iget-boolean v11, v4, Lm0/q;->S:Z

    if-eqz v11, :cond_e

    invoke-virtual {v4, v1}, Lm0/q;->l(LVm/a;)V

    goto :goto_e

    :cond_e
    invoke-virtual {v4}, Lm0/q;->t0()V

    :goto_e
    invoke-static {v9, v6, v5}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v10, v8, v5}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v7, v5, v0, v5, v3}, Lcom/eightsleep/data_bioage/data/model/a;->r(ILm0/l;LZ0/e;Lm0/l;LZ0/d;)V

    move-object/from16 v0, p0

    invoke-static {v0, v2, v5}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const v0, 0x7f121316

    invoke-static {v5, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v14

    const/16 v24, 0x0

    const/16 v25, 0x3fe

    const/4 v15, 0x0

    const-wide/16 v16, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object/from16 v13, v20

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v23, 0x0

    move-object/from16 v22, v5

    invoke-virtual/range {v13 .. v25}, Lih/h;->h(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    move-object/from16 v2, v22

    const v0, 0x7f121315

    invoke-static {v2, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f120a10

    invoke-static {v2, v1}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v1

    const v3, 0x7f080261

    const/4 v11, 0x0

    invoke-static {v3, v0, v1, v2, v11}, LP2/v;->f(ILjava/lang/String;Ljava/lang/String;Lm0/l;I)V

    const v0, 0x7f121318

    invoke-static {v2, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f120a11

    invoke-static {v2, v1}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v1

    const v3, 0x7f08017c

    invoke-static {v3, v0, v1, v2, v11}, LP2/v;->f(ILjava/lang/String;Ljava/lang/String;Lm0/l;I)V

    const/4 v11, 0x1

    invoke-virtual {v4, v11}, Lm0/q;->q(Z)V

    :goto_f
    return-object v30

    :pswitch_2
    move-object/from16 v30, v11

    move-object/from16 v0, p1

    check-cast v0, Lv/A;

    move-object/from16 v1, p2

    check-cast v1, Lm0/l;

    move-object/from16 v2, p3

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    invoke-static {v0, v4}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v12, Lng/i;

    iget-object v0, v12, Lng/i;->c:LYa/H;

    if-nez v0, :cond_f

    goto :goto_10

    :cond_f
    sget-object v2, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->b:Lm0/c1;

    move-object v7, v1

    check-cast v7, Lm0/q;

    invoke-virtual {v7, v2}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    invoke-virtual {v0, v1}, LYa/H;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, LPg/h;

    sget-object v0, LPg/k;->ERROR:LPg/k;

    const/4 v1, 0x0

    invoke-direct {v4, v0, v1}, LPg/h;-><init>(LPg/k;Ljava/lang/Integer;)V

    const/4 v8, 0x0

    const/16 v9, 0x1c

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v3 .. v9}, LPg/f;->c(Ljava/lang/String;LPg/j;LA0/r;Ljava/lang/String;Lm0/l;II)V

    :goto_10
    return-object v30

    :pswitch_3
    move-object/from16 v30, v11

    move-object/from16 v0, p1

    check-cast v0, LI/c;

    move-object/from16 v5, p2

    check-cast v5, Lm0/l;

    move-object/from16 v1, p3

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    const-string v2, "$this$item"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    and-int/lit8 v0, v1, 0x11

    if-ne v0, v10, :cond_11

    move-object v0, v5

    check-cast v0, Lm0/q;

    invoke-virtual {v0}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_10

    goto :goto_11

    :cond_10
    invoke-virtual {v0}, Lm0/q;->Y()V

    goto :goto_12

    :cond_11
    :goto_11
    check-cast v12, Lng/l;

    iget v2, v12, Lng/l;->a:I

    iget v4, v12, Lng/l;->c:I

    const/4 v6, 0x0

    const/4 v1, 0x0

    iget v3, v12, Lng/l;->b:I

    invoke-static/range {v1 .. v6}, LP2/n;->m(LA0/o;IIILm0/l;I)V

    :goto_12
    return-object v30

    :pswitch_4
    move-object/from16 v30, v11

    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/String;

    move-object/from16 v1, p2

    check-cast v1, Lm0/l;

    move-object/from16 v2, p3

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    const-string v3, "it"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    and-int/lit8 v0, v2, 0x11

    if-ne v0, v10, :cond_13

    move-object v0, v1

    check-cast v0, Lm0/q;

    invoke-virtual {v0}, Lm0/q;->H()Z

    move-result v2

    if-nez v2, :cond_12

    goto :goto_13

    :cond_12
    invoke-virtual {v0}, Lm0/q;->Y()V

    goto/16 :goto_16

    :cond_13
    :goto_13
    check-cast v12, Lhi/a;

    invoke-interface {v12}, Lgi/u;->t()LHm/k;

    move-result-object v0

    if-nez v0, :cond_14

    goto/16 :goto_16

    :cond_14
    const/high16 v15, 0x3f800000    # 1.0f

    invoke-static {v8, v15}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v2

    sget-object v3, LA0/d;->k:LA0/h;

    sget-object v4, LG/l;->a:LG/d;

    const/16 v15, 0x30

    invoke-static {v4, v3, v1, v15}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v3

    move-object v4, v1

    check-cast v4, Lm0/q;

    iget-wide v5, v4, Lm0/q;->T:J

    invoke-static {v5, v6}, Ljava/lang/Long;->hashCode(J)I

    move-result v5

    invoke-virtual {v4}, Lm0/q;->m()Lm0/o0;

    move-result-object v6

    invoke-static {v2, v1}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v2

    sget-object v7, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v7, LZ0/g;->b:LZ0/f;

    invoke-virtual {v4}, Lm0/q;->j0()V

    iget-boolean v9, v4, Lm0/q;->S:Z

    if-eqz v9, :cond_15

    invoke-virtual {v4, v7}, Lm0/q;->l(LVm/a;)V

    goto :goto_14

    :cond_15
    invoke-virtual {v4}, Lm0/q;->t0()V

    :goto_14
    sget-object v7, LZ0/g;->f:LZ0/e;

    invoke-static {v7, v3, v1}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v3, LZ0/g;->e:LZ0/e;

    invoke-static {v3, v6, v1}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    sget-object v5, LZ0/g;->g:LZ0/e;

    invoke-static {v1, v3, v5}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v3, LZ0/g;->h:LZ0/d;

    invoke-static {v1, v3}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v3, LZ0/g;->d:LZ0/e;

    invoke-static {v3, v2, v1}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const v2, 0x6556d44c

    invoke-virtual {v4, v2}, Lm0/q;->f0(I)V

    iget-object v2, v0, LHm/k;->a:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v3

    const/4 v11, 0x1

    if-gt v3, v11, :cond_16

    const/16 v15, 0x30

    int-to-float v3, v15

    invoke-static {v8, v3}, Landroidx/compose/foundation/layout/b;->n(LA0/r;F)LA0/r;

    move-result-object v3

    invoke-static {v3, v1}, LG/e;->h(LA0/r;Lm0/l;)V

    :cond_16
    const/4 v11, 0x0

    invoke-virtual {v4, v11}, Lm0/q;->q(Z)V

    const/high16 v15, 0x3f800000    # 1.0f

    float-to-double v5, v15

    const-wide/16 v7, 0x0

    cmpl-double v3, v5, v7

    if-lez v3, :cond_17

    goto :goto_15

    :cond_17
    const-string v3, "invalid weight; must be greater than zero"

    invoke-static {v3}, LH/a;->a(Ljava/lang/String;)V

    :goto_15
    new-instance v3, LG/x0;

    const/4 v11, 0x1

    invoke-direct {v3, v15, v11}, LG/x0;-><init>(FZ)V

    invoke-static {v1}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v5

    iget-object v5, v5, Lhh/h;->k:Lhh/v;

    iget-wide v5, v5, Lhh/v;->a:J

    invoke-static {v1}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v7

    iget-object v7, v7, Lhh/h;->k:Lhh/v;

    iget-wide v7, v7, Lhh/v;->e:J

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v17

    iget-object v0, v0, LHm/k;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v18

    const/16 v25, 0x0

    const/16 v26, 0x0

    move-object/from16 v24, v1

    move-object/from16 v19, v3

    move-wide/from16 v20, v5

    move-wide/from16 v22, v7

    invoke-static/range {v17 .. v26}, LP2/I;->k(IILA0/r;JJLm0/l;II)V

    const/4 v11, 0x1

    invoke-virtual {v4, v11}, Lm0/q;->q(Z)V

    :goto_16
    return-object v30

    :pswitch_5
    move-object/from16 v30, v11

    move-object/from16 v0, p1

    check-cast v0, Lv/A;

    move-object/from16 v8, p2

    check-cast v8, Lm0/l;

    move-object/from16 v1, p3

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    invoke-static {v0, v4}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v12, LWh/s;

    invoke-interface {v12}, LPh/a;->getTitleResId()I

    move-result v0

    invoke-static {v8, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v12}, LWh/s;->getCaptionResId()Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/l;->g(Ljava/lang/Object;)V

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v8, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x4

    invoke-static/range {v5 .. v10}, LP2/K;->n(Ljava/lang/String;Ljava/lang/String;Lu0/d;Lm0/l;II)V

    return-object v30

    :pswitch_6
    move-object/from16 v30, v11

    move-object/from16 v0, p1

    check-cast v0, Lv/A;

    move-object/from16 v1, p2

    check-cast v1, Lm0/l;

    move-object/from16 v2, p3

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    invoke-static {v0, v4}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v15, Landroidx/compose/foundation/layout/b;->c:Landroidx/compose/foundation/layout/FillElement;

    sget-object v0, LA0/d;->a:LA0/i;

    const/4 v11, 0x0

    invoke-static {v0, v11}, LG/t;->d(LA0/e;Z)LX0/h0;

    move-result-object v0

    move-object v2, v1

    check-cast v2, Lm0/q;

    iget-wide v3, v2, Lm0/q;->T:J

    invoke-static {v3, v4}, Ljava/lang/Long;->hashCode(J)I

    move-result v3

    invoke-virtual {v2}, Lm0/q;->m()Lm0/o0;

    move-result-object v4

    invoke-static {v15, v1}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v5

    sget-object v6, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v6, LZ0/g;->b:LZ0/f;

    invoke-virtual {v2}, Lm0/q;->j0()V

    iget-boolean v7, v2, Lm0/q;->S:Z

    if-eqz v7, :cond_18

    invoke-virtual {v2, v6}, Lm0/q;->l(LVm/a;)V

    goto :goto_17

    :cond_18
    invoke-virtual {v2}, Lm0/q;->t0()V

    :goto_17
    sget-object v6, LZ0/g;->f:LZ0/e;

    invoke-static {v6, v0, v1}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v0, LZ0/g;->e:LZ0/e;

    invoke-static {v0, v4, v1}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v3, LZ0/g;->g:LZ0/e;

    invoke-static {v1, v0, v3}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v0, LZ0/g;->h:LZ0/d;

    invoke-static {v1, v0}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v0, LZ0/g;->d:LZ0/e;

    invoke-static {v0, v5, v1}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    check-cast v12, LYh/B;

    invoke-interface {v12}, LWh/s;->b()Ljava/lang/Integer;

    move-result-object v0

    const v3, 0x406ee655

    invoke-virtual {v2, v3}, Lm0/q;->f0(I)V

    if-nez v0, :cond_19

    :goto_18
    const/4 v11, 0x0

    goto :goto_19

    :cond_19
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    const/4 v11, 0x0

    invoke-static {v0, v11, v1}, LP2/i;->E(IILm0/l;)LL0/a;

    move-result-object v13

    sget-object v17, LX0/p;->g:LX0/p0;

    sget v0, LL0/a;->$stable:I

    or-int/lit16 v0, v0, 0x61b0

    const/16 v16, 0x0

    const/16 v22, 0x68

    const/4 v14, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    move/from16 v21, v0

    move-object/from16 v20, v1

    invoke-static/range {v13 .. v22}, Ly/x;->c(LL0/a;Ljava/lang/String;LA0/r;LA0/e;LX0/q;FLH0/p;Lm0/l;II)V

    goto :goto_18

    :goto_19
    invoke-virtual {v2, v11}, Lm0/q;->q(Z)V

    const/4 v11, 0x1

    invoke-virtual {v2, v11}, Lm0/q;->q(Z)V

    return-object v30

    :pswitch_7
    move-object/from16 v30, v11

    move-object/from16 v0, p1

    check-cast v0, LH0/w;

    iget-wide v0, v0, LH0/w;->a:J

    move-object/from16 v0, p2

    check-cast v0, Lm0/l;

    move-object/from16 v1, p3

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    and-int/lit8 v1, v1, 0x11

    if-ne v1, v10, :cond_1b

    move-object v1, v0

    check-cast v1, Lm0/q;

    invoke-virtual {v1}, Lm0/q;->H()Z

    move-result v2

    if-nez v2, :cond_1a

    goto :goto_1a

    :cond_1a
    invoke-virtual {v1}, Lm0/q;->Y()V

    goto :goto_1b

    :cond_1b
    :goto_1a
    const v1, 0x7f080184

    const/4 v11, 0x0

    invoke-static {v1, v11, v0}, LP2/i;->E(IILm0/l;)LL0/a;

    move-result-object v13

    invoke-static {v0}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v1

    iget-object v1, v1, Lhh/h;->k:Lhh/v;

    iget-wide v1, v1, Lhh/v;->a:J

    check-cast v12, Lm0/b1;

    invoke-interface {v12}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->floatValue()F

    move-result v3

    invoke-static {v8, v3}, LE0/i;->h(LA0/r;F)LA0/r;

    move-result-object v15

    sget v3, LL0/a;->$stable:I

    const/16 v28, 0x30

    or-int/lit8 v19, v3, 0x30

    const/16 v20, 0x0

    const/4 v14, 0x0

    move-object/from16 v18, v0

    move-wide/from16 v16, v1

    invoke-static/range {v13 .. v20}, Lj0/I0;->a(LL0/a;Ljava/lang/String;LA0/r;JLm0/l;II)V

    :goto_1b
    return-object v30

    :pswitch_8
    move v15, v7

    const/4 v5, 0x0

    move-object/from16 v3, p1

    check-cast v3, LA0/r;

    move-object/from16 v0, p2

    check-cast v0, Lm0/l;

    move-object/from16 v1, p3

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    check-cast v0, Lm0/q;

    const v1, -0x59518a75

    invoke-virtual {v0, v1}, Lm0/q;->f0(I)V

    sget-object v1, Ll0/v;->FastSpatial:Ll0/v;

    invoke-static {v1, v0}, Lj0/X1;->q(Ll0/v;Lm0/l;)Lw/m0;

    move-result-object v19

    sget-object v1, Ll0/v;->FastEffects:Ll0/v;

    invoke-static {v1, v0}, Lj0/X1;->q(Ll0/v;Lm0/l;)Lw/m0;

    move-result-object v1

    sget-object v20, Lw/e;->j:Lw/H0;

    check-cast v12, Lw/A0;

    iget-object v2, v12, Lw/A0;->a:LG/Y;

    invoke-virtual {v2}, LG/Y;->B0()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    const v4, -0x5c966d11

    invoke-virtual {v0, v4}, Lm0/q;->f0(I)V

    const v6, 0x3f4ccccd    # 0.8f

    if-eqz v2, :cond_1c

    move v2, v15

    :goto_1c
    const/4 v11, 0x0

    goto :goto_1d

    :cond_1c
    move v2, v6

    goto :goto_1c

    :goto_1d
    invoke-virtual {v0, v11}, Lm0/q;->q(Z)V

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v17

    iget-object v2, v12, Lw/A0;->d:Lm0/i0;

    invoke-virtual {v2}, Lm0/i0;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    invoke-virtual {v0, v4}, Lm0/q;->f0(I)V

    if-eqz v7, :cond_1d

    move v6, v15

    :cond_1d
    const/4 v11, 0x0

    invoke-virtual {v0, v11}, Lm0/q;->q(Z)V

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v18

    invoke-virtual {v12}, Lw/A0;->f()Lw/w0;

    const v4, 0x170ecc34

    invoke-virtual {v0, v4}, Lm0/q;->f0(I)V

    invoke-virtual {v0, v11}, Lm0/q;->q(Z)V

    const/high16 v22, 0x30000

    move-object/from16 v21, v0

    move-object/from16 v16, v12

    invoke-static/range {v16 .. v22}, Lw/F0;->c(Lw/A0;Ljava/lang/Object;Ljava/lang/Object;Lw/C;Lw/H0;Lm0/l;I)Lw/y0;

    move-result-object v0

    move-object/from16 v4, v21

    iget-object v6, v12, Lw/A0;->a:LG/Y;

    invoke-virtual {v6}, LG/Y;->B0()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    const v7, 0x7b90285b

    invoke-virtual {v4, v7}, Lm0/q;->f0(I)V

    if-eqz v6, :cond_1e

    move v6, v15

    :goto_1e
    const/4 v11, 0x0

    goto :goto_1f

    :cond_1e
    move v6, v5

    goto :goto_1e

    :goto_1f
    invoke-virtual {v4, v11}, Lm0/q;->q(Z)V

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v17

    invoke-virtual {v2}, Lm0/i0;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-virtual {v4, v7}, Lm0/q;->f0(I)V

    if-eqz v2, :cond_1f

    move v2, v15

    :goto_20
    const/4 v11, 0x0

    goto :goto_21

    :cond_1f
    move v2, v5

    goto :goto_20

    :goto_21
    invoke-virtual {v4, v11}, Lm0/q;->q(Z)V

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v18

    invoke-virtual {v12}, Lw/A0;->f()Lw/w0;

    const v2, -0x10ca9e60

    invoke-virtual {v4, v2}, Lm0/q;->f0(I)V

    invoke-virtual {v4, v11}, Lm0/q;->q(Z)V

    move-object/from16 v19, v1

    move-object/from16 v21, v4

    move-object/from16 v16, v12

    invoke-static/range {v16 .. v22}, Lw/F0;->c(Lw/A0;Ljava/lang/Object;Ljava/lang/Object;Lw/C;Lw/H0;Lm0/l;I)Lw/y0;

    move-result-object v1

    move-object/from16 v2, v21

    iget-object v4, v0, Lw/y0;->j:Lm0/i0;

    invoke-virtual {v4}, Lm0/i0;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->floatValue()F

    move-result v4

    iget-object v0, v0, Lw/y0;->j:Lm0/i0;

    invoke-virtual {v0}, Lm0/i0;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v5

    iget-object v0, v1, Lw/y0;->j:Lm0/i0;

    invoke-virtual {v0}, Lm0/i0;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v6

    const/4 v8, 0x0

    const v9, 0x1fff8

    const/4 v7, 0x0

    invoke-static/range {v3 .. v9}, LH0/F;->t(LA0/r;FFFFLH0/X;I)LA0/r;

    move-result-object v0

    const/4 v11, 0x0

    invoke-virtual {v2, v11}, Lm0/q;->q(Z)V

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
