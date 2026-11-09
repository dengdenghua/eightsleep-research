.class public final Lng/f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Lng/d;


# direct methods
.method public synthetic constructor <init>()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1
    invoke-direct {p0, v0, v1}, Lng/f;-><init>(ZLng/d;)V

    return-void
.end method

.method public constructor <init>(ZLng/d;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-boolean p1, p0, Lng/f;->a:Z

    .line 4
    iput-object p2, p0, Lng/f;->b:Lng/d;

    return-void
.end method


# virtual methods
.method public final a()LYa/H;
    .locals 5

    const/4 v0, 0x0

    iget-object p0, p0, Lng/f;->b:Lng/d;

    if-eqz p0, :cond_0

    iget-object v1, p0, Lng/d;->d:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    sget-object v2, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;->POST_FLIGHT:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    const/4 v3, 0x4

    if-ne v1, v2, :cond_1

    new-instance v1, LYa/H;

    iget p0, p0, Lng/d;->e:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-static {p0}, LIm/s;->f0(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    const v2, 0x7f120813

    invoke-direct {v1, v2, p0, v0, v3}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    return-object v1

    :cond_1
    const/4 v1, 0x6

    if-eqz p0, :cond_5

    const/high16 v2, -0x80000000

    const/4 v4, 0x1

    iget p0, p0, Lng/d;->c:I

    if-gt v2, p0, :cond_2

    if-ge p0, v4, :cond_2

    new-instance p0, LYa/H;

    const v2, 0x7f1207f0

    invoke-direct {p0, v2, v0, v0, v1}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    return-object p0

    :cond_2
    if-ltz p0, :cond_3

    const/4 v2, 0x2

    if-ge p0, v2, :cond_3

    new-instance p0, LYa/H;

    const v2, 0x7f1207f1

    invoke-direct {p0, v2, v0, v0, v1}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    return-object p0

    :cond_3
    if-gt v4, p0, :cond_4

    const/16 v1, 0x31

    if-ge p0, v1, :cond_4

    new-instance v1, LYa/H;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-static {p0}, LIm/s;->f0(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    const v2, 0x7f1207ef

    invoke-direct {v1, v2, p0, v0, v3}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    return-object v1

    :cond_4
    new-instance v1, LYa/H;

    div-int/lit8 p0, p0, 0x18

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-static {p0}, LIm/s;->f0(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    const v2, 0x7f1207ee

    invoke-direct {v1, v2, p0, v0, v3}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    return-object v1

    :cond_5
    new-instance p0, LYa/H;

    const v2, 0x7f120819

    invoke-direct {p0, v2, v0, v0, v1}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    return-object p0
.end method

.method public final b()LYa/H;
    .locals 4

    const/4 v0, 0x0

    iget-object p0, p0, Lng/f;->b:Lng/d;

    if-eqz p0, :cond_1

    new-instance v1, LYa/H;

    sget-object v2, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;->POST_FLIGHT:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    iget-object v3, p0, Lng/d;->d:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    if-ne v3, v2, :cond_0

    const v2, 0x7f120814

    goto :goto_0

    :cond_0
    const v2, 0x7f120815

    :goto_0
    iget-object p0, p0, Lng/d;->b:Ljava/lang/String;

    invoke-static {p0}, LP2/r;->U(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, LIm/s;->f0(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    const/4 v3, 0x4

    invoke-direct {v1, v2, p0, v0, v3}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    return-object v1

    :cond_1
    new-instance p0, LYa/H;

    const/4 v1, 0x6

    const v2, 0x7f12081a

    invoke-direct {p0, v2, v0, v0, v1}, LYa/H;-><init>(ILjava/util/List;Ljava/lang/String;I)V

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lng/f;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lng/f;

    iget-boolean v1, p1, Lng/f;->a:Z

    iget-boolean v3, p0, Lng/f;->a:Z

    if-eq v3, v1, :cond_2

    return v2

    :cond_2
    iget-object p0, p0, Lng/f;->b:Lng/d;

    iget-object p1, p1, Lng/f;->b:Lng/d;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    return v2

    :cond_3
    return v0
.end method

.method public final hashCode()I
    .locals 1

    iget-boolean v0, p0, Lng/f;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lng/f;->b:Lng/d;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lng/d;->hashCode()I

    move-result p0

    :goto_0
    add-int/2addr v0, p0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "JetLagSleepToolUiModel(isEnabled="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v1, p0, Lng/f;->a:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", activeTrip="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lng/f;->b:Lng/d;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
