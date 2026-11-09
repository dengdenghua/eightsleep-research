.class public final Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;
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
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0019\u0008\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J#\u0010\r\u001a\u0010\u0012\u000c\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\u000c0\u000b0\n2\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\r\u0010\u000eJ#\u0010\u000f\u001a\u0010\u0012\u000c\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\u000c0\u000b0\n2\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000f\u0010\u000eJ)\u0010\u0011\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u000c0\u000b0\n2\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u0010\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J!\u0010\u0014\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00130\u000b0\n2\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u0014\u0010\u000eR\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004\u00a2\u0006\u000c\n\u0004\u0008\u0015\u0010\u0016\u001a\u0004\u0008\u0017\u0010\u0018\u00a8\u0006\u0019"
    }
    d2 = {
        "Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;",
        "LNa/b;",
        "Lfd/b;",
        "api",
        "Lrd/b;",
        "hotFlashModeSettingsCache",
        "<init>",
        "(Lfd/b;Lrd/b;)V",
        "",
        "userId",
        "Lzo/l;",
        "Lya/j;",
        "Ljd/c;",
        "observeHotFlashModeSettings",
        "(Ljava/lang/String;)Lzo/l;",
        "refreshHotFlashModeSettings",
        "settingsUpdate",
        "updateHotFlashModeSettings",
        "(Ljava/lang/String;Ljd/c;)Lzo/l;",
        "LHm/B;",
        "removeHotFlashModeSettings",
        "a",
        "Lfd/b;",
        "getApi",
        "()Lfd/b;",
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
.field public final a:Lfd/b;

.field public final b:Lrd/b;


# direct methods
.method public constructor <init>(Lfd/b;Lrd/b;)V
    .locals 1

    const-string v0, "api"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "hotFlashModeSettingsCache"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;->a:Lfd/b;

    iput-object p2, p0, Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;->b:Lrd/b;

    return-void
.end method

.method public static final synthetic access$getHotFlashModeSettingsCache$p(Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;)Lrd/b;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;->b:Lrd/b;

    return-object p0
.end method


# virtual methods
.method public call(Lfd/b;ZLKa/c;LVm/n;)Lzo/l;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lfd/b;",
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
    check-cast p1, Lfd/b;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;->call(Lfd/b;ZLKa/c;LVm/n;)Lzo/l;

    move-result-object p0

    return-object p0
.end method

.method public getApi()Lfd/b;
    .locals 0

    .line 2
    iget-object p0, p0, Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;->a:Lfd/b;

    return-object p0
.end method

.method public bridge synthetic getApi()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;->getApi()Lfd/b;

    move-result-object p0

    return-object p0
.end method

.method public final observeHotFlashModeSettings(Ljava/lang/String;)Lzo/l;
    .locals 3
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

    iget-object v0, p0, Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;->b:Lrd/b;

    invoke-virtual {v0, p1}, Lrd/b;->d(Ljava/lang/String;)Lzo/l;

    move-result-object v0

    new-instance v1, Lgd/c;

    const/4 v2, 0x0

    invoke-direct {v1, v0, p0, p1, v2}, Lgd/c;-><init>(Lzo/l;Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;Ljava/lang/String;I)V

    return-object v1
.end method

.method public final refreshHotFlashModeSettings(Ljava/lang/String;)Lzo/l;
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

    invoke-virtual {p0}, Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;->getApi()Lfd/b;

    move-result-object v0

    new-instance v1, Lgd/g;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lgd/g;-><init>(Ljava/lang/String;LLm/c;)V

    const/4 v3, 0x3

    invoke-static {p0, v0, v2, v1, v3}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object v0

    new-instance v1, Lgd/c;

    const/4 v2, 0x1

    invoke-direct {v1, v0, p1, p0, v2}, Lgd/c;-><init>(Lzo/l;Ljava/lang/String;Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;I)V

    return-object v1
.end method

.method public final removeHotFlashModeSettings(Ljava/lang/String;)Lzo/l;
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

    invoke-virtual {p0}, Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;->getApi()Lfd/b;

    move-result-object v0

    new-instance v1, Lgd/i;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lgd/i;-><init>(Ljava/lang/String;LLm/c;)V

    const/4 v3, 0x3

    invoke-static {p0, v0, v2, v1, v3}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object v0

    new-instance v1, Lgd/c;

    const/4 v2, 0x2

    invoke-direct {v1, v0, p0, p1, v2}, Lgd/c;-><init>(Lzo/l;Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;Ljava/lang/String;I)V

    return-object v1
.end method

.method public final updateHotFlashModeSettings(Ljava/lang/String;Ljd/c;)Lzo/l;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljd/c;",
            ")",
            "Lzo/l;"
        }
    .end annotation

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "settingsUpdate"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;->getApi()Lfd/b;

    move-result-object v0

    new-instance v1, Lgd/k;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, v2}, Lgd/k;-><init>(Ljava/lang/String;Ljd/c;LLm/c;)V

    const/4 p2, 0x3

    invoke-static {p0, v0, v2, v1, p2}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object p2

    new-instance v0, Lgd/c;

    const/4 v1, 0x3

    invoke-direct {v0, p2, p1, p0, v1}, Lgd/c;-><init>(Lzo/l;Ljava/lang/String;Lcom/eightsleep/data_temperature/data/repository/HotFlashModeRepository;I)V

    return-object v0
.end method
