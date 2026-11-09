.class public final LLd/b;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/time/Instant;

.field public final c:LLd/a;

.field public final d:LLd/a;

.field public final e:J


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/time/Instant;LLd/a;LLd/a;J)V
    .locals 1

    const-string v0, "deviceId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LLd/b;->a:Ljava/lang/String;

    iput-object p2, p0, LLd/b;->b:Ljava/time/Instant;

    iput-object p3, p0, LLd/b;->c:LLd/a;

    iput-object p4, p0, LLd/b;->d:LLd/a;

    iput-wide p5, p0, LLd/b;->e:J

    return-void
.end method


# virtual methods
.method public final a()LAd/b;
    .locals 6

    new-instance v0, LAd/b;

    const/4 v1, 0x0

    iget-object v2, p0, LLd/b;->c:LLd/a;

    if-eqz v2, :cond_0

    new-instance v3, LAd/a;

    iget-object v4, v2, LLd/a;->a:Ljava/time/LocalDate;

    iget-object v2, v2, LLd/a;->b:Ljava/lang/String;

    invoke-direct {v3, v2, v4}, LAd/a;-><init>(Ljava/lang/String;Ljava/time/LocalDate;)V

    move-object v4, v3

    goto :goto_0

    :cond_0
    move-object v4, v1

    :goto_0
    iget-object v2, p0, LLd/b;->d:LLd/a;

    if-eqz v2, :cond_1

    new-instance v1, LAd/a;

    iget-object v3, v2, LLd/a;->a:Ljava/time/LocalDate;

    iget-object v2, v2, LLd/a;->b:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, LAd/a;-><init>(Ljava/lang/String;Ljava/time/LocalDate;)V

    :cond_1
    move-object v5, v1

    const-string v2, ""

    iget-object v3, p0, LLd/b;->b:Ljava/time/Instant;

    iget-object v1, p0, LLd/b;->a:Ljava/lang/String;

    invoke-direct/range {v0 .. v5}, LAd/b;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;LAd/a;LAd/a;)V

    return-object v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, LLd/b;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, LLd/b;

    iget-object v1, p1, LLd/b;->a:Ljava/lang/String;

    iget-object v3, p0, LLd/b;->a:Ljava/lang/String;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, LLd/b;->b:Ljava/time/Instant;

    iget-object v3, p1, LLd/b;->b:Ljava/time/Instant;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, LLd/b;->c:LLd/a;

    iget-object v3, p1, LLd/b;->c:LLd/a;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    :cond_4
    iget-object v1, p0, LLd/b;->d:LLd/a;

    iget-object v3, p1, LLd/b;->d:LLd/a;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    return v2

    :cond_5
    iget-wide v3, p0, LLd/b;->e:J

    iget-wide p0, p1, LLd/b;->e:J

    cmp-long p0, v3, p0

    if-eqz p0, :cond_6

    return v2

    :cond_6
    return v0
.end method

.method public final hashCode()I
    .locals 3

    iget-object v0, p0, LLd/b;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    const/4 v1, 0x0

    iget-object v2, p0, LLd/b;->b:Ljava/time/Instant;

    if-nez v2, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Ljava/time/Instant;->hashCode()I

    move-result v2

    :goto_0
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, LLd/b;->c:LLd/a;

    if-nez v2, :cond_1

    move v2, v1

    goto :goto_1

    :cond_1
    invoke-virtual {v2}, LLd/a;->hashCode()I

    move-result v2

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, LLd/b;->d:LLd/a;

    if-nez v2, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v2}, LLd/a;->hashCode()I

    move-result v1

    :goto_2
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v1, p0, LLd/b;->e:J

    invoke-static {v1, v2}, Ljava/lang/Long;->hashCode(J)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DeviceMaintenanceInsertReplacementStatusEntity(deviceId="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, LLd/b;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", addressConfirmationDate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, LLd/b;->b:Ljava/time/Instant;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", previousReplacement="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, LLd/b;->c:LLd/a;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", nextReplacement="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, LLd/b;->d:LLd/a;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", lastUpdated="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, LLd/b;->e:J

    const-string p0, ")"

    invoke-static {v1, v2, p0, v0}, LRp/a;->l(JLjava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
