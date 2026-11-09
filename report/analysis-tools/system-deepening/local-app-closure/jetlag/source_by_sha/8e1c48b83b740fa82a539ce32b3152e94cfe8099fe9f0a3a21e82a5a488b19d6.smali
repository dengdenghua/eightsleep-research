.class public final Ljc/b;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public final synthetic a:Ljc/d;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljc/d;Ljava/lang/String;LLm/c;)V
    .locals 0

    iput-object p1, p0, Ljc/b;->a:Ljc/d;

    iput-object p2, p0, Ljc/b;->b:Ljava/lang/String;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 1

    new-instance p1, Ljc/b;

    iget-object v0, p0, Ljc/b;->a:Ljc/d;

    iget-object p0, p0, Ljc/b;->b:Ljava/lang/String;

    invoke-direct {p1, v0, p0, p2}, Ljc/b;-><init>(Ljc/d;Ljava/lang/String;LLm/c;)V

    return-object p1
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lwo/z;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Ljc/b;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Ljc/b;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Ljc/b;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 27

    move-object/from16 v0, p0

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    invoke-static/range {p1 .. p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object v1, v0, Ljc/b;->a:Ljc/d;

    iget-object v1, v1, Ljc/d;->a:Lkc/d;

    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v2

    if-eqz v2, :cond_0

    const-string v4, "db.sql.room"

    const-string v5, "com.eightsleep.data_jetlag.persistence.dao.JetLagPlanDao"

    invoke-interface {v2, v4, v5}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v2

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    const-string v4, "SELECT * FROM jet_lag_plan WHERE tripId = ?"

    const/4 v5, 0x1

    invoke-static {v5, v4}, LE4/A;->a(ILjava/lang/String;)LE4/A;

    move-result-object v4

    iget-object v0, v0, Ljc/b;->b:Ljava/lang/String;

    invoke-virtual {v4, v5, v0}, LE4/A;->g(ILjava/lang/String;)V

    iget-object v0, v1, Lkc/d;->a:Ljava/lang/Object;

    check-cast v0, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-virtual {v0}, LE4/t;->b()V

    invoke-static {v0, v4, v5}, La7/d;->W(LE4/t;LL4/e;Z)Landroid/database/Cursor;

    move-result-object v6

    :try_start_0
    const-string v0, "id"

    invoke-static {v6, v0}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    const-string v7, "userId"

    invoke-static {v6, v7}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    const-string v8, "tripId"

    invoke-static {v6, v8}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v8

    const-string v9, "direction"

    invoke-static {v6, v9}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v9

    const-string v10, "supplementsEnabled"

    invoke-static {v6, v10}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v10

    const-string v11, "createdAt"

    invoke-static {v6, v11}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v11

    const-string v12, "status"

    invoke-static {v6, v12}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v12

    const-string v13, "startDate"

    invoke-static {v6, v13}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v13

    const-string v14, "endDate"

    invoke-static {v6, v14}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v14

    new-instance v15, Lt/e;

    const/16 p1, 0x0

    const/4 v3, 0x0

    invoke-direct {v15, v3}, Lt/Q;-><init>(I)V

    :goto_1
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v16

    if-eqz v16, :cond_2

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v15, v3}, Lt/Q;->containsKey(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_1

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v15, v3, v5}, Lt/Q;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :catchall_0
    move-exception v0

    goto/16 :goto_5

    :cond_1
    :goto_2
    const/4 v3, 0x0

    const/4 v5, 0x1

    goto :goto_1

    :cond_2
    const/4 v3, -0x1

    invoke-interface {v6, v3}, Landroid/database/Cursor;->moveToPosition(I)Z

    invoke-virtual {v1, v15}, Lkc/d;->a(Lt/e;)V

    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v18

    invoke-interface {v6, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v19

    invoke-interface {v6, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-interface {v6, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lkc/d;->b()Ljc/a;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v3}, Ljc/a;->a(Ljava/lang/String;)Lcom/eightsleep/data_jetlag/enums/TravelDirection;

    move-result-object v21

    invoke-interface {v6, v10}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    if-eqz v3, :cond_3

    const/16 v22, 0x1

    goto :goto_3

    :cond_3
    const/16 v22, 0x0

    :goto_3
    invoke-interface {v6, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lkc/d;->c()Lxc/g;

    move-result-object v5

    invoke-virtual {v5, v3}, Lxc/g;->d(Ljava/lang/String;)Ljava/time/Instant;

    move-result-object v23

    if-eqz v23, :cond_6

    invoke-interface {v6, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v24

    invoke-interface {v6, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lkc/d;->c()Lxc/g;

    move-result-object v5

    invoke-virtual {v5, v3}, Lxc/g;->e(Ljava/lang/String;)Ljava/time/LocalDate;

    move-result-object v25
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v3, "Expected NON-NULL \'java.time.LocalDate\', but it was NULL."

    if-eqz v25, :cond_5

    :try_start_1
    invoke-interface {v6, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Lkc/d;->c()Lxc/g;

    move-result-object v1

    invoke-virtual {v1, v5}, Lxc/g;->e(Ljava/lang/String;)Ljava/time/LocalDate;

    move-result-object v26

    if-eqz v26, :cond_4

    new-instance v17, Llc/a;

    invoke-direct/range {v17 .. v26}, Llc/a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/TravelDirection;ZLjava/time/Instant;Ljava/lang/String;Ljava/time/LocalDate;Ljava/time/LocalDate;)V

    move-object/from16 v1, v17

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v15, v0}, Lt/Q;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    new-instance v3, Llc/d;

    invoke-direct {v3, v1, v0}, Llc/d;-><init>(Llc/a;Ljava/util/ArrayList;)V

    goto :goto_4

    :cond_4
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_6
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Expected NON-NULL \'java.time.Instant\', but it was NULL."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_7
    move-object/from16 v3, p1

    :goto_4
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    if-eqz v2, :cond_8

    invoke-interface {v2}, Lio/sentry/e0;->a()V

    :cond_8
    invoke-virtual {v4}, LE4/A;->release()V

    if-eqz v3, :cond_9

    invoke-virtual {v3}, Llc/d;->a()Lgc/j;

    move-result-object v0

    return-object v0

    :cond_9
    return-object p1

    :goto_5
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    if-eqz v2, :cond_a

    invoke-interface {v2}, Lio/sentry/e0;->a()V

    :cond_a
    invoke-virtual {v4}, LE4/A;->release()V

    throw v0
.end method
