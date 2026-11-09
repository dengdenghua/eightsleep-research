.class public final Lgc/f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

.field public final c:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

.field public final d:Lgc/d;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;Lgc/d;)V
    .locals 1

    const-string v0, "id"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "type"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "status"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgc/f;->a:Ljava/lang/String;

    iput-object p2, p0, Lgc/f;->b:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    iput-object p3, p0, Lgc/f;->c:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    iput-object p4, p0, Lgc/f;->d:Lgc/d;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lgc/f;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lgc/f;

    iget-object v1, p1, Lgc/f;->a:Ljava/lang/String;

    iget-object v3, p0, Lgc/f;->a:Ljava/lang/String;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lgc/f;->b:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    iget-object v3, p1, Lgc/f;->b:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    if-eq v1, v3, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lgc/f;->c:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    iget-object v3, p1, Lgc/f;->c:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    if-eq v1, v3, :cond_4

    return v2

    :cond_4
    iget-object p0, p0, Lgc/f;->d:Lgc/d;

    iget-object p1, p1, Lgc/f;->d:Lgc/d;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5

    return v2

    :cond_5
    return v0
.end method

.method public final hashCode()I
    .locals 2

    iget-object v0, p0, Lgc/f;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lgc/f;->b:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lgc/f;->c:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lgc/f;->d:Lgc/d;

    invoke-virtual {p0}, Lgc/d;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "JetLagTaskStatusUpdate(id="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lgc/f;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgc/f;->b:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", status="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgc/f;->c:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", metadata="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lgc/f;->d:Lgc/d;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
