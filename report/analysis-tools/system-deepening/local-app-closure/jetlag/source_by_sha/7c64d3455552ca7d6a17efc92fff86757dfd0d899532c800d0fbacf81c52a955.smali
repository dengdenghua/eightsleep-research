.class public final Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LNa/b;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LNa/b;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000d\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\t\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0019\u0008\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J)\u0010\u000f\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u000e0\r0\u000c2\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J/\u0010\u0016\u001a\u0014\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00150\u00140\r0\u000c2\u0006\u0010\u0011\u001a\u00020\u00082\u0006\u0010\u0013\u001a\u00020\u0012\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J4\u0010\u0019\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00150\r0\u000c2\u0006\u0010\u0011\u001a\u00020\u00082\u0006\u0010\u0018\u001a\u00020\u00082\u0006\u0010\u0013\u001a\u00020\u0012H\u0086@\u00a2\u0006\u0004\u0008\u0019\u0010\u001aJ/\u0010\u001d\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00150\r0\u000c2\u0006\u0010\u0011\u001a\u00020\u00082\u000c\u0010\u001c\u001a\u0008\u0012\u0004\u0012\u00020\u001b0\u0014\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ\'\u0010!\u001a\u0014\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020 0\u00140\r0\u000c2\u0006\u0010\u001f\u001a\u00020\u0008\u00a2\u0006\u0004\u0008!\u0010\"J)\u0010$\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020#0\r0\u000c2\u0006\u0010\u0011\u001a\u00020\u00082\u0006\u0010\u0018\u001a\u00020\u0008\u00a2\u0006\u0004\u0008$\u0010%JM\u0010)\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00150\r0\u000c2\u0006\u0010\u0011\u001a\u00020\u00082\u0006\u0010\u0018\u001a\u00020\u00082\u0008\u0010\'\u001a\u0004\u0018\u00010&2\u0008\u0010(\u001a\u0004\u0018\u00010\u00082\u000e\u0010\u001c\u001a\n\u0012\u0004\u0012\u00020\u001b\u0018\u00010\u0014\u00a2\u0006\u0004\u0008)\u0010*R\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004\u00a2\u0006\u000c\n\u0004\u0008+\u0010,\u001a\u0004\u0008-\u0010.\u00a8\u0006/"
    }
    d2 = {
        "Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;",
        "LNa/b;",
        "Ldc/b;",
        "api",
        "Ljc/g;",
        "tripCache",
        "<init>",
        "(Ldc/b;Ljc/g;)V",
        "",
        "flightNumber",
        "Ljava/time/LocalDate;",
        "date",
        "Lzo/l;",
        "Lya/j;",
        "Lgc/i;",
        "findFlights",
        "(Ljava/lang/String;Ljava/time/LocalDate;)Lzo/l;",
        "userId",
        "",
        "forceRefresh",
        "",
        "Lgc/l;",
        "getTrips",
        "(Ljava/lang/String;Z)Lzo/l;",
        "tripId",
        "getTripById",
        "(Ljava/lang/String;Ljava/lang/String;ZLLm/c;)Ljava/lang/Object;",
        "Lgc/p;",
        "legs",
        "createTrip",
        "(Ljava/lang/String;Ljava/util/List;)Lzo/l;",
        "query",
        "Lgc/g;",
        "searchLocations",
        "(Ljava/lang/String;)Lzo/l;",
        "LHm/B;",
        "deleteTrip",
        "(Ljava/lang/String;Ljava/lang/String;)Lzo/l;",
        "Lcom/eightsleep/data_jetlag/enums/TripStatus;",
        "status",
        "name",
        "updateTrip",
        "(Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/TripStatus;Ljava/lang/String;Ljava/util/List;)Lzo/l;",
        "a",
        "Ldc/b;",
        "getApi",
        "()Ldc/b;",
        "data-jetlag_tencentRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:Ldc/b;

.field public final b:Ljc/g;


# direct methods
.method public constructor <init>(Ldc/b;Ljc/g;)V
    .locals 1

    const-string v0, "api"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "tripCache"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;->a:Ldc/b;

    iput-object p2, p0, Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;->b:Ljc/g;

    return-void
.end method

.method public static final synthetic access$getTripCache$p(Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;)Ljc/g;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;->b:Ljc/g;

    return-object p0
.end method


# virtual methods
.method public call(Ldc/b;ZLKa/c;LVm/n;)Lzo/l;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ldc/b;",
            "Z",
            "LKa/c;",
            "LVm/n;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p2, p3, p4}, LP2/b;->s(LNa/b;ZLKa/c;LVm/n;)Lzo/x;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic call(Ljava/lang/Object;ZLKa/c;LVm/n;)Lzo/l;
    .locals 0

    .line 2
    check-cast p1, Ldc/b;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;->call(Ldc/b;ZLKa/c;LVm/n;)Lzo/l;

    move-result-object p0

    return-object p0
.end method

.method public final createTrip(Ljava/lang/String;Ljava/util/List;)Lzo/l;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lgc/p;",
            ">;)",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "legs"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;->getApi()Ldc/b;

    move-result-object v0

    new-instance v1, Lec/h;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, v2}, Lec/h;-><init>(Ljava/lang/String;Ljava/util/List;LLm/c;)V

    const/4 p2, 0x3

    invoke-static {p0, v0, v2, v1, p2}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object v0

    new-instance v1, Lec/i;

    invoke-direct {v1, p1, p0, v2}, Lec/i;-><init>(Ljava/lang/String;Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;LLm/c;)V

    invoke-static {v0, v2, v1, p2}, LP2/q;->t(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object p0

    return-object p0
.end method

.method public final deleteTrip(Ljava/lang/String;Ljava/lang/String;)Lzo/l;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "tripId"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;->getApi()Ldc/b;

    move-result-object v0

    new-instance v1, Lec/j;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, v2}, Lec/j;-><init>(Ljava/lang/String;Ljava/lang/String;LLm/c;)V

    const/4 p1, 0x3

    invoke-static {p0, v0, v2, v1, p1}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object p0

    return-object p0
