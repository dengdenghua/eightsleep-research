.class public final Lkd/f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/time/Instant;

.field public final b:Ljava/time/Instant;

.field public final c:Lkd/d;

.field public final d:Z

.field public final e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/time/Instant;Ljava/time/Instant;Lkd/d;ZLjava/lang/String;)V
    .locals 1

    const-string v0, "startTime"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "endTime"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "levels"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "sessionId"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkd/f;->a:Ljava/time/Instant;

    iput-object p2, p0, Lkd/f;->b:Ljava/time/Instant;

    iput-object p3, p0, Lkd/f;->c:Lkd/d;

    iput-boolean p4, p0, Lkd/f;->d:Z

    iput-object p5, p0, Lkd/f;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(LGa/f;)Lkd/c;
    .locals 7

    const-string v0, "displaySettings"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lkd/c;

    new-instance v2, LGa/s;

    iget-object v0, p1, LGa/f;->d:Lcom/eightsleep/data_core/enums/ClockSystem;

    iget-object v3, p0, Lkd/f;->a:Ljava/time/Instant;

    invoke-direct {v2, v3, v0}, LGa/s;-><init>(Ljava/time/Instant;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    new-instance v3, LGa/s;

    iget-object v4, p0, Lkd/f;->b:Ljava/time/Instant;

    invoke-direct {v3, v4, v0}, LGa/s;-><init>(Ljava/time/Instant;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    iget-object v0, p0, Lkd/f;->c:Lkd/d;

    invoke-virtual {v0, p1}, Lkd/d;->a(LGa/f;)Lkd/a;

    move-result-object v4

    iget-boolean v5, p0, Lkd/f;->d:Z

    iget-object v6, p0, Lkd/f;->e:Ljava/lang/String;

    invoke-direct/range {v1 .. v6}, Lkd/c;-><init>(LGa/s;LGa/s;Lkd/a;ZLjava/lang/String;)V

    return-object v1
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lkd/f;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lkd/f;

    iget-object v1, p1, Lkd/f;->a:Ljava/time/Instant;

    iget-object v3, p0, Lkd/f;->a:Ljava/time/Instant;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lkd/f;->b:Ljava/time/Instant;

    iget-object v3, p1, Lkd/f;->b:Ljava/time/Instant;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lkd/f;->c:Lkd/d;

    iget-object v3, p1, Lkd/f;->c:Lkd/d;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    :cond_4
    iget-boolean v1, p0, Lkd/f;->d:Z

    iget-boolean v3, p1, Lkd/f;->d:Z

    if-eq v1, v3, :cond_5

    return v2

    :cond_5
    iget-object p0, p0, Lkd/f;->e:Ljava/lang/String;

    iget-object p1, p1, Lkd/f;->e:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6

    return v2

    :cond_6
    return v0
.end method

.method public final hashCode()I
    .locals 3

    iget-object v0, p0, Lkd/f;->a:Ljava/time/Instant;

    invoke-virtual {v0}, Ljava/time/Instant;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lkd/f;->b:Ljava/time/Instant;

    invoke-static {v2, v0, v1}, LRp/a;->d(Ljava/time/Instant;II)I

    move-result v0

    iget-object v2, p0, Lkd/f;->c:Lkd/d;

    invoke-virtual {v2}, Lkd/d;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-boolean v0, p0, Lkd/f;->d:Z

    invoke-static {v2, v1, v0}, Lr4/K;->f(IIZ)I

    move-result v0

    iget-object p0, p0, Lkd/f;->e:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "RawNapModeStatus(startTime="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lkd/f;->a:Ljava/time/Instant;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", endTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lkd/f;->b:Ljava/time/Instant;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", levels="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lkd/f;->c:Lkd/d;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", alarmRequested="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lkd/f;->d:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", sessionId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lkd/f;->e:Ljava/lang/String;

    const-string v1, ")"

    invoke-static {v0, p0, v1}, Lr4/K;->s(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
