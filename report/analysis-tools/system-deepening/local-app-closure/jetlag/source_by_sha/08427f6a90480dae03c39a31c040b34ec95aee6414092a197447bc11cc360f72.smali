.class public final Lec/g;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public a:I

.field public synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Lcom/eightsleep/data_jetlag/data/model/JetLagBulkTaskUpdateRequest;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/data/model/JetLagBulkTaskUpdateRequest;LLm/c;)V
    .locals 0

    iput-object p1, p0, Lec/g;->c:Ljava/lang/String;

    iput-object p2, p0, Lec/g;->d:Ljava/lang/String;

    iput-object p3, p0, Lec/g;->e:Lcom/eightsleep/data_jetlag/data/model/JetLagBulkTaskUpdateRequest;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p4}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 3

    new-instance v0, Lec/g;

    iget-object v1, p0, Lec/g;->d:Ljava/lang/String;

    iget-object v2, p0, Lec/g;->e:Lcom/eightsleep/data_jetlag/data/model/JetLagBulkTaskUpdateRequest;

    iget-object p0, p0, Lec/g;->c:Ljava/lang/String;

    invoke-direct {v0, p0, v1, v2, p2}, Lec/g;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/data/model/JetLagBulkTaskUpdateRequest;LLm/c;)V

    iput-object p1, v0, Lec/g;->b:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Ldc/a;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lec/g;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lec/g;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lec/g;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, Lec/g;->a:I

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

    iget-object p1, p0, Lec/g;->b:Ljava/lang/Object;

    check-cast p1, Ldc/a;

    iput v2, p0, Lec/g;->a:I

    iget-object v1, p0, Lec/g;->e:Lcom/eightsleep/data_jetlag/data/model/JetLagBulkTaskUpdateRequest;

    iget-object v2, p0, Lec/g;->c:Ljava/lang/String;

    iget-object v3, p0, Lec/g;->d:Ljava/lang/String;

    invoke-interface {p1, v2, v3, v1, p0}, Ldc/a;->b(Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/data/model/JetLagBulkTaskUpdateRequest;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_2

    return-object v0

    :cond_2
    return-object p0
.end method
