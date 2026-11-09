.class public final Laa/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    iput p1, p0, Laa/e;->a:I

    iput-object p2, p0, Laa/e;->b:Ljava/lang/Object;

    iput-object p3, p0, Laa/e;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a()Ljava/lang/Object;
    .locals 3

    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "db.sql.room"

    const-string v2, "com.eightsleep.data_device.persistence.dao.DeviceDao"

    invoke-interface {v0, v1, v2}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Laa/e;->b:Ljava/lang/Object;

    check-cast v1, Lx6/e;

    iget-object v2, v1, Lx6/e;->a:Ljava/lang/Object;

    check-cast v2, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-virtual {v2}, LE4/t;->c()V

    :try_start_0
    iget-object v1, v1, Lx6/e;->l:Ljava/lang/Object;

    check-cast v1, Lf5/b;

    iget-object p0, p0, Laa/e;->c:Ljava/lang/Object;

    check-cast p0, Lmb/o;

    invoke-virtual {v1, p0}, Lf5/b;->P(Ljava/lang/Object;)V

    invoke-virtual {v2}, LE4/t;->q()V

    if-eqz v0, :cond_1

    sget-object p0, Lio/sentry/A2;->OK:Lio/sentry/A2;

    invoke-interface {v0, p0}, Lio/sentry/e0;->b(Lio/sentry/A2;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_2

    :cond_1
    :goto_1
    invoke-virtual {v2}, LE4/t;->k()V

    if-eqz v0, :cond_2

    invoke-interface {v0}, Lio/sentry/e0;->a()V

    :cond_2
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0

    :goto_2
    invoke-virtual {v2}, LE4/t;->k()V

    if-eqz v0, :cond_3

    invoke-interface {v0}, Lio/sentry/e0;->a()V

    :cond_3
    throw p0
.end method

.method private final b()Ljava/lang/Object;
    .locals 3

    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "db.sql.room"

    const-string v2, "com.eightsleep.data_device.persistence.dao.DeviceDao"

    invoke-interface {v0, v1, v2}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Laa/e;->b:Ljava/lang/Object;

    check-cast v1, Lx6/e;

    iget-object v2, v1, Lx6/e;->a:Ljava/lang/Object;

    check-cast v2, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-virtual {v2}, LE4/t;->c()V

    :try_start_0
    iget-object v1, v1, Lx6/e;->m:Ljava/lang/Object;

    check-cast v1, Lf5/b;

    iget-object p0, p0, Laa/e;->c:Ljava/lang/Object;

    check-cast p0, Lmb/p;

    invoke-virtual {v1, p0}, Lf5/b;->P(Ljava/lang/Object;)V

    invoke-virtual {v2}, LE4/t;->q()V

    if-eqz v0, :cond_1

    sget-object p0, Lio/sentry/A2;->OK:Lio/sentry/A2;

    invoke-interface {v0, p0}, Lio/sentry/e0;->b(Lio/sentry/A2;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_2

    :cond_1
    :goto_1
    invoke-virtual {v2}, LE4/t;->k()V

    if-eqz v0, :cond_2

    invoke-interface {v0}, Lio/sentry/e0;->a()V

    :cond_2
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0

    :goto_2
    invoke-virtual {v2}, LE4/t;->k()V

    if-eqz v0, :cond_3

    invoke-interface {v0}, Lio/sentry/e0;->a()V

    :cond_3
    throw p0
.end method

.method private final c()Ljava/lang/Object;
    .locals 5

    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "db.sql.room"

    const-string v2, "com.eightsleep.data_device.persistence.dao.OfflineModeDataDao"

    invoke-interface {v0, v1, v2}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Laa/e;->b:Ljava/lang/Object;

    check-cast v1, Llb/o;

    iget-object v2, v1, Llb/o;->a:Ljava/lang/Object;

    check-cast v2, Lcom/eightsleep/eight/AppDatabase_Impl;

    iget-object v1, v1, Llb/o;->b:Ljava/lang/Object;

    check-cast v1, Lf5/p;

    invoke-virtual {v1}, LE4/C;->a()LL4/f;

    move-result-object v3

    const/4 v4, 0x1

    iget-object p0, p0, Laa/e;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-interface {v3, v4, p0}, LL4/d;->g(ILjava/lang/String;)V

    :try_start_0
    invoke-virtual {v2}, LE4/t;->c()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-interface {v3}, LL4/f;->o()I

    invoke-virtual {v2}, LE4/t;->q()V

    if-eqz v0, :cond_1

    sget-object p0, Lio/sentry/A2;->OK:Lio/sentry/A2;

    invoke-interface {v0, p0}, Lio/sentry/e0;->b(Lio/sentry/A2;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_3

    :cond_1
    :goto_1
    :try_start_2
    invoke-virtual {v2}, LE4/t;->k()V

    if-eqz v0, :cond_2

    invoke-interface {v0}, Lio/sentry/e0;->a()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception p0

    goto :goto_4

    :cond_2
    :goto_2
    invoke-virtual {v1, v3}, LE4/C;->u(LL4/f;)V

    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0

    :goto_3
    :try_start_3
    invoke-virtual {v2}, LE4/t;->k()V

    if-eqz v0, :cond_3

    invoke-interface {v0}, Lio/sentry/e0;->a()V

    :cond_3
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :goto_4
    invoke-virtual {v1, v3}, LE4/C;->u(LL4/f;)V

    throw p0
.end method

.method private final d()Ljava/lang/Object;
    .locals 3

    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "db.sql.room"

    const-string v2, "com.eightsleep.data_device.persistence.dao.OfflineModeDataDao"

    invoke-interface {v0, v1, v2}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Laa/e;->b:Ljava/lang/Object;

    check-cast v1, Llb/o;

    iget-object v2, v1, Llb/o;->a:Ljava/lang/Object;

    check-cast v2, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-virtual {v2}, LE4/t;->c()V

    :try_start_0
    iget-object v1, v1, Llb/o;->c:Ljava/lang/Object;

    check-cast v1, Lf5/b;

    iget-object p0, p0, Laa/e;->c:Ljava/lang/Object;

    check-cast p0, Lmb/l;

    invoke-virtual {v1, p0}, Lf5/b;->P(Ljava/lang/Object;)V

    invoke-virtual {v2}, LE4/t;->q()V

    if-eqz v0, :cond_1

    sget-object p0, Lio/sentry/A2;->OK:Lio/sentry/A2;

    invoke-interface {v0, p0}, Lio/sentry/e0;->b(Lio/sentry/A2;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_2

    :cond_1
    :goto_1
    invoke-virtual {v2}, LE4/t;->k()V

    if-eqz v0, :cond_2

    invoke-interface {v0}, Lio/sentry/e0;->a()V

    :cond_2
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0

    :goto_2
    invoke-virtual {v2}, LE4/t;->k()V

    if-eqz v0, :cond_3

    invoke-interface {v0}, Lio/sentry/e0;->a()V

    :cond_3
    throw p0
.end method

.method private final e()Ljava/lang/Object;
    .locals 3

    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "db.sql.room"

    const-string v2, "com.eightsleep.data_alarm.persistence.dao.AlarmDao"

    invoke-interface {v0, v1, v2}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Laa/e;->b:Ljava/lang/Object;

    check-cast v1, Lo9/e;

    iget-object v2, v1, Lo9/e;->a:Ljava/lang/Object;

    check-cast v2, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-virtual {v2}, LE4/t;->c()V

    :try_start_0
    iget-object v1, v1, Lo9/e;->f:Ljava/lang/Object;

    check-cast v1, Lf5/b;

    iget-object p0, p0, Laa/e;->c:Ljava/lang/Object;

    check-cast p0, Lp9/a;

    invoke-virtual {v1, p0}, Lf5/b;->P(Ljava/lang/Object;)V

    invoke-virtual {v2}, LE4/t;->q()V

    if-eqz v0, :cond_1

    sget-object p0, Lio/sentry/A2;->OK:Lio/sentry/A2;

    invoke-interface {v0, p0}, Lio/sentry/e0;->b(Lio/sentry/A2;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_2

    :cond_1
    :goto_1
    invoke-virtual {v2}, LE4/t;->k()V

    if-eqz v0, :cond_2

    invoke-interface {v0}, Lio/sentry/e0;->a()V

    :cond_2
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0

    :goto_2
    invoke-virtual {v2}, LE4/t;->k()V

    if-eqz v0, :cond_3

    invoke-interface {v0}, Lio/sentry/e0;->a()V

    :cond_3
    throw p0
.end method

.method private final f()Ljava/lang/Object;
    .locals 3

    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "db.sql.room"

    const-string v2, "com.eightsleep.data_alarm.persistence.dao.AlarmDao"

    invoke-interface {v0, v1, v2}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Laa/e;->b:Ljava/lang/Object;

    check-cast v1, Lo9/e;

    iget-object v2, v1, Lo9/e;->a:Ljava/lang/Object;

    check-cast v2, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-virtual {v2}, LE4/t;->c()V

    :try_start_0
    iget-object v1, v1, Lo9/e;->b:Ljava/lang/Object;

    check-cast v1, Lo9/d;

    iget-object p0, p0, Laa/e;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    invoke-virtual {v1, p0}, LE4/i;->z(Ljava/lang/Iterable;)V

    invoke-virtual {v2}, LE4/t;->q()V

    if-eqz v0, :cond_1

    sget-object p0, Lio/sentry/A2;->OK:Lio/sentry/A2;

    invoke-interface {v0, p0}, Lio/sentry/e0;->b(Lio/sentry/A2;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_2

    :cond_1
    :goto_1
    invoke-virtual {v2}, LE4/t;->k()V

    if-eqz v0, :cond_2

    invoke-interface {v0}, Lio/sentry/e0;->a()V

    :cond_2
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0

    :goto_2
    invoke-virtual {v2}, LE4/t;->k()V

    if-eqz v0, :cond_3

    invoke-interface {v0}, Lio/sentry/e0;->a()V

    :cond_3
    throw p0
.end method

.method private final g()Ljava/lang/Object;
    .locals 20

    move-object/from16 v0, p0

    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    const-string v3, "db.sql.room"

    const-string v4, "com.eightsleep.data_alarm.persistence.dao.NapModeAlarmSettingsDao"

    invoke-interface {v1, v3, v4}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v2

    :goto_0
    iget-object v3, v0, Laa/e;->b:Ljava/lang/Object;

    check-cast v3, Lo9/h;

    iget-object v3, v3, Lo9/h;->b:Ljava/lang/Object;

    check-cast v3, Lcom/eightsleep/eight/AppDatabase_Impl;

    iget-object v0, v0, Laa/e;->c:Ljava/lang/Object;

    check-cast v0, LE4/A;

    const/4 v4, 0x0

    invoke-static {v3, v0, v4}, La7/d;->W(LE4/t;LL4/e;Z)Landroid/database/Cursor;

    move-result-object v3

    :try_start_0
    const-string v0, "user_id"

    invoke-static {v3, v0}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    const-string v5, "vibration_power"

    invoke-static {v3, v5}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v5

    const-string v6, "vibration_pattern"

    invoke-static {v3, v6}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    const-string v7, "vibration_enabled"

    invoke-static {v3, v7}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    const-string v8, "audio_track_id"

    invoke-static {v3, v8}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v8

    const-string v9, "audio_enabled"

    invoke-static {v3, v9}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v9

    const-string v10, "audio_volume"

    invoke-static {v3, v10}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v10

    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v11

    if-eqz v11, :cond_5

    invoke-interface {v3, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, LX4/a;->h(Ljava/lang/String;)Lcom/eightsleep/data_alarm/enums/VibrationPower;

    move-result-object v14

    invoke-interface {v3, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, LX4/a;->g(Ljava/lang/String;)Lcom/eightsleep/data_alarm/enums/VibrationPattern;

    move-result-object v15

    invoke-interface {v3, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    const/4 v5, 0x1

    if-eqz v0, :cond_1

    move/from16 v16, v5

    goto :goto_1

    :cond_1
    move/from16 v16, v4

    :goto_1
    invoke-interface {v3, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_2

    move-object/from16 v17, v2

    goto :goto_2

    :cond_2
    invoke-interface {v3, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    move-object/from16 v17, v0

    :goto_2
    invoke-interface {v3, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-eqz v0, :cond_3

    move/from16 v18, v5

    goto :goto_3

    :cond_3
    move/from16 v18, v4

    :goto_3
    invoke-interface {v3, v10}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_4

    :goto_4
    move-object/from16 v19, v2

    goto :goto_5

    :cond_4
    invoke-interface {v3, v10}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_4

    :goto_5
    new-instance v12, Lp9/d;

    invoke-direct/range {v12 .. v19}, Lp9/d;-><init>(Ljava/lang/String;Lcom/eightsleep/data_alarm/enums/VibrationPower;Lcom/eightsleep/data_alarm/enums/VibrationPattern;ZLjava/lang/String;ZLjava/lang/Integer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v2, v12

    goto :goto_6

    :catchall_0
    move-exception v0

    goto :goto_7

    :cond_5
    :goto_6
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    if-eqz v1, :cond_6

    invoke-interface {v1}, Lio/sentry/e0;->a()V

    :cond_6
    return-object v2

    :goto_7
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    if-eqz v1, :cond_7

    invoke-interface {v1}, Lio/sentry/e0;->a()V

    :cond_7
    throw v0
.end method

.method private final h()Ljava/lang/Object;
    .locals 3

    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "db.sql.room"

    const-string v2, "com.eightsleep.data_alarm.persistence.dao.NapModeAlarmSettingsDao"

    invoke-interface {v0, v1, v2}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Laa/e;->b:Ljava/lang/Object;

    check-cast v1, Lo9/h;

    iget-object v2, v1, Lo9/h;->b:Ljava/lang/Object;

    check-cast v2, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-virtual {v2}, LE4/t;->c()V

    :try_start_0
    iget-object v1, v1, Lo9/h;->d:Ljava/lang/Object;

    check-cast v1, Lf5/b;

    iget-object p0, p0, Laa/e;->c:Ljava/lang/Object;

    check-cast p0, Lp9/d;

    invoke-virtual {v1, p0}, Lf5/b;->P(Ljava/lang/Object;)V

    invoke-virtual {v2}, LE4/t;->q()V

    if-eqz v0, :cond_1

    sget-object p0, Lio/sentry/A2;->OK:Lio/sentry/A2;

    invoke-interface {v0, p0}, Lio/sentry/e0;->b(Lio/sentry/A2;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_2

    :cond_1
    :goto_1
    invoke-virtual {v2}, LE4/t;->k()V

    if-eqz v0, :cond_2

    invoke-interface {v0}, Lio/sentry/e0;->a()V

    :cond_2
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0

    :goto_2
    invoke-virtual {v2}, LE4/t;->k()V

    if-eqz v0, :cond_3

    invoke-interface {v0}, Lio/sentry/e0;->a()V

    :cond_3
    throw p0
.end method

.method private final i()Ljava/lang/Object;
    .locals 9

    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string v2, "db.sql.room"

    const-string v3, "com.eightsleep.data_temperature.persistence.dao.HotFlashModeSettingsDao"

    invoke-interface {v0, v2, v3}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    iget-object v2, p0, Laa/e;->b:Ljava/lang/Object;

    check-cast v2, Lqd/a;

    iget-object v3, v2, Lqd/a;->a:Ljava/lang/Object;

    check-cast v3, Lcom/eightsleep/eight/AppDatabase_Impl;

    iget-object p0, p0, Laa/e;->c:Ljava/lang/Object;

    check-cast p0, LE4/A;

    const/4 v4, 0x0

    invoke-static {v3, p0, v4}, La7/d;->W(LE4/t;LL4/e;Z)Landroid/database/Cursor;

    move-result-object p0

    :try_start_0
    const-string v3, "user_id"

    invoke-static {p0, v3}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v3

    const-string v5, "enabled"

    invoke-static {p0, v5}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v5

    const-string v6, "duration"

    invoke-static {p0, v6}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    const-string v7, "level_delta"

    invoke-static {p0, v7}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {p0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    if-eqz v3, :cond_1

    const/4 v4, 0x1

    :cond_1
    invoke-interface {p0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2}, Lqd/a;->a(Lqd/a;)Lxc/g;

    move-result-object v2

    invoke-virtual {v2, v3}, Lxc/g;->f(Ljava/lang/String;)Ljava/time/LocalTime;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-interface {p0, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    new-instance v5, Lrd/c;

    invoke-direct {v5, v1, v4, v2, v3}, Lrd/c;-><init>(Ljava/lang/String;ZLjava/time/LocalTime;I)V

    move-object v1, v5

    goto :goto_1

    :catchall_0
    move-exception v1

    goto :goto_2

    :cond_2
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Expected NON-NULL \'java.time.LocalTime\', but it was NULL."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_3
    :goto_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    if-eqz v0, :cond_4

    invoke-interface {v0}, Lio/sentry/e0;->a()V

    :cond_4
    return-object v1

    :goto_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    if-eqz v0, :cond_5

    invoke-interface {v0}, Lio/sentry/e0;->a()V

    :cond_5
    throw v1
.end method

.method private final j()Ljava/lang/Object;
    .locals 5

    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "db.sql.room"

    const-string v2, "com.eightsleep.data_temperature.persistence.dao.HotFlashModeSettingsDao"

    invoke-interface {v0, v1, v2}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Laa/e;->b:Ljava/lang/Object;

    check-cast v1, Lqd/a;

    iget-object v2, v1, Lqd/a;->b:Ljava/lang/Object;

    check-cast v2, Lo9/g;

    iget-object v1, v1, Lqd/a;->a:Ljava/lang/Object;

    check-cast v1, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-virtual {v2}, LE4/C;->a()LL4/f;

    move-result-object v3

    const/4 v4, 0x1

    iget-object p0, p0, Laa/e;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-interface {v3, v4, p0}, LL4/d;->g(ILjava/lang/String;)V

    :try_start_0
    invoke-virtual {v1}, LE4/t;->c()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-interface {v3}, LL4/f;->o()I

    invoke-virtual {v1}, LE4/t;->q()V

    if-eqz v0, :cond_1

    sget-object p0, Lio/sentry/A2;->OK:Lio/sentry/A2;

    invoke-interface {v0, p0}, Lio/sentry/e0;->b(Lio/sentry/A2;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_3

    :cond_1
    :goto_1
    :try_start_2
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v0, :cond_2

    invoke-interface {v0}, Lio/sentry/e0;->a()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception p0

    goto :goto_4

    :cond_2
    :goto_2
    invoke-virtual {v2, v3}, LE4/C;->u(LL4/f;)V

    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0

    :goto_3
    :try_start_3
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v0, :cond_3

    invoke-interface {v0}, Lio/sentry/e0;->a()V

    :cond_3
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :goto_4
    invoke-virtual {v2, v3}, LE4/C;->u(LL4/f;)V

    throw p0
.end method

.method private final k()Ljava/lang/Object;
    .locals 3

    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "db.sql.room"

    const-string v2, "com.eightsleep.data_temperature.persistence.dao.HotFlashModeSettingsDao"

    invoke-interface {v0, v1, v2}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Laa/e;->b:Ljava/lang/Object;

    check-cast v1, Lqd/a;

    iget-object v2, v1, Lqd/a;->a:Ljava/lang/Object;

    check-cast v2, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-virtual {v2}, LE4/t;->c()V

    :try_start_0
    iget-object v1, v1, Lqd/a;->c:Ljava/lang/Object;

    check-cast v1, Lf5/b;

    iget-object p0, p0, Laa/e;->c:Ljava/lang/Object;

    check-cast p0, Lrd/c;

    invoke-virtual {v1, p0}, Lf5/b;->P(Ljava/lang/Object;)V

    invoke-virtual {v2}, LE4/t;->q()V

    if-eqz v0, :cond_1

    sget-object p0, Lio/sentry/A2;->OK:Lio/sentry/A2;

    invoke-interface {v0, p0}, Lio/sentry/e0;->b(Lio/sentry/A2;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_2

    :cond_1
    :goto_1
    invoke-virtual {v2}, LE4/t;->k()V

    if-eqz v0, :cond_2

    invoke-interface {v0}, Lio/sentry/e0;->a()V

    :cond_2
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0

    :goto_2
    invoke-virtual {v2}, LE4/t;->k()V

    if-eqz v0, :cond_3

    invoke-interface {v0}, Lio/sentry/e0;->a()V

    :cond_3
    throw p0
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 28

    move-object/from16 v0, p0

    const-string v1, "com.eightsleep.data_bedtime.persistence.dao.RecommendedBedtimeDao"

    const-string v2, "com.eightsleep.data_remoteconfig.persistence.dao.FeatureFlagOverrideDao"

    const-string v3, "com.eightsleep.data_jetlag.persistence.dao.JetLagPlanDao"

    const-string v4, "Expected NON-NULL \'java.time.LocalTime\', but it was NULL."

    const-string v5, "com.eightsleep.data_ai_insights.persistence.dao.AiInsightsSettingsDao"

    const-string v6, "user_id"

    const-string v7, "com.eightsleep.data_ai_insights.persistence.dao.AiInsightsDao"

    const/4 v8, 0x0

    const/4 v9, 0x1

    sget-object v10, LHm/B;->a:LHm/B;

    iget-object v11, v0, Laa/e;->c:Ljava/lang/Object;

    iget-object v12, v0, Laa/e;->b:Ljava/lang/Object;

    const-string v13, "db.sql.room"

    iget v15, v0, Laa/e;->a:I

    packed-switch v15, :pswitch_data_0

    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "com.eightsleep.data_temperature.persistence.dao.NapModeSettingsDao"

    invoke-interface {v0, v13, v1}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v0

    move-object v1, v0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    check-cast v12, Lqd/d;

    iget-object v0, v12, Lqd/d;->a:Ljava/lang/Object;

    check-cast v0, Lcom/eightsleep/eight/AppDatabase_Impl;

    check-cast v11, LE4/A;

    invoke-static {v0, v11, v8}, La7/d;->W(LE4/t;LL4/e;Z)Landroid/database/Cursor;

    move-result-object v2

    :try_start_0
    invoke-static {v2, v6}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    const-string v3, "pod_level"

    invoke-static {v2, v3}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v3

    const-string v5, "pillow_level"

    invoke-static {v2, v5}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v5

    const-string v6, "duration"

    invoke-static {v2, v6}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-interface {v2, v5}, Landroid/database/Cursor;->isNull(I)Z

    move-result v7

    if-eqz v7, :cond_1

    const/4 v14, 0x0

    goto :goto_1

    :cond_1
    invoke-interface {v2, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    :goto_1
    invoke-interface {v2, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v12}, Lqd/d;->a(Lqd/d;)Lxc/g;

    move-result-object v6

    invoke-virtual {v6, v5}, Lxc/g;->f(Ljava/lang/String;)Ljava/time/LocalTime;

    move-result-object v5

    if-eqz v5, :cond_2

    new-instance v4, Lrd/f;

    invoke-direct {v4, v0, v3, v14, v5}, Lrd/f;-><init>(Ljava/lang/String;ILjava/lang/Integer;Ljava/time/LocalTime;)V

    move-object v14, v4

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_3

    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_3
    const/4 v14, 0x0

    :goto_2
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    if-eqz v1, :cond_4

    invoke-interface {v1}, Lio/sentry/e0;->a()V

    :cond_4
    return-object v14

    :goto_3
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    if-eqz v1, :cond_5

    invoke-interface {v1}, Lio/sentry/e0;->a()V

    :cond_5
    throw v0

    :pswitch_0
    invoke-direct {v0}, Laa/e;->k()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_1
    invoke-direct {v0}, Laa/e;->j()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_2
    invoke-direct {v0}, Laa/e;->i()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_3
    invoke-direct {v0}, Laa/e;->h()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_4
    invoke-direct {v0}, Laa/e;->g()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_5
    invoke-direct {v0}, Laa/e;->f()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_6
    invoke-direct {v0}, Laa/e;->e()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_7
    invoke-direct {v0}, Laa/e;->d()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_8
    invoke-direct {v0}, Laa/e;->c()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_9
    invoke-direct {v0}, Laa/e;->b()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_a
    invoke-direct {v0}, Laa/e;->a()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_b
    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_6

    const-string v1, "com.eightsleep.data_device.persistence.dao.DeviceDao"

    invoke-interface {v0, v13, v1}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v14

    goto :goto_4

    :cond_6
    const/4 v14, 0x0

    :goto_4
    check-cast v12, Lx6/e;

    iget-object v0, v12, Lx6/e;->a:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-virtual {v1}, LE4/t;->c()V

    :try_start_1
    iget-object v0, v12, Lx6/e;->f:Ljava/lang/Object;

    check-cast v0, Lf5/b;

    check-cast v11, Lmb/e;

    invoke-virtual {v0, v11}, Lf5/b;->P(Ljava/lang/Object;)V

    invoke-virtual {v1}, LE4/t;->q()V

    if-eqz v14, :cond_7

    sget-object v0, Lio/sentry/A2;->OK:Lio/sentry/A2;

    invoke-interface {v14, v0}, Lio/sentry/e0;->b(Lio/sentry/A2;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_5

    :catchall_1
    move-exception v0

    goto :goto_6

    :cond_7
    :goto_5
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_8

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_8
    return-object v10

    :goto_6
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_9

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_9
    throw v0

    :pswitch_c
    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_a

    const-string v1, "com.eightsleep.data_jetlag.persistence.dao.TripDao"

    invoke-interface {v0, v13, v1}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v14

    goto :goto_7

    :cond_a
    const/4 v14, 0x0

    :goto_7
    const-string v0, "DELETE FROM trip_leg WHERE trip_id IN ("

    invoke-static {v0}, Lj/m;->r(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    check-cast v11, Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {v1, v0}, Landroidx/room/migration/bundle/a;->r(ILjava/lang/StringBuilder;)V

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    check-cast v12, Lkc/i;

    iget-object v1, v12, Lkc/i;->a:Lcom/eightsleep/eight/AppDatabase_Impl;

    const-string v2, "sql"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1}, LE4/t;->a()V

    invoke-virtual {v1}, LE4/t;->b()V

    invoke-virtual {v1}, LE4/t;->h()LL4/c;

    move-result-object v1

    invoke-interface {v1}, LL4/c;->I()LL4/a;

    move-result-object v1

    invoke-interface {v1, v0}, LL4/a;->p(Ljava/lang/String;)LL4/f;

    move-result-object v0

    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move v2, v9

    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0, v2, v3}, LL4/d;->g(ILjava/lang/String;)V

    add-int/2addr v2, v9

    goto :goto_8

    :cond_b
    iget-object v1, v12, Lkc/i;->a:Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-virtual {v1}, LE4/t;->c()V

    :try_start_2
    invoke-interface {v0}, LL4/f;->o()I

    invoke-virtual {v1}, LE4/t;->q()V

    if-eqz v14, :cond_c

    sget-object v0, Lio/sentry/A2;->OK:Lio/sentry/A2;

    invoke-interface {v14, v0}, Lio/sentry/e0;->b(Lio/sentry/A2;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_9

    :catchall_2
    move-exception v0

    goto :goto_a

    :cond_c
    :goto_9
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_d

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_d
    return-object v10

    :goto_a
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_e

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_e
    throw v0

    :pswitch_d
    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_f

    invoke-interface {v0, v13, v3}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v14

    goto :goto_b

    :cond_f
    const/4 v14, 0x0

    :goto_b
    check-cast v12, Lkc/d;

    iget-object v0, v12, Lkc/d;->a:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-virtual {v1}, LE4/t;->c()V

    :try_start_3
    iget-object v0, v12, Lkc/d;->b:Ljava/lang/Object;

    check-cast v0, Lkc/c;

    check-cast v11, Llc/a;

    invoke-virtual {v0, v11}, LE4/i;->A(Ljava/lang/Object;)V

    invoke-virtual {v1}, LE4/t;->q()V

    if-eqz v14, :cond_10

    sget-object v0, Lio/sentry/A2;->OK:Lio/sentry/A2;

    invoke-interface {v14, v0}, Lio/sentry/e0;->b(Lio/sentry/A2;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    goto :goto_c

    :catchall_3
    move-exception v0

    goto :goto_d

    :cond_10
    :goto_c
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_11

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_11
    return-object v10

    :goto_d
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_12

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_12
    throw v0

    :pswitch_e
    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_13

    invoke-interface {v0, v13, v3}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v0

    move-object v1, v0

    goto :goto_e

    :cond_13
    const/4 v1, 0x0

    :goto_e
    check-cast v12, Lkc/d;

    iget-object v0, v12, Lkc/d;->a:Ljava/lang/Object;

    check-cast v0, Lcom/eightsleep/eight/AppDatabase_Impl;

    check-cast v11, LE4/A;

    invoke-static {v0, v11, v9}, La7/d;->W(LE4/t;LL4/e;Z)Landroid/database/Cursor;

    move-result-object v2

    :try_start_4
    const-string v0, "id"

    invoke-static {v2, v0}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    const-string v3, "userId"

    invoke-static {v2, v3}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v3

    const-string v4, "tripId"

    invoke-static {v2, v4}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    const-string v5, "direction"

    invoke-static {v2, v5}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v5

    const-string v6, "supplementsEnabled"

    invoke-static {v2, v6}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    const-string v7, "createdAt"

    invoke-static {v2, v7}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    const-string v10, "status"

    invoke-static {v2, v10}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v10

    const-string v11, "startDate"

    invoke-static {v2, v11}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v11

    const-string v13, "endDate"

    invoke-static {v2, v13}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v13

    new-instance v15, Lt/e;

    invoke-direct {v15, v8}, Lt/Q;-><init>(I)V

    :goto_f
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v16

    if-eqz v16, :cond_15

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v15, v14}, Lt/Q;->containsKey(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_14

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v15, v14, v9}, Lt/Q;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_10

    :catchall_4
    move-exception v0

    goto/16 :goto_13

    :cond_14
    :goto_10
    const/4 v9, 0x1

    goto :goto_f

    :cond_15
    const/4 v9, -0x1

    invoke-interface {v2, v9}, Landroid/database/Cursor;->moveToPosition(I)Z

    invoke-virtual {v12, v15}, Lkc/d;->a(Lt/e;)V

    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v9

    if-eqz v9, :cond_1a

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v19

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v21

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12}, Lkc/d;->b()Ljc/a;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v3}, Ljc/a;->a(Ljava/lang/String;)Lcom/eightsleep/data_jetlag/enums/TravelDirection;

    move-result-object v22

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    if-eqz v3, :cond_16

    const/16 v23, 0x1

    goto :goto_11

    :cond_16
    move/from16 v23, v8

    :goto_11
    invoke-interface {v2, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12}, Lkc/d;->c()Lxc/g;

    move-result-object v4

    invoke-virtual {v4, v3}, Lxc/g;->d(Ljava/lang/String;)Ljava/time/Instant;

    move-result-object v24

    if-eqz v24, :cond_19

    invoke-interface {v2, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v25

    invoke-interface {v2, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12}, Lkc/d;->c()Lxc/g;

    move-result-object v4

    invoke-virtual {v4, v3}, Lxc/g;->e(Ljava/lang/String;)Ljava/time/LocalDate;

    move-result-object v26
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    const-string v3, "Expected NON-NULL \'java.time.LocalDate\', but it was NULL."

    if-eqz v26, :cond_18

    :try_start_5
    invoke-interface {v2, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v12}, Lkc/d;->c()Lxc/g;

    move-result-object v5

    invoke-virtual {v5, v4}, Lxc/g;->e(Ljava/lang/String;)Ljava/time/LocalDate;

    move-result-object v27

    if-eqz v27, :cond_17

    new-instance v18, Llc/a;

    invoke-direct/range {v18 .. v27}, Llc/a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/TravelDirection;ZLjava/time/Instant;Ljava/lang/String;Ljava/time/LocalDate;Ljava/time/LocalDate;)V

    move-object/from16 v3, v18

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v15, v0}, Lt/Q;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    new-instance v14, Llc/d;

    invoke-direct {v14, v3, v0}, Llc/d;-><init>(Llc/a;Ljava/util/ArrayList;)V

    goto :goto_12

    :cond_17
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_18
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_19
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v3, "Expected NON-NULL \'java.time.Instant\', but it was NULL."

    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    :cond_1a
    const/4 v14, 0x0

    :goto_12
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    if-eqz v1, :cond_1b

    invoke-interface {v1}, Lio/sentry/e0;->a()V

    :cond_1b
    return-object v14

    :goto_13
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    if-eqz v1, :cond_1c

    invoke-interface {v1}, Lio/sentry/e0;->a()V

    :cond_1c
    throw v0

    :pswitch_f
    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_1d

    invoke-interface {v0, v13, v5}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v0

    move-object v1, v0

    goto :goto_14

    :cond_1d
    const/4 v1, 0x0

    :goto_14
    check-cast v12, Lf9/e;

    iget-object v0, v12, Lf9/e;->a:Ljava/lang/Object;

    check-cast v0, Lcom/eightsleep/eight/AppDatabase_Impl;

    check-cast v11, LE4/A;

    invoke-static {v0, v11, v8}, La7/d;->W(LE4/t;LL4/e;Z)Landroid/database/Cursor;

    move-result-object v2

    :try_start_6
    invoke-static {v2, v6}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    const-string v3, "priority_metrics_list"

    invoke-static {v2, v3}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v3

    const-string v4, "length"

    invoke-static {v2, v4}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    const-string v5, "tone"

    invoke-static {v2, v5}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v5

    const-string v6, "last_updated"

    invoke-static {v2, v6}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v7

    if-eqz v7, :cond_24

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v18

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v12}, Lf9/e;->c()Le9/a;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Le9/a;->a(Ljava/lang/String;)Ljava/util/List;

    move-result-object v19

    invoke-interface {v2, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_5

    const-string v3, "Can\'t convert value to enum, unknown value: "

    if-eqz v0, :cond_1e

    const/16 v20, 0x0

    goto :goto_16

    :cond_1e
    :try_start_7
    invoke-interface {v2, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    const-string v4, "LONG"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_20

    const-string v4, "SHORT"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1f

    :try_start_8
    sget-object v0, Lcom/eightsleep/data_ai_insights/enums/AiInsightLength;->SHORT:Lcom/eightsleep/data_ai_insights/enums/AiInsightLength;

    goto :goto_15

    :cond_1f
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    :cond_20
    sget-object v0, Lcom/eightsleep/data_ai_insights/enums/AiInsightLength;->LONG:Lcom/eightsleep/data_ai_insights/enums/AiInsightLength;

    :goto_15
    move-object/from16 v20, v0

    :goto_16
    invoke-interface {v2, v5}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_21

    const/16 v21, 0x0

    goto :goto_19

    :cond_21
    invoke-interface {v2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    const-string v4, "COACH"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_23

    const-string v4, "DIRECT"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_22

    :try_start_9
    sget-object v0, Lcom/eightsleep/data_ai_insights/enums/AiInsightTone;->DIRECT:Lcom/eightsleep/data_ai_insights/enums/AiInsightTone;

    :goto_17
    move-object v14, v0

    goto :goto_18

    :cond_22
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    :cond_23
    sget-object v0, Lcom/eightsleep/data_ai_insights/enums/AiInsightTone;->COACH:Lcom/eightsleep/data_ai_insights/enums/AiInsightTone;

    goto :goto_17

    :goto_18
    move-object/from16 v21, v14

    :goto_19
    invoke-interface {v2, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v22

    new-instance v17, Lg9/s;

    invoke-direct/range {v17 .. v23}, Lg9/s;-><init>(Ljava/lang/String;Ljava/util/List;Lcom/eightsleep/data_ai_insights/enums/AiInsightLength;Lcom/eightsleep/data_ai_insights/enums/AiInsightTone;J)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    move-object/from16 v14, v17

    goto :goto_1a

    :catchall_5
    move-exception v0

    goto :goto_1b

    :cond_24
    const/4 v14, 0x0

    :goto_1a
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    if-eqz v1, :cond_25

    invoke-interface {v1}, Lio/sentry/e0;->a()V

    :cond_25
    return-object v14

    :goto_1b
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    if-eqz v1, :cond_26

    invoke-interface {v1}, Lio/sentry/e0;->a()V

    :cond_26
    throw v0

    :pswitch_10
    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_27

    invoke-interface {v0, v13, v5}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v14

    goto :goto_1c

    :cond_27
    const/4 v14, 0x0

    :goto_1c
    check-cast v12, Lf9/e;

    iget-object v0, v12, Lf9/e;->a:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-virtual {v1}, LE4/t;->c()V

    :try_start_a
    iget-object v0, v12, Lf9/e;->d:Ljava/lang/Object;

    check-cast v0, Lf5/b;

    check-cast v11, Lg9/s;

    invoke-virtual {v0, v11}, Lf5/b;->P(Ljava/lang/Object;)V

    invoke-virtual {v1}, LE4/t;->q()V

    if-eqz v14, :cond_28

    sget-object v0, Lio/sentry/A2;->OK:Lio/sentry/A2;

    invoke-interface {v14, v0}, Lio/sentry/e0;->b(Lio/sentry/A2;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    goto :goto_1d

    :catchall_6
    move-exception v0

    goto :goto_1e

    :cond_28
    :goto_1d
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_29

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_29
    return-object v10

    :goto_1e
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_2a

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_2a
    throw v0

    :pswitch_11
    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_2b

    invoke-interface {v0, v13, v5}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v14

    goto :goto_1f

    :cond_2b
    const/4 v14, 0x0

    :goto_1f
    check-cast v12, Lf9/e;

    iget-object v0, v12, Lf9/e;->a:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lcom/eightsleep/eight/AppDatabase_Impl;

    iget-object v0, v12, Lf9/e;->b:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lf5/p;

    invoke-virtual {v2}, LE4/C;->a()LL4/f;

    move-result-object v3

    check-cast v11, Ljava/lang/String;

    const/4 v0, 0x1

    invoke-interface {v3, v0, v11}, LL4/d;->g(ILjava/lang/String;)V

    :try_start_b
    invoke-virtual {v1}, LE4/t;->c()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_8

    :try_start_c
    invoke-interface {v3}, LL4/f;->o()I

    invoke-virtual {v1}, LE4/t;->q()V

    if-eqz v14, :cond_2c

    sget-object v0, Lio/sentry/A2;->OK:Lio/sentry/A2;

    invoke-interface {v14, v0}, Lio/sentry/e0;->b(Lio/sentry/A2;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_7

    goto :goto_20

    :catchall_7
    move-exception v0

    goto :goto_22

    :cond_2c
    :goto_20
    :try_start_d
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_2d

    invoke-interface {v14}, Lio/sentry/e0;->a()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_8

    goto :goto_21

    :catchall_8
    move-exception v0

    goto :goto_23

    :cond_2d
    :goto_21
    invoke-virtual {v2, v3}, LE4/C;->u(LL4/f;)V

    return-object v10

    :goto_22
    :try_start_e
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_2e

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_2e
    throw v0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_8

    :goto_23
    invoke-virtual {v2, v3}, LE4/C;->u(LL4/f;)V

    throw v0

    :pswitch_12
    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_2f

    invoke-interface {v0, v13, v7}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v14

    goto :goto_24

    :cond_2f
    const/4 v14, 0x0

    :goto_24
    check-cast v12, Lf9/c;

    iget-object v1, v12, Lf9/c;->a:Lcom/eightsleep/eight/AppDatabase_Impl;

    iget-object v2, v12, Lf9/c;->b:Lf5/p;

    invoke-virtual {v2}, LE4/C;->a()LL4/f;

    move-result-object v3

    check-cast v11, Ljava/lang/String;

    const/4 v0, 0x1

    invoke-interface {v3, v0, v11}, LL4/d;->g(ILjava/lang/String;)V

    :try_start_f
    invoke-virtual {v1}, LE4/t;->c()V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_a

    :try_start_10
    invoke-interface {v3}, LL4/f;->o()I

    invoke-virtual {v1}, LE4/t;->q()V

    if-eqz v14, :cond_30

    sget-object v0, Lio/sentry/A2;->OK:Lio/sentry/A2;

    invoke-interface {v14, v0}, Lio/sentry/e0;->b(Lio/sentry/A2;)V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_9

    goto :goto_25

    :catchall_9
    move-exception v0

    goto :goto_27

    :cond_30
    :goto_25
    :try_start_11
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_31

    invoke-interface {v14}, Lio/sentry/e0;->a()V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_a

    goto :goto_26

    :catchall_a
    move-exception v0

    goto :goto_28

    :cond_31
    :goto_26
    invoke-virtual {v2, v3}, LE4/C;->u(LL4/f;)V

    return-object v10

    :goto_27
    :try_start_12
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_32

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_32
    throw v0
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_a

    :goto_28
    invoke-virtual {v2, v3}, LE4/C;->u(LL4/f;)V

    throw v0

    :pswitch_13
    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_33

    invoke-interface {v0, v13, v7}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v14

    goto :goto_29

    :cond_33
    const/4 v14, 0x0

    :goto_29
    check-cast v12, Lf9/c;

    iget-object v1, v12, Lf9/c;->a:Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-virtual {v1}, LE4/t;->c()V

    :try_start_13
    iget-object v0, v12, Lf9/c;->h:Lf5/b;

    check-cast v11, Lg9/r;

    invoke-virtual {v0, v11}, Lf5/b;->P(Ljava/lang/Object;)V

    invoke-virtual {v1}, LE4/t;->q()V

    if-eqz v14, :cond_34

    sget-object v0, Lio/sentry/A2;->OK:Lio/sentry/A2;

    invoke-interface {v14, v0}, Lio/sentry/e0;->b(Lio/sentry/A2;)V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_b

    goto :goto_2a

    :catchall_b
    move-exception v0

    goto :goto_2b

    :cond_34
    :goto_2a
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_35

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_35
    return-object v10

    :goto_2b
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_36

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_36
    throw v0

    :pswitch_14
    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_37

    invoke-interface {v0, v13, v7}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v14

    goto :goto_2c

    :cond_37
    const/4 v14, 0x0

    :goto_2c
    check-cast v12, Lf9/c;

    iget-object v1, v12, Lf9/c;->a:Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-virtual {v1}, LE4/t;->c()V

    :try_start_14
    iget-object v0, v12, Lf9/c;->f:Lf5/b;

    check-cast v11, Lg9/f;

    invoke-virtual {v0, v11}, Lf5/b;->P(Ljava/lang/Object;)V

    invoke-virtual {v1}, LE4/t;->q()V

    if-eqz v14, :cond_38

    sget-object v0, Lio/sentry/A2;->OK:Lio/sentry/A2;

    invoke-interface {v14, v0}, Lio/sentry/e0;->b(Lio/sentry/A2;)V
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_c

    goto :goto_2d

    :catchall_c
    move-exception v0

    goto :goto_2e

    :cond_38
    :goto_2d
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_39

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_39
    return-object v10

    :goto_2e
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_3a

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_3a
    throw v0

    :pswitch_15
    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_3b

    invoke-interface {v0, v13, v7}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v14

    goto :goto_2f

    :cond_3b
    const/4 v14, 0x0

    :goto_2f
    check-cast v12, Lf9/c;

    iget-object v1, v12, Lf9/c;->a:Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-virtual {v1}, LE4/t;->c()V

    :try_start_15
    iget-object v0, v12, Lf9/c;->f:Lf5/b;

    check-cast v11, Ljava/util/List;

    invoke-virtual {v0, v11}, Lf5/b;->O(Ljava/lang/Iterable;)V

    invoke-virtual {v1}, LE4/t;->q()V

    if-eqz v14, :cond_3c

    sget-object v0, Lio/sentry/A2;->OK:Lio/sentry/A2;

    invoke-interface {v14, v0}, Lio/sentry/e0;->b(Lio/sentry/A2;)V
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_d

    goto :goto_30

    :catchall_d
    move-exception v0

    goto :goto_31

    :cond_3c
    :goto_30
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_3d

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_3d
    return-object v10

    :goto_31
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_3e

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_3e
    throw v0

    :pswitch_16
    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_3f

    invoke-interface {v0, v13, v7}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v14

    goto :goto_32

    :cond_3f
    const/4 v14, 0x0

    :goto_32
    check-cast v12, Lf9/c;

    iget-object v1, v12, Lf9/c;->a:Lcom/eightsleep/eight/AppDatabase_Impl;

    iget-object v2, v12, Lf9/c;->d:Lf5/p;

    invoke-virtual {v2}, LE4/C;->a()LL4/f;

    move-result-object v3

    invoke-virtual {v12}, Lf9/c;->k()Lxc/g;

    move-result-object v0

    check-cast v11, Ljava/time/LocalDate;

    invoke-virtual {v0, v11}, Lxc/g;->b(Ljava/time/LocalDate;)Ljava/lang/String;

    move-result-object v0

    const/4 v4, 0x1

    invoke-interface {v3, v4, v0}, LL4/d;->g(ILjava/lang/String;)V

    :try_start_16
    invoke-virtual {v1}, LE4/t;->c()V
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_f

    :try_start_17
    invoke-interface {v3}, LL4/f;->o()I

    invoke-virtual {v1}, LE4/t;->q()V

    if-eqz v14, :cond_40

    sget-object v0, Lio/sentry/A2;->OK:Lio/sentry/A2;

    invoke-interface {v14, v0}, Lio/sentry/e0;->b(Lio/sentry/A2;)V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_e

    goto :goto_33

    :catchall_e
    move-exception v0

    goto :goto_35

    :cond_40
    :goto_33
    :try_start_18
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_41

    invoke-interface {v14}, Lio/sentry/e0;->a()V
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_f

    goto :goto_34

    :catchall_f
    move-exception v0

    goto :goto_36

    :cond_41
    :goto_34
    invoke-virtual {v2, v3}, LE4/C;->u(LL4/f;)V

    return-object v10

    :goto_35
    :try_start_19
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_42

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_42
    throw v0
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_f

    :goto_36
    invoke-virtual {v2, v3}, LE4/C;->u(LL4/f;)V

    throw v0

    :pswitch_17
    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_43

    const-string v1, "androidx.work.impl.model.WorkSpecDao"

    invoke-interface {v0, v13, v1}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v14

    goto :goto_37

    :cond_43
    const/4 v14, 0x0

    :goto_37
    check-cast v12, Lf5/q;

    iget-object v0, v12, Lf5/q;->a:Landroidx/work/impl/WorkDatabase_Impl;

    check-cast v11, LE4/A;

    invoke-static {v0, v11, v8}, La7/d;->W(LE4/t;LL4/e;Z)Landroid/database/Cursor;

    move-result-object v1

    :try_start_1a
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_45

    invoke-interface {v1, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-eqz v0, :cond_44

    const/4 v8, 0x1

    :cond_44
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_38

    :catchall_10
    move-exception v0

    goto :goto_39

    :cond_45
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_10

    :goto_38
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    if-eqz v14, :cond_46

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_46
    return-object v0

    :goto_39
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    if-eqz v14, :cond_47

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_47
    throw v0

    :pswitch_18
    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_48

    invoke-interface {v0, v13, v2}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v14

    goto :goto_3a

    :cond_48
    const/4 v14, 0x0

    :goto_3a
    check-cast v12, Lcd/a;

    iget-object v0, v12, Lcd/a;->a:Ljava/lang/Object;

    check-cast v0, Lcom/eightsleep/eight/AppDatabase_Impl;

    check-cast v11, LE4/A;

    invoke-static {v0, v11, v8}, La7/d;->W(LE4/t;LL4/e;Z)Landroid/database/Cursor;

    move-result-object v1

    :try_start_1b
    const-string v0, "name"

    invoke-static {v1, v0}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    const-string v2, "data"

    invoke-static {v1, v2}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v2

    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    :goto_3b
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_49

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lbd/h;->b(Ljava/lang/String;)Lcom/eightsleep/data_remoteconfig/enums/featureflag/FlagValue;

    move-result-object v5

    new-instance v6, Ldd/a;

    invoke-direct {v6, v5, v4}, Ldd/a;-><init>(Lcom/eightsleep/data_remoteconfig/enums/featureflag/FlagValue;Ljava/lang/String;)V

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_11

    goto :goto_3b

    :catchall_11
    move-exception v0

    goto :goto_3c

    :cond_49
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    if-eqz v14, :cond_4a

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_4a
    return-object v3

    :goto_3c
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    if-eqz v14, :cond_4b

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_4b
    throw v0

    :pswitch_19
    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_4c

    invoke-interface {v0, v13, v2}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v14

    goto :goto_3d

    :cond_4c
    const/4 v14, 0x0

    :goto_3d
    check-cast v12, Lcd/a;

    iget-object v0, v12, Lcd/a;->a:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-virtual {v1}, LE4/t;->c()V

    :try_start_1c
    iget-object v0, v12, Lcd/a;->b:Ljava/lang/Object;

    check-cast v0, Lf5/b;

    check-cast v11, Ldd/a;

    invoke-virtual {v0, v11}, Lf5/b;->P(Ljava/lang/Object;)V

    invoke-virtual {v1}, LE4/t;->q()V

    if-eqz v14, :cond_4d

    sget-object v0, Lio/sentry/A2;->OK:Lio/sentry/A2;

    invoke-interface {v14, v0}, Lio/sentry/e0;->b(Lio/sentry/A2;)V
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_12

    goto :goto_3e

    :catchall_12
    move-exception v0

    goto :goto_3f

    :cond_4d
    :goto_3e
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_4e

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_4e
    return-object v10

    :goto_3f
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_4f

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_4f
    throw v0

    :pswitch_1a
    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_50

    const-string v1, "com.eightsleep.data_insights.persistence.dao.InsightDao"

    invoke-interface {v0, v13, v1}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v14

    goto :goto_40

    :cond_50
    const/4 v14, 0x0

    :goto_40
    check-cast v12, Lbc/c;

    iget-object v0, v12, Lbc/c;->a:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-virtual {v1}, LE4/t;->c()V

    :try_start_1d
    iget-object v0, v12, Lbc/c;->c:Ljava/lang/Object;

    check-cast v0, Lf5/b;

    check-cast v11, Ljava/util/List;

    invoke-virtual {v0, v11}, Lf5/b;->O(Ljava/lang/Iterable;)V

    invoke-virtual {v1}, LE4/t;->q()V

    if-eqz v14, :cond_51

    sget-object v0, Lio/sentry/A2;->OK:Lio/sentry/A2;

    invoke-interface {v14, v0}, Lio/sentry/e0;->b(Lio/sentry/A2;)V
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_13

    goto :goto_41

    :catchall_13
    move-exception v0

    goto :goto_42

    :cond_51
    :goto_41
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_52

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_52
    return-object v10

    :goto_42
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_53

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_53
    throw v0

    :pswitch_1b
    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_54

    invoke-interface {v0, v13, v1}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v0

    move-object v1, v0

    goto :goto_43

    :cond_54
    const/4 v1, 0x0

    :goto_43
    check-cast v12, Laa/f;

    iget-object v0, v12, Laa/f;->a:Ljava/lang/Object;

    check-cast v0, Lcom/eightsleep/eight/AppDatabase_Impl;

    check-cast v11, LE4/A;

    invoke-static {v0, v11, v8}, La7/d;->W(LE4/t;LL4/e;Z)Landroid/database/Cursor;

    move-result-object v2

    :try_start_1e
    invoke-static {v2, v6}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    const-string v3, "recommended_bedtime"

    invoke-static {v2, v3}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v3

    const-string v5, "standard_deviation_seconds"

    invoke-static {v2, v5}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v5

    const-string v6, "days_analyzed"

    invoke-static {v2, v6}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    const-string v7, "top_performing_days"

    invoke-static {v2, v7}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    const-string v8, "fetched_at_ms"

    invoke-static {v2, v8}, La/a;->K(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v8

    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v9

    if-eqz v9, :cond_56

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v18

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v12}, Laa/f;->f(Laa/f;)Lxc/g;

    move-result-object v3

    invoke-virtual {v3, v0}, Lxc/g;->f(Ljava/lang/String;)Ljava/time/LocalTime;

    move-result-object v19

    if-eqz v19, :cond_55

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v20

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v22

    invoke-interface {v2, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v23

    invoke-interface {v2, v8}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v24

    new-instance v17, Lba/d;

    invoke-direct/range {v17 .. v25}, Lba/d;-><init>(Ljava/lang/String;Ljava/time/LocalTime;JIIJ)V

    move-object/from16 v14, v17

    goto :goto_44

    :catchall_14
    move-exception v0

    goto :goto_45

    :cond_55
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_14

    :cond_56
    const/4 v14, 0x0

    :goto_44
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    if-eqz v1, :cond_57

    invoke-interface {v1}, Lio/sentry/e0;->a()V

    :cond_57
    invoke-virtual {v11}, LE4/A;->release()V

    return-object v14

    :goto_45
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    if-eqz v1, :cond_58

    invoke-interface {v1}, Lio/sentry/e0;->a()V

    :cond_58
    invoke-virtual {v11}, LE4/A;->release()V

    throw v0

    :pswitch_1c
    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_59

    invoke-interface {v0, v13, v1}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v14

    goto :goto_46

    :cond_59
    const/4 v14, 0x0

    :goto_46
    check-cast v12, Laa/f;

    iget-object v0, v12, Laa/f;->a:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lcom/eightsleep/eight/AppDatabase_Impl;

    iget-object v0, v12, Laa/f;->d:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, LR9/p;

    invoke-virtual {v2}, LE4/C;->a()LL4/f;

    move-result-object v3

    check-cast v11, Ljava/lang/String;

    const/4 v0, 0x1

    invoke-interface {v3, v0, v11}, LL4/d;->g(ILjava/lang/String;)V

    :try_start_1f
    invoke-virtual {v1}, LE4/t;->c()V
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_16

    :try_start_20
    invoke-interface {v3}, LL4/f;->o()I

    invoke-virtual {v1}, LE4/t;->q()V

    if-eqz v14, :cond_5a

    sget-object v0, Lio/sentry/A2;->OK:Lio/sentry/A2;

    invoke-interface {v14, v0}, Lio/sentry/e0;->b(Lio/sentry/A2;)V
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_15

    goto :goto_47

    :catchall_15
    move-exception v0

    goto :goto_49

    :cond_5a
    :goto_47
    :try_start_21
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_5b

    invoke-interface {v14}, Lio/sentry/e0;->a()V
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_16

    goto :goto_48

    :catchall_16
    move-exception v0

    goto :goto_4a

    :cond_5b
    :goto_48
    invoke-virtual {v2, v3}, LE4/C;->u(LL4/f;)V

    return-object v10

    :goto_49
    :try_start_22
    invoke-virtual {v1}, LE4/t;->k()V

    if-eqz v14, :cond_5c

    invoke-interface {v14}, Lio/sentry/e0;->a()V

    :cond_5c
    throw v0
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_16

    :goto_4a
    invoke-virtual {v2, v3}, LE4/C;->u(LL4/f;)V

    throw v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
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

.method public finalize()V
    .locals 1

    iget v0, p0, Laa/e;->a:I

    sparse-switch v0, :sswitch_data_0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void

    :sswitch_0
    iget-object p0, p0, Laa/e;->c:Ljava/lang/Object;

    check-cast p0, LE4/A;

    invoke-virtual {p0}, LE4/A;->release()V

    return-void

    :sswitch_1
    iget-object p0, p0, Laa/e;->c:Ljava/lang/Object;

    check-cast p0, LE4/A;

    invoke-virtual {p0}, LE4/A;->release()V

    return-void

    :sswitch_2
    iget-object p0, p0, Laa/e;->c:Ljava/lang/Object;

    check-cast p0, LE4/A;

    invoke-virtual {p0}, LE4/A;->release()V

    return-void

    :sswitch_3
    iget-object p0, p0, Laa/e;->c:Ljava/lang/Object;

    check-cast p0, LE4/A;

    invoke-virtual {p0}, LE4/A;->release()V

    return-void

    :sswitch_4
    iget-object p0, p0, Laa/e;->c:Ljava/lang/Object;

    check-cast p0, LE4/A;

    invoke-virtual {p0}, LE4/A;->release()V

    return-void

    :sswitch_5
    iget-object p0, p0, Laa/e;->c:Ljava/lang/Object;

    check-cast p0, LE4/A;

    invoke-virtual {p0}, LE4/A;->release()V

    return-void

    :sswitch_6
    iget-object p0, p0, Laa/e;->c:Ljava/lang/Object;

    check-cast p0, LE4/A;

    invoke-virtual {p0}, LE4/A;->release()V

    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_6
        0x5 -> :sswitch_5
        0xd -> :sswitch_4
        0xe -> :sswitch_3
        0x18 -> :sswitch_2
        0x1a -> :sswitch_1
        0x1d -> :sswitch_0
    .end sparse-switch
.end method
