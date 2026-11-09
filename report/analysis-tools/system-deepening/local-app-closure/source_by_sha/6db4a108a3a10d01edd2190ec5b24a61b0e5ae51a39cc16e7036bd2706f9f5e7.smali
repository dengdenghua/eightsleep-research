.class public final Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;
.super LL8/m;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "LL8/m;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0098\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0003\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001BY\u0008\u0007\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\u0008\u0012\u0006\u0010\u000b\u001a\u00020\n\u0012\u0006\u0010\r\u001a\u00020\u000c\u0012\u0006\u0010\u000f\u001a\u00020\u000e\u0012\u0006\u0010\u0011\u001a\u00020\u0010\u0012\u0006\u0010\u0013\u001a\u00020\u0012\u0012\u0006\u0010\u0015\u001a\u00020\u0014\u0012\u0006\u0010\u0017\u001a\u00020\u0016\u00a2\u0006\u0004\u0008\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0002\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ\u0017\u0010\u001f\u001a\u00020\u001a2\u0006\u0010\u001e\u001a\u00020\u001dH\u0002\u00a2\u0006\u0004\u0008\u001f\u0010 J\u0017\u0010%\u001a\u00020\u001a2\u0006\u0010\"\u001a\u00020!H\u0002\u00a2\u0006\u0004\u0008#\u0010$J+\u0010+\u001a\u00020\u001a2\u0006\u0010\'\u001a\u00020&2\u0012\u0010*\u001a\u000e\u0012\u0004\u0012\u00020)\u0012\u0004\u0012\u00020\u001a0(H\u0002\u00a2\u0006\u0004\u0008+\u0010,J\u0017\u0010.\u001a\u00020\u001a2\u0006\u0010-\u001a\u00020\u0002H\u0002\u00a2\u0006\u0004\u0008.\u0010/J\u000f\u00100\u001a\u00020\u001aH\u0002\u00a2\u0006\u0004\u00080\u0010\u001cJ\u0011\u00102\u001a\u0004\u0018\u000101H\u0002\u00a2\u0006\u0004\u00082\u00103J\u0017\u00106\u001a\u00020\u001a2\u0006\u00105\u001a\u000204H\u0014\u00a2\u0006\u0004\u00086\u00107J\u0017\u00109\u001a\u00020\u001a2\u0006\u00108\u001a\u00020\u0003H\u0016\u00a2\u0006\u0004\u00089\u0010:J\u000f\u0010<\u001a\u00020;H\u0016\u00a2\u0006\u0004\u0008<\u0010=R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0005\u0010>R\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0007\u0010?R\u0014\u0010\t\u001a\u00020\u00088\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\t\u0010@R\u0014\u0010\u000b\u001a\u00020\n8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000b\u0010AR\u0018\u0010C\u001a\u0004\u0018\u00010B8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008C\u0010D\u00a8\u0006E"
    }
    d2 = {
        "Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;",
        "LL8/m;",
        "LDi/b;",
        "LCi/e;",
        "Lld/F;",
        "getHotFlashModeSettingsUseCase",
        "Lld/U0;",
        "updateHotFlashModeSettingsUseCase",
        "Lld/q0;",
        "removeHotFlashModeSettingsUseCase",
        "LFd/i1;",
        "observeUserTapSettingsUseCase",
        "LRb/S;",
        "observeHouseholdSummaryFlowUseCase",
        "LJa/t;",
        "observeSelectedUserIdUseCase",
        "LJa/p;",
        "observeSelectedDeviceSetIdUseCase",
        "LJa/r;",
        "observeSelectedDeviceTypeUseCase",
        "LWc/b;",
        "featureFlags",
        "LRc/b;",
        "analytics",
        "<init>",
        "(Lld/F;Lld/U0;Lld/q0;LFd/i1;LRb/S;LJa/t;LJa/p;LJa/r;LWc/b;LRc/b;)V",
        "LHm/B;",
        "getDeviceTapSettings",
        "()V",
        "",
        "enabled",
        "toggleEnabledState",
        "(Z)V",
        "Lmo/b;",
        "duration",
        "handleHotFlashModeDurationChanged-LRDsOJo",
        "(J)V",
        "handleHotFlashModeDurationChanged",
        "Ljd/c;",
        "settings",
        "Lkotlin/Function1;",
        "",
        "onError",
        "updateSettings",
        "(Ljd/c;LVm/k;)V",
        "previous",
        "removeHotFlashModeSettings",
        "(LDi/b;)V",
        "handleHotFlashModeTapToControlClicked",
        "LQb/l;",
        "getSelectedPod",
        "()LQb/l;",
        "LQb/j;",
        "household",
        "onHouseholdUpdated",
        "(LQb/j;)V",
        "action",
        "onUiAction",
        "(LCi/e;)V",
        "LY7/n;",
        "getInitialViewState",
        "()LY7/n;",
        "Lld/F;",
        "Lld/U0;",
        "Lld/q0;",
        "LFd/i1;",
        "Lwo/h0;",
        "updateHotFlashModeSettingsJob",
        "Lwo/h0;",
        "presentation-temperature_tencentRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final $stable:I = 0x8


# instance fields
.field private final getHotFlashModeSettingsUseCase:Lld/F;

.field private final observeUserTapSettingsUseCase:LFd/i1;

.field private final removeHotFlashModeSettingsUseCase:Lld/q0;

.field private updateHotFlashModeSettingsJob:Lwo/h0;

.field private final updateHotFlashModeSettingsUseCase:Lld/U0;


# direct methods
.method public constructor <init>(Lld/F;Lld/U0;Lld/q0;LFd/i1;LRb/S;LJa/t;LJa/p;LJa/r;LWc/b;LRc/b;)V
    .locals 7

    const-string v0, "getHotFlashModeSettingsUseCase"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "updateHotFlashModeSettingsUseCase"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "removeHotFlashModeSettingsUseCase"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "observeUserTapSettingsUseCase"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "observeHouseholdSummaryFlowUseCase"

    move-object v1, p5

    invoke-static {p5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "observeSelectedUserIdUseCase"

    move-object v2, p6

    invoke-static {p6, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "observeSelectedDeviceSetIdUseCase"

    move-object v3, p7

    invoke-static {p7, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "observeSelectedDeviceTypeUseCase"

    move-object v4, p8

    invoke-static {p8, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "featureFlags"

    move-object/from16 v5, p9

    invoke-static {v5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "analytics"

    move-object/from16 v6, p10

    invoke-static {v6, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, LL8/m;-><init>(LRb/S;LJa/t;LJa/p;LJa/r;LWc/b;LRc/b;)V

    iput-object p1, p0, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->getHotFlashModeSettingsUseCase:Lld/F;

    iput-object p2, p0, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->updateHotFlashModeSettingsUseCase:Lld/U0;

    iput-object p3, p0, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->removeHotFlashModeSettingsUseCase:Lld/q0;

    iput-object p4, p0, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->observeUserTapSettingsUseCase:LFd/i1;

    invoke-static {p0}, Landroidx/lifecycle/V;->h(Landroidx/lifecycle/b0;)Li3/a;

    move-result-object v1

    new-instance v2, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel$1;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel$1;-><init>(Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;LLm/c;)V

    const/4 v0, 0x3

    invoke-static {v1, v3, v3, v2, v0}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    return-void
.end method

.method public static final synthetic access$getGetHotFlashModeSettingsUseCase$p(Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;)Lld/F;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->getHotFlashModeSettingsUseCase:Lld/F;

    return-object p0
.end method

.method public static final synthetic access$getObserveUserTapSettingsUseCase$p(Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;)LFd/i1;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->observeUserTapSettingsUseCase:LFd/i1;

    return-object p0
.end method

.method public static final synthetic access$getRemoveHotFlashModeSettingsUseCase$p(Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;)Lld/q0;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->removeHotFlashModeSettingsUseCase:Lld/q0;

    return-object p0
.end method

.method public static final synthetic access$getSelectedUserId(Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0}, LL8/m;->getSelectedUserId()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$getUpdateHotFlashModeSettingsUseCase$p(Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;)Lld/U0;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->updateHotFlashModeSettingsUseCase:Lld/U0;

    return-object p0
.end method

.method public static synthetic c(Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;Lkotlin/jvm/internal/A;Ljava/lang/Throwable;)LHm/B;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->handleHotFlashModeDurationChanged_LRDsOJo$lambda$8$lambda$7(Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;Lkotlin/jvm/internal/A;Ljava/lang/Throwable;)LHm/B;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;Lkotlin/jvm/internal/A;Ljava/lang/Throwable;)LHm/B;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->toggleEnabledState$lambda$4$lambda$3(Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;Lkotlin/jvm/internal/A;Ljava/lang/Throwable;)LHm/B;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Lkotlin/jvm/internal/A;LDi/b;)LDi/b;
    .locals 0

    invoke-static {p0, p1}, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->handleHotFlashModeDurationChanged_LRDsOJo$lambda$8$lambda$7$lambda$6(Lkotlin/jvm/internal/A;LDi/b;)LDi/b;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f(Lkotlin/jvm/internal/A;LDi/b;)LDi/b;
    .locals 0

    invoke-static {p0, p1}, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->toggleEnabledState$lambda$4$lambda$3$lambda$2(Lkotlin/jvm/internal/A;LDi/b;)LDi/b;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g(ZLDi/b;)LDi/b;
    .locals 0

    invoke-static {p0, p1}, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->toggleEnabledState$lambda$4$lambda$1(ZLDi/b;)LDi/b;

    move-result-object p0

    return-object p0
.end method

.method private final getDeviceTapSettings()V
    .locals 4

    invoke-direct {p0}, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->getSelectedPod()LQb/l;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Landroidx/lifecycle/V;->h(Landroidx/lifecycle/b0;)Li3/a;

    move-result-object v1

    new-instance v2, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel$getDeviceTapSettings$1$1;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v0, v3}, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel$getDeviceTapSettings$1$1;-><init>(Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;LQb/l;LLm/c;)V

    const/4 p0, 0x3

    invoke-static {v1, v3, v3, v2, p0}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    :cond_0
    return-void
.end method

.method private final getSelectedPod()LQb/l;
    .locals 1

    invoke-virtual {p0}, LL8/m;->getSelectedDeviceSet()LQb/e;

    move-result-object p0

    if-eqz p0, :cond_0

    sget-object v0, Lcom/eightsleep/data_core/enums/DeviceType;->POD:Lcom/eightsleep/data_core/enums/DeviceType;

    invoke-virtual {p0, v0}, LQb/e;->d(Lcom/eightsleep/data_core/enums/DeviceType;)LQb/l;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static synthetic h(JLDi/b;)LDi/b;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->handleHotFlashModeDurationChanged_LRDsOJo$lambda$8$lambda$5(JLDi/b;)LDi/b;

    move-result-object p0

    return-object p0
.end method

.method private final handleHotFlashModeDurationChanged-LRDsOJo(J)V
    .locals 7

    invoke-virtual {p0}, LL8/m;->getSelectedUserId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    new-instance v6, Lkotlin/jvm/internal/A;

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0}, LL8/e;->getUiModel()Ld8/k;

    move-result-object v0

    iput-object v0, v6, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    new-instance v0, LKe/c;

    const/16 v2, 0xb

    invoke-direct {v0, p1, p2, v2}, LKe/c;-><init>(JI)V

    const/4 v2, 0x1

    invoke-static {p0, v0, v2}, Landroid/support/v4/media/session/b;->I(LY7/o;LVm/k;I)V

    iget-object v0, v6, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    check-cast v0, LDi/b;

    iget-object v2, v0, LDi/b;->c:Ljava/lang/String;

    invoke-static {v2}, LP2/c;->L(Ljava/lang/String;)J

    move-result-wide v3

    move-object v2, v0

    new-instance v0, Ljd/c;

    move-object v5, v2

    iget-boolean v2, v5, LDi/b;->a:Z

    iget-object v5, v5, LDi/b;->b:LGa/b;

    invoke-direct/range {v0 .. v5}, Ljd/c;-><init>(Ljava/lang/String;ZJLGa/b;)V

    const/16 v1, 0xb

    const/4 v2, 0x0

    invoke-static {v0, p1, p2, v2, v1}, Ljd/c;->a(Ljd/c;JLGa/b;I)Ljd/c;

    move-result-object p1

    new-instance p2, Lcom/eightsleep/presentation_temperature/viewmodel/a;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v6, v0}, Lcom/eightsleep/presentation_temperature/viewmodel/a;-><init>(Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;Lkotlin/jvm/internal/A;I)V

    invoke-direct {p0, p1, p2}, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->updateSettings(Ljd/c;LVm/k;)V

    :cond_0
    return-void
.end method

.method private static final handleHotFlashModeDurationChanged_LRDsOJo$lambda$8$lambda$5(JLDi/b;)LDi/b;
    .locals 2

    const-string v0, "model"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0, p1}, Lbn/J;->R(J)Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x0

    const/4 v0, 0x0

    const/16 v1, 0xb

    invoke-static {p2, p1, p0, v0, v1}, LDi/b;->u(LDi/b;ZLjava/lang/String;LDi/a;I)LDi/b;

    move-result-object p0

    return-object p0
.end method

.method private static final handleHotFlashModeDurationChanged_LRDsOJo$lambda$8$lambda$7(Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;Lkotlin/jvm/internal/A;Ljava/lang/Throwable;)LHm/B;
    .locals 1

    const-string v0, "it"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p2, Lcom/eightsleep/presentation_temperature/viewmodel/b;

    const/4 v0, 0x1

    invoke-direct {p2, p1, v0}, Lcom/eightsleep/presentation_temperature/viewmodel/b;-><init>(Lkotlin/jvm/internal/A;I)V

    const/4 p1, 0x1

    const/4 v0, 0x0

    invoke-static {p0, v0, p2, p1}, Landroid/support/v4/media/session/b;->J(LY7/o;Ljava/lang/String;LVm/k;I)V

    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0
.end method

.method private static final handleHotFlashModeDurationChanged_LRDsOJo$lambda$8$lambda$7$lambda$6(Lkotlin/jvm/internal/A;LDi/b;)LDi/b;
    .locals 1

    const-string v0, "it"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    check-cast p0, LDi/b;

    return-object p0
.end method

.method private final handleHotFlashModeTapToControlClicked()V
    .locals 7

    invoke-direct {p0}, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->getSelectedPod()LQb/l;

    move-result-object v0

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    new-instance v3, Lcom/eightsleep/corepresentation/navigation/route/Route$SettingsMenuBottomSheet;

    sget-object v4, Lcom/eightsleep/data_device/enums/DeviceFeature;->BUTTON_CONTROLS:Lcom/eightsleep/data_device/enums/DeviceFeature;

    iget-object v5, v0, LQb/l;->A:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    iget-object v0, v0, LQb/l;->a:Ljava/lang/String;

    if-eqz v4, :cond_0

    new-instance v4, Lcom/eightsleep/corepresentation/navigation/route/SettingsMenuBottomSheetRoute$DeviceSettingsButtonControl;

    invoke-virtual {p0}, LL8/m;->getSelectedUserId()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lcom/eightsleep/corepresentation/enums/ButtonControlTab;->CENTER:Lcom/eightsleep/corepresentation/enums/ButtonControlTab;

    invoke-direct {v4, v0, v5, v6}, Lcom/eightsleep/corepresentation/navigation/route/SettingsMenuBottomSheetRoute$DeviceSettingsButtonControl;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/corepresentation/enums/ButtonControlTab;)V

    goto :goto_0

    :cond_0
    new-instance v4, Lcom/eightsleep/corepresentation/navigation/route/SettingsMenuBottomSheetRoute$DeviceSettingsTapToControl;

    invoke-virtual {p0}, LL8/m;->getSelectedUserId()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lcom/eightsleep/corepresentation/enums/TapToControlTab;->ENVIRONMENT:Lcom/eightsleep/corepresentation/enums/TapToControlTab;

    invoke-direct {v4, v0, v5, v6}, Lcom/eightsleep/corepresentation/navigation/route/SettingsMenuBottomSheetRoute$DeviceSettingsTapToControl;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/corepresentation/enums/TapToControlTab;)V

    :goto_0
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Lcom/eightsleep/corepresentation/navigation/route/Route$SettingsMenuBottomSheet;-><init>(Ljava/lang/String;)V

    const/4 v0, 0x0

    invoke-static {p0, v3, v0, v1, v2}, LL8/e;->goTo$default(LL8/e;Lcom/eightsleep/corepresentation/navigation/route/NavRoute;ZILjava/lang/Object;)V

    return-void

    :cond_1
    const v0, 0x7f12062a

    invoke-static {p0, v0, v2, v1, v2}, LL8/e;->toast$default(LL8/e;ILjava/lang/Integer;ILjava/lang/Object;)V

    return-void
