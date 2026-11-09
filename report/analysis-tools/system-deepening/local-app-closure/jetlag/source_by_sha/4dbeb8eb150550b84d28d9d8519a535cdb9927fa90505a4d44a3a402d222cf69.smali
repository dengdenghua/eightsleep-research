.class public final Lng/d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:I

.field public final d:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

.field public final e:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ILcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;)V
    .locals 1

    const-string v0, "id"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "destinationCity"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "phase"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lng/d;->a:Ljava/lang/String;

    iput-object p2, p0, Lng/d;->b:Ljava/lang/String;

    iput p3, p0, Lng/d;->c:I

    iput-object p4, p0, Lng/d;->d:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    const/4 p1, 0x1

    iput p1, p0, Lng/d;->e:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 2

    if-ne p0, p1, :cond_0

    goto :goto_1

    :cond_0
    instance-of v0, p1, Lng/d;

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    check-cast p1, Lng/d;

    iget-object v0, p1, Lng/d;->a:Ljava/lang/String;

    iget-object v1, p0, Lng/d;->a:Ljava/lang/String;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lng/d;->b:Ljava/lang/String;

    iget-object v1, p1, Lng/d;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_0

    :cond_3
    iget v0, p0, Lng/d;->c:I

    iget v1, p1, Lng/d;->c:I

    if-eq v0, v1, :cond_4

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lng/d;->d:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    iget-object v1, p1, Lng/d;->d:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    if-eq v0, v1, :cond_5

    goto :goto_0

    :cond_5
    iget p0, p0, Lng/d;->e:I

    iget p1, p1, Lng/d;->e:I

    if-eq p0, p1, :cond_6

    :goto_0
    const/4 p0, 0x0

    return p0

    :cond_6
    :goto_1
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .locals 3

    iget-object v0, p0, Lng/d;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lng/d;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/d0;->a(IILjava/lang/String;)I

    move-result v0

    iget v2, p0, Lng/d;->c:I

    invoke-static {v2, v0, v1}, Lr4/K;->c(III)I

    move-result v0

    iget-object v2, p0, Lng/d;->d:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget p0, p0, Lng/d;->e:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr p0, v2

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "JetLagActiveTripUiModel(id="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lng/d;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", destinationCity="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lng/d;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", hoursUntilTrip="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lng/d;->c:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", phase="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lng/d;->d:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", nightNumber="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lng/d;->e:I

    const-string v1, ")"

    invoke-static {p0, v1, v0}, LB/h;->i(ILjava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
