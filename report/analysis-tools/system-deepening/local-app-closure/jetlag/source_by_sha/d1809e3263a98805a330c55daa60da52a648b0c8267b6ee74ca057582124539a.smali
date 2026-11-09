.class public final Llc/d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Llc/a;

.field public final b:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Llc/a;Ljava/util/ArrayList;)V
    .locals 1

    const-string v0, "plan"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "tasks"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llc/d;->a:Llc/a;

    iput-object p2, p0, Llc/d;->b:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final a()Lgc/j;
    .locals 24

    move-object/from16 v0, p0

    iget-object v1, v0, Llc/d;->a:Llc/a;

    iget-object v3, v1, Llc/a;->a:Ljava/lang/String;

    new-instance v12, Ljava/util/ArrayList;

    iget-object v0, v0, Llc/d;->b:Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {v0, v2}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v12, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Llc/c;

    new-instance v13, Lgc/k;

    iget-object v4, v2, Llc/c;->j:Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;

    invoke-virtual {v4}, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;->toDomain()Lgc/d;

    move-result-object v23

    iget-object v4, v2, Llc/c;->f:Ljava/time/Instant;

    iget-object v5, v2, Llc/c;->g:Ljava/lang/String;

    iget-object v14, v2, Llc/c;->a:Ljava/lang/String;

    iget-object v15, v2, Llc/c;->b:Ljava/lang/String;

    iget-object v6, v2, Llc/c;->c:Ljava/lang/String;

    iget-object v7, v2, Llc/c;->d:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    iget-object v8, v2, Llc/c;->e:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    iget-object v9, v2, Llc/c;->h:Ljava/lang/String;

    iget-object v2, v2, Llc/c;->i:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    move-object/from16 v22, v2

    move-object/from16 v19, v4

    move-object/from16 v20, v5

    move-object/from16 v16, v6

    move-object/from16 v17, v7

    move-object/from16 v18, v8

    move-object/from16 v21, v9

    invoke-direct/range {v13 .. v23}, Lgc/k;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;Lgc/d;)V

    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    new-instance v2, Lgc/j;

    iget-object v4, v1, Llc/a;->b:Ljava/lang/String;

    iget-object v5, v1, Llc/a;->c:Ljava/lang/String;

    iget-object v6, v1, Llc/a;->d:Lcom/eightsleep/data_jetlag/enums/TravelDirection;

    iget-boolean v7, v1, Llc/a;->e:Z

    iget-object v8, v1, Llc/a;->f:Ljava/time/Instant;

    iget-object v9, v1, Llc/a;->g:Ljava/lang/String;

    iget-object v10, v1, Llc/a;->h:Ljava/time/LocalDate;

    iget-object v11, v1, Llc/a;->i:Ljava/time/LocalDate;

    invoke-direct/range {v2 .. v12}, Lgc/j;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/TravelDirection;ZLjava/time/Instant;Ljava/lang/String;Ljava/time/LocalDate;Ljava/time/LocalDate;Ljava/util/ArrayList;)V

    return-object v2
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 2

    if-ne p0, p1, :cond_0

    goto :goto_1

    :cond_0
    instance-of v0, p1, Llc/d;

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    check-cast p1, Llc/d;

    iget-object v0, p1, Llc/d;->a:Llc/a;

    iget-object v1, p0, Llc/d;->a:Llc/a;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    iget-object p0, p0, Llc/d;->b:Ljava/util/ArrayList;

    iget-object p1, p1, Llc/d;->b:Ljava/util/ArrayList;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    :goto_0
    const/4 p0, 0x0

    return p0

    :cond_3
    :goto_1
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .locals 1

    iget-object v0, p0, Llc/d;->a:Llc/a;

    invoke-virtual {v0}, Llc/a;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Llc/d;->b:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "JetLagPlanWithTasksEntity(plan="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Llc/d;->a:Llc/a;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", tasks="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Llc/d;->b:Ljava/util/ArrayList;

    const-string v1, ")"

    invoke-static {v1, v0, p0}, Lj/m;->m(Ljava/lang/String;Ljava/lang/StringBuilder;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
