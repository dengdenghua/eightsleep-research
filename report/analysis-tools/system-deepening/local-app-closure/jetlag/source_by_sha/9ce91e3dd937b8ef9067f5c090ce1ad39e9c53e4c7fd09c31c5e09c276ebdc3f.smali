.class public final Lec/k;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public a:I

.field public synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/time/LocalDate;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/time/LocalDate;LLm/c;)V
    .locals 0

    iput-object p1, p0, Lec/k;->c:Ljava/lang/String;

    iput-object p2, p0, Lec/k;->d:Ljava/time/LocalDate;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 2

    new-instance v0, Lec/k;

    iget-object v1, p0, Lec/k;->c:Ljava/lang/String;

    iget-object p0, p0, Lec/k;->d:Ljava/time/LocalDate;

    invoke-direct {v0, v1, p0, p2}, Lec/k;-><init>(Ljava/lang/String;Ljava/time/LocalDate;LLm/c;)V

    iput-object p1, v0, Lec/k;->b:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Ldc/b;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lec/k;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lec/k;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lec/k;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, Lec/k;->a:I

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    if-ne v1, v2, :cond_0

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    return-object p1

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lec/k;->b:Ljava/lang/Object;

    check-cast p1, Ldc/b;

    iget-object v1, p0, Lec/k;->d:Ljava/time/LocalDate;

    invoke-virtual {v1}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v3, "toString(...)"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    iput v2, p0, Lec/k;->a:I

    iget-object v2, p0, Lec/k;->c:Ljava/lang/String;

    invoke-interface {p1, v2, v1, p0}, Ldc/b;->b(Ljava/lang/String;Ljava/lang/String;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_2

    return-object v0

    :cond_2
    return-object p0
.end method
