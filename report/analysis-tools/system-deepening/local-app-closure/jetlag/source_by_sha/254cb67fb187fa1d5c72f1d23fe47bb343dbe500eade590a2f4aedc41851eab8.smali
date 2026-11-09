.class public final Lkc/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/util/ArrayList;

.field public final synthetic c:Lkc/d;


# direct methods
.method public synthetic constructor <init>(Lkc/d;Ljava/util/ArrayList;I)V
    .locals 0

    iput p3, p0, Lkc/b;->a:I

    iput-object p1, p0, Lkc/b;->c:Lkc/d;

    iput-object p2, p0, Lkc/b;->b:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 5

    iget v0, p0, Lkc/b;->a:I

    packed-switch v0, :pswitch_data_0

    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "db.sql.room"

    const-string v2, "com.eightsleep.data_jetlag.persistence.dao.JetLagPlanDao"

    invoke-interface {v0, v1, v2}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lkc/b;->c:Lkc/d;

    iget-object v2, v1, Lkc/d;->a:Ljava/lang/Object;

    check-cast v2, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-virtual {v2}, LE4/t;->c()V

    :try_start_0
    iget-object v1, v1, Lkc/d;->f:Ljava/lang/Object;

    check-cast v1, LJd/g;

    iget-object p0, p0, Lkc/b;->b:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, LE4/C;->a()LL4/f;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, LJd/g;->x(LL4/f;Ljava/lang/Object;)V

    invoke-interface {v3}, LL4/f;->o()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_3

    :cond_1
    :try_start_2
    invoke-virtual {v1, v3}, LE4/C;->u(LL4/f;)V

    invoke-virtual {v2}, LE4/t;->q()V

    if-eqz v0, :cond_2

    sget-object p0, Lio/sentry/A2;->OK:Lio/sentry/A2;

    invoke-interface {v0, p0}, Lio/sentry/e0;->b(Lio/sentry/A2;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception p0

    goto :goto_4

    :cond_2
    :goto_2
    invoke-virtual {v2}, LE4/t;->k()V

    if-eqz v0, :cond_3

    invoke-interface {v0}, Lio/sentry/e0;->a()V

    :cond_3
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0

    :goto_3
    :try_start_3
    invoke-virtual {v1, v3}, LE4/C;->u(LL4/f;)V

    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :goto_4
    invoke-virtual {v2}, LE4/t;->k()V

    if-eqz v0, :cond_4

    invoke-interface {v0}, Lio/sentry/e0;->a()V

    :cond_4
    throw p0

    :pswitch_0
    invoke-static {}, Lio/sentry/w1;->d()Lio/sentry/e0;

    move-result-object v0

    if-eqz v0, :cond_5

    const-string v1, "db.sql.room"

    const-string v2, "com.eightsleep.data_jetlag.persistence.dao.JetLagPlanDao"

    invoke-interface {v0, v1, v2}, Lio/sentry/e0;->v(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/e0;

    move-result-object v0

    goto :goto_5

    :cond_5
    const/4 v0, 0x0

    :goto_5
    iget-object v1, p0, Lkc/b;->c:Lkc/d;

    iget-object v2, v1, Lkc/d;->a:Ljava/lang/Object;

    check-cast v2, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-virtual {v2}, LE4/t;->c()V

    :try_start_4
    iget-object v1, v1, Lkc/d;->e:Ljava/lang/Object;

    check-cast v1, Lkc/c;

    iget-object p0, p0, Lkc/b;->b:Ljava/util/ArrayList;

    invoke-virtual {v1, p0}, LE4/i;->z(Ljava/lang/Iterable;)V

    invoke-virtual {v2}, LE4/t;->q()V

    if-eqz v0, :cond_6

    sget-object p0, Lio/sentry/A2;->OK:Lio/sentry/A2;

    invoke-interface {v0, p0}, Lio/sentry/e0;->b(Lio/sentry/A2;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_6

    :catchall_2
    move-exception p0

    goto :goto_7

    :cond_6
    :goto_6
    invoke-virtual {v2}, LE4/t;->k()V

    if-eqz v0, :cond_7

    invoke-interface {v0}, Lio/sentry/e0;->a()V

    :cond_7
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0

    :goto_7
    invoke-virtual {v2}, LE4/t;->k()V

    if-eqz v0, :cond_8

    invoke-interface {v0}, Lio/sentry/e0;->a()V

    :cond_8
    throw p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
