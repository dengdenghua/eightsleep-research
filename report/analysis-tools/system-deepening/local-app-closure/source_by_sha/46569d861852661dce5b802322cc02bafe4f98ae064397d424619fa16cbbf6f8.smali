.class public final LGa/b;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Lcom/eightsleep/data_core/enums/TemperatureDisplaySetting;

.field public final c:I

.field public final d:D

.field public final e:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 1

    .line 13
    sget-object v0, Lcom/eightsleep/data_core/enums/TemperatureDisplaySetting;->LEVEL:Lcom/eightsleep/data_core/enums/TemperatureDisplaySetting;

    .line 14
    invoke-direct {p0, p1, v0}, LGa/b;-><init>(ILcom/eightsleep/data_core/enums/TemperatureDisplaySetting;)V

    return-void
.end method

.method public constructor <init>(ILcom/eightsleep/data_core/enums/TemperatureDisplaySetting;)V
    .locals 22

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    const-string v3, "displaySetting"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput v1, v0, LGa/b;->a:I

    .line 3
    iput-object v2, v0, LGa/b;->b:Lcom/eightsleep/data_core/enums/TemperatureDisplaySetting;

    int-to-double v4, v1

    const-wide/high16 v10, 0x4024000000000000L    # 10.0

    div-double v6, v4, v10

    .line 4
    invoke-static {v6, v7}, Ljava/lang/Math;->signum(D)D

    move-result-wide v8

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(D)D

    move-result-wide v12

    invoke-static {v12, v13}, LXm/a;->T(D)I

    move-result v1

    int-to-double v12, v1

    mul-double/2addr v8, v12

    double-to-int v1, v8

    .line 5
    iput v1, v0, LGa/b;->c:I

    .line 6
    sget-object v1, LGa/a;->a:[I

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x1

    if-eq v1, v2, :cond_6

    const/4 v2, 0x2

    const-wide/high16 v12, -0x3fa7000000000000L    # -100.0

    const-wide v14, 0x4056800000000000L    # 90.0

    const-wide v16, -0x3fa9800000000000L    # -90.0

    const-wide/high16 v18, 0x4059000000000000L    # 100.0

    const-wide/16 v20, 0x0

    if-eq v1, v2, :cond_3

    const/4 v2, 0x3

    if-ne v1, v2, :cond_2

    const-wide/high16 v6, -0x3fa7000000000000L    # -100.0

    const-wide/high16 v8, 0x4059000000000000L    # 100.0

    .line 7
    invoke-static/range {v4 .. v9}, LP2/H;->A(DDD)D

    move-result-wide v1

    cmpl-double v3, v1, v20

    if-ltz v3, :cond_0

    sub-double v1, v1, v20

    div-double v1, v1, v18

    const-wide v3, 0x403d666666666668L    # 29.400000000000006

    mul-double/2addr v1, v3

    const-wide v3, 0x4054266666666666L    # 80.6

    :goto_0
    add-double/2addr v1, v3

    move-wide v6, v1

    goto :goto_1

    :cond_0
    cmpl-double v3, v1, v16

    if-ltz v3, :cond_1

    sub-double v1, v1, v16

    div-double/2addr v1, v14

    const-wide v3, 0x4033666666666664L    # 19.39999999999999

    mul-double/2addr v1, v3

    const-wide v3, 0x404e99999999999aL    # 61.2

    goto :goto_0

    :cond_1
    sub-double/2addr v1, v12

    div-double/2addr v1, v10

    const-wide v3, 0x4018ccccccccccd0L    # 6.200000000000003

    mul-double/2addr v1, v3

    const-wide v3, 0x404b800000000000L    # 55.0

    goto :goto_0

    .line 8
    :cond_2
    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    :cond_3
    const-wide/high16 v6, -0x3fa7000000000000L    # -100.0

    const-wide/high16 v8, 0x4059000000000000L    # 100.0

    .line 9
    invoke-static/range {v4 .. v9}, LP2/H;->A(DDD)D

    move-result-wide v1

    cmpl-double v3, v1, v20

    if-ltz v3, :cond_4

    sub-double v1, v1, v20

    div-double v1, v1, v18

    const-wide/high16 v3, 0x4031000000000000L    # 17.0

    mul-double/2addr v1, v3

    const-wide/high16 v3, 0x403b000000000000L    # 27.0

    goto :goto_0

    :cond_4
    cmpl-double v3, v1, v16

    if-ltz v3, :cond_5

    sub-double v1, v1, v16

    div-double/2addr v1, v14

    const-wide v3, 0x402599999999999aL    # 10.8

    mul-double/2addr v1, v3

    const-wide v3, 0x4030333333333333L    # 16.2

    goto :goto_0

    :cond_5
    sub-double/2addr v1, v12

    div-double/2addr v1, v10

    const-wide v3, 0x4009999999999998L    # 3.1999999999999993

    mul-double/2addr v1, v3

    const-wide/high16 v3, 0x402a000000000000L    # 13.0

    goto :goto_0

    .line 10
    :cond_6
    :goto_1
    iput-wide v6, v0, LGa/b;->d:D

    .line 11
    invoke-static {v6, v7}, Ljava/lang/Math;->signum(D)D

    move-result-wide v1

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(D)D

    move-result-wide v3

    invoke-static {v3, v4}, LXm/a;->T(D)I

    move-result v3

    int-to-double v3, v3

    mul-double/2addr v1, v3

    double-to-int v1, v1

    .line 12
    iput v1, v0, LGa/b;->e:I

    return-void
.end method

.method public static b(LGa/b;ILcom/eightsleep/data_core/enums/TemperatureDisplaySetting;I)LGa/b;
    .locals 1

    and-int/lit8 v0, p3, 0x1

    if-eqz v0, :cond_0

    iget p1, p0, LGa/b;->a:I

    :cond_0
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1

    iget-object p2, p0, LGa/b;->b:Lcom/eightsleep/data_core/enums/TemperatureDisplaySetting;

    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string p0, "displaySetting"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p0, LGa/b;

    invoke-direct {p0, p1, p2}, LGa/b;-><init>(ILcom/eightsleep/data_core/enums/TemperatureDisplaySetting;)V

    return-object p0
.end method

.method public static d(LGa/b;)Ljava/lang/String;
    .locals 2

    new-instance v0, LDl/A0;

    const/16 v1, 0xe

    invoke-direct {v0, v1}, LDl/A0;-><init>(I)V

    invoke-virtual {p0, v0}, LGa/b;->c(LFa/d;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static h(LGa/b;Lcom/eightsleep/data_core/enums/ChangeDirection;)LGa/b;
    .locals 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "direction"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, LGa/a;->b:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    invoke-virtual {p0}, LGa/b;->e()LGa/b;

    move-result-object p0

    return-object p0

    :cond_0
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0

    :cond_1
    invoke-virtual {p0, v0}, LGa/b;->f(I)LGa/b;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final a(LGa/b;)I
    .locals 1

    const-string v0, "other"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget p0, p0, LGa/b;->a:I

    iget p1, p1, LGa/b;->a:I

    invoke-static {p0, p1}, Lkotlin/jvm/internal/l;->k(II)I

    move-result p0

    return p0
.end method

.method public final c(LFa/d;)Ljava/lang/String;
    .locals 3

    iget-object v0, p0, LGa/b;->b:Lcom/eightsleep/data_core/enums/TemperatureDisplaySetting;

    iget-wide v1, p0, LGa/b;->d:D

    iget p0, p0, LGa/b;->e:I

    invoke-interface {p1, v1, v2, p0, v0}, LFa/d;->j(DILcom/eightsleep/data_core/enums/TemperatureDisplaySetting;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final e()LGa/b;
    .locals 5

    iget v0, p0, LGa/b;->e:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-virtual {p0, v0}, LGa/b;->g(I)I

    move-result v0

    new-instance v2, Lan/k;

    const/16 v3, -0x64

    const/16 v4, 0x64

    invoke-direct {v2, v3, v4, v1}, Lan/i;-><init>(III)V

    invoke-static {v0, v2}, LP2/H;->D(ILan/k;)I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-static {p0, v0, v2, v1}, LGa/b;->b(LGa/b;ILcom/eightsleep/data_core/enums/TemperatureDisplaySetting;I)LGa/b;

    move-result-object p0

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, LGa/b;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, LGa/b;

    iget v1, p1, LGa/b;->a:I

    iget v3, p0, LGa/b;->a:I

    if-eq v3, v1, :cond_2

    return v2

    :cond_2
    iget-object p0, p0, LGa/b;->b:Lcom/eightsleep/data_core/enums/TemperatureDisplaySetting;

    iget-object p1, p1, LGa/b;->b:Lcom/eightsleep/data_core/enums/TemperatureDisplaySetting;

    if-eq p0, p1, :cond_3

    return v2

    :cond_3
    return v0
.end method

.method public final f(I)LGa/b;
    .locals 4

    iget v0, p0, LGa/b;->e:I

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, LGa/b;->g(I)I

    move-result p1

    new-instance v0, Lan/k;

    const/16 v1, -0x64

    const/16 v2, 0x64

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lan/i;-><init>(III)V

    invoke-static {p1, v0}, LP2/H;->D(ILan/k;)I

    move-result p1

    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-static {p0, p1, v1, v0}, LGa/b;->b(LGa/b;ILcom/eightsleep/data_core/enums/TemperatureDisplaySetting;I)LGa/b;

    move-result-object p0

    return-object p0
.end method

.method public final g(I)I
    .locals 21

    move/from16 v0, p1

    sget-object v1, LGa/a;->a:[I

    move-object/from16 v2, p0

    iget-object v2, v2, LGa/b;->b:Lcom/eightsleep/data_core/enums/TemperatureDisplaySetting;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x1

    const-wide/high16 v3, 0x4024000000000000L    # 10.0

    if-eq v1, v2, :cond_6

    const/4 v2, 0x2

    const-wide/high16 v5, -0x3fa7000000000000L    # -100.0

    const-wide v7, -0x3fa9800000000000L    # -90.0

    const-wide v9, 0x4056800000000000L    # 90.0

    const-wide/16 v11, 0x0

    const-wide/high16 v13, 0x4059000000000000L    # 100.0

    if-eq v1, v2, :cond_3

    const/4 v2, 0x3

    if-ne v1, v2, :cond_2

    int-to-double v0, v0

    const-wide v17, 0x404b800000000000L    # 55.0

    const-wide v19, 0x405b800000000000L    # 110.0

    move-wide v15, v0

    invoke-static/range {v15 .. v20}, LP2/H;->A(DDD)D

    move-result-wide v0

    const-wide v15, 0x4054266666666666L    # 80.6

    cmpl-double v2, v0, v15

    if-ltz v2, :cond_0

    sub-double/2addr v0, v15

    const-wide v2, 0x403d666666666668L    # 29.400000000000006

    div-double/2addr v0, v2

    :goto_0
    mul-double/2addr v0, v13

    add-double/2addr v0, v11

    goto :goto_3

    :cond_0
    const-wide v11, 0x404e99999999999aL    # 61.2

    cmpl-double v2, v0, v11

    if-ltz v2, :cond_1

    sub-double/2addr v0, v11

    const-wide v2, 0x4033666666666664L    # 19.39999999999999

    div-double/2addr v0, v2

    :goto_1
    mul-double/2addr v0, v9

    add-double/2addr v0, v7

    goto :goto_3

    :cond_1
    const-wide v7, 0x404b800000000000L    # 55.0

    sub-double/2addr v0, v7

    const-wide v7, 0x4018ccccccccccd0L    # 6.200000000000003

    div-double/2addr v0, v7

    :goto_2
    mul-double/2addr v0, v3

    add-double/2addr v0, v5

    goto :goto_3

    :cond_2
    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    :cond_3
    int-to-double v0, v0

    const-wide/high16 v17, 0x402a000000000000L    # 13.0

    const-wide/high16 v19, 0x4046000000000000L    # 44.0

    move-wide v15, v0

    invoke-static/range {v15 .. v20}, LP2/H;->A(DDD)D

    move-result-wide v0

    const-wide/high16 v15, 0x403b000000000000L    # 27.0

    cmpl-double v2, v0, v15

    if-ltz v2, :cond_4

    sub-double/2addr v0, v15

    const-wide/high16 v2, 0x4031000000000000L    # 17.0

    div-double/2addr v0, v2

    goto :goto_0

    :cond_4
    const-wide v11, 0x4030333333333333L    # 16.2

    cmpl-double v2, v0, v11

    if-ltz v2, :cond_5

    sub-double/2addr v0, v11

    const-wide v2, 0x402599999999999aL    # 10.8

    div-double/2addr v0, v2

    goto :goto_1

    :cond_5
    const-wide/high16 v7, 0x402a000000000000L    # 13.0

    sub-double/2addr v0, v7

    const-wide v7, 0x4009999999999998L    # 3.1999999999999993

    div-double/2addr v0, v7

    goto :goto_2

    :cond_6
    int-to-double v0, v0

    mul-double/2addr v0, v3

    :goto_3
    invoke-static {v0, v1}, LXm/a;->T(D)I

    move-result v0

    return v0
.end method

.method public final hashCode()I
    .locals 1

    iget v0, p0, LGa/b;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, LGa/b;->b:Lcom/eightsleep/data_core/enums/TemperatureDisplaySetting;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, LDl/A0;

    const/16 v1, 0xe

    invoke-direct {v0, v1}, LDl/A0;-><init>(I)V

    invoke-virtual {p0, v0}, LGa/b;->c(LFa/d;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
