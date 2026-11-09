.class public final Lld/L;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lld/I;


# instance fields
.field public final a:Lu5/e;

.field public final b:Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;


# direct methods
.method public constructor <init>(Lu5/e;Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;)V
    .locals 1

    const-string v0, "temperatureRepository"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lld/L;->a:Lu5/e;

    iput-object p2, p0, Lld/L;->b:Lcom/eightsleep/data_temperature/data/repository/TemperatureRepository;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;LNm/c;)Ljava/lang/Object;
    .locals 5

    instance-of v0, p2, Lld/J;

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, Lld/J;

    iget v1, v0, Lld/J;->d:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lld/J;->d:I

    goto :goto_0

    :cond_0
    new-instance v0, Lld/J;

    invoke-direct {v0, p0, p2}, Lld/J;-><init>(Lld/L;LNm/c;)V

    :goto_0
    iget-object p2, v0, Lld/J;->b:Ljava/lang/Object;

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, v0, Lld/J;->d:I

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz v2, :cond_3

    if-eq v2, v4, :cond_2

    if-ne v2, v3, :cond_1

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    return-object p2

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    iget-object p0, v0, Lld/J;->a:Lld/L;

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_1

    :cond_3
    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    if-eqz p1, :cond_4

    new-instance p2, Lya/g;

    invoke-direct {p2, p1}, Lya/g;-><init>(Ljava/lang/Object;)V

    new-instance p1, LJ8/e;

    const/16 v2, 0x9

    invoke-direct {p1, p2, v2}, LJ8/e;-><init>(Ljava/lang/Object;I)V

    goto :goto_2

    :cond_4
    iput-object p0, v0, Lld/J;->a:Lld/L;

    iput v4, v0, Lld/J;->d:I

    iget-object p1, p0, Lld/L;->a:Lu5/e;

    invoke-virtual {p1, v0}, Lu5/e;->C(LNm/c;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_5

    goto :goto_3

    :cond_5
    :goto_1
    move-object p1, p2

    check-cast p1, Lzo/l;

    :goto_2
    new-instance p2, Lld/K;

    const/4 v2, 0x0

    invoke-direct {p2, p0, v2}, Lld/K;-><init>(Lld/L;LLm/c;)V

    iput-object v2, v0, Lld/J;->a:Lld/L;

    iput v3, v0, Lld/J;->d:I

    const/4 p0, 0x3

    invoke-static {p1, v2, p2, p0}, LP2/q;->u(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object p0

    if-ne p0, v1, :cond_6

    :goto_3
    return-object v1

    :cond_6
    return-object p0
.end method
