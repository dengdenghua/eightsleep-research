.class public final Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;
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
        "\u0000^\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\t\u0008\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B!\u0008\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ#\u0010\u000f\u001a\u0010\u0012\u000c\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\u000e0\r0\u000c2\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J!\u0010\u0012\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00110\r0\u000c2\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\u0012\u0010\u0010J!\u0010\u0013\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00110\r0\u000c2\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\u0013\u0010\u0010J!\u0010\u0014\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u000e0\r0\u000c2\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\u0014\u0010\u0010JC\u0010\u001c\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u000e0\r0\u000c2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0016\u001a\u00020\u00152\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u00152\u0006\u0010\u0019\u001a\u00020\u00182\u0006\u0010\u001b\u001a\u00020\u001a\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJ!\u0010\u001f\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u001e0\r0\u000c2\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\u001f\u0010\u0010J)\u0010$\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u000e0\r0\u000c2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010!\u001a\u00020 \u00a2\u0006\u0004\u0008\"\u0010#R\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004\u00a2\u0006\u000c\n\u0004\u0008%\u0010&\u001a\u0004\u0008\'\u0010(\u00a8\u0006)"
    }
    d2 = {
        "Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;",
        "LNa/b;",
        "Lfd/a;",
        "api",
        "Lrd/e;",
        "napModeSettingsCache",
        "Lwo/z;",
        "coroutineScope",
        "<init>",
        "(Lfd/a;Lrd/e;Lwo/z;)V",
        "",
        "userId",
        "Lzo/l;",
        "Lya/j;",
        "Lkd/f;",
        "observeNapStatus",
        "(Ljava/lang/String;)Lzo/l;",
        "Lkd/e;",
        "getNapModeSettings",
        "observeNapModeSettings",
        "getNapStatus",
        "LGa/b;",
        "podTemp",
        "pillowTemp",
        "Ljava/time/LocalTime;",
        "durationHms",
        "",
        "alarmRequested",
        "startNap",
        "(Ljava/lang/String;LGa/b;LGa/b;Ljava/time/LocalTime;Z)Lzo/l;",
        "LHm/B;",
        "stopNap",
        "Lmo/b;",
        "duration",
        "extendNap-HG0u8IE",
        "(Ljava/lang/String;J)Lzo/l;",
        "extendNap",
        "a",
        "Lfd/a;",
        "getApi",
        "()Lfd/a;",
        "data-temperature_tencentRelease"
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
.field public final a:Lfd/a;

.field public final b:Lrd/e;

.field public final c:Lwo/z;

.field public final d:Lzo/M0;


# direct methods
.method public constructor <init>(Lfd/a;Lrd/e;Lwo/z;)V
    .locals 1

    const-string v0, "api"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "napModeSettingsCache"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "coroutineScope"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->a:Lfd/a;

    iput-object p2, p0, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->b:Lrd/e;

    iput-object p3, p0, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->c:Lwo/z;

    new-instance p1, Lya/g;

    sget-object p2, LIm/A;->a:LIm/A;

    invoke-direct {p1, p2}, Lya/g;-><init>(Ljava/lang/Object;)V

    invoke-static {p1}, Lzo/s;->c(Ljava/lang/Object;)Lzo/M0;

    move-result-object p1

    iput-object p1, p0, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->d:Lzo/M0;

    return-void
.end method

.method public static final synthetic access$getNapModeSettingsCache$p(Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;)Lrd/e;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->b:Lrd/e;

    return-object p0
.end method

.method public static final synthetic access$updateNapStatusForUser(Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;Ljava/lang/String;Lkd/f;)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->a(Ljava/lang/String;Lkd/f;)V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lkd/f;)V
    .locals 2

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->d:Lzo/M0;

    invoke-virtual {p0}, Lzo/M0;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lya/j;

    instance-of v1, v0, Lya/g;

    if-eqz v1, :cond_0

    check-cast v0, Lya/g;

    iget-object v0, v0, Lya/g;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/Map;

    invoke-static {v0}, LIm/F;->b0(Ljava/util/Map;)Ljava/util/LinkedHashMap;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Lya/g;

    invoke-direct {p1, v0}, Lya/g;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p2, 0x0

    invoke-virtual {p0, p2, p1}, Lzo/M0;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public call(Lfd/a;ZLKa/c;LVm/n;)Lzo/l;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lfd/a;",
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
    check-cast p1, Lfd/a;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->call(Lfd/a;ZLKa/c;LVm/n;)Lzo/l;

    move-result-object p0

    return-object p0
.end method

