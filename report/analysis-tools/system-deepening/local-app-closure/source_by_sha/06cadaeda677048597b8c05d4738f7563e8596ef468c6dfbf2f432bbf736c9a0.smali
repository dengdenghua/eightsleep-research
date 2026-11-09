.class public final Lmd/F;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public synthetic a:Ljava/lang/Object;

.field public final synthetic b:Lmd/I;


# direct methods
.method public constructor <init>(Lmd/I;LLm/c;)V
    .locals 0

    iput-object p1, p0, Lmd/F;->b:Lmd/I;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 1

    new-instance v0, Lmd/F;

    iget-object p0, p0, Lmd/F;->b:Lmd/I;

    invoke-direct {v0, p0, p2}, Lmd/F;-><init>(Lmd/I;LLm/c;)V

    iput-object p1, v0, Lmd/F;->a:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lya/j;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lmd/F;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lmd/F;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lmd/F;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lmd/F;->a:Ljava/lang/Object;

    check-cast p1, Lya/j;

    instance-of p1, p1, Lya/g;

    if-eqz p1, :cond_0

    iget-object p0, p0, Lmd/F;->b:Lmd/I;

    iget-object p1, p0, Lmd/I;->d:LCo/c;

    new-instance v0, Lmd/E;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lmd/E;-><init>(Lmd/I;LLm/c;)V

    const/4 p0, 0x3

    invoke-static {p1, v1, v1, v0, p0}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    :cond_0
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0
.end method
