.class public final Lec/t;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public a:I

.field public synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/util/List;

.field public final synthetic f:Lcom/eightsleep/data_jetlag/enums/TripStatus;

.field public final synthetic g:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/eightsleep/data_jetlag/enums/TripStatus;Ljava/lang/String;LLm/c;)V
    .locals 0

    iput-object p1, p0, Lec/t;->c:Ljava/lang/String;

    iput-object p2, p0, Lec/t;->d:Ljava/lang/String;

    iput-object p3, p0, Lec/t;->e:Ljava/util/List;

    iput-object p4, p0, Lec/t;->f:Lcom/eightsleep/data_jetlag/enums/TripStatus;

    iput-object p5, p0, Lec/t;->g:Ljava/lang/String;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p6}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 7

    new-instance v0, Lec/t;

    iget-object v4, p0, Lec/t;->f:Lcom/eightsleep/data_jetlag/enums/TripStatus;

    iget-object v5, p0, Lec/t;->g:Ljava/lang/String;

    iget-object v1, p0, Lec/t;->c:Ljava/lang/String;

    iget-object v2, p0, Lec/t;->d:Ljava/lang/String;

    iget-object v3, p0, Lec/t;->e:Ljava/util/List;

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lec/t;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/eightsleep/data_jetlag/enums/TripStatus;Ljava/lang/String;LLm/c;)V

    iput-object p1, v0, Lec/t;->b:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Ldc/b;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lec/t;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lec/t;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lec/t;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, Lec/t;->a:I

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

    iget-object p1, p0, Lec/t;->b:Ljava/lang/Object;

    check-cast p1, Ldc/b;

    iget-object v1, p0, Lec/t;->e:Ljava/util/List;

    if-eqz v1, :cond_2

    new-instance v3, Ljava/util/ArrayList;

    const/16 v4, 0xa

    invoke-static {v1, v4}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lgc/p;

    new-instance v5, Lcom/eightsleep/data_jetlag/data/model/TripLegRequest;

    iget-object v6, v4, Lgc/p;->b:Lgc/q;

    move-object v7, v6

    new-instance v6, Lcom/eightsleep/data_jetlag/data/model/TripLocationNetworkModel;

    iget-object v8, v7, Lgc/q;->c:Ljava/time/ZoneOffset;

    invoke-virtual {v8}, Ljava/time/ZoneOffset;->getId()Ljava/lang/String;

    move-result-object v8

    const-string v9, "getId(...)"

    invoke-static {v8, v9}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v10, v7, Lgc/q;->a:Ljava/lang/String;

    iget-object v7, v7, Lgc/q;->b:Ljava/lang/String;

    invoke-direct {v6, v10, v7, v8}, Lcom/eightsleep/data_jetlag/data/model/TripLocationNetworkModel;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v7, v4, Lgc/p;->c:Lgc/q;

    move-object v8, v7

    new-instance v7, Lcom/eightsleep/data_jetlag/data/model/TripLocationNetworkModel;

    iget-object v10, v8, Lgc/q;->c:Ljava/time/ZoneOffset;

    invoke-virtual {v10}, Ljava/time/ZoneOffset;->getId()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10, v9}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v9, v8, Lgc/q;->a:Ljava/lang/String;

    iget-object v8, v8, Lgc/q;->b:Ljava/lang/String;

    invoke-direct {v7, v9, v8, v10}, Lcom/eightsleep/data_jetlag/data/model/TripLocationNetworkModel;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v8, v4, Lgc/p;->d:LGa/s;

    iget-object v8, v8, LGa/s;->a:Ljava/time/Instant;

    iget-object v9, v4, Lgc/p;->e:LGa/s;

    iget-object v9, v9, LGa/s;->a:Ljava/time/Instant;

    iget-object v10, v4, Lgc/p;->f:Ljava/lang/String;

    invoke-direct/range {v5 .. v10}, Lcom/eightsleep/data_jetlag/data/model/TripLegRequest;-><init>(Lcom/eightsleep/data_jetlag/data/model/TripLocationNetworkModel;Lcom/eightsleep/data_jetlag/data/model/TripLocationNetworkModel;Ljava/time/Instant;Ljava/time/Instant;Ljava/lang/String;)V

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    const/4 v3, 0x0

    :cond_3
    new-instance v1, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;

    iget-object v4, p0, Lec/t;->f:Lcom/eightsleep/data_jetlag/enums/TripStatus;

    iget-object v5, p0, Lec/t;->g:Ljava/lang/String;

    invoke-direct {v1, v4, v5, v3}, Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;-><init>(Lcom/eightsleep/data_jetlag/enums/TripStatus;Ljava/lang/String;Ljava/util/List;)V

    iput v2, p0, Lec/t;->a:I

    iget-object v2, p0, Lec/t;->c:Ljava/lang/String;

    iget-object v3, p0, Lec/t;->d:Ljava/lang/String;

    invoke-interface {p1, v2, v3, v1, p0}, Ldc/b;->a(Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_4

    return-object v0

    :cond_4
    return-object p0
.end method
