.class public final Lhc/y;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public synthetic a:Ljava/lang/Object;

.field public final synthetic b:LGa/f;


# direct methods
.method public constructor <init>(LGa/f;LLm/c;)V
    .locals 0

    iput-object p1, p0, Lhc/y;->b:LGa/f;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 1

    new-instance v0, Lhc/y;

    iget-object p0, p0, Lhc/y;->b:LGa/f;

    invoke-direct {v0, p0, p2}, Lhc/y;-><init>(LGa/f;LLm/c;)V

    iput-object p1, v0, Lhc/y;->a:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lgc/j;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lhc/y;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lhc/y;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lhc/y;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lhc/y;->a:Ljava/lang/Object;

    check-cast p1, Lgc/j;

    iget-object p0, p0, Lhc/y;->b:LGa/f;

    invoke-virtual {p1, p0}, Lgc/j;->a(LGa/f;)Lgc/c;

    move-result-object p0

    return-object p0
.end method
