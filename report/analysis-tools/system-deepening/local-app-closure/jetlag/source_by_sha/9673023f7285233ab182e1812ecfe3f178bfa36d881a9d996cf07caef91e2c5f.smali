.class public final Lhc/w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhc/t;


# instance fields
.field public final a:Lhc/J;

.field public final b:Lyc/d;


# direct methods
.method public constructor <init>(Lhc/J;Lyc/d;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhc/w;->a:Lhc/J;

    iput-object p2, p0, Lhc/w;->b:Lyc/d;

    return-void
.end method


# virtual methods
.method public final a(ZLNm/c;)Ljava/lang/Object;
    .locals 5

    instance-of v0, p2, Lhc/u;

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, Lhc/u;

    iget v1, v0, Lhc/u;->d:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lhc/u;->d:I

    goto :goto_0

    :cond_0
    new-instance v0, Lhc/u;

    invoke-direct {v0, p0, p2}, Lhc/u;-><init>(Lhc/w;LNm/c;)V

    :goto_0
    iget-object p2, v0, Lhc/u;->b:Ljava/lang/Object;

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, v0, Lhc/u;->d:I

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
    iget-object p0, v0, Lhc/u;->a:Lhc/w;

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_1

    :cond_3
    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    iput-object p0, v0, Lhc/u;->a:Lhc/w;

    iput v4, v0, Lhc/u;->d:I

    iget-object p2, p0, Lhc/w;->a:Lhc/J;

    invoke-virtual {p2, p1, v0}, Lhc/J;->a(ZLNm/c;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_4

    goto :goto_2

    :cond_4
    :goto_1
    check-cast p2, Lzo/l;

    new-instance p1, Lhc/v;

    const/4 v2, 0x0

    invoke-direct {p1, p0, v2}, Lhc/v;-><init>(Lhc/w;LLm/c;)V

    iput-object v2, v0, Lhc/u;->a:Lhc/w;

    iput v3, v0, Lhc/u;->d:I

    const/4 p0, 0x3

    invoke-static {p2, v2, p1, p0}, LP2/q;->u(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object p0

    if-ne p0, v1, :cond_5

    :goto_2
    return-object v1

    :cond_5
    return-object p0
.end method
