.class public final Lkc/d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x7f080077

    const v1, 0x7f08002d

    const v2, 0x7f080079

    .line 2
    filled-new-array {v2, v0, v1}, [I

    move-result-object v0

    iput-object v0, p0, Lkc/d;->a:Ljava/lang/Object;

    const/4 v0, 0x7

    .line 3
    new-array v1, v0, [I

    fill-array-data v1, :array_0

    iput-object v1, p0, Lkc/d;->b:Ljava/lang/Object;

    .line 4
    new-array v0, v0, [I

    fill-array-data v0, :array_1

    iput-object v0, p0, Lkc/d;->c:Ljava/lang/Object;

    const v0, 0x7f08003c

    const v1, 0x7f08005d

    const v2, 0x7f08005e

    .line 5
    filled-new-array {v2, v0, v1}, [I

    move-result-object v0

    iput-object v0, p0, Lkc/d;->d:Ljava/lang/Object;

    const v0, 0x7f080070

    const v1, 0x7f08007a

    .line 6
    filled-new-array {v0, v1}, [I

    move-result-object v0

    iput-object v0, p0, Lkc/d;->e:Ljava/lang/Object;

    const v0, 0x7f080031

    const v1, 0x7f080037

    const v2, 0x7f080030

    const v3, 0x7f080036

    .line 7
    filled-new-array {v2, v3, v0, v1}, [I

    move-result-object v0

    iput-object v0, p0, Lkc/d;->f:Ljava/lang/Object;

    return-void

    nop

    :array_0
    .array-data 4
        0x7f080045
        0x7f080068
        0x7f08004c
        0x7f080047
        0x7f080048
        0x7f08004b
        0x7f08004a
    .end array-data

    :array_1
    .array-data 4
        0x7f080076
        0x7f080078
        0x7f08003e
        0x7f080072
        0x7f080073
        0x7f080074
        0x7f080075
    .end array-data
.end method

.method public constructor <init>(Lcom/eightsleep/eight/AppDatabase_Impl;)V
    .locals 2

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput-object p1, p0, Lkc/d;->a:Ljava/lang/Object;

    .line 10
    new-instance v0, Lkc/c;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lkc/c;-><init>(Lkc/d;Lcom/eightsleep/eight/AppDatabase_Impl;I)V

    iput-object v0, p0, Lkc/d;->b:Ljava/lang/Object;

    .line 11
    new-instance v0, Lkc/c;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lkc/c;-><init>(Lkc/d;Lcom/eightsleep/eight/AppDatabase_Impl;I)V

    iput-object v0, p0, Lkc/d;->e:Ljava/lang/Object;

    .line 12
    new-instance v0, LJd/j;

    const/16 v1, 0x11

    .line 13
    invoke-direct {v0, p1, v1}, LJd/j;-><init>(LE4/t;I)V

    .line 14
    new-instance v0, LJd/g;

    const/16 v1, 0xc

    invoke-direct {v0, p0, p1, v1}, LJd/g;-><init>(Ljava/lang/Object;Lcom/eightsleep/eight/AppDatabase_Impl;I)V

    iput-object v0, p0, Lkc/d;->f:Ljava/lang/Object;

    .line 15
    new-instance p0, Lf5/p;

    const/16 v0, 0xd

    .line 16
    invoke-direct {p0, p1, v0}, Lf5/p;-><init>(LE4/t;I)V

    .line 17
    new-instance p0, Lf5/p;

    const/16 v0, 0xe

    .line 18
    invoke-direct {p0, p1, v0}, Lf5/p;-><init>(LE4/t;I)V

    .line 19
    new-instance p0, Lf5/p;

    const/16 v0, 0xf

    .line 20
    invoke-direct {p0, p1, v0}, Lf5/p;-><init>(LE4/t;I)V

    return-void
.end method

.method public static d([II)Z
    .locals 4

    array-length v0, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    aget v3, p0, v2

    if-ne v3, p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method public static e(Landroid/content/Context;I)Landroid/content/res/ColorStateList;
    .locals 6

    const v0, 0x7f040110

    invoke-static {p0, v0}, Lp/L0;->c(Landroid/content/Context;I)I

    move-result v0

    const v1, 0x7f04010d

    invoke-static {p0, v1}, Lp/L0;->b(Landroid/content/Context;I)I

    move-result p0

    sget-object v1, Lp/L0;->b:[I

    sget-object v2, Lp/L0;->d:[I

    invoke-static {v0, p1}, LS1/a;->b(II)I

    move-result v3

    sget-object v4, Lp/L0;->c:[I

    invoke-static {v0, p1}, LS1/a;->b(II)I

    move-result v0

    sget-object v5, Lp/L0;->f:[I

    filled-new-array {v1, v2, v4, v5}, [[I

    move-result-object v1

    filled-new-array {p0, v3, v0, p1}, [I

    move-result-object p0

    new-instance p1, Landroid/content/res/ColorStateList;

    invoke-direct {p1, v1, p0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object p1
.end method

.method public static f(Lp/F0;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;
    .locals 6

    const/4 v0, 0x2

    const/4 v1, 0x1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    const v2, 0x7f08006c

    invoke-virtual {p0, p1, v2}, Lp/F0;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const v3, 0x7f08006d

    invoke-virtual {p0, p1, v3}, Lp/F0;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    instance-of p1, v2, Landroid/graphics/drawable/BitmapDrawable;

    const/4 v3, 0x0

    if-eqz p1, :cond_0

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    if-ne p1, p2, :cond_0

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p1

    if-ne p1, p2, :cond_0

    check-cast v2, Landroid/graphics/drawable/BitmapDrawable;

    new-instance p1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-direct {p1, v4}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    goto :goto_0

    :cond_0
    sget-object p1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p2, p2, p1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    new-instance v4, Landroid/graphics/Canvas;

    invoke-direct {v4, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v2, v3, v3, p2, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    invoke-virtual {v2, v4}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v2, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v4, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v4, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    move-object p1, v4

    :goto_0
    sget-object v4, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    invoke-virtual {p1, v4}, Landroid/graphics/drawable/BitmapDrawable;->setTileModeX(Landroid/graphics/Shader$TileMode;)V

    instance-of v4, p0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v4, :cond_1

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    if-ne v4, p2, :cond_1

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    if-ne v4, p2, :cond_1

    check-cast p0, Landroid/graphics/drawable/BitmapDrawable;

    goto :goto_1

    :cond_1
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p2, p2, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    new-instance v5, Landroid/graphics/Canvas;

    invoke-direct {v5, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {p0, v3, v3, p2, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    invoke-virtual {p0, v5}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    new-instance p0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {p0, v4}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    :goto_1
    new-instance p2, Landroid/graphics/drawable/LayerDrawable;

    const/4 v4, 0x3

    new-array v4, v4, [Landroid/graphics/drawable/Drawable;

    aput-object v2, v4, v3

    aput-object p0, v4, v1

    aput-object p1, v4, v0

    invoke-direct {p2, v4}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    const/high16 p0, 0x1020000

    invoke-virtual {p2, v3, p0}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    const p0, 0x102000f

    invoke-virtual {p2, v1, p0}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    const p0, 0x102000d

    invoke-virtual {p2, v0, p0}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    return-object p2
.end method

.method public static h(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V
    .locals 0

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-nez p2, :cond_0

    sget-object p2, Lp/r;->b:Landroid/graphics/PorterDuff$Mode;

    :cond_0
    invoke-static {p1, p2}, Lp/r;->c(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    return-void
.end method


# virtual methods
.method public a(Lt/e;)V
    .locals 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, "value"

    invoke-virtual {v1}, Lt/e;->keySet()Ljava/util/Set;

    move-result-object v3

    check-cast v3, Lt/b;

    iget-object v4, v3, Lt/b;->a:Lt/e;

    invoke-virtual {v4}, Lt/Q;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_0

    goto/16 :goto_a

    :cond_0
    iget v5, v1, Lt/Q;->c:I

    const/16 v6, 0x3e7

    if-le v5, v6, :cond_1

    new-instance v2, Lcom/eightsleep/presentation_onboarding/viewmodel/pod5/e;

    const/16 v3, 0x16

    invoke-direct {v2, v0, v3}, Lcom/eightsleep/presentation_onboarding/viewmodel/pod5/e;-><init>(Ljava/lang/Object;I)V

    invoke-static {v1, v2}, Landroid/support/v4/media/session/b;->D(Lt/e;LVm/k;)V

    return-void

    :cond_1
    const-string v5, "SELECT `id`,`planId`,`name`,`type`,`phase`,`scheduledAt`,`timezoneId`,`instructions`,`status`,`metadata` FROM `jet_lag_plan_task` WHERE `planId` IN ("

    invoke-static {v5}, Lj/m;->r(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v4, v4, Lt/Q;->c:I

    invoke-static {v4, v5}, Landroidx/room/migration/bundle/a;->r(ILjava/lang/StringBuilder;)V

    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, LE4/A;->a(ILjava/lang/String;)LE4/A;

    move-result-object v4

    invoke-virtual {v3}, Lt/b;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v5, 0x1

    move v6, v5

    :goto_0
    move-object v7, v3

    check-cast v7, Lt/a;

    invoke-virtual {v7}, Lt/a;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-virtual {v7}, Lt/a;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v4, v6, v7}, LE4/A;->g(ILjava/lang/String;)V

    add-int/2addr v6, v5

    goto :goto_0

    :cond_2
    iget-object v3, v0, Lkc/d;->a:Ljava/lang/Object;

    check-cast v3, Lcom/eightsleep/eight/AppDatabase_Impl;

    const/4 v6, 0x0

    invoke-static {v3, v4, v6}, La7/d;->W(LE4/t;LL4/e;Z)Landroid/database/Cursor;

    move-result-object v3

    :try_start_0
    const-string v4, "planId"

    invoke-static {v3, v4}, La/a;->J(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v7, -0x1

    if-ne v4, v7, :cond_3

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    return-void

    :cond_3
    :goto_1
    :try_start_1
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v7

    if-eqz v7, :cond_9

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Lt/Q;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/ArrayList;

    if-eqz v7, :cond_8

    invoke-interface {v3, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    const/4 v8, 0x2

    invoke-interface {v3, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    const/4 v8, 0x3

    invoke-interface {v3, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0}, Lkc/d;->b()Ljc/a;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v8, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-static {v8}, Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;->valueOf(Ljava/lang/String;)Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    move-result-object v8
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_2
    move-object v12, v8

    goto :goto_3

    :catch_0
    :try_start_3
    sget-object v8, Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;->UNKNOWN:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    goto :goto_2

    :goto_3
    const/4 v8, 0x4

    invoke-interface {v3, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0}, Lkc/d;->b()Ljc/a;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v8, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    invoke-static {v8}, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;->valueOf(Ljava/lang/String;)Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    move-result-object v8
    :try_end_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :goto_4
    move-object/from16 v16, v8

    goto :goto_5

    :catch_1
    :try_start_5
    sget-object v8, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;->UNKNOWN:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    goto :goto_4

    :goto_5
    const/4 v8, 0x5

    invoke-interface {v3, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0}, Lkc/d;->c()Lxc/g;

    move-result-object v13

    invoke-virtual {v13, v8}, Lxc/g;->d(Ljava/lang/String;)Ljava/time/Instant;

    move-result-object v13

    if-eqz v13, :cond_7

    const/4 v8, 0x6

    invoke-interface {v3, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    const/4 v8, 0x7

    invoke-interface {v3, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    const/16 v8, 0x8

    invoke-interface {v3, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0}, Lkc/d;->b()Ljc/a;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v8, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    invoke-static {v8}, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;->valueOf(Ljava/lang/String;)Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    move-result-object v8
    :try_end_6
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :goto_6
    move-object/from16 v17, v8

    goto :goto_7

    :catch_2
    :try_start_7
    sget-object v8, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;->UNKNOWN:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    goto :goto_6

    :goto_7
    const/16 v8, 0x9

    invoke-interface {v3, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v18

    const/16 v19, 0x0

    if-eqz v18, :cond_4

    move-object/from16 v8, v19

    goto :goto_8

    :cond_4
    invoke-interface {v3, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    :goto_8
    invoke-virtual {v0}, Lkc/d;->b()Ljc/a;

    move-result-object v5

    iget-object v5, v5, Ljc/a;->a:Lcom/squareup/moshi/Moshi;

    const-class v6, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;

    invoke-virtual {v5, v6}, Lcom/squareup/moshi/Moshi;->adapter(Ljava/lang/Class;)Lcom/squareup/moshi/JsonAdapter;

    move-result-object v5

    const-string v6, "adapter(...)"

    invoke-static {v5, v6}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz v8, :cond_5

    invoke-virtual {v5, v8}, Lcom/squareup/moshi/JsonAdapter;->fromJson(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v19, v5

    check-cast v19, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;

    :cond_5
    move-object/from16 v18, v19

    if-eqz v18, :cond_6

    new-instance v8, Llc/c;

    invoke-direct/range {v8 .. v18}, Llc/c;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;)V

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_9

    :catchall_0
    move-exception v0

    goto :goto_b

    :cond_6
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Expected NON-NULL \'com.eightsleep.data_jetlag.data.model.JetLagPlanMetadataResponse\', but it was NULL."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Expected NON-NULL \'java.time.Instant\', but it was NULL."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    :cond_8
    :goto_9
    const/4 v5, 0x1

    const/4 v6, 0x0

    goto/16 :goto_1

    :cond_9
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    :goto_a
    return-void

    :goto_b
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method public declared-synchronized b()Ljc/a;
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lkc/d;->c:Ljava/lang/Object;

    check-cast v0, Ljc/a;

    if-nez v0, :cond_0

    iget-object v0, p0, Lkc/d;->a:Ljava/lang/Object;

    check-cast v0, Lcom/eightsleep/eight/AppDatabase_Impl;

    const-class v1, Ljc/a;

    iget-object v0, v0, LE4/t;->l:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljc/a;

    iput-object v0, p0, Lkc/d;->c:Ljava/lang/Object;

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :cond_0
    :goto_0
    iget-object v0, p0, Lkc/d;->c:Ljava/lang/Object;

    check-cast v0, Ljc/a;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public declared-synchronized c()Lxc/g;
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lkc/d;->d:Ljava/lang/Object;

    check-cast v0, Lxc/g;

    if-nez v0, :cond_0

    iget-object v0, p0, Lkc/d;->a:Ljava/lang/Object;

    check-cast v0, Lcom/eightsleep/eight/AppDatabase_Impl;

    const-class v1, Lxc/g;

    iget-object v0, v0, LE4/t;->l:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lxc/g;

    iput-object v0, p0, Lkc/d;->d:Ljava/lang/Object;

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :cond_0
    :goto_0
    iget-object v0, p0, Lkc/d;->d:Ljava/lang/Object;

    check-cast v0, Lxc/g;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public g(Landroid/content/Context;I)Landroid/content/res/ColorStateList;
    .locals 7

    const v0, 0x7f080041

    if-ne p2, v0, :cond_0

    const p0, 0x7f06001e

    invoke-static {p1, p0}, LQ1/a;->getColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :cond_0
    const v0, 0x7f08006f

    if-ne p2, v0, :cond_1

    const p0, 0x7f060021

    invoke-static {p1, p0}, LQ1/a;->getColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :cond_1
    const v0, 0x7f08006e

    const/4 v1, 0x0

    if-ne p2, v0, :cond_3

    const/4 p0, 0x3

    new-array p2, p0, [[I

    new-array p0, p0, [I

    const v0, 0x7f040143

    invoke-static {p1, v0}, Lp/L0;->d(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v2

    const/4 v3, 0x2

    const v4, 0x7f04010f

    const/4 v5, 0x1

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v6

    if-eqz v6, :cond_2

    sget-object v0, Lp/L0;->b:[I

    aput-object v0, p2, v1

    invoke-virtual {v2, v0, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    aput v0, p0, v1

    sget-object v0, Lp/L0;->e:[I

    aput-object v0, p2, v5

    invoke-static {p1, v4}, Lp/L0;->c(Landroid/content/Context;I)I

    move-result p1

    aput p1, p0, v5

    sget-object p1, Lp/L0;->f:[I

    aput-object p1, p2, v3

    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p1

    aput p1, p0, v3

    goto :goto_0

    :cond_2
    sget-object v2, Lp/L0;->b:[I

    aput-object v2, p2, v1

    invoke-static {p1, v0}, Lp/L0;->b(Landroid/content/Context;I)I

    move-result v2

    aput v2, p0, v1

    sget-object v1, Lp/L0;->e:[I

    aput-object v1, p2, v5

    invoke-static {p1, v4}, Lp/L0;->c(Landroid/content/Context;I)I

    move-result v1

    aput v1, p0, v5

    sget-object v1, Lp/L0;->f:[I

    aput-object v1, p2, v3

    invoke-static {p1, v0}, Lp/L0;->c(Landroid/content/Context;I)I

    move-result p1

    aput p1, p0, v3

    :goto_0
    new-instance p1, Landroid/content/res/ColorStateList;

    invoke-direct {p1, p2, p0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object p1

    :cond_3
    const v0, 0x7f080035

    if-ne p2, v0, :cond_4

    const p0, 0x7f04010d

    invoke-static {p1, p0}, Lp/L0;->c(Landroid/content/Context;I)I

    move-result p0

    invoke-static {p1, p0}, Lkc/d;->e(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :cond_4
    const v0, 0x7f08002f

    if-ne p2, v0, :cond_5

    invoke-static {p1, v1}, Lkc/d;->e(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :cond_5
    const v0, 0x7f080034

    if-ne p2, v0, :cond_6

    const p0, 0x7f04010b

    invoke-static {p1, p0}, Lp/L0;->c(Landroid/content/Context;I)I

    move-result p0

    invoke-static {p1, p0}, Lkc/d;->e(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :cond_6
    const v0, 0x7f08006a

    if-eq p2, v0, :cond_c

    const v0, 0x7f08006b

    if-ne p2, v0, :cond_7

    goto :goto_1

    :cond_7
    iget-object v0, p0, Lkc/d;->b:Ljava/lang/Object;

    check-cast v0, [I

    invoke-static {v0, p2}, Lkc/d;->d([II)Z

    move-result v0

    if-eqz v0, :cond_8

    const p0, 0x7f040111

    invoke-static {p1, p0}, Lp/L0;->d(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :cond_8
    iget-object v0, p0, Lkc/d;->e:Ljava/lang/Object;

    check-cast v0, [I

    invoke-static {v0, p2}, Lkc/d;->d([II)Z

    move-result v0

    if-eqz v0, :cond_9

    const p0, 0x7f06001d

    invoke-static {p1, p0}, LQ1/a;->getColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :cond_9
    iget-object p0, p0, Lkc/d;->f:Ljava/lang/Object;

    check-cast p0, [I

    invoke-static {p0, p2}, Lkc/d;->d([II)Z

    move-result p0

    if-eqz p0, :cond_a

    const p0, 0x7f06001c

    invoke-static {p1, p0}, LQ1/a;->getColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :cond_a
    const p0, 0x7f080067

    if-ne p2, p0, :cond_b

    const p0, 0x7f06001f

    invoke-static {p1, p0}, LQ1/a;->getColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :cond_b
    const/4 p0, 0x0

    return-object p0

    :cond_c
    :goto_1
    const p0, 0x7f060020

    invoke-static {p1, p0}, LQ1/a;->getColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0
.end method
