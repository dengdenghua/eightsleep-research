.class public abstract LP2/h;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:LM0/f;


# direct methods
.method public static A(Lcom/google/gson/o;)Lz7/G2;
    .locals 25

    move-object/from16 v0, p0

    const-string v1, "url"

    const-string v2, "Unable to parse json into type Resource"

    :try_start_0
    const-string v3, "id"

    invoke-virtual {v0, v3}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-virtual {v3}, Lcom/google/gson/m;->k()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    :catch_0
    move-exception v0

    goto/16 :goto_14

    :catch_1
    move-exception v0

    goto/16 :goto_15

    :catch_2
    move-exception v0

    goto/16 :goto_16

    :cond_0
    const/4 v3, 0x0

    :goto_0
    sget-object v5, Lz7/O2;->Companion:Lz7/N2;

    const-string v6, "type"

    invoke-virtual {v0, v6}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/gson/m;->k()Ljava/lang/String;

    move-result-object v6

    const-string v7, "jsonObject.get(\"type\").asString"

    invoke-static {v6, v7}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v6}, Lz7/N2;->a(Ljava/lang/String;)Lz7/O2;

    move-result-object v5

    const-string v6, "method"

    invoke-virtual {v0, v6}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v6

    if-eqz v6, :cond_1

    invoke-virtual {v6}, Lcom/google/gson/m;->k()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_1

    sget-object v7, Lz7/u2;->Companion:Lz7/t2;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v6}, Lz7/t2;->a(Ljava/lang/String;)Lz7/u2;

    move-result-object v6

    goto :goto_1

    :cond_1
    const/4 v6, 0x0

    :goto_1
    invoke-virtual {v0, v1}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/gson/m;->k()Ljava/lang/String;

    move-result-object v7

    const-string v8, "status_code"

    invoke-virtual {v0, v8}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v8

    if-eqz v8, :cond_2

    invoke-virtual {v8}, Lcom/google/gson/m;->i()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    goto :goto_2

    :cond_2
    const/4 v8, 0x0

    :goto_2
    const-string v9, "duration"

    invoke-virtual {v0, v9}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v9

    if-eqz v9, :cond_3

    invoke-virtual {v9}, Lcom/google/gson/m;->i()J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    goto :goto_3

    :cond_3
    const/4 v9, 0x0

    :goto_3
    const-string v10, "size"

    invoke-virtual {v0, v10}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v10

    if-eqz v10, :cond_4

    invoke-virtual {v10}, Lcom/google/gson/m;->i()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    goto :goto_4

    :cond_4
    const/4 v10, 0x0

    :goto_4
    const-string v11, "encoded_body_size"

    invoke-virtual {v0, v11}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v11

    if-eqz v11, :cond_5

    invoke-virtual {v11}, Lcom/google/gson/m;->i()J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    goto :goto_5

    :cond_5
    const/4 v11, 0x0

    :goto_5
    const-string v12, "decoded_body_size"

    invoke-virtual {v0, v12}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v12

    if-eqz v12, :cond_6

    invoke-virtual {v12}, Lcom/google/gson/m;->i()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    goto :goto_6

    :cond_6
    const/4 v12, 0x0

    :goto_6
    const-string v13, "transfer_size"

    invoke-virtual {v0, v13}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v13

    if-eqz v13, :cond_7

    invoke-virtual {v13}, Lcom/google/gson/m;->i()J

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    goto :goto_7

    :cond_7
    const/4 v13, 0x0

    :goto_7
    const-string v14, "render_blocking_status"

    invoke-virtual {v0, v14}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v14

    if-eqz v14, :cond_8

    invoke-virtual {v14}, Lcom/google/gson/m;->k()Ljava/lang/String;

    move-result-object v14

    if-eqz v14, :cond_8

    sget-object v15, Lz7/F2;->Companion:Lz7/E2;

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v14}, Lz7/E2;->a(Ljava/lang/String;)Lz7/F2;

    move-result-object v14

    goto :goto_8

    :cond_8
    const/4 v14, 0x0

    :goto_8
    const-string v15, "worker"

    invoke-virtual {v0, v15}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v15

    if-eqz v15, :cond_9

    invoke-virtual {v15}, Lcom/google/gson/m;->h()Lcom/google/gson/o;

    move-result-object v15

    invoke-static {v15}, LP2/l;->A(Lcom/google/gson/o;)Lz7/X2;

    move-result-object v15

    goto :goto_9

    :cond_9
    const/4 v15, 0x0

    :goto_9
    const-string v4, "redirect"

    invoke-virtual {v0, v4}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v4

    if-eqz v4, :cond_a

    invoke-virtual {v4}, Lcom/google/gson/m;->h()Lcom/google/gson/o;

    move-result-object v4

    invoke-static {v4}, LP2/g;->x(Lcom/google/gson/o;)Lz7/D2;

    move-result-object v4

    :goto_a
    move-object/from16 v17, v3

    goto :goto_b

    :cond_a
    const/4 v4, 0x0

    goto :goto_a

    :goto_b
    const-string v3, "dns"

    invoke-virtual {v0, v3}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v3

    if-eqz v3, :cond_b

    invoke-virtual {v3}, Lcom/google/gson/m;->h()Lcom/google/gson/o;

    move-result-object v3

    invoke-static {v3}, LP2/a;->w(Lcom/google/gson/o;)Lz7/l2;

    move-result-object v3

    move-object/from16 v18, v3

    goto :goto_c

    :cond_b
    const/16 v18, 0x0

    :goto_c
    const-string v3, "connect"

    invoke-virtual {v0, v3}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v3

    if-eqz v3, :cond_c

    invoke-virtual {v3}, Lcom/google/gson/m;->h()Lcom/google/gson/o;

    move-result-object v3

    invoke-static {v3}, Lio/sentry/config/a;->d0(Lcom/google/gson/o;)Lz7/a2;

    move-result-object v3

    move-object/from16 v19, v3

    goto :goto_d

    :cond_c
    const/16 v19, 0x0

    :goto_d
    const-string v3, "ssl"

    invoke-virtual {v0, v3}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v3

    if-eqz v3, :cond_d

    invoke-virtual {v3}, Lcom/google/gson/m;->h()Lcom/google/gson/o;

    move-result-object v3

    invoke-static {v3}, LIm/s;->c0(Lcom/google/gson/o;)Lz7/R2;

    move-result-object v3

    move-object/from16 v20, v3

    goto :goto_e

    :cond_d
    const/16 v20, 0x0

    :goto_e
    const-string v3, "first_byte"

    invoke-virtual {v0, v3}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v3

    if-eqz v3, :cond_e

    invoke-virtual {v3}, Lcom/google/gson/m;->h()Lcom/google/gson/o;

    move-result-object v3

    invoke-static {v3}, LP2/c;->o(Lcom/google/gson/o;)Lz7/p2;

    move-result-object v3

    move-object/from16 v21, v3

    goto :goto_f

    :cond_e
    const/16 v21, 0x0

    :goto_f
    const-string v3, "download"

    invoke-virtual {v0, v3}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v3

    if-eqz v3, :cond_f

    invoke-virtual {v3}, Lcom/google/gson/m;->h()Lcom/google/gson/o;

    move-result-object v3

    invoke-static {v3}, LP2/b;->A(Lcom/google/gson/o;)Lz7/m2;

    move-result-object v3

    move-object/from16 v22, v3

    goto :goto_10

    :cond_f
    const/16 v22, 0x0

    :goto_10
    const-string v3, "protocol"

    invoke-virtual {v0, v3}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v3

    if-eqz v3, :cond_10

    invoke-virtual {v3}, Lcom/google/gson/m;->k()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v23, v3

    goto :goto_11

    :cond_10
    const/16 v23, 0x0

    :goto_11
    const-string v3, "provider"

    invoke-virtual {v0, v3}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v3

    if-eqz v3, :cond_11

    invoke-virtual {v3}, Lcom/google/gson/m;->h()Lcom/google/gson/o;

    move-result-object v3

    invoke-static {v3}, LP2/f;->F(Lcom/google/gson/o;)Lz7/A2;

    move-result-object v3

    move-object/from16 v24, v3

    goto :goto_12

    :cond_11
    const/16 v24, 0x0

    :goto_12
    const-string v3, "graphql"

    invoke-virtual {v0, v3}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v0

    if-eqz v0, :cond_12

    invoke-virtual {v0}, Lcom/google/gson/m;->h()Lcom/google/gson/o;

    move-result-object v0

    invoke-static {v0}, LP2/d;->H(Lcom/google/gson/o;)Lz7/q2;

    move-result-object v0

    goto :goto_13

    :cond_12
    const/4 v0, 0x0

    :goto_13
    new-instance v3, Lz7/G2;

    invoke-static {v7, v1}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v16, v4

    move-object/from16 v4, v17

    move-object/from16 v17, v18

    move-object/from16 v18, v19

    move-object/from16 v19, v20

    move-object/from16 v20, v21

    move-object/from16 v21, v22

    move-object/from16 v22, v23

    move-object/from16 v23, v24

    move-object/from16 v24, v0

    invoke-direct/range {v3 .. v24}, Lz7/G2;-><init>(Ljava/lang/String;Lz7/O2;Lz7/u2;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Lz7/F2;Lz7/X2;Lz7/D2;Lz7/l2;Lz7/a2;Lz7/R2;Lz7/p2;Lz7/m2;Ljava/lang/String;Lz7/A2;Lz7/q2;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    :goto_14
    new-instance v1, Lcom/google/gson/JsonParseException;

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :goto_15
    new-instance v1, Lcom/google/gson/JsonParseException;

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :goto_16
    new-instance v1, Lcom/google/gson/JsonParseException;

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static B()V
    .locals 1

    sget-object v0, LFf/o;->c:LFf/o;

    return-void
.end method

.method public static final C(LL/v;)I
    .locals 4

    iget-object v0, p0, LL/v;->e:LC/N0;

    sget-object v1, LC/N0;->Vertical:LC/N0;

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, LL/v;->e()J

    move-result-wide v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    :goto_0
    long-to-int p0, v0

    return p0

    :cond_0
    invoke-virtual {p0}, LL/v;->e()J

    move-result-wide v0

    const/16 p0, 0x20

    shr-long/2addr v0, p0

    goto :goto_0
.end method

.method public static final D(Lk1/P;IIIJZZ)LI5/f;
    .locals 8

    new-instance v0, LI5/f;

    if-eqz p6, :cond_0

    const/4 p4, 0x0

    goto :goto_0

    :cond_0
    new-instance p6, Ld0/w;

    new-instance v1, Ld0/v;

    sget v2, Lk1/T;->c:I

    const/16 v2, 0x20

    shr-long v2, p4, v2

    long-to-int v2, v2

    invoke-static {p0, v2}, LP2/g;->F(Lk1/P;I)Lv1/j;

    move-result-object v3

    const-wide/16 v4, 0x1

    invoke-direct {v1, v3, v2, v4, v5}, Ld0/v;-><init>(Lv1/j;IJ)V

    new-instance v2, Ld0/v;

    const-wide v6, 0xffffffffL

    and-long/2addr v6, p4

    long-to-int v3, v6

    invoke-static {p0, v3}, LP2/g;->F(Lk1/P;I)Lv1/j;

    move-result-object v6

    invoke-direct {v2, v6, v3, v4, v5}, Ld0/v;-><init>(Lv1/j;IJ)V

    invoke-static {p4, p5}, Lk1/T;->h(J)Z

    move-result p4

    invoke-direct {p6, v1, v2, p4}, Ld0/w;-><init>(Ld0/v;Ld0/v;Z)V

    move-object p4, p6

    :goto_0
    new-instance p5, LSp/m;

    invoke-direct {p5, p1, p2, p3, p0}, LSp/m;-><init>(IIILk1/P;)V

    const/4 p0, 0x5

    invoke-direct {v0, p7, p4, p5, p0}, LI5/f;-><init>(ZLjava/lang/Object;Ljava/lang/Object;I)V

    return-object v0
.end method

.method public static final E(Landroid/content/BroadcastReceiver;Lwo/v;LVm/n;)V
    .locals 2

    invoke-static {}, Lwo/C;->e()Lwo/z0;

    move-result-object v0

    invoke-static {v0, p1}, LP2/H;->Y(LLm/f;LLm/h;)LLm/h;

    move-result-object p1

    invoke-static {p1}, Lwo/C;->c(LLm/h;)LCo/c;

    move-result-object p1

    invoke-virtual {p0}, Landroid/content/BroadcastReceiver;->goAsync()Landroid/content/BroadcastReceiver$PendingResult;

    move-result-object p0

    new-instance v0, Ly2/D;

    const/4 v1, 0x0

    invoke-direct {v0, p2, p1, p0, v1}, Ly2/D;-><init>(LVm/n;LCo/c;Landroid/content/BroadcastReceiver$PendingResult;LLm/c;)V

    const/4 p0, 0x3

    invoke-static {p1, v1, v1, v0, p0}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    return-void
.end method

.method public static synthetic F(Lmd/a;LNm/i;)Ljava/lang/Object;
    .locals 2

    sget v0, Lmo/b;->d:I

    const/16 v0, 0xa

    sget-object v1, Lmo/d;->MINUTES:Lmo/d;

    invoke-static {v0, v1}, LP2/G;->V(ILmo/d;)J

    move-result-wide v0

    check-cast p0, Lmd/e;

    invoke-virtual {p0, v0, v1, p1}, Lmd/e;->a(JLNm/c;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static G(LQa/b;Ljava/lang/Long;)Z
    .locals 4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    goto :goto_0

    :cond_0
    invoke-interface {p0}, LQa/b;->c()J

    move-result-wide v2

    :goto_0
    sub-long/2addr v0, v2

    invoke-interface {p0}, LQa/b;->a()J

    move-result-wide p0

    invoke-static {p0, p1}, Lmo/b;->f(J)J

    move-result-wide p0

    cmp-long p0, v0, p0

    if-lez p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public static synthetic H(LQa/b;)Ljava/lang/Object;
    .locals 0

    invoke-interface {p0}, LQa/b;->f()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static I(Lya/j;Lcom/eightsleep/data_device/enums/HardwareConnectionType;)Lya/j;
    .locals 2

    const-string v0, "status"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "connectionType"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    instance-of v0, p0, Lya/g;

    if-eqz v0, :cond_0

    new-instance v0, Lya/g;

    new-instance v1, LHm/k;

    check-cast p0, Lya/g;

    iget-object p0, p0, Lya/g;->b:Ljava/lang/Object;

    invoke-direct {v1, p0, p1}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {v0, v1}, Lya/g;-><init>(Ljava/lang/Object;)V

    return-object v0

    :cond_0
    instance-of v0, p0, Lya/e;

    if-eqz v0, :cond_1

    new-instance v0, Lya/e;

    new-instance v1, Lib/a;

    check-cast p0, Lya/e;

    iget-object p0, p0, Lya/e;->b:Ljava/lang/Throwable;

    invoke-direct {v1, p1, p0}, Lib/a;-><init>(Lcom/eightsleep/data_device/enums/HardwareConnectionType;Ljava/lang/Throwable;)V

    invoke-direct {v0, v1}, Lya/e;-><init>(Ljava/lang/Throwable;)V

    return-object v0

    :cond_1
    instance-of p0, p0, Lya/f;

    if-eqz p0, :cond_2

    sget-object p0, Lya/f;->b:Lya/f;

    return-object p0

    :cond_2
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0
.end method

.method public static final J(LVm/k;)Lr4/I;
    .locals 11

    new-instance v0, Lr4/J;

    invoke-direct {v0}, Lr4/J;-><init>()V

    invoke-interface {p0, v0}, LVm/k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean v2, v0, Lr4/J;->b:Z

    iget-object p0, v0, Lr4/J;->a:LD4/Y;

    iget-boolean v3, v0, Lr4/J;->c:Z

    iget v4, v0, Lr4/J;->d:I

    iget-boolean v5, v0, Lr4/J;->e:Z

    iget-boolean v6, v0, Lr4/J;->f:Z

    new-instance v1, Lr4/I;

    iget v7, p0, LD4/Y;->a:I

    iget v8, p0, LD4/Y;->b:I

    const/4 v9, -0x1

    const/4 v10, -0x1

    invoke-direct/range {v1 .. v10}, Lr4/I;-><init>(ZZIZZIIII)V

    return-object v1
.end method

.method public static K()LJm/c;
    .locals 6

    invoke-static {}, LIm/s;->X()LJm/c;

    move-result-object v0

    sget-object v1, Lcom/eightsleep/data_core/enums/purchase/ProductType;->POD:Lcom/eightsleep/data_core/enums/purchase/ProductType;

    new-instance v2, LYa/H;

    const v3, 0x7f120906

    const/4 v4, 0x0

    const/4 v5, 0x6

    invoke-direct {v2, v3, v4, v4, v5}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    invoke-static {v1, v2}, Lio/sentry/hints/i;->u(Lcom/eightsleep/data_core/enums/purchase/ProductType;LYa/H;)LIh/f;

    move-result-object v1

    invoke-virtual {v0, v1}, LJm/c;->add(Ljava/lang/Object;)Z

    sget-object v1, Lcom/eightsleep/data_core/enums/purchase/ProductType;->SOLO_COVER:Lcom/eightsleep/data_core/enums/purchase/ProductType;

    new-instance v2, LYa/H;

    const v3, 0x7f120908

    invoke-direct {v2, v3, v4, v4, v5}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    invoke-static {v1, v2}, Lio/sentry/hints/i;->u(Lcom/eightsleep/data_core/enums/purchase/ProductType;LYa/H;)LIh/f;

    move-result-object v1

    invoke-virtual {v0, v1}, LJm/c;->add(Ljava/lang/Object;)Z

    sget-object v1, Lcom/eightsleep/data_core/enums/purchase/ProductType;->ADJUSTABLE_BASE:Lcom/eightsleep/data_core/enums/purchase/ProductType;

    invoke-static {v1, v4}, Lio/sentry/hints/i;->u(Lcom/eightsleep/data_core/enums/purchase/ProductType;LYa/H;)LIh/f;

    move-result-object v1

    invoke-virtual {v0, v1}, LJm/c;->add(Ljava/lang/Object;)Z

    sget-object v1, Lcom/eightsleep/data_core/enums/purchase/ProductType;->BLANKET:Lcom/eightsleep/data_core/enums/purchase/ProductType;

    new-instance v2, LYa/H;

    const v3, 0x7f12091a

    invoke-direct {v2, v3, v4, v4, v5}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    invoke-static {v1, v2}, Lio/sentry/hints/i;->u(Lcom/eightsleep/data_core/enums/purchase/ProductType;LYa/H;)LIh/f;

    move-result-object v1

    invoke-virtual {v0, v1}, LJm/c;->add(Ljava/lang/Object;)Z

    sget-object v1, Lcom/eightsleep/data_core/enums/purchase/ProductType;->PILLOW:Lcom/eightsleep/data_core/enums/purchase/ProductType;

    invoke-static {v1, v4}, Lio/sentry/hints/i;->u(Lcom/eightsleep/data_core/enums/purchase/ProductType;LYa/H;)LIh/f;

    move-result-object v1

    invoke-virtual {v0, v1}, LJm/c;->add(Ljava/lang/Object;)Z

    invoke-static {v0}, LIm/s;->W(LJm/c;)LJm/c;

    move-result-object v0

    return-object v0
.end method

.method public static L(Landroid/view/inputmethod/InputConnection;Landroid/view/inputmethod/EditorInfo;Landroid/widget/TextView;)V
    .locals 0

    if-eqz p0, :cond_0

    iget-object p0, p1, Landroid/view/inputmethod/EditorInfo;->hintText:Ljava/lang/CharSequence;

    if-nez p0, :cond_0

    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    :goto_0
    instance-of p1, p0, Landroid/view/View;

    if-eqz p1, :cond_0

    invoke-interface {p0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static synthetic M(LQa/b;Ljava/lang/Object;LLm/c;)Ljava/lang/Object;
    .locals 0

    invoke-interface {p0, p2, p1}, LQa/b;->g(LLm/c;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static final N(IILjava/lang/String;)J
    .locals 4

    const-wide/16 v0, 0x0

    :cond_0
    invoke-virtual {p2, p0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2d

    if-ne v2, v3, :cond_2

    const/16 v2, 0x8

    if-eq p0, v2, :cond_18

    const/16 v2, 0xd

    if-eq p0, v2, :cond_18

    const/16 v2, 0x12

    if-eq p0, v2, :cond_18

    const/16 v2, 0x17

    if-ne p0, v2, :cond_1

    goto/16 :goto_7

    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Invalid UUID string, encountered dash at index "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " but it can occur only at 8, 13, 18, or 23: "

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    const/16 v2, 0x10

    int-to-long v2, v2

    mul-long/2addr v0, v2

    invoke-virtual {p2, p0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x30

    if-eq v2, v3, :cond_18

    const/16 v3, 0x31

    if-ne v2, v3, :cond_3

    const-wide/16 v2, 0x1

    :goto_0
    add-long/2addr v0, v2

    goto/16 :goto_7

    :cond_3
    const/16 v3, 0x32

    if-ne v2, v3, :cond_4

    const-wide/16 v2, 0x2

    goto :goto_0

    :cond_4
    const/16 v3, 0x33

    if-ne v2, v3, :cond_5

    const-wide/16 v2, 0x3

    goto :goto_0

    :cond_5
    const/16 v3, 0x34

    if-ne v2, v3, :cond_6

    const-wide/16 v2, 0x4

    goto :goto_0

    :cond_6
    const/16 v3, 0x35

    if-ne v2, v3, :cond_7

    const-wide/16 v2, 0x5

    goto :goto_0

    :cond_7
    const/16 v3, 0x36

    if-ne v2, v3, :cond_8

    const-wide/16 v2, 0x6

    goto :goto_0

    :cond_8
    const/16 v3, 0x37

    if-ne v2, v3, :cond_9

    const-wide/16 v2, 0x7

    goto :goto_0

    :cond_9
    const/16 v3, 0x38

    if-ne v2, v3, :cond_a

    const-wide/16 v2, 0x8

    goto :goto_0

    :cond_a
    const/16 v3, 0x39

    if-ne v2, v3, :cond_b

    const-wide/16 v2, 0x9

    goto :goto_0

    :cond_b
    const/16 v3, 0x61

    if-ne v2, v3, :cond_c

    goto :goto_1

    :cond_c
    const/16 v3, 0x41

    if-ne v2, v3, :cond_d

    :goto_1
    const-wide/16 v2, 0xa

    goto :goto_0

    :cond_d
    const/16 v3, 0x62

    if-ne v2, v3, :cond_e

    goto :goto_2

    :cond_e
    const/16 v3, 0x42

    if-ne v2, v3, :cond_f

    :goto_2
    const-wide/16 v2, 0xb

    goto :goto_0

    :cond_f
    const/16 v3, 0x63

    if-ne v2, v3, :cond_10

    goto :goto_3

    :cond_10
    const/16 v3, 0x43

    if-ne v2, v3, :cond_11

    :goto_3
    const-wide/16 v2, 0xc

    goto :goto_0

    :cond_11
    const/16 v3, 0x64

    if-ne v2, v3, :cond_12

    goto :goto_4

    :cond_12
    const/16 v3, 0x44

    if-ne v2, v3, :cond_13

    :goto_4
    const-wide/16 v2, 0xd

    goto :goto_0

    :cond_13
    const/16 v3, 0x65

    if-ne v2, v3, :cond_14

    goto :goto_5

    :cond_14
    const/16 v3, 0x45

    if-ne v2, v3, :cond_15

    :goto_5
    const-wide/16 v2, 0xe

    goto :goto_0

    :cond_15
    const/16 v3, 0x66

    if-ne v2, v3, :cond_16

    goto :goto_6

    :cond_16
    const/16 v3, 0x46

    if-ne v2, v3, :cond_17

    :goto_6
    const-wide/16 v2, 0xf

    goto/16 :goto_0

    :cond_17
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Invalid UUID string, encountered non-hexadecimal digit `"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, "` at index "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " in: "

    invoke-static {v0, p0, p2}, Lr4/K;->s(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_18
    :goto_7
    add-int/lit8 p0, p0, 0x1

    if-lt p0, p1, :cond_0

    return-wide v0
.end method

.method public static final O(Lkn/f;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const-string v0, "classDescriptor"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Ljn/d;->a:Ljava/lang/String;

    invoke-static {p0}, LPn/e;->g(Lkn/l;)LIn/c;

    move-result-object v0

    invoke-virtual {v0}, LIn/c;->i()LIn/e;

    move-result-object v0

    const-string v1, "fqNameSafe.toUnsafe()"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v0}, Ljn/d;->f(LIn/e;)LIn/b;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {v0}, LQn/b;->b(LIn/b;)LQn/b;

    move-result-object p0

    invoke-virtual {p0}, LQn/b;->e()Ljava/lang/String;

    move-result-object p0

    const-string v0, "byClassId(it).internalName"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    sget-object v0, LBn/g;->d:LBn/g;

    invoke-static {p0, v0}, LP2/e;->x(Lkn/f;LBn/g;)Ljava/lang/String;

    move-result-object p0

    :goto_0
    const-string v0, "internalName"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0x2e

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final P(Ljava/lang/String;)Ljava/util/UUID;
    .locals 6

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x24

    if-ne v0, v1, :cond_0

    new-instance v0, Ljava/util/UUID;

    const/4 v2, 0x0

    const/16 v3, 0x13

    invoke-static {v2, v3, p0}, LP2/h;->N(IILjava/lang/String;)J

    move-result-wide v4

    invoke-static {v3, v1, p0}, LP2/h;->N(IILjava/lang/String;)J

    move-result-wide v1

    invoke-direct {v0, v4, v5, v1, v2}, Ljava/util/UUID;-><init>(JJ)V

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid UUID string, expected exactly 36 characters but got "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static final a(LG/C;Lte/c;LVm/k;Lm0/l;I)V
    .locals 27

    move-object/from16 v5, p1

    move-object/from16 v3, p2

    move/from16 v1, p4

    move-object/from16 v13, p3

    check-cast v13, Lm0/q;

    const v0, 0x28b91356

    invoke-virtual {v13, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, v1, 0x6

    move-object/from16 v4, p0

    if-nez v0, :cond_1

    invoke-virtual {v13, v4}, Lm0/q;->g(Ljava/lang/Object;)Z

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

    invoke-virtual {v13, v5}, Lm0/q;->i(Ljava/lang/Object;)Z

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

    const/16 v6, 0x100

    if-nez v2, :cond_5

    invoke-virtual {v13, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    move v2, v6

    goto :goto_3

    :cond_4
    const/16 v2, 0x80

    :goto_3
    or-int/2addr v0, v2

    :cond_5
    and-int/lit16 v2, v0, 0x93

    const/16 v7, 0x92

    if-ne v2, v7, :cond_7

    invoke-virtual {v13}, Lm0/q;->H()Z

    move-result v2

    if-nez v2, :cond_6

    goto :goto_4

    :cond_6
    invoke-virtual {v13}, Lm0/q;->Y()V

    goto/16 :goto_6

    :cond_7
    :goto_4
    sget-object v2, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->b:Lm0/c1;

    invoke-virtual {v13, v2}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/Context;

    const v7, 0xd9c0672

    invoke-virtual {v13, v7}, Lm0/q;->f0(I)V

    invoke-virtual {v13}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v7

    sget-object v8, Lm0/k;->a:Lm0/e;

    if-ne v7, v8, :cond_8

    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v7}, Lm0/r;->C(Ljava/lang/Object;)Lm0/i0;

    move-result-object v7

    invoke-virtual {v13, v7}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_8
    check-cast v7, Lm0/Z;

    const/4 v9, 0x0

    invoke-virtual {v13, v9}, Lm0/q;->q(Z)V

    iget-object v10, v5, Lte/c;->e:Lte/e;

    iget-object v10, v10, Lte/e;->f:Lte/n;

    iget-boolean v10, v10, Lte/n;->a:Z

    const v11, 0x7f1205f9

    invoke-static {v13, v11}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v11

    iget-object v12, v5, Lte/c;->e:Lte/e;

    iget-object v14, v12, Lte/e;->f:Lte/n;

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v14, "context"

    invoke-static {v2, v14}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v14, "alarmTime"

    iget-object v12, v12, Lte/e;->b:LGa/s;

    invoke-static {v12, v14}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v12}, Lte/n;->a(LGa/s;)Ljava/lang/String;

    move-result-object v12

    filled-new-array {v12}, [Ljava/lang/Object;

    move-result-object v12

    const v14, 0x7f1205f7

    invoke-virtual {v2, v14, v12}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v12, "getString(...)"

    invoke-static {v2, v12}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v12, Lcom/eightsleep/corepresentation/enums/CellVariant;->STACKED:Lcom/eightsleep/corepresentation/enums/CellVariant;

    sget-object v14, LLg/g;->AUTOPILOT:LLg/g;

    const v15, 0xd9c41cb

    invoke-virtual {v13, v15}, Lm0/q;->f0(I)V

    and-int/lit16 v15, v0, 0x380

    const/16 v23, 0x1

    if-ne v15, v6, :cond_9

    move/from16 v6, v23

    goto :goto_5

    :cond_9
    move v6, v9

    :goto_5
    invoke-virtual {v13}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v15

    if-nez v6, :cond_a

    if-ne v15, v8, :cond_b

    :cond_a
    new-instance v15, Lqg/x;

    const/16 v6, 0x15

    invoke-direct {v15, v6, v3}, Lqg/x;-><init>(ILVm/k;)V

    invoke-virtual {v13, v15}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_b
    move-object/from16 v17, v15

    check-cast v17, LVm/k;

    invoke-virtual {v13, v9}, Lm0/q;->q(Z)V

    const/16 v18, 0x0

    const/high16 v20, 0x36000000

    const/4 v6, 0x0

    move v15, v9

    const/4 v9, 0x0

    move-object/from16 v16, v7

    move v7, v10

    move-object v10, v11

    const/4 v11, 0x0

    move-object/from16 v19, v13

    move-object v13, v12

    const/4 v12, 0x0

    move/from16 v21, v15

    const/4 v15, 0x0

    move-object/from16 v22, v16

    const/16 v16, 0x0

    move/from16 v24, v21

    const/16 v21, 0x6

    move-object/from16 v25, v22

    const/16 v22, 0x28d5

    move/from16 v26, v24

    move/from16 v24, v0

    move/from16 v0, v26

    move-object/from16 v26, v8

    move-object v8, v2

    move-object/from16 v2, v26

    invoke-static/range {v6 .. v22}, LP2/H;->c(LA0/r;ZLjava/lang/String;ZLjava/lang/String;Lu0/d;ZLcom/eightsleep/corepresentation/enums/CellVariant;LLg/g;ZZLVm/k;LVm/a;Lm0/l;III)V

    move-object/from16 v13, v19

    invoke-static {v13, v0}, LP2/z;->K(Lm0/l;I)V

    sget-object v12, Lue/t;->b:Lu0/d;

    and-int/lit8 v6, v24, 0xe

    const/high16 v7, 0x180000

    or-int v14, v6, v7

    const/4 v10, 0x0

    const/4 v11, 0x0

    iget-boolean v7, v5, Lte/c;->m:Z

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/16 v15, 0x1e

    move-object v6, v4

    invoke-static/range {v6 .. v15}, Lv/d;->b(LG/C;ZLA0/r;Lv/c0;Lv/d0;Ljava/lang/String;Lu0/d;Lm0/l;II)V

    const v4, 0x7f1205e7

    invoke-static {v13, v4}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v6

    invoke-interface/range {v25 .. v25}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    xor-int/lit8 v4, v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    const v4, 0xd9c896a

    invoke-virtual {v13, v4}, Lm0/q;->f0(I)V

    invoke-virtual {v13}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v4

    if-ne v4, v2, :cond_c

    new-instance v4, LXe/n1;

    const/16 v2, 0x1b

    move-object/from16 v7, v25

    invoke-direct {v4, v7, v2}, LXe/n1;-><init>(Lm0/Z;I)V

    invoke-virtual {v13, v4}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_c
    move-object v11, v4

    check-cast v11, LVm/k;

    invoke-virtual {v13, v0}, Lm0/q;->q(Z)V

    sget-object v12, Lue/t;->c:Lu0/d;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v7, 0x0

    const/high16 v14, 0xd80000

    const/16 v15, 0x1e

    invoke-static/range {v6 .. v15}, La7/d;->a(Ljava/lang/String;LA0/r;LMg/q;Ljava/lang/Integer;Ljava/lang/Boolean;LVm/k;LVm/o;Lm0/l;II)V

    :goto_6
    invoke-virtual {v13}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_d

    new-instance v0, Lj0/f0;

    const/16 v2, 0x10

    move-object/from16 v4, p0

    invoke-direct/range {v0 .. v5}, Lj0/f0;-><init>(IILVm/k;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_d
    return-void
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

    const v1, 0x526b1900

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
    sget-object v8, Lue/t;->a:Lu0/d;

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

    const-string v7, "alarm_smart"

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

    const/4 v6, 0x2

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

.method public static final c(LA0/r;Lu9/e;Lze/k;LVm/k;Lm0/l;I)V
    .locals 23

    move-object/from16 v1, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v2, p3

    move/from16 v5, p5

    const-string v0, "modifier"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "model"

    invoke-static {v4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onUiAction"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v13, p4

    check-cast v13, Lm0/q;

    const v0, -0x495f417e

    invoke-virtual {v13, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, v5, 0x6

    const/4 v6, 0x2

    if-nez v0, :cond_1

    invoke-virtual {v13, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    move v0, v6

    :goto_0
    or-int/2addr v0, v5

    goto :goto_1

    :cond_1
    move v0, v5

    :goto_1
    and-int/lit8 v7, v5, 0x30

    if-nez v7, :cond_3

    invoke-virtual {v13, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    const/16 v7, 0x20

    goto :goto_2

    :cond_2
    const/16 v7, 0x10

    :goto_2
    or-int/2addr v0, v7

    :cond_3
    and-int/lit16 v7, v5, 0x180

    if-nez v7, :cond_5

    invoke-virtual {v13, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    const/16 v7, 0x100

    goto :goto_3

    :cond_4
    const/16 v7, 0x80

    :goto_3
    or-int/2addr v0, v7

    :cond_5
    and-int/lit16 v7, v5, 0xc00

    if-nez v7, :cond_7

    invoke-virtual {v13, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    const/16 v7, 0x800

    goto :goto_4

    :cond_6
    const/16 v7, 0x400

    :goto_4
    or-int/2addr v0, v7

    :cond_7
    and-int/lit16 v7, v0, 0x493

    const/16 v8, 0x492

    if-ne v7, v8, :cond_9

    invoke-virtual {v13}, Lm0/q;->H()Z

    move-result v7

    if-nez v7, :cond_8

    goto :goto_5

    :cond_8
    invoke-virtual {v13}, Lm0/q;->Y()V

    goto/16 :goto_c

    :cond_9
    :goto_5
    iget-object v7, v4, Lze/k;->c:Ljava/util/List;

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_a
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_b

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    move-object v9, v8

    check-cast v9, Lu9/b;

    iget-object v9, v9, Lu9/b;->a:Ljava/lang/String;

    iget-object v10, v3, Lu9/e;->d:Ljava/lang/String;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_a

    goto :goto_6

    :cond_b
    const/4 v8, 0x0

    :goto_6
    check-cast v8, Lu9/b;

    sget-object v7, Landroidx/compose/foundation/layout/b;->c:Landroidx/compose/foundation/layout/FillElement;

    invoke-interface {v1, v7}, LA0/r;->then(LA0/r;)LA0/r;

    move-result-object v7

    invoke-static {v13}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v9

    iget v9, v9, Lhh/i;->e:F

    const/4 v10, 0x0

    invoke-static {v7, v9, v10, v6}, LG/e;->J(LA0/r;FFI)LA0/r;

    move-result-object v6

    sget-object v7, LA0/d;->n:LA0/g;

    sget-object v9, LG/l;->c:LG/f;

    const/16 v10, 0x30

    invoke-static {v9, v7, v13, v10}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v7

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

    if-eqz v12, :cond_c

    invoke-virtual {v13, v11}, Lm0/q;->l(LVm/a;)V

    goto :goto_7

    :cond_c
    invoke-virtual {v13}, Lm0/q;->t0()V

    :goto_7
    sget-object v12, LZ0/g;->f:LZ0/e;

    invoke-static {v12, v7, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v7, LZ0/g;->e:LZ0/e;

    invoke-static {v7, v10, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    sget-object v10, LZ0/g;->g:LZ0/e;

    invoke-static {v13, v9, v10}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v9, LZ0/g;->h:LZ0/d;

    invoke-static {v13, v9}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v14, LZ0/g;->d:LZ0/e;

    invoke-static {v14, v6, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v6, LG/D;->a:LG/D;

    const/4 v15, 0x0

    invoke-static {v13, v15}, LP2/z;->J(Lm0/l;I)V

    const v15, 0x24ab12d8

    invoke-virtual {v13, v15}, Lm0/q;->f0(I)V

    invoke-virtual {v3}, Lu9/e;->c()Z

    move-result v15

    move-object/from16 v16, v8

    if-eqz v15, :cond_e

    sget-object v15, LA0/o;->a:LA0/o;

    const v8, 0x3f19999a    # 0.6f

    invoke-static {v15, v8}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v8

    sget-object v15, LA0/d;->a:LA0/i;

    move/from16 v21, v0

    const/4 v0, 0x0

    invoke-static {v15, v0}, LG/t;->d(LA0/e;Z)LX0/h0;

    move-result-object v15

    iget-wide v0, v13, Lm0/q;->T:J

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result v0

    invoke-virtual {v13}, Lm0/q;->m()Lm0/o0;

    move-result-object v1

    invoke-static {v8, v13}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v8

    invoke-virtual {v13}, Lm0/q;->j0()V

    iget-boolean v5, v13, Lm0/q;->S:Z

    if-eqz v5, :cond_d

    invoke-virtual {v13, v11}, Lm0/q;->l(LVm/a;)V

    goto :goto_8

    :cond_d
    invoke-virtual {v13}, Lm0/q;->t0()V

    :goto_8
    invoke-static {v12, v15, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v7, v1, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v0, v13, v10, v13, v9}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    invoke-static {v14, v8, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    iget-object v0, v3, Lu9/e;->f:Lu9/a;

    sget-object v12, LX0/p;->b:LX0/p0;

    move-object/from16 v8, v16

    const/16 v16, 0x0

    const v18, 0x180030

    iget-object v0, v0, Lu9/a;->a:Ljava/lang/String;

    const/4 v7, 0x0

    move-object v1, v8

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v17, v13

    const/4 v5, 0x1

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x7bc

    move-object/from16 v22, v6

    move-object v6, v0

    move-object/from16 v0, v22

    invoke-static/range {v6 .. v20}, Lcoil3/compose/SingletonAsyncImageKt;->AsyncImage-10Xjiaw(Ljava/lang/Object;Ljava/lang/String;LA0/r;LVm/k;LVm/k;LA0/e;LX0/q;FLH0/x;IZLm0/l;III)V

    move-object/from16 v13, v17

    invoke-virtual {v13, v5}, Lm0/q;->q(Z)V

    const/4 v6, 0x0

    invoke-static {v13, v6}, LP2/z;->J(Lm0/l;I)V

    goto :goto_9

    :cond_e
    move/from16 v21, v0

    move-object v0, v6

    move-object/from16 v1, v16

    const/4 v5, 0x1

    const/4 v6, 0x0

    :goto_9
    invoke-virtual {v13, v6}, Lm0/q;->q(Z)V

    sget-object v6, Lg8/h0;->a:Lg8/h0;

    new-instance v14, Lv1/k;

    const/4 v7, 0x3

    invoke-direct {v14, v7}, Lv1/k;-><init>(I)V

    iget-object v11, v3, Lu9/e;->b:Ljava/lang/String;

    const/4 v10, 0x0

    const/4 v9, 0x0

    const/4 v15, 0x0

    const/4 v12, 0x0

    move v8, v7

    const/4 v7, 0x0

    move/from16 v16, v8

    const/16 v8, 0x6e

    invoke-virtual/range {v6 .. v15}, Lg8/h0;->v(IILA0/r;LH0/w;Ljava/lang/String;Lk1/U;Lm0/l;Lv1/k;Z)V

    move v8, v7

    move-object v7, v6

    const/4 v6, 0x0

    invoke-static {v13, v6}, LP2/z;->Q(Lm0/l;I)V

    const v6, 0x24ab7529

    invoke-virtual {v13, v6}, Lm0/q;->f0(I)V

    invoke-virtual {v3}, Lu9/e;->c()Z

    move-result v6

    if-eqz v6, :cond_10

    const v1, 0x7f12015c

    invoke-static {v13, v1}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v1

    :cond_f
    :goto_a
    move-object v11, v1

    const/4 v6, 0x0

    goto :goto_b

    :cond_10
    if-eqz v1, :cond_12

    iget-object v1, v1, Lu9/b;->b:Ljava/lang/String;

    if-eqz v1, :cond_12

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_11

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v9, 0x0

    invoke-virtual {v1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v9

    const-string v10, "null cannot be cast to non-null type java.lang.String"

    invoke-static {v9, v10}, Lkotlin/jvm/internal/l;->h(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v10, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v9, v10}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "toUpperCase(...)"

    invoke-static {v9, v10}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const-string v9, "substring(...)"

    invoke-static {v1, v9}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_11
    if-nez v1, :cond_f

    :cond_12
    const-string v1, ""

    goto :goto_a

    :goto_b
    invoke-virtual {v13, v6}, Lm0/q;->q(Z)V

    invoke-static {v13}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v1

    iget-object v1, v1, Lhh/h;->k:Lhh/v;

    iget-wide v9, v1, Lhh/v;->d:J

    new-instance v1, LH0/w;

    invoke-direct {v1, v9, v10}, LH0/w;-><init>(J)V

    new-instance v14, Lv1/k;

    const/4 v6, 0x3

    invoke-direct {v14, v6}, Lv1/k;-><init>(I)V

    const/4 v15, 0x0

    const/4 v12, 0x0

    const/4 v9, 0x0

    move/from16 v16, v6

    move-object v6, v7

    move v7, v8

    const/16 v8, 0x6c

    move-object v10, v1

    invoke-virtual/range {v6 .. v15}, Lg8/h0;->c(IILA0/r;LH0/w;Ljava/lang/String;Lk1/U;Lm0/l;Lv1/k;Z)V

    const/4 v1, 0x6

    invoke-static {v0, v13, v1}, LP2/z;->I(LG/C;Lm0/l;I)V

    shr-int/lit8 v0, v21, 0x3

    and-int/lit16 v0, v0, 0x3fe

    invoke-static {v3, v4, v2, v13, v0}, LP2/h;->p(Lu9/e;Lze/k;LVm/k;Lm0/l;I)V

    const/4 v6, 0x0

    invoke-static {v13, v6}, LP2/z;->R(Lm0/l;I)V

    invoke-static {v3, v4, v2, v13, v0}, LP2/h;->q(Lu9/e;Lze/k;LVm/k;Lm0/l;I)V

    invoke-static {v13, v6}, LP2/z;->R(Lm0/l;I)V

    invoke-virtual {v13, v5}, Lm0/q;->q(Z)V

    :goto_c
    invoke-virtual {v13}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_13

    new-instance v0, LAe/f;

    const/4 v6, 0x1

    move-object/from16 v1, p0

    move/from16 v5, p5

    invoke-direct/range {v0 .. v6}, LAe/f;-><init>(Ljava/lang/Object;LVm/k;Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_13
    return-void
.end method

.method public static final d(Lcom/eightsleep/presentation_audio/viewmodel/AudioViewModel;LA0/r;LVm/k;LVm/k;Lm0/l;I)V
    .locals 15

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    const-string v0, "modifier"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onNavEvent"

    invoke-static {v3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onOneTimeEvent"

    invoke-static {v4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v12, p4

    check-cast v12, Lm0/q;

    const v0, 0x33f5742d

    invoke-virtual {v12, v0}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v12, p0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int v0, p5, v0

    invoke-virtual {v12, v2}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x20

    goto :goto_1

    :cond_1
    const/16 v1, 0x10

    :goto_1
    or-int/2addr v0, v1

    invoke-virtual {v12, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x100

    goto :goto_2

    :cond_2
    const/16 v1, 0x80

    :goto_2
    or-int/2addr v0, v1

    invoke-virtual {v12, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/16 v1, 0x800

    goto :goto_3

    :cond_3
    const/16 v1, 0x400

    :goto_3
    or-int/2addr v0, v1

    and-int/lit16 v1, v0, 0x493

    const/16 v5, 0x492

    if-ne v1, v5, :cond_5

    invoke-virtual {v12}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_4

    goto :goto_4

    :cond_4
    invoke-virtual {v12}, Lm0/q;->Y()V

    goto :goto_5

    :cond_5
    :goto_4
    new-instance v1, LAe/Q;

    const/4 v5, 0x0

    invoke-direct {v1, v2, v5}, LAe/Q;-><init>(LA0/r;I)V

    const v5, -0x7a217ab8

    invoke-static {v5, v1, v12}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v11

    shl-int/lit8 v1, v0, 0x3

    and-int/lit8 v5, v1, 0x70

    const v6, 0x6c06000

    or-int/2addr v5, v6

    shr-int/lit8 v0, v0, 0x3

    and-int/lit16 v0, v0, 0x380

    or-int/2addr v0, v5

    and-int/lit16 v1, v1, 0x1c00

    or-int v13, v0, v1

    const/4 v9, 0x0

    const-string v10, "audio_track_details"

    const/4 v3, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/16 v14, 0x61

    move-object/from16 v6, p2

    move-object v5, v4

    move-object v4, p0

    invoke-static/range {v3 .. v14}, LP2/o;->g(LA0/r;LL8/e;LVm/k;LVm/k;ZZLH0/w;Ljava/lang/String;LVm/r;Lm0/l;II)V

    :goto_5
    invoke-virtual {v12}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_6

    new-instance v0, LAe/C;

    const/4 v6, 0x2

    move-object v1, p0

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move/from16 v5, p5

    invoke-direct/range {v0 .. v6}, LAe/C;-><init>(Lcom/eightsleep/presentation_audio/viewmodel/AudioViewModel;LA0/r;LVm/k;LVm/k;II)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_6
    return-void
.end method

.method public static final e(LA0/r;Lze/k;LVm/k;Lm0/l;I)V
    .locals 26

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v4, p4

    const-string v0, "modifier"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "model"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onUiAction"

    invoke-static {v3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v12, p3

    check-cast v12, Lm0/q;

    const v0, 0x117236b8

    invoke-virtual {v12, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, v4, 0x6

    if-nez v0, :cond_1

    invoke-virtual {v12, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

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

    invoke-virtual {v12, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

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

    const/16 v6, 0x100

    if-nez v5, :cond_5

    invoke-virtual {v12, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    move v5, v6

    goto :goto_3

    :cond_4
    const/16 v5, 0x80

    :goto_3
    or-int/2addr v0, v5

    :cond_5
    and-int/lit16 v5, v0, 0x93

    const/16 v7, 0x92

    if-ne v5, v7, :cond_7

    invoke-virtual {v12}, Lm0/q;->H()Z

    move-result v5

    if-nez v5, :cond_6

    goto :goto_4

    :cond_6
    invoke-virtual {v12}, Lm0/q;->Y()V

    goto/16 :goto_9

    :cond_7
    :goto_4
    sget-object v5, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->b:Lm0/c1;

    invoke-virtual {v12, v5}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/Context;

    iget-object v7, v2, Lze/k;->d:Ljava/util/List;

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_8
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_9

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    move-object v9, v8

    check-cast v9, Lu9/e;

    iget-object v9, v9, Lu9/e;->a:Ljava/lang/String;

    iget-object v10, v2, Lze/k;->a:Ljava/lang/String;

    invoke-static {v9, v10}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    goto :goto_5

    :cond_9
    const/4 v8, 0x0

    :goto_5
    move-object v7, v8

    check-cast v7, Lu9/e;

    if-nez v7, :cond_a

    invoke-virtual {v12}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_12

    new-instance v0, LAe/I;

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, LAe/I;-><init>(LA0/r;Lze/k;LVm/k;II)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    return-void

    :cond_a
    move-object v1, v2

    move-object v2, v3

    sget-object v13, Landroidx/compose/foundation/layout/b;->c:Landroidx/compose/foundation/layout/FillElement;

    const v3, -0x4cf072b6

    invoke-virtual {v12, v3}, Lm0/q;->f0(I)V

    and-int/lit16 v3, v0, 0x380

    const/4 v4, 0x0

    const/4 v8, 0x1

    if-ne v3, v6, :cond_b

    move v3, v8

    goto :goto_6

    :cond_b
    move v3, v4

    :goto_6
    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v6

    if-nez v3, :cond_c

    sget-object v3, Lm0/k;->a:Lm0/e;

    if-ne v6, v3, :cond_d

    :cond_c
    new-instance v6, LAe/O;

    const/4 v3, 0x0

    invoke-direct {v6, v3, v2}, LAe/O;-><init>(ILVm/k;)V

    invoke-virtual {v12, v6}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_d
    move-object/from16 v19, v6

    check-cast v19, LVm/a;

    invoke-virtual {v12, v4}, Lm0/q;->q(Z)V

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    iget-boolean v3, v1, Lze/k;->i:Z

    const/16 v20, 0x18

    move/from16 v16, v3

    invoke-static/range {v13 .. v20}, Landroidx/compose/foundation/b;->b(LA0/r;LE/l;Landroidx/compose/material3/c;ZLjava/lang/String;Lh1/j;LVm/a;I)LA0/r;

    move-result-object v3

    sget-object v6, LA0/d;->a:LA0/i;

    invoke-static {v6, v4}, LG/t;->d(LA0/e;Z)LX0/h0;

    move-result-object v6

    iget-wide v9, v12, Lm0/q;->T:J

    invoke-static {v9, v10}, Ljava/lang/Long;->hashCode(J)I

    move-result v9

    invoke-virtual {v12}, Lm0/q;->m()Lm0/o0;

    move-result-object v10

    invoke-static {v3, v12}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v3

    sget-object v11, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v11, LZ0/g;->b:LZ0/f;

    invoke-virtual {v12}, Lm0/q;->j0()V

    iget-boolean v14, v12, Lm0/q;->S:Z

    if-eqz v14, :cond_e

    invoke-virtual {v12, v11}, Lm0/q;->l(LVm/a;)V

    goto :goto_7

    :cond_e
    invoke-virtual {v12}, Lm0/q;->t0()V

    :goto_7
    sget-object v11, LZ0/g;->f:LZ0/e;

    invoke-static {v11, v6, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v6, LZ0/g;->e:LZ0/e;

    invoke-static {v6, v10, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    sget-object v9, LZ0/g;->g:LZ0/e;

    invoke-static {v12, v6, v9}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v6, LZ0/g;->h:LZ0/d;

    invoke-static {v12, v6}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v6, LZ0/g;->d:LZ0/e;

    invoke-static {v6, v3, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    iget-object v3, v7, Lu9/e;->f:Lu9/a;

    iget-object v6, v3, Lu9/a;->f:Ljava/lang/Object;

    const v9, -0xec73118

    invoke-virtual {v12, v9}, Lm0/q;->f0(I)V

    invoke-interface {v6}, Ljava/util/Collection;->isEmpty()Z

    move-result v9

    xor-int/2addr v9, v8

    if-ne v9, v8, :cond_f

    const/4 v9, 0x6

    invoke-static {v9, v4, v13, v6, v12}, Landroidx/health/platform/client/proto/v0;->a(IILA0/r;Ljava/util/List;Lm0/l;)V

    :cond_f
    invoke-virtual {v12, v4}, Lm0/q;->q(Z)V

    invoke-virtual {v7}, Lu9/e;->c()Z

    move-result v6

    if-eqz v6, :cond_10

    iget-object v6, v3, Lu9/a;->c:Ljava/lang/String;

    if-eqz v6, :cond_10

    const-string v9, ".mp4"

    invoke-static {v6, v9, v4}, Llo/n;->f0(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v9

    if-ne v9, v8, :cond_10

    const v3, 0x35e50eeb

    invoke-virtual {v12, v3}, Lm0/q;->f0(I)V

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const/16 v18, 0x0

    const/high16 v20, 0xc00000

    const/4 v1, 0x0

    move v6, v4

    move-object v4, v3

    const/4 v3, 0x0

    move-object v2, v5

    const/4 v5, 0x0

    move v9, v6

    const/4 v6, 0x0

    move-object v10, v7

    const/4 v7, 0x0

    move v11, v8

    const/4 v8, 0x1

    move v13, v9

    const/4 v9, 0x0

    move-object v14, v10

    const/4 v10, 0x0

    move v15, v11

    const/4 v11, 0x0

    move-object/from16 v19, v12

    const/4 v12, 0x0

    move/from16 v16, v13

    const/4 v13, 0x0

    move-object/from16 v17, v14

    const/4 v14, 0x0

    move/from16 v21, v15

    const/4 v15, 0x0

    move/from16 v22, v16

    const/16 v16, 0x0

    move-object/from16 v23, v17

    const/16 v17, 0x0

    move/from16 v24, v21

    const/16 v21, 0x0

    move/from16 v25, v22

    const v22, 0x7ff75

    move/from16 v24, v0

    move/from16 v0, v25

    invoke-static/range {v1 .. v22}, Landroidx/health/platform/client/proto/v0;->t(LA0/r;Landroid/content/Context;Landroidx/media3/exoplayer/ExoPlayer;Landroid/net/Uri;Ly0/o;IZZZILVm/k;LVm/k;LVm/a;LVm/k;LVm/k;LVm/n;LVm/n;ZLm0/l;III)V

    move-object/from16 v12, v19

    invoke-virtual {v12, v0}, Lm0/q;->q(Z)V

    goto :goto_8

    :cond_10
    move/from16 v24, v0

    move v0, v4

    move-object/from16 v23, v7

    iget-object v1, v3, Lu9/a;->a:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_11

    const v2, 0x35e84c88

    invoke-virtual {v12, v2}, Lm0/q;->f0(I)V

    sget-object v7, LX0/p;->g:LX0/p0;

    const/4 v11, 0x0

    move-object v3, v13

    const v13, 0x1801b0

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v14, 0x0

    const/16 v15, 0x7b8

    invoke-static/range {v1 .. v15}, Lcoil3/compose/SingletonAsyncImageKt;->AsyncImage-10Xjiaw(Ljava/lang/Object;Ljava/lang/String;LA0/r;LVm/k;LVm/k;LA0/e;LX0/q;FLH0/x;IZLm0/l;III)V

    invoke-virtual {v12, v0}, Lm0/q;->q(Z)V

    goto :goto_8

    :cond_11
    const v1, 0x35ebcdb7

    invoke-virtual {v12, v1}, Lm0/q;->f0(I)V

    invoke-virtual {v12, v0}, Lm0/q;->q(Z)V

    :goto_8
    and-int/lit8 v0, v24, 0xe

    shl-int/lit8 v1, v24, 0x3

    and-int/lit16 v2, v1, 0x380

    or-int/2addr v0, v2

    and-int/lit16 v1, v1, 0x1c00

    or-int v5, v0, v1

    move-object/from16 v0, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object v4, v12

    move-object/from16 v1, v23

    invoke-static/range {v0 .. v5}, LP2/h;->c(LA0/r;Lu9/e;Lze/k;LVm/k;Lm0/l;I)V

    const/4 v11, 0x1

    invoke-virtual {v12, v11}, Lm0/q;->q(Z)V

    :goto_9
    invoke-virtual {v12}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_12

    new-instance v0, LAe/I;

    const/4 v5, 0x1

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v4, p4

    invoke-direct/range {v0 .. v5}, LAe/I;-><init>(LA0/r;Lze/k;LVm/k;II)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_12
    return-void
.end method

.method public static final f(ILA0/r;LVm/k;LVm/k;Lcom/eightsleep/presentation_autopilot/viewmodel/AutopilotViewModel;Lm0/l;)V
    .locals 12

    move-object/from16 v1, p4

    const-string v0, "onNavEvent"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "viewModel"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onOneTimeEvent"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v9, p5

    check-cast v9, Lm0/q;

    const v0, 0x39655dbd

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

    invoke-virtual {v9, p2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/16 v2, 0x20

    goto :goto_1

    :cond_1
    const/16 v2, 0x10

    :goto_1
    or-int/2addr v0, v2

    invoke-virtual {v9, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

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
    sget-object v8, LNe/q;->a:Lu0/d;

    and-int/lit8 v2, v0, 0xe

    const/high16 v3, 0x6c30000

    or-int/2addr v2, v3

    shr-int/lit8 v3, v0, 0x3

    and-int/lit8 v4, v3, 0x70

    or-int/2addr v2, v4

    and-int/lit16 v3, v3, 0x380

    or-int/2addr v2, v3

    shl-int/lit8 v0, v0, 0x6

    and-int/lit16 v0, v0, 0x1c00

    or-int v10, v2, v0

    const/4 v6, 0x0

    const-string v7, "autopilot_edit_height"

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/16 v11, 0x50

    move-object v0, p1

    move-object v3, p2

    move-object v2, p3

    invoke-static/range {v0 .. v11}, LP2/o;->g(LA0/r;LL8/e;LVm/k;LVm/k;ZZLH0/w;Ljava/lang/String;LVm/r;Lm0/l;II)V

    :goto_5
    invoke-virtual {v9}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_6

    new-instance v0, LMe/a;

    const/4 v6, 0x4

    move v5, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object/from16 v3, p4

    invoke-direct/range {v0 .. v6}, LMe/a;-><init>(LA0/r;LVm/k;Lcom/eightsleep/presentation_autopilot/viewmodel/AutopilotViewModel;LVm/k;II)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_6
    return-void
.end method

.method public static final g(LG/C;LLe/d;LVm/k;Lc8/e;Lm0/l;I)V
    .locals 50

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v0, p3

    move/from16 v10, p5

    const-string v4, "<this>"

    invoke-static {v1, v4}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "onUiAction"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v11, p4

    check-cast v11, Lm0/q;

    const v4, 0x1a6608f9

    invoke-virtual {v11, v4}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v4, v10, 0x6

    if-nez v4, :cond_1

    invoke-virtual {v11, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v4, 0x4

    goto :goto_0

    :cond_0
    const/4 v4, 0x2

    :goto_0
    or-int/2addr v4, v10

    goto :goto_1

    :cond_1
    move v4, v10

    :goto_1
    and-int/lit8 v5, v10, 0x30

    if-nez v5, :cond_3

    invoke-virtual {v11, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    const/16 v5, 0x20

    goto :goto_2

    :cond_2
    const/16 v5, 0x10

    :goto_2
    or-int/2addr v4, v5

    :cond_3
    and-int/lit16 v5, v10, 0x180

    if-nez v5, :cond_5

    invoke-virtual {v11, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    const/16 v5, 0x100

    goto :goto_3

    :cond_4
    const/16 v5, 0x80

    :goto_3
    or-int/2addr v4, v5

    :cond_5
    and-int/lit16 v5, v10, 0xc00

    if-nez v5, :cond_7

    invoke-virtual {v11, v0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    const/16 v5, 0x800

    goto :goto_4

    :cond_6
    const/16 v5, 0x400

    :goto_4
    or-int/2addr v4, v5

    :cond_7
    move v12, v4

    and-int/lit16 v4, v12, 0x493

    const/16 v5, 0x492

    if-ne v4, v5, :cond_9

    invoke-virtual {v11}, Lm0/q;->H()Z

    move-result v4

    if-nez v4, :cond_8

    goto :goto_5

    :cond_8
    invoke-virtual {v11}, Lm0/q;->Y()V

    move-object v4, v0

    move-object/from16 v36, v11

    goto/16 :goto_14

    :cond_9
    :goto_5
    iget-object v4, v2, LLe/d;->c:LN9/n;

    iget v5, v4, LN9/n;->a:I

    const v7, 0x51741db

    invoke-virtual {v11, v7}, Lm0/q;->f0(I)V

    invoke-virtual {v11}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v7

    sget-object v13, Lm0/k;->a:Lm0/e;

    const-string v8, ""

    if-ne v7, v13, :cond_b

    if-lez v5, :cond_a

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    goto :goto_6

    :cond_a
    move-object v7, v8

    :goto_6
    invoke-static {v7}, Lm0/r;->C(Ljava/lang/Object;)Lm0/i0;

    move-result-object v7

    invoke-virtual {v11, v7}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_b
    check-cast v7, Lm0/Z;

    const/4 v14, 0x0

    const v9, 0x5174ee2

    invoke-static {v9, v11, v14}, Lcom/eightsleep/data_bioage/data/model/a;->f(ILm0/q;Z)Ljava/lang/Object;

    move-result-object v9

    if-ne v9, v13, :cond_d

    if-lez v5, :cond_c

    div-int/lit8 v9, v5, 0xc

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    goto :goto_7

    :cond_c
    move-object v9, v8

    :goto_7
    invoke-static {v9}, Lm0/r;->C(Ljava/lang/Object;)Lm0/i0;

    move-result-object v9

    invoke-virtual {v11, v9}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_d
    check-cast v9, Lm0/Z;

    const v15, 0x5175d02

    invoke-static {v15, v11, v14}, Lcom/eightsleep/data_bioage/data/model/a;->f(ILm0/q;Z)Ljava/lang/Object;

    move-result-object v15

    if-ne v15, v13, :cond_f

    if-lez v5, :cond_e

    rem-int/lit8 v8, v5, 0xc

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    :cond_e
    invoke-static {v8}, Lm0/r;->C(Ljava/lang/Object;)Lm0/i0;

    move-result-object v15

    invoke-virtual {v11, v15}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_f
    check-cast v15, Lm0/Z;

    const v8, 0x5176a99

    invoke-static {v8, v11, v14}, Lcom/eightsleep/data_bioage/data/model/a;->f(ILm0/q;Z)Ljava/lang/Object;

    move-result-object v8

    iget-object v4, v4, LN9/n;->b:Lcom/eightsleep/data_core/enums/UnitOfMeasurement;

    if-ne v8, v13, :cond_10

    invoke-static {v4}, Lm0/r;->C(Ljava/lang/Object;)Lm0/i0;

    move-result-object v8

    invoke-virtual {v11, v8}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_10
    check-cast v8, Lm0/Z;

    invoke-virtual {v11, v14}, Lm0/q;->q(Z)V

    invoke-interface {v9}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    invoke-static/range {v16 .. v16}, Llo/u;->d0(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v16

    if-eqz v16, :cond_11

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v16

    move/from16 v14, v16

    :cond_11
    invoke-interface {v15}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    invoke-static/range {v16 .. v16}, Llo/u;->d0(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v16

    if-eqz v16, :cond_12

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v16

    move/from16 v6, v16

    goto :goto_8

    :cond_12
    const/4 v6, 0x0

    :goto_8
    invoke-interface {v7}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    invoke-static/range {v17 .. v17}, Llo/u;->d0(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v17

    if-eqz v17, :cond_13

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v17

    goto :goto_9

    :cond_13
    const/16 v17, 0x0

    :goto_9
    invoke-interface {v8}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v2

    sget-object v10, Lcom/eightsleep/data_core/enums/UnitOfMeasurement;->INCHES:Lcom/eightsleep/data_core/enums/UnitOfMeasurement;

    if-ne v2, v10, :cond_14

    mul-int/lit8 v2, v14, 0xc

    add-int v17, v2, v6

    :cond_14
    invoke-interface {v7}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_15

    invoke-interface {v8}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v4, :cond_15

    div-int/lit8 v2, v5, 0xc

    if-ne v14, v2, :cond_15

    rem-int/lit8 v5, v5, 0xc

    if-eq v6, v5, :cond_16

    :cond_15
    if-lez v17, :cond_16

    move-object v2, v4

    move v4, v3

    goto :goto_a

    :cond_16
    move-object v2, v4

    const/4 v4, 0x0

    :goto_a
    const v5, 0x517b684

    invoke-virtual {v11, v5}, Lm0/q;->f0(I)V

    invoke-virtual {v11, v4}, Lm0/q;->h(Z)Z

    move-result v5

    and-int/lit16 v6, v12, 0x380

    const/16 v14, 0x100

    if-ne v6, v14, :cond_17

    move v6, v3

    goto :goto_b

    :cond_17
    const/4 v6, 0x0

    :goto_b
    or-int/2addr v5, v6

    invoke-virtual {v11}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v6

    if-nez v5, :cond_18

    if-ne v6, v13, :cond_19

    :cond_18
    move v5, v3

    goto :goto_c

    :cond_19
    move-object v14, v9

    move-object v9, v8

    move-object v8, v14

    move v14, v3

    move-object v3, v6

    move-object v6, v7

    move-object v7, v15

    goto :goto_d

    :goto_c
    new-instance v3, LNe/f;

    move-object v6, v9

    move-object v9, v8

    move-object v8, v6

    move v14, v5

    move-object v6, v7

    move-object v7, v15

    move-object/from16 v5, p2

    invoke-direct/range {v3 .. v9}, LNe/f;-><init>(ZLVm/k;Lm0/Z;Lm0/Z;Lm0/Z;Lm0/Z;)V

    invoke-virtual {v11, v3}, Lm0/q;->q0(Ljava/lang/Object;)V

    :goto_d
    check-cast v3, LVm/a;

    const/4 v5, 0x0

    invoke-virtual {v11, v5}, Lm0/q;->q(Z)V

    sget-object v15, LA0/o;->a:LA0/o;

    move/from16 v16, v12

    const/high16 v12, 0x3f800000    # 1.0f

    invoke-static {v15, v12}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v14

    sget-object v12, LG/l;->a:LG/d;

    move-object/from16 v41, v3

    sget-object v3, LA0/d;->j:LA0/h;

    invoke-static {v12, v3, v11, v5}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v3

    move/from16 v42, v4

    iget-wide v4, v11, Lm0/q;->T:J

    invoke-static {v4, v5}, Ljava/lang/Long;->hashCode(J)I

    move-result v4

    invoke-virtual {v11}, Lm0/q;->m()Lm0/o0;

    move-result-object v5

    invoke-static {v14, v11}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v12

    sget-object v14, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v14, LZ0/g;->b:LZ0/f;

    invoke-virtual {v11}, Lm0/q;->j0()V

    move/from16 v19, v4

    iget-boolean v4, v11, Lm0/q;->S:Z

    if-eqz v4, :cond_1a

    invoke-virtual {v11, v14}, Lm0/q;->l(LVm/a;)V

    goto :goto_e

    :cond_1a
    invoke-virtual {v11}, Lm0/q;->t0()V

    :goto_e
    sget-object v4, LZ0/g;->f:LZ0/e;

    invoke-static {v4, v3, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v3, LZ0/g;->e:LZ0/e;

    invoke-static {v3, v5, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    sget-object v0, LZ0/g;->g:LZ0/e;

    invoke-static {v11, v5, v0}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v5, LZ0/g;->h:LZ0/d;

    invoke-static {v11, v5}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v1, LZ0/g;->d:LZ0/e;

    invoke-static {v1, v12, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v12, LG/W0;->a:LG/W0;

    move-object/from16 v19, v14

    invoke-interface {v9}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v14

    move-object/from16 v43, v9

    const/4 v9, 0x3

    if-ne v14, v10, :cond_1d

    const v6, -0x683c2f69

    invoke-virtual {v11, v6}, Lm0/q;->f0(I)V

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v14, 0x1

    invoke-virtual {v12, v15, v6, v14}, LG/W0;->b(LA0/r;FZ)LA0/r;

    move-result-object v22

    invoke-interface {v8}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v20, v17

    check-cast v20, Ljava/lang/String;

    const v6, 0x7f121862

    invoke-static {v11, v6}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v17, v15

    new-instance v15, Lp1/l;

    invoke-direct {v15, v9}, Lp1/l;-><init>(I)V

    const v14, 0x4e566e8

    invoke-virtual {v11, v14}, Lm0/q;->f0(I)V

    invoke-virtual {v11}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v14

    if-ne v14, v13, :cond_1b

    new-instance v14, LMe/c;

    const/4 v9, 0x3

    invoke-direct {v14, v8, v9}, LMe/c;-><init>(Lm0/Z;I)V

    invoke-virtual {v11, v14}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_1b
    check-cast v14, LVm/k;

    const/4 v8, 0x0

    invoke-virtual {v11, v8}, Lm0/q;->q(Z)V

    const v37, 0x36000

    const/16 v38, 0x6

    move-object/from16 v36, v11

    const/4 v11, 0x0

    move-object v9, v12

    const/4 v12, 0x0

    move-object/from16 v23, v13

    const/4 v13, 0x0

    move/from16 v24, v16

    const/16 v16, 0x1

    move-object/from16 v25, v17

    const/16 v17, 0x0

    const/high16 v26, 0x3f800000    # 1.0f

    const/16 v18, 0x0

    move-object/from16 v27, v19

    const/16 v19, 0x0

    move-object/from16 v28, v23

    const/16 v23, 0x0

    move/from16 v29, v24

    const/16 v24, 0x0

    move-object/from16 v30, v25

    const/16 v25, 0x0

    move/from16 v31, v26

    const/16 v26, 0x0

    move-object/from16 v32, v27

    const/16 v27, 0x0

    move-object/from16 v33, v28

    const/16 v28, 0x0

    move/from16 v34, v29

    const/16 v29, 0x0

    move-object/from16 v35, v30

    const/16 v30, 0x0

    move/from16 v39, v31

    const/16 v31, 0x0

    move-object/from16 v40, v32

    const/16 v32, 0x0

    move-object/from16 v45, v33

    move/from16 v44, v34

    const-wide/16 v33, 0x0

    move-object/from16 v46, v35

    const/16 v35, 0x0

    move/from16 v47, v39

    const/16 v39, 0x0

    move-object/from16 v48, v40

    const v40, 0xfff1c7

    move-object/from16 p4, v10

    move-object/from16 v21, v14

    move-object/from16 v10, v46

    move-object/from16 v49, v48

    move-object/from16 v46, v1

    move-object v14, v6

    move-object v1, v9

    move-object/from16 v9, v45

    const/4 v6, 0x1

    move-object/from16 v45, v2

    move/from16 v2, v47

    invoke-static/range {v11 .. v40}, LP2/p;->d(Ljava/lang/String;Ljava/lang/String;LVm/a;Ljava/lang/String;Lp1/l;ZLVm/a;LVm/a;Ljava/util/List;Ljava/lang/String;LVm/k;LA0/r;ZZLu0/d;Lu0/d;Lp1/E;LP/n0;LP/m0;ZIIJLE/l;Lm0/l;IIII)V

    move-object/from16 v11, v36

    invoke-static {v11, v8}, LP2/z;->h(Lm0/l;I)V

    invoke-virtual {v1, v10, v2, v6}, LG/W0;->b(LA0/r;FZ)LA0/r;

    move-result-object v22

    invoke-interface {v7}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v20, v1

    check-cast v20, Ljava/lang/String;

    const v1, 0x7f121864

    invoke-static {v11, v1}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v14

    new-instance v15, Lp1/l;

    const/4 v1, 0x3

    invoke-direct {v15, v1}, Lp1/l;-><init>(I)V

    const v1, 0x4e5a883

    invoke-virtual {v11, v1}, Lm0/q;->f0(I)V

    invoke-virtual {v11}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v9, :cond_1c

    new-instance v1, LMe/c;

    const/4 v2, 0x4

    invoke-direct {v1, v7, v2}, LMe/c;-><init>(Lm0/Z;I)V

    invoke-virtual {v11, v1}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_1c
    move-object/from16 v21, v1

    check-cast v21, LVm/k;

    invoke-virtual {v11, v8}, Lm0/q;->q(Z)V

    const/16 v37, 0x6000

    const/16 v38, 0x6

    move-object/from16 v36, v11

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v19, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const-wide/16 v33, 0x0

    const/16 v35, 0x0

    const/16 v39, 0x0

    const v40, 0xfff167

    move-object/from16 v18, v41

    invoke-static/range {v11 .. v40}, LP2/p;->d(Ljava/lang/String;Ljava/lang/String;LVm/a;Ljava/lang/String;Lp1/l;ZLVm/a;LVm/a;Ljava/util/List;Ljava/lang/String;LVm/k;LA0/r;ZZLu0/d;Lu0/d;Lp1/E;LP/n0;LP/m0;ZIIJLE/l;Lm0/l;IIII)V

    move-object/from16 v11, v36

    invoke-virtual {v11, v8}, Lm0/q;->q(Z)V

    move v7, v6

    move-object/from16 v21, v18

    goto/16 :goto_f

    :cond_1d
    move-object/from16 v46, v1

    move-object/from16 v45, v2

    move-object/from16 p4, v10

    move-object v1, v12

    move-object v9, v13

    move-object v10, v15

    move/from16 v44, v16

    move-object/from16 v49, v19

    move-object/from16 v18, v41

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v7, 0x1

    const/4 v8, 0x0

    const v12, -0x682dbc1e

    invoke-virtual {v11, v12}, Lm0/q;->f0(I)V

    invoke-virtual {v1, v10, v2, v7}, LG/W0;->b(LA0/r;FZ)LA0/r;

    move-result-object v22

    invoke-interface {v6}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v20, v1

    check-cast v20, Ljava/lang/String;

    const v1, 0x7f12185f

    invoke-static {v11, v1}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v14

    new-instance v15, Lp1/l;

    const/4 v1, 0x3

    invoke-direct {v15, v1}, Lp1/l;-><init>(I)V

    const v1, 0x4e5e064

    invoke-virtual {v11, v1}, Lm0/q;->f0(I)V

    invoke-virtual {v11}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v9, :cond_1e

    new-instance v1, LMe/c;

    const/4 v2, 0x5

    invoke-direct {v1, v6, v2}, LMe/c;-><init>(Lm0/Z;I)V

    invoke-virtual {v11, v1}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_1e
    move-object/from16 v21, v1

    check-cast v21, LVm/k;

    invoke-virtual {v11, v8}, Lm0/q;->q(Z)V

    const v37, 0x36000

    const/16 v38, 0x6

    move-object/from16 v36, v11

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/16 v16, 0x1

    const/16 v17, 0x0

    const/16 v19, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const-wide/16 v33, 0x0

    const/16 v35, 0x0

    const/16 v39, 0x0

    const v40, 0xfff147

    invoke-static/range {v11 .. v40}, LP2/p;->d(Ljava/lang/String;Ljava/lang/String;LVm/a;Ljava/lang/String;Lp1/l;ZLVm/a;LVm/a;Ljava/util/List;Ljava/lang/String;LVm/k;LA0/r;ZZLu0/d;Lu0/d;Lp1/E;LP/n0;LP/m0;ZIIJLE/l;Lm0/l;IIII)V

    move-object/from16 v21, v18

    move-object/from16 v11, v36

    invoke-virtual {v11, v8}, Lm0/q;->q(Z)V

    :goto_f
    invoke-virtual {v11, v7}, Lm0/q;->q(Z)V

    invoke-static {v11, v8}, LP2/z;->M(Lm0/l;I)V

    const/16 v1, 0xc8

    int-to-float v1, v1

    invoke-static {v10, v1}, Landroidx/compose/foundation/layout/b;->s(LA0/r;F)LA0/r;

    move-result-object v1

    sget-object v2, LA0/d;->a:LA0/i;

    invoke-static {v2, v8}, LG/t;->d(LA0/e;Z)LX0/h0;

    move-result-object v2

    iget-wide v12, v11, Lm0/q;->T:J

    invoke-static {v12, v13}, Ljava/lang/Long;->hashCode(J)I

    move-result v6

    invoke-virtual {v11}, Lm0/q;->m()Lm0/o0;

    move-result-object v10

    invoke-static {v1, v11}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v1

    invoke-virtual {v11}, Lm0/q;->j0()V

    iget-boolean v12, v11, Lm0/q;->S:Z

    if-eqz v12, :cond_1f

    move-object/from16 v12, v49

    invoke-virtual {v11, v12}, Lm0/q;->l(LVm/a;)V

    goto :goto_10

    :cond_1f
    invoke-virtual {v11}, Lm0/q;->t0()V

    :goto_10
    invoke-static {v4, v2, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v3, v10, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v6, v11, v0, v11, v5}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    move-object/from16 v0, v46

    invoke-static {v0, v1, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-interface/range {v43 .. v43}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/eightsleep/data_core/enums/UnitOfMeasurement;->CENTIMETERS:Lcom/eightsleep/data_core/enums/UnitOfMeasurement;

    move-object/from16 v2, v45

    if-ne v2, v1, :cond_20

    move-object/from16 v2, p4

    filled-new-array {v1, v2}, [Lcom/eightsleep/data_core/enums/UnitOfMeasurement;

    move-result-object v1

    invoke-static {v1}, LIm/s;->g0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    :goto_11
    move-object v12, v1

    goto :goto_12

    :cond_20
    move-object/from16 v2, p4

    filled-new-array {v2, v1}, [Lcom/eightsleep/data_core/enums/UnitOfMeasurement;

    move-result-object v1

    invoke-static {v1}, LIm/s;->g0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    goto :goto_11

    :goto_12
    sget-object v13, LNe/h;->b:LNe/h;

    const v1, 0x4e64ed3

    invoke-virtual {v11, v1}, Lm0/q;->f0(I)V

    invoke-virtual {v11}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v9, :cond_21

    new-instance v1, LCg/D;

    const/4 v2, 0x6

    move-object/from16 v9, v43

    invoke-direct {v1, v9, v2}, LCg/D;-><init>(Lm0/Z;I)V

    invoke-virtual {v11, v1}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_21
    move-object v15, v1

    check-cast v15, LVm/n;

    invoke-virtual {v11, v8}, Lm0/q;->q(Z)V

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/4 v14, 0x0

    const v19, 0x36000

    const/16 v20, 0x48

    move-object/from16 v18, v11

    move-object v11, v0

    invoke-static/range {v11 .. v20}, LLg/l;->a(Ljava/lang/Object;Ljava/util/List;LVm/o;LVm/o;LVm/n;ZLu0/d;Lm0/l;II)V

    move-object/from16 v11, v18

    invoke-virtual {v11, v7}, Lm0/q;->q(Z)V

    and-int/lit8 v0, v44, 0xe

    move-object/from16 v1, p0

    invoke-static {v1, v11, v0}, LP2/z;->I(LG/C;Lm0/l;I)V

    sget-object v0, LOg/e;->b:LOg/e;

    const v2, 0x7f12036c

    invoke-static {v11, v2}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v13

    sget-object v2, Lcom/eightsleep/presentation_autopilot/enums/AutopilotLoadingKey;->SAVE:Lcom/eightsleep/presentation_autopilot/enums/AutopilotLoadingKey;

    move-object/from16 v4, p3

    if-ne v4, v2, :cond_22

    move/from16 v18, v7

    goto :goto_13

    :cond_22
    move/from16 v18, v8

    :goto_13
    const/16 v20, 0x0

    const/16 v23, 0x0

    const/4 v12, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v19, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x33d

    move-object/from16 v22, v11

    move/from16 v17, v42

    move-object v11, v0

    invoke-virtual/range {v11 .. v25}, LOg/e;->g(LA0/r;Ljava/lang/String;Ljava/lang/Integer;Lhh/n;Lhh/d;ZZLhh/e;LJg/b;LVm/a;Lm0/l;III)V

    move-object/from16 v36, v22

    :goto_14
    invoke-virtual/range {v36 .. v36}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_23

    new-instance v0, LNe/g;

    const/4 v6, 0x0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v5, p5

    invoke-direct/range {v0 .. v6}, LNe/g;-><init>(LG/C;LLe/d;LVm/k;Lc8/e;II)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_23
    return-void
.end method

.method public static final h(LFf/S0;Lc8/e;LVm/k;LVm/a;Lm0/l;I)V
    .locals 20

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move/from16 v0, p5

    const-string v5, "returnFromAway"

    invoke-static {v1, v5}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "onBringPartnerClick"

    invoke-static {v3, v5}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "onDismissed"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v12, p4

    check-cast v12, Lm0/q;

    const v5, -0x32760c31

    invoke-virtual {v12, v5}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v5, v0, 0x6

    if-nez v5, :cond_1

    invoke-virtual {v12, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

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
    and-int/lit8 v6, v0, 0x30

    if-nez v6, :cond_3

    invoke-virtual {v12, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    const/16 v6, 0x20

    goto :goto_2

    :cond_2
    const/16 v6, 0x10

    :goto_2
    or-int/2addr v5, v6

    :cond_3
    and-int/lit16 v6, v0, 0x180

    const/16 v7, 0x100

    if-nez v6, :cond_5

    invoke-virtual {v12, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    move v6, v7

    goto :goto_3

    :cond_4
    const/16 v6, 0x80

    :goto_3
    or-int/2addr v5, v6

    :cond_5
    and-int/lit16 v6, v0, 0xc00

    if-nez v6, :cond_7

    invoke-virtual {v12, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    const/16 v6, 0x800

    goto :goto_4

    :cond_6
    const/16 v6, 0x400

    :goto_4
    or-int/2addr v5, v6

    :cond_7
    and-int/lit16 v6, v5, 0x493

    const/16 v8, 0x492

    if-ne v6, v8, :cond_9

    invoke-virtual {v12}, Lm0/q;->H()Z

    move-result v6

    if-nez v6, :cond_8

    goto :goto_5

    :cond_8
    invoke-virtual {v12}, Lm0/q;->Y()V

    goto/16 :goto_9

    :cond_9
    :goto_5
    sget-object v6, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->b:Lm0/c1;

    invoke-virtual {v12, v6}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/Context;

    iget-object v8, v1, LFf/S0;->c:LYa/H;

    invoke-virtual {v8, v6}, LYa/H;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    const v8, 0x7f1214cd

    invoke-static {v12, v8}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v8

    const v9, 0x7f120377

    invoke-static {v12, v9}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v14

    const v9, 0x7f1203b0

    invoke-static {v12, v9}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v15

    const/4 v9, 0x0

    const/4 v10, 0x1

    if-eqz v2, :cond_a

    sget-object v11, Lcom/eightsleep/presentation_home/enums/DynamicHomeLoadingKey;->RETURN_FROM_AWAY:Lcom/eightsleep/presentation_home/enums/DynamicHomeLoadingKey;

    invoke-interface {v2, v11}, Lc8/e;->matches(Lc8/e;)Z

    move-result v11

    if-ne v11, v10, :cond_a

    move/from16 v16, v10

    goto :goto_6

    :cond_a
    move/from16 v16, v9

    :goto_6
    const v11, 0x7f45d75c

    invoke-virtual {v12, v11}, Lm0/q;->f0(I)V

    and-int/lit16 v11, v5, 0x380

    if-ne v11, v7, :cond_b

    move v13, v10

    goto :goto_7

    :cond_b
    move v13, v9

    :goto_7
    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v10

    sget-object v7, Lm0/k;->a:Lm0/e;

    if-nez v13, :cond_c

    if-ne v10, v7, :cond_d

    :cond_c
    new-instance v10, LVe/f;

    const/16 v13, 0x13

    invoke-direct {v10, v13, v3}, LVe/f;-><init>(ILVm/k;)V

    invoke-virtual {v12, v10}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_d
    check-cast v10, LVm/a;

    invoke-virtual {v12, v9}, Lm0/q;->q(Z)V

    const v13, 0x7f45df1d

    invoke-virtual {v12, v13}, Lm0/q;->f0(I)V

    const/16 v13, 0x100

    if-ne v11, v13, :cond_e

    const/4 v11, 0x1

    goto :goto_8

    :cond_e
    move v11, v9

    :goto_8
    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v13

    if-nez v11, :cond_f

    if-ne v13, v7, :cond_10

    :cond_f
    new-instance v13, LVe/f;

    const/16 v7, 0x14

    invoke-direct {v13, v7, v3}, LVe/f;-><init>(ILVm/k;)V

    invoke-virtual {v12, v13}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_10
    move-object/from16 v18, v13

    check-cast v18, LVm/a;

    invoke-virtual {v12, v9}, Lm0/q;->q(Z)V

    new-instance v11, LXg/e;

    const/16 v19, 0x8

    move-object/from16 v17, v10

    move-object v13, v11

    invoke-direct/range {v13 .. v19}, LXg/e;-><init>(Ljava/lang/String;Ljava/lang/String;ZLVm/a;LVm/a;I)V

    shr-int/lit8 v5, v5, 0x6

    and-int/lit8 v5, v5, 0x70

    const/high16 v7, 0x180000

    or-int v13, v5, v7

    const/4 v9, 0x0

    const/4 v10, 0x1

    iget-boolean v4, v1, LFf/S0;->b:Z

    move-object v7, v8

    const/4 v8, 0x0

    const/16 v14, 0x30

    move-object/from16 v5, p3

    invoke-static/range {v4 .. v14}, LP2/H;->i(ZLVm/a;Ljava/lang/String;Ljava/lang/String;ZZZLXg/f;Lm0/l;II)V

    :goto_9
    invoke-virtual {v12}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_11

    new-instance v0, LSf/L;

    move-object/from16 v4, p3

    move/from16 v5, p5

    invoke-direct/range {v0 .. v5}, LSf/L;-><init>(LFf/S0;Lc8/e;LVm/k;LVm/a;I)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_11
    return-void
.end method

.method public static final i(Lu9/e;Lze/k;LVm/k;Lm0/l;I)V
    .locals 24

    move-object/from16 v3, p0

    move-object/from16 v2, p1

    move-object/from16 v1, p2

    move/from16 v7, p4

    const-string v0, "model"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onUiAction"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v14, p3

    check-cast v14, Lm0/q;

    const v0, -0x9eca8aa

    invoke-virtual {v14, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, v7, 0x6

    if-nez v0, :cond_1

    invoke-virtual {v14, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

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
    and-int/lit8 v4, v7, 0x30

    if-nez v4, :cond_3

    invoke-virtual {v14, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    const/16 v4, 0x20

    goto :goto_2

    :cond_2
    const/16 v4, 0x10

    :goto_2
    or-int/2addr v0, v4

    :cond_3
    and-int/lit16 v4, v7, 0x180

    const/16 v9, 0x100

    if-nez v4, :cond_5

    invoke-virtual {v14, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    move v4, v9

    goto :goto_3

    :cond_4
    const/16 v4, 0x80

    :goto_3
    or-int/2addr v0, v4

    :cond_5
    and-int/lit16 v4, v0, 0x93

    const/16 v5, 0x92

    if-ne v4, v5, :cond_7

    invoke-virtual {v14}, Lm0/q;->H()Z

    move-result v4

    if-nez v4, :cond_6

    goto :goto_4

    :cond_6
    invoke-virtual {v14}, Lm0/q;->Y()V

    goto/16 :goto_10

    :cond_7
    :goto_4
    sget-object v4, La1/k0;->l:Lm0/c1;

    invoke-virtual {v14, v4}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, LO0/a;

    sget-object v5, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->b:Lm0/c1;

    invoke-virtual {v14, v5}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/Context;

    iget-object v6, v3, Lu9/e;->a:Ljava/lang/String;

    invoke-virtual {v2, v6}, Lze/k;->A(Ljava/lang/String;)Lcom/eightsleep/data_audio/enums/AudioPlayerStatus;

    move-result-object v10

    sget-object v6, LA0/o;->a:LA0/o;

    const/high16 v11, 0x3f800000    # 1.0f

    invoke-static {v6, v11}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v6

    sget-object v11, LG/l;->e:LG/g;

    sget-object v12, LA0/d;->k:LA0/h;

    const/16 v13, 0x36

    invoke-static {v11, v12, v14, v13}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v11

    iget-wide v12, v14, Lm0/q;->T:J

    invoke-static {v12, v13}, Ljava/lang/Long;->hashCode(J)I

    move-result v12

    invoke-virtual {v14}, Lm0/q;->m()Lm0/o0;

    move-result-object v13

    invoke-static {v6, v14}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v6

    sget-object v15, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v15, LZ0/g;->b:LZ0/f;

    invoke-virtual {v14}, Lm0/q;->j0()V

    iget-boolean v8, v14, Lm0/q;->S:Z

    if-eqz v8, :cond_8

    invoke-virtual {v14, v15}, Lm0/q;->l(LVm/a;)V

    goto :goto_5

    :cond_8
    invoke-virtual {v14}, Lm0/q;->t0()V

    :goto_5
    sget-object v8, LZ0/g;->f:LZ0/e;

    invoke-static {v8, v11, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v8, LZ0/g;->e:LZ0/e;

    invoke-static {v8, v13, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    sget-object v11, LZ0/g;->g:LZ0/e;

    invoke-static {v14, v8, v11}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v8, LZ0/g;->h:LZ0/d;

    invoke-static {v14, v8}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v8, LZ0/g;->d:LZ0/e;

    invoke-static {v8, v6, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const v6, 0x50572644

    invoke-virtual {v14, v6}, Lm0/q;->f0(I)V

    invoke-virtual {v14, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    and-int/lit16 v8, v0, 0x380

    const/4 v11, 0x1

    const/4 v12, 0x0

    if-ne v8, v9, :cond_9

    move v0, v11

    goto :goto_6

    :cond_9
    move v0, v12

    :goto_6
    or-int/2addr v0, v6

    invoke-virtual {v14, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    or-int/2addr v0, v6

    invoke-virtual {v14, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    or-int/2addr v0, v6

    invoke-virtual {v14, v5}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    or-int/2addr v0, v6

    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v6

    sget-object v13, Lm0/k;->a:Lm0/e;

    if-nez v0, :cond_b

    if-ne v6, v13, :cond_a

    goto :goto_7

    :cond_a
    move-object v1, v4

    goto :goto_8

    :cond_b
    :goto_7
    new-instance v0, LAe/P;

    const/4 v6, 0x0

    move-object/from16 v23, v2

    move-object v2, v1

    move-object v1, v4

    move-object/from16 v4, v23

    invoke-direct/range {v0 .. v6}, LAe/P;-><init>(LO0/a;LVm/k;Lu9/e;Lze/k;Landroid/content/Context;I)V

    move-object v2, v4

    invoke-virtual {v14, v0}, Lm0/q;->q0(Ljava/lang/Object;)V

    move-object v6, v0

    :goto_8
    check-cast v6, LVm/a;

    invoke-virtual {v14, v12}, Lm0/q;->q(Z)V

    move-object v0, v13

    sget-object v13, LAe/o0;->c:Lu0/d;

    move v4, v11

    const/4 v11, 0x0

    move v15, v12

    const/4 v12, 0x0

    move/from16 v16, v9

    const/4 v9, 0x0

    move-object/from16 v17, v10

    const/4 v10, 0x0

    move/from16 v18, v15

    const/high16 v15, 0x180000

    move/from16 v19, v16

    const/16 v16, 0x3e

    move-object/from16 v21, v0

    move/from16 v20, v8

    move-object/from16 v4, v17

    const/16 v0, 0x20

    move-object v8, v6

    move/from16 v6, v18

    invoke-static/range {v8 .. v16}, Lj0/X1;->f(LVm/a;LA0/r;ZLj0/G0;LH0/X;LVm/n;Lm0/l;II)V

    invoke-static {v14, v6}, LP2/z;->j(Lm0/l;I)V

    const/16 v8, 0x48

    int-to-float v9, v8

    int-to-float v10, v0

    invoke-static {v14}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v0

    iget-object v0, v0, Lhh/h;->d:Lhh/g;

    iget-wide v11, v0, Lhh/g;->e:J

    const v0, 0x5057ab00

    invoke-static {v11, v12, v14, v0}, Lj/m;->c(JLm0/q;I)LH0/w;

    move-result-object v12

    move/from16 v8, v20

    const/16 v0, 0x100

    if-ne v8, v0, :cond_c

    const/4 v11, 0x1

    goto :goto_9

    :cond_c
    move v11, v6

    :goto_9
    invoke-virtual {v14, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v13

    or-int/2addr v11, v13

    invoke-virtual {v14, v4}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v13

    or-int/2addr v11, v13

    invoke-virtual {v14, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v13

    or-int/2addr v11, v13

    invoke-virtual {v14, v5}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v13

    or-int/2addr v11, v13

    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v13

    if-nez v11, :cond_e

    move-object/from16 v11, v21

    if-ne v13, v11, :cond_d

    :goto_a
    move/from16 v19, v0

    goto :goto_b

    :cond_d
    move/from16 v19, v0

    move-object/from16 p3, v1

    move-object/from16 v17, v4

    move-object v0, v13

    const/4 v15, 0x1

    move v13, v6

    goto :goto_c

    :cond_e
    move-object/from16 v11, v21

    goto :goto_a

    :goto_b
    new-instance v0, LAe/K;

    move v15, v6

    const/4 v6, 0x1

    move-object/from16 p3, v4

    move-object v4, v3

    move-object/from16 v3, p3

    move-object/from16 p3, v1

    move v13, v15

    const/4 v15, 0x1

    move-object/from16 v1, p2

    invoke-direct/range {v0 .. v6}, LAe/K;-><init>(LVm/k;Lze/k;Lcom/eightsleep/data_audio/enums/AudioPlayerStatus;Lu9/e;Landroid/content/Context;I)V

    move-object/from16 v17, v3

    move-object v3, v4

    invoke-virtual {v14, v0}, Lm0/q;->q0(Ljava/lang/Object;)V

    :goto_c
    check-cast v0, LVm/a;

    invoke-virtual {v14, v13}, Lm0/q;->q(Z)V

    move-object/from16 v4, v17

    const/16 v17, 0x20

    move/from16 v18, v13

    const/4 v13, 0x0

    const/16 v16, 0xdb0

    move-object/from16 v21, v11

    move v11, v10

    move v1, v8

    move-object v8, v4

    move v4, v1

    move-object/from16 v1, p3

    move-object v15, v14

    move/from16 v6, v18

    move-object/from16 v22, v21

    move-object v14, v0

    move/from16 v0, v19

    invoke-static/range {v8 .. v17}, Lcj/l0;->a(Lcom/eightsleep/data_audio/enums/AudioPlayerStatus;FFFLH0/w;LA0/o;LVm/a;Lm0/l;II)V

    move-object v14, v15

    invoke-static {v14, v6}, LP2/z;->j(Lm0/l;I)V

    const v8, 0x5057eb60

    invoke-virtual {v14, v8}, Lm0/q;->f0(I)V

    invoke-virtual {v14, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v8

    if-ne v4, v0, :cond_f

    const/4 v11, 0x1

    goto :goto_d

    :cond_f
    move v11, v6

    :goto_d
    or-int v0, v8, v11

    invoke-virtual {v14, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    or-int/2addr v0, v4

    invoke-virtual {v14, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    or-int/2addr v0, v4

    invoke-virtual {v14, v5}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    or-int/2addr v0, v4

    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v4

    if-nez v0, :cond_11

    move-object/from16 v11, v22

    if-ne v4, v11, :cond_10

    goto :goto_e

    :cond_10
    move v13, v6

    const/4 v15, 0x1

    goto :goto_f

    :cond_11
    :goto_e
    new-instance v0, LAe/P;

    move v15, v6

    const/4 v6, 0x1

    move-object v4, v2

    move v13, v15

    const/4 v15, 0x1

    move-object/from16 v2, p2

    invoke-direct/range {v0 .. v6}, LAe/P;-><init>(LO0/a;LVm/k;Lu9/e;Lze/k;Landroid/content/Context;I)V

    invoke-virtual {v14, v0}, Lm0/q;->q0(Ljava/lang/Object;)V

    move-object v4, v0

    :goto_f
    move-object v8, v4

    check-cast v8, LVm/a;

    invoke-virtual {v14, v13}, Lm0/q;->q(Z)V

    sget-object v13, LAe/o0;->d:Lu0/d;

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move v4, v15

    const/high16 v15, 0x180000

    const/16 v16, 0x3e

    invoke-static/range {v8 .. v16}, Lj0/X1;->f(LVm/a;LA0/r;ZLj0/G0;LH0/X;LVm/n;Lm0/l;II)V

    invoke-virtual {v14, v4}, Lm0/q;->q(Z)V

    :goto_10
    invoke-virtual {v14}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_12

    new-instance v0, LAe/N;

    const/4 v5, 0x3

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move v4, v7

    invoke-direct/range {v0 .. v5}, LAe/N;-><init>(Lu9/e;Lze/k;LVm/k;II)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_12
    return-void
.end method

.method public static final j(LDf/z0;LVm/k;LVm/k;LVm/k;LVm/a;LVm/k;Lm0/l;I)V
    .locals 17

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    const-string v0, "onCreateTag"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onSelectTag"

    invoke-static {v3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onSaveTag"

    invoke-static {v4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onCancelEdit"

    invoke-static {v5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onDeleteTag"

    invoke-static {v6, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v14, p6

    check-cast v14, Lm0/q;

    const v0, 0x6e434302

    invoke-virtual {v14, v0}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v14, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int v0, p7, v0

    invoke-virtual {v14, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    const/16 v7, 0x20

    goto :goto_1

    :cond_1
    const/16 v7, 0x10

    :goto_1
    or-int/2addr v0, v7

    invoke-virtual {v14, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    const/16 v7, 0x100

    goto :goto_2

    :cond_2
    const/16 v7, 0x80

    :goto_2
    or-int/2addr v0, v7

    invoke-virtual {v14, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    const/16 v7, 0x800

    goto :goto_3

    :cond_3
    const/16 v7, 0x400

    :goto_3
    or-int/2addr v0, v7

    invoke-virtual {v14, v5}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    const/16 v7, 0x4000

    goto :goto_4

    :cond_4
    const/16 v7, 0x2000

    :goto_4
    or-int/2addr v0, v7

    invoke-virtual {v14, v6}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    const/high16 v7, 0x20000

    goto :goto_5

    :cond_5
    const/high16 v7, 0x10000

    :goto_5
    or-int/2addr v0, v7

    const v7, 0x12493

    and-int/2addr v7, v0

    const v8, 0x12492

    if-ne v7, v8, :cond_7

    invoke-virtual {v14}, Lm0/q;->H()Z

    move-result v7

    if-nez v7, :cond_6

    goto :goto_6

    :cond_6
    invoke-virtual {v14}, Lm0/q;->Y()V

    goto/16 :goto_8

    :cond_7
    :goto_6
    sget-object v7, LA0/o;->a:LA0/o;

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-static {v7, v8}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v7

    sget-object v8, LG/l;->c:LG/f;

    sget-object v9, LA0/d;->m:LA0/g;

    const/4 v10, 0x0

    invoke-static {v8, v9, v14, v10}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v8

    iget-wide v9, v14, Lm0/q;->T:J

    invoke-static {v9, v10}, Ljava/lang/Long;->hashCode(J)I

    move-result v9

    invoke-virtual {v14}, Lm0/q;->m()Lm0/o0;

    move-result-object v10

    invoke-static {v7, v14}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v7

    sget-object v11, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v11, LZ0/g;->b:LZ0/f;

    invoke-virtual {v14}, Lm0/q;->j0()V

    iget-boolean v12, v14, Lm0/q;->S:Z

    if-eqz v12, :cond_8

    invoke-virtual {v14, v11}, Lm0/q;->l(LVm/a;)V

    goto :goto_7

    :cond_8
    invoke-virtual {v14}, Lm0/q;->t0()V

    :goto_7
    sget-object v11, LZ0/g;->f:LZ0/e;

    invoke-static {v11, v8, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v8, LZ0/g;->e:LZ0/e;

    invoke-static {v8, v10, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    sget-object v9, LZ0/g;->g:LZ0/e;

    invoke-static {v14, v8, v9}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v8, LZ0/g;->h:LZ0/d;

    invoke-static {v14, v8}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v8, LZ0/g;->d:LZ0/e;

    invoke-static {v8, v7, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v7, LG/D;->a:LG/D;

    new-instance v8, LSf/r;

    const/4 v9, 0x0

    invoke-direct {v8, v1, v2, v3, v9}, LSf/r;-><init>(LDf/z0;LVm/k;LVm/k;I)V

    const v9, -0x438691b0

    invoke-static {v9, v8, v14}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v13

    iget-boolean v8, v1, LDf/z0;->b:Z

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const v15, 0x180006

    const/16 v16, 0x1e

    invoke-static/range {v7 .. v16}, Lv/d;->b(LG/C;ZLA0/r;Lv/c0;Lv/d0;Ljava/lang/String;Lu0/d;Lm0/l;II)V

    new-instance v8, LSf/r;

    const/4 v9, 0x1

    invoke-direct {v8, v1, v2, v3, v9}, LSf/r;-><init>(LDf/z0;LVm/k;LVm/k;I)V

    const v9, 0x6360c407

    invoke-static {v9, v8, v14}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v13

    const/4 v11, 0x0

    const/4 v12, 0x0

    iget-boolean v8, v1, LDf/z0;->a:Z

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/16 v16, 0x1e

    invoke-static/range {v7 .. v16}, Lv/d;->b(LG/C;ZLA0/r;Lv/c0;Lv/d0;Ljava/lang/String;Lu0/d;Lm0/l;II)V

    const/4 v7, 0x1

    invoke-virtual {v14, v7}, Lm0/q;->q(Z)V

    iget-object v4, v1, LDf/z0;->c:Lyd/r;

    if-eqz v4, :cond_9

    shr-int/lit8 v0, v0, 0x6

    and-int/lit16 v9, v0, 0x1ff0

    move-object v7, v6

    move-object v8, v14

    move-object v6, v5

    move-object/from16 v5, p3

    invoke-static/range {v4 .. v9}, LP2/r;->l(Lyd/r;LVm/k;LVm/a;LVm/k;Lm0/l;I)V

    :cond_9
    :goto_8
    invoke-virtual {v14}, Lm0/q;->u()Lm0/t0;

    move-result-object v8

    if-eqz v8, :cond_a

    new-instance v0, LAe/d0;

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move/from16 v7, p7

    invoke-direct/range {v0 .. v7}, LAe/d0;-><init>(LDf/z0;LVm/k;LVm/k;LVm/k;LVm/a;LVm/k;I)V

    iput-object v0, v8, Lm0/t0;->d:LVm/n;

    :cond_a
    return-void
.end method

.method public static final k(LHm/q;LVm/k;LVm/a;Lm0/l;I)V
    .locals 48

    move-object/from16 v4, p0

    move-object/from16 v3, p1

    move-object/from16 v12, p2

    const/4 v0, 0x1

    const/4 v1, 0x0

    const-string v2, "value"

    invoke-static {v4, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "onValueChanged"

    invoke-static {v3, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "onDone"

    invoke-static {v12, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v2, p3

    check-cast v2, Lm0/q;

    const v5, 0x18dcf8e4

    invoke-virtual {v2, v5}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v2, v4}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x4

    goto :goto_0

    :cond_0
    const/4 v5, 0x2

    :goto_0
    or-int v5, p4, v5

    and-int/lit8 v7, p4, 0x30

    if-nez v7, :cond_2

    invoke-virtual {v2, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    const/16 v7, 0x20

    goto :goto_1

    :cond_1
    const/16 v7, 0x10

    :goto_1
    or-int/2addr v5, v7

    :cond_2
    invoke-virtual {v2, v12}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    const/16 v7, 0x100

    goto :goto_2

    :cond_3
    const/16 v7, 0x80

    :goto_2
    or-int/2addr v5, v7

    and-int/lit16 v7, v5, 0x93

    const/16 v9, 0x92

    if-ne v7, v9, :cond_5

    invoke-virtual {v2}, Lm0/q;->H()Z

    move-result v7

    if-nez v7, :cond_4

    goto :goto_3

    :cond_4
    invoke-virtual {v2}, Lm0/q;->Y()V

    move-object v13, v2

    goto/16 :goto_16

    :cond_5
    :goto_3
    sget-object v7, La1/k0;->i:Lm0/c1;

    invoke-virtual {v2, v7}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, LF0/l;

    sget-object v9, LG/l;->a:LG/d;

    invoke-static {v2}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v9

    iget v9, v9, Lhh/i;->c:F

    invoke-static {v9}, LG/l;->g(F)LG/j;

    move-result-object v9

    sget-object v10, LA0/o;->a:LA0/o;

    sget-object v11, LA0/d;->j:LA0/h;

    invoke-static {v9, v11, v2, v1}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v9

    iget-wide v13, v2, Lm0/q;->T:J

    invoke-static {v13, v14}, Ljava/lang/Long;->hashCode(J)I

    move-result v11

    invoke-virtual {v2}, Lm0/q;->m()Lm0/o0;

    move-result-object v13

    invoke-static {v10, v2}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v14

    sget-object v15, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v15, LZ0/g;->b:LZ0/f;

    invoke-virtual {v2}, Lm0/q;->j0()V

    iget-boolean v6, v2, Lm0/q;->S:Z

    if-eqz v6, :cond_6

    invoke-virtual {v2, v15}, Lm0/q;->l(LVm/a;)V

    goto :goto_4

    :cond_6
    invoke-virtual {v2}, Lm0/q;->t0()V

    :goto_4
    sget-object v6, LZ0/g;->f:LZ0/e;

    invoke-static {v6, v9, v2}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v9, LZ0/g;->e:LZ0/e;

    invoke-static {v9, v13, v2}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    sget-object v13, LZ0/g;->g:LZ0/e;

    invoke-static {v2, v11, v13}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v11, LZ0/g;->h:LZ0/d;

    invoke-static {v2, v11}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v8, LZ0/g;->d:LZ0/e;

    invoke-static {v8, v14, v2}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v14, LG/W0;->a:LG/W0;

    const/high16 v1, 0x3f800000    # 1.0f

    move/from16 v43, v5

    invoke-virtual {v14, v10, v1, v0}, LG/W0;->b(LA0/r;FZ)LA0/r;

    move-result-object v5

    sget-object v1, LG/l;->c:LG/f;

    sget-object v0, LA0/d;->m:LA0/g;

    move-object/from16 v16, v14

    const/4 v12, 0x0

    invoke-static {v1, v0, v2, v12}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v14

    move-object/from16 v45, v0

    move-object v12, v1

    iget-wide v0, v2, Lm0/q;->T:J

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result v0

    invoke-virtual {v2}, Lm0/q;->m()Lm0/o0;

    move-result-object v1

    invoke-static {v5, v2}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v5

    invoke-virtual {v2}, Lm0/q;->j0()V

    move-object/from16 v46, v12

    iget-boolean v12, v2, Lm0/q;->S:Z

    if-eqz v12, :cond_7

    invoke-virtual {v2, v15}, Lm0/q;->l(LVm/a;)V

    goto :goto_5

    :cond_7
    invoke-virtual {v2}, Lm0/q;->t0()V

    :goto_5
    invoke-static {v6, v14, v2}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v9, v1, v2}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v0, v2, v13, v2, v11}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    invoke-static {v8, v5, v2}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    iget-object v0, v4, LHm/q;->a:Ljava/lang/Object;

    move-object/from16 v22, v0

    check-cast v22, Ljava/lang/String;

    const v0, 0x7f121527

    invoke-static {v2, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lp1/l;

    const/4 v5, 0x3

    invoke-direct {v1, v5}, Lp1/l;-><init>(I)V

    const v12, -0x1b70ce6c

    invoke-virtual {v2, v12}, Lm0/q;->f0(I)V

    and-int/lit8 v12, v43, 0x70

    const/16 v14, 0x20

    if-ne v12, v14, :cond_8

    const/4 v14, 0x1

    goto :goto_6

    :cond_8
    const/4 v14, 0x0

    :goto_6
    and-int/lit8 v5, v43, 0xe

    move-object/from16 v17, v0

    const/4 v0, 0x4

    if-ne v5, v0, :cond_9

    const/4 v0, 0x1

    goto :goto_7

    :cond_9
    const/4 v0, 0x0

    :goto_7
    or-int/2addr v0, v14

    invoke-virtual {v2, v7}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v14

    or-int/2addr v0, v14

    invoke-virtual {v2}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v14

    move-object/from16 v18, v13

    sget-object v13, Lm0/k;->a:Lm0/e;

    if-nez v0, :cond_b

    if-ne v14, v13, :cond_a

    goto :goto_8

    :cond_a
    const/4 v0, 0x0

    goto :goto_9

    :cond_b
    :goto_8
    new-instance v14, Lg8/K;

    const/4 v0, 0x0

    invoke-direct {v14, v7, v3, v4, v0}, Lg8/K;-><init>(LF0/l;LVm/k;LHm/q;I)V

    invoke-virtual {v2, v14}, Lm0/q;->q0(Ljava/lang/Object;)V

    :goto_9
    move-object/from16 v23, v14

    check-cast v23, LVm/k;

    invoke-virtual {v2, v0}, Lm0/q;->q(Z)V

    const v39, 0x36000

    const/16 v40, 0x0

    move-object v0, v13

    const/4 v13, 0x0

    const/4 v14, 0x0

    move-object/from16 v19, v15

    const/4 v15, 0x0

    move-object/from16 v20, v18

    const/16 v18, 0x1

    move-object/from16 v21, v19

    const/16 v19, 0x0

    move-object/from16 v24, v20

    const/16 v20, 0x0

    move-object/from16 v25, v21

    const/16 v21, 0x0

    move-object/from16 v26, v24

    const/16 v24, 0x0

    move-object/from16 v27, v25

    const/16 v25, 0x0

    move-object/from16 v28, v26

    const/16 v26, 0x0

    move-object/from16 v29, v27

    const/16 v27, 0x0

    move-object/from16 v30, v28

    const/16 v28, 0x0

    move-object/from16 v31, v29

    const/16 v29, 0x0

    move-object/from16 v32, v30

    const/16 v30, 0x0

    move-object/from16 v33, v31

    const/16 v31, 0x0

    move-object/from16 v34, v32

    const/16 v32, 0x0

    move-object/from16 v35, v33

    const/16 v33, 0x0

    move-object/from16 v36, v34

    const/16 v34, 0x0

    move-object/from16 v37, v35

    move-object/from16 v38, v36

    const-wide/16 v35, 0x0

    move-object/from16 v41, v37

    const/16 v37, 0x0

    move-object/from16 v42, v41

    const/16 v41, 0x0

    move-object/from16 v47, v42

    const v42, 0xfff9c7

    move-object/from16 v3, v17

    move-object/from16 v17, v1

    move-object/from16 v1, v38

    move-object/from16 v38, v2

    move-object/from16 v2, v16

    move-object/from16 v16, v3

    move-object v3, v0

    move-object/from16 v0, v47

    invoke-static/range {v13 .. v42}, LP2/p;->d(Ljava/lang/String;Ljava/lang/String;LVm/a;Ljava/lang/String;Lp1/l;ZLVm/a;LVm/a;Ljava/util/List;Ljava/lang/String;LVm/k;LA0/r;ZZLu0/d;Lu0/d;Lp1/E;LP/n0;LP/m0;ZIIJLE/l;Lm0/l;IIII)V

    move-object/from16 v13, v38

    const/4 v14, 0x1

    invoke-virtual {v13, v14}, Lm0/q;->q(Z)V

    const/high16 v15, 0x3f800000    # 1.0f

    invoke-virtual {v2, v10, v15, v14}, LG/W0;->b(LA0/r;FZ)LA0/r;

    move-result-object v15

    move-object/from16 v44, v2

    move-object/from16 v2, v45

    move-object/from16 v14, v46

    move-object/from16 v46, v3

    move-object/from16 v45, v10

    const/4 v10, 0x0

    invoke-static {v14, v2, v13, v10}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v3

    move v10, v5

    iget-wide v4, v13, Lm0/q;->T:J

    invoke-static {v4, v5}, Ljava/lang/Long;->hashCode(J)I

    move-result v4

    invoke-virtual {v13}, Lm0/q;->m()Lm0/o0;

    move-result-object v5

    invoke-static {v15, v13}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v15

    invoke-virtual {v13}, Lm0/q;->j0()V

    move/from16 v16, v10

    iget-boolean v10, v13, Lm0/q;->S:Z

    if-eqz v10, :cond_c

    invoke-virtual {v13, v0}, Lm0/q;->l(LVm/a;)V

    goto :goto_a

    :cond_c
    invoke-virtual {v13}, Lm0/q;->t0()V

    :goto_a
    invoke-static {v6, v3, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v9, v5, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v4, v13, v1, v13, v11}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    invoke-static {v8, v15, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object/from16 v4, p0

    iget-object v3, v4, LHm/q;->b:Ljava/lang/Object;

    move-object/from16 v22, v3

    check-cast v22, Ljava/lang/String;

    const v3, 0x7f121526

    invoke-static {v13, v3}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v3

    new-instance v5, Lp1/l;

    const/4 v10, 0x3

    invoke-direct {v5, v10}, Lp1/l;-><init>(I)V

    const v10, -0x1b708b0c

    invoke-virtual {v13, v10}, Lm0/q;->f0(I)V

    const/16 v10, 0x20

    if-ne v12, v10, :cond_d

    move/from16 v10, v16

    move-object/from16 v16, v14

    move v14, v10

    const/4 v10, 0x1

    :goto_b
    const/4 v15, 0x4

    goto :goto_c

    :cond_d
    move/from16 v10, v16

    move-object/from16 v16, v14

    move v14, v10

    const/4 v10, 0x0

    goto :goto_b

    :goto_c
    if-ne v14, v15, :cond_e

    const/4 v15, 0x1

    goto :goto_d

    :cond_e
    const/4 v15, 0x0

    :goto_d
    or-int/2addr v10, v15

    invoke-virtual {v13, v7}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v15

    or-int/2addr v10, v15

    invoke-virtual {v13}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v15

    if-nez v10, :cond_10

    move-object/from16 v10, v46

    if-ne v15, v10, :cond_f

    goto :goto_e

    :cond_f
    move-object/from16 v18, v3

    move-object/from16 v17, v5

    move-object/from16 v5, p1

    goto :goto_f

    :cond_10
    move-object/from16 v10, v46

    :goto_e
    new-instance v15, Lg8/K;

    move-object/from16 v18, v3

    move-object/from16 v17, v5

    const/4 v3, 0x1

    move-object/from16 v5, p1

    invoke-direct {v15, v7, v5, v4, v3}, Lg8/K;-><init>(LF0/l;LVm/k;LHm/q;I)V

    invoke-virtual {v13, v15}, Lm0/q;->q0(Ljava/lang/Object;)V

    :goto_f
    move-object/from16 v23, v15

    check-cast v23, LVm/k;

    const/4 v3, 0x0

    invoke-virtual {v13, v3}, Lm0/q;->q(Z)V

    const/16 v39, 0x6000

    const/16 v40, 0x0

    move-object/from16 v38, v13

    const/4 v13, 0x0

    move v3, v14

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v46, v16

    move-object/from16 v16, v18

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v33, 0x0

    const/16 v34, 0x0

    const-wide/16 v35, 0x0

    const/16 v37, 0x0

    const/16 v41, 0x0

    const v42, 0xfff9e7

    move v7, v3

    move-object/from16 v3, v46

    invoke-static/range {v13 .. v42}, LP2/p;->d(Ljava/lang/String;Ljava/lang/String;LVm/a;Ljava/lang/String;Lp1/l;ZLVm/a;LVm/a;Ljava/util/List;Ljava/lang/String;LVm/k;LA0/r;ZZLu0/d;Lu0/d;Lp1/E;LP/n0;LP/m0;ZIIJLE/l;Lm0/l;IIII)V

    move-object/from16 v13, v38

    const/4 v14, 0x1

    invoke-virtual {v13, v14}, Lm0/q;->q(Z)V

    const/high16 v15, 0x3fc00000    # 1.5f

    move-object/from16 v46, v10

    move-object/from16 v10, v44

    move-object/from16 v5, v45

    invoke-virtual {v10, v5, v15, v14}, LG/W0;->b(LA0/r;FZ)LA0/r;

    move-result-object v5

    const/4 v10, 0x0

    invoke-static {v3, v2, v13, v10}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v2

    iget-wide v14, v13, Lm0/q;->T:J

    invoke-static {v14, v15}, Ljava/lang/Long;->hashCode(J)I

    move-result v3

    invoke-virtual {v13}, Lm0/q;->m()Lm0/o0;

    move-result-object v10

    invoke-static {v5, v13}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v5

    invoke-virtual {v13}, Lm0/q;->j0()V

    iget-boolean v14, v13, Lm0/q;->S:Z

    if-eqz v14, :cond_11

    invoke-virtual {v13, v0}, Lm0/q;->l(LVm/a;)V

    goto :goto_10

    :cond_11
    invoke-virtual {v13}, Lm0/q;->t0()V

    :goto_10
    invoke-static {v6, v2, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v9, v10, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v3, v13, v1, v13, v11}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    invoke-static {v8, v5, v13}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    iget-object v0, v4, LHm/q;->c:Ljava/lang/Object;

    move-object v14, v0

    check-cast v14, Ljava/lang/String;

    const v0, 0x7f121528

    invoke-static {v13, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lp1/l;

    const/4 v10, 0x3

    invoke-direct {v9, v10}, Lp1/l;-><init>(I)V

    const v0, -0x1b704c45

    invoke-virtual {v13, v0}, Lm0/q;->f0(I)V

    const/16 v10, 0x20

    if-ne v12, v10, :cond_12

    const/4 v12, 0x1

    :goto_11
    const/4 v15, 0x4

    goto :goto_12

    :cond_12
    const/4 v12, 0x0

    goto :goto_11

    :goto_12
    if-ne v7, v15, :cond_13

    const/4 v0, 0x1

    goto :goto_13

    :cond_13
    const/4 v0, 0x0

    :goto_13
    or-int/2addr v0, v12

    invoke-virtual {v13}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v1

    if-nez v0, :cond_15

    move-object/from16 v0, v46

    if-ne v1, v0, :cond_14

    goto :goto_14

    :cond_14
    move-object/from16 v3, p1

    goto :goto_15

    :cond_15
    :goto_14
    new-instance v1, LWi/h;

    const/16 v0, 0x1a

    move-object/from16 v3, p1

    invoke-direct {v1, v0, v3, v4}, LWi/h;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v13, v1}, Lm0/q;->q0(Ljava/lang/Object;)V

    :goto_15
    move-object v15, v1

    check-cast v15, LVm/k;

    const/4 v10, 0x0

    invoke-virtual {v13, v10}, Lm0/q;->q(Z)V

    shl-int/lit8 v0, v43, 0xf

    const/high16 v1, 0x1c00000

    and-int/2addr v0, v1

    or-int/lit16 v0, v0, 0x6000

    const/16 v29, 0x0

    const/16 v32, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v38, v13

    const/4 v13, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const-wide/16 v27, 0x0

    const/16 v33, 0x0

    const v34, 0xfff967

    move-object/from16 v12, p2

    move/from16 v31, v0

    move-object/from16 v30, v38

    invoke-static/range {v5 .. v34}, LP2/p;->d(Ljava/lang/String;Ljava/lang/String;LVm/a;Ljava/lang/String;Lp1/l;ZLVm/a;LVm/a;Ljava/util/List;Ljava/lang/String;LVm/k;LA0/r;ZZLu0/d;Lu0/d;Lp1/E;LP/n0;LP/m0;ZIIJLE/l;Lm0/l;IIII)V

    move-object/from16 v13, v30

    const/4 v14, 0x1

    invoke-virtual {v13, v14}, Lm0/q;->q(Z)V

    invoke-virtual {v13, v14}, Lm0/q;->q(Z)V

    :goto_16
    invoke-virtual {v13}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_16

    new-instance v0, LP/T0;

    const/16 v2, 0x1a

    move-object/from16 v3, p1

    move-object/from16 v5, p2

    move/from16 v1, p4

    invoke-direct/range {v0 .. v5}, LP/T0;-><init>(IILVm/k;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_16
    return-void
.end method

.method public static final l(Lcom/eightsleep/data_core/enums/base/BaseElevationPreset;ZZLVm/k;LVm/a;Lm0/l;II)V
    .locals 21

    move-object/from16 v1, p0

    move-object/from16 v4, p3

    move-object/from16 v10, p4

    move/from16 v0, p6

    const-string v2, "onPresetClicked"

    invoke-static {v4, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "onStopMovementClick"

    invoke-static {v10, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v11, p5

    check-cast v11, Lm0/q;

    const v2, 0x31f8f158

    invoke-virtual {v11, v2}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v11, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x4

    goto :goto_0

    :cond_0
    const/4 v2, 0x2

    :goto_0
    or-int/2addr v2, v0

    move/from16 v7, p1

    invoke-virtual {v11, v7}, Lm0/q;->h(Z)Z

    move-result v3

    if-eqz v3, :cond_1

    const/16 v3, 0x20

    goto :goto_1

    :cond_1
    const/16 v3, 0x10

    :goto_1
    or-int/2addr v2, v3

    and-int/lit8 v3, p7, 0x4

    if-eqz v3, :cond_3

    or-int/lit16 v2, v2, 0x180

    :cond_2
    move/from16 v5, p2

    goto :goto_3

    :cond_3
    and-int/lit16 v5, v0, 0x180

    if-nez v5, :cond_2

    move/from16 v5, p2

    invoke-virtual {v11, v5}, Lm0/q;->h(Z)Z

    move-result v6

    if-eqz v6, :cond_4

    const/16 v6, 0x100

    goto :goto_2

    :cond_4
    const/16 v6, 0x80

    :goto_2
    or-int/2addr v2, v6

    :goto_3
    and-int/lit16 v6, v0, 0xc00

    if-nez v6, :cond_6

    invoke-virtual {v11, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    const/16 v6, 0x800

    goto :goto_4

    :cond_5
    const/16 v6, 0x400

    :goto_4
    or-int/2addr v2, v6

    :cond_6
    and-int/lit16 v6, v0, 0x6000

    if-nez v6, :cond_8

    invoke-virtual {v11, v10}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    const/16 v6, 0x4000

    goto :goto_5

    :cond_7
    const/16 v6, 0x2000

    :goto_5
    or-int/2addr v2, v6

    :cond_8
    and-int/lit16 v6, v2, 0x2493

    const/16 v8, 0x2492

    if-ne v6, v8, :cond_a

    invoke-virtual {v11}, Lm0/q;->H()Z

    move-result v6

    if-nez v6, :cond_9

    goto :goto_6

    :cond_9
    invoke-virtual {v11}, Lm0/q;->Y()V

    move v3, v5

    goto/16 :goto_10

    :cond_a
    :goto_6
    if-eqz v3, :cond_b

    const/4 v3, 0x0

    goto :goto_7

    :cond_b
    move v3, v5

    :goto_7
    sget-object v5, LA0/o;->a:LA0/o;

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-static {v5, v6}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v6

    sget-object v8, LG/l;->f:LG/g;

    sget-object v9, LA0/d;->j:LA0/h;

    const/16 v12, 0x36

    invoke-static {v8, v9, v11, v12}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v8

    iget-wide v12, v11, Lm0/q;->T:J

    invoke-static {v12, v13}, Ljava/lang/Long;->hashCode(J)I

    move-result v9

    invoke-virtual {v11}, Lm0/q;->m()Lm0/o0;

    move-result-object v12

    invoke-static {v6, v11}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v6

    sget-object v13, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v13, LZ0/g;->b:LZ0/f;

    invoke-virtual {v11}, Lm0/q;->j0()V

    iget-boolean v15, v11, Lm0/q;->S:Z

    if-eqz v15, :cond_c

    invoke-virtual {v11, v13}, Lm0/q;->l(LVm/a;)V

    goto :goto_8

    :cond_c
    invoke-virtual {v11}, Lm0/q;->t0()V

    :goto_8
    sget-object v13, LZ0/g;->f:LZ0/e;

    invoke-static {v13, v8, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v8, LZ0/g;->e:LZ0/e;

    invoke-static {v8, v12, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    sget-object v9, LZ0/g;->g:LZ0/e;

    invoke-static {v11, v8, v9}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v8, LZ0/g;->h:LZ0/d;

    invoke-static {v11, v8}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v8, LZ0/g;->d:LZ0/e;

    invoke-static {v8, v6, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v6, Lcom/eightsleep/data_core/enums/base/BaseElevationPreset;->FLAT:Lcom/eightsleep/data_core/enums/base/BaseElevationPreset;

    sget-object v8, Lcom/eightsleep/data_core/enums/base/BaseElevationPreset;->SLEEP:Lcom/eightsleep/data_core/enums/base/BaseElevationPreset;

    sget-object v9, Lcom/eightsleep/data_core/enums/base/BaseElevationPreset;->RELAXING:Lcom/eightsleep/data_core/enums/base/BaseElevationPreset;

    sget-object v12, Lcom/eightsleep/data_core/enums/base/BaseElevationPreset;->READING:Lcom/eightsleep/data_core/enums/base/BaseElevationPreset;

    filled-new-array {v6, v8, v9, v12}, [Lcom/eightsleep/data_core/enums/base/BaseElevationPreset;

    move-result-object v6

    invoke-static {v6}, LIm/s;->g0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    const v8, -0x4a76f7b0

    invoke-virtual {v11, v8}, Lm0/q;->f0(I)V

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :goto_9
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_14

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/eightsleep/data_core/enums/base/BaseElevationPreset;

    if-ne v1, v6, :cond_d

    const/4 v8, 0x1

    goto :goto_a

    :cond_d
    const/4 v8, 0x0

    :goto_a
    sget-object v9, LA0/d;->n:LA0/g;

    sget-object v12, LG/l;->c:LG/f;

    const/16 v13, 0x30

    invoke-static {v12, v9, v11, v13}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v9

    iget-wide v12, v11, Lm0/q;->T:J

    invoke-static {v12, v13}, Ljava/lang/Long;->hashCode(J)I

    move-result v12

    invoke-virtual {v11}, Lm0/q;->m()Lm0/o0;

    move-result-object v13

    invoke-static {v5, v11}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v15

    sget-object v16, LZ0/h;->l0:LZ0/g;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v14, LZ0/g;->b:LZ0/f;

    invoke-virtual {v11}, Lm0/q;->j0()V

    iget-boolean v0, v11, Lm0/q;->S:Z

    if-eqz v0, :cond_e

    invoke-virtual {v11, v14}, Lm0/q;->l(LVm/a;)V

    goto :goto_b

    :cond_e
    invoke-virtual {v11}, Lm0/q;->t0()V

    :goto_b
    sget-object v0, LZ0/g;->f:LZ0/e;

    invoke-static {v0, v9, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v0, LZ0/g;->e:LZ0/e;

    invoke-static {v0, v13, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v9, LZ0/g;->g:LZ0/e;

    invoke-static {v11, v0, v9}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v0, LZ0/g;->h:LZ0/d;

    invoke-static {v11, v0}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v0, LZ0/g;->d:LZ0/e;

    invoke-static {v0, v15, v11}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const v0, -0x71e821c6

    invoke-virtual {v11, v0}, Lm0/q;->f0(I)V

    and-int/lit16 v0, v2, 0x1c00

    const/16 v14, 0x800

    if-ne v0, v14, :cond_f

    const/4 v0, 0x1

    goto :goto_c

    :cond_f
    const/4 v0, 0x0

    :goto_c
    invoke-virtual {v11, v6}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v9

    or-int/2addr v0, v9

    invoke-virtual {v11}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v9

    if-nez v0, :cond_10

    sget-object v0, Lm0/k;->a:Lm0/e;

    if-ne v9, v0, :cond_11

    :cond_10
    new-instance v9, Lbg/a;

    const/4 v0, 0x0

    invoke-direct {v9, v4, v6, v0}, Lbg/a;-><init>(LVm/k;Lcom/eightsleep/data_core/enums/base/BaseElevationPreset;I)V

    invoke-virtual {v11, v9}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_11
    check-cast v9, LVm/a;

    const/4 v0, 0x0

    invoke-virtual {v11, v0}, Lm0/q;->q(Z)V

    shl-int/lit8 v0, v2, 0x3

    const v12, 0x70380

    and-int/2addr v12, v0

    const/16 v13, 0x8

    move-object v0, v5

    move-object v5, v6

    move v6, v8

    const/4 v8, 0x0

    invoke-static/range {v5 .. v13}, LIm/G;->n(Lcom/eightsleep/data_core/enums/base/BaseElevationPreset;ZZFLVm/a;LVm/a;Lm0/l;II)V

    const v7, -0x71e811f4

    invoke-virtual {v11, v7}, Lm0/q;->f0(I)V

    if-eqz v3, :cond_13

    const/4 v7, 0x0

    invoke-static {v11, v7}, LP2/z;->Q(Lm0/l;I)V

    move-object v7, v5

    sget-object v5, Lih/h;->c:Lih/h;

    invoke-virtual {v7}, Lcom/eightsleep/data_core/enums/base/BaseElevationPreset;->getLabelResId()I

    move-result v7

    invoke-static {v11, v7}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v7

    if-eqz v6, :cond_12

    const v6, -0x71e7f51c

    invoke-virtual {v11, v6}, Lm0/q;->f0(I)V

    invoke-static {v11}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v6

    iget-object v6, v6, Lhh/h;->l:Lhh/p;

    iget-wide v8, v6, Lhh/p;->a:J

    const/4 v6, 0x0

    :goto_d
    invoke-virtual {v11, v6}, Lm0/q;->q(Z)V

    goto :goto_e

    :cond_12
    const/4 v6, 0x0

    const v8, -0x71e7f035

    invoke-virtual {v11, v8}, Lm0/q;->f0(I)V

    invoke-static {v11}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v8

    iget-object v8, v8, Lhh/h;->k:Lhh/v;

    iget-wide v8, v8, Lhh/v;->e:J

    goto :goto_d

    :goto_e
    const/4 v13, 0x0

    const/4 v15, 0x0

    move v10, v6

    move-object v6, v7

    const/4 v7, 0x0

    move v12, v10

    const/4 v10, 0x0

    move/from16 v16, v14

    move-object v14, v11

    const/4 v11, 0x0

    move/from16 v17, v12

    const/4 v12, 0x0

    move/from16 v19, v16

    const/16 v16, 0x0

    move/from16 v20, v17

    const/16 v17, 0x3f6

    move-object/from16 p2, v0

    move/from16 v0, v20

    invoke-virtual/range {v5 .. v17}, Lih/h;->h(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    move-object v11, v14

    goto :goto_f

    :cond_13
    move-object/from16 p2, v0

    move/from16 v19, v14

    const/4 v0, 0x0

    :goto_f
    invoke-virtual {v11, v0}, Lm0/q;->q(Z)V

    const/4 v5, 0x1

    invoke-virtual {v11, v5}, Lm0/q;->q(Z)V

    move/from16 v7, p1

    move-object/from16 v5, p2

    move-object/from16 v10, p4

    move/from16 v0, p6

    goto/16 :goto_9

    :cond_14
    const/4 v0, 0x0

    const/4 v5, 0x1

    invoke-virtual {v11, v0}, Lm0/q;->q(Z)V

    invoke-virtual {v11, v5}, Lm0/q;->q(Z)V

    :goto_10
    invoke-virtual {v11}, Lm0/q;->u()Lm0/t0;

    move-result-object v9

    if-eqz v9, :cond_15

    new-instance v0, LOg/w;

    const/4 v8, 0x1

    move/from16 v2, p1

    move-object/from16 v5, p4

    move/from16 v6, p6

    move/from16 v7, p7

    invoke-direct/range {v0 .. v8}, LOg/w;-><init>(Ljava/lang/Object;ZZLjava/lang/Object;LVm/a;III)V

    iput-object v0, v9, Lm0/t0;->d:LVm/n;

    :cond_15
    return-void
.end method

.method public static final m(LG/C;Lcom/eightsleep/data_core/enums/PodGeneration;LYa/H;LVm/k;LVm/k;LVm/a;Lm0/l;I)V
    .locals 24

    move-object/from16 v2, p1

    move-object/from16 v0, p2

    move-object/from16 v1, p4

    move/from16 v3, p7

    move-object/from16 v14, p6

    check-cast v14, Lm0/q;

    const v4, -0x5c8f271b

    invoke-virtual {v14, v4}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v4, v3, 0x6

    if-nez v4, :cond_1

    move-object/from16 v4, p0

    invoke-virtual {v14, v4}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x4

    goto :goto_0

    :cond_0
    const/4 v5, 0x2

    :goto_0
    or-int/2addr v5, v3

    goto :goto_1

    :cond_1
    move-object/from16 v4, p0

    move v5, v3

    :goto_1
    and-int/lit8 v6, v3, 0x30

    if-nez v6, :cond_3

    invoke-virtual {v14, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    const/16 v6, 0x20

    goto :goto_2

    :cond_2
    const/16 v6, 0x10

    :goto_2
    or-int/2addr v5, v6

    :cond_3
    and-int/lit16 v6, v3, 0x180

    if-nez v6, :cond_5

    invoke-virtual {v14, v0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    const/16 v6, 0x100

    goto :goto_3

    :cond_4
    const/16 v6, 0x80

    :goto_3
    or-int/2addr v5, v6

    :cond_5
    and-int/lit16 v6, v3, 0xc00

    if-nez v6, :cond_7

    move-object/from16 v6, p3

    invoke-virtual {v14, v6}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    const/16 v7, 0x800

    goto :goto_4

    :cond_6
    const/16 v7, 0x400

    :goto_4
    or-int/2addr v5, v7

    goto :goto_5

    :cond_7
    move-object/from16 v6, p3

    :goto_5
    and-int/lit16 v7, v3, 0x6000

    if-nez v7, :cond_9

    invoke-virtual {v14, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    const/16 v7, 0x4000

    goto :goto_6

    :cond_8
    const/16 v7, 0x2000

    :goto_6
    or-int/2addr v5, v7

    :cond_9
    const/high16 v7, 0x30000

    and-int/2addr v7, v3

    move-object/from16 v11, p5

    if-nez v7, :cond_b

    invoke-virtual {v14, v11}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a

    const/high16 v7, 0x20000

    goto :goto_7

    :cond_a
    const/high16 v7, 0x10000

    :goto_7
    or-int/2addr v5, v7

    :cond_b
    const v7, 0x12493

    and-int/2addr v7, v5

    const v9, 0x12492

    if-ne v7, v9, :cond_d

    invoke-virtual {v14}, Lm0/q;->H()Z

    move-result v7

    if-nez v7, :cond_c

    goto :goto_8

    :cond_c
    invoke-virtual {v14}, Lm0/q;->Y()V

    goto/16 :goto_11

    :cond_d
    :goto_8
    sget-object v7, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->b:Lm0/c1;

    invoke-virtual {v14, v7}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/content/Context;

    const v9, -0x145c0100

    invoke-virtual {v14, v9}, Lm0/q;->f0(I)V

    invoke-static {}, Lcom/eightsleep/data_core/enums/ModernPodGeneration;->getEntries()LOm/a;

    move-result-object v9

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_9
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_f

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    move-object v13, v12

    check-cast v13, Lcom/eightsleep/data_core/enums/ModernPodGeneration;

    sget-object v15, Lcom/eightsleep/data_core/enums/ModernPodGeneration;->POD_4_ULTRA:Lcom/eightsleep/data_core/enums/ModernPodGeneration;

    if-ne v13, v15, :cond_e

    goto :goto_9

    :cond_e
    invoke-virtual {v10, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_9

    :cond_f
    new-instance v9, LGh/B;

    const/4 v12, 0x0

    invoke-direct {v9, v12}, LGh/B;-><init>(I)V

    invoke-static {v10, v9}, LIm/r;->J1(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v9

    new-instance v10, Ljava/util/ArrayList;

    const/16 v12, 0xa

    invoke-static {v9, v12}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v12

    invoke-direct {v10, v12}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_a
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    const/4 v15, 0x1

    const/4 v13, 0x0

    if-eqz v12, :cond_12

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/eightsleep/data_core/enums/ModernPodGeneration;

    new-instance v16, LEh/c;

    sget-object v17, LGh/C;->a:[I

    invoke-virtual {v12}, Ljava/lang/Enum;->ordinal()I

    move-result v18

    aget v8, v17, v18

    if-ne v8, v15, :cond_10

    const v8, 0x7a75230e

    const v15, 0x7f1210f5

    invoke-static {v14, v8, v15, v14, v13}, Lcom/eightsleep/data_bioage/data/model/a;->n(Lm0/q;IILm0/q;Z)Ljava/lang/String;

    move-result-object v8

    :goto_b
    move-object/from16 v18, v8

    goto :goto_c

    :cond_10
    const v8, 0x7a752d74

    invoke-virtual {v14, v8}, Lm0/q;->f0(I)V

    invoke-virtual {v12}, Lcom/eightsleep/data_core/enums/ModernPodGeneration;->getLabelResId()I

    move-result v8

    invoke-static {v14, v8}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v14, v13}, Lm0/q;->q(Z)V

    goto :goto_b

    :goto_c
    const v8, -0x145bd5fd

    invoke-virtual {v14, v8}, Lm0/q;->f0(I)V

    sget-object v8, Lcom/eightsleep/data_core/enums/ModernPodGeneration;->LEGACY:Lcom/eightsleep/data_core/enums/ModernPodGeneration;

    if-ne v12, v8, :cond_11

    const v8, 0x7f1210ef

    invoke-static {v14, v8}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v19, v8

    goto :goto_d

    :cond_11
    const/16 v19, 0x0

    :goto_d
    invoke-virtual {v14, v13}, Lm0/q;->q(Z)V

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v20, 0x0

    const/16 v23, 0x38

    move-object/from16 v17, v12

    invoke-direct/range {v16 .. v23}, LEh/c;-><init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Integer;I)V

    move-object/from16 v8, v16

    invoke-virtual {v10, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_a

    :cond_12
    invoke-virtual {v14, v13}, Lm0/q;->q(Z)V

    if-eqz v2, :cond_13

    if-nez v0, :cond_13

    move v9, v15

    goto :goto_e

    :cond_13
    move v9, v13

    :goto_e
    if-eqz v0, :cond_14

    invoke-virtual {v0, v7}, LYa/H;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    move-object v12, v7

    goto :goto_f

    :cond_14
    const/4 v12, 0x0

    :goto_f
    const v7, -0x145b9ce7

    invoke-virtual {v14, v7}, Lm0/q;->f0(I)V

    const v7, 0xe000

    and-int v8, v5, v7

    move/from16 p6, v7

    const/16 v7, 0x4000

    if-ne v8, v7, :cond_15

    goto :goto_10

    :cond_15
    move v15, v13

    :goto_10
    invoke-virtual {v14, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    or-int/2addr v7, v15

    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v8

    if-nez v7, :cond_16

    sget-object v7, Lm0/k;->a:Lm0/e;

    if-ne v8, v7, :cond_17

    :cond_16
    new-instance v8, LGh/y;

    const/4 v7, 0x1

    invoke-direct {v8, v1, v2, v7}, LGh/y;-><init>(LVm/k;Lcom/eightsleep/data_core/enums/PodGeneration;I)V

    invoke-virtual {v14, v8}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_17
    check-cast v8, LVm/a;

    invoke-virtual {v14, v13}, Lm0/q;->q(Z)V

    const v7, 0x7f1210d6

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const v13, 0x7f1210d4

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const v15, 0x7f12038f

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    and-int/lit8 v16, v5, 0xe

    shl-int/lit8 v0, v5, 0x6

    and-int/lit16 v0, v0, 0x1c00

    or-int v0, v16, v0

    shl-int/lit8 v16, v5, 0x3

    and-int v16, v16, p6

    or-int v0, v0, v16

    shr-int/lit8 v5, v5, 0xc

    and-int/lit8 v16, v5, 0x70

    move-object v5, v8

    const/4 v8, 0x0

    move-object v6, v7

    move-object v7, v13

    const/4 v13, 0x0

    const v1, 0x7f1210d5

    const/16 v17, 0x1080

    move-object v3, v2

    move-object v2, v10

    move-object v10, v15

    move v15, v0

    move-object v0, v4

    move-object/from16 v4, p3

    invoke-static/range {v0 .. v17}, LEh/f;->a(LG/C;ILjava/util/List;Ljava/lang/Object;LVm/k;LVm/a;Ljava/lang/Integer;Ljava/lang/Integer;IZLjava/lang/Integer;LVm/a;Ljava/lang/String;LVm/o;Lm0/l;III)V

    :goto_11
    invoke-virtual {v14}, Lm0/q;->u()Lm0/t0;

    move-result-object v9

    if-eqz v9, :cond_18

    new-instance v0, LGh/z;

    const/4 v8, 0x1

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move/from16 v7, p7

    invoke-direct/range {v0 .. v8}, LGh/z;-><init>(LG/C;Lcom/eightsleep/data_core/enums/PodGeneration;LYa/H;LVm/k;LVm/k;LVm/a;II)V

    iput-object v0, v9, Lm0/t0;->d:LVm/n;

    :cond_18
    return-void
.end method

.method public static final n(ILA0/r;LVm/k;LVm/k;Lcom/eightsleep/presentation_onboarding/feature/productidentification/viewmodel/ProductIdentificationViewModel;Lm0/l;)V
    .locals 12

    move-object/from16 v1, p4

    const-string v0, "viewModel"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onOneTimeEvent"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onNavEvent"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v9, p5

    check-cast v9, Lm0/q;

    const v0, -0x535a1030

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
    sget-object v8, LGh/i;->a:Lu0/d;

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

    const-string v7, "onboarding_manual_product_identification_option_cover_confirmation_email"

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

    const/16 v6, 0x8

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

.method public static final o(IIILA0/r;LVm/a;Lm0/l;)V
    .locals 28

    move/from16 v1, p0

    move/from16 v0, p1

    move-object/from16 v10, p3

    const-string v2, "onGetEstimateClick"

    move-object/from16 v11, p4

    invoke-static {v11, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v7, p5

    check-cast v7, Lm0/q;

    const v2, 0x52d70b64

    invoke-virtual {v7, v2}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v7, v10}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x4

    goto :goto_0

    :cond_0
    const/4 v2, 0x2

    :goto_0
    or-int v2, p2, v2

    invoke-virtual {v7, v1}, Lm0/q;->e(I)Z

    move-result v3

    const/16 v4, 0x10

    if-eqz v3, :cond_1

    const/16 v3, 0x20

    goto :goto_1

    :cond_1
    move v3, v4

    :goto_1
    or-int/2addr v2, v3

    invoke-virtual {v7, v0}, Lm0/q;->e(I)Z

    move-result v3

    if-eqz v3, :cond_2

    const/16 v3, 0x100

    goto :goto_2

    :cond_2
    const/16 v3, 0x80

    :goto_2
    or-int/2addr v2, v3

    and-int/lit16 v3, v2, 0x93

    const/16 v5, 0x92

    if-ne v3, v5, :cond_4

    invoke-virtual {v7}, Lm0/q;->H()Z

    move-result v3

    if-nez v3, :cond_3

    goto :goto_3

    :cond_3
    invoke-virtual {v7}, Lm0/q;->Y()V

    move-object v12, v7

    goto/16 :goto_7

    :cond_4
    :goto_3
    sub-int v3, v1, v0

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-static {v10, v5}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v5

    int-to-float v4, v4

    invoke-static {v4}, LO/e;->b(F)LO/d;

    move-result-object v4

    invoke-static {v5, v4}, LE0/i;->c(LA0/r;LH0/X;)LA0/r;

    move-result-object v4

    sget-object v5, LA0/d;->a:LA0/i;

    const/4 v6, 0x0

    invoke-static {v5, v6}, LG/t;->d(LA0/e;Z)LX0/h0;

    move-result-object v5

    iget-wide v8, v7, Lm0/q;->T:J

    invoke-static {v8, v9}, Ljava/lang/Long;->hashCode(J)I

    move-result v8

    invoke-virtual {v7}, Lm0/q;->m()Lm0/o0;

    move-result-object v9

    invoke-static {v4, v7}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v4

    sget-object v12, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v12, LZ0/g;->b:LZ0/f;

    invoke-virtual {v7}, Lm0/q;->j0()V

    iget-boolean v13, v7, Lm0/q;->S:Z

    if-eqz v13, :cond_5

    invoke-virtual {v7, v12}, Lm0/q;->l(LVm/a;)V

    goto :goto_4

    :cond_5
    invoke-virtual {v7}, Lm0/q;->t0()V

    :goto_4
    sget-object v13, LZ0/g;->f:LZ0/e;

    invoke-static {v13, v5, v7}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v5, LZ0/g;->e:LZ0/e;

    invoke-static {v5, v9, v7}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    sget-object v9, LZ0/g;->g:LZ0/e;

    invoke-static {v7, v8, v9}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v8, LZ0/g;->h:LZ0/d;

    invoke-static {v7, v8}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v14, LZ0/g;->d:LZ0/e;

    invoke-static {v14, v4, v7}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v4, LG/x;->a:LG/x;

    const v15, 0x7f080309

    invoke-static {v15, v6, v7}, LP2/i;->E(IILm0/l;)LL0/a;

    move-result-object v15

    sget-object v16, LX0/p;->a:LX0/p0;

    sget-object v6, LA0/o;->a:LA0/o;

    invoke-virtual {v4, v6}, LG/x;->matchParentSize(LA0/r;)LA0/r;

    move-result-object v4

    sget v0, LL0/a;->$stable:I

    or-int/lit16 v0, v0, 0x6030

    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object/from16 v19, v13

    const/4 v13, 0x0

    move-object/from16 v20, v12

    move-object v12, v15

    const/4 v15, 0x0

    const/16 v21, 0x68

    move-object/from16 v27, v20

    move/from16 v20, v0

    move-object/from16 v0, v27

    move-object/from16 v27, v14

    move-object v14, v4

    move-object/from16 v4, v19

    move-object/from16 v19, v7

    move-object/from16 v7, v27

    invoke-static/range {v12 .. v21}, Ly/x;->c(LL0/a;Ljava/lang/String;LA0/r;LA0/e;LX0/q;FLH0/p;Lm0/l;II)V

    move-object/from16 v12, v19

    invoke-static {v12}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v13

    iget v13, v13, Lhh/i;->e:F

    invoke-static {v6, v13}, LG/e;->H(LA0/r;F)LA0/r;

    move-result-object v13

    sget-object v14, LG/l;->g:LG/g;

    sget-object v15, LA0/d;->m:LA0/g;

    const/4 v1, 0x6

    invoke-static {v14, v15, v12, v1}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v1

    move/from16 v26, v2

    move/from16 v22, v3

    iget-wide v2, v12, Lm0/q;->T:J

    invoke-static {v2, v3}, Ljava/lang/Long;->hashCode(J)I

    move-result v2

    invoke-virtual {v12}, Lm0/q;->m()Lm0/o0;

    move-result-object v3

    invoke-static {v13, v12}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v13

    invoke-virtual {v12}, Lm0/q;->j0()V

    iget-boolean v14, v12, Lm0/q;->S:Z

    if-eqz v14, :cond_6

    invoke-virtual {v12, v0}, Lm0/q;->l(LVm/a;)V

    goto :goto_5

    :cond_6
    invoke-virtual {v12}, Lm0/q;->t0()V

    :goto_5
    invoke-static {v4, v1, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v5, v3, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v2, v12, v9, v12, v8}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    invoke-static {v7, v13, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v1, Lg8/h0;->a:Lg8/h0;

    const v2, 0x7f121239

    invoke-static {v12, v2}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v17

    const/16 v20, 0x0

    const/16 v18, 0x0

    const/16 v16, 0x0

    move-object v2, v15

    const/4 v15, 0x0

    const/16 v21, 0x0

    const/4 v13, 0x0

    const/16 v14, 0x7e

    move-object/from16 v19, v12

    move-object v12, v1

    invoke-virtual/range {v12 .. v21}, Lg8/h0;->h(IILA0/r;LH0/w;Ljava/lang/String;Lk1/U;Lm0/l;Lv1/k;Z)V

    move-object/from16 v12, v19

    const/4 v1, 0x0

    invoke-static {v12, v1}, LP2/z;->K(Lm0/l;I)V

    sget-object v3, LG/l;->c:LG/f;

    invoke-static {v3, v2, v12, v1}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v2

    iget-wide v13, v12, Lm0/q;->T:J

    invoke-static {v13, v14}, Ljava/lang/Long;->hashCode(J)I

    move-result v1

    invoke-virtual {v12}, Lm0/q;->m()Lm0/o0;

    move-result-object v3

    invoke-static {v6, v12}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v6

    invoke-virtual {v12}, Lm0/q;->j0()V

    iget-boolean v13, v12, Lm0/q;->S:Z

    if-eqz v13, :cond_7

    invoke-virtual {v12, v0}, Lm0/q;->l(LVm/a;)V

    goto :goto_6

    :cond_7
    invoke-virtual {v12}, Lm0/q;->t0()V

    :goto_6
    invoke-static {v4, v2, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v5, v3, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v1, v12, v9, v12, v8}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    invoke-static {v7, v6, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v0, Lih/h;->d:Lih/h;

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const v2, 0x7f121237

    invoke-static {v2, v1, v12}, LP2/j;->H(I[Ljava/lang/Object;Lm0/l;)Ljava/lang/String;

    move-result-object v13

    const/16 v21, 0x0

    const/16 v23, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const-wide/16 v16, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x3fe

    move-object/from16 v22, v12

    move-object v12, v0

    invoke-virtual/range {v12 .. v25}, Lih/h;->o(Ljava/lang/String;LA0/r;Lk1/U;JIZIILm0/l;III)V

    move-object/from16 v12, v22

    const/4 v1, 0x0

    invoke-static {v12, v1}, LP2/z;->O(Lm0/l;I)V

    shr-int/lit8 v0, v26, 0x6

    and-int/lit8 v0, v0, 0xe

    and-int/lit8 v1, v26, 0x70

    or-int v8, v0, v1

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    const/4 v2, 0x0

    const/16 v9, 0x1c

    move/from16 v1, p0

    move/from16 v0, p1

    move-object v7, v12

    invoke-static/range {v0 .. v9}, LP2/I;->k(IILA0/r;JJLm0/l;II)V

    const/4 v0, 0x1

    invoke-static {v12, v0, v0, v0}, Ly2/K;->d(Lm0/q;ZZZ)V

    :goto_7
    invoke-virtual {v12}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_8

    new-instance v0, LDg/G;

    move/from16 v2, p0

    move/from16 v3, p1

    move/from16 v5, p2

    move-object v1, v10

    move-object v4, v11

    invoke-direct/range {v0 .. v5}, LDg/G;-><init>(LA0/r;IILVm/a;I)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_8
    return-void
.end method

.method public static final p(Lu9/e;Lze/k;LVm/k;Lm0/l;I)V
    .locals 6

    const-string v0, "model"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onUiAction"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p3, Lm0/q;

    const v0, -0x5435501b

    invoke-virtual {p3, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, p4, 0x6

    if-nez v0, :cond_1

    invoke-virtual {p3, p0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int/2addr v0, p4

    goto :goto_1

    :cond_1
    move v0, p4

    :goto_1
    and-int/lit8 v1, p4, 0x30

    if-nez v1, :cond_3

    invoke-virtual {p3, p1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x20

    goto :goto_2

    :cond_2
    const/16 v1, 0x10

    :goto_2
    or-int/2addr v0, v1

    :cond_3
    and-int/lit16 v1, p4, 0x180

    if-nez v1, :cond_5

    invoke-virtual {p3, p2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const/16 v1, 0x100

    goto :goto_3

    :cond_4
    const/16 v1, 0x80

    :goto_3
    or-int/2addr v0, v1

    :cond_5
    and-int/lit16 v1, v0, 0x93

    const/16 v2, 0x92

    if-ne v1, v2, :cond_7

    invoke-virtual {p3}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_6

    goto :goto_4

    :cond_6
    invoke-virtual {p3}, Lm0/q;->Y()V

    goto :goto_5

    :cond_7
    :goto_4
    invoke-virtual {p0}, Lu9/e;->c()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_8

    sget-object v1, Lcom/eightsleep/data_core/enums/audio/AudioStopCriteria;->MANUAL_STOP:Lcom/eightsleep/data_core/enums/audio/AudioStopCriteria;

    sget-object v3, Lcom/eightsleep/data_core/enums/audio/AudioStopCriteria;->UNTIL_TRACK_END:Lcom/eightsleep/data_core/enums/audio/AudioStopCriteria;

    filled-new-array {v1, v3}, [Lcom/eightsleep/data_core/enums/audio/AudioStopCriteria;

    move-result-object v1

    invoke-static {v1}, LIm/s;->g0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iget-object v3, p0, Lu9/e;->a:Ljava/lang/String;

    invoke-virtual {p1, v3}, Lze/k;->B(Ljava/lang/String;)Lcom/eightsleep/data_core/enums/audio/AudioStopCriteria;

    move-result-object v3

    invoke-static {v1, v3}, LIm/r;->T0(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const v1, -0x3e63830b

    invoke-virtual {p3, v1}, Lm0/q;->f0(I)V

    and-int/lit16 v0, v0, 0x3fe

    invoke-static {p0, p1, p2, p3, v0}, LP2/h;->t(Lu9/e;Lze/k;LVm/k;Lm0/l;I)V

    invoke-virtual {p3, v2}, Lm0/q;->q(Z)V

    goto :goto_5

    :cond_8
    const v1, -0x3e61b98d

    invoke-virtual {p3, v1}, Lm0/q;->f0(I)V

    and-int/lit16 v0, v0, 0x3fe

    invoke-static {p0, p1, p2, p3, v0}, LP2/h;->i(Lu9/e;Lze/k;LVm/k;Lm0/l;I)V

    invoke-virtual {p3, v2}, Lm0/q;->q(Z)V

    :goto_5
    invoke-virtual {p3}, Lm0/q;->u()Lm0/t0;

    move-result-object p3

    if-eqz p3, :cond_9

    new-instance v0, LAe/N;

    const/4 v5, 0x1

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p4

    invoke-direct/range {v0 .. v5}, LAe/N;-><init>(Lu9/e;Lze/k;LVm/k;II)V

    iput-object v0, p3, Lm0/t0;->d:LVm/n;

    :cond_9
    return-void
.end method

.method public static final q(Lu9/e;Lze/k;LVm/k;Lm0/l;I)V
    .locals 17

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v7, p4

    const-string v0, "model"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onUiAction"

    invoke-static {v3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v13, p3

    check-cast v13, Lm0/q;

    const v0, -0x4ed4398d

    invoke-virtual {v13, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, v7, 0x6

    if-nez v0, :cond_1

    invoke-virtual {v13, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

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
    and-int/lit8 v4, v7, 0x30

    if-nez v4, :cond_3

    invoke-virtual {v13, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    const/16 v4, 0x20

    goto :goto_2

    :cond_2
    const/16 v4, 0x10

    :goto_2
    or-int/2addr v0, v4

    :cond_3
    and-int/lit16 v4, v7, 0x180

    if-nez v4, :cond_5

    invoke-virtual {v13, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const/16 v4, 0x100

    goto :goto_3

    :cond_4
    const/16 v4, 0x80

    :goto_3
    or-int/2addr v0, v4

    :cond_5
    and-int/lit16 v0, v0, 0x93

    const/16 v4, 0x92

    if-ne v0, v4, :cond_7

    invoke-virtual {v13}, Lm0/q;->H()Z

    move-result v0

    if-nez v0, :cond_6

    goto :goto_4

    :cond_6
    invoke-virtual {v13}, Lm0/q;->Y()V

    goto :goto_5

    :cond_7
    :goto_4
    sget-object v0, La1/k0;->l:Lm0/c1;

    invoke-virtual {v13, v0}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, LO0/a;

    iget-object v0, v1, Lu9/e;->a:Ljava/lang/String;

    invoke-virtual {v2, v0}, Lze/k;->B(Ljava/lang/String;)Lcom/eightsleep/data_core/enums/audio/AudioStopCriteria;

    move-result-object v5

    iget-boolean v0, v2, Lze/k;->i:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    new-instance v0, LAe/X;

    const/4 v6, 0x0

    move-object/from16 v16, v3

    move-object v3, v1

    move-object v1, v2

    move-object/from16 v2, v16

    invoke-direct/range {v0 .. v6}, LAe/X;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    const v1, 0x7e040754

    invoke-static {v1, v0, v13}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v12

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v9, 0x0

    const/16 v14, 0x6000

    const/16 v15, 0xe

    invoke-static/range {v8 .. v15}, Lv/d;->g(Ljava/lang/Object;LA0/r;Lw/C;Ljava/lang/String;Lu0/d;Lm0/l;II)V

    :goto_5
    invoke-virtual {v13}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_8

    new-instance v0, LAe/N;

    const/4 v5, 0x2

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move v4, v7

    invoke-direct/range {v0 .. v5}, LAe/N;-><init>(Lu9/e;Lze/k;LVm/k;II)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_8
    return-void
.end method

.method public static final r(LVm/a;LVm/a;LA0/o;Lm0/l;I)V
    .locals 14

    const-string v0, "onDismiss"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onNext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v9, p3

    check-cast v9, Lm0/q;

    const v0, 0x6fa48577

    invoke-virtual {v9, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, p4, 0x6

    if-nez v0, :cond_1

    invoke-virtual {v9, p0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int v0, p4, v0

    goto :goto_1

    :cond_1
    move/from16 v0, p4

    :goto_1
    and-int/lit8 v1, p4, 0x30

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
    or-int/lit16 v0, v0, 0x180

    and-int/lit16 v1, v0, 0x93

    const/16 v3, 0x92

    if-ne v1, v3, :cond_5

    invoke-virtual {v9}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_4

    goto :goto_3

    :cond_4
    invoke-virtual {v9}, Lm0/q;->Y()V

    move-object/from16 v3, p2

    goto/16 :goto_4

    :cond_5
    :goto_3
    sget-object v11, LA0/o;->a:LA0/o;

    sget-object v1, LH8/M;->h:LH8/M;

    invoke-virtual {v1}, Ld8/j;->invoke()Landroid/net/Uri;

    move-result-object v1

    const v3, 0x7f1213ca

    invoke-static {v9, v3}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f1213c9

    invoke-static {v9, v4}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v4

    const v5, 0x7f1213c8    # 1.9417E38f

    invoke-static {v9, v5}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ldg/e;

    const v7, 0x7f1213c5

    invoke-static {v9, v7}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v7

    const v8, 0x7f1213c4

    invoke-static {v9, v8}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v8

    const v10, 0x7f080261

    invoke-direct {v6, v10, v7, v8}, Ldg/e;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    new-instance v7, Ldg/e;

    const v8, 0x7f1213c3

    invoke-static {v9, v8}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v8

    const v10, 0x7f1213c2

    invoke-static {v9, v10}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v10

    const v12, 0x7f08017c

    invoke-direct {v7, v12, v8, v10}, Ldg/e;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    new-instance v8, Ldg/e;

    const v10, 0x7f1213c7

    invoke-static {v9, v10}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v10

    const v12, 0x7f1213c6

    invoke-static {v9, v12}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v12

    const v13, 0x7f0801cd

    invoke-direct {v8, v13, v10, v12}, Ldg/e;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    filled-new-array {v6, v7, v8}, [Ldg/e;

    move-result-object v6

    invoke-static {v6}, LIm/s;->g0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    const v7, 0x7f1213c1

    invoke-static {v9, v7}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v7

    shl-int/lit8 v0, v0, 0x15

    const/high16 v8, 0x7fc00000    # Float.NaN

    and-int v10, v0, v8

    move-object v0, v1

    const v1, 0x7f11000f

    move-object v8, p1

    move-object v2, v3

    move-object v3, v4

    move-object v4, v5

    move-object v5, v6

    move-object v6, v7

    move-object v7, p0

    invoke-static/range {v0 .. v10}, LP2/D;->g(Landroid/net/Uri;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;LVm/a;LVm/a;Lm0/l;I)V

    move-object v3, v11

    :goto_4
    invoke-virtual {v9}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_6

    new-instance v0, Lgg/p;

    const/4 v5, 0x1

    move-object v1, p0

    move-object v2, p1

    move/from16 v4, p4

    invoke-direct/range {v0 .. v5}, Lgg/p;-><init>(LVm/a;LVm/a;LA0/o;II)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_6
    return-void
.end method

.method public static final s(LA0/r;LFf/S0;Lc8/e;LVm/a;LVm/k;LVm/a;Lm0/l;I)V
    .locals 15

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v6, p3

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    move/from16 v7, p7

    const-string v4, "returnFromAway"

    invoke-static {v0, v4}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "onCtaClicked"

    invoke-static {v6, v4}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "onBringPartnerClick"

    invoke-static {v2, v4}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "onBringPartnerBottomSheetDismissed"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v12, p6

    check-cast v12, Lm0/q;

    const v4, 0x5985011b

    invoke-virtual {v12, v4}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v4, v7, 0x6

    if-nez v4, :cond_1

    invoke-virtual {v12, p0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v4, 0x4

    goto :goto_0

    :cond_0
    const/4 v4, 0x2

    :goto_0
    or-int/2addr v4, v7

    goto :goto_1

    :cond_1
    move v4, v7

    :goto_1
    and-int/lit8 v5, v7, 0x30

    if-nez v5, :cond_3

    invoke-virtual {v12, v0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    const/16 v5, 0x20

    goto :goto_2

    :cond_2
    const/16 v5, 0x10

    :goto_2
    or-int/2addr v4, v5

    :cond_3
    and-int/lit16 v5, v7, 0x180

    if-nez v5, :cond_5

    invoke-virtual {v12, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    const/16 v5, 0x100

    goto :goto_3

    :cond_4
    const/16 v5, 0x80

    :goto_3
    or-int/2addr v4, v5

    :cond_5
    and-int/lit16 v5, v7, 0xc00

    if-nez v5, :cond_7

    invoke-virtual {v12, v6}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    const/16 v5, 0x800

    goto :goto_4

    :cond_6
    const/16 v5, 0x400

    :goto_4
    or-int/2addr v4, v5

    :cond_7
    and-int/lit16 v5, v7, 0x6000

    if-nez v5, :cond_9

    invoke-virtual {v12, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    const/16 v5, 0x4000

    goto :goto_5

    :cond_8
    const/16 v5, 0x2000

    :goto_5
    or-int/2addr v4, v5

    :cond_9
    const/high16 v5, 0x30000

    and-int/2addr v5, v7

    if-nez v5, :cond_b

    invoke-virtual {v12, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a

    const/high16 v5, 0x20000

    goto :goto_6

    :cond_a
    const/high16 v5, 0x10000

    :goto_6
    or-int/2addr v4, v5

    :cond_b
    const v5, 0x12493

    and-int/2addr v5, v4

    const v8, 0x12492

    if-ne v5, v8, :cond_d

    invoke-virtual {v12}, Lm0/q;->H()Z

    move-result v5

    if-nez v5, :cond_c

    goto :goto_7

    :cond_c
    invoke-virtual {v12}, Lm0/q;->Y()V

    goto :goto_8

    :cond_d
    :goto_7
    new-instance v5, LAg/N;

    const/16 v8, 0x11

    invoke-direct {v5, v8, v6, v0, v1}, LAg/N;-><init>(ILVm/a;Ljava/lang/Object;Ljava/lang/Object;)V

    const v8, -0x5c6a3a33

    invoke-static {v8, v5, v12}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v11

    and-int/lit8 v5, v4, 0xe

    or-int/lit16 v13, v5, 0xc00

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v14, 0x6

    move-object v8, p0

    invoke-static/range {v8 .. v14}, LP2/m;->w(LA0/r;LG/N0;LVm/a;Lu0/d;Lm0/l;II)V

    shr-int/lit8 v5, v4, 0x3

    and-int/lit8 v5, v5, 0x7e

    shr-int/lit8 v4, v4, 0x6

    and-int/lit16 v8, v4, 0x380

    or-int/2addr v5, v8

    and-int/lit16 v4, v4, 0x1c00

    or-int/2addr v5, v4

    move-object v4, v12

    invoke-static/range {v0 .. v5}, LP2/h;->h(LFf/S0;Lc8/e;LVm/k;LVm/a;Lm0/l;I)V

    :goto_8
    invoke-virtual {v12}, Lm0/q;->u()Lm0/t0;

    move-result-object v9

    if-eqz v9, :cond_e

    new-instance v0, LAh/Y;

    const/16 v8, 0x8

    move-object v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v5, p4

    move-object v4, v6

    move-object/from16 v6, p5

    invoke-direct/range {v0 .. v8}, LAh/Y;-><init>(LA0/r;Lc8/c;Ljava/lang/Object;LVm/a;LHm/e;LVm/a;II)V

    iput-object v0, v9, Lm0/t0;->d:LVm/n;

    :cond_e
    return-void
.end method

.method public static final t(Lu9/e;Lze/k;LVm/k;Lm0/l;I)V
    .locals 23

    move-object/from16 v4, p0

    move-object/from16 v6, p1

    move-object/from16 v2, p2

    move/from16 v7, p4

    const-string v0, "model"

    invoke-static {v6, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onUiAction"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v14, p3

    check-cast v14, Lm0/q;

    const v0, 0x2a343db3

    invoke-virtual {v14, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, v7, 0x6

    if-nez v0, :cond_1

    invoke-virtual {v14, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

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
    and-int/lit8 v1, v7, 0x30

    if-nez v1, :cond_3

    invoke-virtual {v14, v6}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x20

    goto :goto_2

    :cond_2
    const/16 v1, 0x10

    :goto_2
    or-int/2addr v0, v1

    :cond_3
    and-int/lit16 v1, v7, 0x180

    if-nez v1, :cond_5

    invoke-virtual {v14, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const/16 v1, 0x100

    goto :goto_3

    :cond_4
    const/16 v1, 0x80

    :goto_3
    or-int/2addr v0, v1

    :cond_5
    and-int/lit16 v1, v0, 0x93

    const/16 v3, 0x92

    if-ne v1, v3, :cond_7

    invoke-virtual {v14}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_6

    goto :goto_4

    :cond_6
    invoke-virtual {v14}, Lm0/q;->Y()V

    goto/16 :goto_11

    :cond_7
    :goto_4
    sget-object v1, La1/k0;->l:Lm0/c1;

    invoke-virtual {v14, v1}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, LO0/a;

    sget-object v3, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->b:Lm0/c1;

    invoke-virtual {v14, v3}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v3

    move-object v10, v3

    check-cast v10, Landroid/content/Context;

    iget-object v3, v4, Lu9/e;->a:Ljava/lang/String;

    invoke-virtual {v6, v3}, Lze/k;->A(Ljava/lang/String;)Lcom/eightsleep/data_audio/enums/AudioPlayerStatus;

    move-result-object v11

    invoke-virtual {v6, v3}, Lze/k;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v3}, Lze/k;->x(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    sget-object v3, LA0/o;->a:LA0/o;

    sget-object v12, LG/l;->c:LG/f;

    sget-object v13, LA0/d;->m:LA0/g;

    const/4 v15, 0x0

    invoke-static {v12, v13, v14, v15}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v12

    iget-wide v8, v14, Lm0/q;->T:J

    invoke-static {v8, v9}, Ljava/lang/Long;->hashCode(J)I

    move-result v8

    invoke-virtual {v14}, Lm0/q;->m()Lm0/o0;

    move-result-object v9

    invoke-static {v3, v14}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v13

    sget-object v17, LZ0/h;->l0:LZ0/g;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v15, LZ0/g;->b:LZ0/f;

    invoke-virtual {v14}, Lm0/q;->j0()V

    iget-boolean v2, v14, Lm0/q;->S:Z

    if-eqz v2, :cond_8

    invoke-virtual {v14, v15}, Lm0/q;->l(LVm/a;)V

    goto :goto_5

    :cond_8
    invoke-virtual {v14}, Lm0/q;->t0()V

    :goto_5
    sget-object v2, LZ0/g;->f:LZ0/e;

    invoke-static {v2, v12, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v12, LZ0/g;->e:LZ0/e;

    invoke-static {v12, v9, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    sget-object v9, LZ0/g;->g:LZ0/e;

    invoke-static {v14, v8, v9}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v8, LZ0/g;->h:LZ0/d;

    invoke-static {v14, v8}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v7, LZ0/g;->d:LZ0/e;

    invoke-static {v7, v13, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-static {v3, v13}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v3

    sget-object v13, LG/l;->e:LG/g;

    move-object/from16 v19, v10

    sget-object v10, LA0/d;->k:LA0/h;

    move-object/from16 v20, v11

    const/16 v11, 0x36

    invoke-static {v13, v10, v14, v11}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v10

    move-object v11, v5

    iget-wide v4, v14, Lm0/q;->T:J

    invoke-static {v4, v5}, Ljava/lang/Long;->hashCode(J)I

    move-result v4

    invoke-virtual {v14}, Lm0/q;->m()Lm0/o0;

    move-result-object v5

    invoke-static {v3, v14}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v3

    invoke-virtual {v14}, Lm0/q;->j0()V

    iget-boolean v13, v14, Lm0/q;->S:Z

    if-eqz v13, :cond_9

    invoke-virtual {v14, v15}, Lm0/q;->l(LVm/a;)V

    goto :goto_6

    :cond_9
    invoke-virtual {v14}, Lm0/q;->t0()V

    :goto_6
    invoke-static {v2, v10, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v12, v5, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v4, v14, v9, v14, v8}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    invoke-static {v7, v3, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const v2, -0x472716cb

    invoke-virtual {v14, v2}, Lm0/q;->f0(I)V

    invoke-virtual {v14, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v2

    and-int/lit16 v7, v0, 0x380

    const/4 v8, 0x1

    const/16 v13, 0x100

    if-ne v7, v13, :cond_a

    move v0, v8

    goto :goto_7

    :cond_a
    const/4 v0, 0x0

    :goto_7
    or-int/2addr v0, v2

    move-object v3, v11

    invoke-virtual {v14, v3}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v2

    or-int/2addr v0, v2

    move-object/from16 v4, p0

    invoke-virtual {v14, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v2

    or-int/2addr v0, v2

    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v2

    sget-object v9, Lm0/k;->a:Lm0/e;

    if-nez v0, :cond_b

    if-ne v2, v9, :cond_c

    :cond_b
    new-instance v0, LAe/J;

    const/4 v5, 0x0

    move-object/from16 v2, p2

    invoke-direct/range {v0 .. v5}, LAe/J;-><init>(LO0/a;LVm/k;Ljava/lang/String;Lu9/e;I)V

    invoke-virtual {v14, v0}, Lm0/q;->q0(Ljava/lang/Object;)V

    move-object v2, v0

    :cond_c
    check-cast v2, LVm/a;

    const/4 v0, 0x0

    invoke-virtual {v14, v0}, Lm0/q;->q(Z)V

    move/from16 v16, v13

    sget-object v13, LAe/o0;->a:Lu0/d;

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v5, v9

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/high16 v15, 0x180000

    move/from16 v17, v16

    const/16 v16, 0x3e

    move-object v8, v2

    move-object/from16 v22, v5

    move/from16 v5, v17

    move-object/from16 v21, v19

    const/16 v2, 0x20

    move-object/from16 v17, v3

    move-object/from16 v3, v20

    invoke-static/range {v8 .. v16}, Lj0/X1;->f(LVm/a;LA0/r;ZLj0/G0;LH0/X;LVm/n;Lm0/l;II)V

    invoke-static {v14, v0}, LP2/z;->j(Lm0/l;I)V

    const/16 v8, 0x48

    int-to-float v9, v8

    int-to-float v10, v2

    invoke-static {v14}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v2

    iget-object v2, v2, Lhh/h;->d:Lhh/g;

    iget-wide v11, v2, Lhh/g;->e:J

    const v2, -0x4726a072

    invoke-static {v11, v12, v14, v2}, Lj/m;->c(JLm0/q;I)LH0/w;

    move-result-object v12

    if-ne v7, v5, :cond_d

    const/4 v15, 0x1

    goto :goto_8

    :cond_d
    move v15, v0

    :goto_8
    invoke-virtual {v14, v6}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v2

    or-int/2addr v2, v15

    invoke-virtual {v14, v3}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v8

    or-int/2addr v2, v8

    invoke-virtual {v14, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v8

    or-int/2addr v2, v8

    move-object/from16 v8, v21

    invoke-virtual {v14, v8}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v11

    or-int/2addr v2, v11

    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v11

    move-object/from16 v13, v22

    if-nez v2, :cond_e

    if-ne v11, v13, :cond_f

    :cond_e
    move v2, v0

    goto :goto_9

    :cond_f
    move v15, v0

    move-object v8, v1

    move/from16 v16, v5

    move-object v0, v11

    move-object/from16 v11, v17

    goto :goto_a

    :goto_9
    new-instance v0, LAe/K;

    const/4 v6, 0x0

    move v15, v2

    move/from16 v16, v5

    move-object v5, v8

    move-object/from16 v11, v17

    move-object/from16 v2, p1

    move-object v8, v1

    move-object/from16 v1, p2

    invoke-direct/range {v0 .. v6}, LAe/K;-><init>(LVm/k;Lze/k;Lcom/eightsleep/data_audio/enums/AudioPlayerStatus;Lu9/e;Landroid/content/Context;I)V

    invoke-virtual {v14, v0}, Lm0/q;->q0(Ljava/lang/Object;)V

    :goto_a
    check-cast v0, LVm/a;

    invoke-virtual {v14, v15}, Lm0/q;->q(Z)V

    const/16 v17, 0x20

    move-object v5, v13

    const/4 v13, 0x0

    move/from16 v1, v16

    const/16 v16, 0xdb0

    move-object v2, v11

    move v11, v10

    move-object v6, v14

    move-object v14, v0

    move v0, v15

    move-object v15, v6

    move v6, v1

    move-object v1, v8

    move-object v8, v3

    move-object v3, v2

    move-object v2, v5

    invoke-static/range {v8 .. v17}, Lcj/l0;->a(Lcom/eightsleep/data_audio/enums/AudioPlayerStatus;FFFLH0/w;LA0/o;LVm/a;Lm0/l;II)V

    move-object/from16 v20, v8

    move-object v14, v15

    invoke-static {v14, v0}, LP2/z;->j(Lm0/l;I)V

    const v5, -0x47265bf6

    invoke-virtual {v14, v5}, Lm0/q;->f0(I)V

    invoke-virtual {v14, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-ne v7, v6, :cond_10

    const/4 v15, 0x1

    goto :goto_b

    :cond_10
    move v15, v0

    :goto_b
    or-int/2addr v5, v15

    invoke-virtual {v14, v3}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v8

    or-int/2addr v5, v8

    invoke-virtual {v14, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v8

    or-int/2addr v5, v8

    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v8

    if-nez v5, :cond_11

    if-ne v8, v2, :cond_12

    :cond_11
    move v15, v0

    goto :goto_c

    :cond_12
    move-object v13, v8

    move v8, v0

    move-object v0, v13

    move-object v13, v2

    move-object/from16 v2, p2

    goto :goto_d

    :goto_c
    new-instance v0, LAe/J;

    const/4 v5, 0x1

    move-object v13, v2

    move v8, v15

    move-object/from16 v2, p2

    invoke-direct/range {v0 .. v5}, LAe/J;-><init>(LO0/a;LVm/k;Ljava/lang/String;Lu9/e;I)V

    invoke-virtual {v14, v0}, Lm0/q;->q0(Ljava/lang/Object;)V

    :goto_d
    check-cast v0, LVm/a;

    invoke-virtual {v14, v8}, Lm0/q;->q(Z)V

    move-object v5, v13

    sget-object v13, LAe/o0;->b:Lu0/d;

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/high16 v15, 0x180000

    const/16 v16, 0x3e

    move v1, v8

    move-object v8, v0

    move-object/from16 v0, v20

    invoke-static/range {v8 .. v16}, Lj0/X1;->f(LVm/a;LA0/r;ZLj0/G0;LH0/X;LVm/n;Lm0/l;II)V

    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Lm0/q;->q(Z)V

    invoke-static {v14, v1}, LP2/z;->J(Lm0/l;I)V

    sget-object v8, Lcom/eightsleep/data_audio/enums/AudioPlayerStatus;->PLAYING:Lcom/eightsleep/data_audio/enums/AudioPlayerStatus;

    if-ne v0, v8, :cond_13

    move v10, v15

    goto :goto_e

    :cond_13
    move v10, v1

    :goto_e
    const v0, -0x2642a89f

    invoke-virtual {v14, v0}, Lm0/q;->f0(I)V

    if-ne v7, v6, :cond_14

    move v0, v15

    goto :goto_f

    :cond_14
    move v0, v1

    :goto_f
    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v8

    if-nez v0, :cond_15

    if-ne v8, v5, :cond_16

    :cond_15
    new-instance v8, LAe/L;

    const/4 v0, 0x0

    invoke-direct {v8, v0, v2}, LAe/L;-><init>(ILVm/k;)V

    invoke-virtual {v14, v8}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_16
    move-object v11, v8

    check-cast v11, LVm/k;

    invoke-virtual {v14, v1}, Lm0/q;->q(Z)V

    const v0, -0x26429359

    invoke-virtual {v14, v0}, Lm0/q;->f0(I)V

    if-ne v7, v6, :cond_17

    move v0, v15

    goto :goto_10

    :cond_17
    move v0, v1

    :goto_10
    invoke-virtual {v14, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    or-int/2addr v0, v6

    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v6

    if-nez v0, :cond_18

    if-ne v6, v5, :cond_19

    :cond_18
    new-instance v6, LAe/M;

    const/4 v0, 0x0

    invoke-direct {v6, v2, v4, v0}, LAe/M;-><init>(LVm/k;Lu9/e;I)V

    invoke-virtual {v14, v6}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_19
    move-object v12, v6

    check-cast v12, LVm/k;

    invoke-virtual {v14, v1}, Lm0/q;->q(Z)V

    move-object v13, v14

    const/4 v14, 0x0

    move-object v9, v3

    move-object/from16 v8, v18

    invoke-static/range {v8 .. v14}, LP2/D;->i(Ljava/lang/String;Ljava/lang/String;ZLVm/k;LVm/k;Lm0/l;I)V

    move-object v14, v13

    invoke-virtual {v14, v15}, Lm0/q;->q(Z)V

    :goto_11
    invoke-virtual {v14}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_1a

    new-instance v0, LAe/N;

    const/4 v5, 0x0

    move-object v3, v2

    move-object v1, v4

    move-object/from16 v2, p1

    move/from16 v4, p4

    invoke-direct/range {v0 .. v5}, LAe/N;-><init>(Lu9/e;Lze/k;LVm/k;II)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_1a
    return-void
.end method

.method public static final u(LSo/d;)V
    .locals 3

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    instance-of v0, p0, LVo/v;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, LVo/v;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "This serializer can be used only with Json format.Expected Encoder to be JsonEncoder, got "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    sget-object v2, Lkotlin/jvm/internal/B;->a:Lkotlin/jvm/internal/C;

    invoke-static {v2, p0, v1}, Landroidx/fragment/app/d0;->l(Lkotlin/jvm/internal/C;Ljava/lang/Class;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static final v(LSo/c;)LUo/j;
    .locals 3

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    instance-of v0, p0, LUo/j;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, LUo/j;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    return-object v0

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "This serializer can be used only with Json format.Expected Decoder to be JsonDecoder, got "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    sget-object v2, Lkotlin/jvm/internal/B;->a:Lkotlin/jvm/internal/C;

    invoke-static {v2, p0, v1}, Landroidx/fragment/app/d0;->l(Lkotlin/jvm/internal/C;Ljava/lang/Class;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static w(LIm/i;Ljava/util/Map$Entry;)Z
    .locals 1

    const-string v0, "element"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_0
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public static x(LRc/b;Lcom/eightsleep/data_core/enums/SystemStatusState;LVm/k;LVm/k;LLm/c;)Ljava/lang/Object;
    .locals 5

    instance-of v0, p4, Ljb/g;

    if-eqz v0, :cond_0

    move-object v0, p4

    check-cast v0, Ljb/g;

    iget v1, v0, Ljb/g;->d:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Ljb/g;->d:I

    goto :goto_0

    :cond_0
    new-instance v0, Ljb/g;

    invoke-direct {v0, p4}, LNm/c;-><init>(LLm/c;)V

    :goto_0
    iget-object p4, v0, Ljb/g;->c:Ljava/lang/Object;

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, v0, Ljb/g;->d:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    if-ne v2, v3, :cond_1

    iget-object p0, v0, Ljb/g;->b:LZa/q;

    iget-object p1, v0, Ljb/g;->a:LRc/b;

    invoke-static {p4}, LX4/x;->M(Ljava/lang/Object;)V

    move-object v4, p1

    move-object p1, p0

    move-object p0, v4

    goto :goto_1

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    invoke-static {p4}, LX4/x;->M(Ljava/lang/Object;)V

    invoke-interface {p2, p1}, LVm/k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, LZa/q;

    iput-object p0, v0, Ljb/g;->a:LRc/b;

    iput-object p1, v0, Ljb/g;->b:LZa/q;

    iput v3, v0, Ljb/g;->d:I

    invoke-interface {p3, v0}, LVm/k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    if-ne p4, v1, :cond_3

    return-object v1

    :cond_3
    :goto_1
    check-cast p4, Lzo/l;

    new-instance p2, LGc/h;

    const/16 p3, 0x8

    invoke-direct {p2, p4, p0, p1, p3}, LGc/h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    return-object p2
.end method

.method public static synthetic y(Ljb/h;LRc/b;Lcom/eightsleep/data_core/enums/SystemStatusState;LVm/k;LNm/i;)Ljava/lang/Object;
    .locals 6

    new-instance v3, Lcom/eightsleep/presentation_onboarding/viewmodel/pod5/e;

    const/16 v0, 0x12

    invoke-direct {v3, p0, v0}, Lcom/eightsleep/presentation_onboarding/viewmodel/pod5/e;-><init>(Ljava/lang/Object;I)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    invoke-interface/range {v0 .. v5}, Ljb/h;->b(LRc/b;Lcom/eightsleep/data_core/enums/SystemStatusState;Lcom/eightsleep/presentation_onboarding/viewmodel/pod5/e;LVm/k;LNm/i;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static z(Lcom/google/gson/o;)Lz7/i0;
    .locals 4

    const-string v0, "Unable to parse json into type Container"

    :try_start_0
    const-string v1, "view"

    invoke-virtual {p0, v1}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/gson/m;->h()Lcom/google/gson/o;

    move-result-object v1

    invoke-static {v1}, LP2/i;->v(Lcom/google/gson/o;)Lz7/j0;

    move-result-object v1

    sget-object v2, Lz7/B0;->Companion:Lz7/A0;

    const-string v3, "source"

    invoke-virtual {p0, v3}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/gson/m;->k()Ljava/lang/String;

    move-result-object p0

    const-string v3, "jsonObject.get(\"source\").asString"

    invoke-static {p0, v3}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Lz7/A0;->a(Ljava/lang/String;)Lz7/B0;

    move-result-object p0

    new-instance v2, Lz7/i0;

    invoke-direct {v2, v1, p0}, Lz7/i0;-><init>(Lz7/j0;Lz7/B0;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

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