.end method

.method private final removeHotFlashModeSettings(LDi/b;)V
    .locals 3

    invoke-static {p0}, Landroidx/lifecycle/V;->h(Landroidx/lifecycle/b0;)Li3/a;

    move-result-object v0

    new-instance v1, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel$removeHotFlashModeSettings$1;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel$removeHotFlashModeSettings$1;-><init>(Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;LDi/b;LLm/c;)V

    const/4 p0, 0x3

    invoke-static {v0, v2, v2, v1, p0}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    return-void
.end method

.method private final toggleEnabledState(Z)V
    .locals 7

    invoke-virtual {p0}, LL8/m;->getSelectedUserId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    new-instance v6, Lkotlin/jvm/internal/A;

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0}, LL8/e;->getUiModel()Ld8/k;

    move-result-object v0

    iput-object v0, v6, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    new-instance v0, Lcom/eightsleep/presentation_temperature/viewmodel/g;

    const/4 v2, 0x2

    invoke-direct {v0, p1, v2}, Lcom/eightsleep/presentation_temperature/viewmodel/g;-><init>(ZI)V

    const/4 v2, 0x1

    invoke-static {p0, v0, v2}, Landroid/support/v4/media/session/b;->I(LY7/o;LVm/k;I)V

    if-eqz p1, :cond_0

    iget-object p1, v6, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    check-cast p1, LDi/b;

    iget-object v0, p1, LDi/b;->c:Ljava/lang/String;

    invoke-static {v0}, LP2/c;->L(Ljava/lang/String;)J

    move-result-wide v3

    new-instance v0, Ljd/c;

    iget-boolean v2, p1, LDi/b;->a:Z

    iget-object v5, p1, LDi/b;->b:LGa/b;

    invoke-direct/range {v0 .. v5}, Ljd/c;-><init>(Ljava/lang/String;ZJLGa/b;)V

    const-wide/16 v1, 0x0

    const/4 p1, 0x0

    const/16 v3, 0xd

    invoke-static {v0, v1, v2, p1, v3}, Ljd/c;->a(Ljd/c;JLGa/b;I)Ljd/c;

    move-result-object p1

    new-instance v0, Lcom/eightsleep/presentation_temperature/viewmodel/a;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v6, v1}, Lcom/eightsleep/presentation_temperature/viewmodel/a;-><init>(Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;Lkotlin/jvm/internal/A;I)V

    invoke-direct {p0, p1, v0}, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->updateSettings(Ljd/c;LVm/k;)V

    return-void

    :cond_0
    iget-object p1, v6, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    check-cast p1, LDi/b;

    invoke-direct {p0, p1}, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->removeHotFlashModeSettings(LDi/b;)V

    :cond_1
    return-void