.method public final extendNap-HG0u8IE(Ljava/lang/String;J)Lzo/l;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J)",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->getApi()Lfd/a;

    move-result-object v0

    new-instance v1, Lcom/eightsleep/data_temperature/exceptions/a;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    new-instance v2, Lgd/m;

    const/4 v3, 0x0

    invoke-direct {v2, p1, p2, p3, v3}, Lgd/m;-><init>(Ljava/lang/String;JLLm/c;)V

    const/4 p2, 0x1

    invoke-static {p0, v0, v1, v2, p2}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object p3

    new-instance v0, Lgd/l;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lgd/l;-><init>(Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;Ljava/lang/String;I)V

    new-instance v1, Lgd/n;

    invoke-direct {v1, v3, p0, p1}, Lgd/n;-><init>(LLm/c;Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;Ljava/lang/String;)V

    invoke-static {p3, v0, v1, p2}, LP2/q;->t(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object p0

    return-object p0
.end method

.method public getApi()Lfd/a;
    .locals 0

    .line 2
    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->a:Lfd/a;

    return-object p0
.end method

.method public bridge synthetic getApi()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->getApi()Lfd/a;

    move-result-object p0

    return-object p0
.end method

.method public final getNapModeSettings(Ljava/lang/String;)Lzo/l;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->getApi()Lfd/a;

    move-result-object v0

    new-instance v1, Lgd/o;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lgd/o;-><init>(Ljava/lang/String;LLm/c;)V

    const/4 v3, 0x3

    invoke-static {p0, v0, v2, v1, v3}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object v0

    new-instance v1, Lgd/p;

    invoke-direct {v1, v2, p0, p1}, Lgd/p;-><init>(LLm/c;Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;Ljava/lang/String;)V

    invoke-static {v0, v2, v1, v3}, LP2/q;->t(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object p0

    return-object p0
.end method

.method public final getNapStatus(Ljava/lang/String;)Lzo/l;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->getApi()Lfd/a;

    move-result-object v0

    new-instance v1, Lnd/a;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    new-instance v2, Lgd/q;

    const/4 v3, 0x0

    invoke-direct {v2, p1, v3}, Lgd/q;-><init>(Ljava/lang/String;LLm/c;)V

    const/4 v4, 0x1

    invoke-static {p0, v0, v1, v2, v4}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object v0

    new-instance v1, Lgd/r;

    invoke-direct {v1, v3, p0, p1}, Lgd/r;-><init>(LLm/c;Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;Ljava/lang/String;)V

    invoke-static {v0, v1}, LP2/q;->D(Lzo/l;LVm/n;)LGc/h;

    move-result-object v0

    new-instance v1, Lgd/s;

    invoke-direct {v1, v3, p0, p1}, Lgd/s;-><init>(LLm/c;Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;Ljava/lang/String;)V

    new-instance p0, Lzo/x;

    const/4 p1, 0x4

    invoke-direct {p0, v0, v1, p1}, Lzo/x;-><init>(Lzo/l;LVm/n;I)V

    return-object p0
.end method

.method public final observeNapModeSettings(Ljava/lang/String;)Lzo/l;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->b:Lrd/e;

    invoke-virtual {v0, p1}, Lrd/e;->d(Ljava/lang/String;)Lzo/l;

    move-result-object v0

    new-instance v1, La9/n;

    const/4 v2, 0x0

    const/4 v3, 0x6

    invoke-direct {v1, v2, p0, p1, v3}, La9/n;-><init>(LLm/c;Ljava/lang/Object;Ljava/lang/Object;I)V

    invoke-static {v0, v1}, Lzo/s;->G(Lzo/l;LVm/o;)LAo/n;

    move-result-object p0

    return-object p0
.end method

.method public final observeNapStatus(Ljava/lang/String;)Lzo/l;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lgd/t;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lgd/t;-><init>(Ljava/lang/String;LLm/c;)V

    iget-object p1, p0, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->d:Lzo/M0;

    invoke-static {p1, v0}, LP2/q;->D(Lzo/l;LVm/n;)LGc/h;

    move-result-object p1

    sget-object v0, Lzo/C0;->a:Lzo/E0;

    sget-object v1, Lya/f;->b:Lya/f;

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->c:Lwo/z;

    invoke-static {p1, p0, v0, v1}, Lzo/s;->E(Lzo/l;Lwo/z;Lzo/D0;Ljava/lang/Object;)Lzo/t0;

    move-result-object p0

    return-object p0
.end method

.method public final startNap(Ljava/lang/String;LGa/b;LGa/b;Ljava/time/LocalTime;Z)Lzo/l;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "LGa/b;",
            "LGa/b;",
            "Ljava/time/LocalTime;",
            "Z)",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "podTemp"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "durationHms"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->getApi()Lfd/a;

    move-result-object v0

    new-instance v1, Lgd/u;

    const/4 v7, 0x0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move v6, p5

    invoke-direct/range {v1 .. v7}, Lgd/u;-><init>(Ljava/lang/String;LGa/b;LGa/b;Ljava/time/LocalTime;ZLLm/c;)V

    const/4 v2, 0x3

    const/4 v3, 0x0

    invoke-static {p0, v0, v3, v1, v2}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object v0

    new-instance v1, Lgd/v;

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v7}, Lgd/v;-><init>(Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;Ljava/lang/String;LGa/b;LGa/b;Ljava/time/LocalTime;LLm/c;)V

    invoke-static {v0, v1}, LP2/q;->D(Lzo/l;LVm/n;)LGc/h;

    move-result-object v0

    return-object v0
.end method

.method public final stopNap(Ljava/lang/String;)Lzo/l;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->getApi()Lfd/a;

    move-result-object v0

    new-instance v1, Lcom/eightsleep/data_temperature/exceptions/a;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    new-instance v2, Lgd/w;

    const/4 v3, 0x0

    invoke-direct {v2, p1, v3}, Lgd/w;-><init>(Ljava/lang/String;LLm/c;)V

    const/4 v4, 0x1

    invoke-static {p0, v0, v1, v2, v4}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object v0

    new-instance v1, Lgd/l;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lgd/l;-><init>(Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;Ljava/lang/String;I)V

    new-instance v2, Lgd/x;

    invoke-direct {v2, v3, p0, p1}, Lgd/x;-><init>(LLm/c;Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;Ljava/lang/String;)V

    invoke-static {v0, v1, v2, v4}, LP2/q;->t(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object p0

    return-object p0
.end method
