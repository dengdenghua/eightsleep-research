.class public final Lgd/k;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public a:I

.field public synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljd/c;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljd/c;LLm/c;)V
    .locals 0

    iput-object p1, p0, Lgd/k;->c:Ljava/lang/String;

    iput-object p2, p0, Lgd/k;->d:Ljd/c;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 2

    new-instance v0, Lgd/k;

    iget-object v1, p0, Lgd/k;->c:Ljava/lang/String;

    iget-object p0, p0, Lgd/k;->d:Ljd/c;

    invoke-direct {v0, v1, p0, p2}, Lgd/k;-><init>(Ljava/lang/String;Ljd/c;LLm/c;)V

    iput-object p1, v0, Lgd/k;->b:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lfd/b;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lgd/k;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lgd/k;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lgd/k;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, Lgd/k;->a:I

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

    iget-object p1, p0, Lgd/k;->b:Ljava/lang/Object;

    check-cast p1, Lfd/b;

    iget-object v1, p0, Lgd/k;->d:Ljd/c;

    new-instance v3, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequest;

    new-instance v4, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;

    sget v5, Lmo/b;->d:I

    sget-object v5, Lmo/d;->SECONDS:Lmo/d;

    iget-wide v6, v1, Ljd/c;->c:J

    invoke-static {v6, v7, v5}, Lmo/b;->m(JLmo/d;)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/time/LocalTime;->ofSecondOfDay(J)Ljava/time/LocalTime;

    move-result-object v5

    const-string v6, "ofSecondOfDay(...)"

    invoke-static {v5, v6}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v6, v1, Ljd/c;->d:LGa/b;

    iget v6, v6, LGa/b;->a:I

    iget-boolean v1, v1, Ljd/c;->b:Z

    invoke-direct {v4, v1, v5, v6}, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;-><init>(ZLjava/time/LocalTime;I)V

    invoke-direct {v3, v4}, Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequest;-><init>(Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequestSettings;)V

    iput v2, p0, Lgd/k;->a:I

    iget-object v1, p0, Lgd/k;->c:Ljava/lang/String;

    invoke-interface {p1, v1, v3, p0}, Lfd/b;->e(Ljava/lang/String;Lcom/eightsleep/data_temperature/data/model/HotFlashModeSettingsRequest;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_2

    return-object v0

    :cond_2
    return-object p0
.end method