.end method

.method private static final toggleEnabledState$lambda$4$lambda$1(ZLDi/b;)LDi/b;
    .locals 2

    const-string v0, "it"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v0, 0xe

    const/4 v1, 0x0

    invoke-static {p1, p0, v1, v1, v0}, LDi/b;->u(LDi/b;ZLjava/lang/String;LDi/a;I)LDi/b;

    move-result-object p0

    return-object p0
.end method

.method private static final toggleEnabledState$lambda$4$lambda$3(Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;Lkotlin/jvm/internal/A;Ljava/lang/Throwable;)LHm/B;
    .locals 1

    const-string v0, "it"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p2, Lcom/eightsleep/presentation_temperature/viewmodel/b;

    const/4 v0, 0x0

    invoke-direct {p2, p1, v0}, Lcom/eightsleep/presentation_temperature/viewmodel/b;-><init>(Lkotlin/jvm/internal/A;I)V

    const/4 p1, 0x1

    const/4 v0, 0x0

    invoke-static {p0, v0, p2, p1}, Landroid/support/v4/media/session/b;->J(LY7/o;Ljava/lang/String;LVm/k;I)V

    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0
.end method

.method private static final toggleEnabledState$lambda$4$lambda$3$lambda$2(Lkotlin/jvm/internal/A;LDi/b;)LDi/b;
    .locals 1

    const-string v0, "it"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lkotlin/jvm/internal/A;->a:Ljava/lang/Object;

    check-cast p0, LDi/b;

    return-object p0
