.class public final Lgc/k;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

.field public final e:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

.field public final f:Ljava/time/Instant;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

.field public final j:Lgc/d;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;Lgc/d;)V
    .locals 1

    const-string v0, "id"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "planId"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "name"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "type"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "phase"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "scheduledAt"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "timezoneId"

    invoke-static {p7, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "instructions"

    invoke-static {p8, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "status"

    invoke-static {p9, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "metadata"

    invoke-static {p10, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgc/k;->a:Ljava/lang/String;

    iput-object p2, p0, Lgc/k;->b:Ljava/lang/String;

    iput-object p3, p0, Lgc/k;->c:Ljava/lang/String;

    iput-object p4, p0, Lgc/k;->d:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    iput-object p5, p0, Lgc/k;->e:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    iput-object p6, p0, Lgc/k;->f:Ljava/time/Instant;

    iput-object p7, p0, Lgc/k;->g:Ljava/lang/String;

    iput-object p8, p0, Lgc/k;->h:Ljava/lang/String;

    iput-object p9, p0, Lgc/k;->i:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    iput-object p10, p0, Lgc/k;->j:Lgc/d;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lgc/k;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lgc/k;

    iget-object v1, p1, Lgc/k;->a:Ljava/lang/String;

    iget-object v3, p0, Lgc/k;->a:Ljava/lang/String;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lgc/k;->b:Ljava/lang/String;

    iget-object v3, p1, Lgc/k;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lgc/k;->c:Ljava/lang/String;

    iget-object v3, p1, Lgc/k;->c:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    :cond_4
    iget-object v1, p0, Lgc/k;->d:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    iget-object v3, p1, Lgc/k;->d:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    if-eq v1, v3, :cond_5

    return v2

    :cond_5
    iget-object v1, p0, Lgc/k;->e:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    iget-object v3, p1, Lgc/k;->e:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    if-eq v1, v3, :cond_6

    return v2

    :cond_6
    iget-object v1, p0, Lgc/k;->f:Ljava/time/Instant;

    iget-object v3, p1, Lgc/k;->f:Ljava/time/Instant;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    return v2

    :cond_7
    iget-object v1, p0, Lgc/k;->g:Ljava/lang/String;

    iget-object v3, p1, Lgc/k;->g:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    return v2

    :cond_8
    iget-object v1, p0, Lgc/k;->h:Ljava/lang/String;

    iget-object v3, p1, Lgc/k;->h:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    return v2

    :cond_9
    iget-object v1, p0, Lgc/k;->i:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    iget-object v3, p1, Lgc/k;->i:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    if-eq v1, v3, :cond_a

    return v2

    :cond_a
    iget-object p0, p0, Lgc/k;->j:Lgc/d;

    iget-object p1, p1, Lgc/k;->j:Lgc/d;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b

    return v2

    :cond_b
    return v0
.end method

.method public final hashCode()I
    .locals 3

    iget-object v0, p0, Lgc/k;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lgc/k;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/d0;->a(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lgc/k;->c:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/d0;->a(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lgc/k;->d:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lgc/k;->e:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lgc/k;->f:Ljava/time/Instant;

    invoke-static {v2, v0, v1}, LRp/a;->d(Ljava/time/Instant;II)I

    move-result v0

    iget-object v2, p0, Lgc/k;->g:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/d0;->a(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lgc/k;->h:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/d0;->a(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lgc/k;->i:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object p0, p0, Lgc/k;->j:Lgc/d;

    invoke-virtual {p0}, Lgc/d;->hashCode()I

    move-result p0

    add-int/2addr p0, v2

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "RawJetLagPlanTask(id="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lgc/k;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", planId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgc/k;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgc/k;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgc/k;->d:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", phase="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgc/k;->e:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", scheduledAt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgc/k;->f:Ljava/time/Instant;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", timezoneId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgc/k;->g:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", instructions="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgc/k;->h:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", status="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgc/k;->i:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", metadata="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lgc/k;->j:Lgc/d;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