.end method

.method public final findFlights(Ljava/lang/String;Ljava/time/LocalDate;)Lzo/l;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/time/LocalDate;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "flightNumber"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "date"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;->getApi()Ldc/b;

    move-result-object v0

    new-instance v1, Lic/a;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    new-instance v2, Lec/k;

    const/4 v3, 0x0

    invoke-direct {v2, p1, p2, v3}, Lec/k;-><init>(Ljava/lang/String;Ljava/time/LocalDate;LLm/c;)V

    const/4 p1, 0x1

    invoke-static {p0, v0, v1, v2, p1}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object p0

    new-instance p1, Lec/l;

    const/4 p2, 0x2

    invoke-direct {p1, p2, v3}, LNm/i;-><init>(ILLm/c;)V

    invoke-static {p0, p1}, LP2/q;->D(Lzo/l;LVm/n;)LGc/h;

    move-result-object p0

    return-object p0
.end method

.method public getApi()Ldc/b;
    .locals 0

    .line 2
    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;->a:Ldc/b;

    return-object p0
.end method

.method public bridge synthetic getApi()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;->getApi()Ldc/b;

    move-result-object p0

    return-object p0
.end method

.method public final getTripById(Ljava/lang/String;Ljava/lang/String;ZLLm/c;)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "LLm/c<",
            "-",
            "Lzo/l;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    instance-of v0, p4, Lec/m;

    if-eqz v0, :cond_0

    move-object v0, p4

    check-cast v0, Lec/m;

    iget v1, v0, Lec/m;->f:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lec/m;->f:I

    goto :goto_0

    :cond_0
    new-instance v0, Lec/m;

    invoke-direct {v0, p0, p4}, Lec/m;-><init>(Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;LLm/c;)V

    :goto_0
    iget-object p4, v0, Lec/m;->d:Ljava/lang/Object;

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, v0, Lec/m;->f:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    if-ne v2, v3, :cond_1

    iget-object p2, v0, Lec/m;->c:Ljava/lang/String;

    iget-object p1, v0, Lec/m;->b:Ljava/lang/String;

    iget-object p0, v0, Lec/m;->a:Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;

    invoke-static {p4}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_1

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    invoke-static {p4}, LX4/x;->M(Ljava/lang/Object;)V

    if-nez p3, :cond_4

    iput-object p0, v0, Lec/m;->a:Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;

    iput-object p1, v0, Lec/m;->b:Ljava/lang/String;

    iput-object p2, v0, Lec/m;->c:Ljava/lang/String;

    iput v3, v0, Lec/m;->f:I

    iget-object p3, p0, Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;->b:Ljc/g;

    iget-object p3, p3, Ljc/g;->a:Lkc/i;

    const-string p4, "SELECT * FROM trip WHERE id = ?"

    invoke-static {v3, p4}, LE4/A;->a(ILjava/lang/String;)LE4/A;

    move-result-object p4

    invoke-virtual {p4, v3, p2}, LE4/A;->g(ILjava/lang/String;)V

    new-instance v2, Landroid/os/CancellationSignal;

    invoke-direct {v2}, Landroid/os/CancellationSignal;-><init>()V

    new-instance v4, Lkc/f;

    const/4 v5, 0x1

    invoke-direct {v4, p3, p4, v5}, Lkc/f;-><init>(Lkc/i;LE4/A;I)V

    iget-object p3, p3, Lkc/i;->a:Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-static {p3, v3, v2, v4, v0}, LP2/A;->L(LE4/t;ZLandroid/os/CancellationSignal;Ljava/util/concurrent/Callable;LLm/c;)Ljava/lang/Object;

    move-result-object p4

    if-ne p4, v1, :cond_3

    return-object v1

    :cond_3
    :goto_1
    check-cast p4, Llc/j;

    if-eqz p4, :cond_4

    new-instance p0, Lya/g;

    invoke-virtual {p4}, Llc/j;->a()Lgc/l;

    move-result-object p1

    invoke-direct {p0, p1}, Lya/g;-><init>(Ljava/lang/Object;)V

    new-instance p1, LJ8/e;

    const/16 p2, 0x9

    invoke-direct {p1, p0, p2}, LJ8/e;-><init>(Ljava/lang/Object;I)V

    return-object p1

    :cond_4
    invoke-virtual {p0}, Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;->getApi()Ldc/b;

    move-result-object p3

    new-instance p4, Lec/n;

    const/4 v0, 0x0

    invoke-direct {p4, p2, v0}, Lec/n;-><init>(Ljava/lang/String;LLm/c;)V

    const/4 p2, 0x3

    invoke-static {p0, p3, v0, p4, p2}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object p3

    new-instance p4, Lec/o;

    invoke-direct {p4, p1, p0, v0}, Lec/o;-><init>(Ljava/lang/String;Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;LLm/c;)V

    invoke-static {p3, v0, p4, p2}, LP2/q;->t(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object p0

    return-object p0
.end method

.method public final getTrips(Ljava/lang/String;Z)Lzo/l;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Ltimber/log/Timber;->a:Lbr/a;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "getTrips forceRefresh: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v3}, Lbr/a;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v1, 0x0

    if-nez p2, :cond_2

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;->b:Ljc/g;

    new-instance p2, Ljc/e;

    invoke-direct {p2, p0, p1, v1}, Ljc/e;-><init>(Ljc/g;Ljava/lang/String;LLm/c;)V

    sget-object p0, LLm/i;->a:LLm/i;

    invoke-static {p0, p2}, Lwo/C;->F(LLm/h;LVm/n;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-nez p0, :cond_0

    sget-object p0, LIm/z;->a:LIm/z;

    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "getTrips Jet lag Cache "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-array p2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p1, p2}, Lbr/a;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance p1, Ljava/util/ArrayList;

    const/16 p2, 0xa

    invoke-static {p0, p2}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result p2

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Llc/j;

    invoke-virtual {p2}, Llc/j;->a()Lgc/l;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    new-instance p0, Lya/g;

    invoke-direct {p0, p1}, Lya/g;-><init>(Ljava/lang/Object;)V

    new-instance p1, LJ8/e;

    const/16 p2, 0x9

    invoke-direct {p1, p0, p2}, LJ8/e;-><init>(Ljava/lang/Object;I)V

    return-object p1

    :cond_2
    invoke-virtual {p0}, Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;->getApi()Ldc/b;

    move-result-object p2

    new-instance v0, Lec/p;

    invoke-direct {v0, p1, v1}, Lec/p;-><init>(Ljava/lang/String;LLm/c;)V

    const/4 v2, 0x3

    invoke-static {p0, p2, v1, v0, v2}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object p2

    new-instance v0, Lec/q;

    invoke-direct {v0, p1, p0, v1}, Lec/q;-><init>(Ljava/lang/String;Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;LLm/c;)V

    invoke-static {p2, v1, v0, v2}, LP2/q;->t(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object p0

    return-object p0
.end method

.method public final searchLocations(Ljava/lang/String;)Lzo/l;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "query"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;->getApi()Ldc/b;

    move-result-object v0

    new-instance v1, Lec/r;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lec/r;-><init>(Ljava/lang/String;LLm/c;)V

    const/4 p1, 0x3

    invoke-static {p0, v0, v2, v1, p1}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object p0

    new-instance p1, Lec/s;

    const/4 v0, 0x2

    invoke-direct {p1, v0, v2}, LNm/i;-><init>(ILLm/c;)V

    invoke-static {p0, p1}, LP2/q;->D(Lzo/l;LVm/n;)LGc/h;

    move-result-object p0

    return-object p0
.end method

.method public final updateTrip(Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/TripStatus;Ljava/lang/String;Ljava/util/List;)Lzo/l;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/eightsleep/data_jetlag/enums/TripStatus;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lgc/p;",
            ">;)",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "tripId"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;->getApi()Ldc/b;

    move-result-object v0

    new-instance v1, Lec/t;

    const/4 v7, 0x0

    move-object v2, p1

    move-object v3, p2

    move-object v5, p3

    move-object v6, p4

    move-object v4, p5

    invoke-direct/range {v1 .. v7}, Lec/t;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/eightsleep/data_jetlag/enums/TripStatus;Ljava/lang/String;LLm/c;)V

    const/4 p1, 0x0

    const/4 p2, 0x3

    invoke-static {p0, v0, p1, v1, p2}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object p3

    new-instance p4, Lec/u;

    invoke-direct {p4, v2, p0, p1}, Lec/u;-><init>(Ljava/lang/String;Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;LLm/c;)V

    invoke-static {p3, p1, p4, p2}, LP2/q;->t(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object p0

    return-object p0
.end method
