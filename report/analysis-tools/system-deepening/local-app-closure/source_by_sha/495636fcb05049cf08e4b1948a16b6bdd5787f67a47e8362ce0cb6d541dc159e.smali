.class public final Lmd/B;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public synthetic a:Ljava/lang/Object;

.field public final synthetic b:Lmd/C;

.field public final synthetic c:LGa/b;

.field public final synthetic d:LGa/b;

.field public final synthetic e:I

.field public final synthetic f:I

.field public final synthetic g:Z


# direct methods
.method public constructor <init>(Lmd/C;LGa/b;LGa/b;IIZLLm/c;)V
    .locals 0

    iput-object p1, p0, Lmd/B;->b:Lmd/C;

    iput-object p2, p0, Lmd/B;->c:LGa/b;

    iput-object p3, p0, Lmd/B;->d:LGa/b;

    iput p4, p0, Lmd/B;->e:I

    iput p5, p0, Lmd/B;->f:I

    iput-boolean p6, p0, Lmd/B;->g:Z

    const/4 p1, 0x2

    invoke-direct {p0, p1, p7}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 8

    new-instance v0, Lmd/B;

    iget v5, p0, Lmd/B;->f:I

    iget-boolean v6, p0, Lmd/B;->g:Z

    iget-object v1, p0, Lmd/B;->b:Lmd/C;

    iget-object v2, p0, Lmd/B;->c:LGa/b;

    iget-object v3, p0, Lmd/B;->d:LGa/b;

    iget v4, p0, Lmd/B;->e:I

    move-object v7, p2

    invoke-direct/range {v0 .. v7}, Lmd/B;-><init>(Lmd/C;LGa/b;LGa/b;IIZLLm/c;)V

    iput-object p1, v0, Lmd/B;->a:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, LHm/k;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lmd/B;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lmd/B;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lmd/B;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lmd/B;->a:Ljava/lang/Object;

    check-cast p1, LHm/k;

    iget-object v0, p1, LHm/k;->a:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Ljava/lang/String;

    iget-object p1, p1, LHm/k;->b:Ljava/lang/Object;

    check-cast p1, LGa/f;

    iget-object v0, p0, Lmd/B;->b:Lmd/C;

    iget-object v1, v0, Lmd/C;->c:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;

    iget v0, p0, Lmd/B;->e:I

    iget v3, p0, Lmd/B;->f:I

    invoke-static {v0, v3}, Ljava/time/LocalTime;->of(II)Ljava/time/LocalTime;

    move-result-object v5

    const-string v0, "of(...)"

    invoke-static {v5, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v3, p0, Lmd/B;->c:LGa/b;

    iget-object v4, p0, Lmd/B;->d:LGa/b;

    iget-boolean v6, p0, Lmd/B;->g:Z

    invoke-virtual/range {v1 .. v6}, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->startNap(Ljava/lang/String;LGa/b;LGa/b;Ljava/time/LocalTime;Z)Lzo/l;

    move-result-object p0

    new-instance v0, Lmd/A;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lmd/A;-><init>(LGa/f;LLm/c;)V

    const/4 p1, 0x3

    invoke-static {p0, v1, v0, p1}, LP2/q;->t(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object p0

    return-object p0
.end method