.end method

.method private final updateSettings(Ljd/c;LVm/k;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljd/c;",
            "LVm/k;",
            ")V"
        }
    .end annotation

    iget-object v0, p0, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->updateHotFlashModeSettingsJob:Lwo/h0;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-interface {v0, v1}, Lwo/h0;->b(Ljava/util/concurrent/CancellationException;)V

    :cond_0
    invoke-static {p0}, Landroidx/lifecycle/V;->h(Landroidx/lifecycle/b0;)Li3/a;

    move-result-object v0

    new-instance v2, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel$updateSettings$1;

    invoke-direct {v2, p0, p1, p2, v1}, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel$updateSettings$1;-><init>(Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;Ljd/c;LVm/k;LLm/c;)V

    const/4 p1, 0x3

    invoke-static {v0, v1, v1, v2, p1}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    move-result-object p1

    iput-object p1, p0, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->updateHotFlashModeSettingsJob:Lwo/h0;

    return-void
.end method


# virtual methods
.method public getInitialViewState()LY7/n;
    .locals 4

    new-instance p0, LY7/i;

    new-instance v0, LDi/b;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/16 v3, 0xf

    invoke-direct {v0, v1, v2, v2, v3}, LDi/b;-><init>(ZLGa/b;Ljava/lang/String;I)V

    invoke-direct {p0, v0}, LY7/i;-><init>(Ld8/k;)V

    return-object p0
