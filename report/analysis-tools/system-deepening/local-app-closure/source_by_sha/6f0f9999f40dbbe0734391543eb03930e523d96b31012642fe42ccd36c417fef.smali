.class public abstract LIm/s;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final A(LFf/X0;Lm0/l;I)V
    .locals 12

    const/4 v0, 0x1

    move-object v9, p1

    check-cast v9, Lm0/q;

    const p1, -0x5bf837a0

    invoke-virtual {v9, p1}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v9, p0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result p1

    const/4 v1, 0x2

    if-eqz p1, :cond_0

    const/4 p1, 0x4

    goto :goto_0

    :cond_0
    move p1, v1

    :goto_0
    or-int/2addr p1, p2

    and-int/lit8 v2, p1, 0x3

    if-ne v2, v1, :cond_2

    invoke-virtual {v9}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v9}, Lm0/q;->Y()V

    goto/16 :goto_3

    :cond_2
    :goto_1
    sget-object v1, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->b:Lm0/c1;

    invoke-virtual {v9, v1}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    sget-object v2, LG/l;->a:LG/d;

    invoke-static {v9}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v2

    iget v2, v2, Lhh/i;->b:F

    invoke-static {v2}, LG/l;->g(F)LG/j;

    move-result-object v2

    sget-object v3, LA0/o;->a:LA0/o;

    sget-object v4, LA0/d;->m:LA0/g;

    const/4 v5, 0x0

    invoke-static {v2, v4, v9, v5}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v2

    iget-wide v4, v9, Lm0/q;->T:J

    invoke-static {v4, v5}, Ljava/lang/Long;->hashCode(J)I

    move-result v4

    invoke-virtual {v9}, Lm0/q;->m()Lm0/o0;

    move-result-object v5

    invoke-static {v3, v9}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v3

    sget-object v6, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v6, LZ0/g;->b:LZ0/f;

    invoke-virtual {v9}, Lm0/q;->j0()V

    iget-boolean v7, v9, Lm0/q;->S:Z

    if-eqz v7, :cond_3

    invoke-virtual {v9, v6}, Lm0/q;->l(LVm/a;)V

    goto :goto_2

    :cond_3
    invoke-virtual {v9}, Lm0/q;->t0()V

    :goto_2
    sget-object v6, LZ0/g;->f:LZ0/e;

    invoke-static {v6, v2, v9}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v2, LZ0/g;->e:LZ0/e;

    invoke-static {v2, v5, v9}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sget-object v4, LZ0/g;->g:LZ0/e;

    invoke-static {v9, v2, v4}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v2, LZ0/g;->h:LZ0/d;

    invoke-static {v9, v2}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v2, LZ0/g;->d:LZ0/e;

    invoke-static {v2, v3, v9}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    and-int/lit8 p1, p1, 0xe

    invoke-static {p0, v9, p1}, LIm/s;->B(LFf/X0;Lm0/l;I)V

    move-object p1, v1

    sget-object v1, Lih/h;->e:Lih/h;

    iget-object v2, p0, LFf/X0;->a:LYa/H;

    invoke-virtual {v2, p1}, LYa/H;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v9}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object p1

    iget-object p1, p1, Lhh/h;->k:Lhh/v;

    iget-wide v4, p1, Lhh/v;->d:J

    const/4 v8, 0x0

    const/4 v10, 0x0

    const/4 v3, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/16 v11, 0x3f6

    invoke-virtual/range {v1 .. v11}, Lih/h;->u(Ljava/lang/String;LA0/r;JZIILm0/l;II)V

    invoke-virtual {v9, v0}, Lm0/q;->q(Z)V

    :goto_3
    invoke-virtual {v9}, Lm0/q;->u()Lm0/t0;

    move-result-object p1

    if-eqz p1, :cond_4

    new-instance v1, LWf/R0;

    invoke-direct {v1, p0, p2, v0}, LWf/R0;-><init>(LFf/X0;II)V

    iput-object v1, p1, Lm0/t0;->d:LVm/n;

    :cond_4
    return-void
.end method

.method public static final B(LFf/X0;Lm0/l;I)V
    .locals 13

    move-object v5, p1

    check-cast v5, Lm0/q;

    const p1, 0x6be33078

    invoke-virtual {v5, p1}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v5, p0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result p1

    const/4 v0, 0x2

    if-eqz p1, :cond_0

    const/4 p1, 0x4

    goto :goto_0

    :cond_0
    move p1, v0

    :goto_0
    or-int/2addr p1, p2

    and-int/lit8 p1, p1, 0x3

    if-ne p1, v0, :cond_2

    invoke-virtual {v5}, Lm0/q;->H()Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v5}, Lm0/q;->Y()V

    goto/16 :goto_4

    :cond_2
    :goto_1
    iget-object p1, p0, LFf/X0;->d:Lcom/eightsleep/data_core/enums/ai_insights/AiInsightSentiment;

    invoke-static {p1, v5}, LIm/s;->p0(Lcom/eightsleep/data_core/enums/ai_insights/AiInsightSentiment;Lm0/l;)J

    move-result-wide v3

    iget-wide v0, p0, LFf/X0;->c:D

    const-wide/16 v6, 0x0

    cmpl-double p1, v0, v6

    if-ltz p1, :cond_3

    const p1, 0x7f08013e

    goto :goto_2

    :cond_3
    const p1, 0x7f08013d

    :goto_2
    sget-object v0, LA0/d;->k:LA0/h;

    sget-object v1, LA0/o;->a:LA0/o;

    sget-object v2, LG/l;->a:LG/d;

    const/16 v6, 0x30

    invoke-static {v2, v0, v5, v6}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v0

    iget-wide v6, v5, Lm0/q;->T:J

    invoke-static {v6, v7}, Ljava/lang/Long;->hashCode(J)I

    move-result v2

    invoke-virtual {v5}, Lm0/q;->m()Lm0/o0;

    move-result-object v6

    invoke-static {v1, v5}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v7

    sget-object v8, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v8, LZ0/g;->b:LZ0/f;

    invoke-virtual {v5}, Lm0/q;->j0()V

    iget-boolean v9, v5, Lm0/q;->S:Z

    if-eqz v9, :cond_4

    invoke-virtual {v5, v8}, Lm0/q;->l(LVm/a;)V

    goto :goto_3

    :cond_4
    invoke-virtual {v5}, Lm0/q;->t0()V

    :goto_3
    sget-object v8, LZ0/g;->f:LZ0/e;

    invoke-static {v8, v0, v5}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v0, LZ0/g;->e:LZ0/e;

    invoke-static {v0, v6, v5}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v2, LZ0/g;->g:LZ0/e;

    invoke-static {v5, v0, v2}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v0, LZ0/g;->h:LZ0/d;

    invoke-static {v5, v0}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v0, LZ0/g;->d:LZ0/e;

    invoke-static {v0, v7, v5}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const/4 v0, 0x6

    invoke-static {p1, v0, v5}, LIm/s;->w0(IILm0/l;)LM0/f;

    move-result-object v0

    invoke-static {v5}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object p1

    iget p1, p1, Lhh/i;->e:F

    invoke-static {v1, p1}, Landroidx/compose/foundation/layout/b;->n(LA0/r;F)LA0/r;

    move-result-object v2

    const/4 v7, 0x0

    const/4 v1, 0x0

    const/16 v6, 0x30

    invoke-static/range {v0 .. v7}, Lj0/I0;->b(LM0/f;Ljava/lang/String;LA0/r;JLm0/l;II)V

    const/4 p1, 0x0

    invoke-static {v5, p1}, LP2/z;->l(Lm0/l;I)V

    sget-object v0, Lih/h;->f:Lih/h;

    invoke-static {p0}, LIm/s;->Z(LFf/X0;)Ljava/lang/String;

    move-result-object v1

    const/4 v8, 0x0

    const/4 v10, 0x0

    const/4 v2, 0x0

    move-object v9, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v11, 0x0

    const/16 v12, 0x3f6

    invoke-virtual/range {v0 .. v12}, Lih/h;->f(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    move-object v5, v9

    const/4 p1, 0x1

    invoke-virtual {v5, p1}, Lm0/q;->q(Z)V

    :goto_4
    invoke-virtual {v5}, Lm0/q;->u()Lm0/t0;

    move-result-object p1

    if-eqz p1, :cond_5

    new-instance v0, LWf/R0;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p2, v1}, LWf/R0;-><init>(LFf/X0;II)V

    iput-object v0, p1, Lm0/t0;->d:LVm/n;

    :cond_5
    return-void
.end method

.method public static final C(LA0/r;Lm0/l;I)V
    .locals 12

    move-object v7, p1

    check-cast v7, Lm0/q;

    const p1, -0x7440fd24

    invoke-virtual {v7, p1}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v7, p0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result p1

    const/4 v0, 0x2

    if-eqz p1, :cond_0

    const/4 p1, 0x4

    goto :goto_0

    :cond_0
    move p1, v0

    :goto_0
    or-int/2addr p1, p2

    and-int/lit8 p1, p1, 0x3

    if-ne p1, v0, :cond_2

    invoke-virtual {v7}, Lm0/q;->H()Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v7}, Lm0/q;->Y()V

    goto/16 :goto_3

    :cond_2
    :goto_1
    const p1, 0x561cf882

    invoke-virtual {v7, p1}, Lm0/q;->f0(I)V

    invoke-virtual {v7}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object p1

    sget-object v0, Lm0/k;->a:Lm0/e;

    if-ne p1, v0, :cond_3

    new-instance p1, Lk1/I;

    const/16 v0, 0x11

    invoke-direct {p1, v0}, Lk1/I;-><init>(I)V

    invoke-virtual {v7, p1}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_3
    check-cast p1, LVm/k;

    const/4 v10, 0x0

    invoke-virtual {v7, v10}, Lm0/q;->q(Z)V

    invoke-static {p0, p1}, Lh1/o;->b(LA0/r;LVm/k;)LA0/r;

    move-result-object p1

    sget-object v0, LG/l;->a:LG/d;

    invoke-static {v7}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v0

    iget v0, v0, Lhh/i;->e:F

    invoke-static {v0}, LG/l;->g(F)LG/j;

    move-result-object v0

    sget-object v1, LA0/d;->k:LA0/h;

    const/16 v11, 0x30

    invoke-static {v0, v1, v7, v11}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v0

    iget-wide v1, v7, Lm0/q;->T:J

    invoke-static {v1, v2}, Ljava/lang/Long;->hashCode(J)I

    move-result v1

    invoke-virtual {v7}, Lm0/q;->m()Lm0/o0;

    move-result-object v2

    invoke-static {p1, v7}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object p1

    sget-object v3, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, LZ0/g;->b:LZ0/f;

    invoke-virtual {v7}, Lm0/q;->j0()V

    iget-boolean v4, v7, Lm0/q;->S:Z

    if-eqz v4, :cond_4

    invoke-virtual {v7, v3}, Lm0/q;->l(LVm/a;)V

    goto :goto_2

    :cond_4
    invoke-virtual {v7}, Lm0/q;->t0()V

    :goto_2
    sget-object v3, LZ0/g;->f:LZ0/e;

    invoke-static {v3, v0, v7}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v0, LZ0/g;->e:LZ0/e;

    invoke-static {v0, v2, v7}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v1, LZ0/g;->g:LZ0/e;

    invoke-static {v7, v0, v1}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v0, LZ0/g;->h:LZ0/d;

    invoke-static {v7, v0}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v0, LZ0/g;->d:LZ0/e;

    invoke-static {v0, p1, v7}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const p1, 0x7f0801a9

    invoke-static {p1, v10, v7}, LP2/i;->E(IILm0/l;)LL0/a;

    move-result-object v0

    sget-object p1, LA0/o;->a:LA0/o;

    invoke-static {v7}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v1

    iget v1, v1, Lhh/i;->n:F

    invoke-static {p1, v1}, Landroidx/compose/foundation/layout/b;->n(LA0/r;F)LA0/r;

    move-result-object v2

    sget v1, LL0/a;->$stable:I

    or-int/lit8 v8, v1, 0x30

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v1, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/16 v9, 0x78

    invoke-static/range {v0 .. v9}, Ly/x;->c(LL0/a;Ljava/lang/String;LA0/r;LA0/e;LX0/q;FLH0/p;Lm0/l;II)V

    const v0, 0x7f0801ed

    const/4 v1, 0x6

    invoke-static {v0, v1, v7}, LIm/s;->w0(IILm0/l;)LM0/f;

    move-result-object v0

    invoke-static {v7}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v1

    iget v1, v1, Lhh/i;->g:F

    invoke-static {p1, v1}, Landroidx/compose/foundation/layout/b;->n(LA0/r;F)LA0/r;

    move-result-object p1

    const/4 v1, 0x0

    invoke-static {v0, v1, p1, v7, v11}, Ly/x;->d(LM0/f;Ljava/lang/String;LA0/r;Lm0/l;I)V

    const p1, 0x7f0802a4

    invoke-static {p1, v10, v7}, LP2/i;->E(IILm0/l;)LL0/a;

    move-result-object v0

    invoke-static {v7}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object p1

    iget p1, p1, Lhh/i;->n:F

    invoke-static {p1}, LP2/r;->r(F)LA0/r;

    move-result-object v2

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v1, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/16 v9, 0x78

    invoke-static/range {v0 .. v9}, Ly/x;->c(LL0/a;Ljava/lang/String;LA0/r;LA0/e;LX0/q;FLH0/p;Lm0/l;II)V

    const/4 p1, 0x1

    invoke-virtual {v7, p1}, Lm0/q;->q(Z)V

    :goto_3
    invoke-virtual {v7}, Lm0/q;->u()Lm0/t0;

    move-result-object p1

    if-eqz p1, :cond_5

    new-instance v0, LDg/h0;

    const/16 v1, 0x12

    invoke-direct {v0, p0, p2, v1}, LDg/h0;-><init>(LA0/r;II)V

    iput-object v0, p1, Lm0/t0;->d:LVm/n;

    :cond_5
    return-void
.end method

.method public static final D(Ljava/lang/String;ZLVm/a;LVm/a;LVm/a;LA0/r;Lm0/l;II)V
    .locals 28

    move-object/from16 v1, p0

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v7, p4

    move/from16 v0, p7

    const/16 v2, 0x20

    const-string v5, "onLinkCopied"

    invoke-static {v3, v5}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "onLearnMoreClicked"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "onLearnMoreDismissed"

    invoke-static {v7, v5}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v12, p6

    check-cast v12, Lm0/q;

    const v5, 0x4c94a078    # 7.792326E7f

    invoke-virtual {v12, v5}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v5, v0, 0x6

    if-nez v5, :cond_1

    invoke-virtual {v12, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x4

    goto :goto_0

    :cond_0
    const/4 v5, 0x2

    :goto_0
    or-int/2addr v5, v0

    goto :goto_1

    :cond_1
    move v5, v0

    :goto_1
    and-int/lit8 v8, v0, 0x30

    move/from16 v14, p1

    if-nez v8, :cond_3

    invoke-virtual {v12, v14}, Lm0/q;->h(Z)Z

    move-result v8

    if-eqz v8, :cond_2

    move v8, v2

    goto :goto_2

    :cond_2
    const/16 v8, 0x10

    :goto_2
    or-int/2addr v5, v8

    :cond_3
    and-int/lit16 v8, v0, 0x180

    if-nez v8, :cond_5

    invoke-virtual {v12, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    const/16 v8, 0x100

    goto :goto_3

    :cond_4
    const/16 v8, 0x80

    :goto_3
    or-int/2addr v5, v8

    :cond_5
    and-int/lit16 v8, v0, 0xc00

    if-nez v8, :cond_7

    invoke-virtual {v12, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    const/16 v8, 0x800

    goto :goto_4

    :cond_6
    const/16 v8, 0x400

    :goto_4
    or-int/2addr v5, v8

    :cond_7
    and-int/lit16 v8, v0, 0x6000

    if-nez v8, :cond_9

    invoke-virtual {v12, v7}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_8

    const/16 v8, 0x4000

    goto :goto_5

    :cond_8
    const/16 v8, 0x2000

    :goto_5
    or-int/2addr v5, v8

    :cond_9
    and-int/lit8 v2, p8, 0x20

    if-eqz v2, :cond_a

    const/high16 v8, 0x30000

    or-int/2addr v5, v8

    move-object/from16 v8, p5

    goto :goto_7

    :cond_a
    move-object/from16 v8, p5

    invoke-virtual {v12, v8}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_b

    const/high16 v10, 0x20000

    goto :goto_6

    :cond_b
    const/high16 v10, 0x10000

    :goto_6
    or-int/2addr v5, v10

    :goto_7
    const v10, 0x12493

    and-int/2addr v10, v5

    const v11, 0x12492

    if-ne v10, v11, :cond_d

    invoke-virtual {v12}, Lm0/q;->H()Z

    move-result v10

    if-nez v10, :cond_c

    goto :goto_8

    :cond_c
    invoke-virtual {v12}, Lm0/q;->Y()V

    move-object v0, v1

    move-object v6, v8

    goto/16 :goto_12

    :cond_d
    :goto_8
    sget-object v15, LA0/o;->a:LA0/o;

    if-eqz v2, :cond_e

    move-object v2, v15

    goto :goto_9

    :cond_e
    move-object v2, v8

    :goto_9
    sget-object v8, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->b:Lm0/c1;

    invoke-virtual {v12, v8}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/content/Context;

    const v10, 0x7f121229

    invoke-static {v12, v10}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v1}, Llo/n;->q0(Ljava/lang/CharSequence;)Z

    move-result v11

    const/4 v13, 0x1

    xor-int/2addr v11, v13

    sget-object v9, Landroidx/compose/foundation/layout/b;->c:Landroidx/compose/foundation/layout/FillElement;

    invoke-interface {v2, v9}, LA0/r;->then(LA0/r;)LA0/r;

    move-result-object v9

    sget-object v16, LG/l;->a:LG/d;

    invoke-static {v12}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v6

    iget v6, v6, Lhh/i;->e:F

    invoke-static {v6}, LG/l;->g(F)LG/j;

    move-result-object v6

    sget-object v13, LA0/d;->m:LA0/g;

    const/4 v0, 0x0

    invoke-static {v6, v13, v12, v0}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v6

    iget-wide v0, v12, Lm0/q;->T:J

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result v0

    invoke-virtual {v12}, Lm0/q;->m()Lm0/o0;

    move-result-object v1

    invoke-static {v9, v12}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v9

    sget-object v13, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v13, LZ0/g;->b:LZ0/f;

    invoke-virtual {v12}, Lm0/q;->j0()V

    move/from16 v18, v0

    iget-boolean v0, v12, Lm0/q;->S:Z

    if-eqz v0, :cond_f

    invoke-virtual {v12, v13}, Lm0/q;->l(LVm/a;)V

    goto :goto_a

    :cond_f
    invoke-virtual {v12}, Lm0/q;->t0()V

    :goto_a
    sget-object v0, LZ0/g;->f:LZ0/e;

    invoke-static {v0, v6, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v6, LZ0/g;->e:LZ0/e;

    invoke-static {v6, v1, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move-object/from16 v21, v2

    sget-object v2, LZ0/g;->g:LZ0/e;

    invoke-static {v12, v1, v2}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v1, LZ0/g;->h:LZ0/d;

    invoke-static {v12, v1}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v4, LZ0/g;->d:LZ0/e;

    invoke-static {v4, v9, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const/high16 v9, 0x3f800000    # 1.0f

    move-object/from16 v18, v10

    move/from16 v19, v11

    float-to-double v10, v9

    const-wide/16 v22, 0x0

    cmpl-double v10, v10, v22

    if-lez v10, :cond_10

    goto :goto_b

    :cond_10
    const-string v10, "invalid weight; must be greater than zero"

    invoke-static {v10}, LH/a;->a(Ljava/lang/String;)V

    :goto_b
    new-instance v10, LG/x0;

    const/4 v11, 0x0

    invoke-direct {v10, v9, v11}, LG/x0;-><init>(FZ)V

    const/4 v11, 0x1

    invoke-static {v10, v9, v11}, LG/e;->m(LA0/r;FZ)LA0/r;

    move-result-object v10

    sget-object v11, LA0/d;->n:LA0/g;

    new-instance v9, LG/g0;

    invoke-direct {v9, v11}, LG/g0;-><init>(LA0/g;)V

    invoke-interface {v10, v9}, LA0/r;->then(LA0/r;)LA0/r;

    move-result-object v9

    const/4 v11, 0x0

    invoke-static {v9, v12, v11}, LIm/s;->u(LA0/r;Lm0/l;I)V

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-static {v15, v9}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v22

    invoke-static {v12}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v9

    iget v9, v9, Lhh/i;->c:F

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v23, 0x0

    const/16 v27, 0xd

    move/from16 v24, v9

    invoke-static/range {v22 .. v27}, LG/e;->L(LA0/r;FFFFI)LA0/r;

    move-result-object v9

    invoke-static {v12}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v10

    iget v10, v10, Lhh/i;->i:F

    invoke-static {v10}, LG/l;->h(F)LG/j;

    move-result-object v10

    sget-object v11, LA0/d;->j:LA0/h;

    const/4 v7, 0x0

    invoke-static {v10, v11, v12, v7}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v10

    move-object v7, v15

    iget-wide v14, v12, Lm0/q;->T:J

    invoke-static {v14, v15}, Ljava/lang/Long;->hashCode(J)I

    move-result v11

    invoke-virtual {v12}, Lm0/q;->m()Lm0/o0;

    move-result-object v14

    invoke-static {v9, v12}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v9

    invoke-virtual {v12}, Lm0/q;->j0()V

    iget-boolean v15, v12, Lm0/q;->S:Z

    if-eqz v15, :cond_11

    invoke-virtual {v12, v13}, Lm0/q;->l(LVm/a;)V

    goto :goto_c

    :cond_11
    invoke-virtual {v12}, Lm0/q;->t0()V

    :goto_c
    invoke-static {v0, v10, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v6, v14, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v11, v12, v2, v12, v1}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    invoke-static {v4, v9, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const v0, 0x7f12035c

    invoke-static {v12, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v9

    const v0, -0x44d82bce

    invoke-virtual {v12, v0}, Lm0/q;->f0(I)V

    invoke-virtual {v12, v8}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    and-int/lit8 v1, v5, 0xe

    const/4 v2, 0x4

    if-ne v1, v2, :cond_12

    const/4 v2, 0x1

    goto :goto_d

    :cond_12
    const/4 v2, 0x0

    :goto_d
    or-int/2addr v0, v2

    and-int/lit16 v2, v5, 0x380

    const/16 v4, 0x100

    if-ne v2, v4, :cond_13

    const/4 v2, 0x1

    goto :goto_e

    :cond_13
    const/4 v2, 0x0

    :goto_e
    or-int/2addr v0, v2

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v2

    sget-object v4, Lm0/k;->a:Lm0/e;

    if-nez v0, :cond_15

    if-ne v2, v4, :cond_14

    goto :goto_f

    :cond_14
    move-object/from16 v0, p0

    goto :goto_10

    :cond_15
    :goto_f
    new-instance v2, Lgf/b;

    move-object/from16 v0, p0

    invoke-direct {v2, v8, v0, v3}, Lgf/b;-><init>(Landroid/content/Context;Ljava/lang/String;LVm/a;)V

    invoke-virtual {v12, v2}, Lm0/q;->q0(Ljava/lang/Object;)V

    :goto_10
    move-object v11, v2

    check-cast v11, LVm/a;

    const/4 v2, 0x0

    invoke-virtual {v12, v2}, Lm0/q;->q(Z)V

    const/4 v13, 0x0

    move-object v2, v8

    const v8, 0x7f0801ed

    move-object v6, v2

    move-object/from16 v14, v18

    move/from16 v10, v19

    const/4 v2, 0x1

    invoke-static/range {v8 .. v13}, LIm/s;->t(ILjava/lang/String;ZLVm/a;Lm0/l;I)V

    const v8, 0x7f1203be

    invoke-static {v12, v8}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v9

    const v8, -0x44d7f2f6

    invoke-virtual {v12, v8}, Lm0/q;->f0(I)V

    invoke-virtual {v12, v6}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v8

    invoke-virtual {v12, v14}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v11

    or-int/2addr v8, v11

    const/4 v11, 0x4

    if-ne v1, v11, :cond_16

    move v13, v2

    goto :goto_11

    :cond_16
    const/4 v13, 0x0

    :goto_11
    or-int v1, v8, v13

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v8

    if-nez v1, :cond_17

    if-ne v8, v4, :cond_18

    :cond_17
    new-instance v8, LSf/O;

    const/16 v1, 0x16

    invoke-direct {v8, v6, v14, v0, v1}, LSf/O;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    invoke-virtual {v12, v8}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_18
    move-object v11, v8

    check-cast v11, LVm/a;

    const/4 v1, 0x0

    invoke-virtual {v12, v1}, Lm0/q;->q(Z)V

    const/4 v13, 0x0

    const v8, 0x7f080243

    invoke-static/range {v8 .. v13}, LIm/s;->t(ILjava/lang/String;ZLVm/a;Lm0/l;I)V

    invoke-virtual {v12, v2}, Lm0/q;->q(Z)V

    const v1, 0x7f12122b

    invoke-static {v12, v1}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v12}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v1

    iget v1, v1, Lhh/i;->g:F

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v16, 0x0

    const/16 v20, 0xd

    move/from16 v17, v1

    move-object v15, v7

    invoke-static/range {v15 .. v20}, LG/e;->L(LA0/r;FFFFI)LA0/r;

    move-result-object v8

    and-int/lit8 v1, v5, 0x70

    shr-int/lit8 v5, v5, 0x3

    and-int/lit16 v6, v5, 0x380

    or-int/2addr v1, v6

    and-int/lit16 v5, v5, 0x1c00

    or-int v10, v1, v5

    const/4 v11, 0x0

    move/from16 v5, p1

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move-object v9, v12

    invoke-static/range {v4 .. v11}, LIm/s;->E(Ljava/lang/String;ZLVm/a;LVm/a;LA0/r;Lm0/l;II)V

    invoke-virtual {v12, v2}, Lm0/q;->q(Z)V

    move-object/from16 v6, v21

    :goto_12
    invoke-virtual {v12}, Lm0/q;->u()Lm0/t0;

    move-result-object v9

    if-eqz v9, :cond_19

    new-instance v0, LBg/t;

    move-object/from16 v1, p0

    move/from16 v2, p1

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-direct/range {v0 .. v8}, LBg/t;-><init>(Ljava/lang/String;ZLVm/a;LVm/a;LVm/a;LA0/r;II)V

    iput-object v0, v9, Lm0/t0;->d:LVm/n;

    :cond_19
    return-void
.end method

.method public static final E(Ljava/lang/String;ZLVm/a;LVm/a;LA0/r;Lm0/l;II)V
    .locals 9

    const-string v0, "message"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onLearnMoreClicked"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onLearnMoreDismissed"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v0, p5

    check-cast v0, Lm0/q;

    const v1, 0x7f93c00

    invoke-virtual {v0, v1}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v1, p6, 0x6

    if-nez v1, :cond_1

    invoke-virtual {v0, p0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x4

    goto :goto_0

    :cond_0
    const/4 v1, 0x2

    :goto_0
    or-int/2addr v1, p6

    goto :goto_1

    :cond_1
    move v1, p6

    :goto_1
    and-int/lit8 v2, p6, 0x30

    if-nez v2, :cond_3

    invoke-virtual {v0, p1}, Lm0/q;->h(Z)Z

    move-result v2

    if-eqz v2, :cond_2

    const/16 v2, 0x20

    goto :goto_2

    :cond_2
    const/16 v2, 0x10

    :goto_2
    or-int/2addr v1, v2

    :cond_3
    and-int/lit16 v2, p6, 0x180

    if-nez v2, :cond_5

    invoke-virtual {v0, p2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    const/16 v2, 0x100

    goto :goto_3

    :cond_4
    const/16 v2, 0x80

    :goto_3
    or-int/2addr v1, v2

    :cond_5
    and-int/lit16 v2, p6, 0xc00

    if-nez v2, :cond_7

    invoke-virtual {v0, p3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    const/16 v2, 0x800

    goto :goto_4

    :cond_6
    const/16 v2, 0x400

    :goto_4
    or-int/2addr v1, v2

    :cond_7
    and-int/lit8 v2, p7, 0x10

    if-eqz v2, :cond_8

    or-int/lit16 v1, v1, 0x6000

    goto :goto_6

    :cond_8
    and-int/lit16 v3, p6, 0x6000

    if-nez v3, :cond_a

    invoke-virtual {v0, p4}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    const/16 v3, 0x4000

    goto :goto_5

    :cond_9
    const/16 v3, 0x2000

    :goto_5
    or-int/2addr v1, v3

    :cond_a
    :goto_6
    and-int/lit16 v3, v1, 0x2493

    const/16 v4, 0x2492

    if-ne v3, v4, :cond_c

    invoke-virtual {v0}, Lm0/q;->H()Z

    move-result v3

    if-nez v3, :cond_b

    goto :goto_8

    :cond_b
    invoke-virtual {v0}, Lm0/q;->Y()V

    :goto_7
    move-object v5, p4

    goto :goto_9

    :cond_c
    :goto_8
    if-eqz v2, :cond_d

    sget-object p4, LA0/o;->a:LA0/o;

    :cond_d
    and-int/lit8 v2, v1, 0xe

    shr-int/lit8 v3, v1, 0x3

    and-int/lit8 v4, v3, 0x70

    or-int/2addr v2, v4

    shr-int/lit8 v1, v1, 0x6

    and-int/lit16 v4, v1, 0x380

    or-int/2addr v2, v4

    invoke-static {p0, p2, p4, v0, v2}, LIm/s;->R(Ljava/lang/String;LVm/a;LA0/r;Lm0/l;I)V

    and-int/lit8 v2, v3, 0xe

    and-int/lit8 v1, v1, 0x70

    or-int/2addr v1, v2

    invoke-static {v1, p3, v0, p1}, LIm/s;->v(ILVm/a;Lm0/l;Z)V

    goto :goto_7

    :goto_9
    invoke-virtual {v0}, Lm0/q;->u()Lm0/t0;

    move-result-object p4

    if-eqz p4, :cond_e

    new-instance v0, LKf/U1;

    const/4 v8, 0x4

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move v6, p6

    move/from16 v7, p7

    invoke-direct/range {v0 .. v8}, LKf/U1;-><init>(Ljava/lang/Object;ZLVm/a;Ljava/lang/Object;LA0/r;III)V

    iput-object v0, p4, Lm0/t0;->d:LVm/n;

    :cond_e
    return-void
.end method

.method public static final F(LFf/W0;LVm/a;Lm0/l;I)V
    .locals 29

    move-object/from16 v0, p0

    move-object/from16 v10, p1

    move/from16 v15, p3

    move-object/from16 v11, p2

    check-cast v11, Lm0/q;

    const v1, -0x7665ff49

    invoke-virtual {v11, v1}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v1, v15, 0x6

    if-nez v1, :cond_1

    invoke-virtual {v11, v0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x4

    goto :goto_0

    :cond_0
    const/4 v1, 0x2

    :goto_0
    or-int/2addr v1, v15

    goto :goto_1

    :cond_1
    move v1, v15

    :goto_1
    and-int/lit8 v2, v15, 0x30

    if-nez v2, :cond_3

    invoke-virtual {v11, v10}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/16 v2, 0x20

    goto :goto_2

    :cond_2
    const/16 v2, 0x10

    :goto_2
    or-int/2addr v1, v2

    :cond_3
    and-int/lit8 v2, v1, 0x13

    const/16 v3, 0x12

    if-ne v2, v3, :cond_5

    invoke-virtual {v11}, Lm0/q;->H()Z

    move-result v2

    if-nez v2, :cond_4

    goto :goto_3

    :cond_4
    invoke-virtual {v11}, Lm0/q;->Y()V

    goto :goto_4

    :cond_5
    :goto_3
    iget-object v2, v0, LFf/W0;->b:Ljava/lang/String;

    invoke-virtual {v0}, LFf/W0;->a()I

    move-result v3

    iget v4, v0, LFf/W0;->d:I

    const/4 v5, 0x0

    invoke-static {v2, v3, v4, v11, v5}, LIm/s;->e(Ljava/lang/String;IILm0/l;I)V

    invoke-static {v11, v5}, LP2/z;->O(Lm0/l;I)V

    iget-object v2, v0, LFf/W0;->h:Ljava/util/List;

    invoke-static {v2, v11, v5}, LIm/s;->L(Ljava/util/List;Lm0/l;I)V

    const v2, -0xf7154ba

    invoke-virtual {v11, v2}, Lm0/q;->f0(I)V

    iget-object v2, v0, LFf/W0;->g:Ljava/lang/String;

    invoke-static {v2}, Llo/n;->q0(Ljava/lang/CharSequence;)Z

    move-result v3

    const/high16 v4, 0x3f800000    # 1.0f

    sget-object v6, LA0/o;->a:LA0/o;

    if-nez v3, :cond_6

    invoke-static {v11, v5}, LP2/z;->O(Lm0/l;I)V

    sget-object v16, Lih/h;->b:Lih/h;

    invoke-static {v6, v4}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v18

    const/16 v24, 0x0

    const/16 v26, 0x30

    const-wide/16 v19, 0x0

    const/16 v21, 0x3

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x3ec

    move-object/from16 v17, v2

    move-object/from16 v25, v11

    invoke-virtual/range {v16 .. v28}, Lih/h;->h(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    :cond_6
    invoke-virtual {v11, v5}, Lm0/q;->q(Z)V

    invoke-static {v11, v5}, LP2/z;->O(Lm0/l;I)V

    move v2, v1

    sget-object v1, LOg/e;->c:LOg/e;

    invoke-static {v6, v4}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v3

    const v4, 0x7f120b92

    invoke-static {v11, v4}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v4

    and-int/lit8 v13, v2, 0x70

    const/4 v9, 0x0

    const/4 v12, 0x6

    move-object v2, v3

    move-object v3, v4

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/16 v14, 0x7fa

    invoke-virtual/range {v1 .. v14}, LOg/e;->b(LA0/r;Ljava/lang/String;Ljava/lang/Integer;Lhh/n;Lhh/d;ZLhh/e;LJg/b;LVm/a;Lm0/l;III)V

    :goto_4
    invoke-virtual {v11}, Lm0/q;->u()Lm0/t0;

    move-result-object v1

    if-eqz v1, :cond_7

    new-instance v2, LAg/g;

    const/16 v3, 0x18

    invoke-direct {v2, v0, v10, v15, v3}, LAg/g;-><init>(Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object v2, v1, Lm0/t0;->d:LVm/n;

    :cond_7
    return-void
.end method

.method public static final G(LVm/a;LVm/n;LA0/o;Ljava/time/LocalDate;Ljava/time/LocalDate;ZLm0/l;I)V
    .locals 22

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v10, p3

    move-object/from16 v11, p4

    move/from16 v12, p7

    const-string v0, "onBack"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onNext"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v0, p6

    check-cast v0, Lm0/q;

    const v3, -0x35f6d079

    invoke-virtual {v0, v3}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v3, v12, 0x6

    if-nez v3, :cond_1

    invoke-virtual {v0, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x4

    goto :goto_0

    :cond_0
    const/4 v3, 0x2

    :goto_0
    or-int/2addr v3, v12

    goto :goto_1

    :cond_1
    move v3, v12

    :goto_1
    and-int/lit8 v4, v12, 0x30

    if-nez v4, :cond_3

    invoke-virtual {v0, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    const/16 v4, 0x20

    goto :goto_2

    :cond_2
    const/16 v4, 0x10

    :goto_2
    or-int/2addr v3, v4

    :cond_3
    or-int/lit16 v3, v3, 0x180

    and-int/lit16 v4, v12, 0xc00

    if-nez v4, :cond_5

    invoke-virtual {v0, v10}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const/16 v4, 0x800

    goto :goto_3

    :cond_4
    const/16 v4, 0x400

    :goto_3
    or-int/2addr v3, v4

    :cond_5
    and-int/lit16 v4, v12, 0x6000

    if-nez v4, :cond_7

    invoke-virtual {v0, v11}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    const/16 v4, 0x4000

    goto :goto_4

    :cond_6
    const/16 v4, 0x2000

    :goto_4
    or-int/2addr v3, v4

    :cond_7
    const/high16 v4, 0x30000

    and-int/2addr v4, v12

    move/from16 v6, p5

    if-nez v4, :cond_9

    invoke-virtual {v0, v6}, Lm0/q;->h(Z)Z

    move-result v4

    if-eqz v4, :cond_8

    const/high16 v4, 0x20000

    goto :goto_5

    :cond_8
    const/high16 v4, 0x10000

    :goto_5
    or-int/2addr v3, v4

    :cond_9
    move v8, v3

    const v3, 0x12493

    and-int/2addr v3, v8

    const v4, 0x12492

    if-ne v3, v4, :cond_b

    invoke-virtual {v0}, Lm0/q;->H()Z

    move-result v3

    if-nez v3, :cond_a

    goto :goto_6

    :cond_a
    invoke-virtual {v0}, Lm0/q;->Y()V

    move-object/from16 v3, p2

    move-object v7, v0

    goto/16 :goto_a

    :cond_b
    :goto_6
    sget-object v9, LA0/o;->a:LA0/o;

    const v3, 0x7d966838

    invoke-virtual {v0, v3}, Lm0/q;->f0(I)V

    invoke-virtual {v0}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v3

    sget-object v4, Lm0/k;->a:Lm0/e;

    if-ne v3, v4, :cond_c

    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object v3

    invoke-virtual {v0, v3}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_c
    check-cast v3, Ljava/time/LocalDate;

    const/4 v5, 0x0

    const v7, 0x7d966e67

    invoke-static {v7, v0, v5}, Lcom/eightsleep/data_bioage/data/model/a;->f(ILm0/q;Z)Ljava/lang/Object;

    move-result-object v7

    if-ne v7, v4, :cond_d

    invoke-static {v10}, Lm0/r;->C(Ljava/lang/Object;)Lm0/i0;

    move-result-object v7

    invoke-virtual {v0, v7}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_d
    check-cast v7, Lm0/Z;

    const v13, 0x7d967647    # 2.4999791E37f

    invoke-static {v13, v0, v5}, Lcom/eightsleep/data_bioage/data/model/a;->f(ILm0/q;Z)Ljava/lang/Object;

    move-result-object v13

    if-ne v13, v4, :cond_e

    invoke-static {v11}, Lm0/r;->C(Ljava/lang/Object;)Lm0/i0;

    move-result-object v13

    invoke-virtual {v0, v13}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_e
    check-cast v13, Lm0/Z;

    const v14, 0x7d967f4e

    invoke-static {v14, v0, v5}, Lcom/eightsleep/data_bioage/data/model/a;->f(ILm0/q;Z)Ljava/lang/Object;

    move-result-object v14

    if-ne v14, v4, :cond_f

    sget-object v14, Lhg/h;->NONE:Lhg/h;

    invoke-static {v14}, Lm0/r;->C(Ljava/lang/Object;)Lm0/i0;

    move-result-object v14

    invoke-virtual {v0, v14}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_f
    move-object/from16 v18, v14

    check-cast v18, Lm0/Z;

    const v14, 0x7d968840

    invoke-static {v14, v0, v5}, Lcom/eightsleep/data_bioage/data/model/a;->f(ILm0/q;Z)Ljava/lang/Object;

    move-result-object v14

    if-ne v14, v4, :cond_11

    if-nez v10, :cond_10

    move-object v14, v3

    goto :goto_7

    :cond_10
    move-object v14, v10

    :goto_7
    invoke-static {v14}, Ljava/time/YearMonth;->from(Ljava/time/temporal/TemporalAccessor;)Ljava/time/YearMonth;

    move-result-object v14

    invoke-static {v14}, Lm0/r;->C(Ljava/lang/Object;)Lm0/i0;

    move-result-object v14

    invoke-virtual {v0, v14}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_11
    move-object/from16 v17, v14

    check-cast v17, Lm0/Z;

    const v14, 0x7d969421

    invoke-static {v14, v0, v5}, Lcom/eightsleep/data_bioage/data/model/a;->f(ILm0/q;Z)Ljava/lang/Object;

    move-result-object v14

    if-ne v14, v4, :cond_15

    if-nez v11, :cond_13

    if-eqz v10, :cond_12

    const-wide/16 v14, 0x118

    invoke-virtual {v10, v14, v15}, Ljava/time/LocalDate;->plusDays(J)Ljava/time/LocalDate;

    move-result-object v14

    goto :goto_8

    :cond_12
    const/4 v14, 0x0

    :goto_8
    if-nez v14, :cond_14

    move-object v14, v3

    goto :goto_9

    :cond_13
    move-object v14, v11

    :cond_14
    :goto_9
    invoke-static {v14}, Ljava/time/YearMonth;->from(Ljava/time/temporal/TemporalAccessor;)Ljava/time/YearMonth;

    move-result-object v14

    invoke-static {v14}, Lm0/r;->C(Ljava/lang/Object;)Lm0/i0;

    move-result-object v14

    invoke-virtual {v0, v14}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_15
    move-object/from16 v20, v14

    check-cast v20, Lm0/Z;

    const v14, 0x7d96b826

    invoke-static {v14, v0, v5}, Lcom/eightsleep/data_bioage/data/model/a;->f(ILm0/q;Z)Ljava/lang/Object;

    move-result-object v14

    if-ne v14, v4, :cond_16

    new-instance v14, LXe/p1;

    const/16 v15, 0x11

    invoke-direct {v14, v7, v13, v15}, LXe/p1;-><init>(Lm0/Z;Lm0/Z;I)V

    invoke-static {v14}, Lm0/r;->s(LVm/a;)Lm0/E;

    move-result-object v14

    invoke-virtual {v0, v14}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_16
    check-cast v14, Lm0/b1;

    invoke-virtual {v0, v5}, Lm0/q;->q(Z)V

    const v15, 0x7d96cf9e

    invoke-virtual {v0, v15}, Lm0/q;->f0(I)V

    invoke-virtual {v0, v3}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v15

    invoke-virtual {v0}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v5

    if-nez v15, :cond_17

    if-ne v5, v4, :cond_18

    :cond_17
    const-wide/16 v1, 0x9

    invoke-virtual {v3, v1, v2}, Ljava/time/LocalDate;->minusMonths(J)Ljava/time/LocalDate;

    move-result-object v1

    invoke-static {v1, v3}, LP2/H;->Z(Ljava/lang/Comparable;Ljava/lang/Comparable;)Lan/h;

    move-result-object v5

    invoke-virtual {v0, v5}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_18
    move-object v1, v5

    check-cast v1, Lan/g;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lm0/q;->q(Z)V

    invoke-interface {v7}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/time/LocalDate;

    const v5, 0x7d96db0a

    invoke-virtual {v0, v5}, Lm0/q;->f0(I)V

    invoke-virtual {v0, v2}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v0, v3}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v5

    or-int/2addr v2, v5

    invoke-virtual {v0}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v5

    if-nez v2, :cond_19

    if-ne v5, v4, :cond_1c

    :cond_19
    invoke-interface {v7}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/time/LocalDate;

    if-eqz v2, :cond_1a

    const-wide/16 v4, 0x1

    invoke-virtual {v2, v4, v5}, Ljava/time/LocalDate;->plusDays(J)Ljava/time/LocalDate;

    move-result-object v2

    if-nez v2, :cond_1b

    :cond_1a
    move-object v2, v3

    :cond_1b
    invoke-virtual {v3}, Ljava/time/LocalDate;->getYear()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    const/16 v4, 0xc

    const/16 v5, 0x1f

    invoke-static {v3, v4, v5}, Ljava/time/LocalDate;->of(III)Ljava/time/LocalDate;

    move-result-object v3

    const-string v4, "of(...)"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v2, v3}, LP2/H;->Z(Ljava/lang/Comparable;Ljava/lang/Comparable;)Lan/h;

    move-result-object v5

    invoke-virtual {v0, v5}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_1c
    move-object v15, v5

    check-cast v15, Lan/g;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lm0/q;->q(Z)V

    sget-object v2, LH8/L;->h:LH8/L;

    invoke-virtual {v2}, Ld8/j;->invoke()Landroid/net/Uri;

    move-result-object v21

    move-object v5, v14

    move-object v14, v1

    sget-object v1, Ldg/p;->BACK:Ldg/p;

    new-instance v2, LSi/k;

    move-object/from16 v4, p1

    move v3, v6

    move-object v6, v7

    move-object v7, v13

    invoke-direct/range {v2 .. v7}, LSi/k;-><init>(ZLVm/n;Lm0/b1;Lm0/Z;Lm0/Z;)V

    move-object/from16 v16, v6

    move-object/from16 v19, v7

    const v3, -0x50e39ca5

    invoke-static {v3, v2, v0}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v3

    new-instance v13, LBg/q;

    invoke-direct/range {v13 .. v20}, LBg/q;-><init>(Lan/g;Lan/g;Lm0/Z;Lm0/Z;Lm0/Z;Lm0/Z;Lm0/Z;)V

    const v2, 0x7f2ce85e

    invoke-static {v2, v13, v0}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v6

    shl-int/lit8 v2, v8, 0x6

    and-int/lit16 v4, v2, 0x380

    const v5, 0x180c30

    or-int/2addr v4, v5

    const v5, 0xe000

    and-int/2addr v2, v5

    or-int v8, v4, v2

    move-object v4, v9

    const/16 v9, 0x20

    const/4 v5, 0x0

    move-object/from16 v2, p0

    move-object v7, v0

    move-object/from16 v0, v21

    invoke-static/range {v0 .. v9}, LP2/B;->o(Landroid/net/Uri;Ldg/p;LVm/a;Lu0/d;LA0/r;ZLu0/d;Lm0/l;II)V

    move-object v3, v4

    :goto_a
    invoke-virtual {v7}, Lm0/q;->u()Lm0/t0;

    move-result-object v9

    if-eqz v9, :cond_1d

    new-instance v0, LAh/a0;

    const/16 v8, 0x8

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v6, p5

    move-object v4, v10

    move-object v5, v11

    move v7, v12

    invoke-direct/range {v0 .. v8}, LAh/a0;-><init>(Ljava/lang/Object;LHm/e;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZII)V

    iput-object v0, v9, Lm0/t0;->d:LVm/n;

    :cond_1d
    return-void
.end method

.method public static final H(ILA0/r;Lm0/l;Z)V
    .locals 5

    check-cast p2, Lm0/q;

    const v0, -0x4df6617d

    invoke-virtual {p2, v0}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {p2, p3}, Lm0/q;->h(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int/2addr v0, p0

    invoke-virtual {p2, p1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x20

    goto :goto_1

    :cond_1
    const/16 v1, 0x10

    :goto_1
    or-int/2addr v0, v1

    and-int/lit8 v0, v0, 0x13

    const/16 v1, 0x12

    if-ne v0, v1, :cond_3

    invoke-virtual {p2}, Lm0/q;->H()Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {p2}, Lm0/q;->Y()V

    goto :goto_4

    :cond_3
    :goto_2
    invoke-static {p2}, Lhh/j;->c(Lm0/l;)Lme/u;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lme/u;->c:Lme/t;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lme/t;->b:Lme/m;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lme/m;->a()J

    move-result-wide v0

    sget-wide v2, LH0/w;->d:J

    const v4, 0x3da3d70a    # 0.08f

    invoke-static {v2, v3, v4}, LH0/w;->b(JF)J

    move-result-wide v2

    sget-object v4, LO/e;->a:LO/d;

    invoke-static {p1, v4}, LE0/i;->c(LA0/r;LH0/X;)LA0/r;

    move-result-object v4

    if-eqz p3, :cond_4

    goto :goto_3

    :cond_4
    move-wide v0, v2

    :goto_3
    sget-object v2, LH0/F;->b:LH0/S;

    invoke-static {v4, v0, v1, v2}, Ly/x;->g(LA0/r;JLH0/X;)LA0/r;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p2, v1}, LG/t;->a(LA0/r;Lm0/l;I)V

    :goto_4
    invoke-virtual {p2}, Lm0/q;->u()Lm0/t0;

    move-result-object p2

    if-eqz p2, :cond_5

    new-instance v0, LP/M;

    const/4 v1, 0x2

    invoke-direct {v0, p3, p1, p0, v1}, LP/M;-><init>(ZLjava/lang/Object;II)V

    iput-object v0, p2, Lm0/t0;->d:LVm/n;

    :cond_5
    return-void
.end method

.method public static final I(Ljava/lang/String;IILm0/l;I)V
    .locals 24

    move/from16 v2, p1

    move/from16 v3, p2

    move-object/from16 v13, p3

    check-cast v13, Lm0/q;

    const v0, -0x2b3c9b4

    invoke-virtual {v13, v0}, Lm0/q;->h0(I)Lm0/q;

    move-object/from16 v1, p0

    invoke-virtual {v13, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    const/4 v4, 0x4

    if-eqz v0, :cond_0

    move v0, v4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int v0, p4, v0

    invoke-virtual {v13, v2}, Lm0/q;->e(I)Z

    move-result v5

    if-eqz v5, :cond_1

    const/16 v5, 0x20

    goto :goto_1

    :cond_1
    const/16 v5, 0x10

    :goto_1
    or-int/2addr v0, v5

    invoke-virtual {v13, v3}, Lm0/q;->e(I)Z

    move-result v5

    if-eqz v5, :cond_2

    const/16 v5, 0x100

    goto :goto_2

    :cond_2
    const/16 v5, 0x80

    :goto_2
    or-int/2addr v0, v5

    and-int/lit16 v5, v0, 0x93

    const/16 v6, 0x92

    if-ne v5, v6, :cond_4

    invoke-virtual {v13}, Lm0/q;->H()Z

    move-result v5

    if-nez v5, :cond_3

    goto :goto_3

    :cond_3
    invoke-virtual {v13}, Lm0/q;->Y()V

    goto/16 :goto_d

    :cond_4
    :goto_3
    sget-object v5, LA0/d;->k:LA0/h;

    sget-object v6, LA0/o;->a:LA0/o;

    sget-object v7, LG/l;->a:LG/d;

    const/16 v8, 0x30

    invoke-static {v7, v5, v13, v8}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v5

    iget-wide v9, v13, Lm0/q;->T:J

    invoke-static {v9, v10}, Ljava/lang/Long;->hashCode(J)I

    move-result v7

    invoke-virtual {v13}, Lm0/q;->m()Lm0/o0;

    move-result-object v9

    invoke-static {v6, v13}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v10

    sget-object v11, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v11, LZ0/g;->b:LZ0/f;

    invoke-virtual {v13}, Lm0/q;->j0()V

    iget-boolean v12, v13, Lm0/q;->S:Z

    if-eqz v12, :cond_5

    invoke-virtual {v13, v11}, Lm0/q;->l(LVm/a;)V

    goto :goto_4

    :cond_5
    invoke-virtual {v13}, Lm0/q;->t0()V

    :goto_4
    sget-object v12, LZ0/g;->f:LZ0/e;

    invoke-static {v12, v5, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v5, LZ0/g;->e:LZ0/e;

    invoke-static {v5, v9, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    sget-object v9, LZ0/g;->g:LZ0/e;

    invoke-static {v13, v7, v9}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v7, LZ0/g;->h:LZ0/d;

    invoke-static {v13, v7}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v14, LZ0/g;->d:LZ0/e;

    invoke-static {v14, v10, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move v10, v4

    sget-object v4, Lih/h;->e:Lih/h;

    const/16 v15, 0x8c

    int-to-float v15, v15

    invoke-static {v6, v15}, Landroidx/compose/foundation/layout/b;->s(LA0/r;F)LA0/r;

    move-result-object v6

    and-int/lit8 v0, v0, 0xe

    or-int/2addr v0, v8

    move-object v8, v11

    const/4 v11, 0x0

    move-object v15, v12

    const/4 v12, 0x0

    move-object/from16 v17, v7

    move-object/from16 v16, v8

    const-wide/16 v7, 0x0

    move-object/from16 v18, v9

    const/4 v9, 0x0

    move/from16 v19, v10

    const/4 v10, 0x0

    move-object/from16 v20, v15

    const/4 v15, 0x0

    move-object/from16 v21, v16

    const/16 v16, 0x3fc

    move-object v2, v5

    move-object/from16 v23, v14

    move-object/from16 v22, v17

    move-object/from16 v3, v18

    move v14, v0

    move-object v5, v1

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual/range {v4 .. v16}, Lih/h;->h(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    const/4 v4, 0x0

    invoke-static {v13, v4}, LP2/z;->k(Lm0/l;I)V

    const/high16 v5, 0x3f800000    # 1.0f

    float-to-double v6, v5

    const-wide/16 v8, 0x0

    cmpl-double v6, v6, v8

    const-string v7, "invalid weight; must be greater than zero"

    if-lez v6, :cond_6

    goto :goto_5

    :cond_6
    invoke-static {v7}, LH/a;->a(Ljava/lang/String;)V

    :goto_5
    new-instance v6, LG/x0;

    const v10, 0x7f7fffff    # Float.MAX_VALUE

    cmpl-float v11, v5, v10

    if-lez v11, :cond_7

    move v11, v10

    goto :goto_6

    :cond_7
    move v11, v5

    :goto_6
    const/4 v12, 0x1

    invoke-direct {v6, v11, v12}, LG/x0;-><init>(FZ)V

    invoke-static {v13}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v11

    iget v11, v11, Lhh/i;->c:F

    invoke-static {v11}, LG/l;->g(F)LG/j;

    move-result-object v11

    sget-object v14, LA0/d;->j:LA0/h;

    invoke-static {v11, v14, v13, v4}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v11

    iget-wide v14, v13, Lm0/q;->T:J

    invoke-static {v14, v15}, Ljava/lang/Long;->hashCode(J)I

    move-result v14

    invoke-virtual {v13}, Lm0/q;->m()Lm0/o0;

    move-result-object v15

    invoke-static {v6, v13}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v6

    invoke-virtual {v13}, Lm0/q;->j0()V

    move-wide/from16 v16, v8

    iget-boolean v8, v13, Lm0/q;->S:Z

    if-eqz v8, :cond_8

    invoke-virtual {v13, v1}, Lm0/q;->l(LVm/a;)V

    goto :goto_7

    :cond_8
    invoke-virtual {v13}, Lm0/q;->t0()V

    :goto_7
    invoke-static {v0, v11, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v2, v15, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object/from16 v0, v22

    invoke-static {v14, v13, v3, v13, v0}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    move-object/from16 v0, v23

    invoke-static {v0, v6, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const v0, 0x22920562

    invoke-virtual {v13, v0}, Lm0/q;->f0(I)V

    move/from16 v3, p2

    if-ge v3, v12, :cond_9

    move v0, v12

    goto :goto_8

    :cond_9
    move v0, v3

    :goto_8
    move v1, v4

    :goto_9
    if-ge v1, v0, :cond_d

    move/from16 v2, p1

    if-ge v1, v2, :cond_a

    move v6, v12

    goto :goto_a

    :cond_a
    move v6, v4

    :goto_a
    float-to-double v8, v5

    cmpl-double v8, v8, v16

    if-lez v8, :cond_b

    goto :goto_b

    :cond_b
    invoke-static {v7}, LH/a;->a(Ljava/lang/String;)V

    :goto_b
    new-instance v8, LG/x0;

    cmpl-float v9, v5, v10

    if-lez v9, :cond_c

    move v9, v10

    goto :goto_c

    :cond_c
    move v9, v5

    :goto_c
    invoke-direct {v8, v9, v12}, LG/x0;-><init>(FZ)V

    const/4 v9, 0x4

    int-to-float v11, v9

    invoke-static {v8, v11}, Landroidx/compose/foundation/layout/b;->e(LA0/r;F)LA0/r;

    move-result-object v8

    invoke-static {v4, v8, v13, v6}, LIm/s;->H(ILA0/r;Lm0/l;Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    :cond_d
    move/from16 v2, p1

    invoke-static {v13, v4, v12, v12}, Ly2/K;->d(Lm0/q;ZZZ)V

    :goto_d
    invoke-virtual {v13}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_e

    new-instance v0, LWf/z0;

    const/4 v5, 0x2

    move-object/from16 v1, p0

    move/from16 v4, p4

    invoke-direct/range {v0 .. v5}, LWf/z0;-><init>(Ljava/lang/String;IIII)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_e
    return-void
.end method

.method public static final J(LA0/r;Lcom/eightsleep/presentation_metrics/enums/SleepBalanceState;Lm0/l;I)V
    .locals 17

    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v9, p2

    check-cast v9, Lm0/q;

    const v2, 0x2e29e741

    invoke-virtual {v9, v2}, Lm0/q;->h0(I)Lm0/q;

    or-int/lit8 v2, v1, 0x6

    invoke-virtual {v9, v0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/16 v3, 0x20

    goto :goto_0

    :cond_0
    const/16 v3, 0x10

    :goto_0
    or-int/2addr v2, v3

    and-int/lit8 v2, v2, 0x13

    const/16 v3, 0x12

    if-ne v2, v3, :cond_2

    invoke-virtual {v9}, Lm0/q;->H()Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v9}, Lm0/q;->Y()V

    move-object/from16 v12, p0

    goto/16 :goto_6

    :cond_2
    :goto_1
    sget-object v12, LA0/o;->a:LA0/o;

    sget-object v2, LA0/d;->k:LA0/h;

    sget-object v3, LG/l;->a:LG/d;

    const/16 v4, 0x30

    invoke-static {v3, v2, v9, v4}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v2

    iget-wide v3, v9, Lm0/q;->T:J

    invoke-static {v3, v4}, Ljava/lang/Long;->hashCode(J)I

    move-result v3

    invoke-virtual {v9}, Lm0/q;->m()Lm0/o0;

    move-result-object v4

    invoke-static {v12, v9}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v5

    sget-object v6, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v6, LZ0/g;->b:LZ0/f;

    invoke-virtual {v9}, Lm0/q;->j0()V

    iget-boolean v7, v9, Lm0/q;->S:Z

    if-eqz v7, :cond_3

    invoke-virtual {v9, v6}, Lm0/q;->l(LVm/a;)V

    goto :goto_2

    :cond_3
    invoke-virtual {v9}, Lm0/q;->t0()V

    :goto_2
    sget-object v6, LZ0/g;->f:LZ0/e;

    invoke-static {v6, v2, v9}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v2, LZ0/g;->e:LZ0/e;

    invoke-static {v2, v4, v9}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sget-object v3, LZ0/g;->g:LZ0/e;

    invoke-static {v9, v2, v3}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v2, LZ0/g;->h:LZ0/d;

    invoke-static {v9, v2}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v2, LZ0/g;->d:LZ0/e;

    invoke-static {v2, v5, v9}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v2, Lg8/h0;->a:Lg8/h0;

    sget-object v13, LDg/V;->a:[I

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    aget v3, v13, v3

    const/4 v14, 0x2

    const/4 v15, 0x3

    const/4 v4, 0x1

    if-eq v3, v4, :cond_6

    if-eq v3, v14, :cond_5

    if-ne v3, v15, :cond_4

    const v3, 0x7f1215af

    goto :goto_3

    :cond_4
    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    :cond_5
    const v3, 0x7f1215ab

    goto :goto_3

    :cond_6
    const v3, 0x7f1215ac

    :goto_3
    invoke-static {v9, v3}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v9}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v3

    iget-object v3, v3, Lhh/h;->k:Lhh/v;

    iget-wide v5, v3, Lhh/v;->c:J

    new-instance v3, LH0/w;

    invoke-direct {v3, v5, v6}, LH0/w;-><init>(J)V

    const/4 v10, 0x0

    const/4 v8, 0x0

    const/4 v5, 0x0

    const/4 v11, 0x0

    move-object v6, v3

    const/4 v3, 0x0

    move/from16 v16, v4

    const/16 v4, 0x7c

    move/from16 v15, v16

    invoke-virtual/range {v2 .. v11}, Lg8/h0;->c(IILA0/r;LH0/w;Ljava/lang/String;Lk1/U;Lm0/l;Lv1/k;Z)V

    const/4 v2, 0x0

    invoke-static {v9, v2}, LP2/z;->l(Lm0/l;I)V

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    aget v3, v13, v3

    if-eq v3, v15, :cond_9

    if-eq v3, v14, :cond_8

    const/4 v4, 0x3

    if-ne v3, v4, :cond_7

    goto :goto_4

    :cond_7
    const v0, -0x434adf09

    invoke-static {v0, v9, v2}, Lj/m;->t(ILm0/q;Z)Lkotlin/NoWhenBranchMatchedException;

    move-result-object v0

    throw v0

    :cond_8
    const v3, -0x434abf08

    invoke-virtual {v9, v3}, Lm0/q;->f0(I)V

    invoke-static {v9}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v3

    iget-object v3, v3, Lhh/h;->g:Lhh/o;

    iget-wide v3, v3, Lhh/o;->e:J

    invoke-virtual {v9, v2}, Lm0/q;->q(Z)V

    goto :goto_5

    :cond_9
    :goto_4
    const v3, -0x434ac9c7

    invoke-virtual {v9, v3}, Lm0/q;->f0(I)V

    invoke-static {v9}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v3

    iget-object v3, v3, Lhh/h;->g:Lhh/o;

    iget-wide v3, v3, Lhh/o;->a:J

    invoke-virtual {v9, v2}, Lm0/q;->q(Z)V

    :goto_5
    sget-object v5, LO/e;->a:LO/d;

    invoke-static {v12, v3, v4, v5}, Ly/x;->g(LA0/r;JLH0/X;)LA0/r;

    move-result-object v3

    const/4 v4, 0x4

    int-to-float v4, v4

    invoke-static {v3, v4}, Landroidx/compose/foundation/layout/b;->n(LA0/r;F)LA0/r;

    move-result-object v3

    invoke-static {v3, v9, v2}, LG/t;->a(LA0/r;Lm0/l;I)V

    invoke-virtual {v9, v15}, Lm0/q;->q(Z)V

    :goto_6
    invoke-virtual {v9}, Lm0/q;->u()Lm0/t0;

    move-result-object v2

    if-eqz v2, :cond_a

    new-instance v3, LAe/p;

    const/16 v4, 0xc

    invoke-direct {v3, v12, v0, v1, v4}, LAe/p;-><init>(Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object v3, v2, Lm0/t0;->d:LVm/n;

    :cond_a
    return-void
.end method

.method public static final K(LA0/r;Ljava/lang/String;Lcom/eightsleep/presentation_metrics/enums/SleepBalanceState;Lm0/l;II)V
    .locals 14

    move-object/from16 v10, p2

    move/from16 v11, p4

    const-string v0, "value"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v7, p3

    check-cast v7, Lm0/q;

    const v0, 0x778f0517

    invoke-virtual {v7, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, p5, 0x1

    if-eqz v0, :cond_0

    or-int/lit8 v1, v11, 0x6

    move v3, v1

    goto :goto_1

    :cond_0
    and-int/lit8 v1, v11, 0x6

    if-nez v1, :cond_2

    invoke-virtual {v7, p0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v3, 0x4

    goto :goto_0

    :cond_1
    const/4 v3, 0x2

    :goto_0
    or-int/2addr v3, v11

    goto :goto_1

    :cond_2
    move v3, v11

    :goto_1
    and-int/lit8 v4, v11, 0x30

    if-nez v4, :cond_4

    invoke-virtual {v7, p1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    const/16 v4, 0x20

    goto :goto_2

    :cond_3
    const/16 v4, 0x10

    :goto_2
    or-int/2addr v3, v4

    :cond_4
    and-int/lit16 v4, v11, 0x180

    if-nez v4, :cond_6

    invoke-virtual {v7, v10}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    const/16 v4, 0x100

    goto :goto_3

    :cond_5
    const/16 v4, 0x80

    :goto_3
    or-int/2addr v3, v4

    :cond_6
    and-int/lit16 v4, v3, 0x93

    const/16 v5, 0x92

    if-ne v4, v5, :cond_8

    invoke-virtual {v7}, Lm0/q;->H()Z

    move-result v4

    if-nez v4, :cond_7

    goto :goto_4

    :cond_7
    invoke-virtual {v7}, Lm0/q;->Y()V

    move-object v1, p0

    goto/16 :goto_8

    :cond_8
    :goto_4
    if-eqz v0, :cond_9

    sget-object v0, LA0/o;->a:LA0/o;

    move-object v12, v0

    goto :goto_5

    :cond_9
    move-object v12, p0

    :goto_5
    sget-object v0, LG/l;->c:LG/f;

    sget-object v1, LA0/d;->m:LA0/g;

    const/4 v13, 0x0

    invoke-static {v0, v1, v7, v13}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v0

    iget-wide v4, v7, Lm0/q;->T:J

    invoke-static {v4, v5}, Ljava/lang/Long;->hashCode(J)I

    move-result v1

    invoke-virtual {v7}, Lm0/q;->m()Lm0/o0;

    move-result-object v4

    invoke-static {v12, v7}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v5

    sget-object v6, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v6, LZ0/g;->b:LZ0/f;

    invoke-virtual {v7}, Lm0/q;->j0()V

    iget-boolean v8, v7, Lm0/q;->S:Z

    if-eqz v8, :cond_a

    invoke-virtual {v7, v6}, Lm0/q;->l(LVm/a;)V

    goto :goto_6

    :cond_a
    invoke-virtual {v7}, Lm0/q;->t0()V

    :goto_6
    sget-object v6, LZ0/g;->f:LZ0/e;

    invoke-static {v6, v0, v7}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v0, LZ0/g;->e:LZ0/e;

    invoke-static {v0, v4, v7}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v1, LZ0/g;->g:LZ0/e;

    invoke-static {v7, v0, v1}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v0, LZ0/g;->h:LZ0/d;

    invoke-static {v7, v0}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v0, LZ0/g;->d:LZ0/e;

    invoke-static {v0, v5, v7}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v0, Lg8/h0;->a:Lg8/h0;

    shr-int/lit8 v1, v3, 0x3

    and-int/lit8 v1, v1, 0xe

    const/4 v8, 0x0

    const/4 v6, 0x0

    const/4 v4, 0x0

    const/4 v3, 0x0

    const/4 v9, 0x0

    const/16 v2, 0x7e

    move-object v5, p1

    invoke-virtual/range {v0 .. v9}, Lg8/h0;->p(IILA0/r;LH0/w;Ljava/lang/String;Lk1/U;Lm0/l;Lv1/k;Z)V

    const v0, -0x60a890c4

    invoke-virtual {v7, v0}, Lm0/q;->f0(I)V

    if-nez v10, :cond_b

    goto :goto_7

    :cond_b
    invoke-static {v7, v13}, LP2/z;->S(Lm0/l;I)V

    const/4 v0, 0x0

    invoke-static {v0, v10, v7, v13}, LIm/s;->J(LA0/r;Lcom/eightsleep/presentation_metrics/enums/SleepBalanceState;Lm0/l;I)V

    :goto_7
    invoke-virtual {v7, v13}, Lm0/q;->q(Z)V

    const/4 v0, 0x1

    invoke-virtual {v7, v0}, Lm0/q;->q(Z)V

    move-object v1, v12

    :goto_8
    invoke-virtual {v7}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_c

    new-instance v0, LBg/o0;

    const/4 v6, 0x1

    move-object v2, p1

    move/from16 v5, p5

    move-object v3, v10

    move v4, v11

    invoke-direct/range {v0 .. v6}, LBg/o0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;III)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_c
    return-void
.end method

.method public static final L(Ljava/util/List;Lm0/l;I)V
    .locals 24

    move-object/from16 v0, p0

    move/from16 v1, p2

    const/4 v2, 0x3

    move-object/from16 v13, p1

    check-cast v13, Lm0/q;

    const v4, -0x7301b535

    invoke-virtual {v13, v4}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v13, v0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    const/4 v5, 0x2

    if-eqz v4, :cond_0

    const/4 v4, 0x4

    goto :goto_0

    :cond_0
    move v4, v5

    :goto_0
    or-int/2addr v4, v1

    and-int/2addr v4, v2

    if-ne v4, v5, :cond_2

    invoke-virtual {v13}, Lm0/q;->H()Z

    move-result v4

    if-nez v4, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v13}, Lm0/q;->Y()V

    goto/16 :goto_7

    :cond_2
    :goto_1
    sget-object v4, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->b:Lm0/c1;

    invoke-virtual {v13, v4}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/Context;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_3
    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    move-object v8, v7

    check-cast v8, LFf/X0;

    iget-boolean v8, v8, LFf/X0;->e:Z

    if-eqz v8, :cond_3

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_4
    invoke-static {v2, v5}, LIm/r;->M1(ILjava/util/Collection;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-static {v2, v0}, LIm/r;->M1(ILjava/util/Collection;)Ljava/util/List;

    move-result-object v5

    :cond_5
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-virtual {v13}, Lm0/q;->u()Lm0/t0;

    move-result-object v3

    if-eqz v3, :cond_b

    new-instance v4, LFg/g;

    invoke-direct {v4, v1, v2, v0}, LFg/g;-><init>(IILjava/util/List;)V

    iput-object v4, v3, Lm0/t0;->d:LVm/n;

    return-void

    :cond_6
    sget-object v2, LA0/o;->a:LA0/o;

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-static {v2, v6}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v2

    sget-object v7, LG/l;->a:LG/d;

    invoke-static {v13}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v7

    iget v7, v7, Lhh/i;->e:F

    invoke-static {v7}, LG/l;->g(F)LG/j;

    move-result-object v7

    sget-object v8, LA0/d;->j:LA0/h;

    const/4 v9, 0x0

    invoke-static {v7, v8, v13, v9}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v7

    iget-wide v10, v13, Lm0/q;->T:J

    invoke-static {v10, v11}, Ljava/lang/Long;->hashCode(J)I

    move-result v8

    invoke-virtual {v13}, Lm0/q;->m()Lm0/o0;

    move-result-object v10

    invoke-static {v2, v13}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v2

    sget-object v11, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v11, LZ0/g;->b:LZ0/f;

    invoke-virtual {v13}, Lm0/q;->j0()V

    iget-boolean v12, v13, Lm0/q;->S:Z

    if-eqz v12, :cond_7

    invoke-virtual {v13, v11}, Lm0/q;->l(LVm/a;)V

    goto :goto_3

    :cond_7
    invoke-virtual {v13}, Lm0/q;->t0()V

    :goto_3
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

    const v8, -0x7efd4cee

    invoke-static {v13, v2, v7, v8, v5}, Lcom/eightsleep/data_bioage/data/model/a;->p(Lm0/q;LA0/r;LZ0/e;ILjava/util/List;)Ljava/util/Iterator;

    move-result-object v2

    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/4 v7, 0x1

    if-eqz v5, :cond_a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, LFf/X0;

    float-to-double v10, v6

    const-wide/16 v14, 0x0

    cmpl-double v8, v10, v14

    if-lez v8, :cond_8

    goto :goto_5

    :cond_8
    const-string v8, "invalid weight; must be greater than zero"

    invoke-static {v8}, LH/a;->a(Ljava/lang/String;)V

    :goto_5
    new-instance v8, LG/x0;

    invoke-direct {v8, v6, v7}, LG/x0;-><init>(FZ)V

    sget-object v10, LA0/d;->n:LA0/g;

    sget-object v11, LG/l;->a:LG/d;

    invoke-static {v13}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v11

    iget v11, v11, Lhh/i;->c:F

    invoke-static {v11}, LG/l;->g(F)LG/j;

    move-result-object v11

    const/16 v12, 0x30

    invoke-static {v11, v10, v13, v12}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v10

    iget-wide v11, v13, Lm0/q;->T:J

    invoke-static {v11, v12}, Ljava/lang/Long;->hashCode(J)I

    move-result v11

    invoke-virtual {v13}, Lm0/q;->m()Lm0/o0;

    move-result-object v12

    invoke-static {v8, v13}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v8

    sget-object v14, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v14, LZ0/g;->b:LZ0/f;

    invoke-virtual {v13}, Lm0/q;->j0()V

    iget-boolean v15, v13, Lm0/q;->S:Z

    if-eqz v15, :cond_9

    invoke-virtual {v13, v14}, Lm0/q;->l(LVm/a;)V

    goto :goto_6

    :cond_9
    invoke-virtual {v13}, Lm0/q;->t0()V

    :goto_6
    sget-object v14, LZ0/g;->f:LZ0/e;

    invoke-static {v14, v10, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v10, LZ0/g;->e:LZ0/e;

    invoke-static {v10, v12, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    sget-object v11, LZ0/g;->g:LZ0/e;

    invoke-static {v13, v10, v11}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v10, LZ0/g;->h:LZ0/d;

    invoke-static {v13, v10}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v10, LZ0/g;->d:LZ0/e;

    invoke-static {v10, v8, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object v8, v4

    sget-object v4, Lih/h;->f:Lih/h;

    invoke-static {v5}, LIm/s;->Z(LFf/X0;)Ljava/lang/String;

    move-result-object v10

    iget-object v11, v5, LFf/X0;->d:Lcom/eightsleep/data_core/enums/ai_insights/AiInsightSentiment;

    invoke-static {v11, v13}, LIm/s;->p0(Lcom/eightsleep/data_core/enums/ai_insights/AiInsightSentiment;Lm0/l;)J

    move-result-wide v11

    move v14, v7

    move-wide/from16 v22, v11

    move-object v11, v8

    move-wide/from16 v7, v22

    const/4 v12, 0x0

    move v15, v14

    const/4 v14, 0x0

    move/from16 v16, v6

    const/4 v6, 0x0

    move/from16 v17, v9

    const/4 v9, 0x0

    move-object/from16 v18, v5

    move-object v5, v10

    const/4 v10, 0x0

    move-object/from16 v19, v11

    const/4 v11, 0x0

    move/from16 v20, v15

    const/4 v15, 0x0

    move/from16 v21, v16

    const/16 v16, 0x3f6

    move-object/from16 p1, v2

    move-object/from16 v2, v18

    move-object/from16 v3, v19

    invoke-virtual/range {v4 .. v16}, Lih/h;->f(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    sget-object v4, Lih/h;->d:Lih/h;

    iget-object v2, v2, LFf/X0;->b:LYa/H;

    invoke-virtual {v2, v3}, LYa/H;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    move-object v14, v13

    const/4 v13, 0x0

    const/4 v15, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-wide/16 v8, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x3fe

    invoke-virtual/range {v4 .. v17}, Lih/h;->o(Ljava/lang/String;LA0/r;Lk1/U;JIZIILm0/l;III)V

    move-object v13, v14

    const/4 v14, 0x1

    invoke-virtual {v13, v14}, Lm0/q;->q(Z)V

    move-object/from16 v2, p1

    move-object v4, v3

    move/from16 v6, v21

    const/4 v9, 0x0

    goto/16 :goto_4

    :cond_a
    move v14, v7

    move v2, v9

    invoke-virtual {v13, v2}, Lm0/q;->q(Z)V

    invoke-virtual {v13, v14}, Lm0/q;->q(Z)V

    :goto_7
    invoke-virtual {v13}, Lm0/q;->u()Lm0/t0;

    move-result-object v2

    if-eqz v2, :cond_b

    new-instance v3, LFg/g;

    const/4 v4, 0x4

    invoke-direct {v3, v1, v4, v0}, LFg/g;-><init>(IILjava/util/List;)V

    iput-object v3, v2, Lm0/t0;->d:LVm/n;

    :cond_b
    return-void
.end method

.method public static final M(LDf/d1;LA0/o;Lm0/l;I)V
    .locals 18

    move-object/from16 v0, p0

    move/from16 v1, p3

    const/4 v2, 0x0

    const-string v3, "model"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v13, p2

    check-cast v13, Lm0/q;

    const v3, -0x2a4f994d

    invoke-virtual {v13, v3}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v13, v0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x2

    if-eqz v3, :cond_0

    const/4 v3, 0x4

    goto :goto_0

    :cond_0
    move v3, v4

    :goto_0
    or-int/2addr v3, v1

    const/16 v5, 0x30

    or-int/2addr v3, v5

    and-int/lit8 v3, v3, 0x13

    const/16 v6, 0x12

    if-ne v3, v6, :cond_2

    invoke-virtual {v13}, Lm0/q;->H()Z

    move-result v3

    if-nez v3, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v13}, Lm0/q;->Y()V

    move-object/from16 v3, p1

    goto/16 :goto_5

    :cond_2
    :goto_1
    sget-object v3, LA0/o;->a:LA0/o;

    sget-object v6, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->b:Lm0/c1;

    invoke-virtual {v13, v6}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/Context;

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-static {v3, v6}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v7

    invoke-static {v13}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v6

    iget v9, v6, Lhh/i;->k:F

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v8, 0x0

    const/16 v12, 0xd

    invoke-static/range {v7 .. v12}, LG/e;->L(LA0/r;FFFFI)LA0/r;

    move-result-object v6

    sget-object v7, LA0/d;->n:LA0/g;

    sget-object v8, LG/l;->a:LG/d;

    invoke-static {v13}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v8

    iget v8, v8, Lhh/i;->k:F

    invoke-static {v8}, LG/l;->g(F)LG/j;

    move-result-object v8

    invoke-static {v8, v7, v13, v5}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v8

    iget-wide v9, v13, Lm0/q;->T:J

    invoke-static {v9, v10}, Ljava/lang/Long;->hashCode(J)I

    move-result v9

    invoke-virtual {v13}, Lm0/q;->m()Lm0/o0;

    move-result-object v10

    invoke-static {v6, v13}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v6

    sget-object v11, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v11, LZ0/g;->b:LZ0/f;

    invoke-virtual {v13}, Lm0/q;->j0()V

    iget-boolean v12, v13, Lm0/q;->S:Z

    if-eqz v12, :cond_3

    invoke-virtual {v13, v11}, Lm0/q;->l(LVm/a;)V

    goto :goto_2

    :cond_3
    invoke-virtual {v13}, Lm0/q;->t0()V

    :goto_2
    sget-object v12, LZ0/g;->f:LZ0/e;

    invoke-static {v12, v8, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v8, LZ0/g;->e:LZ0/e;

    invoke-static {v8, v10, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    sget-object v10, LZ0/g;->g:LZ0/e;

    invoke-static {v13, v9, v10}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v9, LZ0/g;->h:LZ0/d;

    invoke-static {v13, v9}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v14, LZ0/g;->d:LZ0/e;

    invoke-static {v14, v6, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    iget-object v6, v0, LDf/d1;->b:Ljava/lang/String;

    const/4 v15, 0x0

    invoke-static {v2, v15, v6, v13}, LIm/s;->O(ILA0/r;Ljava/lang/String;Lm0/l;)V

    invoke-static {v13}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v15

    iget v15, v15, Lhh/i;->f:F

    const/4 v2, 0x0

    invoke-static {v3, v15, v2, v4}, LG/e;->J(LA0/r;FFI)LA0/r;

    move-result-object v2

    invoke-static {v13}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v4

    iget v4, v4, Lhh/i;->d:F

    invoke-static {v4}, LG/l;->g(F)LG/j;

    move-result-object v4

    invoke-static {v4, v7, v13, v5}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v4

    move-object v15, v6

    iget-wide v5, v13, Lm0/q;->T:J

    invoke-static {v5, v6}, Ljava/lang/Long;->hashCode(J)I

    move-result v5

    invoke-virtual {v13}, Lm0/q;->m()Lm0/o0;

    move-result-object v6

    invoke-static {v2, v13}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v2

    invoke-virtual {v13}, Lm0/q;->j0()V

    move-object/from16 p1, v15

    iget-boolean v15, v13, Lm0/q;->S:Z

    if-eqz v15, :cond_4

    invoke-virtual {v13, v11}, Lm0/q;->l(LVm/a;)V

    goto :goto_3

    :cond_4
    invoke-virtual {v13}, Lm0/q;->t0()V

    :goto_3
    invoke-static {v12, v4, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v8, v6, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v5, v13, v10, v13, v9}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    invoke-static {v14, v2, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v13}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v2

    iget v2, v2, Lhh/i;->c:F

    invoke-static {v2}, LG/l;->g(F)LG/j;

    move-result-object v2

    const/16 v4, 0x30

    invoke-static {v2, v7, v13, v4}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v2

    iget-wide v4, v13, Lm0/q;->T:J

    invoke-static {v4, v5}, Ljava/lang/Long;->hashCode(J)I

    move-result v4

    invoke-virtual {v13}, Lm0/q;->m()Lm0/o0;

    move-result-object v5

    invoke-static {v3, v13}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v6

    invoke-virtual {v13}, Lm0/q;->j0()V

    iget-boolean v7, v13, Lm0/q;->S:Z

    if-eqz v7, :cond_5

    invoke-virtual {v13, v11}, Lm0/q;->l(LVm/a;)V

    goto :goto_4

    :cond_5
    invoke-virtual {v13}, Lm0/q;->t0()V

    :goto_4
    invoke-static {v12, v2, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v8, v5, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v4, v13, v10, v13, v9}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    invoke-static {v14, v6, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v4, Lih/h;->d:Lih/h;

    filled-new-array/range {p1 .. p1}, [Ljava/lang/Object;

    move-result-object v2

    const v5, 0x7f121701

    invoke-static {v5, v2, v13}, LP2/j;->H(I[Ljava/lang/Object;Lm0/l;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v13}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v2

    iget-object v2, v2, Lhh/h;->k:Lhh/v;

    iget-wide v8, v2, Lhh/v;->d:J

    move-object v14, v13

    const/4 v13, 0x0

    const/4 v15, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v10, 0x3

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x3e6

    invoke-virtual/range {v4 .. v17}, Lih/h;->o(Ljava/lang/String;LA0/r;Lk1/U;JIZIILm0/l;III)V

    move-object v13, v14

    sget-object v4, Lih/h;->g:Lih/h;

    invoke-static {v13}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v2

    iget-object v2, v2, Lhh/h;->k:Lhh/v;

    iget-wide v7, v2, Lhh/v;->a:J

    iget-object v5, v0, LDf/d1;->c:Ljava/lang/String;

    const/4 v12, 0x0

    const/4 v14, 0x0

    const/4 v6, 0x0

    const/4 v9, 0x3

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x3e6

    invoke-virtual/range {v4 .. v16}, Lih/h;->f(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    const/4 v2, 0x1

    invoke-virtual {v13, v2}, Lm0/q;->q(Z)V

    sget-object v4, Lih/h;->b:Lih/h;

    invoke-static {v13}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v5

    iget-object v5, v5, Lhh/h;->k:Lhh/v;

    iget-wide v7, v5, Lhh/v;->d:J

    iget-object v5, v0, LDf/d1;->d:Ljava/lang/String;

    const/4 v12, 0x0

    const/4 v14, 0x0

    const/4 v6, 0x0

    const/4 v9, 0x3

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x3e6

    invoke-virtual/range {v4 .. v16}, Lih/h;->h(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    invoke-virtual {v13, v2}, Lm0/q;->q(Z)V

    invoke-virtual {v13, v2}, Lm0/q;->q(Z)V

    :goto_5
    invoke-virtual {v13}, Lm0/q;->u()Lm0/t0;

    move-result-object v2

    if-eqz v2, :cond_6

    new-instance v4, LQf/a;

    const/4 v5, 0x0

    invoke-direct {v4, v0, v3, v1, v5}, LQf/a;-><init>(LDf/d1;LA0/o;II)V

    iput-object v4, v2, Lm0/t0;->d:LVm/n;

    :cond_6
    return-void
.end method

.method public static final N(LFf/W0;LVm/a;LA0/r;FLm0/l;II)V
    .locals 20

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v0, "model"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onExplore"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v0, p4

    check-cast v0, Lm0/q;

    const v3, 0x239da7b2

    invoke-virtual {v0, v3}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v0, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x4

    goto :goto_0

    :cond_0
    const/4 v3, 0x2

    :goto_0
    or-int v3, p5, v3

    and-int/lit8 v5, p5, 0x30

    if-nez v5, :cond_2

    invoke-virtual {v0, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    const/16 v5, 0x20

    goto :goto_1

    :cond_1
    const/16 v5, 0x10

    :goto_1
    or-int/2addr v3, v5

    :cond_2
    and-int/lit8 v5, p6, 0x4

    if-eqz v5, :cond_3

    or-int/lit16 v3, v3, 0x180

    move-object/from16 v6, p2

    goto :goto_3

    :cond_3
    move-object/from16 v6, p2

    invoke-virtual {v0, v6}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    const/16 v7, 0x100

    goto :goto_2

    :cond_4
    const/16 v7, 0x80

    :goto_2
    or-int/2addr v3, v7

    :goto_3
    and-int/lit8 v7, p6, 0x8

    if-eqz v7, :cond_5

    or-int/lit16 v3, v3, 0xc00

    move/from16 v8, p3

    goto :goto_5

    :cond_5
    move/from16 v8, p3

    invoke-virtual {v0, v8}, Lm0/q;->d(F)Z

    move-result v9

    if-eqz v9, :cond_6

    const/16 v9, 0x800

    goto :goto_4

    :cond_6
    const/16 v9, 0x400

    :goto_4
    or-int/2addr v3, v9

    :goto_5
    and-int/lit16 v9, v3, 0x493

    const/16 v10, 0x492

    if-ne v9, v10, :cond_8

    invoke-virtual {v0}, Lm0/q;->H()Z

    move-result v9

    if-nez v9, :cond_7

    goto :goto_6

    :cond_7
    invoke-virtual {v0}, Lm0/q;->Y()V

    move-object v3, v6

    move v4, v8

    goto/16 :goto_11

    :cond_8
    :goto_6
    sget-object v9, LA0/o;->a:LA0/o;

    if-eqz v5, :cond_9

    move-object v6, v9

    :cond_9
    const/4 v5, 0x0

    if-eqz v7, :cond_a

    int-to-float v7, v5

    goto :goto_7

    :cond_a
    move v7, v8

    :goto_7
    invoke-static {v0}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v8

    iget v8, v8, Lhh/i;->g:F

    iget-boolean v10, v1, LFf/W0;->i:Z

    iget-boolean v11, v1, LFf/W0;->e:Z

    if-eqz v11, :cond_b

    if-eqz v10, :cond_b

    sget-object v12, LFf/V0;->PATTERN:LFf/V0;

    goto :goto_8

    :cond_b
    if-eqz v10, :cond_c

    sget-object v12, LFf/V0;->INSIGHT:LFf/V0;

    goto :goto_8

    :cond_c
    sget-object v12, LFf/V0;->LEARNING:LFf/V0;

    :goto_8
    sget-object v13, LFf/V0;->PATTERN:LFf/V0;

    if-ne v12, v13, :cond_d

    const/4 v12, 0x1

    goto :goto_9

    :cond_d
    move v12, v5

    :goto_9
    invoke-static {v0}, Lhh/j;->c(Lm0/l;)Lme/u;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v15, Lme/u;->c:Lme/t;

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v15, Lme/t;->b:Lme/m;

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v15, Lme/m;->d:LHm/p;

    invoke-virtual {v15}, LHm/p;->getValue()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, LH0/w;

    iget-wide v14, v15, LH0/w;->a:J

    const/high16 v4, 0x3f800000    # 1.0f

    move/from16 v16, v3

    invoke-static {v6, v4}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v3

    int-to-float v4, v5

    invoke-static {v7, v4}, Lw1/f;->a(FF)I

    move-result v4

    if-lez v4, :cond_e

    invoke-static {v9, v7}, Landroidx/compose/foundation/layout/b;->e(LA0/r;F)LA0/r;

    move-result-object v4

    goto :goto_a

    :cond_e
    move-object v4, v9

    :goto_a
    invoke-interface {v3, v4}, LA0/r;->then(LA0/r;)LA0/r;

    move-result-object v3

    invoke-static {v8}, LO/e;->b(F)LO/d;

    move-result-object v4

    invoke-static {v3, v4}, LE0/i;->c(LA0/r;LH0/X;)LA0/r;

    move-result-object v3

    const v4, 0x3f56b04c

    invoke-virtual {v0, v4}, Lm0/q;->f0(I)V

    invoke-static {v0}, Lhh/j;->c(Lm0/l;)Lme/u;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v4, v6

    invoke-static {}, Lme/m;->c()J

    move-result-wide v5

    invoke-static {v0}, Lhh/j;->c(Lm0/l;)Lme/u;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v17, Lme/u;->b:Lme/j;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v17, Lme/j;->b:Lme/h;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v17, Lme/h;->h:LHm/p;

    invoke-virtual/range {v17 .. v17}, LHm/p;->getValue()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v18, v4

    move-object/from16 v4, v17

    check-cast v4, LH0/w;

    move/from16 v17, v7

    move/from16 v19, v8

    iget-wide v7, v4, LH0/w;->a:J

    new-instance v4, LWf/U0;

    invoke-direct {v4, v5, v6, v7, v8}, LWf/U0;-><init>(JJ)V

    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Lm0/q;->q(Z)V

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x6

    invoke-static {v3, v4, v5, v6, v7}, Ly/x;->f(LA0/r;LH0/t;LO/d;FI)LA0/r;

    move-result-object v3

    const v4, 0x76907016

    invoke-virtual {v0, v4}, Lm0/q;->f0(I)V

    invoke-static {v0}, Lhh/j;->c(Lm0/l;)Lme/u;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lme/m;->b()J

    move-result-wide v5

    new-instance v4, LWf/V0;

    invoke-direct {v4, v5, v6}, LWf/V0;-><init>(J)V

    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Lm0/q;->q(Z)V

    const/4 v5, 0x0

    const/4 v8, 0x0

    invoke-static {v3, v4, v5, v8, v7}, Ly/x;->f(LA0/r;LH0/t;LO/d;FI)LA0/r;

    move-result-object v3

    if-eqz v12, :cond_f

    const/4 v4, 0x1

    int-to-float v5, v4

    invoke-static/range {v19 .. v19}, LO/e;->b(F)LO/d;

    move-result-object v4

    invoke-static {v9, v5, v14, v15, v4}, Ly/x;->h(LA0/r;FJLH0/X;)LA0/r;

    move-result-object v4

    goto :goto_b

    :cond_f
    move-object v4, v9

    :goto_b
    invoke-interface {v3, v4}, LA0/r;->then(LA0/r;)LA0/r;

    move-result-object v3

    invoke-static {v0}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v4

    iget v4, v4, Lhh/i;->f:F

    invoke-static {v3, v4}, LG/e;->H(LA0/r;F)LA0/r;

    move-result-object v3

    sget-object v4, LA0/d;->a:LA0/i;

    const/4 v5, 0x0

    invoke-static {v4, v5}, LG/t;->d(LA0/e;Z)LX0/h0;

    move-result-object v4

    iget-wide v5, v0, Lm0/q;->T:J

    invoke-static {v5, v6}, Ljava/lang/Long;->hashCode(J)I

    move-result v5

    invoke-virtual {v0}, Lm0/q;->m()Lm0/o0;

    move-result-object v6

    invoke-static {v3, v0}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v3

    sget-object v7, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v7, LZ0/g;->b:LZ0/f;

    invoke-virtual {v0}, Lm0/q;->j0()V

    iget-boolean v8, v0, Lm0/q;->S:Z

    if-eqz v8, :cond_10

    invoke-virtual {v0, v7}, Lm0/q;->l(LVm/a;)V

    goto :goto_c

    :cond_10
    invoke-virtual {v0}, Lm0/q;->t0()V

    :goto_c
    sget-object v8, LZ0/g;->f:LZ0/e;

    invoke-static {v8, v4, v0}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v4, LZ0/g;->e:LZ0/e;

    invoke-static {v4, v6, v0}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    sget-object v6, LZ0/g;->g:LZ0/e;

    invoke-static {v0, v5, v6}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v5, LZ0/g;->h:LZ0/d;

    invoke-static {v0, v5}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v12, LZ0/g;->d:LZ0/e;

    invoke-static {v12, v3, v0}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v9, v3}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v3

    sget-object v9, LG/l;->c:LG/f;

    sget-object v14, LA0/d;->m:LA0/g;

    const/4 v15, 0x0

    invoke-static {v9, v14, v0, v15}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v9

    iget-wide v14, v0, Lm0/q;->T:J

    invoke-static {v14, v15}, Ljava/lang/Long;->hashCode(J)I

    move-result v14

    invoke-virtual {v0}, Lm0/q;->m()Lm0/o0;

    move-result-object v15

    invoke-static {v3, v0}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v3

    invoke-virtual {v0}, Lm0/q;->j0()V

    move/from16 v19, v10

    iget-boolean v10, v0, Lm0/q;->S:Z

    if-eqz v10, :cond_11

    invoke-virtual {v0, v7}, Lm0/q;->l(LVm/a;)V

    goto :goto_d

    :cond_11
    invoke-virtual {v0}, Lm0/q;->t0()V

    :goto_d
    invoke-static {v8, v9, v0}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v4, v15, v0}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v14, v0, v6, v0, v5}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    invoke-static {v12, v3, v0}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    if-eqz v11, :cond_12

    if-eqz v19, :cond_12

    goto :goto_e

    :cond_12
    if-eqz v19, :cond_13

    sget-object v13, LFf/V0;->INSIGHT:LFf/V0;

    goto :goto_e

    :cond_13
    sget-object v13, LFf/V0;->LEARNING:LFf/V0;

    :goto_e
    sget-object v3, LWf/T0;->a:[I

    invoke-virtual {v13}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    aget v3, v3, v4

    const/4 v4, 0x1

    if-eq v3, v4, :cond_16

    const/4 v4, 0x2

    if-eq v3, v4, :cond_15

    const/4 v4, 0x3

    if-ne v3, v4, :cond_14

    const v3, -0x55a1145f

    invoke-virtual {v0, v3}, Lm0/q;->f0(I)V

    and-int/lit8 v3, v16, 0xe

    invoke-static {v1, v0, v3}, LIm/s;->w(LFf/W0;Lm0/l;I)V

    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Lm0/q;->q(Z)V

    :goto_f
    const/4 v4, 0x1

    goto :goto_10

    :cond_14
    const/4 v5, 0x0

    const v1, -0x55a13541

    invoke-static {v1, v0, v5}, Lj/m;->t(ILm0/q;Z)Lkotlin/NoWhenBranchMatchedException;

    move-result-object v0

    throw v0

    :cond_15
    const/4 v5, 0x0

    const v3, -0x55a11f20

    invoke-virtual {v0, v3}, Lm0/q;->f0(I)V

    and-int/lit8 v3, v16, 0xe

    invoke-static {v1, v0, v3}, LIm/s;->s(LFf/W0;Lm0/l;I)V

    invoke-virtual {v0, v5}, Lm0/q;->q(Z)V

    goto :goto_f

    :cond_16
    const/4 v5, 0x0

    const v3, -0x55a12c89

    invoke-virtual {v0, v3}, Lm0/q;->f0(I)V

    and-int/lit8 v3, v16, 0x7e

    invoke-static {v1, v2, v0, v3}, LIm/s;->F(LFf/W0;LVm/a;Lm0/l;I)V

    invoke-virtual {v0, v5}, Lm0/q;->q(Z)V

    goto :goto_f

    :goto_10
    invoke-virtual {v0, v4}, Lm0/q;->q(Z)V

    invoke-virtual {v0, v4}, Lm0/q;->q(Z)V

    move/from16 v4, v17

    move-object/from16 v3, v18

    :goto_11
    invoke-virtual {v0}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_17

    new-instance v0, LWf/P0;

    move/from16 v5, p5

    move/from16 v6, p6

    invoke-direct/range {v0 .. v6}, LWf/P0;-><init>(LFf/W0;LVm/a;LA0/r;FII)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_17
    return-void
.end method

.method public static final O(ILA0/r;Ljava/lang/String;Lm0/l;)V
    .locals 17

    move/from16 v0, p0

    move-object/from16 v2, p2

    move-object/from16 v11, p3

    check-cast v11, Lm0/q;

    const v1, -0x913563d    # -2.4000493E33f

    invoke-virtual {v11, v1}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v11, v2}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x4

    goto :goto_0

    :cond_0
    const/4 v1, 0x2

    :goto_0
    or-int/2addr v1, v0

    or-int/lit8 v1, v1, 0x30

    and-int/lit8 v3, v1, 0x13

    const/16 v4, 0x12

    if-ne v3, v4, :cond_2

    invoke-virtual {v11}, Lm0/q;->H()Z

    move-result v3

    if-nez v3, :cond_1

    goto :goto_2

    :cond_1
    invoke-virtual {v11}, Lm0/q;->Y()V

    :goto_1
    move-object/from16 v1, p1

    goto/16 :goto_4

    :cond_2
    :goto_2
    sget-object v15, LA0/o;->a:LA0/o;

    invoke-static {v11}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v3

    iget-object v3, v3, Lhh/h;->i:Lhh/q;

    iget-wide v3, v3, Lhh/q;->a:J

    const v5, -0x2e977850

    invoke-virtual {v11, v5}, Lm0/q;->f0(I)V

    invoke-virtual {v11, v3, v4}, Lm0/q;->f(J)Z

    move-result v5

    invoke-virtual {v11}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v6

    if-nez v5, :cond_3

    sget-object v5, Lm0/k;->a:Lm0/e;

    if-ne v6, v5, :cond_4

    :cond_3
    new-instance v6, LKe/c;

    const/4 v5, 0x4

    invoke-direct {v6, v3, v4, v5}, LKe/c;-><init>(JI)V

    invoke-virtual {v11, v6}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_4
    check-cast v6, LVm/k;

    const/4 v3, 0x0

    invoke-virtual {v11, v3}, Lm0/q;->q(Z)V

    invoke-static {v15, v6}, LE0/i;->e(LA0/r;LVm/k;)LA0/r;

    move-result-object v4

    const/16 v5, 0x64

    int-to-float v5, v5

    invoke-static {v5}, LO/e;->b(F)LO/d;

    move-result-object v6

    invoke-static {v4, v6}, LE0/i;->c(LA0/r;LH0/X;)LA0/r;

    move-result-object v4

    invoke-static {v11}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v6

    iget-object v6, v6, Lhh/h;->a:Lhh/a;

    iget-wide v6, v6, Lhh/a;->a:J

    sget-object v8, LH0/F;->b:LH0/S;

    invoke-static {v4, v6, v7, v8}, Ly/x;->g(LA0/r;JLH0/X;)LA0/r;

    move-result-object v4

    const/4 v6, 0x1

    int-to-float v7, v6

    invoke-static {v11}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v8

    iget-object v8, v8, Lhh/h;->b:Lhh/b;

    iget-wide v8, v8, Lhh/b;->c:J

    invoke-static {v5}, LO/e;->b(F)LO/d;

    move-result-object v5

    invoke-static {v4, v7, v8, v9, v5}, Ly/x;->h(LA0/r;FJLH0/X;)LA0/r;

    move-result-object v4

    invoke-static {v11}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v5

    iget v5, v5, Lhh/i;->g:F

    invoke-static {v11}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v7

    iget v7, v7, Lhh/i;->e:F

    invoke-static {v4, v5, v7}, LG/e;->I(LA0/r;FF)LA0/r;

    move-result-object v4

    sget-object v5, LA0/d;->e:LA0/i;

    invoke-static {v5, v3}, LG/t;->d(LA0/e;Z)LX0/h0;

    move-result-object v3

    iget-wide v7, v11, Lm0/q;->T:J

    invoke-static {v7, v8}, Ljava/lang/Long;->hashCode(J)I

    move-result v5

    invoke-virtual {v11}, Lm0/q;->m()Lm0/o0;

    move-result-object v7

    invoke-static {v4, v11}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v4

    sget-object v8, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v8, LZ0/g;->b:LZ0/f;

    invoke-virtual {v11}, Lm0/q;->j0()V

    iget-boolean v9, v11, Lm0/q;->S:Z

    if-eqz v9, :cond_5

    invoke-virtual {v11, v8}, Lm0/q;->l(LVm/a;)V

    goto :goto_3

    :cond_5
    invoke-virtual {v11}, Lm0/q;->t0()V

    :goto_3
    sget-object v8, LZ0/g;->f:LZ0/e;

    invoke-static {v8, v3, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v3, LZ0/g;->e:LZ0/e;

    invoke-static {v3, v7, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    sget-object v5, LZ0/g;->g:LZ0/e;

    invoke-static {v11, v3, v5}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v3, LZ0/g;->h:LZ0/d;

    invoke-static {v11, v3}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v3, LZ0/g;->d:LZ0/e;

    invoke-static {v3, v4, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move v3, v1

    sget-object v1, Lih/h;->e:Lih/h;

    invoke-static {v11}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v4

    iget-object v4, v4, Lhh/h;->k:Lhh/v;

    iget-wide v4, v4, Lhh/v;->a:J

    and-int/lit8 v12, v3, 0xe

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v3, 0x0

    move v7, v6

    move-wide v5, v4

    const/4 v4, 0x0

    move v8, v7

    const/4 v7, 0x0

    move v13, v8

    const/4 v8, 0x0

    move v14, v13

    const/4 v13, 0x0

    move/from16 v16, v14

    const/16 v14, 0x3f6

    move-object/from16 p1, v15

    move/from16 v15, v16

    invoke-virtual/range {v1 .. v14}, Lih/h;->b(Ljava/lang/String;LA0/r;Lk1/U;JIZIILm0/l;III)V

    invoke-virtual {v11, v15}, Lm0/q;->q(Z)V

    goto/16 :goto_1

    :goto_4
    invoke-virtual {v11}, Lm0/q;->u()Lm0/t0;

    move-result-object v3

    if-eqz v3, :cond_6

    new-instance v4, LBg/p0;

    const/4 v5, 0x2

    invoke-direct {v4, v2, v1, v0, v5}, LBg/p0;-><init>(Ljava/lang/String;LA0/r;II)V

    iput-object v4, v3, Lm0/t0;->d:LVm/n;

    :cond_6
    return-void
.end method

.method public static final P(Lm0/l;I)V
    .locals 14

    move-object v5, p0

    check-cast v5, Lm0/q;

    const p0, 0x4b5bff73    # 1.4417779E7f

    invoke-virtual {v5, p0}, Lm0/q;->h0(I)Lm0/q;

    if-nez p1, :cond_1

    invoke-virtual {v5}, Lm0/q;->H()Z

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v5}, Lm0/q;->Y()V

    goto/16 :goto_2

    :cond_1
    :goto_0
    sget-object p0, LA0/d;->k:LA0/h;

    sget-object v0, LA0/o;->a:LA0/o;

    sget-object v1, LG/l;->a:LG/d;

    const/16 v2, 0x30

    invoke-static {v1, p0, v5, v2}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object p0

    iget-wide v3, v5, Lm0/q;->T:J

    invoke-static {v3, v4}, Ljava/lang/Long;->hashCode(J)I

    move-result v1

    invoke-virtual {v5}, Lm0/q;->m()Lm0/o0;

    move-result-object v3

    invoke-static {v0, v5}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v4

    sget-object v6, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v6, LZ0/g;->b:LZ0/f;

    invoke-virtual {v5}, Lm0/q;->j0()V

    iget-boolean v7, v5, Lm0/q;->S:Z

    if-eqz v7, :cond_2

    invoke-virtual {v5, v6}, Lm0/q;->l(LVm/a;)V

    goto :goto_1

    :cond_2
    invoke-virtual {v5}, Lm0/q;->t0()V

    :goto_1
    sget-object v6, LZ0/g;->f:LZ0/e;

    invoke-static {v6, p0, v5}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object p0, LZ0/g;->e:LZ0/e;

    invoke-static {p0, v3, v5}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    sget-object v1, LZ0/g;->g:LZ0/e;

    invoke-static {v5, p0, v1}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object p0, LZ0/g;->h:LZ0/d;

    invoke-static {v5, p0}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object p0, LZ0/g;->d:LZ0/e;

    invoke-static {p0, v4, v5}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const p0, 0x7f08017f

    const/4 v8, 0x0

    invoke-static {p0, v8, v5}, LP2/i;->E(IILm0/l;)LL0/a;

    move-result-object p0

    invoke-static {v5}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v1

    iget-object v1, v1, Lhh/h;->k:Lhh/v;

    iget-wide v3, v1, Lhh/v;->a:J

    invoke-static {v5}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v1

    iget v1, v1, Lhh/i;->e:F

    invoke-static {v0, v1}, Landroidx/compose/foundation/layout/b;->i(LA0/r;F)LA0/r;

    move-result-object v0

    sget v1, LL0/a;->$stable:I

    or-int/lit8 v6, v1, 0x30

    const/4 v7, 0x0

    const/4 v1, 0x0

    move-object v2, v0

    move-object v0, p0

    invoke-static/range {v0 .. v7}, Lj0/I0;->a(LL0/a;Ljava/lang/String;LA0/r;JLm0/l;II)V

    invoke-static {v5, v8}, LP2/z;->k(Lm0/l;I)V

    sget-object v0, Lih/h;->d:Lih/h;

    const p0, 0x7f120ba2

    invoke-static {v5, p0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v1

    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v10, v5

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    const/4 v8, 0x0

    const/4 v12, 0x0

    const/16 v13, 0x3fe

    invoke-virtual/range {v0 .. v13}, Lih/h;->o(Ljava/lang/String;LA0/r;Lk1/U;JIZIILm0/l;III)V

    move-object v5, v10

    const/4 p0, 0x1

    invoke-virtual {v5, p0}, Lm0/q;->q(Z)V

    :goto_2
    invoke-virtual {v5}, Lm0/q;->u()Lm0/t0;

    move-result-object p0

    if-eqz p0, :cond_3

    new-instance v0, LWf/m0;

    const/4 v1, 0x6

    invoke-direct {v0, p1, v1}, LWf/m0;-><init>(II)V

    iput-object v0, p0, Lm0/t0;->d:LVm/n;

    :cond_3
    return-void
.end method

.method public static final Q(ZLv1/j;Ld0/d0;Lm0/l;I)V
    .locals 12

    move/from16 v11, p4

    move-object v8, p3

    check-cast v8, Lm0/q;

    const v0, -0x50245748

    invoke-virtual {v8, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, v11, 0x6

    const/4 v2, 0x4

    if-nez v0, :cond_1

    invoke-virtual {v8, p0}, Lm0/q;->h(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int/2addr v0, v11

    goto :goto_1

    :cond_1
    move v0, v11

    :goto_1
    and-int/lit8 v3, v11, 0x30

    const/16 v4, 0x20

    if-nez v3, :cond_3

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    invoke-virtual {v8, v3}, Lm0/q;->e(I)Z

    move-result v3

    if-eqz v3, :cond_2

    move v3, v4

    goto :goto_2

    :cond_2
    const/16 v3, 0x10

    :goto_2
    or-int/2addr v0, v3

    :cond_3
    and-int/lit16 v3, v11, 0x180

    if-nez v3, :cond_5

    invoke-virtual {v8, p2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    const/16 v3, 0x100

    goto :goto_3

    :cond_4
    const/16 v3, 0x80

    :goto_3
    or-int/2addr v0, v3

    :cond_5
    and-int/lit16 v3, v0, 0x93

    const/4 v5, 0x1

    const/16 v6, 0x92

    const/4 v7, 0x0

    if-eq v3, v6, :cond_6

    move v3, v5

    goto :goto_4

    :cond_6
    move v3, v7

    :goto_4
    and-int/lit8 v6, v0, 0x1

    invoke-virtual {v8, v6, v3}, Lm0/q;->V(IZ)Z

    move-result v3

    if-eqz v3, :cond_11

    and-int/lit8 v3, v0, 0xe

    if-ne v3, v2, :cond_7

    move v6, v5

    goto :goto_5

    :cond_7
    move v6, v7

    :goto_5
    invoke-virtual {v8, p2}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v9

    or-int/2addr v6, v9

    invoke-virtual {v8}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v9

    sget-object v10, Lm0/k;->a:Lm0/e;

    if-nez v6, :cond_8

    if-ne v9, v10, :cond_9

    :cond_8
    new-instance v9, Ld0/Y;

    invoke-direct {v9, p2, p0}, Ld0/Y;-><init>(Ld0/d0;Z)V

    invoke-virtual {v8, v9}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_9
    check-cast v9, LP/A0;

    invoke-virtual {v8, p2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    if-ne v3, v2, :cond_a

    goto :goto_6

    :cond_a
    move v5, v7

    :goto_6
    or-int v2, v6, v5

    invoke-virtual {v8}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v3

    if-nez v2, :cond_b

    if-ne v3, v10, :cond_c

    :cond_b
    new-instance v3, Ld0/e0;

    invoke-direct {v3, p2, p0}, Ld0/e0;-><init>(Ld0/d0;Z)V

    invoke-virtual {v8, v3}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_c
    check-cast v3, Ld0/l;

    invoke-virtual {p2}, Ld0/d0;->n()Lp1/w;

    move-result-object v2

    iget-wide v5, v2, Lp1/w;->b:J

    invoke-static {v5, v6}, Lk1/T;->h(J)Z

    move-result v2

    if-eqz p0, :cond_d

    invoke-virtual {p2}, Ld0/d0;->n()Lp1/w;

    move-result-object v5

    iget-wide v5, v5, Lp1/w;->b:J

    shr-long v4, v5, v4

    :goto_7
    long-to-int v4, v4

    goto :goto_8

    :cond_d
    invoke-virtual {p2}, Ld0/d0;->n()Lp1/w;

    move-result-object v4

    iget-wide v4, v4, Lp1/w;->b:J

    const-wide v6, 0xffffffffL

    and-long/2addr v4, v6

    goto :goto_7

    :goto_8
    iget-object v5, p2, Ld0/d0;->d:LP/o0;

    if-eqz v5, :cond_e

    invoke-virtual {v5}, LP/o0;->d()LP/R0;

    move-result-object v5

    if-eqz v5, :cond_e

    iget-object v5, v5, LP/R0;->a:Lk1/P;

    invoke-static {v5, v4}, LP/H;->w(Lk1/P;I)F

    move-result v4

    :goto_9
    move v6, v4

    goto :goto_a

    :cond_e
    const/4 v4, 0x0

    goto :goto_9

    :goto_a
    sget-object v4, LA0/o;->a:LA0/o;

    invoke-virtual {v8, v9}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    invoke-virtual {v8}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v7

    if-nez v5, :cond_f

    if-ne v7, v10, :cond_10

    :cond_f
    new-instance v7, LL/g;

    const/4 v5, 0x6

    invoke-direct {v7, v9, v5}, LL/g;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v8, v7}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_10
    check-cast v7, Landroidx/compose/ui/input/pointer/PointerInputEventHandler;

    invoke-static {v4, v9, v7}, LT0/F;->a(LA0/r;Ljava/lang/Object;Landroidx/compose/ui/input/pointer/PointerInputEventHandler;)LA0/r;

    move-result-object v7

    shl-int/lit8 v0, v0, 0x3

    and-int/lit16 v9, v0, 0x3f0

    const/16 v10, 0x10

    const-wide/16 v4, 0x0

    move v1, p0

    move-object v0, v3

    move v3, v2

    move-object v2, p1

    invoke-static/range {v0 .. v10}, LP2/b;->j(Ld0/l;ZLv1/j;ZJFLA0/r;Lm0/l;II)V

    goto :goto_b

    :cond_11
    invoke-virtual {v8}, Lm0/q;->Y()V

    :goto_b
    invoke-virtual {v8}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_12

    new-instance v0, LHe/A;

    const/4 v5, 0x6

    move v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, v11

    invoke-direct/range {v0 .. v5}, LHe/A;-><init>(ZLjava/lang/Object;Ljava/lang/Object;II)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_12
    return-void
.end method

.method public static final R(Ljava/lang/String;LVm/a;LA0/r;Lm0/l;I)V
    .locals 35

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v4, p4

    move-object/from16 v9, p3

    check-cast v9, Lm0/q;

    const v0, 0x4170cb5c

    invoke-virtual {v9, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, v4, 0x6

    if-nez v0, :cond_1

    invoke-virtual {v9, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int/2addr v0, v4

    goto :goto_1

    :cond_1
    move v0, v4

    :goto_1
    and-int/lit8 v3, v4, 0x30

    const/16 v5, 0x20

    if-nez v3, :cond_3

    invoke-virtual {v9, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v3, v5

    goto :goto_2

    :cond_2
    const/16 v3, 0x10

    :goto_2
    or-int/2addr v0, v3

    :cond_3
    and-int/lit16 v3, v4, 0x180

    if-nez v3, :cond_5

    move-object/from16 v3, p2

    invoke-virtual {v9, v3}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    const/16 v6, 0x100

    goto :goto_3

    :cond_4
    const/16 v6, 0x80

    :goto_3
    or-int/2addr v0, v6

    goto :goto_4

    :cond_5
    move-object/from16 v3, p2

    :goto_4
    and-int/lit16 v6, v0, 0x93

    const/16 v7, 0x92

    if-ne v6, v7, :cond_7

    invoke-virtual {v9}, Lm0/q;->H()Z

    move-result v6

    if-nez v6, :cond_6

    goto :goto_5

    :cond_6
    invoke-virtual {v9}, Lm0/q;->Y()V

    goto/16 :goto_8

    :cond_7
    :goto_5
    const v6, 0x7f1203aa

    invoke-static {v9, v6}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v9}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v7

    iget-object v7, v7, Lhh/h;->k:Lhh/v;

    iget-wide v11, v7, Lhh/v;->a:J

    const/4 v7, 0x0

    const/4 v8, 0x6

    invoke-static {v1, v6, v7, v7, v8}, Llo/n;->o0(Ljava/lang/CharSequence;Ljava/lang/String;IZI)I

    move-result v8

    const v10, 0x7156c718

    invoke-virtual {v9, v10}, Lm0/q;->f0(I)V

    new-instance v10, Lk1/e;

    invoke-direct {v10}, Lk1/e;-><init>()V

    if-gez v8, :cond_8

    invoke-virtual {v10, v1}, Lk1/e;->a(Ljava/lang/String;)V

    move-object v15, v10

    goto/16 :goto_7

    :cond_8
    invoke-virtual {v1, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v13

    const-string v14, "substring(...)"

    invoke-static {v13, v14}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v10, v13}, Lk1/e;->a(Ljava/lang/String;)V

    new-instance v13, Lk1/Q;

    move-object v15, v10

    new-instance v10, Lk1/K;

    sget-object v27, Lv1/l;->c:Lv1/l;

    const-wide/16 v25, 0x0

    const/16 v28, 0x0

    move-object/from16 v17, v13

    move-object/from16 v16, v14

    const-wide/16 v13, 0x0

    move-object/from16 v18, v15

    const/4 v15, 0x0

    move-object/from16 v19, v16

    const/16 v16, 0x0

    move-object/from16 v20, v17

    const/16 v17, 0x0

    move-object/from16 v21, v18

    const/16 v18, 0x0

    move-object/from16 v22, v19

    const/16 v19, 0x0

    move-object/from16 v24, v20

    move-object/from16 v23, v21

    const-wide/16 v20, 0x0

    move-object/from16 v29, v22

    const/16 v22, 0x0

    move-object/from16 v30, v23

    const/16 v23, 0x0

    move-object/from16 v31, v24

    const/16 v24, 0x0

    move-object/from16 v32, v29

    const v29, 0xeffe

    move-object/from16 v33, v30

    move-object/from16 v7, v31

    move-object/from16 v34, v32

    invoke-direct/range {v10 .. v29}, Lk1/K;-><init>(JJLo1/t;Lo1/p;Lo1/q;Lo1/i;Ljava/lang/String;JLv1/a;Lv1/p;Lr1/b;JLv1/l;LH0/W;I)V

    const/4 v11, 0x0

    invoke-direct {v7, v10, v11, v11, v11}, Lk1/Q;-><init>(Lk1/K;Lk1/K;Lk1/K;Lk1/K;)V

    const v10, -0x57ea775b

    invoke-virtual {v9, v10}, Lm0/q;->f0(I)V

    and-int/lit8 v10, v0, 0x70

    if-ne v10, v5, :cond_9

    const/4 v5, 0x1

    goto :goto_6

    :cond_9
    const/4 v5, 0x0

    :goto_6
    invoke-virtual {v9}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v10

    if-nez v5, :cond_a

    sget-object v5, Lm0/k;->a:Lm0/e;

    if-ne v10, v5, :cond_b

    :cond_a
    new-instance v10, LEe/b;

    const/4 v5, 0x5

    invoke-direct {v10, v5, v2}, LEe/b;-><init>(ILVm/a;)V

    invoke-virtual {v9, v10}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_b
    check-cast v10, Lk1/p;

    const/4 v5, 0x0

    invoke-virtual {v9, v5}, Lm0/q;->q(Z)V

    new-instance v5, Lk1/m;

    const-string v11, "learn_more"

    invoke-direct {v5, v11, v7, v10}, Lk1/m;-><init>(Ljava/lang/String;Lk1/Q;Lk1/p;)V

    move-object/from16 v15, v33

    invoke-virtual {v15, v5}, Lk1/e;->e(Lk1/o;)I

    move-result v5

    :try_start_0
    invoke-virtual {v15, v6}, Lk1/e;->a(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v15, v5}, Lk1/e;->d(I)V

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v5, v8

    invoke-virtual {v1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v6, v34

    invoke-static {v5, v6}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v15, v5}, Lk1/e;->a(Ljava/lang/String;)V

    :goto_7
    invoke-virtual {v15}, Lk1/e;->g()Lk1/h;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v9, v6}, Lm0/q;->q(Z)V

    new-instance v6, LPg/h;

    sget-object v7, LPg/k;->WARNING:LPg/k;

    const v8, 0x7f0801e1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-direct {v6, v7, v8}, LPg/h;-><init>(LPg/k;Ljava/lang/Integer;)V

    and-int/lit16 v10, v0, 0x380

    const/16 v11, 0x18

    const/4 v8, 0x0

    move-object v7, v3

    invoke-static/range {v5 .. v11}, LPg/f;->d(Lk1/h;LPg/j;LA0/r;Ljava/lang/String;Lm0/l;II)V

    :goto_8
    invoke-virtual {v9}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_c

    new-instance v0, LXf/c;

    const/4 v5, 0x1

    move-object/from16 v3, p2

    invoke-direct/range {v0 .. v5}, LXf/c;-><init>(Ljava/lang/String;LVm/a;LA0/r;II)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_c
    return-void

    :catchall_0
    move-exception v0

    invoke-virtual {v15, v5}, Lk1/e;->d(I)V

    throw v0
.end method

.method public static final S(Lyf/j;)Lyf/j;
    .locals 12

    iget-object v0, p0, Lyf/j;->i:Ljava/util/List;

    invoke-static {v0}, LIm/s;->q0(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v10

    const/4 v7, 0x0

    const/16 v11, 0xff

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v1, p0

    invoke-static/range {v1 .. v11}, Lyf/j;->a(Lyf/j;Lyf/r;Ljava/time/LocalDate;ZLyf/L;Lyf/i;Ljava/util/Set;Lyf/i;Ljava/util/Set;Ljava/util/List;I)Lyf/j;

    move-result-object p0

    return-object p0
.end method

.method public static varargs T([Ljava/lang/Object;)Ljava/util/ArrayList;
    .locals 3

    array-length v0, p0

    if-nez v0, :cond_0

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-object p0

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    new-instance v1, LIm/l;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, LIm/l;-><init>([Ljava/lang/Object;Z)V

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public static final U(LGk/s;LM2/a;)Ljava/lang/Object;
    .locals 2

    const/4 v0, 0x1

    :try_start_0
    invoke-virtual {p0}, LGk/k;->isDone()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p0}, LP2/s;->z(Lcom/google/common/util/concurrent/ListenableFuture;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :cond_0
    new-instance v1, Lwo/k;

    invoke-static {p1}, LGk/n;->K(LLm/c;)LLm/c;

    move-result-object p1

    invoke-direct {v1, v0, p1}, Lwo/k;-><init>(ILLm/c;)V

    invoke-virtual {v1}, Lwo/k;->r()V

    new-instance p1, LGk/q;

    invoke-direct {p1, v0, p0, v1}, LGk/q;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    sget-object v0, LGk/o;->INSTANCE:LGk/o;

    invoke-virtual {p0, p1, v0}, LGk/k;->a(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    new-instance p1, LBo/a;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, LBo/a;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v1, p1}, Lwo/k;->t(LVm/k;)V

    invoke-virtual {v1}, Lwo/k;->q()Ljava/lang/Object;

    move-result-object p0

    sget-object p1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    return-object p0

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    invoke-static {p0}, Lkotlin/jvm/internal/l;->g(Ljava/lang/Object;)V

    throw p0
.end method

.method public static V(Ljava/util/ArrayList;Ljava/lang/Comparable;)I
    .locals 4

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const-string v1, "<this>"

    invoke-static {p0, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {v1, v0}, LIm/s;->o0(II)V

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    :goto_0
    if-gt v1, v0, :cond_2

    add-int v2, v1, v0

    ushr-int/lit8 v2, v2, 0x1

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Comparable;

    invoke-static {v3, p1}, LP2/d;->x(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

    move-result v3

    if-gez v3, :cond_0

    add-int/lit8 v1, v2, 0x1

    goto :goto_0

    :cond_0
    if-lez v3, :cond_1

    add-int/lit8 v0, v2, -0x1

    goto :goto_0

    :cond_1
    return v2

    :cond_2
    add-int/lit8 v1, v1, 0x1

    neg-int p0, v1

    return p0
.end method

.method public static W(LJm/c;)LJm/c;
    .locals 1

    invoke-virtual {p0}, LJm/c;->h()V

    const/4 v0, 0x1

    iput-boolean v0, p0, LJm/c;->c:Z

    iget v0, p0, LJm/c;->b:I

    if-lez v0, :cond_0

    return-object p0

    :cond_0
    sget-object p0, LJm/c;->d:LJm/c;

    return-object p0
.end method

.method public static X()LJm/c;
    .locals 2

    new-instance v0, LJm/c;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, LJm/c;-><init>(I)V

    return-object v0
.end method

.method public static final Y(Lkn/f;Lkn/f;)LZn/H;
    .locals 3

    const-string v0, "from"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "to"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p0}, Lkn/f;->m()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    invoke-interface {p1}, Lkn/f;->m()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    invoke-interface {p0}, Lkn/f;->m()Ljava/util/List;

    move-result-object p0

    const-string v0, "from.declaredTypeParameters"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p0, v1}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkn/T;

    invoke-interface {v2}, Lkn/i;->q()LZn/N;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Lkn/f;->m()Ljava/util/List;

    move-result-object p0

    const-string p1, "to.declaredTypeParameters"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-static {p0, v1}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {p1, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkn/T;

    invoke-interface {v1}, Lkn/i;->l()LZn/B;

    move-result-object v1

    const-string v2, "it.defaultType"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v1}, LP2/c;->e(LZn/x;)LZn/G;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    invoke-static {v0, p1}, LIm/r;->Z1(Ljava/util/Collection;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-static {p0}, LIm/F;->Y(Ljava/util/List;)Ljava/util/Map;

    move-result-object p0

    new-instance p1, LZn/H;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, LZn/H;-><init>(Ljava/lang/Object;I)V

    return-object p1
.end method

.method public static final Z(LFf/X0;)Ljava/lang/String;
    .locals 4

    iget-wide v0, p0, LFf/X0;->c:D

    const-wide/16 v2, 0x0

    cmpl-double p0, v0, v2

    if-ltz p0, :cond_0

    const-string p0, "+"

    goto :goto_0

    :cond_0
    const-string p0, ""

    :goto_0
    double-to-int v0, v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, "%"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final a(Lte/c;LVm/k;LVm/a;LVm/a;Lm0/l;I)V
    .locals 21

    move-object/from16 v1, p0

    move-object/from16 v13, p1

    move-object/from16 v0, p2

    move-object/from16 v2, p3

    move/from16 v3, p5

    const-string v4, "model"

    invoke-static {v1, v4}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "onAlarmToggled"

    invoke-static {v13, v4}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "onVibrationPatternClicked"

    invoke-static {v0, v4}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "onVibrationPowerClicked"

    invoke-static {v2, v4}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v12, p4

    check-cast v12, Lm0/q;

    const v4, -0x3334c7ce

    invoke-virtual {v12, v4}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v4, v3, 0x6

    if-nez v4, :cond_1

    invoke-virtual {v12, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v4, 0x4

    goto :goto_0

    :cond_0
    const/4 v4, 0x2

    :goto_0
    or-int/2addr v4, v3

    goto :goto_1

    :cond_1
    move v4, v3

    :goto_1
    and-int/lit8 v5, v3, 0x30

    if-nez v5, :cond_3

    invoke-virtual {v12, v13}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    const/16 v5, 0x20

    goto :goto_2

    :cond_2
    const/16 v5, 0x10

    :goto_2
    or-int/2addr v4, v5

    :cond_3
    and-int/lit16 v5, v3, 0x180

    if-nez v5, :cond_5

    invoke-virtual {v12, v0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    const/16 v5, 0x100

    goto :goto_3

    :cond_4
    const/16 v5, 0x80

    :goto_3
    or-int/2addr v4, v5

    :cond_5
    and-int/lit16 v5, v3, 0xc00

    if-nez v5, :cond_7

    invoke-virtual {v12, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    const/16 v5, 0x800

    goto :goto_4

    :cond_6
    const/16 v5, 0x400

    :goto_4
    or-int/2addr v4, v5

    :cond_7
    and-int/lit16 v5, v4, 0x493

    const/16 v6, 0x492

    if-ne v5, v6, :cond_9

    invoke-virtual {v12}, Lm0/q;->H()Z

    move-result v5

    if-nez v5, :cond_8

    goto :goto_5

    :cond_8
    invoke-virtual {v12}, Lm0/q;->Y()V

    move-object v3, v0

    move-object v4, v2

    move-object v15, v12

    goto/16 :goto_7

    :cond_9
    :goto_5
    sget-object v5, LA0/o;->a:LA0/o;

    sget-object v6, LG/l;->c:LG/f;

    sget-object v7, LA0/d;->m:LA0/g;

    const/4 v8, 0x0

    invoke-static {v6, v7, v12, v8}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v6

    iget-wide v7, v12, Lm0/q;->T:J

    invoke-static {v7, v8}, Ljava/lang/Long;->hashCode(J)I

    move-result v7

    invoke-virtual {v12}, Lm0/q;->m()Lm0/o0;

    move-result-object v8

    invoke-static {v5, v12}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v5

    sget-object v9, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v9, LZ0/g;->b:LZ0/f;

    invoke-virtual {v12}, Lm0/q;->j0()V

    iget-boolean v10, v12, Lm0/q;->S:Z

    if-eqz v10, :cond_a

    invoke-virtual {v12, v9}, Lm0/q;->l(LVm/a;)V

    goto :goto_6

    :cond_a
    invoke-virtual {v12}, Lm0/q;->t0()V

    :goto_6
    sget-object v9, LZ0/g;->f:LZ0/e;

    invoke-static {v9, v6, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v6, LZ0/g;->e:LZ0/e;

    invoke-static {v6, v8, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    sget-object v7, LZ0/g;->g:LZ0/e;

    invoke-static {v12, v6, v7}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v6, LZ0/g;->h:LZ0/d;

    invoke-static {v12, v6}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v6, LZ0/g;->d:LZ0/e;

    invoke-static {v6, v5, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v19, LG/D;->a:LG/D;

    iget-object v5, v1, Lte/c;->e:Lte/e;

    iget-object v6, v5, Lte/e;->d:Lte/p;

    iget-boolean v6, v6, Lte/p;->a:Z

    const v7, 0x7f1205fb

    invoke-static {v12, v7}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v7

    iget-object v5, v5, Lte/e;->d:Lte/p;

    iget-boolean v11, v5, Lte/p;->a:Z

    shl-int/lit8 v4, v4, 0x3

    and-int/lit16 v4, v4, 0x380

    const/4 v14, 0x0

    const/16 v16, 0x0

    const/4 v2, 0x0

    move/from16 v17, v4

    const/4 v4, 0x0

    move-object v8, v5

    const/4 v5, 0x0

    move v3, v6

    move-object v6, v7

    const/4 v7, 0x0

    move-object v9, v8

    const/4 v8, 0x0

    move-object v10, v9

    const/4 v9, 0x0

    move-object v15, v10

    const/4 v10, 0x0

    move-object/from16 v18, v15

    move-object v15, v12

    const/4 v12, 0x0

    move-object/from16 v20, v18

    const/16 v18, 0x2bdd

    move-object/from16 v0, v20

    invoke-static/range {v2 .. v18}, LP2/H;->c(LA0/r;ZLjava/lang/String;ZLjava/lang/String;Lu0/d;ZLcom/eightsleep/corepresentation/enums/CellVariant;LLg/g;ZZLVm/k;LVm/a;Lm0/l;III)V

    iget-boolean v6, v0, Lte/p;->a:Z

    new-instance v0, Lqg/u;

    const/4 v2, 0x3

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    invoke-direct {v0, v1, v3, v4, v2}, Lqg/u;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    const v2, -0x1d1f415c

    invoke-static {v2, v0, v15}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v11

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const v13, 0x180006

    const/16 v14, 0x1e

    move-object v12, v15

    move-object/from16 v5, v19

    invoke-static/range {v5 .. v14}, Lv/d;->b(LG/C;ZLA0/r;Lv/c0;Lv/d0;Ljava/lang/String;Lu0/d;Lm0/l;II)V

    const/4 v0, 0x1

    invoke-virtual {v15, v0}, Lm0/q;->q(Z)V

    :goto_7
    invoke-virtual {v15}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_b

    new-instance v0, LXe/n0;

    const/16 v6, 0xf

    move-object/from16 v2, p1

    move/from16 v5, p5

    invoke-direct/range {v0 .. v6}, LXe/n0;-><init>(Ljava/lang/Object;LVm/k;Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_b
    return-void
.end method

.method public static a0(Ljava/util/List;Ljava/util/Map;Ljava/util/List;LFf/y;ZZ)LFf/y;
    .locals 16

    move-object/from16 v1, p1

    move-object/from16 v0, p3

    move/from16 v4, p4

    const-string v2, "dateTagsMap"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "activityTags"

    move-object/from16 v3, p2

    invoke-static {v3, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object v2

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    check-cast v5, Ljava/lang/Iterable;

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const/4 v7, 0x0

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v8, v6

    check-cast v8, Ljava/time/LocalDate;

    invoke-virtual {v8, v2}, Ljava/time/LocalDate;->isAfter(Ljava/time/chrono/ChronoLocalDate;)Z

    move-result v8

    if-eqz v8, :cond_0

    goto :goto_0

    :cond_1
    move-object v6, v7

    :goto_0
    check-cast v6, Ljava/time/LocalDate;

    if-eqz v6, :cond_2

    invoke-interface {v1, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_2

    goto :goto_1

    :cond_2
    sget-object v2, LIm/z;->a:LIm/z;

    :goto_1
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_3

    goto/16 :goto_6

    :cond_3
    new-instance v5, Ljava/util/ArrayList;

    const/16 v6, 0xa

    invoke-static {v2, v6}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v8

    invoke-direct {v5, v8}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lyd/x;

    iget-object v9, v9, Lyd/x;->a:Ljava/lang/String;

    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_4
    invoke-static {v5}, LIm/r;->X1(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v5

    new-instance v8, Ljava/util/HashSet;

    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_5
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    move-object v11, v10

    check-cast v11, Lrb/b;

    const/4 v12, 0x0

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v8, v12}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_6
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_7
    :goto_4
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_8

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    move-object v10, v9

    check-cast v10, Lrb/b;

    const/4 v11, 0x0

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v5, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_7

    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    :cond_8
    new-instance v5, Ljava/util/ArrayList;

    invoke-static {v3, v6}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_9

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lrb/b;

    const/4 v9, 0x0

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v8, Lyd/x;

    const/4 v12, 0x0

    const/16 v15, 0x38

    const/4 v10, 0x1

    const/4 v11, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-direct/range {v8 .. v15}, Lyd/x;-><init>(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;I)V

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5

    :cond_9
    invoke-static {v5, v2}, LIm/r;->B1(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v2

    :goto_6
    invoke-interface/range {p0 .. p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Lc9/f;

    iget-object v6, v6, Lc9/f;->c:Lcom/eightsleep/data_ai_insights/enums/AiInsightType;

    sget-object v8, Lcom/eightsleep/data_ai_insights/enums/AiInsightType;->TAG:Lcom/eightsleep/data_ai_insights/enums/AiInsightType;

    if-ne v6, v8, :cond_a

    goto :goto_7

    :cond_b
    move-object v5, v7

    :goto_7
    check-cast v5, Lc9/f;

    if-eqz v5, :cond_10

    new-instance v8, LFf/Y0;

    iget-object v3, v5, Lc9/f;->d:Lc9/n;

    if-eqz v3, :cond_c

    iget-object v6, v3, Lc9/n;->a:Ljava/lang/String;

    move-object v9, v6

    goto :goto_8

    :cond_c
    move-object v9, v7

    :goto_8
    if-eqz v3, :cond_d

    iget-object v6, v3, Lc9/n;->b:Ljava/lang/String;

    move-object v10, v6

    goto :goto_9

    :cond_d
    move-object v10, v7

    :goto_9
    if-eqz v3, :cond_e

    iget-object v3, v3, Lc9/n;->d:Ljava/lang/String;

    move-object v11, v3

    goto :goto_a

    :cond_e
    move-object v11, v7

    :goto_a
    iget-object v3, v5, Lc9/f;->e:Lc9/g;

    iget-object v3, v3, Lc9/g;->g:Lc9/p;

    if-eqz v3, :cond_f

    iget-object v3, v3, Lc9/p;->a:Ljava/lang/String;

    move-object v12, v3

    goto :goto_b

    :cond_f
    move-object v12, v7

    :goto_b
    iget-object v13, v5, Lc9/f;->b:Lcom/eightsleep/data_ai_insights/enums/AiInsightState;

    invoke-direct/range {v8 .. v13}, LFf/Y0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_ai_insights/enums/AiInsightState;)V

    move-object v5, v8

    goto :goto_c

    :cond_10
    move-object v5, v7

    :goto_c
    if-eqz v0, :cond_11

    iget-boolean v3, v0, LFf/y;->f:Z

    if-eq v3, v4, :cond_11

    move-object v0, v7

    :cond_11
    if-eqz v0, :cond_13

    invoke-static {v2, v4}, Lwg/m1;->a(Ljava/util/List;Z)Lwg/n1;

    move-result-object v2

    iget-object v3, v0, LFf/y;->d:Lwg/n1;

    iget-object v2, v2, Lwg/n1;->c:Ljava/util/List;

    const/4 v6, 0x3

    invoke-static {v3, v7, v7, v2, v6}, Lwg/n1;->f(Lwg/n1;Ljava/util/List;Ljava/lang/String;Ljava/util/List;I)Lwg/n1;

    move-result-object v2

    if-nez v5, :cond_12

    iget-object v5, v0, LFf/y;->e:LFf/Y0;

    :cond_12
    move-object v3, v5

    const/4 v6, 0x3

    move/from16 v5, p5

    invoke-static/range {v0 .. v6}, LFf/y;->c(LFf/y;Ljava/util/Map;Lwg/n1;LFf/Y0;ZZI)LFf/y;

    move-result-object v0

    return-object v0

    :cond_13
    new-instance v0, LFf/y;

    invoke-static {v2, v4}, Lwg/m1;->a(Ljava/util/List;Z)Lwg/n1;

    move-result-object v1

    move-object v4, v1

    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object/from16 v3, p1

    move/from16 v6, p4

    move/from16 v7, p5

    invoke-direct/range {v0 .. v7}, LFf/y;-><init>(ZZLjava/util/Map;Lwg/n1;LFf/Y0;ZZ)V

    return-object v0
.end method

.method public static final b(LA0/r;Lcom/eightsleep/presentation_alarm/viewmodel/AlarmSettingsViewModel;LVm/k;LVm/k;Lm0/l;I)V
    .locals 12

    const-string v1, "modifier"

    invoke-static {p0, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "onNavEvent"

    invoke-static {p2, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "onOneTimeEvent"

    invoke-static {p3, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v9, p4

    check-cast v9, Lm0/q;

    const v1, 0xf023cc0

    invoke-virtual {v9, v1}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v9, p0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x4

    goto :goto_0

    :cond_0
    const/4 v1, 0x2

    :goto_0
    or-int v1, p5, v1

    invoke-virtual {v9, p1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    const/16 v5, 0x20

    goto :goto_1

    :cond_1
    const/16 v5, 0x10

    :goto_1
    or-int/2addr v1, v5

    invoke-virtual {v9, p2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    const/16 v5, 0x100

    goto :goto_2

    :cond_2
    const/16 v5, 0x80

    :goto_2
    or-int/2addr v1, v5

    invoke-virtual {v9, p3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    const/16 v5, 0x800

    goto :goto_3

    :cond_3
    const/16 v5, 0x400

    :goto_3
    or-int/2addr v1, v5

    and-int/lit16 v5, v1, 0x493

    const/16 v6, 0x492

    if-ne v5, v6, :cond_5

    invoke-virtual {v9}, Lm0/q;->H()Z

    move-result v5

    if-nez v5, :cond_4

    goto :goto_4

    :cond_4
    invoke-virtual {v9}, Lm0/q;->Y()V

    goto :goto_5

    :cond_5
    :goto_4
    sget-object v8, Lue/w;->a:Lu0/d;

    and-int/lit8 v5, v1, 0xe

    const/high16 v6, 0x6c00000

    or-int/2addr v5, v6

    and-int/lit8 v6, v1, 0x70

    or-int/2addr v5, v6

    shr-int/lit8 v6, v1, 0x3

    and-int/lit16 v6, v6, 0x380

    or-int/2addr v5, v6

    shl-int/lit8 v1, v1, 0x3

    and-int/lit16 v1, v1, 0x1c00

    or-int v10, v5, v1

    const/4 v6, 0x0

    const-string v7, "alarm_vibration"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v11, 0x70

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v2, p3

    invoke-static/range {v0 .. v11}, LP2/o;->g(LA0/r;LL8/e;LVm/k;LVm/k;ZZLH0/w;Ljava/lang/String;LVm/r;Lm0/l;II)V

    :goto_5
    invoke-virtual {v9}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_6

    new-instance v0, Lue/c;

    const/4 v6, 0x5

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move/from16 v5, p5

    invoke-direct/range {v0 .. v6}, Lue/c;-><init>(LA0/r;Lcom/eightsleep/presentation_alarm/viewmodel/AlarmSettingsViewModel;LVm/k;LVm/k;II)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_6
    return-void
.end method

.method public static b0(Lcom/google/gson/o;)Lz7/l0;
    .locals 2

    const-string v0, "Unable to parse json into type Csp"

    :try_start_0
    const-string v1, "disposition"

    invoke-virtual {p0, v1}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/google/gson/m;->k()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_0

    sget-object v1, Lz7/t0;->Companion:Lz7/s0;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Lz7/s0;->a(Ljava/lang/String;)Lz7/t0;

    move-result-object p0

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_1

    :catch_1
    move-exception p0

    goto :goto_2

    :catch_2
    move-exception p0

    goto :goto_3

    :cond_0
    const/4 p0, 0x0

    :goto_0
    new-instance v1, Lz7/l0;

    invoke-direct {v1, p0}, Lz7/l0;-><init>(Lz7/t0;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :goto_1
    new-instance v1, Lcom/google/gson/JsonParseException;

    invoke-direct {v1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :goto_2
    new-instance v1, Lcom/google/gson/JsonParseException;

    invoke-direct {v1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :goto_3
    new-instance v1, Lcom/google/gson/JsonParseException;

    invoke-direct {v1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static final c(LA0/o;ZLH0/w;Lcom/eightsleep/data_core/enums/YesNo;LVm/k;LVm/a;Lm0/l;II)V
    .locals 28

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    const-string v0, "onSaveClicked"

    invoke-static {v5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v11, p6

    check-cast v11, Lm0/q;

    const v0, -0x205d0959

    invoke-virtual {v11, v0}, Lm0/q;->h0(I)Lm0/q;

    or-int/lit8 v0, p7, 0x30

    move/from16 v2, p1

    invoke-virtual {v11, v2}, Lm0/q;->h(Z)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0x100

    goto :goto_0

    :cond_0
    const/16 v1, 0x80

    :goto_0
    or-int/2addr v0, v1

    and-int/lit8 v1, p8, 0x4

    if-eqz v1, :cond_1

    or-int/lit16 v0, v0, 0xc00

    move-object/from16 v3, p2

    goto :goto_2

    :cond_1
    move-object/from16 v3, p2

    invoke-virtual {v11, v3}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    const/16 v7, 0x800

    goto :goto_1

    :cond_2
    const/16 v7, 0x400

    :goto_1
    or-int/2addr v0, v7

    :goto_2
    invoke-virtual {v11, v4}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    const/16 v7, 0x4000

    goto :goto_3

    :cond_3
    const/16 v7, 0x2000

    :goto_3
    or-int/2addr v0, v7

    const/high16 v7, 0x30000

    or-int/2addr v0, v7

    invoke-virtual {v11, v5}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    const/high16 v7, 0x100000

    goto :goto_4

    :cond_4
    const/high16 v7, 0x80000

    :goto_4
    or-int/2addr v0, v7

    invoke-virtual {v11, v6}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    const/high16 v7, 0x800000

    goto :goto_5

    :cond_5
    const/high16 v7, 0x400000

    :goto_5
    or-int/2addr v0, v7

    const v7, 0x492493

    and-int/2addr v7, v0

    const v8, 0x492492

    if-ne v7, v8, :cond_7

    invoke-virtual {v11}, Lm0/q;->H()Z

    move-result v7

    if-nez v7, :cond_6

    goto :goto_6

    :cond_6
    invoke-virtual {v11}, Lm0/q;->Y()V

    move-object/from16 v1, p0

    goto/16 :goto_e

    :cond_7
    :goto_6
    sget-object v15, LA0/o;->a:LA0/o;

    const/16 v16, 0x0

    if-eqz v1, :cond_8

    move-object/from16 v3, v16

    :cond_8
    const v1, 0x4d798537    # 2.6164107E8f

    invoke-virtual {v11, v1}, Lm0/q;->f0(I)V

    invoke-virtual {v11}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v1

    sget-object v7, Lm0/k;->a:Lm0/e;

    if-ne v1, v7, :cond_9

    invoke-static {v4}, Lm0/r;->C(Ljava/lang/Object;)Lm0/i0;

    move-result-object v1

    invoke-virtual {v11, v1}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_9
    check-cast v1, Lm0/Z;

    const/4 v8, 0x0

    invoke-virtual {v11, v8}, Lm0/q;->q(Z)V

    invoke-interface {v1}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v9

    const/4 v10, 0x1

    if-eqz v9, :cond_a

    invoke-interface {v1}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v9

    if-eq v9, v4, :cond_a

    move v12, v10

    goto :goto_7

    :cond_a
    move v12, v8

    :goto_7
    const/high16 v9, 0x3f800000    # 1.0f

    invoke-static {v15, v9}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v13

    move-object/from16 p0, v15

    float-to-double v14, v9

    const-wide/16 v17, 0x0

    cmpl-double v14, v14, v17

    if-lez v14, :cond_b

    goto :goto_8

    :cond_b
    const-string v14, "invalid weight; must be greater than zero"

    invoke-static {v14}, LH/a;->a(Ljava/lang/String;)V

    :goto_8
    new-instance v14, LG/x0;

    const v15, 0x7f7fffff    # Float.MAX_VALUE

    cmpl-float v17, v9, v15

    if-lez v17, :cond_c

    move v9, v15

    :cond_c
    invoke-direct {v14, v9, v10}, LG/x0;-><init>(FZ)V

    invoke-interface {v13, v14}, LA0/r;->then(LA0/r;)LA0/r;

    move-result-object v9

    invoke-static {}, Lcom/eightsleep/data_core/enums/YesNo;->getEntries()LOm/a;

    move-result-object v13

    invoke-static {v13}, LIm/r;->X1(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v13

    check-cast v13, Ljava/lang/Iterable;

    new-instance v14, Ljava/util/ArrayList;

    const/16 v15, 0xa

    invoke-static {v13, v15}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v15

    invoke-direct {v14, v15}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v13}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_9
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_d

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/eightsleep/data_core/enums/YesNo;

    new-instance v10, LKf/n;

    invoke-direct {v10, v15, v11, v1}, LKf/n;-><init>(Lcom/eightsleep/data_core/enums/YesNo;Lm0/l;Lm0/Z;)V

    invoke-virtual {v14, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v10, 0x1

    goto :goto_9

    :cond_d
    const v10, 0x4d79d71d    # 2.6197653E8f

    invoke-virtual {v11, v10}, Lm0/q;->f0(I)V

    invoke-virtual {v11}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v10

    if-ne v10, v7, :cond_e

    new-instance v10, LCg/D;

    const/4 v13, 0x7

    invoke-direct {v10, v1, v13}, LCg/D;-><init>(Lm0/Z;I)V

    invoke-virtual {v11, v10}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_e
    check-cast v10, LVm/n;

    invoke-virtual {v11, v8}, Lm0/q;->q(Z)V

    const/16 v13, 0x8

    move-object v15, v7

    move-object v7, v9

    move-object v9, v10

    const/4 v10, 0x0

    move/from16 v17, v12

    const/4 v12, 0x0

    move-object/from16 v22, v14

    move v14, v8

    move-object/from16 v8, v22

    move/from16 v23, v0

    move/from16 v0, v17

    const/16 v22, 0x1

    invoke-static/range {v7 .. v13}, LP2/J;->p(LA0/r;Ljava/util/List;LVm/n;Lu0/d;Lm0/l;II)V

    invoke-static {v11, v14}, LP2/z;->J(Lm0/l;I)V

    const v7, 0x4d79ecbf    # 2.6206514E8f

    invoke-virtual {v11, v7}, Lm0/q;->f0(I)V

    const/high16 v24, 0x1c00000

    const/high16 v25, 0x380000

    const v7, 0x7f12036c

    if-nez v6, :cond_f

    move-object/from16 v2, p0

    move v10, v0

    move v0, v14

    move-object/from16 v27, v15

    goto/16 :goto_c

    :cond_f
    sget-object v6, LOg/v;->DARK:LOg/v;

    move v8, v7

    invoke-static {v11, v8}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v7

    const v9, 0x7f120383

    invoke-static {v11, v9}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v9

    const v10, 0x4d7a2092    # 2.622774E8f

    invoke-virtual {v11, v10}, Lm0/q;->f0(I)V

    if-nez v3, :cond_10

    invoke-static {v11}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v10

    iget-object v10, v10, Lhh/h;->k:Lhh/v;

    iget-wide v12, v10, Lhh/v;->d:J

    goto :goto_a

    :cond_10
    iget-wide v12, v3, LH0/w;->a:J

    :goto_a
    invoke-virtual {v11, v14}, Lm0/q;->q(Z)V

    new-instance v10, LH0/w;

    invoke-direct {v10, v12, v13}, LH0/w;-><init>(J)V

    const v12, -0x6120e37b

    invoke-virtual {v11, v12}, Lm0/q;->f0(I)V

    invoke-virtual {v11, v0}, Lm0/q;->h(Z)Z

    move-result v12

    and-int v13, v23, v25

    const/high16 v8, 0x100000

    if-ne v13, v8, :cond_11

    move/from16 v13, v22

    goto :goto_b

    :cond_11
    move v13, v14

    :goto_b
    or-int/2addr v12, v13

    invoke-virtual {v11}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v13

    if-nez v12, :cond_12

    if-ne v13, v15, :cond_13

    :cond_12
    new-instance v13, LNe/e;

    const/4 v12, 0x2

    invoke-direct {v13, v0, v5, v1, v12}, LNe/e;-><init>(ZLVm/k;Lm0/Z;I)V

    invoke-virtual {v11, v13}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_13
    check-cast v13, LVm/a;

    invoke-virtual {v11, v14}, Lm0/q;->q(Z)V

    shl-int/lit8 v12, v23, 0xf

    and-int v12, v12, v24

    or-int/lit8 v19, v12, 0x6

    shr-int/lit8 v12, v23, 0x12

    and-int/lit8 v20, v12, 0x70

    const/4 v12, 0x0

    move/from16 v17, v14

    const/4 v14, 0x0

    move/from16 v18, v8

    move-object v8, v9

    const/4 v9, 0x0

    move/from16 v21, v18

    move-object/from16 v18, v11

    const/4 v11, 0x0

    move/from16 v26, v21

    const/16 v21, 0x168

    move-object/from16 v16, v13

    move-object/from16 v27, v15

    move v13, v2

    move-object v15, v10

    move-object/from16 v2, p0

    move v10, v0

    move/from16 v0, v17

    move-object/from16 v17, p5

    invoke-static/range {v6 .. v21}, LX4/x;->f(LOg/v;Ljava/lang/String;Ljava/lang/String;ZZZZZZLH0/w;LVm/a;LVm/a;Lm0/l;III)V

    move-object/from16 v11, v18

    sget-object v16, LHm/B;->a:LHm/B;

    :goto_c
    invoke-virtual {v11, v0}, Lm0/q;->q(Z)V

    if-nez v16, :cond_17

    sget-object v6, LOg/e;->b:LOg/e;

    const v8, 0x7f12036c

    invoke-static {v11, v8}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v8

    const v7, 0x4d7a3d26    # 2.6239446E8f

    invoke-virtual {v11, v7}, Lm0/q;->f0(I)V

    invoke-virtual {v11, v10}, Lm0/q;->h(Z)Z

    move-result v7

    and-int v9, v23, v25

    const/high16 v12, 0x100000

    if-ne v9, v12, :cond_14

    goto :goto_d

    :cond_14
    move/from16 v22, v0

    :goto_d
    or-int v7, v7, v22

    invoke-virtual {v11}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v9

    if-nez v7, :cond_15

    move-object/from16 v15, v27

    if-ne v9, v15, :cond_16

    :cond_15
    new-instance v9, LNe/e;

    const/4 v7, 0x3

    invoke-direct {v9, v10, v5, v1, v7}, LNe/e;-><init>(ZLVm/k;Lm0/Z;I)V

    invoke-virtual {v11, v9}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_16
    move-object/from16 v16, v9

    check-cast v16, LVm/a;

    invoke-virtual {v11, v0}, Lm0/q;->q(Z)V

    shl-int/lit8 v0, v23, 0xf

    and-int v18, v0, v24

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    move v12, v10

    const/4 v10, 0x0

    move-object/from16 v17, v11

    const/4 v11, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x33d

    move/from16 v13, p1

    invoke-virtual/range {v6 .. v20}, LOg/e;->g(LA0/r;Ljava/lang/String;Ljava/lang/Integer;Lhh/n;Lhh/d;ZZLhh/e;LJg/b;LVm/a;Lm0/l;III)V

    move-object/from16 v11, v17

    :cond_17
    move-object v1, v2

    :goto_e
    invoke-virtual {v11}, Lm0/q;->u()Lm0/t0;

    move-result-object v9

    if-eqz v9, :cond_18

    new-instance v0, LAh/a0;

    move/from16 v2, p1

    move-object/from16 v6, p5

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-direct/range {v0 .. v8}, LAh/a0;-><init>(LA0/o;ZLH0/w;Lcom/eightsleep/data_core/enums/YesNo;LVm/k;LVm/a;II)V

    iput-object v0, v9, Lm0/t0;->d:LVm/n;

    :cond_18
    return-void
.end method

.method public static c0(Lcom/google/gson/o;)Lz7/R2;
    .locals 5

    const-string v0, "Unable to parse json into type Ssl"

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

    new-instance p0, Lz7/R2;

    invoke-direct {p0, v1, v2, v3, v4}, Lz7/R2;-><init>(JJ)V
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

.method public static d(LH0/f;I)Landroidx/compose/ui/graphics/painter/BitmapPainter;
    .locals 7

    iget-object v0, p0, LH0/f;->a:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    int-to-long v1, v1

    const/16 v3, 0x20

    shl-long/2addr v1, v3

    int-to-long v3, v0

    const-wide v5, 0xffffffffL

    and-long/2addr v3, v5

    or-long v0, v1, v3

    new-instance v2, Landroidx/compose/ui/graphics/painter/BitmapPainter;

    invoke-direct {v2, p0, v0, v1}, Landroidx/compose/ui/graphics/painter/BitmapPainter;-><init>(LH0/f;J)V

    iput p1, v2, Landroidx/compose/ui/graphics/painter/BitmapPainter;->c:I

    return-object v2
.end method

.method public static d0(Ljava/util/Collection;)Lan/k;
    .locals 3

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lan/k;

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result p0

    const/4 v1, 0x1

    sub-int/2addr p0, v1

    const/4 v2, 0x0

    invoke-direct {v0, v2, p0, v1}, Lan/i;-><init>(III)V

    return-object v0
.end method

.method public static final e(Ljava/lang/String;IILm0/l;I)V
    .locals 19

    move/from16 v2, p1

    move/from16 v3, p2

    move-object/from16 v14, p3

    check-cast v14, Lm0/q;

    const v0, -0x49575e8f

    invoke-virtual {v14, v0}, Lm0/q;->h0(I)Lm0/q;

    move-object/from16 v1, p0

    invoke-virtual {v14, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int v0, p4, v0

    invoke-virtual {v14, v2}, Lm0/q;->e(I)Z

    move-result v4

    if-eqz v4, :cond_1

    const/16 v4, 0x20

    goto :goto_1

    :cond_1
    const/16 v4, 0x10

    :goto_1
    or-int/2addr v0, v4

    invoke-virtual {v14, v3}, Lm0/q;->e(I)Z

    move-result v4

    if-eqz v4, :cond_2

    const/16 v4, 0x100

    goto :goto_2

    :cond_2
    const/16 v4, 0x80

    :goto_2
    or-int/2addr v0, v4

    and-int/lit16 v4, v0, 0x93

    const/16 v5, 0x92

    if-ne v4, v5, :cond_4

    invoke-virtual {v14}, Lm0/q;->H()Z

    move-result v4

    if-nez v4, :cond_3

    goto :goto_3

    :cond_3
    invoke-virtual {v14}, Lm0/q;->Y()V

    goto/16 :goto_6

    :cond_4
    :goto_3
    sget-object v4, LA0/d;->k:LA0/h;

    sget-object v5, LA0/o;->a:LA0/o;

    sget-object v6, LG/l;->a:LG/d;

    const/16 v7, 0x30

    invoke-static {v6, v4, v14, v7}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v4

    iget-wide v6, v14, Lm0/q;->T:J

    invoke-static {v6, v7}, Ljava/lang/Long;->hashCode(J)I

    move-result v6

    invoke-virtual {v14}, Lm0/q;->m()Lm0/o0;

    move-result-object v7

    invoke-static {v5, v14}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v5

    sget-object v8, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v8, LZ0/g;->b:LZ0/f;

    invoke-virtual {v14}, Lm0/q;->j0()V

    iget-boolean v9, v14, Lm0/q;->S:Z

    if-eqz v9, :cond_5

    invoke-virtual {v14, v8}, Lm0/q;->l(LVm/a;)V

    goto :goto_4

    :cond_5
    invoke-virtual {v14}, Lm0/q;->t0()V

    :goto_4
    sget-object v8, LZ0/g;->f:LZ0/e;

    invoke-static {v8, v4, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v4, LZ0/g;->e:LZ0/e;

    invoke-static {v4, v7, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    sget-object v6, LZ0/g;->g:LZ0/e;

    invoke-static {v14, v4, v6}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v4, LZ0/g;->h:LZ0/d;

    invoke-static {v14, v4}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v4, LZ0/g;->d:LZ0/e;

    invoke-static {v4, v5, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v4, Lih/h;->d:Lih/h;

    const/high16 v5, 0x3f800000    # 1.0f

    float-to-double v6, v5

    const-wide/16 v8, 0x0

    cmpl-double v6, v6, v8

    if-lez v6, :cond_6

    goto :goto_5

    :cond_6
    const-string v6, "invalid weight; must be greater than zero"

    invoke-static {v6}, LH/a;->a(Ljava/lang/String;)V

    :goto_5
    new-instance v6, LG/x0;

    const/4 v7, 0x1

    invoke-direct {v6, v5, v7}, LG/x0;-><init>(FZ)V

    const v5, 0x7f120b9b

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v8

    invoke-static {v5, v8, v14}, LP2/j;->H(I[Ljava/lang/Object;Lm0/l;)Ljava/lang/String;

    move-result-object v5

    const/4 v13, 0x0

    const/4 v15, 0x0

    move v8, v7

    const/4 v7, 0x0

    move v10, v8

    const-wide/16 v8, 0x0

    move v11, v10

    const/4 v10, 0x0

    move v12, v11

    const/4 v11, 0x0

    move/from16 v16, v12

    const/4 v12, 0x0

    move/from16 v17, v16

    const/16 v16, 0x0

    move/from16 v18, v17

    const/16 v17, 0x3fc

    move/from16 p3, v0

    move/from16 v0, v18

    invoke-virtual/range {v4 .. v17}, Lih/h;->o(Ljava/lang/String;LA0/r;Lk1/U;JIZIILm0/l;III)V

    const/4 v4, 0x0

    invoke-static {v14, v4}, LP2/z;->l(Lm0/l;I)V

    shr-int/lit8 v4, p3, 0x3

    and-int/lit8 v4, v4, 0x7e

    invoke-static {v2, v3, v4, v14}, LIm/s;->f(IIILm0/l;)V

    invoke-virtual {v14, v0}, Lm0/q;->q(Z)V

    :goto_6
    invoke-virtual {v14}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_7

    new-instance v0, LWf/z0;

    const/4 v5, 0x1

    move/from16 v4, p4

    invoke-direct/range {v0 .. v5}, LWf/z0;-><init>(Ljava/lang/String;IIII)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_7
    return-void
.end method

.method public static e0(Ljava/util/List;)I
    .locals 1

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    add-int/lit8 p0, p0, -0x1

    return p0
.end method

.method public static final f(IIILm0/l;)V
    .locals 10

    const/4 v0, 0x1

    check-cast p3, Lm0/q;

    const v1, -0x139aa43e

    invoke-virtual {p3, v1}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v1, p2, 0x6

    const/4 v2, 0x4

    if-nez v1, :cond_1

    invoke-virtual {p3, p0}, Lm0/q;->e(I)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    const/4 v1, 0x2

    :goto_0
    or-int/2addr v1, p2

    goto :goto_1

    :cond_1
    move v1, p2

    :goto_1
    and-int/lit8 v3, p2, 0x30

    if-nez v3, :cond_3

    invoke-virtual {p3, p1}, Lm0/q;->e(I)Z

    move-result v3

    if-eqz v3, :cond_2

    const/16 v3, 0x20

    goto :goto_2

    :cond_2
    const/16 v3, 0x10

    :goto_2
    or-int/2addr v1, v3

    :cond_3
    and-int/lit8 v1, v1, 0x13

    const/16 v3, 0x12

    if-ne v1, v3, :cond_5

    invoke-virtual {p3}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_4

    goto :goto_3

    :cond_4
    invoke-virtual {p3}, Lm0/q;->Y()V

    goto/16 :goto_8

    :cond_5
    :goto_3
    sget-object v1, LG/l;->a:LG/d;

    invoke-static {p3}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v1

    iget v1, v1, Lhh/i;->b:F

    invoke-static {v1}, LG/l;->g(F)LG/j;

    move-result-object v1

    sget-object v3, LA0/o;->a:LA0/o;

    sget-object v4, LA0/d;->j:LA0/h;

    const/4 v5, 0x0

    invoke-static {v1, v4, p3, v5}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v1

    iget-wide v6, p3, Lm0/q;->T:J

    invoke-static {v6, v7}, Ljava/lang/Long;->hashCode(J)I

    move-result v4

    invoke-virtual {p3}, Lm0/q;->m()Lm0/o0;

    move-result-object v6

    invoke-static {v3, p3}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v7

    sget-object v8, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v8, LZ0/g;->b:LZ0/f;

    invoke-virtual {p3}, Lm0/q;->j0()V

    iget-boolean v9, p3, Lm0/q;->S:Z

    if-eqz v9, :cond_6

    invoke-virtual {p3, v8}, Lm0/q;->l(LVm/a;)V

    goto :goto_4

    :cond_6
    invoke-virtual {p3}, Lm0/q;->t0()V

    :goto_4
    sget-object v8, LZ0/g;->f:LZ0/e;

    invoke-static {v8, v1, p3}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v1, LZ0/g;->e:LZ0/e;

    invoke-static {v1, v6, p3}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v4, LZ0/g;->g:LZ0/e;

    invoke-static {p3, v1, v4}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v1, LZ0/g;->h:LZ0/d;

    invoke-static {p3, v1}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v1, LZ0/g;->d:LZ0/e;

    invoke-static {v1, v7, p3}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const v1, 0x29855b96

    invoke-virtual {p3, v1}, Lm0/q;->f0(I)V

    if-ge p1, v0, :cond_7

    move v1, v0

    goto :goto_5

    :cond_7
    move v1, p1

    :goto_5
    move v4, v5

    :goto_6
    if-ge v4, v1, :cond_9

    if-ge v4, p0, :cond_8

    move v6, v0

    goto :goto_7

    :cond_8
    move v6, v5

    :goto_7
    invoke-static {p3}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v7

    iget v7, v7, Lhh/i;->d:F

    invoke-static {v3, v7}, Landroidx/compose/foundation/layout/b;->s(LA0/r;F)LA0/r;

    move-result-object v7

    int-to-float v8, v2

    invoke-static {v7, v8}, Landroidx/compose/foundation/layout/b;->e(LA0/r;F)LA0/r;

    move-result-object v7

    invoke-static {v5, v7, p3, v6}, LIm/s;->H(ILA0/r;Lm0/l;Z)V

    add-int/2addr v4, v0

    goto :goto_6

    :cond_9
    invoke-virtual {p3, v5}, Lm0/q;->q(Z)V

    invoke-virtual {p3, v0}, Lm0/q;->q(Z)V

    :goto_8
    invoke-virtual {p3}, Lm0/q;->u()Lm0/t0;

    move-result-object p3

    if-eqz p3, :cond_a

    new-instance v0, LWf/Q0;

    invoke-direct {v0, p0, p1, p2}, LWf/Q0;-><init>(III)V

    iput-object v0, p3, Lm0/t0;->d:LVm/n;

    :cond_a
    return-void
.end method

.method public static f0(Ljava/lang/Object;)Ljava/util/List;
    .locals 1

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    const-string v0, "singletonList(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static final g(Ljava/lang/String;Lm0/l;I)V
    .locals 15

    move/from16 v0, p2

    move-object/from16 v11, p1

    check-cast v11, Lm0/q;

    const v1, 0x3f78fd97

    invoke-virtual {v11, v1}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v11, p0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x2

    if-eqz v1, :cond_0

    const/4 v1, 0x4

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    or-int/2addr v1, v0

    and-int/lit8 v3, v1, 0x3

    if-ne v3, v2, :cond_1

    invoke-virtual {v11}, Lm0/q;->H()Z

    move-result v2

    if-nez v2, :cond_2

    :cond_1
    move v2, v1

    goto :goto_1

    :cond_2
    invoke-virtual {v11}, Lm0/q;->Y()V

    goto :goto_2

    :goto_1
    sget-object v1, Lih/h;->b:Lih/h;

    sget-object v3, LA0/o;->a:LA0/o;

    const v4, 0x1f8939df

    invoke-virtual {v11, v4}, Lm0/q;->f0(I)V

    invoke-virtual {v11}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v4

    sget-object v5, Lm0/k;->a:Lm0/e;

    if-ne v4, v5, :cond_3

    new-instance v4, Lk1/I;

    const/16 v5, 0x10

    invoke-direct {v4, v5}, Lk1/I;-><init>(I)V

    invoke-virtual {v11, v4}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_3
    check-cast v4, LVm/k;

    const/4 v5, 0x0

    invoke-virtual {v11, v5}, Lm0/q;->q(Z)V

    invoke-static {v3, v4}, Lh1/o;->b(LA0/r;LVm/k;)LA0/r;

    move-result-object v3

    invoke-static {v11}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v4

    iget-object v4, v4, Lhh/h;->k:Lhh/v;

    iget-wide v4, v4, Lhh/v;->c:J

    and-int/lit8 v12, v2, 0xe

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v6, 0x5

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v13, 0x0

    const/16 v14, 0x3e4

    move-object v2, p0

    invoke-virtual/range {v1 .. v14}, Lih/h;->z(Ljava/lang/String;LA0/r;JIZIILVm/k;Lm0/l;III)V

    :goto_2
    invoke-virtual {v11}, Lm0/q;->u()Lm0/t0;

    move-result-object v1

    if-eqz v1, :cond_4

    new-instance v3, LAg/f0;

    const/16 v4, 0xd

    invoke-direct {v3, p0, v0, v4}, LAg/f0;-><init>(Ljava/lang/String;II)V

    iput-object v3, v1, Lm0/t0;->d:LVm/n;

    :cond_4
    return-void
.end method

.method public static varargs g0([Ljava/lang/Object;)Ljava/util/List;
    .locals 1

    const-string v0, "elements"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    array-length v0, p0

    if-lez v0, :cond_0

    invoke-static {p0}, LIm/n;->O([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_0
    sget-object p0, LIm/z;->a:LIm/z;

    return-object p0
.end method

.method public static final h(Lkf/b;LVm/k;LA0/r;Lm0/l;I)V
    .locals 20

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v4, p4

    move-object/from16 v11, p3

    check-cast v11, Lm0/q;

    const v5, -0x672830ab

    invoke-virtual {v11, v5}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v5, v4, 0x6

    if-nez v5, :cond_1

    invoke-virtual {v11, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x4

    goto :goto_0

    :cond_0
    const/4 v5, 0x2

    :goto_0
    or-int/2addr v5, v4

    goto :goto_1

    :cond_1
    move v5, v4

    :goto_1
    and-int/lit8 v6, v4, 0x30

    const/16 v14, 0x20

    if-nez v6, :cond_3

    invoke-virtual {v11, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    move v6, v14

    goto :goto_2

    :cond_2
    const/16 v6, 0x10

    :goto_2
    or-int/2addr v5, v6

    :cond_3
    and-int/lit16 v6, v4, 0x180

    if-nez v6, :cond_5

    invoke-virtual {v11, v3}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    const/16 v6, 0x100

    goto :goto_3

    :cond_4
    const/16 v6, 0x80

    :goto_3
    or-int/2addr v5, v6

    :cond_5
    and-int/lit16 v6, v5, 0x93

    const/16 v7, 0x92

    if-ne v6, v7, :cond_7

    invoke-virtual {v11}, Lm0/q;->H()Z

    move-result v6

    if-nez v6, :cond_6

    goto :goto_4

    :cond_6
    invoke-virtual {v11}, Lm0/q;->Y()V

    goto/16 :goto_8

    :cond_7
    :goto_4
    sget-object v6, LG/l;->a:LG/d;

    invoke-static {v11}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v6

    iget v6, v6, Lhh/i;->c:F

    invoke-static {v6}, LG/l;->g(F)LG/j;

    move-result-object v6

    sget-object v7, LA0/d;->m:LA0/g;

    const/4 v15, 0x0

    invoke-static {v6, v7, v11, v15}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v6

    iget-wide v7, v11, Lm0/q;->T:J

    invoke-static {v7, v8}, Ljava/lang/Long;->hashCode(J)I

    move-result v7

    invoke-virtual {v11}, Lm0/q;->m()Lm0/o0;

    move-result-object v8

    invoke-static {v3, v11}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v9

    sget-object v10, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v10, LZ0/g;->b:LZ0/f;

    invoke-virtual {v11}, Lm0/q;->j0()V

    iget-boolean v12, v11, Lm0/q;->S:Z

    if-eqz v12, :cond_8

    invoke-virtual {v11, v10}, Lm0/q;->l(LVm/a;)V

    goto :goto_5

    :cond_8
    invoke-virtual {v11}, Lm0/q;->t0()V

    :goto_5
    sget-object v10, LZ0/g;->f:LZ0/e;

    invoke-static {v10, v6, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v6, LZ0/g;->e:LZ0/e;

    invoke-static {v6, v8, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    sget-object v7, LZ0/g;->g:LZ0/e;

    invoke-static {v11, v6, v7}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v6, LZ0/g;->h:LZ0/d;

    invoke-static {v11, v6}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v6, LZ0/g;->d:LZ0/e;

    invoke-static {v6, v9, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const v6, 0x7f12070e

    invoke-static {v11, v6}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v6

    move v7, v5

    iget-boolean v5, v1, Lkf/b;->b:Z

    const v8, 0x39824a43

    invoke-virtual {v11, v8}, Lm0/q;->f0(I)V

    and-int/lit8 v7, v7, 0x70

    if-ne v7, v14, :cond_9

    const/4 v9, 0x1

    goto :goto_6

    :cond_9
    move v9, v15

    :goto_6
    invoke-virtual {v11}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v10

    sget-object v12, Lm0/k;->a:Lm0/e;

    if-nez v9, :cond_a

    if-ne v10, v12, :cond_b

    :cond_a
    new-instance v10, Leg/a;

    const/16 v9, 0xf

    invoke-direct {v10, v9, v2}, Leg/a;-><init>(ILVm/k;)V

    invoke-virtual {v11, v10}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_b
    check-cast v10, LVm/k;

    invoke-virtual {v11, v15}, Lm0/q;->q(Z)V

    sget-object v9, LA0/o;->a:LA0/o;

    const v13, 0x3982561b

    invoke-virtual {v11, v13}, Lm0/q;->f0(I)V

    invoke-virtual {v11, v6}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v13

    invoke-virtual {v11}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v8

    if-nez v13, :cond_c

    if-ne v8, v12, :cond_d

    :cond_c
    new-instance v8, Lab/a;

    const/16 v13, 0xc

    invoke-direct {v8, v6, v13}, Lab/a;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v11, v8}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_d
    check-cast v8, LVm/k;

    invoke-virtual {v11, v15}, Lm0/q;->q(Z)V

    invoke-static {v9, v15, v8}, Lh1/o;->c(LA0/r;ZLVm/k;)LA0/r;

    move-result-object v6

    move v8, v7

    move-object v7, v6

    move-object v6, v10

    sget-object v10, Lmf/b;->a:Lu0/d;

    move v13, v8

    const/4 v8, 0x0

    move-object/from16 v16, v9

    const/4 v9, 0x0

    move-object/from16 v17, v12

    const/high16 v12, 0x30000

    move/from16 v18, v13

    const/16 v13, 0x18

    move-object/from16 v19, v16

    move-object/from16 v0, v17

    move/from16 v15, v18

    invoke-static/range {v5 .. v13}, LP2/K;->e(ZLVm/k;LA0/r;ZLG/h;Lu0/d;Lm0/l;II)V

    const v5, 0x7f120710

    invoke-static {v11, v5}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v5

    const v6, 0x398297ab

    invoke-virtual {v11, v6}, Lm0/q;->f0(I)V

    if-ne v15, v14, :cond_e

    const/4 v8, 0x1

    goto :goto_7

    :cond_e
    const/4 v8, 0x0

    :goto_7
    invoke-virtual {v11}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v6

    if-nez v8, :cond_f

    if-ne v6, v0, :cond_10

    :cond_f
    new-instance v6, Leg/a;

    const/16 v7, 0x10

    invoke-direct {v6, v7, v2}, Leg/a;-><init>(ILVm/k;)V

    invoke-virtual {v11, v6}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_10
    check-cast v6, LVm/k;

    const/4 v7, 0x0

    invoke-virtual {v11, v7}, Lm0/q;->q(Z)V

    const v7, 0x3982a47c

    invoke-virtual {v11, v7}, Lm0/q;->f0(I)V

    invoke-virtual {v11, v5}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v7

    invoke-virtual {v11}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v8

    if-nez v7, :cond_11

    if-ne v8, v0, :cond_12

    :cond_11
    new-instance v8, Lab/a;

    const/16 v0, 0xd

    invoke-direct {v8, v5, v0}, Lab/a;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v11, v8}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_12
    check-cast v8, LVm/k;

    const/4 v7, 0x0

    invoke-virtual {v11, v7}, Lm0/q;->q(Z)V

    move-object/from16 v0, v19

    invoke-static {v0, v7, v8}, Lh1/o;->c(LA0/r;ZLVm/k;)LA0/r;

    move-result-object v7

    sget-object v10, Lmf/b;->b:Lu0/d;

    const/4 v8, 0x0

    const/4 v9, 0x0

    iget-boolean v5, v1, Lkf/b;->c:Z

    const/high16 v12, 0x30000

    const/16 v13, 0x18

    invoke-static/range {v5 .. v13}, LP2/K;->e(ZLVm/k;LA0/r;ZLG/h;Lu0/d;Lm0/l;II)V

    const/4 v0, 0x1

    invoke-virtual {v11, v0}, Lm0/q;->q(Z)V

    :goto_8
    invoke-virtual {v11}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_13

    new-instance v0, Lmf/c;

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lmf/c;-><init>(Lkf/b;LVm/k;LA0/r;II)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_13
    return-void
.end method

.method public static h0(Ljava/lang/Object;)Ljava/util/List;
    .locals 0

    if-eqz p0, :cond_0

    invoke-static {p0}, LIm/s;->f0(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_0
    sget-object p0, LIm/z;->a:LIm/z;

    return-object p0
.end method

.method public static i(F)Lw1/d;
    .locals 2

    new-instance v0, Lw1/d;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {v0, p0, v1}, Lw1/d;-><init>(FF)V

    return-object v0
.end method

.method public static final i0(Landroid/content/res/Resources$Theme;Landroid/content/res/Resources;Landroid/content/res/XmlResourceParser;I)Lf1/a;
    .locals 53

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    const/4 v3, 0x1

    invoke-static {v2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v4

    new-instance v5, LN0/a;

    invoke-direct {v5, v2}, LN0/a;-><init>(Landroid/content/res/XmlResourceParser;)V

    sget-object v6, LN0/b;->a:[I

    invoke-static {v1, v0, v4, v6}, LR1/b;->i(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/TypedArray;->getChangingConfigurations()I

    move-result v7

    invoke-virtual {v5, v7}, LN0/a;->b(I)V

    const-string v7, "autoMirrored"

    invoke-static {v2, v7}, LR1/b;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v7

    const/4 v8, 0x5

    const/4 v9, 0x0

    if-nez v7, :cond_0

    move/from16 v19, v9

    goto :goto_0

    :cond_0
    invoke-virtual {v6, v8, v9}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    move/from16 v19, v7

    :goto_0
    invoke-virtual {v6}, Landroid/content/res/TypedArray;->getChangingConfigurations()I

    move-result v7

    invoke-virtual {v5, v7}, LN0/a;->b(I)V

    const-string v7, "viewportWidth"

    const/4 v10, 0x7

    const/4 v11, 0x0

    invoke-virtual {v5, v6, v7, v10, v11}, LN0/a;->a(Landroid/content/res/TypedArray;Ljava/lang/String;IF)F

    move-result v14

    const-string v7, "viewportHeight"

    const/16 v12, 0x8

    invoke-virtual {v5, v6, v7, v12, v11}, LN0/a;->a(Landroid/content/res/TypedArray;Ljava/lang/String;IF)F

    move-result v15

    cmpg-float v7, v14, v11

    if-lez v7, :cond_2e

    cmpg-float v7, v15, v11

    if-lez v7, :cond_2d

    const/4 v7, 0x3

    invoke-virtual {v6, v7, v11}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v13

    invoke-virtual {v6}, Landroid/content/res/TypedArray;->getChangingConfigurations()I

    move-result v10

    invoke-virtual {v5, v10}, LN0/a;->b(I)V

    const/4 v10, 0x2

    invoke-virtual {v6, v10, v11}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v17

    invoke-virtual {v6}, Landroid/content/res/TypedArray;->getChangingConfigurations()I

    move-result v11

    invoke-virtual {v5, v11}, LN0/a;->b(I)V

    invoke-virtual {v6, v3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v11

    if-eqz v11, :cond_3

    new-instance v11, Landroid/util/TypedValue;

    invoke-direct {v11}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {v6, v3, v11}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    iget v11, v11, Landroid/util/TypedValue;->type:I

    if-ne v11, v10, :cond_1

    sget-wide v20, LH0/w;->h:J

    move-wide/from16 v10, v20

    goto :goto_1

    :cond_1
    invoke-static {v6, v2, v0}, LR1/b;->c(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Landroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;

    move-result-object v11

    invoke-virtual {v6}, Landroid/content/res/TypedArray;->getChangingConfigurations()I

    move-result v10

    invoke-virtual {v5, v10}, LN0/a;->b(I)V

    if-eqz v11, :cond_2

    invoke-virtual {v11}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v10

    invoke-static {v10}, LH0/F;->c(I)J

    move-result-wide v10

    goto :goto_1

    :cond_2
    sget-wide v10, LH0/w;->h:J

    goto :goto_1

    :cond_3
    sget-wide v10, LH0/w;->h:J

    :goto_1
    const/4 v9, 0x6

    const/4 v3, -0x1

    invoke-virtual {v6, v9, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v12

    invoke-virtual {v6}, Landroid/content/res/TypedArray;->getChangingConfigurations()I

    move-result v9

    invoke-virtual {v5, v9}, LN0/a;->b(I)V

    const/16 v9, 0x9

    if-eq v12, v3, :cond_4

    if-eq v12, v7, :cond_6

    if-eq v12, v8, :cond_4

    if-eq v12, v9, :cond_5

    packed-switch v12, :pswitch_data_0

    :cond_4
    move v12, v8

    goto :goto_2

    :pswitch_0
    const/16 v12, 0xc

    goto :goto_2

    :pswitch_1
    const/16 v12, 0xe

    goto :goto_2

    :pswitch_2
    const/16 v12, 0xd

    goto :goto_2

    :cond_5
    move v12, v9

    goto :goto_2

    :cond_6
    move v12, v7

    :goto_2
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v9

    iget v9, v9, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v13, v9

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v9

    iget v9, v9, Landroid/util/DisplayMetrics;->density:F

    div-float v17, v17, v9

    invoke-virtual {v6}, Landroid/content/res/TypedArray;->recycle()V

    move/from16 v18, v12

    move v12, v13

    move/from16 v13, v17

    const/4 v6, 0x7

    const/4 v9, 0x0

    move-wide/from16 v16, v10

    new-instance v10, LM0/e;

    const/4 v11, 0x0

    const/16 v27, 0x2

    const/16 v20, 0x1

    move v3, v9

    move v9, v6

    move/from16 v6, v27

    invoke-direct/range {v10 .. v20}, LM0/e;-><init>(Ljava/lang/String;FFFFJIZI)V

    const/4 v11, 0x0

    :goto_3
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v12

    const/4 v13, 0x1

    if-eq v12, v13, :cond_2c

    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v12

    if-ge v12, v13, :cond_7

    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v12

    if-ne v12, v7, :cond_7

    goto/16 :goto_1e

    :cond_7
    iget-object v12, v5, LN0/a;->a:Landroid/content/res/XmlResourceParser;

    invoke-interface {v12}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v13

    const-string v14, "ImageVector.Builder is single use, create a new instance to create a new ImageVector"

    iget-object v15, v10, LM0/e;->i:Ljava/util/ArrayList;

    const-string v9, "group"

    if-eq v13, v6, :cond_b

    if-eq v13, v7, :cond_8

    goto/16 :goto_7

    :cond_8
    invoke-interface {v12}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_10

    const/4 v13, 0x1

    add-int/2addr v11, v13

    const/4 v9, 0x0

    :goto_4
    if-ge v9, v11, :cond_a

    iget-boolean v12, v10, LM0/e;->k:Z

    if-eqz v12, :cond_9

    invoke-static {v14}, LW0/a;->c(Ljava/lang/String;)V

    :cond_9
    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v12

    sub-int/2addr v12, v13

    invoke-virtual {v15, v12}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, LM0/d;

    invoke-static {v13, v15}, Lj/m;->e(ILjava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v13, v17

    check-cast v13, LM0/d;

    iget-object v13, v13, LM0/d;->j:Ljava/util/ArrayList;

    new-instance v28, LM0/G;

    iget-object v7, v12, LM0/d;->a:Ljava/lang/String;

    iget v6, v12, LM0/d;->b:F

    iget v3, v12, LM0/d;->c:F

    iget v8, v12, LM0/d;->d:F

    iget v2, v12, LM0/d;->e:F

    move/from16 v33, v2

    iget v2, v12, LM0/d;->f:F

    move/from16 v34, v2

    iget v2, v12, LM0/d;->g:F

    move/from16 v35, v2

    iget v2, v12, LM0/d;->h:F

    move/from16 v36, v2

    iget-object v2, v12, LM0/d;->i:Ljava/util/List;

    iget-object v12, v12, LM0/d;->j:Ljava/util/ArrayList;

    move-object/from16 v37, v2

    move/from16 v31, v3

    move/from16 v30, v6

    move-object/from16 v29, v7

    move/from16 v32, v8

    move-object/from16 v38, v12

    invoke-direct/range {v28 .. v38}, LM0/G;-><init>(Ljava/lang/String;FFFFFFFLjava/util/List;Ljava/util/ArrayList;)V

    move-object/from16 v2, v28

    invoke-virtual {v13, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/16 v22, 0x1

    add-int/lit8 v9, v9, 0x1

    move-object/from16 v2, p2

    const/4 v3, 0x0

    const/4 v6, 0x2

    const/4 v7, 0x3

    const/4 v8, 0x5

    const/4 v13, 0x1

    goto :goto_4

    :cond_a
    move/from16 v22, v13

    const/4 v8, 0x0

    const/4 v11, 0x0

    const/16 v12, 0xd

    const/4 v13, 0x7

    :goto_5
    const/16 v24, 0x6

    const/16 v25, -0x1

    const/16 v26, 0x9

    goto/16 :goto_1d

    :cond_b
    invoke-interface {v12}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_10

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v3

    sget-object v37, LIm/z;->a:LIm/z;

    iget-object v6, v5, LN0/a;->c:LI5/e;

    const v7, -0x624e8b7e

    const-string v8, ""

    if-eq v3, v7, :cond_27

    const v7, 0x346425

    const/high16 v13, 0x3f800000    # 1.0f

    if-eq v3, v7, :cond_11

    const v6, 0x5e0f67f

    if-eq v3, v6, :cond_c

    goto/16 :goto_7

    :cond_c
    invoke-virtual {v2, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_d

    goto :goto_7

    :cond_d
    sget-object v2, LN0/b;->b:[I

    invoke-static {v1, v0, v4, v2}, LR1/b;->i(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/TypedArray;->getChangingConfigurations()I

    move-result v3

    invoke-virtual {v5, v3}, LN0/a;->b(I)V

    const-string v3, "rotation"

    const/4 v6, 0x5

    const/4 v9, 0x0

    invoke-virtual {v5, v2, v3, v6, v9}, LN0/a;->a(Landroid/content/res/TypedArray;Ljava/lang/String;IF)F

    move-result v30

    const/4 v3, 0x1

    invoke-virtual {v2, v3, v9}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v31

    invoke-virtual {v2}, Landroid/content/res/TypedArray;->getChangingConfigurations()I

    move-result v3

    invoke-virtual {v5, v3}, LN0/a;->b(I)V

    const/4 v6, 0x2

    invoke-virtual {v2, v6, v9}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v32

    invoke-virtual {v2}, Landroid/content/res/TypedArray;->getChangingConfigurations()I

    move-result v3

    invoke-virtual {v5, v3}, LN0/a;->b(I)V

    const-string v3, "scaleX"

    const/4 v6, 0x3

    invoke-virtual {v5, v2, v3, v6, v13}, LN0/a;->a(Landroid/content/res/TypedArray;Ljava/lang/String;IF)F

    move-result v33

    const-string v3, "scaleY"

    const/4 v6, 0x4

    invoke-virtual {v5, v2, v3, v6, v13}, LN0/a;->a(Landroid/content/res/TypedArray;Ljava/lang/String;IF)F

    move-result v34

    const-string v3, "translateX"

    const/4 v6, 0x6

    invoke-virtual {v5, v2, v3, v6, v9}, LN0/a;->a(Landroid/content/res/TypedArray;Ljava/lang/String;IF)F

    move-result v35

    const-string v3, "translateY"

    const/4 v6, 0x7

    invoke-virtual {v5, v2, v3, v6, v9}, LN0/a;->a(Landroid/content/res/TypedArray;Ljava/lang/String;IF)F

    move-result v36

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2}, Landroid/content/res/TypedArray;->getChangingConfigurations()I

    move-result v3

    invoke-virtual {v5, v3}, LN0/a;->b(I)V

    if-nez v6, :cond_e

    move-object/from16 v29, v8

    goto :goto_6

    :cond_e
    move-object/from16 v29, v6

    :goto_6
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    sget v2, LM0/H;->a:I

    iget-boolean v2, v10, LM0/e;->k:Z

    if-eqz v2, :cond_f

    invoke-static {v14}, LW0/a;->c(Ljava/lang/String;)V

    :cond_f
    new-instance v28, LM0/d;

    const/16 v38, 0x200

    invoke-direct/range {v28 .. v38}, LM0/d;-><init>(Ljava/lang/String;FFFFFFFLjava/util/List;I)V

    move-object/from16 v2, v28

    invoke-virtual {v15, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_10
    :goto_7
    const/4 v8, 0x0

    const/16 v12, 0xd

    const/4 v13, 0x7

    :goto_8
    const/16 v22, 0x1

    goto/16 :goto_5

    :cond_11
    const-string v3, "path"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_12

    goto :goto_7

    :cond_12
    sget-object v2, LN0/b;->c:[I

    invoke-static {v1, v0, v4, v2}, LR1/b;->i(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/TypedArray;->getChangingConfigurations()I

    move-result v3

    invoke-virtual {v5, v3}, LN0/a;->b(I)V

    const-string v3, "http://schemas.android.com/apk/res/android"

    const-string v7, "pathData"

    invoke-interface {v12, v3, v7}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_26

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2}, Landroid/content/res/TypedArray;->getChangingConfigurations()I

    move-result v3

    invoke-virtual {v5, v3}, LN0/a;->b(I)V

    if-nez v7, :cond_13

    move-object/from16 v39, v8

    :goto_9
    const/4 v3, 0x2

    goto :goto_a

    :cond_13
    move-object/from16 v39, v7

    goto :goto_9

    :goto_a
    invoke-virtual {v2, v3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2}, Landroid/content/res/TypedArray;->getChangingConfigurations()I

    move-result v3

    invoke-virtual {v5, v3}, LN0/a;->b(I)V

    if-nez v7, :cond_14

    sget v3, LM0/H;->a:I

    :goto_b
    move-object/from16 v40, v37

    goto :goto_c

    :cond_14
    invoke-static {v6, v7}, LI5/e;->q(LI5/e;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v37

    goto :goto_b

    :goto_c
    const-string v3, "fillColor"

    const/4 v6, 0x1

    invoke-static {v2, v12, v0, v3, v6}, LR1/b;->d(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Landroid/content/res/Resources$Theme;Ljava/lang/String;I)LA3/g0;

    move-result-object v3

    invoke-virtual {v2}, Landroid/content/res/TypedArray;->getChangingConfigurations()I

    move-result v6

    invoke-virtual {v5, v6}, LN0/a;->b(I)V

    const-string v6, "fillAlpha"

    const/16 v7, 0xc

    invoke-virtual {v5, v2, v6, v7, v13}, LN0/a;->a(Landroid/content/res/TypedArray;Ljava/lang/String;IF)F

    move-result v43

    const-string v6, "strokeLineCap"

    invoke-static {v12, v6}, LR1/b;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_15

    const/4 v6, -0x1

    const/16 v9, 0x8

    goto :goto_d

    :cond_15
    const/4 v6, -0x1

    const/16 v9, 0x8

    invoke-virtual {v2, v9, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v8

    move v6, v8

    :goto_d
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->getChangingConfigurations()I

    move-result v8

    invoke-virtual {v5, v8}, LN0/a;->b(I)V

    if-eqz v6, :cond_16

    const/4 v8, 0x1

    if-eq v6, v8, :cond_18

    const/4 v8, 0x2

    if-eq v6, v8, :cond_17

    :cond_16
    const/16 v47, 0x0

    goto :goto_e

    :cond_17
    const/16 v47, 0x2

    goto :goto_e

    :cond_18
    const/16 v47, 0x1

    :goto_e
    const-string v6, "strokeLineJoin"

    invoke-static {v12, v6}, LR1/b;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_19

    const/4 v6, -0x1

    const/16 v8, 0x9

    goto :goto_f

    :cond_19
    const/4 v6, -0x1

    const/16 v8, 0x9

    invoke-virtual {v2, v8, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v23

    move/from16 v6, v23

    :goto_f
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->getChangingConfigurations()I

    move-result v7

    invoke-virtual {v5, v7}, LN0/a;->b(I)V

    if-eqz v6, :cond_1c

    const/4 v7, 0x1

    if-eq v6, v7, :cond_1b

    const/4 v7, 0x2

    if-eq v6, v7, :cond_1a

    :goto_10
    const/16 v48, 0x0

    goto :goto_11

    :cond_1a
    move/from16 v48, v7

    goto :goto_11

    :cond_1b
    const/4 v7, 0x2

    const/16 v48, 0x1

    goto :goto_11

    :cond_1c
    const/4 v7, 0x2

    goto :goto_10

    :goto_11
    const/16 v6, 0xa

    const/high16 v7, 0x40800000    # 4.0f

    const-string v8, "strokeMiterLimit"

    invoke-virtual {v5, v2, v8, v6, v7}, LN0/a;->a(Landroid/content/res/TypedArray;Ljava/lang/String;IF)F

    move-result v49

    const-string v6, "strokeColor"

    const/4 v7, 0x3

    invoke-static {v2, v12, v0, v6, v7}, LR1/b;->d(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Landroid/content/res/Resources$Theme;Ljava/lang/String;I)LA3/g0;

    move-result-object v6

    invoke-virtual {v2}, Landroid/content/res/TypedArray;->getChangingConfigurations()I

    move-result v8

    invoke-virtual {v5, v8}, LN0/a;->b(I)V

    const-string v8, "strokeAlpha"

    const/16 v7, 0xb

    invoke-virtual {v5, v2, v8, v7, v13}, LN0/a;->a(Landroid/content/res/TypedArray;Ljava/lang/String;IF)F

    move-result v45

    const-string v7, "strokeWidth"

    const/4 v8, 0x4

    invoke-virtual {v5, v2, v7, v8, v13}, LN0/a;->a(Landroid/content/res/TypedArray;Ljava/lang/String;IF)F

    move-result v46

    const-string v7, "trimPathEnd"

    const/4 v8, 0x6

    invoke-virtual {v5, v2, v7, v8, v13}, LN0/a;->a(Landroid/content/res/TypedArray;Ljava/lang/String;IF)F

    move-result v51

    const-string v7, "trimPathOffset"

    const/4 v8, 0x0

    const/4 v13, 0x7

    invoke-virtual {v5, v2, v7, v13, v8}, LN0/a;->a(Landroid/content/res/TypedArray;Ljava/lang/String;IF)F

    move-result v52

    const-string v7, "trimPathStart"

    const/4 v9, 0x5

    invoke-virtual {v5, v2, v7, v9, v8}, LN0/a;->a(Landroid/content/res/TypedArray;Ljava/lang/String;IF)F

    move-result v50

    const-string v7, "fillType"

    invoke-static {v12, v7}, LR1/b;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1d

    const/16 v12, 0xd

    const/16 v16, 0x0

    goto :goto_12

    :cond_1d
    const/4 v7, 0x0

    const/16 v12, 0xd

    invoke-virtual {v2, v12, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v16

    :goto_12
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->getChangingConfigurations()I

    move-result v7

    invoke-virtual {v5, v7}, LN0/a;->b(I)V

    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    iget-object v7, v3, LA3/g0;->c:Ljava/lang/Object;

    check-cast v7, Landroid/graphics/Shader;

    if-eqz v7, :cond_1e

    goto :goto_13

    :cond_1e
    iget v2, v3, LA3/g0;->b:I

    if-eqz v2, :cond_20

    :goto_13
    if-eqz v7, :cond_1f

    new-instance v2, LH0/u;

    invoke-direct {v2, v7}, LH0/u;-><init>(Landroid/graphics/Shader;)V

    :goto_14
    move-object/from16 v42, v2

    goto :goto_15

    :cond_1f
    new-instance v2, LH0/Z;

    iget v3, v3, LA3/g0;->b:I

    invoke-static {v3}, LH0/F;->c(I)J

    move-result-wide v8

    invoke-direct {v2, v8, v9}, LH0/Z;-><init>(J)V

    goto :goto_14

    :cond_20
    const/16 v42, 0x0

    :goto_15
    iget-object v2, v6, LA3/g0;->c:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/Shader;

    if-eqz v2, :cond_21

    goto :goto_16

    :cond_21
    iget v3, v6, LA3/g0;->b:I

    if-eqz v3, :cond_23

    :goto_16
    if-eqz v2, :cond_22

    new-instance v3, LH0/u;

    invoke-direct {v3, v2}, LH0/u;-><init>(Landroid/graphics/Shader;)V

    move-object/from16 v44, v3

    goto :goto_17

    :cond_22
    new-instance v2, LH0/Z;

    iget v3, v6, LA3/g0;->b:I

    invoke-static {v3}, LH0/F;->c(I)J

    move-result-wide v8

    invoke-direct {v2, v8, v9}, LH0/Z;-><init>(J)V

    move-object/from16 v44, v2

    goto :goto_17

    :cond_23
    const/16 v44, 0x0

    :goto_17
    if-nez v16, :cond_24

    const/16 v41, 0x0

    goto :goto_18

    :cond_24
    const/16 v41, 0x1

    :goto_18
    iget-boolean v2, v10, LM0/e;->k:Z

    if-eqz v2, :cond_25

    invoke-static {v14}, LW0/a;->c(Ljava/lang/String;)V

    :cond_25
    const/4 v3, 0x1

    invoke-static {v3, v15}, Lj/m;->e(ILjava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, LM0/d;

    iget-object v2, v2, LM0/d;->j:Ljava/util/ArrayList;

    new-instance v38, LM0/J;

    invoke-direct/range {v38 .. v52}, LM0/J;-><init>(Ljava/lang/String;Ljava/util/List;ILH0/t;FLH0/t;FFIIFFFF)V

    move-object/from16 v3, v38

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v8, 0x0

    goto/16 :goto_8

    :cond_26
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No path data available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_27
    move-object v3, v8

    const/16 v12, 0xd

    const/4 v13, 0x7

    const/16 v24, 0x6

    const/16 v25, -0x1

    const/16 v26, 0x9

    const-string v8, "clip-path"

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_28

    const/4 v8, 0x0

    const/16 v22, 0x1

    goto :goto_1d

    :cond_28
    sget-object v2, LN0/b;->d:[I

    invoke-static {v1, v0, v4, v2}, LR1/b;->i(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/TypedArray;->getChangingConfigurations()I

    move-result v8

    invoke-virtual {v5, v8}, LN0/a;->b(I)V

    const/4 v8, 0x0

    invoke-virtual {v2, v8}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2}, Landroid/content/res/TypedArray;->getChangingConfigurations()I

    move-result v7

    invoke-virtual {v5, v7}, LN0/a;->b(I)V

    if-nez v9, :cond_29

    move-object/from16 v39, v3

    :goto_19
    const/4 v3, 0x1

    goto :goto_1a

    :cond_29
    move-object/from16 v39, v9

    goto :goto_19

    :goto_1a
    invoke-virtual {v2, v3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2}, Landroid/content/res/TypedArray;->getChangingConfigurations()I

    move-result v3

    invoke-virtual {v5, v3}, LN0/a;->b(I)V

    if-nez v7, :cond_2a

    sget v3, LM0/H;->a:I

    :goto_1b
    move-object/from16 v47, v37

    goto :goto_1c

    :cond_2a
    invoke-static {v6, v7}, LI5/e;->q(LI5/e;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v37

    goto :goto_1b

    :goto_1c
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    iget-boolean v2, v10, LM0/e;->k:Z

    if-eqz v2, :cond_2b

    invoke-static {v14}, LW0/a;->c(Ljava/lang/String;)V

    :cond_2b
    new-instance v38, LM0/d;

    const/16 v48, 0x200

    const/16 v40, 0x0

    const/16 v41, 0x0

    const/16 v42, 0x0

    const/high16 v43, 0x3f800000    # 1.0f

    const/high16 v44, 0x3f800000    # 1.0f

    const/16 v45, 0x0

    const/16 v46, 0x0

    invoke-direct/range {v38 .. v48}, LM0/d;-><init>(Ljava/lang/String;FFFFFFFLjava/util/List;I)V

    move-object/from16 v2, v38

    invoke-virtual {v15, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/16 v22, 0x1

    add-int/lit8 v11, v11, 0x1

    :goto_1d
    invoke-interface/range {p2 .. p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-object/from16 v2, p2

    move v9, v13

    const/4 v3, 0x0

    const/4 v6, 0x2

    const/4 v7, 0x3

    const/4 v8, 0x5

    goto/16 :goto_3

    :cond_2c
    :goto_1e
    iget v0, v5, LN0/a;->b:I

    or-int v0, p3, v0

    new-instance v1, Lf1/a;

    invoke-virtual {v10}, LM0/e;->b()LM0/f;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lf1/a;-><init>(LM0/f;I)V

    return-object v1

    :cond_2d
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6}, Landroid/content/res/TypedArray;->getPositionDescription()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "<VectorGraphic> tag requires viewportHeight > 0"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2e
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6}, Landroid/content/res/TypedArray;->getPositionDescription()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "<VectorGraphic> tag requires viewportWidth > 0"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0xe
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static final j(ZZLVm/a;LVm/a;LVm/a;Lm0/l;I)V
    .locals 16

    move/from16 v1, p0

    move/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    const-string v0, "onShown"

    invoke-static {v3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onTryAgainClicked"

    invoke-static {v4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onGetHelpClicked"

    invoke-static {v5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v13, p5

    check-cast v13, Lm0/q;

    const v0, 0x12764612

    invoke-virtual {v13, v0}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v13, v1}, Lm0/q;->h(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int v0, p6, v0

    invoke-virtual {v13, v2}, Lm0/q;->h(Z)Z

    move-result v6

    if-eqz v6, :cond_1

    const/16 v6, 0x20

    goto :goto_1

    :cond_1
    const/16 v6, 0x10

    :goto_1
    or-int/2addr v0, v6

    invoke-virtual {v13, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    const/16 v7, 0x100

    if-eqz v6, :cond_2

    move v6, v7

    goto :goto_2

    :cond_2
    const/16 v6, 0x80

    :goto_2
    or-int/2addr v0, v6

    invoke-virtual {v13, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    const/16 v6, 0x800

    goto :goto_3

    :cond_3
    const/16 v6, 0x400

    :goto_3
    or-int/2addr v0, v6

    invoke-virtual {v13, v5}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    const/16 v6, 0x4000

    goto :goto_4

    :cond_4
    const/16 v6, 0x2000

    :goto_4
    or-int/2addr v0, v6

    and-int/lit16 v6, v0, 0x2493

    const/16 v8, 0x2492

    if-ne v6, v8, :cond_6

    invoke-virtual {v13}, Lm0/q;->H()Z

    move-result v6

    if-nez v6, :cond_5

    goto :goto_5

    :cond_5
    invoke-virtual {v13}, Lm0/q;->Y()V

    goto :goto_9

    :cond_6
    :goto_5
    sget-object v6, LHm/B;->a:LHm/B;

    const v8, 0x2ebce0be

    invoke-virtual {v13, v8}, Lm0/q;->f0(I)V

    and-int/lit16 v0, v0, 0x380

    const/4 v8, 0x0

    if-ne v0, v7, :cond_7

    const/4 v0, 0x1

    goto :goto_6

    :cond_7
    move v0, v8

    :goto_6
    invoke-virtual {v13}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v7

    const/4 v9, 0x0

    if-nez v0, :cond_8

    sget-object v0, Lm0/k;->a:Lm0/e;

    if-ne v7, v0, :cond_9

    :cond_8
    new-instance v7, LSf/B;

    invoke-direct {v7, v3, v9}, LSf/B;-><init>(LVm/a;LLm/c;)V

    invoke-virtual {v13, v7}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_9
    check-cast v7, LVm/n;

    invoke-virtual {v13, v8}, Lm0/q;->q(Z)V

    invoke-static {v7, v6, v13}, Lm0/r;->f(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v0, LJf/b;->h:LJf/b;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, LP2/p;->L(Ld8/g;)Ljava/lang/String;

    move-result-object v6

    if-eqz v1, :cond_a

    :goto_7
    move-object v7, v9

    goto :goto_8

    :cond_a
    const v0, 0x7f0802c1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    goto :goto_7

    :goto_8
    const v0, 0x7f1211d7

    invoke-static {v13, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v10

    const v0, 0x7f1211d6

    invoke-static {v13, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v11

    new-instance v0, LMi/H;

    const/4 v8, 0x2

    invoke-direct {v0, v2, v4, v5, v8}, LMi/H;-><init>(ZLjava/lang/Object;Ljava/lang/Object;I)V

    const v8, -0xd405d6

    invoke-static {v8, v0, v13}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v12

    const/4 v8, 0x0

    const/4 v9, 0x0

    const v14, 0xc00c00

    const/16 v15, 0x14

    invoke-static/range {v6 .. v15}, LP2/e;->i(Ljava/lang/String;Ljava/lang/Integer;FLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lu0/d;Lm0/l;II)V

    :goto_9
    invoke-virtual {v13}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_b

    new-instance v0, LBg/n;

    move/from16 v6, p6

    invoke-direct/range {v0 .. v6}, LBg/n;-><init>(ZZLVm/a;LVm/a;LVm/a;I)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_b
    return-void
.end method

.method public static varargs j0([Ljava/lang/Object;)Ljava/util/ArrayList;
    .locals 3

    array-length v0, p0

    if-nez v0, :cond_0

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-object p0

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    new-instance v1, LIm/l;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, LIm/l;-><init>([Ljava/lang/Object;Z)V

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public static final k(ILA0/r;LVm/a;Lm0/l;)V
    .locals 18

    move/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    const/4 v3, 0x4

    move-object/from16 v13, p3

    check-cast v13, Lm0/q;

    const v4, -0x2ff45970

    invoke-virtual {v13, v4}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v13, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v4, v3

    goto :goto_0

    :cond_0
    const/4 v4, 0x2

    :goto_0
    or-int/2addr v4, v0

    invoke-virtual {v13, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    const/16 v5, 0x20

    goto :goto_1

    :cond_1
    const/16 v5, 0x10

    :goto_1
    or-int v17, v4, v5

    and-int/lit8 v4, v17, 0x13

    const/16 v5, 0x12

    if-ne v4, v5, :cond_3

    invoke-virtual {v13}, Lm0/q;->H()Z

    move-result v4

    if-nez v4, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v13}, Lm0/q;->Y()V

    goto/16 :goto_4

    :cond_3
    :goto_2
    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v1, v4}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v4

    sget-object v5, LG/l;->a:LG/d;

    invoke-static {v13}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v5

    iget v5, v5, Lhh/i;->e:F

    invoke-static {v5}, LG/l;->g(F)LG/j;

    move-result-object v5

    sget-object v6, LA0/d;->m:LA0/g;

    const/4 v7, 0x0

    invoke-static {v5, v6, v13, v7}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v5

    iget-wide v6, v13, Lm0/q;->T:J

    invoke-static {v6, v7}, Ljava/lang/Long;->hashCode(J)I

    move-result v6

    invoke-virtual {v13}, Lm0/q;->m()Lm0/o0;

    move-result-object v7

    invoke-static {v4, v13}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v4

    sget-object v8, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v8, LZ0/g;->b:LZ0/f;

    invoke-virtual {v13}, Lm0/q;->j0()V

    iget-boolean v9, v13, Lm0/q;->S:Z

    if-eqz v9, :cond_4

    invoke-virtual {v13, v8}, Lm0/q;->l(LVm/a;)V

    goto :goto_3

    :cond_4
    invoke-virtual {v13}, Lm0/q;->t0()V

    :goto_3
    sget-object v8, LZ0/g;->f:LZ0/e;

    invoke-static {v8, v5, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v5, LZ0/g;->e:LZ0/e;

    invoke-static {v5, v7, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    sget-object v6, LZ0/g;->g:LZ0/e;

    invoke-static {v13, v5, v6}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v5, LZ0/g;->h:LZ0/d;

    invoke-static {v13, v5}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v5, LZ0/g;->d:LZ0/e;

    invoke-static {v5, v4, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v4, Lih/h;->b:Lih/h;

    const v5, 0x7f120707

    invoke-static {v13, v5}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v13}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v6

    iget-object v6, v6, Lhh/h;->k:Lhh/v;

    iget-wide v7, v6, Lhh/v;->c:J

    const/4 v12, 0x0

    const/4 v14, 0x0

    const/4 v6, 0x0

    const/4 v9, 0x5

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x3e6

    invoke-virtual/range {v4 .. v16}, Lih/h;->h(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    const v5, 0x7f12070d

    invoke-static {v13, v5}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v13}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v6

    iget-object v6, v6, Lhh/h;->k:Lhh/v;

    iget-wide v7, v6, Lhh/v;->c:J

    const/4 v12, 0x0

    const/4 v14, 0x0

    const/4 v6, 0x0

    const/4 v9, 0x5

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x3e6

    invoke-virtual/range {v4 .. v16}, Lih/h;->h(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    and-int/lit8 v4, v17, 0xe

    invoke-static {v2, v13, v4}, LIm/s;->n(LVm/a;Lm0/l;I)V

    const/4 v4, 0x1

    invoke-virtual {v13, v4}, Lm0/q;->q(Z)V

    :goto_4
    invoke-virtual {v13}, Lm0/q;->u()Lm0/t0;

    move-result-object v4

    if-eqz v4, :cond_5

    new-instance v5, LHe/p;

    invoke-direct {v5, v2, v1, v0, v3}, LHe/p;-><init>(LVm/a;LA0/r;II)V

    iput-object v5, v4, Lm0/t0;->d:LVm/n;

    :cond_5
    return-void
.end method

.method public static final k0(Ly2/A0;)V
    .locals 5

    iget-object v0, p0, Lw2/n;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    iget-object v1, p0, Lw2/n;->b:Ljava/util/ArrayList;

    const/4 v2, 0x1

    if-nez v0, :cond_4

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lw2/l;

    instance-of v3, v3, Ly2/G;

    if-nez v3, :cond_1

    goto :goto_2

    :cond_2
    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_3
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lw2/l;

    const-string v3, "null cannot be cast to non-null type androidx.glance.appwidget.EmittableSizeBox"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->h(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Ly2/G;

    iget-object v1, v1, Lw2/n;->b:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-eq v3, v2, :cond_3

    new-instance v3, LE2/j;

    invoke-direct {v3}, LE2/j;-><init>()V

    iget-object v4, v3, Lw2/n;->b:Ljava/util/ArrayList;

    invoke-static {v1, v4}, LIm/x;->D0(Ljava/lang/Iterable;Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    :goto_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ne v0, v2, :cond_5

    goto :goto_3

    :cond_5
    new-instance v0, LE2/j;

    invoke-direct {v0}, LE2/j;-><init>()V

    iget-object v2, v0, Lw2/n;->b:Ljava/util/ArrayList;

    invoke-static {v1, v2}, LIm/x;->D0(Ljava/lang/Iterable;Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_6
    :goto_3
    invoke-static {p0}, LIm/s;->l0(Lw2/n;)V

    invoke-static {p0}, LIm/s;->u0(Lw2/n;)V

    return-void
.end method

.method public static final l(Lcom/eightsleep/data_core/enums/base/BaseElevationPreset;ZZLC8/d;LVm/k;LVm/a;LVm/a;LVm/k;LVm/k;Lm0/l;I)V
    .locals 59

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v7, p6

    move-object/from16 v13, p7

    move-object/from16 v0, p8

    const/4 v2, 0x0

    const-string v3, "onPresetClicked"

    invoke-static {v5, v3}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "onEmergencyFlatClick"

    move-object/from16 v14, p5

    invoke-static {v14, v3}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "onStopMovementClick"

    invoke-static {v7, v3}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "onHeadAngleChange"

    invoke-static {v13, v3}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "onFeetAngleChange"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v10, p9

    check-cast v10, Lm0/q;

    const v3, -0x5bd1c156

    invoke-virtual {v10, v3}, Lm0/q;->h0(I)Lm0/q;

    move-object/from16 v3, p0

    invoke-virtual {v10, v3}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v6, 0x4

    goto :goto_0

    :cond_0
    const/4 v6, 0x2

    :goto_0
    or-int v6, p10, v6

    move/from16 v8, p1

    invoke-virtual {v10, v8}, Lm0/q;->h(Z)Z

    move-result v9

    const/16 v15, 0x10

    if-eqz v9, :cond_1

    const/16 v9, 0x20

    goto :goto_1

    :cond_1
    move v9, v15

    :goto_1
    or-int/2addr v6, v9

    invoke-virtual {v10, v4}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    const/16 v9, 0x800

    goto :goto_2

    :cond_2
    const/16 v9, 0x400

    :goto_2
    or-int/2addr v6, v9

    invoke-virtual {v10, v5}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    const/16 v9, 0x4000

    goto :goto_3

    :cond_3
    const/16 v9, 0x2000

    :goto_3
    or-int/2addr v6, v9

    invoke-virtual {v10, v7}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    const/high16 v9, 0x100000

    goto :goto_4

    :cond_4
    const/high16 v9, 0x80000

    :goto_4
    or-int/2addr v6, v9

    invoke-virtual {v10, v13}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    const/high16 v9, 0x800000

    goto :goto_5

    :cond_5
    const/high16 v9, 0x400000

    :goto_5
    or-int/2addr v6, v9

    invoke-virtual {v10, v0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    const/high16 v9, 0x4000000

    goto :goto_6

    :cond_6
    const/high16 v9, 0x2000000

    :goto_6
    or-int v28, v6, v9

    const v6, 0x2482413

    and-int v6, v28, v6

    const v9, 0x2482412

    if-ne v6, v9, :cond_8

    invoke-virtual {v10}, Lm0/q;->H()Z

    move-result v6

    if-nez v6, :cond_7

    goto :goto_7

    :cond_7
    invoke-virtual {v10}, Lm0/q;->Y()V

    goto/16 :goto_19

    :cond_8
    :goto_7
    invoke-static {v10, v2}, LP2/z;->M(Lm0/l;I)V

    and-int/lit8 v6, v28, 0xe

    or-int/lit16 v6, v6, 0x180

    and-int/lit8 v9, v28, 0x70

    or-int/2addr v6, v9

    shr-int/lit8 v9, v28, 0x3

    and-int/lit16 v11, v9, 0x1c00

    or-int/2addr v6, v11

    shr-int/lit8 v11, v28, 0x6

    const v12, 0xe000

    and-int/2addr v11, v12

    or-int/2addr v11, v6

    const/4 v12, 0x0

    const/4 v7, 0x1

    move v6, v8

    move-object v8, v5

    move-object v5, v3

    move v3, v9

    move-object/from16 v9, p6

    invoke-static/range {v5 .. v12}, LP2/h;->l(Lcom/eightsleep/data_core/enums/base/BaseElevationPreset;ZZLVm/k;LVm/a;Lm0/l;II)V

    invoke-static {v10, v2}, LP2/z;->K(Lm0/l;I)V

    int-to-float v5, v15

    invoke-static {v5}, LO/e;->b(F)LO/d;

    move-result-object v5

    sget-object v6, LG/l;->a:LG/d;

    invoke-static {v10}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v6

    iget v6, v6, Lhh/i;->c:F

    invoke-static {v6}, LG/l;->g(F)LG/j;

    move-result-object v6

    sget-object v7, LA0/o;->a:LA0/o;

    sget-object v8, LA0/d;->m:LA0/g;

    invoke-static {v6, v8, v10, v2}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v6

    iget-wide v8, v10, Lm0/q;->T:J

    invoke-static {v8, v9}, Ljava/lang/Long;->hashCode(J)I

    move-result v8

    invoke-virtual {v10}, Lm0/q;->m()Lm0/o0;

    move-result-object v9

    invoke-static {v7, v10}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v11

    sget-object v12, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v12, LZ0/g;->b:LZ0/f;

    invoke-virtual {v10}, Lm0/q;->j0()V

    iget-boolean v15, v10, Lm0/q;->S:Z

    if-eqz v15, :cond_9

    invoke-virtual {v10, v12}, Lm0/q;->l(LVm/a;)V

    goto :goto_8

    :cond_9
    invoke-virtual {v10}, Lm0/q;->t0()V

    :goto_8
    sget-object v15, LZ0/g;->f:LZ0/e;

    invoke-static {v15, v6, v10}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v6, LZ0/g;->e:LZ0/e;

    invoke-static {v6, v9, v10}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    sget-object v9, LZ0/g;->g:LZ0/e;

    invoke-static {v10, v8, v9}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v8, LZ0/g;->h:LZ0/d;

    invoke-static {v10, v8}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v14, LZ0/g;->d:LZ0/e;

    invoke-static {v14, v11, v10}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const/high16 v11, 0x3f800000    # 1.0f

    invoke-static {v7, v11}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v2

    invoke-static {v2, v5}, LE0/i;->c(LA0/r;LH0/X;)LA0/r;

    move-result-object v2

    invoke-static {v10}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v1

    iget-object v1, v1, Lhh/h;->d:Lhh/g;

    move-object/from16 p9, v12

    iget-wide v11, v1, Lhh/g;->c:J

    invoke-static {v2, v11, v12, v5}, Ly/x;->g(LA0/r;JLH0/X;)LA0/r;

    move-result-object v1

    invoke-static {v10}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v2

    iget v2, v2, Lhh/i;->e:F

    invoke-static {v1, v2}, LG/e;->H(LA0/r;F)LA0/r;

    move-result-object v1

    sget-object v2, LA0/d;->k:LA0/h;

    sget-object v11, LG/l;->g:LG/g;

    const/16 v12, 0x36

    invoke-static {v11, v2, v10, v12}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v0

    iget-wide v12, v10, Lm0/q;->T:J

    invoke-static {v12, v13}, Ljava/lang/Long;->hashCode(J)I

    move-result v12

    invoke-virtual {v10}, Lm0/q;->m()Lm0/o0;

    move-result-object v13

    invoke-static {v1, v10}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v1

    invoke-virtual {v10}, Lm0/q;->j0()V

    move/from16 v31, v3

    iget-boolean v3, v10, Lm0/q;->S:Z

    if-eqz v3, :cond_a

    move-object/from16 v3, p9

    invoke-virtual {v10, v3}, Lm0/q;->l(LVm/a;)V

    goto :goto_9

    :cond_a
    move-object/from16 v3, p9

    invoke-virtual {v10}, Lm0/q;->t0()V

    :goto_9
    invoke-static {v15, v0, v10}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v6, v13, v10}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v12, v10, v9, v10, v8}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    invoke-static {v14, v1, v10}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object v0, v15

    sget-object v15, Lih/h;->e:Lih/h;

    const/high16 v1, 0x3f800000    # 1.0f

    float-to-double v12, v1

    const-wide/16 v32, 0x0

    cmpl-double v12, v12, v32

    const-string v30, "invalid weight; must be greater than zero"

    if-lez v12, :cond_b

    goto :goto_a

    :cond_b
    invoke-static/range {v30 .. v30}, LH/a;->a(Ljava/lang/String;)V

    :goto_a
    new-instance v12, LG/x0;

    const v34, 0x7f7fffff    # Float.MAX_VALUE

    cmpl-float v13, v1, v34

    if-lez v13, :cond_c

    move/from16 v13, v34

    :goto_b
    const/4 v1, 0x1

    goto :goto_c

    :cond_c
    move v13, v1

    goto :goto_b

    :goto_c
    invoke-direct {v12, v13, v1}, LG/x0;-><init>(FZ)V

    const v1, 0x7f120265

    invoke-static {v10, v1}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v1

    sget-object v13, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v13}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v35, v6

    const-string v6, "toLowerCase(...)"

    invoke-static {v1, v6}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v16

    if-lez v16, :cond_d

    const/16 v16, 0x1

    :goto_d
    move-object/from16 v36, v6

    goto :goto_e

    :cond_d
    const/16 v16, 0x0

    goto :goto_d

    :goto_e
    const-string v6, "substring(...)"

    move-object/from16 v37, v7

    const-string v7, "toUpperCase(...)"

    move-object/from16 v38, v8

    const-string v8, "null cannot be cast to non-null type java.lang.String"

    if-eqz v16, :cond_e

    move-object/from16 v16, v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v39, v3

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v17

    invoke-static/range {v17 .. v17}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v8}, Lkotlin/jvm/internal/l;->h(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v3, v13}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v7}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v6}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_f

    :cond_e
    move-object/from16 v16, v0

    move-object/from16 v39, v3

    :goto_f
    const/16 v23, 0x0

    const/16 v25, 0x0

    const-wide/16 v18, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x3fc

    move-object/from16 v24, v10

    move-object/from16 v17, v12

    move-object/from16 v0, v16

    move-object/from16 v16, v1

    invoke-virtual/range {v15 .. v27}, Lih/h;->h(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    move-object v1, v15

    const/16 v3, 0x2d

    iget v12, v4, LC8/d;->a:I

    if-ge v12, v3, :cond_f

    const/16 v17, 0x1

    goto :goto_10

    :cond_f
    const/16 v17, 0x0

    :goto_10
    if-lez v12, :cond_10

    const/16 v18, 0x1

    goto :goto_11

    :cond_10
    const/16 v18, 0x0

    :goto_11
    const/16 v3, 0x40

    int-to-float v3, v3

    new-instance v12, Lw1/f;

    invoke-direct {v12, v3}, Lw1/f;-><init>(F)V

    new-instance v15, Lbg/e;

    move-object/from16 v27, v1

    const/4 v1, 0x0

    invoke-direct {v15, v4, v1}, Lbg/e;-><init>(LC8/d;I)V

    const v1, 0x7b5b8d3f

    invoke-static {v1, v15, v10}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v22

    const/high16 v1, 0x1c00000

    and-int v15, v28, v1

    const v28, 0x6000036

    or-int v24, v15, v28

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object v15, v6

    const/4 v6, 0x0

    move-object/from16 v16, v7

    const/4 v7, 0x0

    move-object/from16 v21, v8

    const/4 v8, 0x0

    move-object/from16 v25, v9

    move-object/from16 v23, v10

    const-wide/16 v9, 0x0

    move-object/from16 v26, v11

    const/4 v11, 0x0

    move-object/from16 v40, v21

    move-object/from16 v21, v12

    const/4 v12, 0x0

    move-object/from16 v41, v14

    const/4 v14, 0x1

    move-object/from16 v42, v15

    const/4 v15, 0x0

    move-object/from16 v43, v16

    const/16 v16, 0x0

    move-object/from16 v44, v25

    const/high16 v25, 0x1b0000

    move-object/from16 v45, v26

    const/16 v26, 0x667c

    move/from16 v46, v1

    move-object/from16 v47, v5

    move-object/from16 v54, v13

    move-object/from16 v49, v35

    move-object/from16 v55, v36

    move-object/from16 v5, v37

    move-object/from16 v51, v38

    move-object/from16 v48, v39

    move-object/from16 v58, v40

    move-object/from16 v52, v41

    move-object/from16 v56, v42

    move-object/from16 v57, v43

    move-object/from16 v50, v44

    move-object/from16 v53, v45

    const/high16 v1, 0x3f800000    # 1.0f

    move-object/from16 v13, p7

    invoke-static/range {v5 .. v26}, Lcj/l0;->z(LA0/r;ZLjava/lang/String;Ljava/lang/String;JFFLVm/k;ZLw1/f;ZZZFFLw1/f;Lu0/d;Lm0/l;III)V

    move-object/from16 v10, v23

    const/4 v6, 0x1

    invoke-virtual {v10, v6}, Lm0/q;->q(Z)V

    invoke-static {v5, v1}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v6

    move-object/from16 v7, v47

    invoke-static {v6, v7}, LE0/i;->c(LA0/r;LH0/X;)LA0/r;

    move-result-object v6

    invoke-static {v10}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v8

    iget-object v8, v8, Lhh/h;->d:Lhh/g;

    iget-wide v8, v8, Lhh/g;->c:J

    invoke-static {v6, v8, v9, v7}, Ly/x;->g(LA0/r;JLH0/X;)LA0/r;

    move-result-object v6

    invoke-static {v10}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v7

    iget v7, v7, Lhh/i;->e:F

    invoke-static {v6, v7}, LG/e;->H(LA0/r;F)LA0/r;

    move-result-object v6

    move-object/from16 v7, v53

    const/16 v8, 0x36

    invoke-static {v7, v2, v10, v8}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v2

    iget-wide v7, v10, Lm0/q;->T:J

    invoke-static {v7, v8}, Ljava/lang/Long;->hashCode(J)I

    move-result v7

    invoke-virtual {v10}, Lm0/q;->m()Lm0/o0;

    move-result-object v8

    invoke-static {v6, v10}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v6

    invoke-virtual {v10}, Lm0/q;->j0()V

    iget-boolean v9, v10, Lm0/q;->S:Z

    if-eqz v9, :cond_11

    move-object/from16 v9, v48

    invoke-virtual {v10, v9}, Lm0/q;->l(LVm/a;)V

    goto :goto_12

    :cond_11
    invoke-virtual {v10}, Lm0/q;->t0()V

    :goto_12
    invoke-static {v0, v2, v10}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object/from16 v0, v49

    invoke-static {v0, v8, v10}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object/from16 v0, v50

    move-object/from16 v2, v51

    invoke-static {v7, v10, v0, v10, v2}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    move-object/from16 v0, v52

    invoke-static {v0, v6, v10}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    float-to-double v6, v1

    cmpl-double v0, v6, v32

    if-lez v0, :cond_12

    goto :goto_13

    :cond_12
    invoke-static/range {v30 .. v30}, LH/a;->a(Ljava/lang/String;)V

    :goto_13
    new-instance v7, LG/x0;

    cmpl-float v0, v1, v34

    if-lez v0, :cond_13

    move/from16 v11, v34

    :goto_14
    const/4 v6, 0x1

    goto :goto_15

    :cond_13
    move v11, v1

    goto :goto_14

    :goto_15
    invoke-direct {v7, v11, v6}, LG/x0;-><init>(FZ)V

    const v0, 0x7f120264

    invoke-static {v10, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v0

    move-object/from16 v1, v54

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    move-object/from16 v2, v55

    invoke-static {v0, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_14

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v6, 0x0

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v9, v58

    invoke-static {v8, v9}, Lkotlin/jvm/internal/l;->h(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v8, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v8, v57

    invoke-static {v1, v8}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    move-object/from16 v15, v56

    invoke-static {v0, v15}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    :cond_14
    const/4 v6, 0x0

    :goto_16
    const/4 v13, 0x0

    const/4 v15, 0x0

    const-wide/16 v8, 0x0

    move-object/from16 v23, v10

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x3fc

    move-object/from16 v37, v5

    move/from16 v29, v6

    move-object/from16 v14, v23

    move-object/from16 v5, v27

    move-object v6, v0

    invoke-virtual/range {v5 .. v17}, Lih/h;->h(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    move-object v10, v14

    const/16 v0, 0x14

    iget v1, v4, LC8/d;->b:I

    if-ge v1, v0, :cond_15

    const/16 v17, 0x1

    goto :goto_17

    :cond_15
    move/from16 v17, v29

    :goto_17
    if-lez v1, :cond_16

    const/16 v18, 0x1

    goto :goto_18

    :cond_16
    move/from16 v18, v29

    :goto_18
    new-instance v0, Lw1/f;

    invoke-direct {v0, v3}, Lw1/f;-><init>(F)V

    new-instance v1, Lbg/e;

    const/4 v6, 0x1

    invoke-direct {v1, v4, v6}, Lbg/e;-><init>(LC8/d;I)V

    const v2, -0x5385254a

    invoke-static {v2, v1, v10}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v22

    and-int v1, v31, v46

    or-int v24, v1, v28

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v23, v10

    const-wide/16 v9, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v14, 0x1

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/high16 v25, 0x1b0000

    const/16 v26, 0x667c

    move-object/from16 v13, p8

    move-object/from16 v21, v0

    move-object/from16 v5, v37

    invoke-static/range {v5 .. v26}, Lcj/l0;->z(LA0/r;ZLjava/lang/String;Ljava/lang/String;JFFLVm/k;ZLw1/f;ZZZFFLw1/f;Lu0/d;Lm0/l;III)V

    move-object/from16 v10, v23

    const/4 v6, 0x1

    invoke-virtual {v10, v6}, Lm0/q;->q(Z)V

    invoke-virtual {v10, v6}, Lm0/q;->q(Z)V

    :goto_19
    invoke-virtual {v10}, Lm0/q;->u()Lm0/t0;

    move-result-object v11

    if-eqz v11, :cond_17

    new-instance v0, LSf/G;

    move-object/from16 v1, p0

    move/from16 v2, p1

    move/from16 v3, p2

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move/from16 v10, p10

    invoke-direct/range {v0 .. v10}, LSf/G;-><init>(Lcom/eightsleep/data_core/enums/base/BaseElevationPreset;ZZLC8/d;LVm/k;LVm/a;LVm/a;LVm/k;LVm/k;I)V

    iput-object v0, v11, Lm0/t0;->d:LVm/n;

    :cond_17
    return-void
.end method

.method public static final l0(Lw2/n;)V
    .locals 6

    iget-object v0, p0, Lw2/n;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lw2/l;

    instance-of v2, v1, Lw2/n;

    if-eqz v2, :cond_0

    check-cast v1, Lw2/n;

    invoke-static {v1}, LIm/s;->l0(Lw2/n;)V

    goto :goto_0

    :cond_1
    invoke-interface {p0}, Lw2/l;->a()Lw2/q;

    move-result-object v0

    sget-object v1, Ly2/v;->m:Ly2/v;

    const/4 v2, 0x0

    invoke-interface {v0, v2, v1}, Lw2/q;->foldIn(Ljava/lang/Object;LVm/n;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LE2/m;

    sget-object v1, LJ2/g;->a:LJ2/g;

    if-eqz v0, :cond_2

    iget-object v0, v0, LE2/m;->a:LJ2/h;

    goto :goto_1

    :cond_2
    move-object v0, v1

    :goto_1
    instance-of v0, v0, LJ2/g;

    iget-object v3, p0, Lw2/n;->b:Ljava/util/ArrayList;

    if-eqz v0, :cond_6

    if-eqz v3, :cond_3

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_3

    :cond_3
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lw2/l;

    invoke-interface {v4}, Lw2/l;->a()Lw2/q;

    move-result-object v4

    sget-object v5, Ly2/v;->o:Ly2/v;

    invoke-interface {v4, v2, v5}, Lw2/q;->foldIn(Ljava/lang/Object;LVm/n;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, LE2/m;

    if-eqz v4, :cond_5

    iget-object v4, v4, LE2/m;->a:LJ2/h;

    goto :goto_2

    :cond_5
    move-object v4, v2

    :goto_2
    instance-of v4, v4, LJ2/e;

    if-eqz v4, :cond_4

    invoke-interface {p0}, Lw2/l;->a()Lw2/q;

    move-result-object v0

    new-instance v4, LE2/m;

    sget-object v5, LJ2/e;->a:LJ2/e;

    invoke-direct {v4, v5}, LE2/m;-><init>(LJ2/h;)V

    invoke-interface {v0, v4}, Lw2/q;->c(Lw2/q;)Lw2/q;

    move-result-object v0

    invoke-interface {p0, v0}, Lw2/l;->b(Lw2/q;)V

    :cond_6
    :goto_3
    invoke-interface {p0}, Lw2/l;->a()Lw2/q;

    move-result-object v0

    sget-object v4, Ly2/v;->n:Ly2/v;

    invoke-interface {v0, v2, v4}, Lw2/q;->foldIn(Ljava/lang/Object;LVm/n;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LE2/r;

    if-eqz v0, :cond_7

    iget-object v1, v0, LE2/r;->a:LJ2/h;

    :cond_7
    instance-of v0, v1, LJ2/g;

    if-eqz v0, :cond_b

    if-eqz v3, :cond_8

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    goto :goto_5

    :cond_8
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lw2/l;

    invoke-interface {v1}, Lw2/l;->a()Lw2/q;

    move-result-object v1

    sget-object v3, Ly2/v;->p:Ly2/v;

    invoke-interface {v1, v2, v3}, Lw2/q;->foldIn(Ljava/lang/Object;LVm/n;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, LE2/r;

    if-eqz v1, :cond_a

    iget-object v1, v1, LE2/r;->a:LJ2/h;

    goto :goto_4

    :cond_a
    move-object v1, v2

    :goto_4
    instance-of v1, v1, LJ2/e;

    if-eqz v1, :cond_9

    invoke-interface {p0}, Lw2/l;->a()Lw2/q;

    move-result-object v0

    invoke-static {v0}, LP2/y;->C(Lw2/q;)Lw2/q;

    move-result-object v0

    invoke-interface {p0, v0}, Lw2/l;->b(Lw2/q;)V

    :cond_b
    :goto_5
    return-void
.end method

.method public static final m(Lkf/b;LVm/k;LA0/r;Lm0/l;I)V
    .locals 25

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v4, p4

    const-string v0, "model"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onUiAction"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v14, p3

    check-cast v14, Lm0/q;

    const v0, 0x42bed71c

    invoke-virtual {v14, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, v4, 0x6

    if-nez v0, :cond_1

    invoke-virtual {v14, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int/2addr v0, v4

    goto :goto_1

    :cond_1
    move v0, v4

    :goto_1
    and-int/lit8 v5, v4, 0x30

    if-nez v5, :cond_3

    invoke-virtual {v14, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    const/16 v5, 0x20

    goto :goto_2

    :cond_2
    const/16 v5, 0x10

    :goto_2
    or-int/2addr v0, v5

    :cond_3
    and-int/lit16 v5, v4, 0x180

    if-nez v5, :cond_5

    invoke-virtual {v14, v3}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    const/16 v5, 0x100

    goto :goto_3

    :cond_4
    const/16 v5, 0x80

    :goto_3
    or-int/2addr v0, v5

    :cond_5
    and-int/lit16 v5, v0, 0x93

    const/16 v7, 0x92

    if-ne v5, v7, :cond_7

    invoke-virtual {v14}, Lm0/q;->H()Z

    move-result v5

    if-nez v5, :cond_6

    goto :goto_4

    :cond_6
    invoke-virtual {v14}, Lm0/q;->Y()V

    goto/16 :goto_b

    :cond_7
    :goto_4
    const/high16 v5, 0x3f800000    # 1.0f

    invoke-static {v3, v5}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v7

    sget-object v8, LG/l;->c:LG/f;

    sget-object v9, LA0/d;->m:LA0/g;

    const/4 v10, 0x0

    invoke-static {v8, v9, v14, v10}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v9

    iget-wide v11, v14, Lm0/q;->T:J

    invoke-static {v11, v12}, Ljava/lang/Long;->hashCode(J)I

    move-result v11

    invoke-virtual {v14}, Lm0/q;->m()Lm0/o0;

    move-result-object v12

    invoke-static {v7, v14}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v7

    sget-object v13, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v13, LZ0/g;->b:LZ0/f;

    invoke-virtual {v14}, Lm0/q;->j0()V

    iget-boolean v15, v14, Lm0/q;->S:Z

    if-eqz v15, :cond_8

    invoke-virtual {v14, v13}, Lm0/q;->l(LVm/a;)V

    goto :goto_5

    :cond_8
    invoke-virtual {v14}, Lm0/q;->t0()V

    :goto_5
    sget-object v15, LZ0/g;->f:LZ0/e;

    invoke-static {v15, v9, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v9, LZ0/g;->e:LZ0/e;

    invoke-static {v9, v12, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    sget-object v12, LZ0/g;->g:LZ0/e;

    invoke-static {v14, v11, v12}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v11, LZ0/g;->h:LZ0/d;

    invoke-static {v14, v11}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v6, LZ0/g;->d:LZ0/e;

    invoke-static {v6, v7, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v16, LA0/o;->a:LA0/o;

    move-object/from16 v17, v11

    float-to-double v10, v5

    const-wide/16 v18, 0x0

    cmpl-double v10, v10, v18

    if-lez v10, :cond_9

    goto :goto_6

    :cond_9
    const-string v10, "invalid weight; must be greater than zero"

    invoke-static {v10}, LH/a;->a(Ljava/lang/String;)V

    :goto_6
    new-instance v10, LG/x0;

    const/4 v11, 0x1

    invoke-direct {v10, v5, v11}, LG/x0;-><init>(FZ)V

    invoke-static {v14}, Ly/x;->n(Lm0/l;)Ly/B0;

    move-result-object v5

    invoke-static {v10, v5, v11}, Ly/x;->o(LA0/r;Ly/B0;Z)LA0/r;

    move-result-object v5

    sget-object v10, LA0/d;->n:LA0/g;

    const/16 v7, 0x30

    invoke-static {v8, v10, v14, v7}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v7

    move-object v8, v12

    iget-wide v11, v14, Lm0/q;->T:J

    invoke-static {v11, v12}, Ljava/lang/Long;->hashCode(J)I

    move-result v11

    invoke-virtual {v14}, Lm0/q;->m()Lm0/o0;

    move-result-object v12

    invoke-static {v5, v14}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v5

    invoke-virtual {v14}, Lm0/q;->j0()V

    iget-boolean v10, v14, Lm0/q;->S:Z

    if-eqz v10, :cond_a

    invoke-virtual {v14, v13}, Lm0/q;->l(LVm/a;)V

    goto :goto_7

    :cond_a
    invoke-virtual {v14}, Lm0/q;->t0()V

    :goto_7
    invoke-static {v15, v7, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v9, v12, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object/from16 v7, v17

    invoke-static {v11, v14, v8, v14, v7}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    invoke-static {v6, v5, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v14}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v5

    iget v5, v5, Lhh/i;->i:F

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v17, 0x0

    const/16 v21, 0xd

    move/from16 v18, v5

    invoke-static/range {v16 .. v21}, LG/e;->L(LA0/r;FFFFI)LA0/r;

    move-result-object v5

    const/4 v7, 0x0

    invoke-static {v5, v14, v7}, LIm/s;->C(LA0/r;Lm0/l;I)V

    sget-object v5, Lih/h;->g:Lih/h;

    const v6, 0x7f12070b

    invoke-static {v14, v6}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v14}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v8

    iget v8, v8, Lhh/i;->g:F

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v17, 0x0

    const/16 v21, 0xd

    move/from16 v18, v8

    invoke-static/range {v16 .. v21}, LG/e;->L(LA0/r;FFFFI)LA0/r;

    move-result-object v8

    move-object/from16 v18, v16

    const/4 v13, 0x0

    const/4 v15, 0x0

    move/from16 v22, v7

    move-object v7, v8

    const-wide/16 v8, 0x0

    const/4 v10, 0x3

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x3ec

    move/from16 v24, v0

    const/16 v0, 0x20

    invoke-virtual/range {v5 .. v17}, Lih/h;->h(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    const v5, 0x6c752db3

    invoke-virtual {v14, v5}, Lm0/q;->f0(I)V

    and-int/lit8 v5, v24, 0x70

    if-ne v5, v0, :cond_b

    const/4 v10, 0x1

    goto :goto_8

    :cond_b
    const/4 v10, 0x0

    :goto_8
    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v6

    sget-object v7, Lm0/k;->a:Lm0/e;

    if-nez v10, :cond_c

    if-ne v6, v7, :cond_d

    :cond_c
    new-instance v6, Lcf/o;

    const/16 v8, 0x1c

    invoke-direct {v6, v8, v2}, Lcf/o;-><init>(ILVm/k;)V

    invoke-virtual {v14, v6}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_d
    check-cast v6, LVm/a;

    const/4 v8, 0x0

    invoke-virtual {v14, v8}, Lm0/q;->q(Z)V

    invoke-static {v14}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v9

    iget v9, v9, Lhh/i;->f:F

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v17, 0x0

    const/16 v21, 0xd

    move-object/from16 v16, v18

    move/from16 v18, v9

    invoke-static/range {v16 .. v21}, LG/e;->L(LA0/r;FFFFI)LA0/r;

    move-result-object v9

    invoke-static {v8, v9, v6, v14}, LIm/s;->k(ILA0/r;LVm/a;Lm0/l;)V

    invoke-static {v14}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v6

    iget v6, v6, Lhh/i;->g:F

    invoke-static {v14}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v8

    iget v8, v8, Lhh/i;->e:F

    const/16 v17, 0x0

    const/16 v19, 0x0

    const/16 v21, 0x5

    move/from16 v18, v6

    move/from16 v20, v8

    invoke-static/range {v16 .. v21}, LG/e;->L(LA0/r;FFFFI)LA0/r;

    move-result-object v6

    and-int/lit8 v8, v24, 0x7e

    invoke-static {v1, v2, v6, v14, v8}, LIm/s;->h(Lkf/b;LVm/k;LA0/r;Lm0/l;I)V

    const/4 v6, 0x1

    invoke-virtual {v14, v6}, Lm0/q;->q(Z)V

    sget-object v8, LOg/e;->b:LOg/e;

    const v9, 0x7f120708

    invoke-static {v14, v9}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v9

    iget-boolean v10, v1, Lkf/b;->b:Z

    if-eqz v10, :cond_e

    iget-boolean v10, v1, Lkf/b;->c:Z

    if-eqz v10, :cond_e

    iget-boolean v10, v1, Lkf/b;->d:Z

    if-nez v10, :cond_e

    move v11, v6

    goto :goto_9

    :cond_e
    const/4 v11, 0x0

    :goto_9
    const v10, 0x34f1f446

    invoke-virtual {v14, v10}, Lm0/q;->f0(I)V

    if-ne v5, v0, :cond_f

    move v10, v6

    goto :goto_a

    :cond_f
    const/4 v10, 0x0

    :goto_a
    invoke-virtual {v14, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    or-int/2addr v0, v10

    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v5

    if-nez v0, :cond_10

    if-ne v5, v7, :cond_11

    :cond_10
    new-instance v5, Lgf/b;

    const/16 v0, 0x9

    invoke-direct {v5, v0, v2, v1}, Lgf/b;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v14, v5}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_11
    move-object v15, v5

    check-cast v15, LVm/a;

    const/4 v7, 0x0

    invoke-virtual {v14, v7}, Lm0/q;->q(Z)V

    move-object/from16 v16, v14

    const/4 v14, 0x0

    const/16 v18, 0x0

    move/from16 v23, v6

    const/4 v6, 0x0

    move-object v5, v8

    const/4 v8, 0x0

    move-object v7, v9

    const/4 v9, 0x0

    const/4 v10, 0x0

    iget-boolean v12, v1, Lkf/b;->d:Z

    const/4 v13, 0x0

    const/16 v17, 0x0

    const/16 v19, 0x33d

    move/from16 v0, v23

    invoke-virtual/range {v5 .. v19}, LOg/e;->g(LA0/r;Ljava/lang/String;Ljava/lang/Integer;Lhh/n;Lhh/d;ZZLhh/e;LJg/b;LVm/a;Lm0/l;III)V

    move-object/from16 v14, v16

    invoke-virtual {v14, v0}, Lm0/q;->q(Z)V

    :goto_b
    invoke-virtual {v14}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_12

    new-instance v0, Lmf/c;

    const/4 v5, 0x1

    invoke-direct/range {v0 .. v5}, Lmf/c;-><init>(Lkf/b;LVm/k;LA0/r;II)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_12
    return-void
.end method

.method public static m0(Ljava/lang/String;LZa/u;)LRc/g;
    .locals 3

    const-string v0, "deviceId"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "action"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, LRc/g;

    new-instance v1, LZa/x;

    invoke-direct {v1, p0}, LZa/x;-><init>(Ljava/lang/String;)V

    new-instance p0, LZa/v;

    invoke-virtual {p1}, LZa/u;->a()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, LZa/v;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x2

    new-array p1, p1, [LRc/c;

    const/4 v2, 0x0

    aput-object v1, p1, v2

    const/4 v1, 0x1

    aput-object p0, p1, v1

    invoke-direct {v0, p1}, LRc/g;-><init>([LRc/c;)V

    return-object v0
.end method

.method public static final n(LVm/a;Lm0/l;I)V
    .locals 33

    move-object/from16 v0, p0

    move/from16 v1, p2

    move-object/from16 v12, p1

    check-cast v12, Lm0/q;

    const v2, 0x4d09b18b    # 1.4438213E8f

    invoke-virtual {v12, v2}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v2, v1, 0x6

    const/4 v3, 0x2

    const/4 v4, 0x4

    if-nez v2, :cond_1

    invoke-virtual {v12, v0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v2, v4

    goto :goto_0

    :cond_0
    move v2, v3

    :goto_0
    or-int/2addr v2, v1

    goto :goto_1

    :cond_1
    move v2, v1

    :goto_1
    and-int/lit8 v5, v2, 0x3

    if-ne v5, v3, :cond_3

    invoke-virtual {v12}, Lm0/q;->H()Z

    move-result v3

    if-nez v3, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v12}, Lm0/q;->Y()V

    goto/16 :goto_5

    :cond_3
    :goto_2
    const v3, 0x7f12038d

    invoke-static {v12, v3}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v3

    const v5, 0x7f12070c

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v6

    invoke-static {v5, v6, v12}, LP2/j;->H(I[Ljava/lang/Object;Lm0/l;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x6

    invoke-static {v5, v3, v6, v6, v7}, Llo/n;->o0(Ljava/lang/CharSequence;Ljava/lang/String;IZI)I

    move-result v7

    move v8, v2

    sget-object v2, Lih/h;->b:Lih/h;

    const v9, 0xbe7a629

    invoke-virtual {v12, v9}, Lm0/q;->f0(I)V

    new-instance v9, Lk1/e;

    invoke-direct {v9}, Lk1/e;-><init>()V

    if-gez v7, :cond_4

    invoke-virtual {v9, v5}, Lk1/e;->a(Ljava/lang/String;)V

    goto/16 :goto_4

    :cond_4
    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    const-string v11, "substring(...)"

    invoke-static {v10, v11}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v9, v10}, Lk1/e;->a(Ljava/lang/String;)V

    new-instance v10, Lk1/Q;

    new-instance v13, Lk1/K;

    sget-object v30, Lv1/l;->c:Lv1/l;

    const-wide/16 v28, 0x0

    const/16 v31, 0x0

    const-wide/16 v14, 0x0

    const-wide/16 v16, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const-wide/16 v23, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const v32, 0xefff

    invoke-direct/range {v13 .. v32}, Lk1/K;-><init>(JJLo1/t;Lo1/p;Lo1/q;Lo1/i;Ljava/lang/String;JLv1/a;Lv1/p;Lr1/b;JLv1/l;LH0/W;I)V

    const/4 v14, 0x0

    invoke-direct {v10, v13, v14, v14, v14}, Lk1/Q;-><init>(Lk1/K;Lk1/K;Lk1/K;Lk1/K;)V

    const v13, 0x3f2bd6ba

    invoke-virtual {v12, v13}, Lm0/q;->f0(I)V

    and-int/lit8 v8, v8, 0xe

    if-ne v8, v4, :cond_5

    const/4 v4, 0x1

    goto :goto_3

    :cond_5
    move v4, v6

    :goto_3
    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v8

    if-nez v4, :cond_6

    sget-object v4, Lm0/k;->a:Lm0/e;

    if-ne v8, v4, :cond_7

    :cond_6
    new-instance v8, LEe/b;

    const/4 v4, 0x4

    invoke-direct {v8, v4, v0}, LEe/b;-><init>(ILVm/a;)V

    invoke-virtual {v12, v8}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_7
    check-cast v8, Lk1/p;

    invoke-virtual {v12, v6}, Lm0/q;->q(Z)V

    new-instance v4, Lk1/n;

    const-string v13, ""

    invoke-direct {v4, v13, v10, v8}, Lk1/n;-><init>(Ljava/lang/String;Lk1/Q;Lk1/p;)V

    invoke-virtual {v9, v4}, Lk1/e;->e(Lk1/o;)I

    move-result v4

    :try_start_0
    invoke-virtual {v9, v3}, Lk1/e;->a(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v9, v4}, Lk1/e;->d(I)V

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v3, v7

    invoke-virtual {v5, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v11}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v9, v3}, Lk1/e;->a(Ljava/lang/String;)V

    :goto_4
    invoke-virtual {v9}, Lk1/e;->g()Lk1/h;

    move-result-object v3

    invoke-virtual {v12, v6}, Lm0/q;->q(Z)V

    invoke-static {v12}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v4

    iget-object v4, v4, Lhh/h;->k:Lhh/v;

    iget-wide v5, v4, Lhh/v;->c:J

    const/4 v11, 0x0

    const/4 v13, 0x0

    const/4 v4, 0x0

    const/4 v7, 0x5

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v14, 0x0

    const/16 v15, 0x3e6

    invoke-virtual/range {v2 .. v15}, Lih/h;->k(Lk1/h;LA0/o;JIZIILVm/k;Lm0/l;III)V

    :goto_5
    invoke-virtual {v12}, Lm0/q;->u()Lm0/t0;

    move-result-object v2

    if-eqz v2, :cond_8

    new-instance v3, LAe/H;

    const/16 v4, 0x8

    invoke-direct {v3, v1, v4, v0}, LAe/H;-><init>(IILVm/a;)V

    iput-object v3, v2, Lm0/t0;->d:LVm/n;

    :cond_8
    return-void

    :catchall_0
    move-exception v0

    invoke-virtual {v9, v4}, Lk1/e;->d(I)V

    throw v0
.end method

.method public static final n0(Ljava/util/List;)Ljava/util/List;
    .locals 2

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    return-object p0

    :cond_0
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, LIm/s;->f0(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_1
    sget-object p0, LIm/z;->a:LIm/z;

    return-object p0
.end method

.method public static final o(Lm0/l;I)V
    .locals 7

    check-cast p0, Lm0/q;

    const v0, 0x2c6cc63d

    invoke-virtual {p0, v0}, Lm0/q;->h0(I)Lm0/q;

    if-nez p1, :cond_1

    invoke-virtual {p0}, Lm0/q;->H()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lm0/q;->Y()V

    goto :goto_1

    :cond_1
    :goto_0
    invoke-static {p0}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v0

    iget-object v0, v0, Lhh/h;->b:Lhh/b;

    iget-wide v0, v0, Lhh/b;->c:J

    sget-object v2, LA0/o;->a:LA0/o;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v2, v3}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v2

    const/4 v3, 0x1

    int-to-float v3, v3

    invoke-static {v2, v3}, Landroidx/compose/foundation/layout/b;->e(LA0/r;F)LA0/r;

    move-result-object v2

    sget-wide v3, LH0/w;->g:J

    new-instance v5, LH0/w;

    invoke-direct {v5, v3, v4}, LH0/w;-><init>(J)V

    new-instance v6, LH0/w;

    invoke-direct {v6, v0, v1}, LH0/w;-><init>(J)V

    new-instance v0, LH0/w;

    invoke-direct {v0, v3, v4}, LH0/w;-><init>(J)V

    filled-new-array {v5, v6, v0}, [LH0/w;

    move-result-object v0

    invoke-static {v0}, LIm/s;->g0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    const/16 v1, 0xe

    const/4 v3, 0x0

    invoke-static {v3, v3, v1, v0}, Lkl/b;->h(FFILjava/util/List;)LH0/J;

    move-result-object v0

    const/4 v1, 0x6

    const/4 v4, 0x0

    invoke-static {v2, v0, v4, v3, v1}, Ly/x;->f(LA0/r;LH0/t;LO/d;FI)LA0/r;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p0, v1}, LG/t;->a(LA0/r;Lm0/l;I)V

    :goto_1
    invoke-virtual {p0}, Lm0/q;->u()Lm0/t0;

    move-result-object p0

    if-eqz p0, :cond_2

    new-instance v0, LWf/m0;

    const/4 v1, 0x5

    invoke-direct {v0, p1, v1}, LWf/m0;-><init>(II)V

    iput-object v0, p0, Lm0/t0;->d:LVm/n;

    :cond_2
    return-void
.end method

.method public static final o0(II)V
    .locals 4

    const-string v0, ")."

    if-ltz p1, :cond_1

    if-gt p1, p0, :cond_0

    return-void

    :cond_0
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "toIndex ("

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ") is greater than size ("

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v1, "fromIndex (0) is greater than toIndex ("

    invoke-static {p1, v1, v0}, Lj/m;->g(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final p(Lm0/l;I)V
    .locals 33

    move-object/from16 v5, p0

    check-cast v5, Lm0/q;

    const v1, 0x7d6b48db

    invoke-virtual {v5, v1}, Lm0/q;->h0(I)Lm0/q;

    if-nez p1, :cond_1

    invoke-virtual {v5}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v5}, Lm0/q;->Y()V

    goto/16 :goto_6

    :cond_1
    :goto_0
    const v1, 0x7f080261

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const v2, 0x7f120c2f

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, LHm/k;

    invoke-direct {v3, v1, v2}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    const v1, 0x7f08017c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const v2, 0x7f120c2d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v4, LHm/k;

    invoke-direct {v4, v1, v2}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    const v1, 0x7f0801b5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const v2, 0x7f121213

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v6, LHm/k;

    invoke-direct {v6, v1, v2}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {v3, v4, v6}, [LHm/k;

    move-result-object v1

    invoke-static {v1}, LIm/s;->g0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v15

    sget-object v8, LA0/o;->a:LA0/o;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v8, v1}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v1

    sget-object v2, Leh/a;->THIN:Leh/a;

    invoke-static {v5}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v3

    iget v3, v3, Lhh/i;->e:F

    const/4 v7, 0x4

    const/4 v4, 0x0

    const/16 v6, 0x36

    invoke-static/range {v1 .. v7}, Llj/o;->D(LA0/r;Leh/a;FLkm/o;Lm0/l;II)LA0/r;

    move-result-object v1

    invoke-static {v5}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v2

    iget v2, v2, Lhh/i;->e:F

    invoke-static {v1, v2}, LG/e;->H(LA0/r;F)LA0/r;

    move-result-object v1

    sget-object v2, LG/l;->a:LG/d;

    invoke-static {v5}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v2

    iget v2, v2, Lhh/i;->d:F

    invoke-static {v2}, LG/l;->g(F)LG/j;

    move-result-object v2

    sget-object v3, LA0/d;->m:LA0/g;

    const/4 v4, 0x0

    invoke-static {v2, v3, v5, v4}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v2

    iget-wide v6, v5, Lm0/q;->T:J

    invoke-static {v6, v7}, Ljava/lang/Long;->hashCode(J)I

    move-result v6

    invoke-virtual {v5}, Lm0/q;->m()Lm0/o0;

    move-result-object v7

    invoke-static {v1, v5}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v1

    sget-object v9, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v9, LZ0/g;->b:LZ0/f;

    invoke-virtual {v5}, Lm0/q;->j0()V

    iget-boolean v10, v5, Lm0/q;->S:Z

    if-eqz v10, :cond_2

    invoke-virtual {v5, v9}, Lm0/q;->l(LVm/a;)V

    goto :goto_1

    :cond_2
    invoke-virtual {v5}, Lm0/q;->t0()V

    :goto_1
    sget-object v10, LZ0/g;->f:LZ0/e;

    invoke-static {v10, v2, v5}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v2, LZ0/g;->e:LZ0/e;

    invoke-static {v2, v7, v5}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    sget-object v7, LZ0/g;->g:LZ0/e;

    invoke-static {v5, v6, v7}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v6, LZ0/g;->h:LZ0/d;

    invoke-static {v5, v6}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v11, LZ0/g;->d:LZ0/e;

    invoke-static {v11, v1, v5}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v1, Lih/h;->d:Lih/h;

    const v12, 0x7f1203a6

    invoke-static {v5, v12}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v12

    sget-object v13, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v12, v13}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v12

    const-string v13, "toUpperCase(...)"

    invoke-static {v12, v13}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v5}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v13

    iget-object v13, v13, Lhh/h;->k:Lhh/v;

    iget-wide v13, v13, Lhh/v;->d:J

    move-object/from16 v16, v10

    const/4 v10, 0x0

    move-object/from16 v17, v2

    move-object v2, v12

    const/4 v12, 0x0

    move-object/from16 v18, v3

    const/4 v3, 0x0

    move/from16 v19, v4

    const/4 v4, 0x0

    move-object/from16 v20, v7

    const/4 v7, 0x0

    move-object/from16 v21, v8

    const/4 v8, 0x0

    move-object/from16 v22, v9

    const/4 v9, 0x0

    move-object/from16 v23, v11

    move-object v11, v5

    move-wide/from16 v31, v13

    move-object v14, v6

    move-wide/from16 v5, v31

    const/4 v13, 0x0

    move-object/from16 v24, v14

    const/16 v14, 0x3f6

    move-object/from16 p0, v15

    move-object/from16 v26, v16

    move-object/from16 v27, v17

    move-object/from16 v15, v18

    move/from16 v0, v19

    move-object/from16 v28, v20

    move-object/from16 v25, v22

    move-object/from16 v30, v23

    move-object/from16 v29, v24

    invoke-virtual/range {v1 .. v14}, Lih/h;->o(Ljava/lang/String;LA0/r;Lk1/U;JIZIILm0/l;III)V

    move-object v5, v11

    invoke-static {v5}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v1

    iget v1, v1, Lhh/i;->c:F

    invoke-static {v1}, LG/l;->g(F)LG/j;

    move-result-object v1

    invoke-static {v1, v15, v5, v0}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v1

    iget-wide v2, v5, Lm0/q;->T:J

    invoke-static {v2, v3}, Ljava/lang/Long;->hashCode(J)I

    move-result v2

    invoke-virtual {v5}, Lm0/q;->m()Lm0/o0;

    move-result-object v3

    move-object/from16 v14, v21

    invoke-static {v14, v5}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v4

    invoke-virtual {v5}, Lm0/q;->j0()V

    iget-boolean v6, v5, Lm0/q;->S:Z

    if-eqz v6, :cond_3

    move-object/from16 v6, v25

    invoke-virtual {v5, v6}, Lm0/q;->l(LVm/a;)V

    :goto_2
    move-object/from16 v6, v26

    goto :goto_3

    :cond_3
    invoke-virtual {v5}, Lm0/q;->t0()V

    goto :goto_2

    :goto_3
    invoke-static {v6, v1, v5}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object/from16 v1, v27

    invoke-static {v1, v3, v5}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object/from16 v1, v28

    move-object/from16 v3, v29

    invoke-static {v2, v5, v1, v5, v3}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    const v1, -0x747ed891

    move-object/from16 v2, p0

    move-object/from16 v3, v30

    invoke-static {v5, v4, v3, v1, v2}, Lcom/eightsleep/data_bioage/data/model/a;->p(Lm0/q;LA0/r;LZ0/e;ILjava/util/List;)Ljava/util/Iterator;

    move-result-object v15

    :goto_4
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v9, 0x1

    if-eqz v1, :cond_5

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, LHm/k;

    iget-object v2, v1, LHm/k;->a:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    iget-object v1, v1, LHm/k;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v10

    sget-object v1, LG/l;->a:LG/d;

    invoke-static {v5}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v1

    iget v1, v1, Lhh/i;->d:F

    invoke-static {v1}, LG/l;->g(F)LG/j;

    move-result-object v1

    sget-object v3, LA0/d;->j:LA0/h;

    invoke-static {v1, v3, v5, v0}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v1

    iget-wide v3, v5, Lm0/q;->T:J

    invoke-static {v3, v4}, Ljava/lang/Long;->hashCode(J)I

    move-result v3

    invoke-virtual {v5}, Lm0/q;->m()Lm0/o0;

    move-result-object v4

    invoke-static {v14, v5}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v6

    sget-object v7, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v7, LZ0/g;->b:LZ0/f;

    invoke-virtual {v5}, Lm0/q;->j0()V

    iget-boolean v8, v5, Lm0/q;->S:Z

    if-eqz v8, :cond_4

    invoke-virtual {v5, v7}, Lm0/q;->l(LVm/a;)V

    goto :goto_5

    :cond_4
    invoke-virtual {v5}, Lm0/q;->t0()V

    :goto_5
    sget-object v7, LZ0/g;->f:LZ0/e;

    invoke-static {v7, v1, v5}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v1, LZ0/g;->e:LZ0/e;

    invoke-static {v1, v4, v5}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v3, LZ0/g;->g:LZ0/e;

    invoke-static {v5, v1, v3}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v1, LZ0/g;->h:LZ0/d;

    invoke-static {v5, v1}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v1, LZ0/g;->d:LZ0/e;

    invoke-static {v1, v6, v5}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const/4 v1, 0x6

    invoke-static {v2, v1, v5}, LIm/s;->w0(IILm0/l;)LM0/f;

    move-result-object v1

    invoke-static {v5}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v2

    iget-object v2, v2, Lhh/h;->k:Lhh/v;

    iget-wide v2, v2, Lhh/v;->a:J

    invoke-static {v5}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v4

    iget v4, v4, Lhh/i;->f:F

    invoke-static {v14, v4}, Landroidx/compose/foundation/layout/b;->n(LA0/r;F)LA0/r;

    move-result-object v4

    const/4 v8, 0x0

    move-object v11, v5

    move-wide/from16 v31, v2

    move-object v3, v4

    move-wide/from16 v4, v31

    const/4 v2, 0x0

    const/16 v7, 0x30

    move-object v6, v11

    invoke-static/range {v1 .. v8}, Lj0/I0;->b(LM0/f;Ljava/lang/String;LA0/r;JLm0/l;II)V

    move-object v5, v6

    sget-object v1, Lih/h;->b:Lih/h;

    invoke-static {v5, v10}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v5}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v3

    iget-object v3, v3, Lhh/h;->k:Lhh/v;

    iget-wide v3, v3, Lhh/v;->a:J

    move v6, v9

    const/4 v9, 0x0

    const/4 v11, 0x0

    move-object v10, v5

    move-wide v4, v3

    const/4 v3, 0x0

    move v7, v6

    const/4 v6, 0x0

    move v8, v7

    const/4 v7, 0x0

    move v12, v8

    const/4 v8, 0x0

    move v13, v12

    const/4 v12, 0x0

    move/from16 v16, v13

    const/16 v13, 0x3f6

    move/from16 v0, v16

    invoke-virtual/range {v1 .. v13}, Lih/h;->h(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    move-object v5, v10

    invoke-virtual {v5, v0}, Lm0/q;->q(Z)V

    const/4 v0, 0x0

    goto/16 :goto_4

    :cond_5
    move v1, v0

    move v0, v9

    invoke-static {v5, v1, v0, v0}, Ly2/K;->d(Lm0/q;ZZZ)V

    :goto_6
    invoke-virtual {v5}, Lm0/q;->u()Lm0/t0;

    move-result-object v0

    if-eqz v0, :cond_6

    new-instance v1, Lmd/f;

    const/16 v2, 0xa

    move/from16 v3, p1

    invoke-direct {v1, v3, v2}, Lmd/f;-><init>(II)V

    iput-object v1, v0, Lm0/t0;->d:LVm/n;

    :cond_6
    return-void
.end method

.method public static final p0(Lcom/eightsleep/data_core/enums/ai_insights/AiInsightSentiment;Lm0/l;)J
    .locals 4

    check-cast p1, Lm0/q;

    const v0, 0x1c5a02c0

    invoke-virtual {p1, v0}, Lm0/q;->f0(I)V

    sget-object v0, LWf/T0;->b:[I

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eq p0, v0, :cond_1

    const/4 v0, 0x2

    if-eq p0, v0, :cond_0

    const p0, -0xe62cf4d

    invoke-virtual {p1, p0}, Lm0/q;->f0(I)V

    invoke-static {p1}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object p0

    iget-object p0, p0, Lhh/h;->k:Lhh/v;

    iget-wide v2, p0, Lhh/v;->a:J

    invoke-virtual {p1, v1}, Lm0/q;->q(Z)V

    goto :goto_0

    :cond_0
    const p0, -0xe62d50f

    invoke-virtual {p1, p0}, Lm0/q;->f0(I)V

    invoke-static {p1}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object p0

    iget-object p0, p0, Lhh/h;->k:Lhh/v;

    iget-wide v2, p0, Lhh/v;->h:J

    invoke-virtual {p1, v1}, Lm0/q;->q(Z)V

    goto :goto_0

    :cond_1
    const p0, -0xe62dded

    invoke-virtual {p1, p0}, Lm0/q;->f0(I)V

    invoke-static {p1}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object p0

    iget-object p0, p0, Lhh/h;->k:Lhh/v;

    iget-wide v2, p0, Lhh/v;->f:J

    invoke-virtual {p1, v1}, Lm0/q;->q(Z)V

    :goto_0
    invoke-virtual {p1, v1}, Lm0/q;->q(Z)V

    return-wide v2
.end method

.method public static final q(LA0/r;FLg8/p;Lm0/l;II)V
    .locals 13

    move/from16 v4, p4

    move-object/from16 v10, p3

    check-cast v10, Lm0/q;

    const v0, -0x4371a7ee

    invoke-virtual {v10, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, p5, 0x1

    if-eqz v0, :cond_0

    or-int/lit8 v1, v4, 0x6

    goto :goto_1

    :cond_0
    invoke-virtual {v10, p0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x4

    goto :goto_0

    :cond_1
    const/4 v1, 0x2

    :goto_0
    or-int/2addr v1, v4

    :goto_1
    and-int/lit8 v2, p5, 0x2

    if-eqz v2, :cond_2

    or-int/lit8 v1, v1, 0x30

    goto :goto_3

    :cond_2
    and-int/lit8 v3, v4, 0x30

    if-nez v3, :cond_4

    invoke-virtual {v10, p1}, Lm0/q;->d(F)Z

    move-result v3

    if-eqz v3, :cond_3

    const/16 v3, 0x20

    goto :goto_2

    :cond_3
    const/16 v3, 0x10

    :goto_2
    or-int/2addr v1, v3

    :cond_4
    :goto_3
    and-int/lit16 v3, v4, 0x180

    if-nez v3, :cond_6

    invoke-virtual {v10, p2}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    const/16 v5, 0x100

    goto :goto_4

    :cond_5
    const/16 v5, 0x80

    :goto_4
    or-int/2addr v1, v5

    :cond_6
    and-int/lit16 v1, v1, 0x93

    const/16 v5, 0x92

    if-ne v1, v5, :cond_8

    invoke-virtual {v10}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_7

    goto :goto_6

    :cond_7
    invoke-virtual {v10}, Lm0/q;->Y()V

    :goto_5
    move-object v1, p0

    move v2, p1

    goto :goto_7

    :cond_8
    :goto_6
    if-eqz v0, :cond_9

    sget-object p0, LA0/o;->a:LA0/o;

    :cond_9
    if-eqz v2, :cond_a

    const/16 p1, 0x18

    int-to-float p1, p1

    :cond_a
    invoke-static {p0, p1}, Landroidx/compose/foundation/layout/b;->n(LA0/r;F)LA0/r;

    move-result-object v7

    invoke-virtual {p2}, Lg8/p;->a()I

    move-result v0

    const/4 v1, 0x6

    invoke-static {v0, v1, v10}, LIm/s;->w0(IILm0/l;)LM0/f;

    move-result-object v5

    invoke-static {v10}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v0

    iget-object v0, v0, Lhh/h;->l:Lhh/p;

    iget-wide v8, v0, Lhh/p;->a:J

    const/4 v12, 0x0

    const/4 v6, 0x0

    const/16 v11, 0x30

    invoke-static/range {v5 .. v12}, Lj0/I0;->b(LM0/f;Ljava/lang/String;LA0/r;JLm0/l;II)V

    goto :goto_5

    :goto_7
    invoke-virtual {v10}, Lm0/q;->u()Lm0/t0;

    move-result-object p0

    if-eqz p0, :cond_b

    new-instance v0, Lg8/L;

    const/4 v6, 0x0

    move-object v3, p2

    move/from16 v5, p5

    invoke-direct/range {v0 .. v6}, Lg8/L;-><init>(Ljava/lang/Object;FLjava/lang/Object;III)V

    iput-object v0, p0, Lm0/t0;->d:LVm/n;

    :cond_b
    return-void
.end method

.method public static final q0(Ljava/util/List;)Ljava/util/ArrayList;
    .locals 11

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p0, v1}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lyf/e;

    iget-object v1, v2, Lyf/e;->h:Ljava/lang/Boolean;

    if-eqz v1, :cond_0

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_1
    move-object v9, v1

    goto :goto_2

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :goto_2
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/16 v10, 0x17f

    invoke-static/range {v2 .. v10}, Lyf/e;->a(Lyf/e;Lyf/h;Ljava/lang/String;Ljava/util/ArrayList;Lyf/g;Ljava/time/LocalDate;ZLjava/lang/Boolean;I)Lyf/e;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public static final r(LA0/r;ILg8/p;ZLVm/k;Lm0/l;II)V
    .locals 22

    move/from16 v4, p3

    move-object/from16 v5, p4

    move/from16 v6, p6

    move-object/from16 v12, p5

    check-cast v12, Lm0/q;

    const v0, 0x26d75222

    invoke-virtual {v12, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, p7, 0x1

    const/4 v1, 0x2

    const/4 v2, 0x4

    if-eqz v0, :cond_0

    or-int/lit8 v3, v6, 0x6

    move v7, v3

    move-object/from16 v3, p0

    goto :goto_1

    :cond_0
    and-int/lit8 v3, v6, 0x6

    if-nez v3, :cond_2

    move-object/from16 v3, p0

    invoke-virtual {v12, v3}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    move v7, v2

    goto :goto_0

    :cond_1
    move v7, v1

    :goto_0
    or-int/2addr v7, v6

    goto :goto_1

    :cond_2
    move-object/from16 v3, p0

    move v7, v6

    :goto_1
    or-int/lit16 v7, v7, 0x1b0

    invoke-virtual {v12, v4}, Lm0/q;->h(Z)Z

    move-result v8

    const/16 v9, 0x800

    if-eqz v8, :cond_3

    move v8, v9

    goto :goto_2

    :cond_3
    const/16 v8, 0x400

    :goto_2
    or-int/2addr v7, v8

    and-int/lit16 v8, v6, 0x6000

    const/16 v10, 0x4000

    if-nez v8, :cond_5

    invoke-virtual {v12, v5}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    move v8, v10

    goto :goto_3

    :cond_4
    const/16 v8, 0x2000

    :goto_3
    or-int/2addr v7, v8

    :cond_5
    and-int/lit16 v8, v7, 0x2493

    const/16 v11, 0x2492

    if-ne v8, v11, :cond_7

    invoke-virtual {v12}, Lm0/q;->H()Z

    move-result v8

    if-nez v8, :cond_6

    goto :goto_4

    :cond_6
    invoke-virtual {v12}, Lm0/q;->Y()V

    move/from16 v2, p1

    move-object v1, v3

    move-object/from16 v3, p2

    goto/16 :goto_a

    :cond_7
    :goto_4
    if-eqz v0, :cond_8

    sget-object v0, LA0/o;->a:LA0/o;

    goto :goto_5

    :cond_8
    move-object v0, v3

    :goto_5
    sget-object v3, Lg8/p;->DOWN:Lg8/p;

    sget-object v8, Lm0/k;->a:Lm0/e;

    const/16 v15, 0x18

    int-to-float v11, v15

    invoke-static {v0, v11}, Landroidx/compose/foundation/layout/b;->n(LA0/r;F)LA0/r;

    move-result-object v16

    const v11, 0x46dc7d28

    invoke-virtual {v12, v11}, Lm0/q;->f0(I)V

    const v11, 0xe000

    and-int/2addr v11, v7

    const/4 v13, 0x1

    const/4 v14, 0x0

    if-ne v11, v10, :cond_9

    move v10, v13

    goto :goto_6

    :cond_9
    move v10, v14

    :goto_6
    and-int/lit16 v7, v7, 0x1c00

    if-ne v7, v9, :cond_a

    move v7, v13

    goto :goto_7

    :cond_a
    move v7, v14

    :goto_7
    or-int/2addr v7, v10

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v9

    if-nez v7, :cond_b

    if-ne v9, v8, :cond_c

    :cond_b
    new-instance v9, LMi/J;

    const/16 v7, 0x8

    invoke-direct {v9, v5, v4, v7}, LMi/J;-><init>(LVm/k;ZI)V

    invoke-virtual {v12, v9}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_c
    move-object/from16 v20, v9

    check-cast v20, LVm/a;

    invoke-virtual {v12, v14}, Lm0/q;->q(Z)V

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v17, 0x0

    const/16 v21, 0xf

    invoke-static/range {v16 .. v21}, Landroidx/compose/foundation/b;->c(LA0/r;ZLjava/lang/String;Lh1/j;LVm/a;I)LA0/r;

    move-result-object v9

    if-eqz v4, :cond_11

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v7, Lg8/o;->a:[I

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v8

    aget v7, v7, v8

    if-eq v7, v13, :cond_10

    if-eq v7, v1, :cond_f

    const/4 v1, 0x3

    if-eq v7, v1, :cond_e

    if-ne v7, v2, :cond_d

    sget-object v1, Lg8/p;->LEFT:Lg8/p;

    goto :goto_8

    :cond_d
    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    :cond_e
    sget-object v1, Lg8/p;->RIGHT:Lg8/p;

    goto :goto_8

    :cond_f
    sget-object v1, Lg8/p;->UP:Lg8/p;

    goto :goto_8

    :cond_10
    move-object v1, v3

    :goto_8
    invoke-virtual {v1}, Lg8/p;->a()I

    move-result v1

    goto :goto_9

    :cond_11
    invoke-virtual {v3}, Lg8/p;->a()I

    move-result v1

    :goto_9
    const/4 v2, 0x6

    invoke-static {v1, v2, v12}, LIm/s;->w0(IILm0/l;)LM0/f;

    move-result-object v7

    invoke-static {v12}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v1

    iget-object v1, v1, Lhh/h;->l:Lhh/p;

    iget-wide v10, v1, Lhh/p;->a:J

    const/4 v14, 0x0

    const/4 v8, 0x0

    const/16 v13, 0x30

    invoke-static/range {v7 .. v14}, Lj0/I0;->b(LM0/f;Ljava/lang/String;LA0/r;JLm0/l;II)V

    move-object v1, v0

    move v2, v15

    :goto_a
    invoke-virtual {v12}, Lm0/q;->u()Lm0/t0;

    move-result-object v8

    if-eqz v8, :cond_12

    new-instance v0, LWf/g0;

    move/from16 v7, p7

    invoke-direct/range {v0 .. v7}, LWf/g0;-><init>(LA0/r;ILg8/p;ZLVm/k;II)V

    iput-object v0, v8, Lm0/t0;->d:LVm/n;

    :cond_12
    return-void
.end method

.method public static r0()V
    .locals 2

    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "Count overflow has happened."

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static final s(LFf/W0;Lm0/l;I)V
    .locals 13

    move-object v9, p1

    check-cast v9, Lm0/q;

    const p1, 0x18df7fb

    invoke-virtual {v9, p1}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 p1, p2, 0x6

    const/4 v0, 0x2

    if-nez p1, :cond_1

    invoke-virtual {v9, p0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x4

    goto :goto_0

    :cond_0
    move p1, v0

    :goto_0
    or-int/2addr p1, p2

    goto :goto_1

    :cond_1
    move p1, p2

    :goto_1
    and-int/lit8 p1, p1, 0x3

    if-ne p1, v0, :cond_3

    invoke-virtual {v9}, Lm0/q;->H()Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v9}, Lm0/q;->Y()V

    goto/16 :goto_c

    :cond_3
    :goto_2
    iget-object p1, p0, LFf/W0;->b:Ljava/lang/String;

    invoke-virtual {p0}, LFf/W0;->a()I

    move-result v0

    iget v1, p0, LFf/W0;->d:I

    const/4 v2, 0x0

    invoke-static {p1, v0, v1, v9, v2}, LIm/s;->e(Ljava/lang/String;IILm0/l;I)V

    invoke-static {v9, v2}, LP2/z;->O(Lm0/l;I)V

    iget-object p1, p0, LFf/W0;->h:Ljava/util/List;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, LFf/X0;

    iget-boolean v4, v4, LFf/X0;->e:Z

    if-eqz v4, :cond_4

    goto :goto_3

    :cond_5
    const/4 v3, 0x0

    :goto_3
    check-cast v3, LFf/X0;

    if-nez v3, :cond_6

    invoke-static {p1}, LIm/r;->b1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p1

    move-object v3, p1

    check-cast v3, LFf/X0;

    :cond_6
    const p1, -0x36ccfc3d

    invoke-virtual {v9, p1}, Lm0/q;->f0(I)V

    if-nez v3, :cond_7

    goto :goto_4

    :cond_7
    invoke-static {v3, v9, v2}, LIm/s;->A(LFf/X0;Lm0/l;I)V

    invoke-static {v9, v2}, LP2/z;->O(Lm0/l;I)V

    :goto_4
    invoke-virtual {v9, v2}, Lm0/q;->q(Z)V

    iget-object p1, p0, LFf/W0;->g:Ljava/lang/String;

    invoke-static {p1}, Llo/n;->q0(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_8

    const-string p1, ""

    :cond_8
    iget v0, p0, LFf/W0;->c:I

    if-gtz v1, :cond_9

    :goto_5
    move v3, v2

    goto :goto_6

    :cond_9
    rem-int v3, v0, v1

    sub-int v3, v1, v3

    if-gez v3, :cond_a

    goto :goto_5

    :cond_a
    :goto_6
    iget-object v4, p0, LFf/W0;->b:Ljava/lang/String;

    const/4 v5, 0x1

    if-ne v3, v5, :cond_b

    const v0, 0x5d3060bd

    invoke-virtual {v9, v0}, Lm0/q;->f0(I)V

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v0

    const v1, 0x7f120ba0

    invoke-static {v1, v0, v9}, LP2/j;->H(I[Ljava/lang/Object;Lm0/l;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v2}, Lm0/q;->q(Z)V

    goto :goto_9

    :cond_b
    const v3, 0x5d31e1d1

    invoke-virtual {v9, v3}, Lm0/q;->f0(I)V

    if-gtz v1, :cond_c

    :goto_7
    move v1, v2

    goto :goto_8

    :cond_c
    rem-int/2addr v0, v1

    sub-int/2addr v1, v0

    if-gez v1, :cond_d

    goto :goto_7

    :cond_d
    :goto_8
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v4, v0}, [Ljava/lang/Object;

    move-result-object v0

    const v1, 0x7f120ba1

    invoke-static {v1, v0, v9}, LP2/j;->H(I[Ljava/lang/Object;Lm0/l;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v2}, Lm0/q;->q(Z)V

    :goto_9
    invoke-static {p1}, Llo/n;->q0(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_e

    :goto_a
    move-object v1, v0

    goto :goto_b

    :cond_e
    const-string v1, " "

    invoke-static {p1, v1, v0}, Lj/m;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    :goto_b
    sget-object v0, Lih/h;->b:Lih/h;

    const/4 v8, 0x0

    const/4 v10, 0x0

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v11, 0x0

    const/16 v12, 0x3fe

    invoke-virtual/range {v0 .. v12}, Lih/h;->h(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    :goto_c
    invoke-virtual {v9}, Lm0/q;->u()Lm0/t0;

    move-result-object p1

    if-eqz p1, :cond_f

    new-instance v0, LWf/S0;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p2, v1}, LWf/S0;-><init>(LFf/W0;II)V

    iput-object v0, p1, Lm0/t0;->d:LVm/n;

    :cond_f
    return-void
.end method

.method public static s0()V
    .locals 2

    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "Index overflow has happened."

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static final t(ILjava/lang/String;ZLVm/a;Lm0/l;I)V
    .locals 22

    move-object/from16 v1, p1

    const/16 v0, 0xf

    move-object/from16 v14, p4

    check-cast v14, Lm0/q;

    const v2, 0x45ece729

    invoke-virtual {v14, v2}, Lm0/q;->h0(I)Lm0/q;

    move/from16 v2, p0

    invoke-virtual {v14, v2}, Lm0/q;->e(I)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x4

    goto :goto_0

    :cond_0
    const/4 v3, 0x2

    :goto_0
    or-int v3, p5, v3

    invoke-virtual {v14, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v4

    const/16 v5, 0x20

    if-eqz v4, :cond_1

    move v4, v5

    goto :goto_1

    :cond_1
    const/16 v4, 0x10

    :goto_1
    or-int/2addr v3, v4

    move/from16 v9, p2

    invoke-virtual {v14, v9}, Lm0/q;->h(Z)Z

    move-result v4

    if-eqz v4, :cond_2

    const/16 v4, 0x100

    goto :goto_2

    :cond_2
    const/16 v4, 0x80

    :goto_2
    or-int/2addr v3, v4

    move-object/from16 v13, p3

    invoke-virtual {v14, v13}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    const/16 v4, 0x800

    goto :goto_3

    :cond_3
    const/16 v4, 0x400

    :goto_3
    or-int/2addr v3, v4

    and-int/lit16 v4, v3, 0x493

    const/16 v6, 0x492

    if-ne v4, v6, :cond_5

    invoke-virtual {v14}, Lm0/q;->H()Z

    move-result v4

    if-nez v4, :cond_4

    goto :goto_4

    :cond_4
    invoke-virtual {v14}, Lm0/q;->Y()V

    goto/16 :goto_7

    :cond_5
    :goto_4
    sget-object v4, LA0/d;->n:LA0/g;

    sget-object v6, LG/l;->a:LG/d;

    invoke-static {v14}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v6

    iget v6, v6, Lhh/i;->c:F

    invoke-static {v6}, LG/l;->g(F)LG/j;

    move-result-object v6

    sget-object v7, LA0/o;->a:LA0/o;

    const/16 v8, 0x30

    invoke-static {v6, v4, v14, v8}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v4

    iget-wide v10, v14, Lm0/q;->T:J

    invoke-static {v10, v11}, Ljava/lang/Long;->hashCode(J)I

    move-result v6

    invoke-virtual {v14}, Lm0/q;->m()Lm0/o0;

    move-result-object v8

    invoke-static {v7, v14}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v10

    sget-object v11, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v11, LZ0/g;->b:LZ0/f;

    invoke-virtual {v14}, Lm0/q;->j0()V

    iget-boolean v12, v14, Lm0/q;->S:Z

    if-eqz v12, :cond_6

    invoke-virtual {v14, v11}, Lm0/q;->l(LVm/a;)V

    goto :goto_5

    :cond_6
    invoke-virtual {v14}, Lm0/q;->t0()V

    :goto_5
    sget-object v11, LZ0/g;->f:LZ0/e;

    invoke-static {v11, v4, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v4, LZ0/g;->e:LZ0/e;

    invoke-static {v4, v8, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    sget-object v6, LZ0/g;->g:LZ0/e;

    invoke-static {v14, v4, v6}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v4, LZ0/g;->h:LZ0/d;

    invoke-static {v14, v4}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v4, LZ0/g;->d:LZ0/e;

    invoke-static {v4, v10, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v2, LOg/e;->c:LOg/e;

    const v4, -0xdd4b74e

    invoke-virtual {v14, v4}, Lm0/q;->f0(I)V

    and-int/lit8 v4, v3, 0x70

    const/4 v6, 0x0

    const/4 v8, 0x1

    if-ne v4, v5, :cond_7

    move v4, v8

    goto :goto_6

    :cond_7
    move v4, v6

    :goto_6
    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v5

    sget-object v10, Lm0/k;->a:Lm0/e;

    if-nez v4, :cond_8

    if-ne v5, v10, :cond_9

    :cond_8
    new-instance v5, Lab/a;

    invoke-direct {v5, v1, v0}, Lab/a;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v14, v5}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_9
    check-cast v5, LVm/k;

    invoke-virtual {v14, v6}, Lm0/q;->q(Z)V

    invoke-static {v7, v6, v5}, Lh1/o;->c(LA0/r;ZLVm/k;)LA0/r;

    move-result-object v4

    move v5, v6

    invoke-static/range {p0 .. p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    shl-int/lit8 v11, v3, 0x9

    and-int/lit16 v11, v11, 0x1c00

    shl-int/lit8 v0, v3, 0xf

    const/high16 v12, 0x1c00000

    and-int/2addr v0, v12

    or-int v15, v11, v0

    shr-int/lit8 v0, v3, 0x6

    and-int/lit8 v16, v0, 0x70

    const/4 v11, 0x0

    const/4 v12, 0x0

    move v0, v3

    move-object v3, v4

    const/4 v4, 0x0

    move/from16 v17, v5

    const/4 v5, 0x0

    move-object/from16 v18, v7

    const/4 v7, 0x0

    move/from16 v19, v8

    const/4 v8, 0x0

    move-object/from16 v20, v10

    const/4 v10, 0x0

    move/from16 v21, v17

    const/16 v17, 0x776

    move/from16 p4, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual/range {v2 .. v17}, LOg/e;->h(LA0/r;Lkm/o;Ljava/lang/String;Ljava/lang/Integer;Lhh/n;Lhh/d;ZZLhh/e;LJg/b;LVm/a;Lm0/l;III)V

    sget-object v2, Lih/h;->c:Lih/h;

    invoke-static {v14}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v3

    iget-object v3, v3, Lhh/h;->k:Lhh/v;

    iget-wide v3, v3, Lhh/v;->a:J

    const v5, -0xdd4920a

    invoke-virtual {v14, v5}, Lm0/q;->f0(I)V

    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v5

    if-ne v5, v1, :cond_a

    new-instance v5, Lph/k;

    const/4 v1, 0x5

    invoke-direct {v5, v1}, Lph/k;-><init>(I)V

    invoke-virtual {v14, v5}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_a
    check-cast v5, LVm/k;

    const/4 v1, 0x0

    invoke-virtual {v14, v1}, Lm0/q;->q(Z)V

    invoke-static {v0, v5}, Lh1/o;->b(LA0/r;LVm/k;)LA0/r;

    move-result-object v0

    shr-int/lit8 v1, p4, 0x3

    and-int/lit8 v10, v1, 0xe

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v11, 0x0

    const/16 v12, 0x3f4

    move-object v1, v2

    move-object v2, v0

    move-object v0, v1

    move-object/from16 v1, p1

    move-object v9, v14

    invoke-virtual/range {v0 .. v12}, Lih/h;->h(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    const/4 v0, 0x1

    invoke-virtual {v14, v0}, Lm0/q;->q(Z)V

    :goto_7
    invoke-virtual {v14}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_b

    new-instance v0, Lbh/k;

    const/4 v6, 0x2

    move/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move-object/from16 v4, p3

    move/from16 v5, p5

    invoke-direct/range {v0 .. v6}, Lbh/k;-><init>(ILjava/lang/String;ZLVm/a;II)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_b
    return-void
.end method

.method public static final t0(Lp1/w;)Landroid/view/inputmethod/ExtractedText;
    .locals 4

    new-instance v0, Landroid/view/inputmethod/ExtractedText;

    invoke-direct {v0}, Landroid/view/inputmethod/ExtractedText;-><init>()V

    iget-object v1, p0, Lp1/w;->a:Lk1/h;

    iget-object v1, v1, Lk1/h;->b:Ljava/lang/String;

    iput-object v1, v0, Landroid/view/inputmethod/ExtractedText;->text:Ljava/lang/CharSequence;

    const/4 v2, 0x0

    iput v2, v0, Landroid/view/inputmethod/ExtractedText;->startOffset:I

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    iput v1, v0, Landroid/view/inputmethod/ExtractedText;->partialEndOffset:I

    const/4 v1, -0x1

    iput v1, v0, Landroid/view/inputmethod/ExtractedText;->partialStartOffset:I

    iget-wide v1, p0, Lp1/w;->b:J

    invoke-static {v1, v2}, Lk1/T;->g(J)I

    move-result v3

    iput v3, v0, Landroid/view/inputmethod/ExtractedText;->selectionStart:I

    invoke-static {v1, v2}, Lk1/T;->f(J)I

    move-result v1

    iput v1, v0, Landroid/view/inputmethod/ExtractedText;->selectionEnd:I

    iget-object p0, p0, Lp1/w;->a:Lk1/h;

    iget-object p0, p0, Lk1/h;->b:Ljava/lang/String;

    const/16 v1, 0xa

    invoke-static {p0, v1}, Llo/n;->g0(Ljava/lang/CharSequence;C)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    iput p0, v0, Landroid/view/inputmethod/ExtractedText;->flags:I

    return-object v0
.end method

.method public static final u(LA0/r;Lm0/l;I)V
    .locals 28

    move-object/from16 v0, p0

    move-object/from16 v13, p1

    check-cast v13, Lm0/q;

    const v2, -0x4bd1f790

    invoke-virtual {v13, v2}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v13, v0}, Lm0/q;->g(Ljava/lang/Object;)Z

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

    invoke-virtual {v13}, Lm0/q;->H()Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v13}, Lm0/q;->Y()V

    goto/16 :goto_4

    :cond_2
    :goto_1
    invoke-static {v13}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v2

    iget v2, v2, Lhh/i;->e:F

    invoke-static {v2}, LO/e;->b(F)LO/d;

    move-result-object v2

    invoke-static {v0, v2}, LE0/i;->c(LA0/r;LH0/X;)LA0/r;

    move-result-object v2

    sget-object v3, LA0/d;->h:LA0/i;

    const/4 v4, 0x0

    invoke-static {v3, v4}, LG/t;->d(LA0/e;Z)LX0/h0;

    move-result-object v3

    iget-wide v4, v13, Lm0/q;->T:J

    invoke-static {v4, v5}, Ljava/lang/Long;->hashCode(J)I

    move-result v4

    invoke-virtual {v13}, Lm0/q;->m()Lm0/o0;

    move-result-object v5

    invoke-static {v2, v13}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v2

    sget-object v6, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v6, LZ0/g;->b:LZ0/f;

    invoke-virtual {v13}, Lm0/q;->j0()V

    iget-boolean v7, v13, Lm0/q;->S:Z

    if-eqz v7, :cond_3

    invoke-virtual {v13, v6}, Lm0/q;->l(LVm/a;)V

    goto :goto_2

    :cond_3
    invoke-virtual {v13}, Lm0/q;->t0()V

    :goto_2
    sget-object v7, LZ0/g;->f:LZ0/e;

    invoke-static {v7, v3, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v3, LZ0/g;->e:LZ0/e;

    invoke-static {v3, v5, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    sget-object v5, LZ0/g;->g:LZ0/e;

    invoke-static {v13, v4, v5}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v4, LZ0/g;->h:LZ0/d;

    invoke-static {v13, v4}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v8, LZ0/g;->d:LZ0/e;

    invoke-static {v8, v2, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v2, Lr8/c;->h:Lr8/c;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v2}, LP2/p;->L(Ld8/g;)Ljava/lang/String;

    move-result-object v2

    move-object v9, v8

    sget-object v8, LX0/p;->a:LX0/p0;

    sget-object v17, LA0/o;->a:LA0/o;

    move-object v10, v4

    sget-object v4, Landroidx/compose/foundation/layout/b;->c:Landroidx/compose/foundation/layout/FillElement;

    const/4 v12, 0x0

    const v14, 0x1801b0

    move-object v11, v3

    const/4 v3, 0x0

    move-object v15, v5

    const/4 v5, 0x0

    move-object/from16 v16, v6

    const/4 v6, 0x0

    move-object/from16 v18, v7

    const/4 v7, 0x0

    move-object/from16 v19, v9

    const/4 v9, 0x0

    move-object/from16 v20, v10

    const/4 v10, 0x0

    move-object/from16 v21, v11

    const/4 v11, 0x0

    move-object/from16 v22, v15

    const/4 v15, 0x0

    move-object/from16 v23, v16

    const/16 v16, 0x7b8

    move-object/from16 v1, v18

    move-object/from16 v27, v19

    move-object/from16 v26, v20

    move-object/from16 v24, v21

    move-object/from16 v25, v22

    move-object/from16 v0, v23

    invoke-static/range {v2 .. v16}, Lcoil3/compose/SingletonAsyncImageKt;->AsyncImage-10Xjiaw(Ljava/lang/Object;Ljava/lang/String;LA0/r;LVm/k;LVm/k;LA0/e;LX0/q;FLH0/x;IZLm0/l;III)V

    sget-object v2, Lr8/d;->h:Lr8/d;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v2}, LP2/p;->L(Ld8/g;)Ljava/lang/String;

    move-result-object v2

    const/4 v12, 0x0

    const v14, 0x1801b0

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x7b8

    invoke-static/range {v2 .. v16}, Lcoil3/compose/SingletonAsyncImageKt;->AsyncImage-10Xjiaw(Ljava/lang/Object;Ljava/lang/String;LA0/r;LVm/k;LVm/k;LA0/e;LX0/q;FLH0/x;IZLm0/l;III)V

    invoke-static {v13}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v2

    iget v15, v2, Lhh/i;->e:F

    invoke-static {v13}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v2

    iget v2, v2, Lhh/i;->e:F

    invoke-static {v13}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v3

    iget v3, v3, Lhh/i;->i:F

    const/16 v19, 0x2

    const/16 v16, 0x0

    move/from16 v18, v3

    move-object/from16 v14, v17

    move/from16 v17, v2

    invoke-static/range {v14 .. v19}, LG/e;->L(LA0/r;FFFFI)LA0/r;

    move-result-object v2

    sget-object v3, LA0/d;->n:LA0/g;

    sget-object v4, LG/l;->a:LG/d;

    invoke-static {v13}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v4

    iget v4, v4, Lhh/i;->b:F

    invoke-static {v4}, LG/l;->g(F)LG/j;

    move-result-object v4

    const/16 v5, 0x30

    invoke-static {v4, v3, v13, v5}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v3

    iget-wide v4, v13, Lm0/q;->T:J

    invoke-static {v4, v5}, Ljava/lang/Long;->hashCode(J)I

    move-result v4

    invoke-virtual {v13}, Lm0/q;->m()Lm0/o0;

    move-result-object v5

    invoke-static {v2, v13}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v2

    invoke-virtual {v13}, Lm0/q;->j0()V

    iget-boolean v6, v13, Lm0/q;->S:Z

    if-eqz v6, :cond_4

    invoke-virtual {v13, v0}, Lm0/q;->l(LVm/a;)V

    goto :goto_3

    :cond_4
    invoke-virtual {v13}, Lm0/q;->t0()V

    :goto_3
    invoke-static {v1, v3, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object/from16 v11, v24

    invoke-static {v11, v5, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object/from16 v15, v25

    move-object/from16 v10, v26

    invoke-static {v4, v13, v15, v13, v10}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    move-object/from16 v9, v27

    invoke-static {v9, v2, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v2, Lih/h;->g:Lih/h;

    const v0, 0x7f1203d5

    invoke-static {v13, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v13}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v0

    iget-object v0, v0, Lhh/h;->k:Lhh/v;

    iget-wide v5, v0, Lhh/v;->a:J

    const/4 v10, 0x0

    const/4 v12, 0x0

    const/4 v4, 0x0

    const/4 v7, 0x3

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v11, v13

    const/4 v13, 0x0

    const/16 v14, 0x3e6

    invoke-virtual/range {v2 .. v14}, Lih/h;->h(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    move-object v13, v11

    sget-object v2, Lih/h;->d:Lih/h;

    const v0, 0x7f121200

    invoke-static {v13, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v13}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v0

    iget-object v0, v0, Lhh/h;->k:Lhh/v;

    iget-wide v6, v0, Lhh/v;->d:J

    const/4 v11, 0x0

    move-object v12, v13

    const/4 v13, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v8, 0x3

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v14, 0x0

    const/16 v15, 0x3e6

    invoke-virtual/range {v2 .. v15}, Lih/h;->o(Ljava/lang/String;LA0/r;Lk1/U;JIZIILm0/l;III)V

    move-object v13, v12

    const/4 v0, 0x1

    invoke-virtual {v13, v0}, Lm0/q;->q(Z)V

    invoke-virtual {v13, v0}, Lm0/q;->q(Z)V

    :goto_4
    invoke-virtual {v13}, Lm0/q;->u()Lm0/t0;

    move-result-object v0

    if-eqz v0, :cond_5

    new-instance v1, LDg/h0;

    const/16 v2, 0x13

    move-object/from16 v3, p0

    move/from16 v4, p2

    invoke-direct {v1, v3, v4, v2}, LDg/h0;-><init>(LA0/r;II)V

    iput-object v1, v0, Lm0/t0;->d:LVm/n;

    :cond_5
    return-void
.end method

.method public static final u0(Lw2/n;)V
    .locals 6

    sget-object v0, Ly2/w0;->d:Ly2/w0;

    iget-object v1, p0, Lw2/n;->b:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v4, v2, 0x1

    if-ltz v2, :cond_1

    check-cast v3, Lw2/l;

    invoke-virtual {v0, v3}, Ly2/w0;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lw2/l;

    iget-object v5, p0, Lw2/n;->b:Ljava/util/ArrayList;

    invoke-virtual {v5, v2, v3}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    instance-of v2, v3, Lw2/n;

    if-eqz v2, :cond_0

    check-cast v3, Lw2/n;

    invoke-static {v3}, LIm/s;->u0(Lw2/n;)V

    :cond_0
    move v2, v4

    goto :goto_0

    :cond_1
    invoke-static {}, LIm/s;->s0()V

    const/4 p0, 0x0

    throw p0

    :cond_2
    return-void
.end method

.method public static final v(ILVm/a;Lm0/l;Z)V
    .locals 17

    move/from16 v0, p0

    move-object/from16 v2, p1

    move/from16 v1, p3

    move-object/from16 v13, p2

    check-cast v13, Lm0/q;

    const v3, -0x72d72f9a

    invoke-virtual {v13, v3}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v3, v0, 0x6

    if-nez v3, :cond_1

    invoke-virtual {v13, v1}, Lm0/q;->h(Z)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x4

    goto :goto_0

    :cond_0
    const/4 v3, 0x2

    :goto_0
    or-int/2addr v3, v0

    goto :goto_1

    :cond_1
    move v3, v0

    :goto_1
    and-int/lit8 v4, v0, 0x30

    if-nez v4, :cond_3

    invoke-virtual {v13, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    const/16 v4, 0x20

    goto :goto_2

    :cond_2
    const/16 v4, 0x10

    :goto_2
    or-int/2addr v3, v4

    :cond_3
    and-int/lit8 v4, v3, 0x13

    const/16 v5, 0x12

    if-ne v4, v5, :cond_5

    invoke-virtual {v13}, Lm0/q;->H()Z

    move-result v4

    if-nez v4, :cond_4

    goto :goto_3

    :cond_4
    invoke-virtual {v13}, Lm0/q;->Y()V

    goto :goto_4

    :cond_5
    :goto_3
    const v4, 0x7f121215

    invoke-static {v13, v4}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v4

    move v5, v3

    move-object v3, v4

    sget-object v4, LXg/C;->TITLE_REGULAR:LXg/C;

    const v6, 0x7f121214

    invoke-static {v13, v6}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v6

    new-instance v10, LXg/d;

    const v7, 0x7f120365

    invoke-static {v13, v7}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v10, v7, v2}, LXg/d;-><init>(Ljava/lang/String;LVm/a;)V

    sget-object v11, Lr8/b;->a:Lu0/d;

    sget-object v12, Lr8/b;->b:Lu0/d;

    and-int/lit8 v7, v5, 0xe

    const v8, 0x6000c00

    or-int/2addr v7, v8

    and-int/lit8 v5, v5, 0x70

    or-int v14, v7, v5

    const/4 v8, 0x0

    const/4 v9, 0x1

    move-object v5, v6

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/16 v15, 0x1b0

    const/16 v16, 0x2e0

    invoke-static/range {v1 .. v16}, LP2/G;->h(ZLVm/a;Ljava/lang/String;LXg/C;Ljava/lang/String;ZZZZLXg/f;Lu0/d;LVm/n;Lm0/l;III)V

    :goto_4
    invoke-virtual {v13}, Lm0/q;->u()Lm0/t0;

    move-result-object v3

    if-eqz v3, :cond_6

    new-instance v4, LGh/w;

    const/4 v5, 0x2

    invoke-direct {v4, v1, v2, v0, v5}, LGh/w;-><init>(ZLVm/a;II)V

    iput-object v4, v3, Lm0/t0;->d:LVm/n;

    :cond_6
    return-void
.end method

.method public static final v0(Lw2/n;)Ljava/util/LinkedHashMap;
    .locals 7

    iget-object p0, p0, Lw2/n;->b:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v1, 0x0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v3, v1, 0x1

    const/4 v4, 0x0

    if-ltz v1, :cond_5

    check-cast v2, Lw2/l;

    invoke-interface {v2}, Lw2/l;->a()Lw2/q;

    move-result-object v1

    sget-object v5, Ly2/w0;->b:Ly2/w0;

    invoke-interface {v1, v5}, Lw2/q;->a(LVm/k;)Z

    move-result v5

    if-eqz v5, :cond_0

    sget-object v5, Lw2/o;->a:Lw2/o;

    new-instance v6, LHm/k;

    invoke-direct {v6, v4, v5}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v5, Ly2/v;->k:Ly2/v;

    invoke-interface {v1, v6, v5}, Lw2/q;->foldIn(Ljava/lang/Object;LVm/n;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, LHm/k;

    goto :goto_1

    :cond_0
    new-instance v5, LHm/k;

    invoke-direct {v5, v4, v1}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    move-object v1, v5

    :goto_1
    iget-object v5, v1, LHm/k;->a:Ljava/lang/Object;

    check-cast v5, Lx2/b;

    iget-object v1, v1, LHm/k;->b:Ljava/lang/Object;

    check-cast v1, Lw2/q;

    if-eqz v5, :cond_1

    iget-object v5, v5, Lx2/b;->a:Lx2/a;

    goto :goto_2

    :cond_1
    move-object v5, v4

    :goto_2
    instance-of v6, v5, Lx2/e;

    if-eqz v6, :cond_2

    new-instance v4, LHm/k;

    invoke-direct {v4, v5, v1}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_3

    :cond_2
    new-instance v5, LHm/k;

    invoke-direct {v5, v4, v1}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    move-object v4, v5

    :goto_3
    iget-object v1, v4, LHm/k;->a:Ljava/lang/Object;

    check-cast v1, Lx2/e;

    iget-object v1, v4, LHm/k;->b:Ljava/lang/Object;

    check-cast v1, Lw2/q;

    instance-of v1, v2, Lw2/n;

    if-eqz v1, :cond_4

    check-cast v2, Lw2/n;

    invoke-static {v2}, LIm/s;->v0(Lw2/n;)Ljava/util/LinkedHashMap;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-virtual {v0, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_3

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    check-cast v5, Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_4

    :cond_4
    move v1, v3

    goto/16 :goto_0

    :cond_5
    invoke-static {}, LIm/s;->s0()V

    throw v4

    :cond_6
    return-object v0
.end method

.method public static final w(LFf/W0;Lm0/l;I)V
    .locals 17

    move-object/from16 v0, p0

    move/from16 v1, p2

    move-object/from16 v11, p1

    check-cast v11, Lm0/q;

    const v2, 0x724bc219

    invoke-virtual {v11, v2}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v2, v1, 0x6

    const/4 v3, 0x2

    if-nez v2, :cond_1

    invoke-virtual {v11, v0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x4

    goto :goto_0

    :cond_0
    move v2, v3

    :goto_0
    or-int/2addr v2, v1

    goto :goto_1

    :cond_1
    move v2, v1

    :goto_1
    and-int/lit8 v2, v2, 0x3

    if-ne v2, v3, :cond_3

    invoke-virtual {v11}, Lm0/q;->H()Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_3

    :cond_2
    invoke-virtual {v11}, Lm0/q;->Y()V

    :goto_2
    move-object v12, v11

    goto/16 :goto_4

    :cond_3
    :goto_3
    const/4 v2, 0x0

    invoke-static {v11, v2}, LIm/s;->P(Lm0/l;I)V

    invoke-static {v11, v2}, LP2/z;->M(Lm0/l;I)V

    iget-object v3, v0, LFf/W0;->b:Ljava/lang/String;

    invoke-virtual {v0}, LFf/W0;->a()I

    move-result v4

    iget v5, v0, LFf/W0;->d:I

    invoke-static {v3, v4, v5, v11, v2}, LIm/s;->I(Ljava/lang/String;IILm0/l;I)V

    invoke-static {v11, v2}, LP2/z;->M(Lm0/l;I)V

    invoke-static {v11, v2}, LIm/s;->o(Lm0/l;I)V

    invoke-static {v11, v2}, LP2/z;->M(Lm0/l;I)V

    move v3, v2

    sget-object v2, Lih/h;->e:Lih/h;

    const v4, 0x7f120b96

    invoke-static {v11, v4}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v4

    move-object v12, v11

    const/4 v11, 0x0

    const/4 v13, 0x0

    move v5, v3

    move-object v3, v4

    const/4 v4, 0x0

    move v6, v5

    const/4 v5, 0x0

    move v8, v6

    const-wide/16 v6, 0x0

    move v9, v8

    const/4 v8, 0x0

    move v10, v9

    const/4 v9, 0x0

    move v14, v10

    const/4 v10, 0x0

    move v15, v14

    const/4 v14, 0x0

    move/from16 v16, v15

    const/16 v15, 0x3fe

    move/from16 v0, v16

    invoke-virtual/range {v2 .. v15}, Lih/h;->b(Ljava/lang/String;LA0/r;Lk1/U;JIZIILm0/l;III)V

    invoke-static {v12, v0}, LP2/z;->S(Lm0/l;I)V

    sget-object v2, Lih/h;->b:Lih/h;

    const v0, 0x7f120b95

    invoke-static {v12, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v12}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v0

    iget-object v0, v0, Lhh/h;->k:Lhh/v;

    iget-wide v5, v0, Lhh/v;->d:J

    const/4 v10, 0x0

    move-object v11, v12

    const/4 v12, 0x0

    const/4 v4, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v13, 0x0

    const/16 v14, 0x3f6

    invoke-virtual/range {v2 .. v14}, Lih/h;->n(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    goto :goto_2

    :goto_4
    invoke-virtual {v12}, Lm0/q;->u()Lm0/t0;

    move-result-object v0

    if-eqz v0, :cond_4

    new-instance v2, LWf/S0;

    const/4 v3, 0x1

    move-object/from16 v4, p0

    invoke-direct {v2, v4, v1, v3}, LWf/S0;-><init>(LFf/W0;II)V

    iput-object v2, v0, Lm0/t0;->d:LVm/n;

    :cond_4
    return-void
.end method

.method public static final w0(IILm0/l;)LM0/f;
    .locals 6

    sget-object v0, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->b:Lm0/c1;

    check-cast p2, Lm0/q;

    invoke-virtual {p2, v0}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    sget-object v1, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->c:Lm0/B;

    invoke-virtual {p2, v1}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/res/Resources;

    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    and-int/lit8 v3, p1, 0x70

    xor-int/lit8 v3, v3, 0x30

    const/4 v4, 0x1

    const/16 v5, 0x20

    if-le v3, v5, :cond_0

    invoke-virtual {p2, p0}, Lm0/q;->e(I)Z

    move-result v3

    if-nez v3, :cond_1

    :cond_0
    and-int/lit8 p1, p1, 0x30

    if-ne p1, v5, :cond_2

    :cond_1
    move p1, v4

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {p2, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v3

    or-int/2addr p1, v3

    invoke-virtual {p2, v0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v3

    or-int/2addr p1, v3

    invoke-virtual {p2, v2}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v2

    or-int/2addr p1, v2

    invoke-virtual {p2}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v2

    if-nez p1, :cond_3

    sget-object p1, Lm0/k;->a:Lm0/e;

    if-ne v2, p1, :cond_5

    :cond_3
    new-instance p1, Landroid/util/TypedValue;

    invoke-direct {p1}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {v1, p0, p1, v4}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    invoke-virtual {v1, p0}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object p0

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    :goto_1
    const/4 v3, 0x2

    if-eq v2, v3, :cond_4

    if-eq v2, v4, :cond_4

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    goto :goto_1

    :cond_4
    if-ne v2, v3, :cond_6

    iget p1, p1, Landroid/util/TypedValue;->changingConfigurations:I

    invoke-static {v0, v1, p0, p1}, LIm/s;->i0(Landroid/content/res/Resources$Theme;Landroid/content/res/Resources;Landroid/content/res/XmlResourceParser;I)Lf1/a;

    move-result-object p0

    iget-object v2, p0, Lf1/a;->a:LM0/f;

    invoke-virtual {p2, v2}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_5
    check-cast v2, LM0/f;

    return-object v2

    :cond_6
    new-instance p0, Lorg/xmlpull/v1/XmlPullParserException;

    const-string p1, "No start tag found"

    invoke-direct {p0, p1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final x(Ljava/lang/Integer;LVm/a;Lm0/l;I)V
    .locals 8

    const-string v0, "onDismiss"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v6, p2

    check-cast v6, Lm0/q;

    const p2, 0x12e8c506

    invoke-virtual {v6, p2}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v6, p0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 p2, 0x4

    goto :goto_0

    :cond_0
    const/4 p2, 0x2

    :goto_0
    or-int/2addr p2, p3

    invoke-virtual {v6, p1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0x20

    goto :goto_1

    :cond_1
    const/16 v0, 0x10

    :goto_1
    or-int/2addr p2, v0

    and-int/lit8 v0, p2, 0x13

    const/16 v1, 0x12

    if-ne v0, v1, :cond_3

    invoke-virtual {v6}, Lm0/q;->H()Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v6}, Lm0/q;->Y()V

    move-object v2, p0

    move-object v3, p1

    goto :goto_5

    :cond_3
    :goto_2
    const v0, 0x7f121210

    invoke-static {v6, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v0

    const v1, 0x769dadde

    invoke-virtual {v6, v1}, Lm0/q;->f0(I)V

    if-nez p0, :cond_4

    const/4 v0, 0x0

    :goto_3
    move-object v1, v0

    goto :goto_4

    :cond_4
    new-instance v1, LSi/e;

    const/16 v2, 0x9

    invoke-direct {v1, v0, v2}, LSi/e;-><init>(Ljava/lang/String;I)V

    const v0, 0x44631d19

    invoke-static {v0, v1, v6}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v0

    goto :goto_3

    :goto_4
    const/4 v0, 0x0

    invoke-virtual {v6, v0}, Lm0/q;->q(Z)V

    sget-object v4, Ldh/e;->MEDIUM:Ldh/e;

    sget-object v0, Lhh/d;->SPARSE:Lhh/d;

    invoke-virtual {v0}, Lhh/d;->a()F

    move-result v0

    invoke-static {v6}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v2

    iget v2, v2, Lhh/i;->e:F

    add-float v5, v0, v2

    shl-int/lit8 p2, p2, 0x3

    and-int/lit8 v0, p2, 0x70

    or-int/lit16 v0, v0, 0xc00

    and-int/lit16 p2, p2, 0x380

    or-int v7, v0, p2

    move-object v2, p0

    move-object v3, p1

    invoke-static/range {v1 .. v7}, LP2/G;->i(LVm/n;Ljava/lang/Object;LVm/a;Ldh/e;FLm0/l;I)V

    :goto_5
    invoke-virtual {v6}, Lm0/q;->u()Lm0/t0;

    move-result-object p0

    if-eqz p0, :cond_5

    new-instance p1, LXg/a;

    const/16 p2, 0x15

    invoke-direct {p1, v2, v3, p3, p2}, LXg/a;-><init>(Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object p1, p0, Lm0/t0;->d:LVm/n;

    :cond_5
    return-void
.end method

.method public static x0(Lcom/google/android/gms/internal/play_billing/zzes;Lcom/google/android/gms/internal/play_billing/zzim;)Landroid/os/Bundle;
    .locals 2

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "REQUEST_METADATA"

    invoke-virtual {p0}, Lcom/google/android/gms/internal/play_billing/zzfa;->zzQ()[B

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    const-string p0, "REQUEST_PARAMS"

    invoke-virtual {p1}, Lcom/google/android/gms/internal/play_billing/zzfa;->zzQ()[B

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    return-object v0
.end method

.method public static final y(LG/C;LOm/a;LGh/u;LVm/k;LVm/k;Ljava/lang/String;Lm0/l;II)V
    .locals 23

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v4, p3

    move-object/from16 v3, p4

    move/from16 v5, p7

    const-string v6, "<this>"

    invoke-static {v0, v6}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v6, "types"

    invoke-static {v1, v6}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v6, "onTypeSelected"

    invoke-static {v4, v6}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v6, "onCtaClicked"

    invoke-static {v3, v6}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v14, p6

    check-cast v14, Lm0/q;

    const v6, 0x2c1b831d

    invoke-virtual {v14, v6}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v6, v5, 0x6

    if-nez v6, :cond_1

    invoke-virtual {v14, v0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v6, 0x4

    goto :goto_0

    :cond_0
    const/4 v6, 0x2

    :goto_0
    or-int/2addr v6, v5

    goto :goto_1

    :cond_1
    move v6, v5

    :goto_1
    and-int/lit8 v7, v5, 0x30

    if-nez v7, :cond_3

    invoke-virtual {v14, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    const/16 v7, 0x20

    goto :goto_2

    :cond_2
    const/16 v7, 0x10

    :goto_2
    or-int/2addr v6, v7

    :cond_3
    and-int/lit16 v7, v5, 0x180

    if-nez v7, :cond_5

    invoke-virtual {v14, v2}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    const/16 v7, 0x100

    goto :goto_3

    :cond_4
    const/16 v7, 0x80

    :goto_3
    or-int/2addr v6, v7

    :cond_5
    and-int/lit16 v7, v5, 0xc00

    if-nez v7, :cond_7

    invoke-virtual {v14, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    const/16 v7, 0x800

    goto :goto_4

    :cond_6
    const/16 v7, 0x400

    :goto_4
    or-int/2addr v6, v7

    :cond_7
    and-int/lit16 v7, v5, 0x6000

    const/16 v8, 0x4000

    if-nez v7, :cond_9

    invoke-virtual {v14, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    move v7, v8

    goto :goto_5

    :cond_8
    const/16 v7, 0x2000

    :goto_5
    or-int/2addr v6, v7

    :cond_9
    and-int/lit8 v7, p8, 0x10

    const/high16 v9, 0x30000

    if-eqz v7, :cond_b

    or-int/2addr v6, v9

    :cond_a
    move-object/from16 v9, p5

    goto :goto_7

    :cond_b
    and-int/2addr v9, v5

    if-nez v9, :cond_a

    move-object/from16 v9, p5

    invoke-virtual {v14, v9}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_c

    const/high16 v10, 0x20000

    goto :goto_6

    :cond_c
    const/high16 v10, 0x10000

    :goto_6
    or-int/2addr v6, v10

    :goto_7
    const v10, 0x12493

    and-int/2addr v10, v6

    const v11, 0x12492

    if-ne v10, v11, :cond_e

    invoke-virtual {v14}, Lm0/q;->H()Z

    move-result v10

    if-nez v10, :cond_d

    goto :goto_8

    :cond_d
    invoke-virtual {v14}, Lm0/q;->Y()V

    move-object v6, v9

    goto/16 :goto_d

    :cond_e
    :goto_8
    const/4 v10, 0x0

    if-eqz v7, :cond_f

    move-object v12, v10

    goto :goto_9

    :cond_f
    move-object v12, v9

    :goto_9
    if-eqz v2, :cond_10

    move-object v7, v1

    check-cast v7, LOm/b;

    invoke-virtual {v7, v2}, LOm/b;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_10

    move-object v10, v2

    :cond_10
    const v7, -0x4c48700

    invoke-virtual {v14, v7}, Lm0/q;->f0(I)V

    new-instance v2, Ljava/util/ArrayList;

    const/16 v7, 0xa

    invoke-static {v1, v7}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v7

    invoke-direct {v2, v7}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_a
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_11

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    move-object/from16 v16, v9

    check-cast v16, LGh/u;

    new-instance v15, LEh/c;

    invoke-virtual/range {v16 .. v16}, LGh/u;->e()I

    move-result v9

    invoke-static {v14, v9}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v16}, LGh/u;->a()I

    move-result v9

    invoke-static {v14, v9}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v16 .. v16}, LGh/u;->d()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v22, 0x18

    invoke-direct/range {v15 .. v22}, LEh/c;-><init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Integer;I)V

    invoke-virtual {v2, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_a

    :cond_11
    const/4 v7, 0x0

    invoke-virtual {v14, v7}, Lm0/q;->q(Z)V

    const/4 v9, 0x1

    if-eqz v10, :cond_12

    if-nez v12, :cond_12

    move v11, v9

    goto :goto_b

    :cond_12
    move v11, v9

    move v9, v7

    :goto_b
    const v13, -0x4c452fa

    invoke-virtual {v14, v13}, Lm0/q;->f0(I)V

    invoke-virtual {v14, v10}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v13

    const v15, 0xe000

    and-int v11, v6, v15

    if-ne v11, v8, :cond_13

    const/4 v8, 0x1

    goto :goto_c

    :cond_13
    move v8, v7

    :goto_c
    or-int/2addr v8, v13

    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v11

    if-nez v8, :cond_14

    sget-object v8, Lm0/k;->a:Lm0/e;

    if-ne v11, v8, :cond_15

    :cond_14
    new-instance v11, LAe/S;

    const/16 v8, 0x11

    invoke-direct {v11, v8, v10, v3}, LAe/S;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v14, v11}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_15
    check-cast v11, LVm/a;

    invoke-virtual {v14, v7}, Lm0/q;->q(Z)V

    const v7, 0x7f1210d6

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const v8, 0x7f1210e0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    and-int/lit8 v13, v6, 0xe

    shl-int/lit8 v16, v6, 0x3

    and-int v15, v16, v15

    or-int/2addr v15, v13

    shr-int/lit8 v6, v6, 0x9

    and-int/lit16 v6, v6, 0x380

    move-object v5, v11

    const/4 v11, 0x0

    const/4 v13, 0x0

    const v1, 0x7f1210e1

    move/from16 v16, v6

    move-object v6, v7

    move-object v7, v8

    const/4 v8, 0x0

    move-object v3, v10

    const/4 v10, 0x0

    const/16 v17, 0x1680

    invoke-static/range {v0 .. v17}, LEh/f;->a(LG/C;ILjava/util/List;Ljava/lang/Object;LVm/k;LVm/a;Ljava/lang/Integer;Ljava/lang/Integer;IZLjava/lang/Integer;LVm/a;Ljava/lang/String;LVm/o;Lm0/l;III)V

    move-object v6, v12

    :goto_d
    invoke-virtual {v14}, Lm0/q;->u()Lm0/t0;

    move-result-object v10

    if-eqz v10, :cond_16

    new-instance v0, LBg/E0;

    const/4 v9, 0x2

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-direct/range {v0 .. v9}, LBg/E0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;LHm/e;Ljava/lang/Object;Ljava/lang/Object;III)V

    iput-object v0, v10, Lm0/t0;->d:LVm/n;

    :cond_16
    return-void
.end method

.method public static y0(Landroid/content/Context;Ljava/lang/String;)Lcom/google/android/gms/internal/play_billing/zzes;
    .locals 2

    invoke-static {}, Lcom/google/android/gms/internal/play_billing/zzes;->zza()Lcom/google/android/gms/internal/play_billing/zzer;

    move-result-object v0

    const-string v1, "9.1.0"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/play_billing/zzer;->zzd(Ljava/lang/String;)Lcom/google/android/gms/internal/play_billing/zzer;

    const/16 v1, 0x18

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/play_billing/zzer;->zze(I)Lcom/google/android/gms/internal/play_billing/zzer;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/play_billing/zzer;->zzb(Ljava/lang/String;)Lcom/google/android/gms/internal/play_billing/zzer;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/play_billing/zzer;->zzc(Ljava/lang/String;)Lcom/google/android/gms/internal/play_billing/zzer;

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {p1, p0, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    iget p0, p0, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p0, "DelegationApiParamsBuilder"

    const-string p1, "No version code is found!"

    invoke-static {p0, p1}, Lcom/google/android/gms/internal/play_billing/zzc;->zzn(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    :goto_0
    if-eqz p0, :cond_0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/play_billing/zzer;->zza(Ljava/lang/String;)Lcom/google/android/gms/internal/play_billing/zzer;

    :cond_0
    invoke-virtual {v0}, Lcom/google/android/gms/internal/play_billing/zzgl;->zzi()Lcom/google/android/gms/internal/play_billing/zzgp;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/play_billing/zzes;

    return-object p0
.end method

.method public static final z(ILA0/r;LVm/k;LVm/k;Lcom/eightsleep/presentation_onboarding/feature/productidentification/viewmodel/ProductIdentificationViewModel;Lm0/l;)V
    .locals 12

    move-object/from16 v1, p4

    const-string v0, "modifier"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "viewModel"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onOneTimeEvent"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onNavEvent"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v9, p5

    check-cast v9, Lm0/q;

    const v0, -0x6b49bacc

    invoke-virtual {v9, v0}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v9, p1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int/2addr v0, p0

    invoke-virtual {v9, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/16 v2, 0x20

    goto :goto_1

    :cond_1
    const/16 v2, 0x10

    :goto_1
    or-int/2addr v0, v2

    invoke-virtual {v9, p2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/16 v2, 0x100

    goto :goto_2

    :cond_2
    const/16 v2, 0x80

    :goto_2
    or-int/2addr v0, v2

    invoke-virtual {v9, p3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    const/16 v2, 0x800

    goto :goto_3

    :cond_3
    const/16 v2, 0x400

    :goto_3
    or-int/2addr v0, v2

    and-int/lit16 v2, v0, 0x493

    const/16 v3, 0x492

    if-ne v2, v3, :cond_5

    invoke-virtual {v9}, Lm0/q;->H()Z

    move-result v2

    if-nez v2, :cond_4

    goto :goto_4

    :cond_4
    invoke-virtual {v9}, Lm0/q;->Y()V

    goto :goto_5

    :cond_5
    :goto_4
    sget-object v8, LGh/l;->a:Lu0/d;

    and-int/lit8 v2, v0, 0xe

    const/high16 v3, 0x6c00000

    or-int/2addr v2, v3

    and-int/lit8 v3, v0, 0x70

    or-int/2addr v2, v3

    and-int/lit16 v3, v0, 0x380

    or-int/2addr v2, v3

    and-int/lit16 v0, v0, 0x1c00

    or-int v10, v2, v0

    const/4 v6, 0x0

    const-string v7, "onboarding_manual_cover_tap_control_type"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v11, 0x70

    move-object v0, p1

    move-object v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v11}, LP2/o;->g(LA0/r;LL8/e;LVm/k;LVm/k;ZZLH0/w;Ljava/lang/String;LVm/r;Lm0/l;II)V

    :goto_5
    invoke-virtual {v9}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_6

    new-instance v0, LFh/a;

    const/16 v6, 0xb

    move v5, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move-object/from16 v2, p4

    invoke-direct/range {v0 .. v6}, LFh/a;-><init>(LA0/r;Lcom/eightsleep/presentation_onboarding/feature/productidentification/viewmodel/ProductIdentificationViewModel;LVm/k;LVm/k;II)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_6
    return-void
.end method
