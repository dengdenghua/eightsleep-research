.class public final Lgc/j;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Lcom/eightsleep/data_jetlag/enums/TravelDirection;

.field public final e:Z

.field public final f:Ljava/time/Instant;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/time/LocalDate;

.field public final i:Ljava/time/LocalDate;

.field public final j:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/TravelDirection;ZLjava/time/Instant;Ljava/lang/String;Ljava/time/LocalDate;Ljava/time/LocalDate;Ljava/util/ArrayList;)V
    .locals 1

    const-string v0, "id"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "userId"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "tripId"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "direction"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "createdAt"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "status"

    invoke-static {p7, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "startDate"

    invoke-static {p8, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "endDate"

    invoke-static {p9, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgc/j;->a:Ljava/lang/String;

    iput-object p2, p0, Lgc/j;->b:Ljava/lang/String;

    iput-object p3, p0, Lgc/j;->c:Ljava/lang/String;

    iput-object p4, p0, Lgc/j;->d:Lcom/eightsleep/data_jetlag/enums/TravelDirection;

    iput-boolean p5, p0, Lgc/j;->e:Z

    iput-object p6, p0, Lgc/j;->f:Ljava/time/Instant;

    iput-object p7, p0, Lgc/j;->g:Ljava/lang/String;

    iput-object p8, p0, Lgc/j;->h:Ljava/time/LocalDate;

    iput-object p9, p0, Lgc/j;->i:Ljava/time/LocalDate;

    iput-object p10, p0, Lgc/j;->j:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final a(LGa/f;)Lgc/c;
    .locals 25

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, "displaySettings"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v9, LGa/s;

    iget-object v1, v1, LGa/f;->d:Lcom/eightsleep/data_core/enums/ClockSystem;

    iget-object v2, v0, Lgc/j;->f:Ljava/time/Instant;

    invoke-direct {v9, v2, v1}, LGa/s;-><init>(Ljava/time/Instant;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    new-instance v13, Ljava/util/ArrayList;

    iget-object v2, v0, Lgc/j;->j:Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-static {v2, v3}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v13, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lgc/k;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v14, Lgc/e;

    new-instance v4, LGa/s;

    iget-object v5, v3, Lgc/k;->f:Ljava/time/Instant;

    invoke-direct {v4, v5, v1}, LGa/s;-><init>(Ljava/time/Instant;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    iget-object v5, v3, Lgc/k;->i:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    iget-object v6, v3, Lgc/k;->j:Lgc/d;

    iget-object v15, v3, Lgc/k;->a:Ljava/lang/String;

    iget-object v7, v3, Lgc/k;->b:Ljava/lang/String;

    iget-object v8, v3, Lgc/k;->c:Ljava/lang/String;

    iget-object v10, v3, Lgc/k;->d:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    iget-object v11, v3, Lgc/k;->e:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    iget-object v12, v3, Lgc/k;->g:Ljava/lang/String;

    iget-object v3, v3, Lgc/k;->h:Ljava/lang/String;

    move-object/from16 v22, v3

    move-object/from16 v20, v4

    move-object/from16 v23, v5

    move-object/from16 v24, v6

    move-object/from16 v16, v7

    move-object/from16 v17, v8

    move-object/from16 v18, v10

    move-object/from16 v19, v11

    move-object/from16 v21, v12

    invoke-direct/range {v14 .. v24}, Lgc/e;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;LGa/s;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;Lgc/d;)V

    invoke-virtual {v13, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    new-instance v3, Lgc/c;

    iget-object v11, v0, Lgc/j;->h:Ljava/time/LocalDate;

    iget-object v12, v0, Lgc/j;->i:Ljava/time/LocalDate;

    iget-object v4, v0, Lgc/j;->a:Ljava/lang/String;

    iget-object v5, v0, Lgc/j;->b:Ljava/lang/String;

    iget-object v6, v0, Lgc/j;->c:Ljava/lang/String;

    iget-object v7, v0, Lgc/j;->d:Lcom/eightsleep/data_jetlag/enums/TravelDirection;

    iget-boolean v8, v0, Lgc/j;->e:Z

    iget-object v10, v0, Lgc/j;->g:Ljava/lang/String;

    invoke-direct/range {v3 .. v13}, Lgc/c;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/TravelDirection;ZLGa/s;Ljava/lang/String;Ljava/time/LocalDate;Ljava/time/LocalDate;Ljava/util/ArrayList;)V

    return-object v3
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 2

    if-ne p0, p1, :cond_0

    goto/16 :goto_1

    :cond_0
    instance-of v0, p1, Lgc/j;

    if-nez v0, :cond_1

    goto/16 :goto_0

    :cond_1
    check-cast p1, Lgc/j;

    iget-object v0, p1, Lgc/j;->a:Ljava/lang/String;

    iget-object v1, p0, Lgc/j;->a:Ljava/lang/String;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lgc/j;->b:Ljava/lang/String;

    iget-object v1, p1, Lgc/j;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lgc/j;->c:Ljava/lang/String;

    iget-object v1, p1, Lgc/j;->c:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lgc/j;->d:Lcom/eightsleep/data_jetlag/enums/TravelDirection;

    iget-object v1, p1, Lgc/j;->d:Lcom/eightsleep/data_jetlag/enums/TravelDirection;

    if-eq v0, v1, :cond_5

    goto :goto_0

    :cond_5
    iget-boolean v0, p0, Lgc/j;->e:Z

    iget-boolean v1, p1, Lgc/j;->e:Z

    if-eq v0, v1, :cond_6

    goto :goto_0

    :cond_6
    iget-object v0, p0, Lgc/j;->f:Ljava/time/Instant;

    iget-object v1, p1, Lgc/j;->f:Ljava/time/Instant;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    goto :goto_0

    :cond_7
    iget-object v0, p0, Lgc/j;->g:Ljava/lang/String;

    iget-object v1, p1, Lgc/j;->g:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    goto :goto_0

    :cond_8
    iget-object v0, p0, Lgc/j;->h:Ljava/time/LocalDate;

    iget-object v1, p1, Lgc/j;->h:Ljava/time/LocalDate;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    goto :goto_0

    :cond_9
    iget-object v0, p0, Lgc/j;->i:Ljava/time/LocalDate;

    iget-object v1, p1, Lgc/j;->i:Ljava/time/LocalDate;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    goto :goto_0

    :cond_a
    iget-object p0, p0, Lgc/j;->j:Ljava/util/ArrayList;

    iget-object p1, p1, Lgc/j;->j:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b

    :goto_0
    const/4 p0, 0x0

    return p0

    :cond_b
    :goto_1
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .locals 3

    iget-object v0, p0, Lgc/j;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lgc/j;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/d0;->a(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lgc/j;->c:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/d0;->a(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lgc/j;->d:Lcom/eightsleep/data_jetlag/enums/TravelDirection;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-boolean v0, p0, Lgc/j;->e:Z

    invoke-static {v2, v1, v0}, Lr4/K;->f(IIZ)I

    move-result v0

    iget-object v2, p0, Lgc/j;->f:Ljava/time/Instant;

    invoke-static {v2, v0, v1}, LRp/a;->d(Ljava/time/Instant;II)I

    move-result v0

    iget-object v2, p0, Lgc/j;->g:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/d0;->a(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lgc/j;->h:Ljava/time/LocalDate;

    invoke-static {v2, v0, v1}, LRp/a;->e(Ljava/time/LocalDate;II)I

    move-result v0

    iget-object v2, p0, Lgc/j;->i:Ljava/time/LocalDate;

    invoke-static {v2, v0, v1}, LRp/a;->e(Ljava/time/LocalDate;II)I

    move-result v0

    iget-object p0, p0, Lgc/j;->j:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "RawJetLagPlan(id="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lgc/j;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", userId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgc/j;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", tripId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgc/j;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", direction="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgc/j;->d:Lcom/eightsleep/data_jetlag/enums/TravelDirection;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", supplementsEnabled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lgc/j;->e:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", createdAt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgc/j;->f:Ljava/time/Instant;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", status="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgc/j;->g:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", startDate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgc/j;->h:Ljava/time/LocalDate;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", endDate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgc/j;->i:Ljava/time/LocalDate;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", tasks="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lgc/j;->j:Ljava/util/ArrayList;

    const-string v1, ")"

    invoke-static {v1, v0, p0}, Lj/m;->m(Ljava/lang/String;Ljava/lang/StringBuilder;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