.end method

.method public onHouseholdUpdated(LQb/j;)V
    .locals 1

    const-string v0, "household"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->getDeviceTapSettings()V

    return-void
.end method

.method public onUiAction(LCi/e;)V
    .locals 2

    const-string v0, "action"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    sget-object v0, LRc/A;->a:LRc/A;

    invoke-virtual {p0, p1, v0}, LL8/e;->logUiActionEvent(LZ7/c;LRc/B;)V

    .line 3
    instance-of v0, p1, LCi/d;

    if-eqz v0, :cond_0

    .line 4
    check-cast p1, LCi/d;

    .line 5
    iget-boolean p1, p1, LCi/d;->a:Z

    invoke-direct {p0, p1}, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->toggleEnabledState(Z)V

    return-void

    .line 6
    :cond_0
    instance-of v0, p1, LCi/b;

    if-eqz v0, :cond_1

    .line 7
    check-cast p1, LCi/b;

    .line 8
    iget-wide v0, p1, LCi/b;->a:J

    invoke-direct {p0, v0, v1}, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->handleHotFlashModeDurationChanged-LRDsOJo(J)V

    return-void

    .line 9
    :cond_1
    instance-of v0, p1, LCi/c;

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->handleHotFlashModeTapToControlClicked()V

    return-void

    .line 10
    :cond_2
    instance-of p0, p1, LCi/a;

    if-eqz p0, :cond_3

    return-void

    .line 11
    :cond_3
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0
.end method

.method public bridge synthetic onUiAction(LZ7/c;)V
    .locals 0

    .line 1
    check-cast p1, LCi/e;

    invoke-virtual {p0, p1}, Lcom/eightsleep/presentation_temperature/viewmodel/HotFlashModeSettingsViewModel;->onUiAction(LCi/e;)V

    return-void
.end method
