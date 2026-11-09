.class public abstract LP2/n;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile a:Lu5/e;

.field public static volatile b:Lu5/d;


# direct methods
.method public static final A(Lcom/eightsleep/data_metrics/data/model/MenopauseTreatmentBody;)Lsc/A;
    .locals 14

    invoke-virtual {p0}, Lcom/eightsleep/data_metrics/data/model/MenopauseTreatmentBody;->getCategory()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    if-nez v0, :cond_0

    move-object v3, v1

    goto :goto_0

    :cond_0
    move-object v3, v0

    :goto_0
    invoke-virtual {p0}, Lcom/eightsleep/data_metrics/data/model/MenopauseTreatmentBody;->getTreatmentId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/eightsleep/data_metrics/data/model/MenopauseTreatmentBody;->getPreviousTreatmentId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lcom/eightsleep/data_metrics/data/model/MenopauseTreatmentBody;->getHormone()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lcom/eightsleep/data_metrics/data/model/MenopauseTreatmentBody;->getMethod()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Lcom/eightsleep/data_metrics/data/model/MenopauseTreatmentBody;->getMedicationName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0}, Lcom/eightsleep/data_metrics/data/model/MenopauseTreatmentBody;->getDoses()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_1

    sget-object v0, LIm/z;->a:LIm/z;

    :cond_1
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/eightsleep/data_metrics/data/model/MenopauseDoseBody;

    invoke-virtual {v2}, Lcom/eightsleep/data_metrics/data/model/MenopauseDoseBody;->getAmount()Ljava/lang/Double;

    move-result-object v10

    if-eqz v10, :cond_4

    invoke-virtual {v10}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v10

    new-instance v12, Lsc/e;

    invoke-virtual {v2}, Lcom/eightsleep/data_metrics/data/model/MenopauseDoseBody;->getHormone()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v2}, Lcom/eightsleep/data_metrics/data/model/MenopauseDoseBody;->getUnit()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    move-object v2, v1

    :cond_3
    invoke-direct {v12, v13, v10, v11, v2}, Lsc/e;-><init>(Ljava/lang/String;DLjava/lang/String;)V

    goto :goto_2

    :cond_4
    const/4 v12, 0x0

    :goto_2
    if-eqz v12, :cond_2

    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_5
    invoke-virtual {p0}, Lcom/eightsleep/data_metrics/data/model/MenopauseTreatmentBody;->getFrequency()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0}, Lcom/eightsleep/data_metrics/data/model/MenopauseTreatmentBody;->getStartDate()Ljava/time/LocalDate;

    move-result-object v11

    invoke-virtual {p0}, Lcom/eightsleep/data_metrics/data/model/MenopauseTreatmentBody;->getStopDate()Ljava/time/LocalDate;

    move-result-object v12

    new-instance v2, Lsc/A;

    invoke-direct/range {v2 .. v12}, Lsc/A;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/time/LocalDate;Ljava/time/LocalDate;)V

    return-object v2
.end method

.method public static final B(Lsc/m;Lcom/eightsleep/data_metrics/data/model/MenopauseModeStatusResponse;)Lsc/m;
    .locals 12

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/eightsleep/data_metrics/data/model/MenopauseModeStatusResponse;->getStatus()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    :goto_0
    move-object v3, v0

    goto :goto_2

    :cond_1
    :goto_1
    iget-object v0, p0, Lsc/m;->b:Ljava/lang/String;

    goto :goto_0

    :goto_2
    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lcom/eightsleep/data_metrics/data/model/MenopauseModeStatusResponse;->getEnrolledAt()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_3

    invoke-static {p1}, LP2/n;->e0(Ljava/lang/String;)Ljava/time/LocalDate;

    move-result-object p1

    if-nez p1, :cond_2

    goto :goto_4

    :cond_2
    :goto_3
    move-object v4, p1

    goto :goto_5

    :cond_3
    :goto_4
    iget-object p1, p0, Lsc/m;->c:Ljava/time/LocalDate;

    goto :goto_3

    :goto_5
    const/4 v8, 0x0

    const/16 v11, 0x1f9

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v1, p0

    invoke-static/range {v1 .. v11}, Lsc/m;->a(Lsc/m;ZLjava/lang/String;Ljava/time/LocalDate;Lsc/q;Ljava/time/LocalDate;Ljava/util/ArrayList;Ljava/util/ArrayList;Lsc/o;Ljava/time/LocalDate;I)Lsc/m;

    move-result-object p0

    return-object p0
.end method

.method public static final C(Ljava/io/File;Le6/d;)Z
    .locals 14

    const-string v0, "internalLogger"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->canRead()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :goto_0
    move-object v6, v0

    goto :goto_2

    :goto_1
    move-object v2, p1

    move-object v12, v0

    goto :goto_3

    :catch_0
    move-exception v0

    goto :goto_0

    :goto_2
    sget-object v3, Le6/b;->ERROR:Le6/b;

    sget-object v0, Le6/c;->MAINTAINER:Le6/c;

    sget-object v2, Le6/c;->TELEMETRY:Le6/c;

    filled-new-array {v0, v2}, [Le6/c;

    move-result-object v0

    invoke-static {v0}, LIm/s;->g0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    new-instance v5, LA6/d;

    const/16 v0, 0xa

    invoke-direct {v5, p0, v0}, LA6/d;-><init>(Ljava/io/File;I)V

    const/16 v7, 0x30

    move-object v2, p1

    invoke-static/range {v2 .. v7}, Landroidx/room/migration/bundle/a;->C(Le6/d;Le6/b;Ljava/util/List;LVm/a;Ljava/lang/Throwable;I)V

    goto :goto_4

    :catch_1
    move-exception v0

    goto :goto_1

    :goto_3
    sget-object v9, Le6/b;->ERROR:Le6/b;

    sget-object p1, Le6/c;->MAINTAINER:Le6/c;

    sget-object v0, Le6/c;->TELEMETRY:Le6/c;

    filled-new-array {p1, v0}, [Le6/c;

    move-result-object p1

    invoke-static {p1}, LIm/s;->g0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    new-instance v11, LA6/d;

    const/16 p1, 0x9

    invoke-direct {v11, p0, p1}, LA6/d;-><init>(Ljava/io/File;I)V

    const/16 v13, 0x30

    move-object v8, v2

    invoke-static/range {v8 .. v13}, Landroidx/room/migration/bundle/a;->C(Le6/d;Le6/b;Ljava/util/List;LVm/a;Ljava/lang/Throwable;I)V

    :goto_4
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public static D(LLb/g0;LLb/F;)Z
    .locals 6

    const-string v0, "params"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p1, LLb/F;->h:Ljava/util/Map;

    invoke-interface {p0, v0}, LHa/a;->canMessageKeyShow(Ljava/util/Map;)Z

    move-result v0

    iget-object v1, p1, LLb/F;->n:LWc/b;

    invoke-interface {p0, v1}, LLb/g0;->b(LWc/b;)Z

    move-result v1

    iget-object v2, p1, LLb/F;->c:LQb/l;

    invoke-interface {p0, v2}, LLb/g0;->e(LQb/l;)Z

    move-result v2

    iget-object v3, p1, LLb/F;->a:LQb/p;

    iget-object v3, v3, LQb/p;->B:LDd/d;

    invoke-interface {p0, v3}, LLb/g0;->c(LDd/d;)Z

    move-result v3

    new-instance v4, Ljava/util/ArrayList;

    iget-object p1, p1, LLb/F;->i:Ljava/util/List;

    const/16 v5, 0xa

    invoke-static {p1, v5}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, LHm/k;

    iget-object v5, v5, LHm/k;->a:Ljava/lang/Object;

    check-cast v5, LRc/d;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    invoke-interface {p0, v4}, LLb/g0;->g(Ljava/util/List;)Z

    move-result p0

    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    if-eqz v2, :cond_1

    if-eqz v3, :cond_1

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public static E(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 0

    if-eqz p0, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final F(JJ)J
    .locals 7

    invoke-static {p0, p1}, LH0/w;->d(J)F

    move-result v0

    invoke-static {p2, p3}, LH0/w;->d(J)F

    move-result v1

    const/4 v2, 0x1

    int-to-float v2, v2

    sub-float/2addr v2, v0

    mul-float v3, v1, v2

    add-float/2addr v3, v0

    const v4, 0x3a83126f    # 0.001f

    cmpg-float v5, v3, v4

    if-gez v5, :cond_0

    move v3, v4

    :cond_0
    invoke-static {p0, p1}, LH0/w;->h(J)F

    move-result v4

    mul-float/2addr v4, v0

    invoke-static {p2, p3}, LH0/w;->h(J)F

    move-result v5

    mul-float/2addr v5, v1

    mul-float/2addr v5, v2

    add-float/2addr v5, v4

    div-float/2addr v5, v3

    invoke-static {p0, p1}, LH0/w;->g(J)F

    move-result v4

    mul-float/2addr v4, v0

    invoke-static {p2, p3}, LH0/w;->g(J)F

    move-result v6

    mul-float/2addr v6, v1

    mul-float/2addr v6, v2

    add-float/2addr v6, v4

    div-float/2addr v6, v3

    invoke-static {p0, p1}, LH0/w;->e(J)F

    move-result p0

    mul-float/2addr p0, v0

    invoke-static {p2, p3}, LH0/w;->e(J)F

    move-result p1

    mul-float/2addr p1, v1

    mul-float/2addr p1, v2

    add-float/2addr p1, p0

    div-float/2addr p1, v3

    const/16 p0, 0x10

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-static {v5, v6, p1, p2, p0}, LH0/F;->f(FFFFI)J

    move-result-wide p0

    return-wide p0
.end method

.method public static G(J)J
    .locals 2

    sget-object v0, Lme/L;->a:Lme/J;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lme/J;->b:Lme/x;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lme/x;->c:LHm/p;

    invoke-virtual {v0}, LHm/p;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LH0/w;

    iget-wide v0, v0, LH0/w;->a:J

    invoke-static {p0, p1, v0, v1}, LP2/n;->F(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public static H(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x3

    invoke-static {v0}, LP2/n;->W(I)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, " \ud83d\udc9a "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public static final I(Ljava/io/File;Le6/d;)Z
    .locals 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "internalLogger"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    sget-object v1, Ly6/a;->b:Ly6/a;

    invoke-static {p0, v0, p1, v1}, LP2/n;->c0(Ljava/io/File;Ljava/lang/Object;Le6/d;LVm/k;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public static J(LLb/g0;LQb/l;)Z
    .locals 0

    if-eqz p1, :cond_0

    iget-object p1, p1, LQb/l;->A:Ljava/util/List;

    if-eqz p1, :cond_0

    invoke-interface {p0}, LLb/g0;->f()Ljava/util/Set;

    move-result-object p0

    check-cast p0, Ljava/util/Collection;

    invoke-interface {p1, p0}, Ljava/util/List;->containsAll(Ljava/util/Collection;)Z

    move-result p0

    return p0

    :cond_0
    invoke-interface {p0}, LLb/g0;->f()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->isEmpty()Z

    move-result p0

    return p0
.end method

.method public static K(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x6

    invoke-static {v0}, LP2/n;->W(I)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, " \u2764\ufe0f "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, LP2/H;->N(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public static L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 2

    const/4 v0, 0x6

    invoke-static {v0}, LP2/n;->W(I)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, " \u2764\ufe0f "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, p2}, LP2/H;->O(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    return-void
.end method

.method public static final M(Ljava/io/File;Le6/d;)Z
    .locals 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "internalLogger"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    sget-object v1, Ly6/a;->c:Ly6/a;

    invoke-static {p0, v0, p1, v1}, LP2/n;->c0(Ljava/io/File;Ljava/lang/Object;Le6/d;LVm/k;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public static N(LWc/b;)V
    .locals 1

    const-string v0, "featureFlags"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public static O(Ljava/util/List;Lcom/eightsleep/data_metrics/domain/model/DailyTrends;Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;ZZZLFf/p;Z)LFf/I0;
    .locals 17

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p6

    const-string v3, "bioAge"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface/range {p0 .. p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    if-eqz p4, :cond_0

    goto :goto_0

    :cond_0
    if-eqz p3, :cond_1

    sget-object v3, LFf/I0;->d:Ljava/util/List;

    goto :goto_1

    :cond_1
    sget-object v3, LFf/I0;->e:Ljava/util/List;

    goto :goto_1

    :cond_2
    :goto_0
    move-object/from16 v3, p0

    :goto_1
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-eqz v5, :cond_57

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/eightsleep/data_metrics/enums/MetricDataType;

    const-string v8, "metric"

    invoke-static {v5, v8}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v8, LFf/r0;->a:[I

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    aget v5, v8, v5

    const/4 v8, 0x4

    const/4 v9, 0x6

    const-wide/16 v10, 0x0

    const-wide/16 v12, 0x0

    const/16 v14, 0x50

    const/16 v15, 0x64

    const/16 v16, 0x0

    packed-switch v5, :pswitch_data_0

    goto/16 :goto_3b

    :pswitch_0
    if-eqz v0, :cond_5

    iget-object v5, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->M:Lrc/c;

    if-eqz v5, :cond_4

    iget-object v5, v5, Lrc/c;->a:Lrc/d;

    if-eqz v5, :cond_4

    iget-object v5, v5, Lrc/d;->b:Ljava/lang/Integer;

    goto :goto_3

    :cond_4
    move-object v5, v6

    :goto_3
    if-eqz v5, :cond_5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-long v5, v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    :cond_5
    new-instance v5, LFf/y0;

    invoke-direct {v5, v6}, LFf/y0;-><init>(Ljava/lang/Long;)V

    :goto_4
    move-object v6, v5

    goto/16 :goto_3b

    :pswitch_1
    new-instance v5, LFf/z0;

    if-eqz v0, :cond_6

    iget-object v7, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->M:Lrc/c;

    if-eqz v7, :cond_6

    iget-object v7, v7, Lrc/c;->a:Lrc/d;

    if-eqz v7, :cond_6

    iget v6, v7, Lrc/d;->a:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    :cond_6
    invoke-direct {v5, v6}, LFf/z0;-><init>(Ljava/lang/Integer;)V

    goto :goto_4

    :pswitch_2
    if-eqz v0, :cond_7

    iget-object v5, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->N:Ltc/a;

    if-eqz v5, :cond_7

    iget-object v5, v5, Ltc/a;->f:Ltc/e;

    if-eqz v5, :cond_7

    iget-object v5, v5, Ltc/e;->a:LGa/s;

    goto :goto_5

    :cond_7
    move-object v5, v6

    :goto_5
    if-eqz v0, :cond_8

    iget-object v7, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->N:Ltc/a;

    if-eqz v7, :cond_8

    iget-object v7, v7, Ltc/a;->f:Ltc/e;

    if-eqz v7, :cond_8

    iget-object v6, v7, Ltc/e;->c:LGa/s;

    :cond_8
    new-instance v7, LFf/v0;

    invoke-direct {v7, v5, v6}, LFf/v0;-><init>(LGa/s;LGa/s;)V

    :goto_6
    move-object v6, v7

    goto/16 :goto_3b

    :pswitch_3
    if-eqz v0, :cond_9

    iget-object v5, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->N:Ltc/a;

    if-eqz v5, :cond_9

    iget-object v5, v5, Ltc/a;->g:Ltc/c;

    if-eqz v5, :cond_9

    iget-object v5, v5, Ltc/c;->a:LGa/s;

    goto :goto_7

    :cond_9
    move-object v5, v6

    :goto_7
    if-eqz v0, :cond_a

    iget-object v7, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->N:Ltc/a;

    if-eqz v7, :cond_a

    iget-object v7, v7, Ltc/a;->g:Ltc/c;

    if-eqz v7, :cond_a

    iget-object v6, v7, Ltc/c;->c:LGa/s;

    :cond_a
    new-instance v7, LFf/w0;

    invoke-direct {v7, v5, v6}, LFf/w0;-><init>(LGa/s;LGa/s;)V

    goto :goto_6

    :pswitch_4
    new-instance v5, LFf/q0;

    if-eqz v0, :cond_b

    iget-object v8, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->J:Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;

    iget-object v8, v8, Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;->d:Lcom/eightsleep/data_metrics/domain/model/MetricWithAbnormality;

    iget-object v8, v8, Lcom/eightsleep/data_metrics/domain/model/MetricWithAbnormality;->a:Ljava/lang/Object;

    check-cast v8, Ljava/lang/Double;

    goto :goto_8

    :cond_b
    move-object v8, v6

    :goto_8
    if-eqz v0, :cond_d

    iget-object v6, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->J:Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;

    iget-object v9, v6, Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;->d:Lcom/eightsleep/data_metrics/domain/model/MetricWithAbnormality;

    iget-object v9, v9, Lcom/eightsleep/data_metrics/domain/model/MetricWithAbnormality;->a:Ljava/lang/Object;

    check-cast v9, Ljava/lang/Double;

    if-eqz v9, :cond_c

    invoke-virtual {v9}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v9

    iget-object v6, v6, Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;->d:Lcom/eightsleep/data_metrics/domain/model/MetricWithAbnormality;

    iget-object v6, v6, Lcom/eightsleep/data_metrics/domain/model/MetricWithAbnormality;->f:Ljava/lang/Object;

    check-cast v6, Ljava/lang/Double;

    if-eqz v6, :cond_c

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v11

    cmpg-double v6, v9, v11

    if-gtz v6, :cond_c

    goto :goto_9

    :cond_c
    move/from16 v7, v16

    :goto_9
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :cond_d
    invoke-direct {v5, v6, v8}, LFf/q0;-><init>(Ljava/lang/Boolean;Ljava/lang/Double;)V

    goto/16 :goto_4

    :pswitch_5
    const-wide/high16 v8, 0x4059000000000000L    # 100.0

    if-eqz v0, :cond_f

    iget-object v5, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->k:Ljava/lang/Integer;

    if-eqz v5, :cond_e

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-double v10, v5

    div-double/2addr v10, v8

    invoke-static {v10, v11}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    goto :goto_a

    :cond_e
    move-object v5, v6

    :goto_a
    if-eqz v5, :cond_f

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v12

    :cond_f
    int-to-double v10, v15

    mul-double/2addr v12, v10

    double-to-int v5, v12

    new-instance v10, LFf/F0;

    if-eqz v0, :cond_10

    iget-object v11, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->J:Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;

    iget-object v11, v11, Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;->i:Lcom/eightsleep/data_metrics/domain/model/Metric;

    iget-object v11, v11, Lcom/eightsleep/data_metrics/domain/model/Metric;->a:Ljava/lang/Object;

    check-cast v11, Ljava/lang/Number;

    invoke-virtual {v11}, Ljava/lang/Number;->longValue()J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    goto :goto_b

    :cond_10
    move-object v11, v6

    :goto_b
    if-eqz v0, :cond_13

    iget-object v12, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->k:Ljava/lang/Integer;

    if-eqz v12, :cond_11

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v6

    int-to-double v12, v6

    div-double/2addr v12, v8

    invoke-static {v12, v13}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    :cond_11
    if-eqz v6, :cond_12

    invoke-virtual {v6}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v8

    const-wide v12, 0x3fb999999999999aL    # 0.1

    cmpg-double v6, v8, v12

    if-gtz v6, :cond_12

    goto :goto_c

    :cond_12
    move/from16 v7, v16

    :goto_c
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :cond_13
    invoke-direct {v10, v11, v6, v5}, LFf/F0;-><init>(Ljava/lang/Long;Ljava/lang/Boolean;I)V

    move-object v6, v10

    goto/16 :goto_3b

    :pswitch_6
    new-instance v5, LFf/x0;

    if-eqz v0, :cond_15

    iget-object v8, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->J:Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;

    iget-object v8, v8, Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;->c:Lcom/eightsleep/data_metrics/domain/model/MetricWithAbnormality;

    if-eqz v8, :cond_14

    iget-object v8, v8, Lcom/eightsleep/data_metrics/domain/model/MetricWithAbnormality;->a:Ljava/lang/Object;

    check-cast v8, Ljava/lang/Double;

    goto :goto_d

    :cond_14
    move-object v8, v6

    :goto_d
    if-eqz v8, :cond_15

    invoke-virtual {v8}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    invoke-static {v8, v9}, LXm/a;->T(D)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    goto :goto_e

    :cond_15
    move-object v8, v6

    :goto_e
    if-eqz v0, :cond_19

    iget-object v9, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->J:Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;

    iget-object v10, v9, Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;->c:Lcom/eightsleep/data_metrics/domain/model/MetricWithAbnormality;

    if-eqz v10, :cond_16

    iget-object v10, v10, Lcom/eightsleep/data_metrics/domain/model/MetricWithAbnormality;->a:Ljava/lang/Object;

    check-cast v10, Ljava/lang/Double;

    goto :goto_f

    :cond_16
    move-object v10, v6

    :goto_f
    if-eqz v10, :cond_18

    invoke-virtual {v10}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v10

    iget-object v9, v9, Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;->c:Lcom/eightsleep/data_metrics/domain/model/MetricWithAbnormality;

    if-eqz v9, :cond_17

    iget-object v6, v9, Lcom/eightsleep/data_metrics/domain/model/MetricWithAbnormality;->f:Ljava/lang/Object;

    check-cast v6, Ljava/lang/Double;

    :cond_17
    if-eqz v6, :cond_18

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v12

    cmpl-double v6, v10, v12

    if-ltz v6, :cond_18

    goto :goto_10

    :cond_18
    move/from16 v7, v16

    :goto_10
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :cond_19
    invoke-direct {v5, v8, v6}, LFf/x0;-><init>(Ljava/lang/Integer;Ljava/lang/Boolean;)V

    goto/16 :goto_4

    :pswitch_7
    new-instance v5, LFf/C0;

    if-eqz v0, :cond_1a

    iget-object v8, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->J:Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;

    iget-object v8, v8, Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;->e:Lcom/eightsleep/data_metrics/domain/model/MetricWithAbnormality;

    iget-object v8, v8, Lcom/eightsleep/data_metrics/domain/model/MetricWithAbnormality;->a:Ljava/lang/Object;

    check-cast v8, Ljava/lang/Double;

    if-eqz v8, :cond_1a

    invoke-virtual {v8}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    invoke-static {v8, v9}, LXm/a;->T(D)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    goto :goto_11

    :cond_1a
    move-object v8, v6

    :goto_11
    if-eqz v0, :cond_1c

    iget-object v6, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->J:Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;

    iget-object v9, v6, Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;->e:Lcom/eightsleep/data_metrics/domain/model/MetricWithAbnormality;

    iget-object v9, v9, Lcom/eightsleep/data_metrics/domain/model/MetricWithAbnormality;->a:Ljava/lang/Object;

    check-cast v9, Ljava/lang/Double;

    if-eqz v9, :cond_1b

    invoke-virtual {v9}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v9

    iget-object v6, v6, Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;->e:Lcom/eightsleep/data_metrics/domain/model/MetricWithAbnormality;

    iget-object v6, v6, Lcom/eightsleep/data_metrics/domain/model/MetricWithAbnormality;->f:Ljava/lang/Object;

    check-cast v6, Ljava/lang/Double;

    if-eqz v6, :cond_1b

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v11

    invoke-static {v11, v12}, LXm/a;->T(D)I

    move-result v6

    int-to-double v11, v6

    cmpg-double v6, v9, v11

    if-gtz v6, :cond_1b

    goto :goto_12

    :cond_1b
    move/from16 v7, v16

    :goto_12
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :cond_1c
    invoke-direct {v5, v8, v6}, LFf/C0;-><init>(Ljava/lang/Integer;Ljava/lang/Boolean;)V

    goto/16 :goto_4

    :pswitch_8
    if-eqz v1, :cond_1d

    iget-object v5, v1, Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;->f:Ljava/util/Map;

    sget-object v7, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->WAKEUP:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    invoke-interface {v5, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, LGa/s;

    if-eqz v5, :cond_1d

    invoke-virtual {v5}, LGa/s;->l()Ljava/time/LocalTime;

    move-result-object v5

    iget-object v7, v1, Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;->b:LGa/s;

    invoke-static {v7, v5, v6, v9}, LGa/s;->r(LGa/s;Ljava/time/LocalTime;LGa/s;I)LGa/s;

    move-result-object v5

    goto :goto_13

    :cond_1d
    move-object v5, v6

    :goto_13
    if-eqz v5, :cond_1e

    invoke-static {v5}, LP2/g;->v(LGa/s;)Lrg/a;

    move-result-object v5

    goto :goto_14

    :cond_1e
    move-object v5, v6

    :goto_14
    if-eqz v0, :cond_1f

    iget-object v7, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->K:Lcom/eightsleep/data_metrics/domain/model/SleepRoutineScore;

    iget-object v7, v7, Lcom/eightsleep/data_metrics/domain/model/SleepRoutineScore;->b:Lrc/l;

    iget-object v7, v7, Lrc/l;->a:LGa/s;

    goto :goto_15

    :cond_1f
    move-object v7, v6

    :goto_15
    if-eqz v7, :cond_20

    if-eqz v1, :cond_21

    iget-object v8, v1, Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;->b:LGa/s;

    invoke-virtual {v7}, LGa/s;->l()Ljava/time/LocalTime;

    move-result-object v7

    invoke-static {v8, v7, v6, v9}, LGa/s;->r(LGa/s;Ljava/time/LocalTime;LGa/s;I)LGa/s;

    move-result-object v7

    goto :goto_16

    :cond_20
    move-object v7, v6

    :cond_21
    :goto_16
    if-eqz v5, :cond_22

    if-eqz v7, :cond_22

    iget-object v6, v7, LGa/s;->a:Ljava/time/Instant;

    invoke-virtual {v5, v6}, Lrg/a;->b(Ljava/time/Instant;)Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :cond_22
    new-instance v5, LFf/n0;

    invoke-direct {v5, v7, v6}, LFf/n0;-><init>(LGa/s;Ljava/lang/Boolean;)V

    goto/16 :goto_4

    :pswitch_9
    if-eqz v1, :cond_23

    iget-object v5, v1, Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;->f:Ljava/util/Map;

    sget-object v7, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->WAKEUP:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    invoke-interface {v5, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, LGa/s;

    if-eqz v5, :cond_23

    invoke-virtual {v5}, LGa/s;->l()Ljava/time/LocalTime;

    move-result-object v5

    iget-object v7, v1, Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;->b:LGa/s;

    invoke-static {v7, v5, v6, v9}, LGa/s;->r(LGa/s;Ljava/time/LocalTime;LGa/s;I)LGa/s;

    move-result-object v5

    goto :goto_17

    :cond_23
    move-object v5, v6

    :goto_17
    if-eqz v1, :cond_24

    iget-object v7, v1, Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;->f:Ljava/util/Map;

    sget-object v10, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->SLEEP_START_TIME:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    invoke-interface {v7, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, LGa/s;

    if-eqz v7, :cond_24

    invoke-virtual {v7}, LGa/s;->l()Ljava/time/LocalTime;

    move-result-object v7

    iget-object v10, v1, Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;->b:LGa/s;

    invoke-static {v10, v7, v5, v8}, LGa/s;->r(LGa/s;Ljava/time/LocalTime;LGa/s;I)LGa/s;

    move-result-object v5

    goto :goto_18

    :cond_24
    move-object v5, v6

    :goto_18
    if-eqz v5, :cond_25

    invoke-static {v5}, LP2/g;->v(LGa/s;)Lrg/a;

    move-result-object v5

    goto :goto_19

    :cond_25
    move-object v5, v6

    :goto_19
    if-eqz v0, :cond_26

    iget-object v7, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->K:Lcom/eightsleep/data_metrics/domain/model/SleepRoutineScore;

    iget-object v7, v7, Lcom/eightsleep/data_metrics/domain/model/SleepRoutineScore;->b:Lrc/l;

    iget-object v7, v7, Lrc/l;->a:LGa/s;

    goto :goto_1a

    :cond_26
    move-object v7, v6

    :goto_1a
    if-eqz v7, :cond_27

    if-eqz v1, :cond_28

    iget-object v10, v1, Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;->b:LGa/s;

    invoke-virtual {v7}, LGa/s;->l()Ljava/time/LocalTime;

    move-result-object v7

    invoke-static {v10, v7, v6, v9}, LGa/s;->r(LGa/s;Ljava/time/LocalTime;LGa/s;I)LGa/s;

    move-result-object v7

    goto :goto_1b

    :cond_27
    move-object v7, v6

    :cond_28
    :goto_1b
    if-eqz v0, :cond_29

    iget-object v9, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->K:Lcom/eightsleep/data_metrics/domain/model/SleepRoutineScore;

    iget-object v9, v9, Lcom/eightsleep/data_metrics/domain/model/SleepRoutineScore;->d:Lrc/l;

    iget-object v9, v9, Lrc/l;->a:LGa/s;

    goto :goto_1c

    :cond_29
    move-object v9, v6

    :goto_1c
    if-eqz v9, :cond_2a

    if-eqz v1, :cond_2b

    iget-object v10, v1, Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;->b:LGa/s;

    invoke-virtual {v9}, LGa/s;->l()Ljava/time/LocalTime;

    move-result-object v9

    invoke-static {v10, v9, v7, v8}, LGa/s;->r(LGa/s;Ljava/time/LocalTime;LGa/s;I)LGa/s;

    move-result-object v9

    goto :goto_1d

    :cond_2a
    move-object v9, v6

    :cond_2b
    :goto_1d
    if-eqz v9, :cond_2c

    if-eqz v5, :cond_2c

    iget-object v6, v9, LGa/s;->a:Ljava/time/Instant;

    invoke-virtual {v5, v6}, Lrg/a;->b(Ljava/time/Instant;)Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :cond_2c
    new-instance v5, LFf/m0;

    invoke-direct {v5, v9, v6}, LFf/m0;-><init>(LGa/s;Ljava/lang/Boolean;)V

    goto/16 :goto_4

    :pswitch_a
    if-eqz v1, :cond_2d

    iget-object v5, v1, Lcom/eightsleep/data_metrics/domain/model/AggregatePeriod;->h:Ljava/util/Map;

    sget-object v8, Lcom/eightsleep/data_metrics/enums/AggregateMetricType;->SLEEP_DEBT:Lcom/eightsleep/data_metrics/enums/AggregateMetricType;

    invoke-interface {v5, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Double;

    if-eqz v5, :cond_2d

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    double-to-long v8, v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    goto :goto_1e

    :cond_2d
    if-eqz v0, :cond_2e

    iget-object v5, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->J:Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;

    iget-object v5, v5, Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;->m:Lcom/eightsleep/data_metrics/domain/model/SleepDebt;

    if-eqz v5, :cond_2e

    iget-wide v8, v5, Lcom/eightsleep/data_metrics/domain/model/SleepDebt;->b:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    goto :goto_1e

    :cond_2e
    move-object v5, v6

    :goto_1e
    if-eqz v5, :cond_2f

    invoke-virtual {v5}, Ljava/lang/Number;->longValue()J

    move-result-wide v8

    neg-long v8, v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    goto :goto_1f

    :cond_2f
    move-object v5, v6

    :goto_1f
    new-instance v8, LFf/D0;

    if-eqz v5, :cond_31

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    cmp-long v6, v12, v10

    if-ltz v6, :cond_30

    goto :goto_20

    :cond_30
    move/from16 v7, v16

    :goto_20
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :cond_31
    invoke-direct {v8, v5, v6}, LFf/D0;-><init>(Ljava/lang/Long;Ljava/lang/Boolean;)V

    move-object v6, v8

    goto/16 :goto_3b

    :pswitch_b
    if-eqz v0, :cond_32

    iget-object v5, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->J:Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;

    iget-object v5, v5, Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;->g:Lcom/eightsleep/data_metrics/domain/model/Metric;

    iget-object v5, v5, Lcom/eightsleep/data_metrics/domain/model/Metric;->a:Ljava/lang/Object;

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->longValue()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    goto :goto_21

    :cond_32
    move-object v5, v6

    :goto_21
    if-eqz v0, :cond_34

    iget-object v8, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->J:Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;

    iget-object v8, v8, Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;->g:Lcom/eightsleep/data_metrics/domain/model/Metric;

    iget-object v8, v8, Lcom/eightsleep/data_metrics/domain/model/Metric;->a:Ljava/lang/Object;

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->longValue()J

    move-result-wide v8

    invoke-virtual {v0}, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->f()Ljava/lang/Long;

    move-result-object v14

    move-wide/from16 p3, v10

    if-eqz v14, :cond_35

    invoke-virtual {v14}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    cmp-long v14, v10, p3

    if-nez v14, :cond_33

    goto :goto_22

    :cond_33
    long-to-double v8, v8

    long-to-double v10, v10

    div-double/2addr v8, v10

    goto :goto_23

    :cond_34
    move-wide/from16 p3, v10

    :cond_35
    :goto_22
    move-wide v8, v12

    :goto_23
    int-to-double v10, v15

    mul-double/2addr v8, v10

    double-to-int v8, v8

    new-instance v9, LFf/B0;

    if-eqz v5, :cond_36

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    goto :goto_24

    :cond_36
    move-object v8, v6

    :goto_24
    if-eqz v0, :cond_3a

    iget-object v6, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->J:Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;

    iget-object v6, v6, Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;->g:Lcom/eightsleep/data_metrics/domain/model/Metric;

    iget-object v6, v6, Lcom/eightsleep/data_metrics/domain/model/Metric;->a:Ljava/lang/Object;

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->longValue()J

    move-result-wide v10

    invoke-virtual {v0}, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->f()Ljava/lang/Long;

    move-result-object v6

    if-eqz v6, :cond_38

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v14

    cmp-long v6, v14, p3

    if-nez v6, :cond_37

    goto :goto_25

    :cond_37
    long-to-double v10, v10

    long-to-double v12, v14

    div-double v12, v10, v12

    :cond_38
    :goto_25
    const-wide v10, 0x3fc999999999999aL    # 0.2

    cmpl-double v6, v12, v10

    if-ltz v6, :cond_39

    goto :goto_26

    :cond_39
    move/from16 v7, v16

    :goto_26
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :cond_3a
    invoke-direct {v9, v8, v6, v5}, LFf/B0;-><init>(Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Long;)V

    :goto_27
    move-object v6, v9

    goto/16 :goto_3b

    :pswitch_c
    move-wide/from16 p3, v10

    if-eqz v0, :cond_3b

    iget-object v5, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->J:Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;

    iget-object v5, v5, Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;->f:Lcom/eightsleep/data_metrics/domain/model/Metric;

    iget-object v5, v5, Lcom/eightsleep/data_metrics/domain/model/Metric;->a:Ljava/lang/Object;

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->longValue()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    goto :goto_28

    :cond_3b
    move-object v5, v6

    :goto_28
    if-eqz v0, :cond_3d

    iget-object v8, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->J:Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;

    iget-object v8, v8, Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;->f:Lcom/eightsleep/data_metrics/domain/model/Metric;

    iget-object v8, v8, Lcom/eightsleep/data_metrics/domain/model/Metric;->a:Ljava/lang/Object;

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->longValue()J

    move-result-wide v8

    invoke-virtual {v0}, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->f()Ljava/lang/Long;

    move-result-object v10

    if-eqz v10, :cond_3d

    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    cmp-long v14, v10, p3

    if-nez v14, :cond_3c

    goto :goto_29

    :cond_3c
    long-to-double v8, v8

    long-to-double v10, v10

    div-double/2addr v8, v10

    goto :goto_2a

    :cond_3d
    :goto_29
    move-wide v8, v12

    :goto_2a
    int-to-double v10, v15

    mul-double/2addr v8, v10

    double-to-int v8, v8

    new-instance v9, LFf/u0;

    if-eqz v5, :cond_3e

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    goto :goto_2b

    :cond_3e
    move-object v8, v6

    :goto_2b
    if-eqz v0, :cond_42

    iget-object v6, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->J:Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;

    iget-object v6, v6, Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;->f:Lcom/eightsleep/data_metrics/domain/model/Metric;

    iget-object v6, v6, Lcom/eightsleep/data_metrics/domain/model/Metric;->a:Ljava/lang/Object;

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->longValue()J

    move-result-wide v10

    invoke-virtual {v0}, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->f()Ljava/lang/Long;

    move-result-object v6

    if-eqz v6, :cond_40

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v14

    cmp-long v6, v14, p3

    if-nez v6, :cond_3f

    goto :goto_2c

    :cond_3f
    long-to-double v10, v10

    long-to-double v12, v14

    div-double v12, v10, v12

    :cond_40
    :goto_2c
    const-wide v10, 0x3fc3333333333333L    # 0.15

    cmpl-double v6, v12, v10

    if-ltz v6, :cond_41

    goto :goto_2d

    :cond_41
    move/from16 v7, v16

    :goto_2d
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :cond_42
    invoke-direct {v9, v8, v6, v5}, LFf/u0;-><init>(Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Long;)V

    goto :goto_27

    :pswitch_d
    iget-object v5, v2, LFf/p;->b:Lea/f;

    if-eqz v5, :cond_43

    iget-object v9, v5, Lea/f;->c:Ljava/lang/Double;

    goto :goto_2e

    :cond_43
    move-object v9, v6

    :goto_2e
    if-eqz v5, :cond_47

    iget-object v10, v5, Lea/f;->e:Lcom/eightsleep/data_bioage/enums/BioAgeStatus;

    if-eqz v10, :cond_47

    sget-object v11, LFf/o0;->a:[I

    invoke-virtual {v10}, Ljava/lang/Enum;->ordinal()I

    move-result v10

    aget v10, v11, v10

    if-eq v10, v7, :cond_46

    const/4 v11, 0x2

    if-eq v10, v11, :cond_45

    const/4 v11, 0x3

    if-eq v10, v11, :cond_47

    if-ne v10, v8, :cond_44

    goto :goto_2f

    :cond_44
    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    :cond_45
    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_30

    :cond_46
    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_30

    :cond_47
    :goto_2f
    move-object v8, v6

    :goto_30
    iget-boolean v10, v2, LFf/p;->a:Z

    if-eqz v10, :cond_49

    if-eqz v5, :cond_48

    iget-object v10, v5, Lea/f;->c:Ljava/lang/Double;

    goto :goto_31

    :cond_48
    move-object v10, v6

    :goto_31
    if-eqz v10, :cond_49

    goto :goto_32

    :cond_49
    move/from16 v7, v16

    :goto_32
    if-eqz v5, :cond_4a

    iget-object v6, v5, Lea/f;->a:Ljava/time/LocalDate;

    :cond_4a
    new-instance v5, LFf/p0;

    invoke-direct {v5, v9, v8, v7, v6}, LFf/p0;-><init>(Ljava/lang/Double;Ljava/lang/Boolean;ZLjava/time/LocalDate;)V

    goto/16 :goto_4

    :pswitch_e
    new-instance v5, LFf/G0;

    if-eqz v0, :cond_4b

    invoke-virtual {v0}, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->f()Ljava/lang/Long;

    move-result-object v8

    goto :goto_33

    :cond_4b
    move-object v8, v6

    :goto_33
    if-eqz v0, :cond_4d

    invoke-virtual {v0}, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->f()Ljava/lang/Long;

    move-result-object v6

    if-eqz v6, :cond_4c

    invoke-virtual {v6}, Ljava/lang/Number;->longValue()J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/time/Duration;->ofSeconds(J)Ljava/time/Duration;

    move-result-object v6

    if-eqz v6, :cond_4c

    sget-object v9, LAc/a;->b:Lan/h;

    invoke-virtual {v9, v6}, Lan/h;->g(Ljava/lang/Comparable;)Z

    move-result v6

    if-ne v6, v7, :cond_4c

    goto :goto_34

    :cond_4c
    move/from16 v7, v16

    :goto_34
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :cond_4d
    invoke-direct {v5, v8, v6}, LFf/G0;-><init>(Ljava/lang/Long;Ljava/lang/Boolean;)V

    goto/16 :goto_4

    :pswitch_f
    new-instance v5, LFf/s0;

    if-eqz v0, :cond_4e

    iget-object v8, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->K:Lcom/eightsleep/data_metrics/domain/model/SleepRoutineScore;

    iget v8, v8, Lcom/eightsleep/data_metrics/domain/model/SleepRoutineScore;->a:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    goto :goto_35

    :cond_4e
    move-object v8, v6

    :goto_35
    if-eqz v0, :cond_50

    iget-object v6, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->K:Lcom/eightsleep/data_metrics/domain/model/SleepRoutineScore;

    iget v6, v6, Lcom/eightsleep/data_metrics/domain/model/SleepRoutineScore;->a:I

    if-lt v6, v14, :cond_4f

    goto :goto_36

    :cond_4f
    move/from16 v7, v16

    :goto_36
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :cond_50
    invoke-direct {v5, v8, v6}, LFf/s0;-><init>(Ljava/lang/Integer;Ljava/lang/Boolean;)V

    goto/16 :goto_4

    :pswitch_10
    new-instance v5, LFf/A0;

    if-eqz v0, :cond_51

    iget-object v8, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->J:Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;

    iget v8, v8, Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;->a:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    goto :goto_37

    :cond_51
    move-object v8, v6

    :goto_37
    if-eqz v0, :cond_53

    iget-object v6, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->J:Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;

    iget v6, v6, Lcom/eightsleep/data_metrics/domain/model/SleepQualityScore;->a:I

    if-lt v6, v14, :cond_52

    goto :goto_38

    :cond_52
    move/from16 v7, v16

    :goto_38
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :cond_53
    invoke-direct {v5, v8, v6}, LFf/A0;-><init>(Ljava/lang/Integer;Ljava/lang/Boolean;)V

    goto/16 :goto_4

    :pswitch_11
    new-instance v5, LFf/E0;

    if-eqz v0, :cond_54

    iget v8, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->I:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    goto :goto_39

    :cond_54
    move-object v8, v6

    :goto_39
    if-eqz v0, :cond_56

    iget v6, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->I:I

    if-lt v6, v14, :cond_55

    goto :goto_3a

    :cond_55
    move/from16 v7, v16

    :goto_3a
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :cond_56
    invoke-direct {v5, v8, v6}, LFf/E0;-><init>(Ljava/lang/Integer;Ljava/lang/Boolean;)V

    goto/16 :goto_4

    :goto_3b
    if-eqz v6, :cond_3

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    :cond_57
    invoke-static {v4}, LIm/r;->U1(Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v0, :cond_59

    iget-object v0, v0, Lcom/eightsleep/data_metrics/domain/model/DailyTrends;->O:Lcom/eightsleep/data_metrics/domain/model/Cpap;

    if-eqz v0, :cond_59

    if-eqz p5, :cond_59

    iget v2, v0, Lcom/eightsleep/data_metrics/domain/model/Cpap;->c:I

    if-lez v2, :cond_59

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-le v7, v2, :cond_58

    move v7, v2

    :cond_58
    new-instance v2, LFf/t0;

    iget v3, v0, Lcom/eightsleep/data_metrics/domain/model/Cpap;->a:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget-boolean v4, v0, Lcom/eightsleep/data_metrics/domain/model/Cpap;->e:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    iget-object v0, v0, Lcom/eightsleep/data_metrics/domain/model/Cpap;->b:Ljava/time/Duration;

    invoke-virtual {v0}, Ljava/time/Duration;->getSeconds()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-direct {v2, v3, v4, v0}, LFf/t0;-><init>(Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Long;)V

    invoke-virtual {v1, v7, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_59
    new-instance v0, LFf/I0;

    move/from16 v2, p7

    invoke-direct {v0, v6, v2, v1}, LFf/I0;-><init>(Ljava/time/LocalDate;ZLjava/util/List;)V

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
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

.method public static P(Lcom/google/gson/o;)Lf6/i;
    .locals 8

    const-string v0, "Unable to parse json into type UserInfo"

    :try_start_0
    const-string v1, "id"

    invoke-virtual {p0, v1}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/google/gson/m;->k()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_3

    :catch_1
    move-exception p0

    goto :goto_4

    :catch_2
    move-exception p0

    goto :goto_5

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
    const-string v4, "email"

    invoke-virtual {p0, v4}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v4

    if-eqz v4, :cond_2

    invoke-virtual {v4}, Lcom/google/gson/m;->k()Ljava/lang/String;

    move-result-object v2

    :cond_2
    new-instance v4, Ljava/util/LinkedHashMap;

    invoke-direct {v4}, Ljava/util/LinkedHashMap;-><init>()V

    iget-object p0, p0, Lcom/google/gson/o;->a:Lcom/google/gson/internal/j;

    invoke-virtual {p0}, Lcom/google/gson/internal/j;->entrySet()Ljava/util/Set;

    move-result-object p0

    check-cast p0, Lcom/google/gson/internal/h;

    invoke-virtual {p0}, Lcom/google/gson/internal/h;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_3
    :goto_2
    move-object v5, p0

    check-cast v5, Lcom/google/gson/internal/g;

    invoke-virtual {v5}, Lcom/google/gson/internal/g;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    move-object v5, p0

    check-cast v5, Lcom/google/gson/internal/g;

    invoke-virtual {v5}, Lcom/google/gson/internal/g;->b()Lcom/google/gson/internal/i;

    move-result-object v5

    sget-object v6, Lf6/i;->e:[Ljava/lang/String;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    invoke-static {v6, v7}, LIm/n;->S([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    const-string v7, "entry.key"

    invoke-static {v6, v7}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v4, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_4
    new-instance p0, Lf6/i;

    invoke-direct {p0, v1, v3, v2, v4}, Lf6/i;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :goto_3
    new-instance v1, Lcom/google/gson/JsonParseException;

    invoke-direct {v1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :goto_4
    new-instance v1, Lcom/google/gson/JsonParseException;

    invoke-direct {v1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :goto_5
    new-instance v1, Lcom/google/gson/JsonParseException;

    invoke-direct {v1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static Q(Lcom/google/gson/o;)Lz7/x0;
    .locals 6

    const-string v0, "id"

    const-string v1, "Unable to parse json into type ErrorEventSession"

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/gson/m;->k()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lz7/z0;->Companion:Lz7/y0;

    const-string v4, "type"

    invoke-virtual {p0, v4}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/gson/m;->k()Ljava/lang/String;

    move-result-object v4

    const-string v5, "jsonObject.get(\"type\").asString"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4}, Lz7/y0;->a(Ljava/lang/String;)Lz7/z0;

    move-result-object v3

    const-string v4, "has_replay"

    invoke-virtual {p0, v4}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/google/gson/m;->c()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

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
    new-instance v4, Lz7/x0;

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v4, v2, v3, p0}, Lz7/x0;-><init>(Ljava/lang/String;Lz7/z0;Ljava/lang/Boolean;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v4

    :goto_1
    new-instance v0, Lcom/google/gson/JsonParseException;

    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :goto_2
    new-instance v0, Lcom/google/gson/JsonParseException;

    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :goto_3
    new-instance v0, Lcom/google/gson/JsonParseException;

    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static R(Lcom/google/gson/o;)Lz7/a3;
    .locals 3

    const-string v0, "id"

    const-string v1, "Unable to parse json into type Application"

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/gson/m;->k()Ljava/lang/String;

    move-result-object p0

    new-instance v2, Lz7/a3;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v2, p0}, Lz7/a3;-><init>(Ljava/lang/String;)V
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
    new-instance v0, Lcom/google/gson/JsonParseException;

    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :goto_1
    new-instance v0, Lcom/google/gson/JsonParseException;

    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :goto_2
    new-instance v0, Lcom/google/gson/JsonParseException;

    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static final S(LP6/h;)LC7/d;
    .locals 5

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    instance-of v0, p0, LP6/e;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    new-instance v0, LC7/d;

    invoke-static {p0}, LP2/n;->f0(LP6/h;)LC7/e;

    move-result-object v2

    check-cast p0, LP6/e;

    iget-object v3, p0, LP6/e;->c:Ljava/lang/Throwable;

    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    :cond_0
    move-object v4, v1

    :goto_0
    if-nez v4, :cond_1

    if-eqz v3, :cond_2

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_1
    move-object v1, v4

    :cond_2
    :goto_1
    iget-object p0, p0, LP6/f;->a:Ljava/lang/String;

    invoke-direct {v0, v2, p0, v1}, LC7/d;-><init>(LC7/e;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_3
    instance-of v0, p0, LP6/d;

    if-eqz v0, :cond_4

    new-instance v0, LC7/d;

    invoke-static {p0}, LP2/n;->f0(LP6/h;)LC7/e;

    move-result-object v2

    check-cast p0, LP6/d;

    iget-object p0, p0, LP6/f;->a:Ljava/lang/String;

    invoke-direct {v0, v2, p0, v1}, LC7/d;-><init>(LC7/e;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_4
    new-instance v0, LC7/d;

    invoke-static {p0}, LP2/n;->f0(LP6/h;)LC7/e;

    move-result-object p0

    const-string v2, ""

    invoke-direct {v0, p0, v2, v1}, LC7/d;-><init>(LC7/e;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static T(LLb/g0;Lcom/eightsleep/data_core/enums/banner/BannerInteractionType;)Ljava/lang/String;
    .locals 1

    const-string v0, "action"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0, p1}, LP2/x;->D(LHa/a;Lcom/eightsleep/data_core/enums/banner/BannerInteractionType;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final U(Ljava/util/Set;Lm0/l;)Ljava/lang/String;
    .locals 6

    const-string v0, "products"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lm0/q;

    const v0, -0x5055ea85

    invoke-virtual {p1, v0}, Lm0/q;->f0(I)V

    check-cast p0, Ljava/lang/Iterable;

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

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/eightsleep/data_core/enums/purchase/ProductType;

    invoke-virtual {v1}, Lcom/eightsleep/data_core/enums/purchase/ProductType;->getLabelResId()I

    move-result v1

    invoke-static {p1, v1}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v1, ", "

    const/4 v2, 0x0

    const/16 v5, 0x3e

    invoke-static/range {v0 .. v5}, LIm/r;->i1(Ljava/lang/Iterable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;LVm/k;I)Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lm0/q;->q(Z)V

    return-object p0
.end method

.method public static V(LLb/g0;Ljava/util/List;)Z
    .locals 2

    const-string v0, "userEvents"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, LLb/g0;->a:LLb/C;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, LLb/C;->b:Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    sget-object v1, Lkotlin/jvm/internal/B;->a:Lkotlin/jvm/internal/C;

    invoke-virtual {v1, p0}, Lkotlin/jvm/internal/C;->b(Ljava/lang/Class;)Lbn/d;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LRc/d;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    sget-object v1, Lkotlin/jvm/internal/B;->a:Lkotlin/jvm/internal/C;

    invoke-virtual {v1, v0}, Lkotlin/jvm/internal/C;->b(Ljava/lang/Class;)Lbn/d;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :goto_0
    const/4 p0, 0x1

    return p0

    :cond_3
    :goto_1
    const/4 p0, 0x0

    return p0
.end method

.method public static W(I)Z
    .locals 1

    sget-object v0, LDl/i;->q:LDl/i;

    if-eqz v0, :cond_0

    sget-object v0, LDl/i;->q:LDl/i;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, LDl/i;->q:LDl/i;

    iget-object v0, v0, LDl/i;->b:LDl/q;

    iget v0, v0, LDl/q;->b:I

    goto :goto_0

    :cond_0
    const/4 v0, 0x6

    :goto_0
    if-lt p0, v0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public static final X(Ljava/io/File;Le6/d;)J
    .locals 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "internalLogger"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    sget-object v1, Ly6/a;->e:Ly6/a;

    invoke-static {p0, v0, p1, v1}, LP2/n;->c0(Ljava/io/File;Ljava/lang/Object;Le6/d;LVm/k;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide p0

    return-wide p0
.end method

.method public static final Y(Ljava/io/File;Le6/d;)[Ljava/io/File;
    .locals 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "internalLogger"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Ly6/a;->f:Ly6/a;

    const/4 v1, 0x0

    invoke-static {p0, v1, p1, v0}, LP2/n;->c0(Ljava/io/File;Ljava/lang/Object;Le6/d;LVm/k;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/io/File;

    return-object p0
.end method

.method public static final Z(Ljava/io/File;Le6/d;)Z
    .locals 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "internalLogger"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    sget-object v1, Ly6/a;->g:Ly6/a;

    invoke-static {p0, v0, p1, v1}, LP2/n;->c0(Ljava/io/File;Ljava/lang/Object;Le6/d;LVm/k;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public static final a(ILA0/r;LVm/k;LVm/k;Lcom/eightsleep/presentation_autopilot/viewmodel/AutopilotViewModel;Lm0/l;)V
    .locals 15

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    const-string v0, "onNavEvent"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onOneTimeEvent"

    invoke-static {v3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "viewModel"

    invoke-static {v4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v11, p5

    check-cast v11, Lm0/q;

    const v0, 0x4d9b9421    # 3.2627203E8f

    invoke-virtual {v11, v0}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v11, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int/2addr v0, p0

    invoke-virtual {v11, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    const/16 v5, 0x20

    goto :goto_1

    :cond_1
    const/16 v5, 0x10

    :goto_1
    or-int/2addr v0, v5

    invoke-virtual {v11, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    const/16 v5, 0x100

    goto :goto_2

    :cond_2
    const/16 v5, 0x80

    :goto_2
    or-int/2addr v0, v5

    invoke-virtual {v11, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    const/16 v5, 0x800

    goto :goto_3

    :cond_3
    const/16 v5, 0x400

    :goto_3
    or-int/2addr v0, v5

    and-int/lit16 v5, v0, 0x493

    const/16 v6, 0x492

    if-ne v5, v6, :cond_5

    invoke-virtual {v11}, Lm0/q;->H()Z

    move-result v5

    if-nez v5, :cond_4

    goto :goto_4

    :cond_4
    invoke-virtual {v11}, Lm0/q;->Y()V

    goto :goto_5

    :cond_5
    :goto_4
    sget-object v5, Landroidx/compose/foundation/layout/b;->c:Landroidx/compose/foundation/layout/FillElement;

    invoke-interface {v1, v5}, LA0/r;->then(LA0/r;)LA0/r;

    move-result-object v5

    sget-object v10, LNe/v;->a:Lu0/d;

    shr-int/lit8 v6, v0, 0x6

    and-int/lit8 v6, v6, 0x70

    const/high16 v7, 0x6c30000

    or-int/2addr v6, v7

    and-int/lit16 v7, v0, 0x380

    or-int/2addr v6, v7

    shl-int/lit8 v0, v0, 0x6

    and-int/lit16 v0, v0, 0x1c00

    or-int v12, v6, v0

    const/4 v8, 0x0

    const-string v9, "autopilot_edit_temperature"

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/16 v13, 0x50

    move-object v14, v5

    move-object v5, v2

    move-object v2, v14

    move-object v14, v4

    move-object v4, v3

    move-object v3, v14

    invoke-static/range {v2 .. v13}, LP2/o;->g(LA0/r;LL8/e;LVm/k;LVm/k;ZZLH0/w;Ljava/lang/String;LVm/r;Lm0/l;II)V

    :goto_5
    invoke-virtual {v11}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_6

    new-instance v0, LMe/a;

    const/16 v6, 0x9

    move v5, p0

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    invoke-direct/range {v0 .. v6}, LMe/a;-><init>(LA0/r;LVm/k;LVm/k;Lcom/eightsleep/presentation_autopilot/viewmodel/AutopilotViewModel;II)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_6
    return-void
.end method

.method public static a0()V
    .locals 5

    const-string v0, " => "

    const-string v1, "Iterable Call"

    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v3

    const/4 v4, 0x3

    aget-object v3, v3, v4

    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v3

    aget-object v3, v3, v4

    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    aget-object v0, v0, v4

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " => Line #"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    aget-object v0, v0, v4

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, LP2/n;->g0(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    const-string v0, "Couldn\'t print info"

    invoke-static {v1, v0}, LP2/n;->K(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static final b(Ljava/lang/String;ZLVm/a;LA0/r;ZLjava/lang/String;Ljava/lang/String;Lu0/d;Lm0/l;II)V
    .locals 38

    move-object/from16 v1, p0

    move/from16 v2, p1

    move-object/from16 v8, p2

    move/from16 v13, p9

    move/from16 v14, p10

    const/16 v0, 0x80

    const/16 v3, 0x10

    const/16 v4, 0x20

    const/16 v9, 0x30

    const/4 v15, 0x6

    const-string v5, "label"

    invoke-static {v1, v5}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "onClick"

    invoke-static {v8, v5}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v10, p8

    check-cast v10, Lm0/q;

    const v5, -0x77ddf5ba

    invoke-virtual {v10, v5}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v5, v13, 0x6

    if-nez v5, :cond_1

    invoke-virtual {v10, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x4

    goto :goto_0

    :cond_0
    const/4 v5, 0x2

    :goto_0
    or-int/2addr v5, v13

    goto :goto_1

    :cond_1
    move v5, v13

    :goto_1
    and-int/lit8 v6, v13, 0x30

    if-nez v6, :cond_3

    invoke-virtual {v10, v2}, Lm0/q;->h(Z)Z

    move-result v6

    if-eqz v6, :cond_2

    move v6, v4

    goto :goto_2

    :cond_2
    move v6, v3

    :goto_2
    or-int/2addr v5, v6

    :cond_3
    and-int/lit16 v6, v13, 0x180

    if-nez v6, :cond_5

    invoke-virtual {v10, v8}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    const/16 v6, 0x100

    goto :goto_3

    :cond_4
    move v6, v0

    :goto_3
    or-int/2addr v5, v6

    :cond_5
    and-int/lit8 v6, v14, 0x8

    if-eqz v6, :cond_7

    or-int/lit16 v5, v5, 0xc00

    :cond_6
    move-object/from16 v7, p3

    goto :goto_5

    :cond_7
    and-int/lit16 v7, v13, 0xc00

    if-nez v7, :cond_6

    move-object/from16 v7, p3

    invoke-virtual {v10, v7}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_8

    const/16 v11, 0x800

    goto :goto_4

    :cond_8
    const/16 v11, 0x400

    :goto_4
    or-int/2addr v5, v11

    :goto_5
    and-int/2addr v3, v14

    if-eqz v3, :cond_a

    or-int/lit16 v5, v5, 0x6000

    :cond_9
    move/from16 v11, p4

    goto :goto_7

    :cond_a
    and-int/lit16 v11, v13, 0x6000

    if-nez v11, :cond_9

    move/from16 v11, p4

    invoke-virtual {v10, v11}, Lm0/q;->h(Z)Z

    move-result v12

    if-eqz v12, :cond_b

    const/16 v12, 0x4000

    goto :goto_6

    :cond_b
    const/16 v12, 0x2000

    :goto_6
    or-int/2addr v5, v12

    :goto_7
    and-int/2addr v4, v14

    const/high16 v12, 0x30000

    if-eqz v4, :cond_d

    or-int/2addr v5, v12

    :cond_c
    move-object/from16 v12, p5

    goto :goto_9

    :cond_d
    and-int/2addr v12, v13

    if-nez v12, :cond_c

    move-object/from16 v12, p5

    invoke-virtual {v10, v12}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_e

    const/high16 v16, 0x20000

    goto :goto_8

    :cond_e
    const/high16 v16, 0x10000

    :goto_8
    or-int v5, v5, v16

    :goto_9
    and-int/lit8 v16, v14, 0x40

    const/high16 v17, 0x180000

    if-eqz v16, :cond_f

    or-int v5, v5, v17

    move-object/from16 v15, p6

    goto :goto_b

    :cond_f
    and-int v17, v13, v17

    move-object/from16 v15, p6

    if-nez v17, :cond_11

    invoke-virtual {v10, v15}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_10

    const/high16 v17, 0x100000

    goto :goto_a

    :cond_10
    const/high16 v17, 0x80000

    :goto_a
    or-int v5, v5, v17

    :cond_11
    :goto_b
    and-int/2addr v0, v14

    const/high16 v17, 0xc00000

    if-eqz v0, :cond_13

    or-int v5, v5, v17

    move-object/from16 v9, p7

    :cond_12
    :goto_c
    move/from16 v18, v5

    goto :goto_e

    :cond_13
    and-int v17, v13, v17

    move-object/from16 v9, p7

    if-nez v17, :cond_12

    invoke-virtual {v10, v9}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_14

    const/high16 v18, 0x800000

    goto :goto_d

    :cond_14
    const/high16 v18, 0x400000

    :goto_d
    or-int v5, v5, v18

    goto :goto_c

    :goto_e
    const v5, 0x492493

    and-int v5, v18, v5

    move/from16 v19, v0

    const v0, 0x492492

    if-ne v5, v0, :cond_16

    invoke-virtual {v10}, Lm0/q;->H()Z

    move-result v0

    if-nez v0, :cond_15

    goto :goto_10

    :cond_15
    invoke-virtual {v10}, Lm0/q;->Y()V

    move-object v4, v7

    move-object v8, v9

    move-object v9, v10

    move v5, v11

    :goto_f
    move-object v6, v12

    move-object v7, v15

    goto/16 :goto_21

    :cond_16
    :goto_10
    sget-object v0, LA0/o;->a:LA0/o;

    if-eqz v6, :cond_17

    move-object v5, v0

    goto :goto_11

    :cond_17
    move-object v5, v7

    :goto_11
    if-eqz v3, :cond_18

    const/4 v11, 0x1

    :cond_18
    const/4 v3, 0x0

    if-eqz v4, :cond_19

    move-object/from16 v20, v3

    goto :goto_12

    :cond_19
    move-object/from16 v20, v12

    :goto_12
    if-eqz v16, :cond_1a

    move-object v15, v3

    :cond_1a
    if-eqz v19, :cond_1b

    move-object v9, v3

    :cond_1b
    sget-object v3, Lme/L;->d:Lme/v;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget v3, Lme/v;->d:F

    invoke-static {v3}, LO/e;->b(F)LO/d;

    move-result-object v3

    const/4 v12, 0x0

    if-nez v11, :cond_1c

    const v4, 0x5f9069a7

    invoke-virtual {v10, v4}, Lm0/q;->f0(I)V

    invoke-static {v10}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v4

    iget-object v4, v4, Lhh/h;->b:Lhh/b;

    iget-wide v6, v4, Lhh/b;->e:J

    invoke-virtual {v10, v12}, Lm0/q;->q(Z)V

    goto :goto_13

    :cond_1c
    if-eqz v2, :cond_1d

    const v4, 0x5f907104

    invoke-virtual {v10, v4}, Lm0/q;->f0(I)V

    invoke-static {v10}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v4

    iget-object v4, v4, Lhh/h;->b:Lhh/b;

    iget-wide v6, v4, Lhh/b;->d:J

    invoke-virtual {v10, v12}, Lm0/q;->q(Z)V

    goto :goto_13

    :cond_1d
    const v4, 0x5f907786

    invoke-virtual {v10, v4}, Lm0/q;->f0(I)V

    invoke-static {v10}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v4

    iget-object v4, v4, Lhh/h;->b:Lhh/b;

    iget-wide v6, v4, Lhh/b;->a:J

    invoke-virtual {v10, v12}, Lm0/q;->q(Z)V

    :goto_13
    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v5, v4}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v12

    sget-object v16, Lme/L;->c:Lme/K;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget v4, Lme/K;->h:F

    move-object/from16 p8, v0

    const/high16 v0, 0x7fc00000    # Float.NaN

    invoke-static {v12, v0, v4}, Landroidx/compose/foundation/layout/b;->a(LA0/r;FF)LA0/r;

    move-result-object v0

    invoke-static {v10}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v4

    iget v4, v4, Lhh/i;->a:F

    invoke-static {v0, v4, v6, v7, v3}, Ly/x;->h(LA0/r;FJLH0/X;)LA0/r;

    move-result-object v0

    invoke-static {v0, v3}, LE0/i;->c(LA0/r;LH0/X;)LA0/r;

    move-result-object v0

    const v3, 0x5f910da6

    invoke-virtual {v10, v3}, Lm0/q;->f0(I)V

    invoke-virtual {v10}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v3

    sget-object v4, Lm0/k;->a:Lm0/e;

    if-ne v3, v4, :cond_1e

    invoke-static {v10}, Lr4/K;->j(Lm0/q;)LE/l;

    move-result-object v3

    :cond_1e
    move-object v4, v3

    check-cast v4, LE/l;

    const/4 v3, 0x0

    invoke-virtual {v10, v3}, Lm0/q;->q(Z)V

    new-instance v7, Lh1/j;

    const/4 v3, 0x3

    invoke-direct {v7, v3}, Lh1/j;-><init>(I)V

    move-object v3, v5

    const/4 v5, 0x0

    move-object/from16 v29, v3

    move v6, v11

    const/high16 v11, 0x3f800000    # 1.0f

    move v3, v2

    move-object v2, v0

    const/4 v0, 0x1

    invoke-static/range {v2 .. v8}, LN/c;->a(LA0/r;ZLE/l;Landroidx/compose/material3/c;ZLh1/j;LVm/a;)LA0/r;

    move-result-object v2

    move/from16 v30, v6

    invoke-static {v10}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v3

    iget v3, v3, Lhh/i;->e:F

    invoke-static {v2, v3}, LG/e;->H(LA0/r;F)LA0/r;

    move-result-object v2

    sget-object v3, LG/l;->a:LG/d;

    invoke-static {v10}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v3

    iget v3, v3, Lhh/i;->c:F

    invoke-static {v3}, LG/l;->g(F)LG/j;

    move-result-object v3

    sget-object v4, LA0/d;->k:LA0/h;

    const/16 v5, 0x30

    invoke-static {v3, v4, v10, v5}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v3

    iget-wide v4, v10, Lm0/q;->T:J

    invoke-static {v4, v5}, Ljava/lang/Long;->hashCode(J)I

    move-result v4

    invoke-virtual {v10}, Lm0/q;->m()Lm0/o0;

    move-result-object v5

    invoke-static {v2, v10}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v2

    sget-object v6, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v6, LZ0/g;->b:LZ0/f;

    invoke-virtual {v10}, Lm0/q;->j0()V

    iget-boolean v7, v10, Lm0/q;->S:Z

    if-eqz v7, :cond_1f

    invoke-virtual {v10, v6}, Lm0/q;->l(LVm/a;)V

    goto :goto_14

    :cond_1f
    invoke-virtual {v10}, Lm0/q;->t0()V

    :goto_14
    sget-object v7, LZ0/g;->f:LZ0/e;

    invoke-static {v7, v3, v10}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v3, LZ0/g;->e:LZ0/e;

    invoke-static {v3, v5, v10}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    sget-object v5, LZ0/g;->g:LZ0/e;

    invoke-static {v10, v4, v5}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v4, LZ0/g;->h:LZ0/d;

    invoke-static {v10, v4}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v8, LZ0/g;->d:LZ0/e;

    invoke-static {v8, v2, v10}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const v2, 0x73a5dce6

    invoke-virtual {v10, v2}, Lm0/q;->f0(I)V

    if-nez v9, :cond_20

    :goto_15
    const/4 v2, 0x0

    goto :goto_16

    :cond_20
    shr-int/lit8 v2, v18, 0x15

    and-int/lit8 v2, v2, 0xe

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v9, v10, v2}, Lu0/d;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_15

    :goto_16
    invoke-virtual {v10, v2}, Lm0/q;->q(Z)V

    float-to-double v0, v11

    const-wide/16 v16, 0x0

    cmpl-double v0, v0, v16

    if-lez v0, :cond_21

    goto :goto_17

    :cond_21
    const-string v0, "invalid weight; must be greater than zero"

    invoke-static {v0}, LH/a;->a(Ljava/lang/String;)V

    :goto_17
    new-instance v0, LG/x0;

    const/4 v1, 0x1

    invoke-direct {v0, v11, v1}, LG/x0;-><init>(FZ)V

    invoke-static {v10}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v2

    iget v2, v2, Lhh/i;->b:F

    invoke-static {v2}, LG/l;->g(F)LG/j;

    move-result-object v2

    sget-object v11, LA0/d;->m:LA0/g;

    const/4 v12, 0x0

    invoke-static {v2, v11, v10, v12}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v2

    iget-wide v11, v10, Lm0/q;->T:J

    invoke-static {v11, v12}, Ljava/lang/Long;->hashCode(J)I

    move-result v11

    invoke-virtual {v10}, Lm0/q;->m()Lm0/o0;

    move-result-object v12

    invoke-static {v0, v10}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v0

    invoke-virtual {v10}, Lm0/q;->j0()V

    iget-boolean v1, v10, Lm0/q;->S:Z

    if-eqz v1, :cond_22

    invoke-virtual {v10, v6}, Lm0/q;->l(LVm/a;)V

    goto :goto_18

    :cond_22
    invoke-virtual {v10}, Lm0/q;->t0()V

    :goto_18
    invoke-static {v7, v2, v10}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v3, v12, v10}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v11, v10, v5, v10, v4}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    invoke-static {v8, v0, v10}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v16, Lih/h;->b:Lih/h;

    if-eqz v30, :cond_23

    const v0, -0x7c5fea46

    invoke-virtual {v10, v0}, Lm0/q;->f0(I)V

    invoke-static {v10}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v0

    iget-object v0, v0, Lhh/h;->k:Lhh/v;

    iget-wide v0, v0, Lhh/v;->a:J

    const/4 v12, 0x0

    invoke-virtual {v10, v12}, Lm0/q;->q(Z)V

    goto :goto_19

    :cond_23
    const/4 v12, 0x0

    const v0, -0x7c5eb047

    invoke-virtual {v10, v0}, Lm0/q;->f0(I)V

    invoke-static {v10}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v0

    iget-object v0, v0, Lhh/h;->k:Lhh/v;

    iget-wide v0, v0, Lhh/v;->j:J

    invoke-virtual {v10, v12}, Lm0/q;->q(Z)V

    :goto_19
    and-int/lit8 v2, v18, 0xe

    move-object v11, v7

    const/4 v7, 0x0

    move-object/from16 v17, v8

    const/4 v8, 0x0

    move-object/from16 v25, v10

    move v10, v2

    const/4 v2, 0x0

    move-object/from16 v18, v5

    const/4 v5, 0x0

    move-object/from16 v19, v6

    const/4 v6, 0x0

    move-object/from16 v21, v11

    const/4 v11, 0x6

    move/from16 v22, v12

    const/16 v12, 0x3f6

    move-object/from16 v13, p8

    move-object/from16 v34, v3

    move-object/from16 v36, v4

    move-object/from16 v31, v9

    move-object/from16 v37, v17

    move-object/from16 v35, v18

    move-object/from16 v32, v19

    move-object/from16 v33, v21

    move/from16 v14, v22

    move-object/from16 v9, v25

    move-wide v3, v0

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-virtual/range {v0 .. v12}, Lih/h;->h(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    const v0, -0x4e5592e5

    invoke-virtual {v9, v0}, Lm0/q;->f0(I)V

    if-nez v20, :cond_24

    move-object/from16 v12, v20

    goto :goto_1b

    :cond_24
    if-eqz v30, :cond_25

    const v0, -0x11cb4953

    invoke-virtual {v9, v0}, Lm0/q;->f0(I)V

    invoke-static {v9}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v0

    iget-object v0, v0, Lhh/h;->k:Lhh/v;

    iget-wide v0, v0, Lhh/v;->d:J

    invoke-virtual {v9, v14}, Lm0/q;->q(Z)V

    goto :goto_1a

    :cond_25
    const v0, -0x11c9d9ce

    invoke-virtual {v9, v0}, Lm0/q;->f0(I)V

    invoke-static {v9}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v0

    iget-object v0, v0, Lhh/h;->k:Lhh/v;

    iget-wide v0, v0, Lhh/v;->j:J

    invoke-virtual {v9, v14}, Lm0/q;->q(Z)V

    :goto_1a
    const/16 v24, 0x0

    const/16 v26, 0x0

    const/16 v18, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v27, 0x6

    const/16 v28, 0x3f6

    move-object/from16 v25, v9

    move-object/from16 v17, v20

    move-wide/from16 v19, v0

    invoke-virtual/range {v16 .. v28}, Lih/h;->n(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    move-object/from16 v12, v17

    :goto_1b
    invoke-virtual {v9, v14}, Lm0/q;->q(Z)V

    const v0, -0x4e55695f

    invoke-virtual {v9, v0}, Lm0/q;->f0(I)V

    if-nez v15, :cond_26

    goto :goto_1c

    :cond_26
    invoke-static {v9}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v0

    iget-object v0, v0, Lhh/h;->k:Lhh/v;

    iget-wide v0, v0, Lhh/v;->h:J

    const/16 v24, 0x0

    const/16 v26, 0x0

    const/16 v18, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v27, 0x6

    const/16 v28, 0x3f6

    move-wide/from16 v19, v0

    move-object/from16 v25, v9

    move-object/from16 v17, v15

    invoke-virtual/range {v16 .. v28}, Lih/h;->n(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    :goto_1c
    invoke-virtual {v9, v14}, Lm0/q;->q(Z)V

    const/4 v0, 0x1

    invoke-virtual {v9, v0}, Lm0/q;->q(Z)V

    invoke-static {v9}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v0

    iget v0, v0, Lhh/i;->e:F

    invoke-static {v13, v0}, Landroidx/compose/foundation/layout/b;->n(LA0/r;F)LA0/r;

    move-result-object v0

    sget-object v1, LA0/d;->a:LA0/i;

    invoke-static {v1, v14}, LG/t;->d(LA0/e;Z)LX0/h0;

    move-result-object v1

    iget-wide v2, v9, Lm0/q;->T:J

    invoke-static {v2, v3}, Ljava/lang/Long;->hashCode(J)I

    move-result v2

    invoke-virtual {v9}, Lm0/q;->m()Lm0/o0;

    move-result-object v3

    invoke-static {v0, v9}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v0

    invoke-virtual {v9}, Lm0/q;->j0()V

    iget-boolean v4, v9, Lm0/q;->S:Z

    if-eqz v4, :cond_27

    move-object/from16 v4, v32

    invoke-virtual {v9, v4}, Lm0/q;->l(LVm/a;)V

    :goto_1d
    move-object/from16 v11, v33

    goto :goto_1e

    :cond_27
    invoke-virtual {v9}, Lm0/q;->t0()V

    goto :goto_1d

    :goto_1e
    invoke-static {v11, v1, v9}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object/from16 v1, v34

    invoke-static {v1, v3, v9}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object/from16 v1, v35

    move-object/from16 v3, v36

    invoke-static {v2, v9, v1, v9, v3}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    move-object/from16 v1, v37

    invoke-static {v1, v0, v9}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const v0, -0x4e554389

    invoke-virtual {v9, v0}, Lm0/q;->f0(I)V

    if-eqz p1, :cond_29

    const v0, 0x7f080180

    const/4 v1, 0x6

    invoke-static {v0, v1, v9}, LIm/s;->w0(IILm0/l;)LM0/f;

    move-result-object v16

    invoke-static {v9}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v0

    iget v0, v0, Lhh/i;->e:F

    invoke-static {v13, v0}, Landroidx/compose/foundation/layout/b;->n(LA0/r;F)LA0/r;

    move-result-object v18

    if-eqz v30, :cond_28

    const v0, -0x7c4ed64e

    invoke-virtual {v9, v0}, Lm0/q;->f0(I)V

    invoke-static {v9}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v0

    iget-object v0, v0, Lhh/h;->f:Lhh/m;

    iget-wide v0, v0, Lhh/m;->a:J

    invoke-virtual {v9, v14}, Lm0/q;->q(Z)V

    :goto_1f
    move-wide/from16 v19, v0

    goto :goto_20

    :cond_28
    const v0, -0x7c4d7d4f

    invoke-virtual {v9, v0}, Lm0/q;->f0(I)V

    invoke-static {v9}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v0

    iget-object v0, v0, Lhh/h;->f:Lhh/m;

    iget-wide v0, v0, Lhh/m;->i:J

    invoke-virtual {v9, v14}, Lm0/q;->q(Z)V

    goto :goto_1f

    :goto_20
    const/16 v23, 0x0

    const/16 v17, 0x0

    const/16 v22, 0x30

    move-object/from16 v21, v9

    invoke-static/range {v16 .. v23}, Lj0/I0;->b(LM0/f;Ljava/lang/String;LA0/r;JLm0/l;II)V

    :cond_29
    const/4 v0, 0x1

    invoke-static {v9, v14, v0, v0}, Ly2/K;->d(Lm0/q;ZZZ)V

    move-object/from16 v4, v29

    move/from16 v5, v30

    move-object/from16 v8, v31

    goto/16 :goto_f

    :goto_21
    invoke-virtual {v9}, Lm0/q;->u()Lm0/t0;

    move-result-object v11

    if-eqz v11, :cond_2a

    new-instance v0, LNg/d;

    move-object/from16 v1, p0

    move/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v9, p9

    move/from16 v10, p10

    invoke-direct/range {v0 .. v10}, LNg/d;-><init>(Ljava/lang/String;ZLVm/a;LA0/r;ZLjava/lang/String;Ljava/lang/String;Lu0/d;II)V

    iput-object v0, v11, Lm0/t0;->d:LVm/n;

    :cond_2a
    return-void
.end method

.method public static final b0(Ljava/io/File;Ljava/nio/charset/Charset;Le6/d;)Ljava/lang/String;
    .locals 3

    const-string v0, "charset"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "internalLogger"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0, p2}, LP2/n;->M(Ljava/io/File;Le6/d;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-static {p0, p2}, LP2/n;->C(Ljava/io/File;Le6/d;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ly6/b;

    const/4 v2, 0x1

    invoke-direct {v0, v2, p1}, Ly6/b;-><init>(ILjava/nio/charset/Charset;)V

    invoke-static {p0, v1, p2, v0}, LP2/n;->c0(Ljava/io/File;Ljava/lang/Object;Le6/d;LVm/k;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_0
    return-object v1
.end method

.method public static final c(LL8/e;LVm/k;LVm/k;Lm0/l;I)V
    .locals 14

    move/from16 v1, p4

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v0, p3

    check-cast v0, Lm0/q;

    const v2, 0x4bc896de    # 2.6291644E7f

    invoke-virtual {v0, v2}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v2, v1, 0x6

    const/4 v3, 0x4

    if-nez v2, :cond_2

    and-int/lit8 v2, v1, 0x8

    if-nez v2, :cond_0

    invoke-virtual {v0, p0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_0

    :cond_0
    invoke-virtual {v0, p0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v2

    :goto_0
    if-eqz v2, :cond_1

    move v2, v3

    goto :goto_1

    :cond_1
    const/4 v2, 0x2

    :goto_1
    or-int/2addr v2, v1

    goto :goto_2

    :cond_2
    move v2, v1

    :goto_2
    and-int/lit8 v4, v1, 0x30

    const/16 v5, 0x20

    if-nez v4, :cond_4

    invoke-virtual {v0, p1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    move v4, v5

    goto :goto_3

    :cond_3
    const/16 v4, 0x10

    :goto_3
    or-int/2addr v2, v4

    :cond_4
    and-int/lit16 v4, v1, 0x180

    const/16 v6, 0x100

    move-object/from16 v11, p2

    if-nez v4, :cond_6

    invoke-virtual {v0, v11}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    move v4, v6

    goto :goto_4

    :cond_5
    const/16 v4, 0x80

    :goto_4
    or-int/2addr v2, v4

    :cond_6
    and-int/lit16 v4, v2, 0x93

    const/16 v7, 0x92

    if-ne v4, v7, :cond_8

    invoke-virtual {v0}, Lm0/q;->H()Z

    move-result v4

    if-nez v4, :cond_7

    goto :goto_5

    :cond_7
    invoke-virtual {v0}, Lm0/q;->Y()V

    goto :goto_a

    :cond_8
    :goto_5
    sget-object v4, Lm0/k;->a:Lm0/e;

    sget-object v7, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->b:Lm0/c1;

    invoke-virtual {v0, v7}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v7

    move-object v10, v7

    check-cast v10, Landroid/content/Context;

    const v7, 0x586f5ef8

    invoke-virtual {v0, v7}, Lm0/q;->f0(I)V

    and-int/lit8 v7, v2, 0xe

    const/4 v13, 0x0

    const/4 v8, 0x1

    if-eq v7, v3, :cond_a

    and-int/lit8 v3, v2, 0x8

    if-eqz v3, :cond_9

    invoke-virtual {v0, p0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    goto :goto_6

    :cond_9
    move v3, v13

    goto :goto_7

    :cond_a
    :goto_6
    move v3, v8

    :goto_7
    and-int/lit8 v7, v2, 0x70

    if-ne v7, v5, :cond_b

    move v5, v8

    goto :goto_8

    :cond_b
    move v5, v13

    :goto_8
    or-int/2addr v3, v5

    invoke-virtual {v0, v10}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    or-int/2addr v3, v5

    and-int/lit16 v2, v2, 0x380

    if-ne v2, v6, :cond_c

    goto :goto_9

    :cond_c
    move v8, v13

    :goto_9
    or-int v2, v3, v8

    invoke-virtual {v0}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v3

    if-nez v2, :cond_d

    if-ne v3, v4, :cond_e

    :cond_d
    new-instance v7, Ld8/c;

    const/4 v12, 0x0

    move-object v8, p0

    move-object v9, p1

    invoke-direct/range {v7 .. v12}, Ld8/c;-><init>(LL8/e;LVm/k;Landroid/content/Context;LVm/k;LLm/c;)V

    invoke-virtual {v0, v7}, Lm0/q;->q0(Ljava/lang/Object;)V

    move-object v3, v7

    :cond_e
    check-cast v3, LVm/n;

    invoke-virtual {v0, v13}, Lm0/q;->q(Z)V

    invoke-static {v3, p0, v0}, Lm0/r;->f(LVm/n;Ljava/lang/Object;Lm0/l;)V

    :goto_a
    invoke-virtual {v0}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_f

    new-instance v0, LP/T0;

    const/16 v2, 0x16

    move-object v4, p0

    move-object v3, p1

    move-object/from16 v5, p2

    invoke-direct/range {v0 .. v5}, LP/T0;-><init>(IILVm/k;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_f
    return-void
.end method

.method public static final c0(Ljava/io/File;Ljava/lang/Object;Le6/d;LVm/k;)Ljava/lang/Object;
    .locals 13

    move-object/from16 v0, p3

    :try_start_0
    invoke-interface {v0, p0}, LVm/k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception v0

    move-object v5, v0

    sget-object v2, Le6/b;->ERROR:Le6/b;

    sget-object v0, Le6/c;->MAINTAINER:Le6/c;

    sget-object v1, Le6/c;->TELEMETRY:Le6/c;

    filled-new-array {v0, v1}, [Le6/c;

    move-result-object v0

    invoke-static {v0}, LIm/s;->g0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    new-instance v4, LA6/d;

    const/16 v0, 0xa

    invoke-direct {v4, p0, v0}, LA6/d;-><init>(Ljava/io/File;I)V

    const/16 v6, 0x30

    move-object v1, p2

    invoke-static/range {v1 .. v6}, Landroidx/room/migration/bundle/a;->C(Le6/d;Le6/b;Ljava/util/List;LVm/a;Ljava/lang/Throwable;I)V

    goto :goto_0

    :catch_1
    move-exception v0

    move-object v11, v0

    sget-object v8, Le6/b;->ERROR:Le6/b;

    sget-object v0, Le6/c;->MAINTAINER:Le6/c;

    sget-object v1, Le6/c;->TELEMETRY:Le6/c;

    filled-new-array {v0, v1}, [Le6/c;

    move-result-object v0

    invoke-static {v0}, LIm/s;->g0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    new-instance v10, LA6/d;

    const/16 v0, 0x9

    invoke-direct {v10, p0, v0}, LA6/d;-><init>(Ljava/io/File;I)V

    const/16 v12, 0x30

    move-object v7, p2

    invoke-static/range {v7 .. v12}, Landroidx/room/migration/bundle/a;->C(Le6/d;Le6/b;Ljava/util/List;LVm/a;Ljava/lang/Throwable;I)V

    :goto_0
    return-object p1
.end method

.method public static final d(LA0/r;LG/g1;Lu0/d;Lm0/Z;ZIZLr4/G;LVm/a;LVm/n;Lm0/l;II)V
    .locals 31

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move/from16 v11, p11

    const-string v0, "pageTitle"

    invoke-static {v4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "actions"

    invoke-static {v10, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v0, p10

    check-cast v0, Lm0/q;

    const v1, 0x47689d0a

    invoke-virtual {v0, v1}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v1, p12, 0x1

    if-eqz v1, :cond_0

    or-int/lit8 v2, v11, 0x6

    move v12, v2

    move-object/from16 v2, p0

    goto :goto_1

    :cond_0
    move-object/from16 v2, p0

    invoke-virtual {v0, v2}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1

    const/4 v12, 0x4

    goto :goto_0

    :cond_1
    const/4 v12, 0x2

    :goto_0
    or-int/2addr v12, v11

    :goto_1
    and-int/lit8 v13, p12, 0x2

    if-nez v13, :cond_2

    move-object/from16 v13, p1

    invoke-virtual {v0, v13}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_3

    const/16 v14, 0x20

    goto :goto_2

    :cond_2
    move-object/from16 v13, p1

    :cond_3
    const/16 v14, 0x10

    :goto_2
    or-int/2addr v12, v14

    and-int/lit16 v14, v11, 0x180

    if-nez v14, :cond_5

    invoke-virtual {v0, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_4

    const/16 v14, 0x100

    goto :goto_3

    :cond_4
    const/16 v14, 0x80

    :goto_3
    or-int/2addr v12, v14

    :cond_5
    invoke-virtual {v0, v5}, Lm0/q;->h(Z)Z

    move-result v14

    if-eqz v14, :cond_6

    const/16 v14, 0x4000

    goto :goto_4

    :cond_6
    const/16 v14, 0x2000

    :goto_4
    or-int/2addr v12, v14

    invoke-virtual {v0, v6}, Lm0/q;->e(I)Z

    move-result v14

    if-eqz v14, :cond_7

    const/high16 v14, 0x20000

    goto :goto_5

    :cond_7
    const/high16 v14, 0x10000

    :goto_5
    or-int/2addr v12, v14

    const/high16 v14, 0x180000

    and-int/2addr v14, v11

    if-nez v14, :cond_9

    invoke-virtual {v0, v7}, Lm0/q;->h(Z)Z

    move-result v14

    if-eqz v14, :cond_8

    const/high16 v14, 0x100000

    goto :goto_6

    :cond_8
    const/high16 v14, 0x80000

    :goto_6
    or-int/2addr v12, v14

    :cond_9
    invoke-virtual {v0, v8}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_a

    const/high16 v14, 0x800000

    goto :goto_7

    :cond_a
    const/high16 v14, 0x400000

    :goto_7
    or-int/2addr v12, v14

    invoke-virtual {v0, v9}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_b

    const/high16 v14, 0x4000000

    goto :goto_8

    :cond_b
    const/high16 v14, 0x2000000

    :goto_8
    or-int/2addr v12, v14

    const/high16 v14, 0x30000000

    and-int/2addr v14, v11

    if-nez v14, :cond_d

    invoke-virtual {v0, v10}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_c

    const/high16 v14, 0x20000000

    goto :goto_9

    :cond_c
    const/high16 v14, 0x10000000

    :goto_9
    or-int/2addr v12, v14

    :cond_d
    const v14, 0x12492493

    and-int/2addr v14, v12

    const v15, 0x12492492

    if-ne v14, v15, :cond_f

    invoke-virtual {v0}, Lm0/q;->H()Z

    move-result v14

    if-nez v14, :cond_e

    goto :goto_a

    :cond_e
    invoke-virtual {v0}, Lm0/q;->Y()V

    move-object/from16 v19, v0

    move-object v1, v2

    move-object v2, v13

    goto/16 :goto_e

    :cond_f
    :goto_a
    invoke-virtual {v0}, Lm0/q;->a0()V

    and-int/lit8 v14, v11, 0x1

    if-eqz v14, :cond_12

    invoke-virtual {v0}, Lm0/q;->E()Z

    move-result v14

    if-eqz v14, :cond_10

    goto :goto_b

    :cond_10
    invoke-virtual {v0}, Lm0/q;->Y()V

    and-int/lit8 v1, p12, 0x2

    if-eqz v1, :cond_11

    and-int/lit8 v12, v12, -0x71

    :cond_11
    move-object/from16 v17, v13

    move-object v13, v2

    goto :goto_d

    :cond_12
    :goto_b
    if-eqz v1, :cond_13

    sget-object v1, LA0/o;->a:LA0/o;

    goto :goto_c

    :cond_13
    move-object v1, v2

    :goto_c
    and-int/lit8 v2, p12, 0x2

    if-eqz v2, :cond_14

    invoke-static {v0}, Lj0/H3;->a(Lm0/l;)LG/z0;

    move-result-object v2

    and-int/lit8 v12, v12, -0x71

    move-object v13, v2

    :cond_14
    move-object/from16 v17, v13

    move-object v13, v1

    :goto_d
    invoke-virtual {v0}, Lm0/q;->r()V

    sget-wide v19, LH0/w;->g:J

    invoke-static {v0}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v1

    iget-object v1, v1, Lhh/h;->k:Lhh/v;

    iget-wide v1, v1, Lhh/v;->a:J

    invoke-static {v0}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v14

    iget-object v14, v14, Lhh/h;->k:Lhh/v;

    iget-wide v14, v14, Lhh/v;->a:J

    move-wide/from16 v23, v1

    invoke-static {v0}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v1

    iget-object v1, v1, Lhh/h;->k:Lhh/v;

    iget-wide v1, v1, Lhh/v;->a:J

    new-instance v18, Lj0/G3;

    move-wide/from16 v21, v19

    move-wide/from16 v29, v14

    move-wide/from16 v27, v1

    move-wide/from16 v25, v14

    invoke-direct/range {v18 .. v30}, Lj0/G3;-><init>(JJJJJJ)V

    new-instance v1, Lg8/Z;

    invoke-direct {v1, v3, v4}, Lg8/Z;-><init>(Lu0/d;Lm0/Z;)V

    const v2, -0x4e350e3b

    invoke-static {v2, v1, v0}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v1

    new-instance v2, Lg8/a0;

    invoke-direct {v2, v5, v6, v9, v8}, Lg8/a0;-><init>(ZILVm/a;Lr4/G;)V

    const v14, 0x3e671f03

    invoke-static {v14, v2, v0}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v14

    new-instance v2, LEg/q0;

    const/4 v15, 0x5

    invoke-direct {v2, v7, v10, v15}, LEg/q0;-><init>(ZLjava/lang/Object;I)V

    const v15, -0x10f54d06

    invoke-static {v15, v2, v0}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v15

    shl-int/lit8 v2, v12, 0x3

    and-int/lit8 v2, v2, 0x70

    or-int/lit16 v2, v2, 0xd86

    shl-int/lit8 v12, v12, 0xc

    const/high16 v16, 0x70000

    and-int v12, v12, v16

    or-int v20, v2, v12

    const/16 v21, 0x90

    const/16 v16, 0x0

    move-object/from16 v19, v0

    move-object v12, v1

    invoke-static/range {v12 .. v21}, Lj0/f;->d(Lu0/d;LA0/r;Lu0/d;Lu0/d;FLG/g1;Lj0/G3;Lm0/l;II)V

    move-object v1, v13

    move-object/from16 v2, v17

    :goto_e
    invoke-virtual/range {v19 .. v19}, Lm0/q;->u()Lm0/t0;

    move-result-object v13

    if-eqz v13, :cond_15

    new-instance v0, LI8/f;

    move/from16 v12, p12

    invoke-direct/range {v0 .. v12}, LI8/f;-><init>(LA0/r;LG/g1;Lu0/d;Lm0/Z;ZIZLr4/G;LVm/a;LVm/n;II)V

    iput-object v0, v13, Lm0/t0;->d:LVm/n;

    :cond_15
    return-void
.end method

.method public static d0(LLb/g0;LDd/d;)Z
    .locals 2

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-interface {p0}, LLb/g0;->a()Ljava/util/Set;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    instance-of v0, p0, Ljava/util/Collection;

    if-eqz v0, :cond_1

    move-object v0, p0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/eightsleep/data_core/enums/SubscriptionCapability;

    iget-object v1, p1, LDd/d;->b:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    :goto_0
    const/4 p0, 0x0

    return p0

    :cond_3
    :goto_1
    const/4 p0, 0x1

    return p0
.end method

.method public static final e(LA0/r;LVm/k;LVm/k;Lu0/d;Lm0/l;I)V
    .locals 13

    move-object v3, p2

    const-string v0, "modifier"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onNavEvent"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onOneTimeEvent"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v9, p4

    check-cast v9, Lm0/q;

    const v0, 0x26cc04ae

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

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x20

    goto :goto_1

    :cond_1
    const/16 v1, 0x10

    :goto_1
    or-int/2addr v0, v1

    invoke-virtual {v9, p2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x100

    goto :goto_2

    :cond_2
    const/16 v1, 0x80

    :goto_2
    or-int/2addr v0, v1

    and-int/lit16 v1, v0, 0x493

    const/16 v4, 0x492

    if-ne v1, v4, :cond_4

    invoke-virtual {v9}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_3

    :cond_3
    invoke-virtual {v9}, Lm0/q;->Y()V

    move-object/from16 v12, p3

    goto :goto_6

    :cond_4
    :goto_3
    const v1, 0x70b323c8

    invoke-virtual {v9, v1}, Lm0/q;->g0(I)V

    invoke-static {v9}, Lh3/a;->a(Lm0/l;)Landroidx/lifecycle/i0;

    move-result-object v5

    if-eqz v5, :cond_7

    const/4 v1, 0x0

    invoke-static {v5, v9, v1}, Landroidx/hilt/navigation/compose/HiltViewModelKt;->createHiltViewModelFactory(Landroidx/lifecycle/i0;Lm0/l;I)Landroidx/lifecycle/d0;

    move-result-object v7

    const v4, 0x671a9c9b

    invoke-virtual {v9, v4}, Lm0/q;->g0(I)V

    instance-of v4, v5, Landroidx/lifecycle/j;

    if-eqz v4, :cond_5

    move-object v4, v5

    check-cast v4, Landroidx/lifecycle/j;

    invoke-interface {v4}, Landroidx/lifecycle/j;->getDefaultViewModelCreationExtras()Lg3/c;

    move-result-object v4

    :goto_4
    move-object v8, v4

    goto :goto_5

    :cond_5
    sget-object v4, Lg3/a;->b:Lg3/a;

    goto :goto_4

    :goto_5
    const-class v4, Lcom/eightsleep/presentation_devmenu/viewmodel/DevMenuViewModel;

    const/4 v6, 0x0

    invoke-static/range {v4 .. v9}, LP2/c;->O(Ljava/lang/Class;Landroidx/lifecycle/i0;Ljava/lang/String;Landroidx/lifecycle/d0;Lg3/c;Lm0/l;)Landroidx/lifecycle/b0;

    move-result-object v4

    invoke-virtual {v9, v1}, Lm0/q;->q(Z)V

    invoke-virtual {v9, v1}, Lm0/q;->q(Z)V

    move-object v1, v4

    check-cast v1, Lcom/eightsleep/presentation_devmenu/viewmodel/DevMenuViewModel;

    new-instance v4, LKf/K1;

    move-object/from16 v12, p3

    invoke-direct {v4, p0, p1, p2, v12}, LKf/K1;-><init>(LA0/r;LVm/k;LVm/k;Lu0/d;)V

    const v5, 0x4cbadbb1    # 9.7967496E7f

    invoke-static {v5, v4, v9}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v8

    and-int/lit16 v4, v0, 0x380

    const v5, 0x6c06000

    or-int/2addr v4, v5

    shl-int/lit8 v0, v0, 0x6

    and-int/lit16 v0, v0, 0x1c00

    or-int v10, v4, v0

    const/4 v6, 0x0

    const-string v7, "dev_menu"

    const/4 v0, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v11, 0x61

    move-object v2, v3

    move-object v3, p1

    invoke-static/range {v0 .. v11}, LP2/o;->g(LA0/r;LL8/e;LVm/k;LVm/k;ZZLH0/w;Ljava/lang/String;LVm/r;Lm0/l;II)V

    :goto_6
    invoke-virtual {v9}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_6

    new-instance v0, LAe/Z;

    const/16 v6, 0x12

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move/from16 v5, p5

    move-object v4, v12

    invoke-direct/range {v0 .. v6}, LAe/Z;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_6
    return-void

    :cond_7
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "No ViewModelStoreOwner was provided via LocalViewModelStoreOwner"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final e0(Ljava/lang/String;)Ljava/time/LocalDate;
    .locals 1

    :try_start_0
    invoke-static {p0}, Ljava/time/Instant;->parse(Ljava/lang/CharSequence;)Ljava/time/Instant;

    move-result-object p0

    invoke-static {}, Ljava/time/ZoneId;->systemDefault()Ljava/time/ZoneId;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/time/Instant;->atZone(Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    move-result-object p0

    invoke-virtual {p0}, Ljava/time/ZonedDateTime;->toLocalDate()Ljava/time/LocalDate;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    invoke-static {p0}, LX4/x;->v(Ljava/lang/Throwable;)LHm/m;

    move-result-object p0

    :goto_0
    instance-of v0, p0, LHm/m;

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    :cond_0
    check-cast p0, Ljava/time/LocalDate;

    return-object p0
.end method

.method public static final f(Ljava/lang/String;Lm0/l;I)V
    .locals 18

    move/from16 v0, p2

    move-object/from16 v11, p1

    check-cast v11, Lm0/q;

    const v1, 0x259c8d49

    invoke-virtual {v11, v1}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v1, v0, 0x3

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    invoke-virtual {v11}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v11}, Lm0/q;->Y()V

    goto :goto_1

    :cond_1
    :goto_0
    sget-object v1, Lih/h;->d:Lih/h;

    invoke-static {v11}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v2

    iget-object v2, v2, Lhh/h;->k:Lhh/v;

    iget-wide v5, v2, Lhh/v;->c:J

    sget-object v12, LA0/o;->a:LA0/o;

    invoke-static {v11}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v2

    iget v14, v2, Lhh/i;->h:F

    invoke-static {v11}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v2

    iget v2, v2, Lhh/i;->c:F

    const/4 v13, 0x0

    const/4 v15, 0x0

    const/16 v17, 0x5

    move/from16 v16, v2

    invoke-static/range {v12 .. v17}, LG/e;->L(LA0/r;FFFFI)LA0/r;

    move-result-object v3

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v4, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v12, 0x6

    const/4 v13, 0x0

    const/16 v14, 0x3f4

    move-object/from16 v2, p0

    invoke-virtual/range {v1 .. v14}, Lih/h;->o(Ljava/lang/String;LA0/r;Lk1/U;JIZIILm0/l;III)V

    :goto_1
    invoke-virtual {v11}, Lm0/q;->u()Lm0/t0;

    move-result-object v1

    if-eqz v1, :cond_2

    new-instance v2, LAg/f0;

    const/4 v3, 0x5

    move-object/from16 v4, p0

    invoke-direct {v2, v4, v0, v3}, LAg/f0;-><init>(Ljava/lang/String;II)V

    iput-object v2, v1, Lm0/t0;->d:LVm/n;

    :cond_2
    return-void
.end method

.method public static final f0(LP6/h;)LC7/e;
    .locals 1

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    instance-of v0, p0, LP6/d;

    if-eqz v0, :cond_0

    sget-object p0, LC7/e;->DEBUG:LC7/e;

    return-object p0

    :cond_0
    instance-of v0, p0, LP6/e;

    if-eqz v0, :cond_1

    sget-object p0, LC7/e;->ERROR:LC7/e;

    return-object p0

    :cond_1
    instance-of v0, p0, LP6/b;

    if-eqz v0, :cond_2

    sget-object p0, LC7/e;->CONFIGURATION:LC7/e;

    return-object p0

    :cond_2
    instance-of v0, p0, LP6/g;

    if-eqz v0, :cond_3

    sget-object p0, LC7/e;->METRIC:LC7/e;

    return-object p0

    :cond_3
    instance-of v0, p0, LP6/a;

    if-eqz v0, :cond_4

    sget-object p0, LC7/e;->API_USAGE:LC7/e;

    return-object p0

    :cond_4
    instance-of p0, p0, LP6/c;

    if-eqz p0, :cond_5

    sget-object p0, LC7/e;->INTERCEPTOR_SETUP:LC7/e;

    return-object p0

    :cond_5
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0
.end method

.method public static final g(LA0/r;LA0/r;LG/g1;Lu0/d;LC8/K;Lu0/d;Lu0/d;Ljava/lang/Integer;LH0/w;LG/g1;Ljava/lang/String;Lr4/G;LVm/n;ZIZLu0/d;LVm/a;LVm/k;Lu0/d;Lm0/l;III)V
    .locals 43

    move-object/from16 v0, p19

    move/from16 v1, p21

    move/from16 v2, p22

    move/from16 v3, p23

    move-object/from16 v4, p20

    check-cast v4, Lm0/q;

    const v5, 0x25663d90

    invoke-virtual {v4, v5}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v5, v3, 0x1

    if-eqz v5, :cond_0

    or-int/lit8 v8, v1, 0x6

    move v9, v8

    move-object/from16 v8, p0

    goto :goto_1

    :cond_0
    and-int/lit8 v8, v1, 0x6

    if-nez v8, :cond_2

    move-object/from16 v8, p0

    invoke-virtual {v4, v8}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    const/4 v9, 0x4

    goto :goto_0

    :cond_1
    const/4 v9, 0x2

    :goto_0
    or-int/2addr v9, v1

    goto :goto_1

    :cond_2
    move-object/from16 v8, p0

    move v9, v1

    :goto_1
    and-int/lit8 v10, v3, 0x2

    if-eqz v10, :cond_4

    or-int/lit8 v9, v9, 0x30

    :cond_3
    move-object/from16 v13, p1

    goto :goto_3

    :cond_4
    and-int/lit8 v13, v1, 0x30

    if-nez v13, :cond_3

    move-object/from16 v13, p1

    invoke-virtual {v4, v13}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_5

    const/16 v14, 0x20

    goto :goto_2

    :cond_5
    const/16 v14, 0x10

    :goto_2
    or-int/2addr v9, v14

    :goto_3
    and-int/lit16 v14, v1, 0x180

    const/16 v16, 0x80

    if-nez v14, :cond_8

    and-int/lit8 v14, v3, 0x4

    if-nez v14, :cond_6

    move-object/from16 v14, p2

    invoke-virtual {v4, v14}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_7

    const/16 v17, 0x100

    goto :goto_4

    :cond_6
    move-object/from16 v14, p2

    :cond_7
    move/from16 v17, v16

    :goto_4
    or-int v9, v9, v17

    goto :goto_5

    :cond_8
    move-object/from16 v14, p2

    :goto_5
    and-int/lit8 v17, v3, 0x8

    const/16 v18, 0x800

    const/16 v19, 0x400

    if-eqz v17, :cond_a

    or-int/lit16 v9, v9, 0xc00

    :cond_9
    move-object/from16 v6, p3

    goto :goto_7

    :cond_a
    and-int/lit16 v6, v1, 0xc00

    if-nez v6, :cond_9

    move-object/from16 v6, p3

    invoke-virtual {v4, v6}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_b

    move/from16 v20, v18

    goto :goto_6

    :cond_b
    move/from16 v20, v19

    :goto_6
    or-int v9, v9, v20

    :goto_7
    and-int/lit8 v20, v3, 0x10

    const/16 v21, 0x4000

    const/16 v22, 0x2000

    if-eqz v20, :cond_d

    or-int/lit16 v9, v9, 0x6000

    :cond_c
    move-object/from16 v7, p4

    goto :goto_9

    :cond_d
    and-int/lit16 v7, v1, 0x6000

    if-nez v7, :cond_c

    move-object/from16 v7, p4

    invoke-virtual {v4, v7}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_e

    move/from16 v24, v21

    goto :goto_8

    :cond_e
    move/from16 v24, v22

    :goto_8
    or-int v9, v9, v24

    :goto_9
    and-int/lit8 v24, v3, 0x20

    const/high16 v25, 0x10000

    const/high16 v26, 0x20000

    const/high16 v27, 0x30000

    if-eqz v24, :cond_f

    or-int v9, v9, v27

    move-object/from16 v11, p5

    goto :goto_b

    :cond_f
    and-int v28, v1, v27

    move-object/from16 v11, p5

    if-nez v28, :cond_11

    invoke-virtual {v4, v11}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v29

    if-eqz v29, :cond_10

    move/from16 v29, v26

    goto :goto_a

    :cond_10
    move/from16 v29, v25

    :goto_a
    or-int v9, v9, v29

    :cond_11
    :goto_b
    const/high16 v29, 0x180000

    or-int v30, v9, v29

    and-int/lit16 v12, v3, 0x80

    const/high16 v31, 0x400000

    const/high16 v32, 0x800000

    const/high16 v33, 0xc00000

    if-eqz v12, :cond_13

    const/high16 v30, 0xd80000

    or-int v30, v9, v30

    :cond_12
    move-object/from16 v9, p7

    goto :goto_d

    :cond_13
    and-int v9, v1, v33

    if-nez v9, :cond_12

    move-object/from16 v9, p7

    invoke-virtual {v4, v9}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v34

    if-eqz v34, :cond_14

    move/from16 v34, v32

    goto :goto_c

    :cond_14
    move/from16 v34, v31

    :goto_c
    or-int v30, v30, v34

    :goto_d
    and-int/lit16 v15, v3, 0x100

    const/high16 v35, 0x6000000

    if-eqz v15, :cond_15

    or-int v30, v30, v35

    move-object/from16 v1, p8

    goto :goto_f

    :cond_15
    and-int v35, v1, v35

    move-object/from16 v1, p8

    if-nez v35, :cond_17

    invoke-virtual {v4, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v35

    if-eqz v35, :cond_16

    const/high16 v35, 0x4000000

    goto :goto_e

    :cond_16
    const/high16 v35, 0x2000000

    :goto_e
    or-int v30, v30, v35

    :cond_17
    :goto_f
    const/high16 v35, 0x30000000

    and-int v36, p21, v35

    const/high16 v37, 0x20000000

    if-nez v36, :cond_1a

    and-int/lit16 v1, v3, 0x200

    if-nez v1, :cond_18

    move-object/from16 v1, p9

    invoke-virtual {v4, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v36

    if-eqz v36, :cond_19

    move/from16 v36, v37

    goto :goto_10

    :cond_18
    move-object/from16 v1, p9

    :cond_19
    const/high16 v36, 0x10000000

    :goto_10
    or-int v30, v30, v36

    :goto_11
    move/from16 v1, v30

    goto :goto_12

    :cond_1a
    move-object/from16 v1, p9

    goto :goto_11

    :goto_12
    move/from16 v30, v5

    and-int/lit16 v5, v3, 0x400

    if-eqz v5, :cond_1b

    or-int/lit8 v23, v2, 0x6

    move/from16 v36, v5

    move-object/from16 v5, p10

    goto :goto_14

    :cond_1b
    and-int/lit8 v36, v2, 0x6

    if-nez v36, :cond_1d

    move/from16 v36, v5

    move-object/from16 v5, p10

    invoke-virtual {v4, v5}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v38

    if-eqz v38, :cond_1c

    const/16 v23, 0x4

    goto :goto_13

    :cond_1c
    const/16 v23, 0x2

    :goto_13
    or-int v23, v2, v23

    goto :goto_14

    :cond_1d
    move/from16 v36, v5

    move-object/from16 v5, p10

    move/from16 v23, v2

    :goto_14
    and-int/lit16 v5, v3, 0x800

    if-eqz v5, :cond_1e

    or-int/lit8 v23, v23, 0x30

    move/from16 v38, v5

    :goto_15
    move/from16 v5, v23

    goto :goto_17

    :cond_1e
    and-int/lit8 v38, v2, 0x30

    if-nez v38, :cond_20

    move/from16 v38, v5

    move-object/from16 v5, p11

    invoke-virtual {v4, v5}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_1f

    const/16 v28, 0x20

    goto :goto_16

    :cond_1f
    const/16 v28, 0x10

    :goto_16
    or-int v23, v23, v28

    goto :goto_15

    :cond_20
    move/from16 v38, v5

    move-object/from16 v5, p11

    goto :goto_15

    :goto_17
    and-int/lit16 v6, v3, 0x1000

    if-eqz v6, :cond_21

    or-int/lit16 v5, v5, 0x180

    move/from16 v16, v5

    move-object/from16 v5, p12

    goto :goto_18

    :cond_21
    move/from16 v23, v5

    and-int/lit16 v5, v2, 0x180

    if-nez v5, :cond_23

    move-object/from16 v5, p12

    invoke-virtual {v4, v5}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_22

    const/16 v16, 0x100

    :cond_22
    or-int v16, v23, v16

    goto :goto_18

    :cond_23
    move-object/from16 v5, p12

    move/from16 v16, v23

    :goto_18
    and-int/lit16 v5, v2, 0xc00

    if-nez v5, :cond_25

    move/from16 v5, p13

    invoke-virtual {v4, v5}, Lm0/q;->h(Z)Z

    move-result v23

    if-eqz v23, :cond_24

    goto :goto_19

    :cond_24
    move/from16 v18, v19

    :goto_19
    or-int v16, v16, v18

    goto :goto_1a

    :cond_25
    move/from16 v5, p13

    :goto_1a
    and-int/lit16 v5, v2, 0x6000

    if-nez v5, :cond_28

    and-int/lit16 v5, v3, 0x4000

    if-nez v5, :cond_26

    move/from16 v5, p14

    invoke-virtual {v4, v5}, Lm0/q;->e(I)Z

    move-result v18

    if-eqz v18, :cond_27

    goto :goto_1b

    :cond_26
    move/from16 v5, p14

    :cond_27
    move/from16 v21, v22

    :goto_1b
    or-int v16, v16, v21

    goto :goto_1c

    :cond_28
    move/from16 v5, p14

    :goto_1c
    const v18, 0x8000

    and-int v18, v3, v18

    if-eqz v18, :cond_29

    or-int v16, v16, v27

    move/from16 v2, p15

    goto :goto_1e

    :cond_29
    and-int v19, v2, v27

    move/from16 v2, p15

    if-nez v19, :cond_2b

    invoke-virtual {v4, v2}, Lm0/q;->h(Z)Z

    move-result v19

    if-eqz v19, :cond_2a

    move/from16 v19, v26

    goto :goto_1d

    :cond_2a
    move/from16 v19, v25

    :goto_1d
    or-int v16, v16, v19

    :cond_2b
    :goto_1e
    and-int v19, v3, v25

    if-eqz v19, :cond_2c

    or-int v16, v16, v29

    move-object/from16 v2, p16

    goto :goto_20

    :cond_2c
    and-int v21, p22, v29

    move-object/from16 v2, p16

    if-nez v21, :cond_2e

    invoke-virtual {v4, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_2d

    const/high16 v21, 0x100000

    goto :goto_1f

    :cond_2d
    const/high16 v21, 0x80000

    :goto_1f
    or-int v16, v16, v21

    :cond_2e
    :goto_20
    and-int v21, v3, v26

    if-eqz v21, :cond_2f

    or-int v16, v16, v33

    move-object/from16 v2, p17

    goto :goto_21

    :cond_2f
    and-int v22, p22, v33

    move-object/from16 v2, p17

    if-nez v22, :cond_31

    invoke-virtual {v4, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_30

    move/from16 v31, v32

    :cond_30
    or-int v16, v16, v31

    :cond_31
    :goto_21
    and-int v22, p22, v35

    if-nez v22, :cond_33

    invoke-virtual {v4, v0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_32

    goto :goto_22

    :cond_32
    const/high16 v37, 0x10000000

    :goto_22
    or-int v16, v16, v37

    :cond_33
    const v22, 0x12492493

    and-int v2, v1, v22

    const v5, 0x12492492

    if-ne v2, v5, :cond_35

    const v2, 0x10492493

    and-int v2, v16, v2

    const v5, 0x10492492

    if-ne v2, v5, :cond_35

    invoke-virtual {v4}, Lm0/q;->H()Z

    move-result v2

    if-nez v2, :cond_34

    goto :goto_23

    :cond_34
    invoke-virtual {v4}, Lm0/q;->Y()V

    move-object/from16 v10, p9

    move-object/from16 v12, p11

    move/from16 v15, p14

    move/from16 v16, p15

    move-object/from16 v17, p16

    move-object/from16 v18, p17

    move-object/from16 v19, p18

    move-object v5, v7

    move-object v1, v8

    move-object v8, v9

    move-object v6, v11

    move-object v2, v13

    move-object v3, v14

    move-object/from16 v7, p6

    move-object/from16 v9, p8

    move-object/from16 v11, p10

    move-object/from16 v13, p12

    move-object v14, v4

    move-object/from16 v4, p3

    goto/16 :goto_34

    :cond_35
    :goto_23
    invoke-virtual {v4}, Lm0/q;->a0()V

    and-int/lit8 v2, p21, 0x1

    if-eqz v2, :cond_39

    invoke-virtual {v4}, Lm0/q;->E()Z

    move-result v2

    if-eqz v2, :cond_36

    goto :goto_24

    :cond_36
    invoke-virtual {v4}, Lm0/q;->Y()V

    and-int/lit8 v2, v3, 0x4

    if-eqz v2, :cond_37

    and-int/lit16 v1, v1, -0x381

    :cond_37
    and-int/lit16 v2, v3, 0x200

    if-eqz v2, :cond_38

    const v2, -0x70000001

    and-int/2addr v1, v2

    :cond_38
    move-object/from16 v10, p3

    move-object/from16 v5, p8

    move-object/from16 v15, p9

    move-object/from16 v18, p10

    move-object/from16 v20, p11

    move/from16 v12, p15

    move-object/from16 v19, p16

    move-object/from16 v21, p17

    move-object/from16 v22, p18

    move/from16 v16, v1

    move-object v1, v8

    move-object v2, v9

    move-object v6, v11

    move-object/from16 v8, p6

    move-object/from16 v9, p12

    move/from16 v11, p14

    goto/16 :goto_2f

    :cond_39
    :goto_24
    if-eqz v30, :cond_3a

    sget-object v2, LA0/o;->a:LA0/o;

    move-object v8, v2

    :cond_3a
    if-eqz v10, :cond_3b

    sget-object v2, LA0/o;->a:LA0/o;

    move-object v13, v2

    :cond_3b
    and-int/lit8 v2, v3, 0x4

    if-eqz v2, :cond_3c

    invoke-static {v4}, Lj0/H3;->a(Lm0/l;)LG/z0;

    move-result-object v2

    and-int/lit16 v1, v1, -0x381

    move-object v14, v2

    :cond_3c
    if-eqz v17, :cond_3d

    const/4 v10, 0x0

    goto :goto_25

    :cond_3d
    move-object/from16 v10, p3

    :goto_25
    if-eqz v20, :cond_3e

    const/4 v7, 0x0

    :cond_3e
    if-eqz v24, :cond_3f

    sget-object v11, Lg8/z;->a:Lu0/d;

    :cond_3f
    sget-object v16, Lg8/z;->b:Lu0/d;

    if-eqz v12, :cond_40

    const/4 v9, 0x0

    :cond_40
    if-eqz v15, :cond_41

    const/4 v12, 0x0

    goto :goto_26

    :cond_41
    move-object/from16 v12, p8

    :goto_26
    and-int/lit16 v15, v3, 0x200

    if-eqz v15, :cond_42

    invoke-static {v4}, Lk0/h;->m(Lm0/l;)LG/b1;

    move-result-object v15

    const v17, -0x70000001

    and-int v1, v1, v17

    goto :goto_27

    :cond_42
    move-object/from16 v15, p9

    :goto_27
    if-eqz v36, :cond_43

    const-string v17, ""

    goto :goto_28

    :cond_43
    move-object/from16 v17, p10

    :goto_28
    if-eqz v38, :cond_44

    const/16 v20, 0x0

    goto :goto_29

    :cond_44
    move-object/from16 v20, p11

    :goto_29
    if-eqz v6, :cond_45

    sget-object v6, Lg8/z;->c:Lu0/d;

    goto :goto_2a

    :cond_45
    move-object/from16 v6, p12

    :goto_2a
    and-int/lit16 v2, v3, 0x4000

    if-eqz v2, :cond_46

    const v2, 0x7f080185

    goto :goto_2b

    :cond_46
    move/from16 v2, p14

    :goto_2b
    if-eqz v18, :cond_47

    const/16 v18, 0x0

    goto :goto_2c

    :cond_47
    move/from16 v18, p15

    :goto_2c
    if-eqz v19, :cond_48

    const/16 v19, 0x0

    goto :goto_2d

    :cond_48
    move-object/from16 v19, p16

    :goto_2d
    if-eqz v21, :cond_49

    const/16 v21, 0x0

    goto :goto_2e

    :cond_49
    move-object/from16 v21, p17

    :goto_2e
    const v5, 0x58844b78

    invoke-virtual {v4, v5}, Lm0/q;->f0(I)V

    invoke-virtual {v4}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v5

    move/from16 p0, v1

    sget-object v1, Lm0/k;->a:Lm0/e;

    if-ne v5, v1, :cond_4a

    new-instance v5, Ldg/g;

    const/16 v1, 0x11

    invoke-direct {v5, v1}, Ldg/g;-><init>(I)V

    invoke-virtual {v4, v5}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_4a
    move-object v1, v5

    check-cast v1, LVm/k;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lm0/q;->q(Z)V

    move-object v5, v11

    move v11, v2

    move-object v2, v9

    move-object v9, v6

    move-object v6, v5

    move-object/from16 v22, v1

    move-object v1, v8

    move-object v5, v12

    move-object/from16 v8, v16

    move/from16 v12, v18

    move/from16 v16, p0

    move-object/from16 v18, v17

    :goto_2f
    invoke-virtual {v4}, Lm0/q;->r()V

    move-object/from16 p14, v2

    const v2, 0x58845cbf

    invoke-virtual {v4, v2}, Lm0/q;->f0(I)V

    invoke-virtual {v4}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v2

    sget-object v3, Lm0/k;->a:Lm0/e;

    if-ne v2, v3, :cond_4b

    invoke-static/range {v18 .. v18}, Lm0/r;->C(Ljava/lang/Object;)Lm0/i0;

    move-result-object v2

    invoke-virtual {v4, v2}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_4b
    check-cast v2, Lm0/Z;

    const/4 v3, 0x0

    invoke-virtual {v4, v3}, Lm0/q;->q(Z)V

    const v3, 0x58847fd5

    invoke-virtual {v4, v3}, Lm0/q;->f0(I)V

    if-eqz p14, :cond_4c

    invoke-static {v4}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v3

    iget-object v3, v3, Lhh/h;->a:Lhh/a;

    move-object/from16 p2, v2

    iget-wide v2, v3, Lhh/a;->b:J

    move-object/from16 p15, v6

    sget-object v6, LH0/F;->b:LH0/S;

    invoke-static {v1, v2, v3, v6}, Ly/x;->g(LA0/r;JLH0/X;)LA0/r;

    move-result-object v2

    invoke-virtual/range {p14 .. p14}, Ljava/lang/Integer;->intValue()I

    move-result v3

    shr-int/lit8 v6, v16, 0x15

    and-int/lit8 v6, v6, 0xe

    invoke-static {v3, v6, v4}, LP2/i;->E(IILm0/l;)LL0/a;

    move-result-object v3

    sget-object v6, LX0/p;->d:LX0/p0;

    sget-object v17, LA0/d;->b:LA0/i;

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x30

    move-object/from16 p3, v2

    move-object/from16 p4, v3

    move-object/from16 p6, v6

    move-object/from16 p5, v17

    move/from16 p7, v23

    move-object/from16 p8, v24

    move/from16 p9, v25

    invoke-static/range {p3 .. p9}, Landroidx/compose/ui/draw/a;->a(LA0/r;LL0/a;LA0/e;LX0/q;FLH0/x;I)LA0/r;

    move-result-object v2

    :goto_30
    const/4 v3, 0x0

    goto :goto_31

    :cond_4c
    move-object/from16 p2, v2

    move-object/from16 p15, v6

    move-object v2, v1

    goto :goto_30

    :goto_31
    invoke-virtual {v4, v3}, Lm0/q;->q(Z)V

    const v3, 0x5884e155

    invoke-virtual {v4, v3}, Lm0/q;->f0(I)V

    if-nez v5, :cond_4e

    if-eqz p14, :cond_4d

    sget-wide v23, LH0/w;->g:J

    move-object/from16 p16, v2

    move-wide/from16 v41, v23

    move-object/from16 v23, v1

    move-wide/from16 v1, v41

    goto :goto_32

    :cond_4d
    invoke-static {v4}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v3

    iget-object v3, v3, Lhh/h;->a:Lhh/a;

    move-object/from16 v23, v1

    move-object/from16 p16, v2

    iget-wide v1, v3, Lhh/a;->b:J

    :goto_32
    const/4 v3, 0x0

    goto :goto_33

    :cond_4e
    move-object/from16 v23, v1

    move-object/from16 p16, v2

    iget-wide v1, v5, LH0/w;->a:J

    goto :goto_32

    :goto_33
    invoke-virtual {v4, v3}, Lm0/q;->q(Z)V

    new-instance v3, Lg8/b0;

    move/from16 p7, p13

    move-object/from16 p0, v3

    move-object/from16 p3, v7

    move-object/from16 p12, v9

    move-object/from16 p1, v10

    move/from16 p8, v11

    move/from16 p9, v12

    move-object/from16 p4, v13

    move-object/from16 p5, v14

    move-object/from16 p6, v19

    move-object/from16 p10, v20

    move-object/from16 p11, v21

    invoke-direct/range {p0 .. p12}, Lg8/b0;-><init>(Lu0/d;Lm0/Z;LC8/K;LA0/r;LG/g1;Lu0/d;ZIZLr4/G;LVm/a;LVm/n;)V

    move-object/from16 v7, p0

    move-object/from16 v20, p1

    move-object/from16 v6, p2

    move-object/from16 v21, p3

    move-object/from16 v3, p4

    move-object/from16 v19, p5

    move-object/from16 v28, p6

    move/from16 v26, p8

    move/from16 v27, p9

    move-object/from16 v24, p10

    move-object/from16 v29, p11

    move-object/from16 v25, p12

    const v9, -0x6d43d0b4

    invoke-static {v9, v7, v4}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v7

    new-instance v9, LWf/I0;

    const/16 v10, 0xa

    invoke-direct {v9, v10, v0, v6}, LWf/I0;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    const v6, -0x42c74f9f

    invoke-static {v6, v9, v4}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v6

    shr-int/lit8 v9, v16, 0x9

    and-int/lit16 v9, v9, 0x380

    const v10, 0x30000030

    or-int/2addr v9, v10

    shr-int/lit8 v10, v16, 0x6

    const v11, 0xe000

    and-int/2addr v10, v11

    or-int/2addr v9, v10

    shr-int/lit8 v10, v16, 0x3

    const/high16 v11, 0xe000000

    and-int/2addr v10, v11

    or-int v17, v9, v10

    const/4 v9, 0x1

    const-wide/16 v12, 0x0

    move-object v10, v5

    move-object v5, v7

    const/4 v7, 0x0

    move-wide/from16 v41, v1

    move-object v1, v10

    move-wide/from16 v10, v41

    move-object/from16 v16, v4

    move-object v14, v15

    move-object/from16 v4, p16

    move-object v15, v6

    move-object/from16 v6, p15

    invoke-static/range {v4 .. v17}, Lj0/f2;->a(LA0/r;Lu0/d;Lu0/d;Lu0/d;Lu0/d;IJJLG/g1;Lu0/d;Lm0/l;I)V

    move-object v9, v1

    move-object v2, v3

    move-object v7, v8

    move-object v10, v14

    move-object/from16 v14, v16

    move-object/from16 v11, v18

    move-object/from16 v3, v19

    move-object/from16 v4, v20

    move-object/from16 v5, v21

    move-object/from16 v19, v22

    move-object/from16 v1, v23

    move-object/from16 v12, v24

    move-object/from16 v13, v25

    move/from16 v15, v26

    move/from16 v16, v27

    move-object/from16 v17, v28

    move-object/from16 v18, v29

    move-object/from16 v8, p14

    :goto_34
    invoke-virtual {v14}, Lm0/q;->u()Lm0/t0;

    move-result-object v14

    if-eqz v14, :cond_4f

    new-instance v0, Lg8/Y;

    move-object/from16 v20, p19

    move/from16 v21, p21

    move/from16 v22, p22

    move/from16 v23, p23

    move-object/from16 v40, v14

    move/from16 v14, p13

    invoke-direct/range {v0 .. v23}, Lg8/Y;-><init>(LA0/r;LA0/r;LG/g1;Lu0/d;LC8/K;Lu0/d;Lu0/d;Ljava/lang/Integer;LH0/w;LG/g1;Ljava/lang/String;Lr4/G;LVm/n;ZIZLu0/d;LVm/a;LVm/k;Lu0/d;III)V

    move-object/from16 v1, v40

    iput-object v0, v1, Lm0/t0;->d:LVm/n;

    :cond_4f
    return-void
.end method

.method public static g0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x2

    invoke-static {v0}, LP2/n;->W(I)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, " \ud83d\udc9b "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public static final h(Ljava/lang/String;Lm0/l;I)V
    .locals 15

    move/from16 v14, p2

    const-string v0, "text"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v10, p1

    check-cast v10, Lm0/q;

    const v0, 0x2d64d99

    invoke-virtual {v10, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, v14, 0x6

    const/4 v2, 0x2

    if-nez v0, :cond_1

    invoke-virtual {v10, p0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    or-int/2addr v0, v14

    goto :goto_1

    :cond_1
    move v0, v14

    :goto_1
    and-int/lit8 v3, v0, 0x3

    if-ne v3, v2, :cond_2

    invoke-virtual {v10}, Lm0/q;->H()Z

    move-result v2

    if-nez v2, :cond_3

    :cond_2
    move v2, v0

    goto :goto_2

    :cond_3
    invoke-virtual {v10}, Lm0/q;->Y()V

    goto :goto_3

    :goto_2
    sget-object v0, Lih/h;->d:Lih/h;

    invoke-static {v10}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v3

    iget-object v3, v3, Lhh/h;->k:Lhh/v;

    iget-wide v4, v3, Lhh/v;->d:J

    and-int/lit8 v11, v2, 0xe

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v12, 0x0

    const/16 v13, 0x3f6

    move-object v1, p0

    invoke-virtual/range {v0 .. v13}, Lih/h;->o(Ljava/lang/String;LA0/r;Lk1/U;JIZIILm0/l;III)V

    :goto_3
    invoke-virtual {v10}, Lm0/q;->u()Lm0/t0;

    move-result-object v0

    if-eqz v0, :cond_4

    new-instance v2, LMg/k;

    const/4 v3, 0x3

    invoke-direct {v2, p0, v14, v3}, LMg/k;-><init>(Ljava/lang/String;II)V

    iput-object v2, v0, Lm0/t0;->d:LVm/n;

    :cond_4
    return-void
.end method

.method public static final h0(ZLJ/m;I)I
    .locals 0

    if-eqz p0, :cond_0

    iget-object p0, p1, LJ/m;->m:Ljava/lang/Object;

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, LJ/n;

    iget p0, p0, LJ/n;->u:I

    return p0

    :cond_0
    iget-object p0, p1, LJ/m;->m:Ljava/lang/Object;

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, LJ/n;

    iget p0, p0, LJ/n;->v:I

    return p0
.end method

.method public static final i(LA0/r;Lcom/eightsleep/data_core/enums/PrimingTaskMetaId;Ljava/lang/String;LVm/k;LVm/k;Lcom/eightsleep/presentation_onboarding/viewmodel/FillPodOnboardingViewModel;Lm0/l;I)V
    .locals 16

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    const-string v0, "onNavEvent"

    invoke-static {v4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onOneTimeEvent"

    invoke-static {v5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v13, p6

    check-cast v13, Lm0/q;

    const v0, -0x2cbd9ac6

    invoke-virtual {v13, v0}, Lm0/q;->h0(I)Lm0/q;

    move-object/from16 v1, p0

    invoke-virtual {v13, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int v0, p7, v0

    invoke-virtual {v13, v2}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    const/16 v6, 0x20

    goto :goto_1

    :cond_1
    const/16 v6, 0x10

    :goto_1
    or-int/2addr v0, v6

    invoke-virtual {v13, v3}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    const/16 v6, 0x100

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

    move-object/from16 v6, p5

    invoke-virtual {v13, v6}, Lm0/q;->i(Ljava/lang/Object;)Z

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

    invoke-virtual {v13}, Lm0/q;->H()Z

    move-result v7

    if-nez v7, :cond_6

    goto :goto_6

    :cond_6
    invoke-virtual {v13}, Lm0/q;->Y()V

    goto :goto_7

    :cond_7
    :goto_6
    invoke-static {v13}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v7

    iget-object v7, v7, Lhh/h;->a:Lhh/a;

    iget-wide v7, v7, Lhh/a;->a:J

    new-instance v10, LH0/w;

    invoke-direct {v10, v7, v8}, LH0/w;-><init>(J)V

    new-instance v7, LAe/a0;

    const/4 v8, 0x7

    invoke-direct {v7, v8, v2, v3}, LAe/a0;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    const v8, 0x14be7b66

    invoke-static {v8, v7, v13}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v12

    and-int/lit8 v7, v0, 0xe

    const/high16 v8, 0x6000000

    or-int/2addr v7, v8

    shr-int/lit8 v8, v0, 0xc

    and-int/lit8 v8, v8, 0x70

    or-int/2addr v7, v8

    shr-int/lit8 v8, v0, 0x6

    and-int/lit16 v8, v8, 0x380

    or-int/2addr v7, v8

    and-int/lit16 v0, v0, 0x1c00

    or-int v14, v7, v0

    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v8, 0x0

    const/16 v15, 0xb0

    move-object v7, v6

    move-object v6, v5

    move-object v5, v7

    move-object v7, v4

    move-object v4, v1

    invoke-static/range {v4 .. v15}, LP2/o;->g(LA0/r;LL8/e;LVm/k;LVm/k;ZZLH0/w;Ljava/lang/String;LVm/r;Lm0/l;II)V

    :goto_7
    invoke-virtual {v13}, Lm0/q;->u()Lm0/t0;

    move-result-object v8

    if-eqz v8, :cond_8

    new-instance v0, LAe/d0;

    move-object/from16 v1, p0

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move/from16 v7, p7

    invoke-direct/range {v0 .. v7}, LAe/d0;-><init>(LA0/r;Lcom/eightsleep/data_core/enums/PrimingTaskMetaId;Ljava/lang/String;LVm/k;LVm/k;Lcom/eightsleep/presentation_onboarding/viewmodel/FillPodOnboardingViewModel;I)V

    iput-object v0, v8, Lm0/t0;->d:LVm/n;

    :cond_8
    return-void
.end method

.method public static i0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x5

    invoke-static {v0}, LP2/n;->W(I)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, " \ud83e\udde1\ufe0f "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, LP2/H;->f0(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public static final j(Lgi/j;ZLjava/lang/String;FLjava/lang/String;LVm/a;LVm/a;Lm0/l;I)V
    .locals 17

    move-object/from16 v1, p0

    move/from16 v15, p1

    move-object/from16 v0, p5

    move/from16 v2, p8

    const-string v3, "model"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "onCtaClicked"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v3, p7

    check-cast v3, Lm0/q;

    const v4, -0x60abf8d5

    invoke-virtual {v3, v4}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v4, v2, 0x6

    if-nez v4, :cond_1

    invoke-virtual {v3, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

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

    if-nez v5, :cond_3

    invoke-virtual {v3, v15}, Lm0/q;->h(Z)Z

    move-result v5

    if-eqz v5, :cond_2

    const/16 v5, 0x20

    goto :goto_2

    :cond_2
    const/16 v5, 0x10

    :goto_2
    or-int/2addr v4, v5

    :cond_3
    and-int/lit16 v5, v2, 0x180

    if-nez v5, :cond_5

    move-object/from16 v5, p2

    invoke-virtual {v3, v5}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    const/16 v6, 0x100

    goto :goto_3

    :cond_4
    const/16 v6, 0x80

    :goto_3
    or-int/2addr v4, v6

    goto :goto_4

    :cond_5
    move-object/from16 v5, p2

    :goto_4
    and-int/lit16 v6, v2, 0xc00

    if-nez v6, :cond_7

    move/from16 v6, p3

    invoke-virtual {v3, v6}, Lm0/q;->d(F)Z

    move-result v7

    if-eqz v7, :cond_6

    const/16 v7, 0x800

    goto :goto_5

    :cond_6
    const/16 v7, 0x400

    :goto_5
    or-int/2addr v4, v7

    goto :goto_6

    :cond_7
    move/from16 v6, p3

    :goto_6
    and-int/lit16 v7, v2, 0x6000

    if-nez v7, :cond_9

    move-object/from16 v7, p4

    invoke-virtual {v3, v7}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_8

    const/16 v8, 0x4000

    goto :goto_7

    :cond_8
    const/16 v8, 0x2000

    :goto_7
    or-int/2addr v4, v8

    goto :goto_8

    :cond_9
    move-object/from16 v7, p4

    :goto_8
    const/high16 v8, 0x30000

    and-int/2addr v8, v2

    if-nez v8, :cond_b

    invoke-virtual {v3, v0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_a

    const/high16 v8, 0x20000

    goto :goto_9

    :cond_a
    const/high16 v8, 0x10000

    :goto_9
    or-int/2addr v4, v8

    :cond_b
    const/high16 v8, 0x180000

    and-int/2addr v8, v2

    if-nez v8, :cond_d

    move-object/from16 v8, p6

    invoke-virtual {v3, v8}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_c

    const/high16 v9, 0x100000

    goto :goto_a

    :cond_c
    const/high16 v9, 0x80000

    :goto_a
    or-int/2addr v4, v9

    goto :goto_b

    :cond_d
    move-object/from16 v8, p6

    :goto_b
    const v9, 0x92493

    and-int/2addr v4, v9

    const v9, 0x92492

    if-ne v4, v9, :cond_f

    invoke-virtual {v3}, Lm0/q;->H()Z

    move-result v4

    if-nez v4, :cond_e

    goto :goto_c

    :cond_e
    invoke-virtual {v3}, Lm0/q;->Y()V

    move-object v10, v3

    goto/16 :goto_e

    :cond_f
    :goto_c
    sget-object v4, Ltimber/log/Timber;->a:Lbr/a;

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "FILL PILLOW - Fill Pod Screen - step: "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, v1, Lgi/j;->l:LPh/a;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Object;

    invoke-virtual {v4, v9, v11}, Lbr/a;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object v4, LSh/B;->POD_FILLING:LSh/B;

    if-ne v10, v4, :cond_10

    if-eqz v15, :cond_10

    sget-object v13, LSh/B;->PRIMING_NOTIFICATIONS:LSh/B;

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object v10, v3

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v14, v10

    const/4 v10, 0x0

    move-object/from16 v16, v14

    const/16 v14, 0x77ff

    move-object/from16 v0, p0

    move-object/from16 v15, v16

    invoke-static/range {v0 .. v14}, Lgi/j;->u(Lgi/j;ZLjava/lang/String;JJLcom/eightsleep/data_core/enums/PodGeneration;FILcom/eightsleep/data_core/enums/PrimingTaskStatus;ZZLSh/B;I)Lgi/j;

    move-result-object v1

    move-object v7, v1

    goto :goto_d

    :cond_10
    move-object v15, v3

    move-object/from16 v7, p0

    :goto_d
    new-instance v0, LWf/l1;

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move/from16 v3, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v4, p6

    invoke-direct/range {v0 .. v6}, LWf/l1;-><init>(Lgi/j;Ljava/lang/String;FLVm/a;Ljava/lang/String;LVm/a;)V

    const v1, 0x7129c503

    invoke-static {v1, v0, v15}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v9

    move-object v5, v7

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/high16 v11, 0x30000

    const/16 v12, 0xdd

    move-object v10, v15

    invoke-static/range {v4 .. v12}, LIm/M;->x(LA0/r;Lgi/u;LVm/k;ZZLVm/p;Lm0/l;II)V

    :goto_e
    invoke-virtual {v10}, Lm0/q;->u()Lm0/t0;

    move-result-object v9

    if-eqz v9, :cond_11

    new-instance v0, LNg/p;

    move-object/from16 v1, p0

    move/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move/from16 v8, p8

    invoke-direct/range {v0 .. v8}, LNg/p;-><init>(Lgi/j;ZLjava/lang/String;FLjava/lang/String;LVm/a;LVm/a;I)V

    iput-object v0, v9, Lm0/t0;->d:LVm/n;

    :cond_11
    return-void
.end method

.method public static j0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    const/4 v0, 0x5

    invoke-static {v0}, LP2/n;->W(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, " \ud83e\udde1 "

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, p2}, LP2/H;->g0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    return-void
.end method

.method public static final k(ILA0/r;LVm/k;LVm/k;Lm0/l;)V
    .locals 12

    const-string v0, "onOneTimeEvent"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onNavEvent"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v9, p4

    check-cast v9, Lm0/q;

    const v0, 0x5a40f459

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

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x20

    goto :goto_1

    :cond_1
    const/16 v1, 0x10

    :goto_1
    or-int/2addr v0, v1

    invoke-virtual {v9, p3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x100

    goto :goto_2

    :cond_2
    const/16 v1, 0x80

    :goto_2
    or-int/2addr v0, v1

    and-int/lit16 v1, v0, 0x93

    const/16 v4, 0x92

    if-ne v1, v4, :cond_4

    invoke-virtual {v9}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_3

    :cond_3
    invoke-virtual {v9}, Lm0/q;->Y()V

    goto :goto_6

    :cond_4
    :goto_3
    const v1, 0x70b323c8

    invoke-virtual {v9, v1}, Lm0/q;->g0(I)V

    invoke-static {v9}, Lh3/a;->a(Lm0/l;)Landroidx/lifecycle/i0;

    move-result-object v5

    if-eqz v5, :cond_7

    const/4 v1, 0x0

    invoke-static {v5, v9, v1}, Landroidx/hilt/navigation/compose/HiltViewModelKt;->createHiltViewModelFactory(Landroidx/lifecycle/i0;Lm0/l;I)Landroidx/lifecycle/d0;

    move-result-object v7

    const v4, 0x671a9c9b

    invoke-virtual {v9, v4}, Lm0/q;->g0(I)V

    instance-of v4, v5, Landroidx/lifecycle/j;

    if-eqz v4, :cond_5

    move-object v4, v5

    check-cast v4, Landroidx/lifecycle/j;

    invoke-interface {v4}, Landroidx/lifecycle/j;->getDefaultViewModelCreationExtras()Lg3/c;

    move-result-object v4

    :goto_4
    move-object v8, v4

    goto :goto_5

    :cond_5
    sget-object v4, Lg3/a;->b:Lg3/a;

    goto :goto_4

    :goto_5
    const-class v4, Lcom/eightsleep/presentation_metrics/viewmodel/HealthCheckHomeViewModel;

    const/4 v6, 0x0

    invoke-static/range {v4 .. v9}, LP2/c;->O(Ljava/lang/Class;Landroidx/lifecycle/i0;Ljava/lang/String;Landroidx/lifecycle/d0;Lg3/c;Lm0/l;)Landroidx/lifecycle/b0;

    move-result-object v4

    invoke-virtual {v9, v1}, Lm0/q;->q(Z)V

    invoke-virtual {v9, v1}, Lm0/q;->q(Z)V

    move-object v1, v4

    check-cast v1, LL8/e;

    new-instance v4, LAe/Q;

    const/4 v5, 0x3

    invoke-direct {v4, p1, v5}, LAe/Q;-><init>(LA0/r;I)V

    const v5, 0x18ca969f

    invoke-static {v5, v4, v9}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v8

    shl-int/lit8 v0, v0, 0x3

    and-int/lit16 v4, v0, 0x380

    const/high16 v5, 0x6c00000

    or-int/2addr v4, v5

    and-int/lit16 v0, v0, 0x1c00

    or-int v10, v4, v0

    const/4 v6, 0x0

    const-string v7, "health_check_landing"

    const/4 v0, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v11, 0x71

    move-object v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v11}, LP2/o;->g(LA0/r;LL8/e;LVm/k;LVm/k;ZZLH0/w;Ljava/lang/String;LVm/r;Lm0/l;II)V

    :goto_6
    invoke-virtual {v9}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_6

    new-instance v0, LAg/J;

    const/4 v5, 0x0

    move v4, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, LAg/J;-><init>(LA0/r;LVm/k;LVm/k;II)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_6
    return-void

    :cond_7
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "No ViewModelStoreOwner was provided via LocalViewModelStoreOwner"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final l(LVm/a;LVm/a;LVm/a;LVm/a;LVm/k;LVm/k;LVm/a;LVm/a;LA0/r;Lm0/l;I)V
    .locals 27

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move/from16 v10, p10

    const-string v0, "model"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onOutliersClick"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onBreathingClick"

    invoke-static {v3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onHeartBeatClick"

    invoke-static {v4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onTrendClick"

    invoke-static {v5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onTagClick"

    invoke-static {v6, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onMoreTagsClick"

    invoke-static {v7, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onBackClick"

    invoke-static {v8, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v14, p9

    check-cast v14, Lm0/q;

    const v0, -0x28e4ce2a

    invoke-virtual {v14, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, v10, 0x6

    if-nez v0, :cond_1

    invoke-virtual {v14, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

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
    and-int/lit8 v9, v10, 0x30

    if-nez v9, :cond_3

    invoke-virtual {v14, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    const/16 v9, 0x20

    goto :goto_2

    :cond_2
    const/16 v9, 0x10

    :goto_2
    or-int/2addr v0, v9

    :cond_3
    and-int/lit16 v9, v10, 0x180

    if-nez v9, :cond_5

    invoke-virtual {v14, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    const/16 v9, 0x100

    goto :goto_3

    :cond_4
    const/16 v9, 0x80

    :goto_3
    or-int/2addr v0, v9

    :cond_5
    and-int/lit16 v9, v10, 0xc00

    if-nez v9, :cond_7

    invoke-virtual {v14, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    const/16 v9, 0x800

    goto :goto_4

    :cond_6
    const/16 v9, 0x400

    :goto_4
    or-int/2addr v0, v9

    :cond_7
    and-int/lit16 v9, v10, 0x6000

    if-nez v9, :cond_9

    invoke-virtual {v14, v5}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    const/16 v9, 0x4000

    goto :goto_5

    :cond_8
    const/16 v9, 0x2000

    :goto_5
    or-int/2addr v0, v9

    :cond_9
    const/high16 v9, 0x30000

    and-int/2addr v9, v10

    if-nez v9, :cond_b

    invoke-virtual {v14, v6}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_a

    const/high16 v9, 0x20000

    goto :goto_6

    :cond_a
    const/high16 v9, 0x10000

    :goto_6
    or-int/2addr v0, v9

    :cond_b
    const/high16 v9, 0x180000

    and-int/2addr v9, v10

    if-nez v9, :cond_d

    invoke-virtual {v14, v7}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_c

    const/high16 v9, 0x100000

    goto :goto_7

    :cond_c
    const/high16 v9, 0x80000

    :goto_7
    or-int/2addr v0, v9

    :cond_d
    const/high16 v9, 0xc00000

    and-int/2addr v9, v10

    if-nez v9, :cond_f

    invoke-virtual {v14, v8}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e

    const/high16 v9, 0x800000

    goto :goto_8

    :cond_e
    const/high16 v9, 0x400000

    :goto_8
    or-int/2addr v0, v9

    :cond_f
    move-object/from16 v9, p8

    invoke-virtual {v14, v9}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_10

    const/high16 v12, 0x4000000

    goto :goto_9

    :cond_10
    const/high16 v12, 0x2000000

    :goto_9
    or-int/2addr v0, v12

    const v12, 0x2492493

    and-int/2addr v12, v0

    const v13, 0x2492492

    if-ne v12, v13, :cond_12

    invoke-virtual {v14}, Lm0/q;->H()Z

    move-result v12

    if-nez v12, :cond_11

    goto :goto_a

    :cond_11
    invoke-virtual {v14}, Lm0/q;->Y()V

    goto/16 :goto_10

    :cond_12
    :goto_a
    invoke-interface {v1}, LVm/a;->invoke()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lwg/F;

    invoke-static {v9}, LG/e;->M(LA0/r;)LA0/r;

    move-result-object v13

    invoke-static {v14}, Ly/x;->n(Lm0/l;)Ly/B0;

    move-result-object v15

    move-object/from16 p9, v12

    const/4 v12, 0x1

    invoke-static {v13, v15, v12}, Ly/x;->o(LA0/r;Ly/B0;Z)LA0/r;

    move-result-object v13

    sget-object v15, LG/l;->c:LG/f;

    sget-object v12, LA0/d;->m:LA0/g;

    const/4 v11, 0x0

    invoke-static {v15, v12, v14, v11}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v12

    move-object/from16 v18, v12

    iget-wide v11, v14, Lm0/q;->T:J

    invoke-static {v11, v12}, Ljava/lang/Long;->hashCode(J)I

    move-result v11

    invoke-virtual {v14}, Lm0/q;->m()Lm0/o0;

    move-result-object v12

    invoke-static {v13, v14}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v13

    sget-object v19, LZ0/h;->l0:LZ0/g;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v15, LZ0/g;->b:LZ0/f;

    invoke-virtual {v14}, Lm0/q;->j0()V

    move/from16 v20, v0

    iget-boolean v0, v14, Lm0/q;->S:Z

    if-eqz v0, :cond_13

    invoke-virtual {v14, v15}, Lm0/q;->l(LVm/a;)V

    goto :goto_b

    :cond_13
    invoke-virtual {v14}, Lm0/q;->t0()V

    :goto_b
    sget-object v0, LZ0/g;->f:LZ0/e;

    move-object/from16 v9, v18

    invoke-static {v0, v9, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v9, LZ0/g;->e:LZ0/e;

    invoke-static {v9, v12, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    sget-object v12, LZ0/g;->g:LZ0/e;

    invoke-static {v14, v11, v12}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v11, LZ0/g;->h:LZ0/d;

    invoke-static {v14, v11}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    move-object/from16 v18, v12

    sget-object v12, LZ0/g;->d:LZ0/e;

    invoke-static {v12, v13, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v21, LG/D;->a:LG/D;

    move-object v13, v11

    sget-object v11, Lg8/d0;->a:Lg8/d0;

    const v10, 0x644e4fbc

    invoke-virtual {v14, v10}, Lm0/q;->f0(I)V

    const/high16 v10, 0x1c00000

    and-int v10, v20, v10

    move-object/from16 v20, v11

    const/high16 v11, 0x800000

    if-ne v10, v11, :cond_14

    const/4 v10, 0x1

    goto :goto_c

    :cond_14
    const/4 v10, 0x0

    :goto_c
    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v11

    if-nez v10, :cond_15

    sget-object v10, Lm0/k;->a:Lm0/e;

    if-ne v11, v10, :cond_16

    :cond_15
    new-instance v11, LAe/c;

    const/4 v10, 0x5

    invoke-direct {v11, v10, v8}, LAe/c;-><init>(ILVm/a;)V

    invoke-virtual {v14, v11}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_16
    check-cast v11, LVm/a;

    const/4 v10, 0x0

    invoke-virtual {v14, v10}, Lm0/q;->q(Z)V

    invoke-static {v11}, Lg8/d0;->b(LVm/a;)Lu0/d;

    move-result-object v11

    const/16 v17, 0x1

    const/16 v16, 0x5

    move-object/from16 v19, v12

    const/4 v12, 0x0

    move-object/from16 v22, v15

    const/4 v15, 0x0

    move v8, v10

    move-object/from16 v25, v13

    move-object/from16 v24, v18

    move-object/from16 v26, v19

    move-object/from16 v23, v22

    move-object/from16 v10, p9

    move-object v13, v11

    move-object/from16 v11, v20

    invoke-virtual/range {v11 .. v16}, Lg8/d0;->d(Ljava/lang/String;Lu0/d;Lm0/l;II)V

    sget-object v11, Lg8/h0;->a:Lg8/h0;

    const v12, 0x7f1206f0

    invoke-static {v14, v12}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v16

    const/4 v15, 0x0

    move-object/from16 v18, v14

    const/4 v14, 0x0

    const/16 v20, 0x0

    const/16 v19, 0x0

    const/16 v17, 0x0

    const/4 v12, 0x0

    const/16 v13, 0x7e

    invoke-virtual/range {v11 .. v20}, Lg8/h0;->v(IILA0/r;LH0/w;Ljava/lang/String;Lk1/U;Lm0/l;Lv1/k;Z)V

    move-object/from16 v14, v18

    invoke-static {v14, v8}, LP2/z;->M(Lm0/l;I)V

    sget-object v13, LA0/d;->e:LA0/i;

    sget-object v15, LA0/o;->a:LA0/o;

    const/16 v12, 0x8a

    int-to-float v12, v12

    invoke-static {v15, v12}, Landroidx/compose/foundation/layout/b;->e(LA0/r;F)LA0/r;

    move-result-object v12

    invoke-static {v13, v8}, LG/t;->d(LA0/e;Z)LX0/h0;

    move-result-object v13

    move-object v15, v9

    iget-wide v8, v14, Lm0/q;->T:J

    invoke-static {v8, v9}, Ljava/lang/Long;->hashCode(J)I

    move-result v8

    invoke-virtual {v14}, Lm0/q;->m()Lm0/o0;

    move-result-object v9

    invoke-static {v12, v14}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v12

    invoke-virtual {v14}, Lm0/q;->j0()V

    move-object/from16 v16, v11

    iget-boolean v11, v14, Lm0/q;->S:Z

    if-eqz v11, :cond_17

    move-object/from16 v11, v23

    invoke-virtual {v14, v11}, Lm0/q;->l(LVm/a;)V

    goto :goto_d

    :cond_17
    invoke-virtual {v14}, Lm0/q;->t0()V

    :goto_d
    invoke-static {v0, v13, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v15, v9, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object/from16 v0, v24

    move-object/from16 v13, v25

    invoke-static {v8, v14, v0, v14, v13}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    move-object/from16 v0, v26

    invoke-static {v0, v12, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    iget-object v0, v10, Lwg/F;->a:Ljava/util/List;

    iget-object v8, v10, Lwg/F;->h:Ljava/lang/Boolean;

    const/4 v9, 0x0

    invoke-static {v0, v8, v14, v9}, Lcj/l0;->l(Ljava/util/List;Ljava/lang/Boolean;Lm0/l;I)V

    const/4 v0, 0x1

    invoke-virtual {v14, v0}, Lm0/q;->q(Z)V

    invoke-static {v14, v9}, LP2/z;->O(Lm0/l;I)V

    const v0, 0x7f120705

    invoke-static {v14, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v0

    const/16 v19, 0x0

    const/16 v17, 0x0

    const/4 v15, 0x0

    move-object/from16 v18, v14

    const/4 v14, 0x0

    const/16 v20, 0x0

    const/16 v13, 0x7e

    move-object/from16 v11, v16

    const/4 v12, 0x0

    move-object/from16 v16, v0

    invoke-virtual/range {v11 .. v20}, Lg8/h0;->w(IILA0/r;LH0/w;Ljava/lang/String;Lk1/U;Lm0/l;Lv1/k;Z)V

    move-object/from16 v14, v18

    invoke-static {v14, v9}, LP2/z;->K(Lm0/l;I)V

    new-instance v0, LAg/M;

    const/4 v8, 0x0

    invoke-direct {v0, v10, v2, v5, v8}, LAg/M;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    const v8, -0xcab9836

    invoke-static {v8, v0, v14}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v17

    const/4 v15, 0x0

    const/16 v16, 0x0

    iget-object v11, v10, Lwg/F;->c:Lwg/O;

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v18, v14

    const/4 v14, 0x0

    const/high16 v19, 0x180000

    const/16 v20, 0x3e

    invoke-static/range {v11 .. v20}, Lv/j;->a(Ljava/lang/Object;LA0/r;LVm/k;LA0/i;Ljava/lang/String;LVm/k;Lu0/d;Lm0/l;II)V

    move-object/from16 v14, v18

    const/4 v8, 0x0

    invoke-static {v14, v8}, LP2/z;->Q(Lm0/l;I)V

    iget-object v0, v10, Lwg/F;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    const/16 v22, 0x1

    xor-int/lit8 v12, v0, 0x1

    new-instance v0, LAg/N;

    const/4 v8, 0x0

    invoke-direct {v0, v1, v6, v7, v8}, LAg/N;-><init>(Ljava/lang/Object;LVm/k;Ljava/lang/Object;I)V

    const v8, 0x5b6120a4

    invoke-static {v8, v0, v14}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v17

    const/4 v13, 0x0

    move-object/from16 v18, v14

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const v19, 0x180006

    const/16 v20, 0x1e

    move-object/from16 v11, v21

    invoke-static/range {v11 .. v20}, Lv/d;->b(LG/C;ZLA0/r;Lv/c0;Lv/d0;Ljava/lang/String;Lu0/d;Lm0/l;II)V

    move-object/from16 v14, v18

    const/4 v8, 0x0

    invoke-static {v14, v8}, LP2/z;->O(Lm0/l;I)V

    iget-object v0, v10, Lwg/F;->d:Lwg/v;

    if-nez v0, :cond_19

    iget-object v0, v10, Lwg/F;->e:Lwg/Q;

    if-eqz v0, :cond_18

    goto :goto_e

    :cond_18
    const/4 v12, 0x0

    goto :goto_f

    :cond_19
    :goto_e
    const/4 v12, 0x1

    :goto_f
    sget-object v17, LAg/r;->a:Lu0/d;

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/4 v13, 0x0

    move-object/from16 v18, v14

    const/4 v14, 0x0

    const/16 v20, 0x1e

    invoke-static/range {v11 .. v20}, Lv/d;->b(LG/C;ZLA0/r;Lv/c0;Lv/d0;Ljava/lang/String;Lu0/d;Lm0/l;II)V

    move-object/from16 v14, v18

    const/4 v8, 0x0

    invoke-static {v14, v8}, LP2/z;->J(Lm0/l;I)V

    new-instance v0, LAg/O;

    const/4 v8, 0x0

    invoke-direct {v0, v8, v3}, LAg/O;-><init>(ILVm/a;)V

    const v8, 0x35f6bca

    invoke-static {v8, v0, v14}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v17

    const/4 v15, 0x0

    const/16 v16, 0x0

    iget-object v11, v10, Lwg/F;->d:Lwg/v;

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v18, v14

    const/4 v14, 0x0

    const/high16 v19, 0x180000

    const/16 v20, 0x3e

    invoke-static/range {v11 .. v20}, Lv/j;->a(Ljava/lang/Object;LA0/r;LVm/k;LA0/i;Ljava/lang/String;LVm/k;Lu0/d;Lm0/l;II)V

    move-object/from16 v14, v18

    const/4 v8, 0x0

    invoke-static {v14, v8}, LP2/z;->O(Lm0/l;I)V

    new-instance v0, LAg/O;

    const/4 v8, 0x1

    invoke-direct {v0, v8, v4}, LAg/O;-><init>(ILVm/a;)V

    const v8, 0xcdc9891

    invoke-static {v8, v0, v14}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v17

    const/4 v15, 0x0

    const/16 v16, 0x0

    iget-object v11, v10, Lwg/F;->e:Lwg/Q;

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v18, v14

    const/4 v14, 0x0

    const/high16 v19, 0x180000

    const/16 v20, 0x3e

    invoke-static/range {v11 .. v20}, Lv/j;->a(Ljava/lang/Object;LA0/r;LVm/k;LA0/i;Ljava/lang/String;LVm/k;Lu0/d;Lm0/l;II)V

    move-object/from16 v14, v18

    const/4 v8, 0x0

    invoke-static {v14, v8}, LP2/z;->O(Lm0/l;I)V

    const/4 v0, 0x1

    invoke-virtual {v14, v0}, Lm0/q;->q(Z)V

    :goto_10
    invoke-virtual {v14}, Lm0/q;->u()Lm0/t0;

    move-result-object v11

    if-eqz v11, :cond_1a

    new-instance v0, LAg/K;

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move/from16 v10, p10

    invoke-direct/range {v0 .. v10}, LAg/K;-><init>(LVm/a;LVm/a;LVm/a;LVm/a;LVm/k;LVm/k;LVm/a;LVm/a;LA0/r;I)V

    iput-object v0, v11, Lm0/t0;->d:LVm/n;

    :cond_1a
    return-void
.end method

.method public static final m(LA0/o;IIILm0/l;I)V
    .locals 11

    move-object v4, p4

    check-cast v4, Lm0/q;

    const v0, -0x2a33a0f8

    invoke-virtual {v4, v0}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v4, p1}, Lm0/q;->e(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x20

    goto :goto_0

    :cond_0
    const/16 v0, 0x10

    :goto_0
    or-int v0, p5, v0

    invoke-virtual {v4, p2}, Lm0/q;->e(I)Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x100

    goto :goto_1

    :cond_1
    const/16 v1, 0x80

    :goto_1
    or-int/2addr v0, v1

    invoke-virtual {v4, p3}, Lm0/q;->e(I)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x800

    goto :goto_2

    :cond_2
    const/16 v1, 0x400

    :goto_2
    or-int/2addr v0, v1

    and-int/lit16 v0, v0, 0x491

    const/16 v1, 0x490

    if-ne v0, v1, :cond_4

    invoke-virtual {v4}, Lm0/q;->H()Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_4

    :cond_3
    invoke-virtual {v4}, Lm0/q;->Y()V

    :goto_3
    move-object v6, p0

    goto :goto_5

    :cond_4
    :goto_4
    sget-object p0, LA0/o;->a:LA0/o;

    new-instance v0, Lmg/h;

    invoke-direct {v0, p3, p2, p1}, Lmg/h;-><init>(III)V

    const v1, 0x667290d2

    invoke-static {v1, v0, v4}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v3

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v0, 0x0

    const/16 v5, 0xc00

    const/4 v6, 0x7

    invoke-static/range {v0 .. v6}, LP2/k;->o(FFZLu0/d;Lm0/l;II)V

    goto :goto_3

    :goto_5
    invoke-virtual {v4}, Lm0/q;->u()Lm0/t0;

    move-result-object p0

    if-eqz p0, :cond_5

    new-instance v5, LLh/b;

    move v7, p1

    move v8, p2

    move v9, p3

    move/from16 v10, p5

    invoke-direct/range {v5 .. v10}, LLh/b;-><init>(LA0/o;IIII)V

    iput-object v5, p0, Lm0/t0;->d:LVm/n;

    :cond_5
    return-void
.end method

.method public static final n(LVm/a;LA0/r;JJFLVm/k;Lm0/l;I)V
    .locals 16

    move-object/from16 v6, p0

    move-wide/from16 v1, p4

    move-object/from16 v8, p8

    check-cast v8, Lm0/q;

    const v0, 0x57e6ba50

    invoke-virtual {v8, v0}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v8, v6}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    const/4 v3, 0x4

    if-eqz v0, :cond_0

    move v0, v3

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int v0, p9, v0

    invoke-virtual {v8, v1, v2}, Lm0/q;->f(J)Z

    move-result v4

    const/16 v5, 0x800

    if-eqz v4, :cond_1

    move v4, v5

    goto :goto_1

    :cond_1
    const/16 v4, 0x400

    :goto_1
    or-int/2addr v0, v4

    const v4, 0x16000

    or-int/2addr v0, v4

    const v4, 0x12493

    and-int/2addr v4, v0

    const v7, 0x12492

    if-ne v4, v7, :cond_3

    invoke-virtual {v8}, Lm0/q;->H()Z

    move-result v4

    if-nez v4, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v8}, Lm0/q;->Y()V

    move-object/from16 v2, p1

    move/from16 v7, p6

    move-object v0, v8

    move-object/from16 v8, p7

    goto/16 :goto_c

    :cond_3
    :goto_2
    invoke-virtual {v8}, Lm0/q;->a0()V

    and-int/lit8 v4, p9, 0x1

    sget-object v7, Lm0/k;->a:Lm0/e;

    const/4 v9, 0x1

    const v10, -0x70001

    const/4 v11, 0x0

    if-eqz v4, :cond_5

    invoke-virtual {v8}, Lm0/q;->E()Z

    move-result v4

    if-eqz v4, :cond_4

    goto :goto_3

    :cond_4
    invoke-virtual {v8}, Lm0/q;->Y()V

    and-int/2addr v0, v10

    move-wide/from16 v14, p2

    move/from16 v4, p6

    move-object/from16 v12, p7

    goto :goto_7

    :cond_5
    :goto_3
    const/4 v4, 0x3

    int-to-float v4, v4

    const v12, 0x1bf720e2

    invoke-virtual {v8, v12}, Lm0/q;->f0(I)V

    and-int/lit8 v12, v0, 0xe

    if-ne v12, v3, :cond_6

    move v12, v9

    goto :goto_4

    :cond_6
    move v12, v11

    :goto_4
    invoke-virtual {v8}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v13

    if-nez v12, :cond_8

    if-ne v13, v7, :cond_7

    goto :goto_5

    :cond_7
    move-wide/from16 v14, p2

    goto :goto_6

    :cond_8
    :goto_5
    new-instance v13, LFg/e;

    const/4 v12, 0x5

    move-wide/from16 v14, p2

    invoke-direct {v13, v14, v15, v6, v12}, LFg/e;-><init>(JLjava/lang/Object;I)V

    invoke-virtual {v8, v13}, Lm0/q;->q0(Ljava/lang/Object;)V

    :goto_6
    move-object v12, v13

    check-cast v12, LVm/k;

    invoke-virtual {v8, v11}, Lm0/q;->q(Z)V

    and-int/2addr v0, v10

    :goto_7
    invoke-virtual {v8}, Lm0/q;->r()V

    const v10, 0x1bf751f3

    invoke-virtual {v8, v10}, Lm0/q;->f0(I)V

    and-int/lit16 v10, v0, 0x1c00

    xor-int/lit16 v10, v10, 0xc00

    if-le v10, v5, :cond_9

    invoke-virtual {v8, v1, v2}, Lm0/q;->f(J)Z

    move-result v10

    if-nez v10, :cond_a

    :cond_9
    and-int/lit16 v10, v0, 0xc00

    if-ne v10, v5, :cond_b

    :cond_a
    move v5, v9

    goto :goto_8

    :cond_b
    move v5, v11

    :goto_8
    and-int/lit8 v0, v0, 0xe

    if-ne v0, v3, :cond_c

    goto :goto_9

    :cond_c
    move v9, v11

    :goto_9
    or-int v0, v5, v9

    invoke-virtual {v8, v12}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v3

    or-int/2addr v0, v3

    invoke-virtual {v8}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v3

    if-nez v0, :cond_e

    if-ne v3, v7, :cond_d

    goto :goto_a

    :cond_d
    move-object v0, v3

    move v3, v4

    move-object v7, v12

    goto :goto_b

    :cond_e
    :goto_a
    new-instance v0, Lmg/f;

    move v3, v4

    move-object v7, v12

    move-wide v4, v14

    invoke-direct/range {v0 .. v7}, Lmg/f;-><init>(JFJLVm/a;LVm/k;)V

    invoke-virtual {v8, v0}, Lm0/q;->q0(Ljava/lang/Object;)V

    :goto_b
    check-cast v0, LVm/k;

    invoke-virtual {v8, v11}, Lm0/q;->q(Z)V

    const/4 v1, 0x6

    move-object/from16 v2, p1

    invoke-static {v2, v0, v8, v1}, Ly/x;->b(LA0/r;LVm/k;Lm0/l;I)V

    move-object v0, v8

    move-object v8, v7

    move v7, v3

    :goto_c
    invoke-virtual {v0}, Lm0/q;->u()Lm0/t0;

    move-result-object v10

    if-eqz v10, :cond_f

    new-instance v0, LNg/q;

    move-object/from16 v1, p0

    move-wide/from16 v3, p2

    move-wide/from16 v5, p4

    move/from16 v9, p9

    invoke-direct/range {v0 .. v9}, LNg/q;-><init>(LVm/a;LA0/r;JJFLVm/k;I)V

    iput-object v0, v10, Lm0/t0;->d:LVm/n;

    :cond_f
    return-void
.end method

.method public static final o(LG/C;Ljava/util/Set;Ljava/lang/String;ZLVm/a;LVm/k;LVm/k;Lm0/l;I)V
    .locals 29

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v0, p3

    move-object/from16 v1, p4

    move-object/from16 v4, p6

    move/from16 v5, p8

    move-object/from16 v6, p7

    check-cast v6, Lm0/q;

    const v7, -0x4b49b8ea

    invoke-virtual {v6, v7}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v7, v5, 0x6

    if-nez v7, :cond_1

    move-object/from16 v7, p0

    invoke-virtual {v6, v7}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    const/4 v8, 0x4

    goto :goto_0

    :cond_0
    const/4 v8, 0x2

    :goto_0
    or-int/2addr v8, v5

    goto :goto_1

    :cond_1
    move-object/from16 v7, p0

    move v8, v5

    :goto_1
    and-int/lit8 v9, v5, 0x30

    if-nez v9, :cond_3

    invoke-virtual {v6, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    const/16 v9, 0x20

    goto :goto_2

    :cond_2
    const/16 v9, 0x10

    :goto_2
    or-int/2addr v8, v9

    :cond_3
    and-int/lit16 v9, v5, 0x180

    if-nez v9, :cond_5

    invoke-virtual {v6, v3}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    const/16 v9, 0x100

    goto :goto_3

    :cond_4
    const/16 v9, 0x80

    :goto_3
    or-int/2addr v8, v9

    :cond_5
    and-int/lit16 v9, v5, 0xc00

    if-nez v9, :cond_7

    invoke-virtual {v6, v0}, Lm0/q;->h(Z)Z

    move-result v9

    if-eqz v9, :cond_6

    const/16 v9, 0x800

    goto :goto_4

    :cond_6
    const/16 v9, 0x400

    :goto_4
    or-int/2addr v8, v9

    :cond_7
    and-int/lit16 v9, v5, 0x6000

    const/16 v11, 0x4000

    if-nez v9, :cond_9

    invoke-virtual {v6, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    move v9, v11

    goto :goto_5

    :cond_8
    const/16 v9, 0x2000

    :goto_5
    or-int/2addr v8, v9

    :cond_9
    const/high16 v9, 0x30000

    and-int/2addr v9, v5

    if-nez v9, :cond_b

    move-object/from16 v9, p5

    invoke-virtual {v6, v9}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_a

    const/high16 v12, 0x20000

    goto :goto_6

    :cond_a
    const/high16 v12, 0x10000

    :goto_6
    or-int/2addr v8, v12

    goto :goto_7

    :cond_b
    move-object/from16 v9, p5

    :goto_7
    const/high16 v12, 0x180000

    and-int/2addr v12, v5

    if-nez v12, :cond_d

    invoke-virtual {v6, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_c

    const/high16 v12, 0x100000

    goto :goto_8

    :cond_c
    const/high16 v12, 0x80000

    :goto_8
    or-int/2addr v8, v12

    :cond_d
    const v12, 0x92493

    and-int/2addr v12, v8

    const v14, 0x92492

    if-ne v12, v14, :cond_f

    invoke-virtual {v6}, Lm0/q;->H()Z

    move-result v12

    if-nez v12, :cond_e

    goto :goto_9

    :cond_e
    invoke-virtual {v6}, Lm0/q;->Y()V

    move-object/from16 v17, v6

    goto/16 :goto_12

    :cond_f
    :goto_9
    sget-object v12, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->b:Lm0/c1;

    invoke-virtual {v6, v12}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/content/Context;

    sget-object v14, LHm/B;->a:LHm/B;

    const v15, -0x2f3d45fe

    invoke-virtual {v6, v15}, Lm0/q;->f0(I)V

    const p7, 0xe000

    and-int v15, v8, p7

    const/16 v16, 0x1

    if-ne v15, v11, :cond_10

    move/from16 v11, v16

    goto :goto_a

    :cond_10
    const/4 v11, 0x0

    :goto_a
    invoke-virtual {v6}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v15

    sget-object v13, Lm0/k;->a:Lm0/e;

    const/4 v10, 0x0

    if-nez v11, :cond_11

    if-ne v15, v13, :cond_12

    :cond_11
    new-instance v15, LGh/N;

    invoke-direct {v15, v1, v10}, LGh/N;-><init>(LVm/a;LLm/c;)V

    invoke-virtual {v6, v15}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_12
    check-cast v15, LVm/n;

    const/4 v11, 0x0

    invoke-virtual {v6, v11}, Lm0/q;->q(Z)V

    invoke-static {v15, v14, v6}, Lm0/r;->f(LVm/n;Ljava/lang/Object;Lm0/l;)V

    if-eqz v0, :cond_13

    sget-object v11, Lcom/eightsleep/data_core/enums/purchase/ProductType;->COVER:Lcom/eightsleep/data_core/enums/purchase/ProductType;

    invoke-virtual {v11}, Lcom/eightsleep/data_core/enums/purchase/ProductType;->getLabelResId()I

    move-result v11

    goto :goto_b

    :cond_13
    const v11, 0x7f121104

    :goto_b
    if-eqz v0, :cond_14

    const v14, 0x7f120935

    goto :goto_c

    :cond_14
    const v14, 0x7f120922

    :goto_c
    const v15, -0x2f3d09dc

    invoke-virtual {v6, v15}, Lm0/q;->f0(I)V

    move-object v15, v2

    check-cast v15, Ljava/lang/Iterable;

    new-instance v5, Ljava/util/ArrayList;

    const/16 v10, 0xa

    invoke-static {v15, v10}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v10

    invoke-direct {v5, v10}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v15}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_d
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_16

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, LIh/i;

    new-instance v21, LEh/c;

    iget-object v0, v15, LIh/i;->a:Ljava/lang/String;

    move-object/from16 v22, v0

    iget-object v0, v15, LIh/i;->c:Ljava/util/Set;

    invoke-static {v0, v6}, LP2/n;->U(Ljava/util/Set;Lm0/l;)Ljava/lang/String;

    move-result-object v24

    iget-object v0, v15, LIh/i;->e:LYa/H;

    if-eqz v0, :cond_15

    invoke-virtual {v0, v12}, LYa/H;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    move-object/from16 v25, v0

    goto :goto_e

    :cond_15
    const/16 v25, 0x0

    :goto_e
    iget-boolean v0, v15, LIh/i;->d:Z

    const/16 v27, 0x0

    iget-object v15, v15, LIh/i;->b:Ljava/lang/String;

    const/16 v28, 0x20

    move/from16 v26, v0

    move-object/from16 v23, v15

    invoke-direct/range {v21 .. v28}, LEh/c;-><init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Integer;I)V

    move-object/from16 v0, v21

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move/from16 v0, p3

    goto :goto_d

    :cond_16
    const/4 v0, 0x0

    invoke-virtual {v6, v0}, Lm0/q;->q(Z)V

    if-eqz v3, :cond_17

    move/from16 v12, v16

    goto :goto_f

    :cond_17
    const/4 v12, 0x0

    :goto_f
    const v0, -0x2f3cbd4a

    invoke-virtual {v6, v0}, Lm0/q;->f0(I)V

    const/high16 v0, 0x380000

    and-int/2addr v0, v8

    const/high16 v10, 0x100000

    if-ne v0, v10, :cond_18

    move/from16 v0, v16

    goto :goto_10

    :cond_18
    const/4 v0, 0x0

    :goto_10
    and-int/lit16 v10, v8, 0x380

    const/16 v15, 0x100

    if-ne v10, v15, :cond_19

    goto :goto_11

    :cond_19
    const/16 v16, 0x0

    :goto_11
    or-int v0, v0, v16

    invoke-virtual {v6}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v10

    if-nez v0, :cond_1a

    if-ne v10, v13, :cond_1b

    :cond_1a
    new-instance v10, LBg/f0;

    const/4 v0, 0x1

    invoke-direct {v10, v0, v4, v3}, LBg/f0;-><init>(ILVm/k;Ljava/lang/String;)V

    invoke-virtual {v6, v10}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_1b
    check-cast v10, LVm/a;

    const/4 v0, 0x0

    invoke-virtual {v6, v0}, Lm0/q;->q(Z)V

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    and-int/lit8 v11, v8, 0xe

    shl-int/lit8 v13, v8, 0x3

    and-int/lit16 v13, v13, 0x1c00

    or-int/2addr v11, v13

    shr-int/lit8 v8, v8, 0x3

    and-int v8, v8, p7

    or-int v18, v11, v8

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object v8, v10

    const/4 v10, 0x0

    const v11, 0x7f12035b

    const/4 v13, 0x0

    move v4, v14

    const/4 v14, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x1e40

    move-object/from16 v17, v6

    move-object v6, v3

    move-object v3, v7

    move-object v7, v9

    move-object v9, v0

    invoke-static/range {v3 .. v20}, LEh/f;->a(LG/C;ILjava/util/List;Ljava/lang/Object;LVm/k;LVm/a;Ljava/lang/Integer;Ljava/lang/Integer;IZLjava/lang/Integer;LVm/a;Ljava/lang/String;LVm/o;Lm0/l;III)V

    :goto_12
    invoke-virtual/range {v17 .. v17}, Lm0/q;->u()Lm0/t0;

    move-result-object v9

    if-eqz v9, :cond_1c

    new-instance v0, LAh/Z;

    move-object/from16 v3, p2

    move/from16 v4, p3

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move/from16 v8, p8

    move-object v5, v1

    move-object/from16 v1, p0

    invoke-direct/range {v0 .. v8}, LAh/Z;-><init>(LG/C;Ljava/util/Set;Ljava/lang/String;ZLVm/a;LVm/k;LVm/k;I)V

    iput-object v0, v9, Lm0/t0;->d:LVm/n;

    :cond_1c
    return-void
.end method

.method public static final p(ILA0/r;LVm/k;LVm/k;Lcom/eightsleep/presentation_onboarding/feature/productidentification/viewmodel/ProductIdentificationViewModel;Lm0/l;)V
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

    const v0, -0x1759ff4c

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
    sget-object v8, LGh/s;->a:Lu0/d;

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

    const-string v7, "onboarding_manual_product_identification_option_target_device_set"

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

    const/16 v6, 0x11

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

.method public static final q(Lc8/e;LVm/a;Lm0/l;I)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v12, p1

    const-string v1, "onStopAudioClicked"

    invoke-static {v12, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v13, p2

    check-cast v13, Lm0/q;

    const v1, -0x5ddd4abe

    invoke-virtual {v13, v1}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v13, v0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x4

    goto :goto_0

    :cond_0
    const/4 v1, 0x2

    :goto_0
    or-int v1, p3, v1

    invoke-virtual {v13, v12}, Lm0/q;->i(Ljava/lang/Object;)Z

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

    if-ne v2, v3, :cond_2

    invoke-virtual {v13}, Lm0/q;->H()Z

    move-result v2

    if-nez v2, :cond_3

    :cond_2
    move v2, v1

    goto :goto_2

    :cond_3
    invoke-virtual {v13}, Lm0/q;->Y()V

    goto :goto_4

    :goto_2
    sget-object v1, LOg/e;->c:LOg/e;

    const v3, 0x7f121691

    invoke-static {v13, v3}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v4

    const/4 v3, 0x0

    if-eqz v0, :cond_4

    sget-object v5, Lcom/eightsleep/presentation_home/enums/ControlsLoadingKey;->STOP_AUDIO:Lcom/eightsleep/presentation_home/enums/ControlsLoadingKey;

    invoke-interface {v0, v5}, Lc8/e;->matches(Lc8/e;)Z

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_4

    move v9, v6

    goto :goto_3

    :cond_4
    move v9, v3

    :goto_3
    and-int/lit8 v15, v2, 0x70

    const/4 v11, 0x0

    const/4 v14, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v10, 0x0

    const/16 v16, 0x6fb

    invoke-virtual/range {v1 .. v16}, LOg/e;->h(LA0/r;Lkm/o;Ljava/lang/String;Ljava/lang/Integer;Lhh/n;Lhh/d;ZZLhh/e;LJg/b;LVm/a;Lm0/l;III)V

    :goto_4
    invoke-virtual {v13}, Lm0/q;->u()Lm0/t0;

    move-result-object v1

    if-eqz v1, :cond_5

    new-instance v2, LPf/c;

    const/4 v3, 0x6

    move/from16 v4, p3

    invoke-direct {v2, v0, v12, v4, v3}, LPf/c;-><init>(Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object v2, v1, Lm0/t0;->d:LVm/n;

    :cond_5
    return-void
.end method

.method public static final r(LHm/k;Lm0/Z;LVm/a;LVm/n;Lm0/l;I)V
    .locals 26

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    const-string v0, "showBackButton"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v12, p4

    check-cast v12, Lm0/q;

    const v0, 0x6b098aa6

    invoke-virtual {v12, v0}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v12, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int v0, p5, v0

    invoke-virtual {v12, v2}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    const/16 v5, 0x20

    goto :goto_1

    :cond_1
    const/16 v5, 0x10

    :goto_1
    or-int/2addr v0, v5

    invoke-virtual {v12, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    const/16 v5, 0x4000

    goto :goto_2

    :cond_2
    const/16 v5, 0x2000

    :goto_2
    or-int/2addr v0, v5

    invoke-virtual {v12, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    const/high16 v5, 0x20000

    goto :goto_3

    :cond_3
    const/high16 v5, 0x10000

    :goto_3
    or-int/2addr v0, v5

    const v5, 0x12493

    and-int/2addr v0, v5

    const v5, 0x12492

    if-ne v0, v5, :cond_5

    invoke-virtual {v12}, Lm0/q;->H()Z

    move-result v0

    if-nez v0, :cond_4

    goto :goto_4

    :cond_4
    invoke-virtual {v12}, Lm0/q;->Y()V

    goto :goto_5

    :cond_5
    :goto_4
    sget-wide v14, LH0/w;->g:J

    invoke-static {v12}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v0

    iget-object v0, v0, Lhh/h;->k:Lhh/v;

    iget-wide v5, v0, Lhh/v;->a:J

    invoke-static {v12}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v0

    iget-object v0, v0, Lhh/h;->k:Lhh/v;

    iget-wide v7, v0, Lhh/v;->a:J

    invoke-static {v12}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v0

    iget-object v0, v0, Lhh/h;->k:Lhh/v;

    iget-wide v9, v0, Lhh/v;->a:J

    new-instance v11, Lj0/G3;

    move-wide/from16 v16, v14

    move-wide/from16 v24, v7

    move-wide/from16 v18, v5

    move-wide/from16 v20, v7

    move-wide/from16 v22, v9

    move-object v13, v11

    invoke-direct/range {v13 .. v25}, Lj0/G3;-><init>(JJJJJJ)V

    new-instance v0, LAe/V;

    const/16 v5, 0x12

    invoke-direct {v0, v1, v5}, LAe/V;-><init>(Ljava/lang/Object;I)V

    const v5, -0x4ed39e9f

    invoke-static {v5, v0, v12}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v5

    new-instance v0, LSf/I;

    invoke-direct {v0, v3, v2}, LSf/I;-><init>(LVm/a;Lm0/Z;)V

    const v6, 0x3e1b429f

    invoke-static {v6, v0, v12}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v7

    new-instance v0, Lg8/c0;

    const/4 v6, 0x0

    invoke-direct {v0, v6, v4}, Lg8/c0;-><init>(ILVm/n;)V

    const v6, 0x51c94096

    invoke-static {v6, v0, v12}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v8

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v6, 0x0

    const/16 v13, 0xd86

    const/16 v14, 0xb2

    invoke-static/range {v5 .. v14}, Lj0/f;->d(Lu0/d;LA0/r;Lu0/d;Lu0/d;FLG/g1;Lj0/G3;Lm0/l;II)V

    :goto_5
    invoke-virtual {v12}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_6

    new-instance v0, LXe/j1;

    const/4 v6, 0x5

    move/from16 v5, p5

    invoke-direct/range {v0 .. v6}, LXe/j1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_6
    return-void
.end method

.method public static final s(LA0/r;Ljava/lang/String;Ljava/lang/String;Lfh/h;Lcom/eightsleep/data_core/enums/ai_insights/AiInsightSentiment;Ljava/util/List;LFf/r;Lm0/l;I)V
    .locals 12

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    move-object/from16 v9, p6

    move/from16 v10, p8

    const-string v0, "title"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "sentiment"

    invoke-static {v7, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v5, p7

    check-cast v5, Lm0/q;

    const v0, 0x13aeafa3

    invoke-virtual {v5, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, v10, 0x6

    if-nez v0, :cond_1

    invoke-virtual {v5, p0}, Lm0/q;->g(Ljava/lang/Object;)Z

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
    and-int/lit8 v2, v10, 0x30

    if-nez v2, :cond_3

    invoke-virtual {v5, p1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/16 v2, 0x20

    goto :goto_2

    :cond_2
    const/16 v2, 0x10

    :goto_2
    or-int/2addr v0, v2

    :cond_3
    and-int/lit16 v2, v10, 0x180

    if-nez v2, :cond_5

    invoke-virtual {v5, p2}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    const/16 v2, 0x100

    goto :goto_3

    :cond_4
    const/16 v2, 0x80

    :goto_3
    or-int/2addr v0, v2

    :cond_5
    and-int/lit16 v2, v10, 0xc00

    if-nez v2, :cond_7

    invoke-virtual {v5, p3}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    const/16 v3, 0x800

    goto :goto_4

    :cond_6
    const/16 v3, 0x400

    :goto_4
    or-int/2addr v0, v3

    :cond_7
    and-int/lit16 v3, v10, 0x6000

    if-nez v3, :cond_9

    invoke-virtual {v5, v7}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    const/16 v3, 0x4000

    goto :goto_5

    :cond_8
    const/16 v3, 0x2000

    :goto_5
    or-int/2addr v0, v3

    :cond_9
    const/high16 v3, 0x30000

    and-int/2addr v3, v10

    if-nez v3, :cond_b

    invoke-virtual {v5, v8}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    const/high16 v3, 0x20000

    goto :goto_6

    :cond_a
    const/high16 v3, 0x10000

    :goto_6
    or-int/2addr v0, v3

    :cond_b
    const/high16 v3, 0x180000

    and-int/2addr v3, v10

    if-nez v3, :cond_d

    invoke-virtual {v5, v9}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    const/high16 v3, 0x100000

    goto :goto_7

    :cond_c
    const/high16 v3, 0x80000

    :goto_7
    or-int/2addr v0, v3

    :cond_d
    const v3, 0x92493

    and-int/2addr v3, v0

    const v4, 0x92492

    if-ne v3, v4, :cond_f

    invoke-virtual {v5}, Lm0/q;->H()Z

    move-result v3

    if-nez v3, :cond_e

    goto :goto_8

    :cond_e
    invoke-virtual {v5}, Lm0/q;->Y()V

    goto :goto_9

    :cond_f
    :goto_8
    new-instance v3, LAe/q;

    const/16 v4, 0x1c

    invoke-direct {v3, v7, v8, v9, v4}, LAe/q;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    const v4, 0x68c7dc8

    invoke-static {v4, v3, v5}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v4

    shr-int/lit8 v3, v0, 0x3

    and-int/lit8 v6, v3, 0xe

    or-int/lit16 v6, v6, 0x6000

    and-int/lit8 v11, v3, 0x70

    or-int/2addr v6, v11

    and-int/lit16 v3, v3, 0x380

    or-int/2addr v3, v6

    shl-int/lit8 v0, v0, 0x9

    and-int/lit16 v0, v0, 0x1c00

    or-int v6, v3, v0

    move-object v3, p0

    move-object v0, p1

    move-object v1, p2

    move-object v2, p3

    invoke-static/range {v0 .. v6}, Lf5/e;->l(Ljava/lang/String;Ljava/lang/String;Lfh/h;LA0/r;Lu0/d;Lm0/l;I)V

    :goto_9
    invoke-virtual {v5}, Lm0/q;->u()Lm0/t0;

    move-result-object v11

    if-eqz v11, :cond_10

    new-instance v0, LEi/e;

    const/4 v9, 0x3

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, v7

    move-object v6, v8

    move v8, v10

    move-object/from16 v7, p6

    invoke-direct/range {v0 .. v9}, LEi/e;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object v0, v11, Lm0/t0;->d:LVm/n;

    :cond_10
    return-void
.end method

.method public static final t(Ljava/lang/String;ZZLVm/a;LVm/a;LVm/a;Lm0/l;I)V
    .locals 12

    move-object/from16 v5, p4

    move-object/from16 v7, p5

    const-string v0, "onChangeUpcomingClick"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onChangeAllFutureClick"

    invoke-static {v5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onDismiss"

    invoke-static {v7, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v8, p6

    check-cast v8, Lm0/q;

    const v0, 0x3a3018d0

    invoke-virtual {v8, v0}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v8, p0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int v0, p7, v0

    invoke-virtual {v8, p1}, Lm0/q;->h(Z)Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x20

    goto :goto_1

    :cond_1
    const/16 v1, 0x10

    :goto_1
    or-int/2addr v0, v1

    invoke-virtual {v8, p2}, Lm0/q;->h(Z)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x100

    goto :goto_2

    :cond_2
    const/16 v1, 0x80

    :goto_2
    or-int/2addr v0, v1

    invoke-virtual {v8, p3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/16 v1, 0x800

    goto :goto_3

    :cond_3
    const/16 v1, 0x400

    :goto_3
    or-int/2addr v0, v1

    invoke-virtual {v8, v5}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const/16 v1, 0x4000

    goto :goto_4

    :cond_4
    const/16 v1, 0x2000

    :goto_4
    or-int/2addr v0, v1

    invoke-virtual {v8, v7}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    const/high16 v1, 0x20000

    goto :goto_5

    :cond_5
    const/high16 v1, 0x10000

    :goto_5
    or-int v9, v0, v1

    const v0, 0x12493

    and-int/2addr v0, v9

    const v1, 0x12492

    if-ne v0, v1, :cond_7

    invoke-virtual {v8}, Lm0/q;->H()Z

    move-result v0

    if-nez v0, :cond_6

    goto :goto_6

    :cond_6
    invoke-virtual {v8}, Lm0/q;->Y()V

    goto :goto_7

    :cond_7
    :goto_6
    const v0, 0x7f12185a

    invoke-static {v8, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v10

    const v0, 0x7f121857

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1, v8}, LP2/j;->H(I[Ljava/lang/Object;Lm0/l;)Ljava/lang/String;

    move-result-object v11

    new-instance v0, LXg/e;

    const v1, 0x7f121858

    invoke-static {v8, v1}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f121859

    invoke-static {v8, v2}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v2

    move v3, p1

    move v4, p2

    move-object v6, v5

    move-object v5, p3

    invoke-direct/range {v0 .. v6}, LXg/e;-><init>(Ljava/lang/String;Ljava/lang/String;ZZLVm/a;LVm/a;)V

    shr-int/lit8 v1, v9, 0xc

    and-int/lit8 v1, v1, 0x70

    const v2, 0x180006

    or-int v9, v1, v2

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v7, v0

    const/4 v0, 0x1

    const/4 v4, 0x0

    move-object v2, v10

    const/16 v10, 0x30

    move-object/from16 v1, p5

    move-object v3, v11

    invoke-static/range {v0 .. v10}, LP2/H;->i(ZLVm/a;Ljava/lang/String;Ljava/lang/String;ZZZLXg/f;Lm0/l;II)V

    :goto_7
    invoke-virtual {v8}, Lm0/q;->u()Lm0/t0;

    move-result-object v9

    if-eqz v9, :cond_8

    new-instance v0, Lue/o;

    const/4 v8, 0x1

    move-object v1, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move/from16 v7, p7

    invoke-direct/range {v0 .. v8}, Lue/o;-><init>(Ljava/lang/String;ZZLVm/a;LVm/a;LVm/a;II)V

    iput-object v0, v9, Lm0/t0;->d:LVm/n;

    :cond_8
    return-void
.end method

.method public static final u(FF)J
    .locals 4

    invoke-static {p0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p0

    int-to-long v0, p0

    invoke-static {p1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p0

    int-to-long p0, p0

    const/16 v2, 0x20

    shl-long/2addr v0, v2

    const-wide v2, 0xffffffffL

    and-long/2addr p0, v2

    or-long/2addr p0, v0

    return-wide p0
.end method

.method public static final synthetic v(Ljava/lang/String;Lm0/l;)V
    .locals 1

    const/4 v0, 0x6

    invoke-static {p0, p1, v0}, LP2/n;->f(Ljava/lang/String;Lm0/l;I)V

    return-void
.end method

.method public static final w(Lsc/A;)Lsc/A;
    .locals 12

    const-string v0, "category"

    iget-object v2, p0, Lsc/A;->a:Ljava/lang/String;

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v8, p0, Lsc/A;->g:Ljava/util/List;

    const-string v0, "doses"

    invoke-static {v8, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lsc/A;

    iget-object v9, p0, Lsc/A;->h:Ljava/lang/String;

    iget-object v10, p0, Lsc/A;->i:Ljava/time/LocalDate;

    const/4 v3, 0x0

    const/4 v4, 0x0

    iget-object v5, p0, Lsc/A;->d:Ljava/lang/String;

    iget-object v6, p0, Lsc/A;->e:Ljava/lang/String;

    iget-object v7, p0, Lsc/A;->f:Ljava/lang/String;

    const/4 v11, 0x0

    invoke-direct/range {v1 .. v11}, Lsc/A;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/time/LocalDate;Ljava/time/LocalDate;)V

    return-object v1
.end method

.method public static final x(Lcom/eightsleep/data_metrics/data/model/MenopausePromptResponse;)Ljava/time/LocalDate;
    .locals 2

    invoke-virtual {p0}, Lcom/eightsleep/data_metrics/data/model/MenopausePromptResponse;->getAnsweredAt()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/eightsleep/data_metrics/data/model/MenopausePromptResponse;->getDismissedAt()Ljava/lang/String;

    move-result-object p0

    filled-new-array {v0, p0}, [Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, LIm/n;->h0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, LP2/n;->e0(Ljava/lang/String;)Ljava/time/LocalDate;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-static {v0}, LIm/r;->n1(Ljava/util/List;)Ljava/lang/Comparable;

    move-result-object p0

    check-cast p0, Ljava/time/LocalDate;

    return-object p0
.end method

.method public static final y(Lsc/q;)Lcom/eightsleep/data_metrics/data/model/MenopauseProfileBody;
    .locals 7

    new-instance v0, Lcom/eightsleep/data_metrics/data/model/MenopauseProfileBody;

    iget-object v3, p0, Lsc/q;->c:Ljava/lang/String;

    iget-object v4, p0, Lsc/q;->d:Ljava/lang/String;

    iget-object v1, p0, Lsc/q;->a:Ljava/lang/String;

    iget-object v2, p0, Lsc/q;->b:Ljava/time/LocalDate;

    iget-object v5, p0, Lsc/q;->e:Ljava/lang/String;

    iget-object v6, p0, Lsc/q;->f:Ljava/lang/String;

    invoke-direct/range {v0 .. v6}, Lcom/eightsleep/data_metrics/data/model/MenopauseProfileBody;-><init>(Ljava/lang/String;Ljava/time/LocalDate;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static final z(Lsc/A;)Lcom/eightsleep/data_metrics/data/model/MenopauseTreatmentBody;
    .locals 14

    iget-object v3, p0, Lsc/A;->a:Ljava/lang/String;

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lsc/A;->g:Ljava/util/List;

    const/16 v2, 0xa

    invoke-static {v1, v2}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lsc/e;

    new-instance v4, Lcom/eightsleep/data_metrics/data/model/MenopauseDoseBody;

    iget-object v5, v2, Lsc/e;->a:Ljava/lang/String;

    iget-wide v6, v2, Lsc/e;->b:D

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    iget-object v2, v2, Lsc/e;->c:Ljava/lang/String;

    invoke-direct {v4, v5, v6, v2}, Lcom/eightsleep/data_metrics/data/model/MenopauseDoseBody;-><init>(Ljava/lang/String;Ljava/lang/Double;Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    :goto_1
    move-object v7, v0

    goto :goto_2

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :goto_2
    new-instance v0, Lcom/eightsleep/data_metrics/data/model/MenopauseTreatmentBody;

    const/16 v12, 0x603

    const/4 v13, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object v4, p0, Lsc/A;->d:Ljava/lang/String;

    iget-object v5, p0, Lsc/A;->e:Ljava/lang/String;

    iget-object v6, p0, Lsc/A;->f:Ljava/lang/String;

    iget-object v8, p0, Lsc/A;->h:Ljava/lang/String;

    iget-object v9, p0, Lsc/A;->i:Ljava/time/LocalDate;

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v0 .. v13}, Lcom/eightsleep/data_metrics/data/model/MenopauseTreatmentBody;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/time/LocalDate;Ljava/time/LocalDate;Ljava/lang/Boolean;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0
.end method
