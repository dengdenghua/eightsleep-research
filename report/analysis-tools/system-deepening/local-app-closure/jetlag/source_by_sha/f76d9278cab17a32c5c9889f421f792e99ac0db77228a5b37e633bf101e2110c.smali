.class public final Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;
.super LL8/e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$Factory;,
        Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "LL8/e;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00b6\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001ZBK\u0008\u0007\u0012\u0008\u0008\u0001\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\u0008\u0012\u0006\u0010\u000b\u001a\u00020\n\u0012\u0006\u0010\r\u001a\u00020\u000c\u0012\u0006\u0010\u000f\u001a\u00020\u000e\u0012\u0006\u0010\u0011\u001a\u00020\u0010\u0012\u0006\u0010\u0013\u001a\u00020\u0012\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u000f\u0010\u0017\u001a\u00020\u0016H\u0016\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u0017\u0010\u001b\u001a\u00020\u001a2\u0006\u0010\u0019\u001a\u00020\u0003H\u0016\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ\u0017\u0010\u001f\u001a\u00020\u001a2\u0006\u0010\u001e\u001a\u00020\u001dH\u0016\u00a2\u0006\u0004\u0008\u001f\u0010 J%\u0010%\u001a\u00020\u001a2\u0006\u0010!\u001a\u00020\u00042\u000c\u0010$\u001a\u0008\u0012\u0004\u0012\u00020#0\"H\u0002\u00a2\u0006\u0004\u0008%\u0010&J\u0017\u0010\'\u001a\u00020\u001a2\u0006\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\'\u0010(J\u0017\u0010)\u001a\u00020\u001a2\u0006\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008)\u0010(J\u0017\u0010*\u001a\u00020\u001a2\u0006\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008*\u0010(J9\u0010/\u001a\u00020\u001a2\u0006\u0010!\u001a\u00020\u00042\u000c\u0010$\u001a\u0008\u0012\u0004\u0012\u00020#0\"2\u0006\u0010,\u001a\u00020+2\n\u0008\u0002\u0010.\u001a\u0004\u0018\u00010-H\u0002\u00a2\u0006\u0004\u0008/\u00100J\u000f\u00101\u001a\u00020\u001aH\u0002\u00a2\u0006\u0004\u00081\u00102J\u0019\u00104\u001a\u00020\u00042\u0008\u00103\u001a\u0004\u0018\u00010-H\u0002\u00a2\u0006\u0004\u00084\u00105J%\u0010;\u001a\u0008\u0012\u0004\u0012\u00020:0\"2\u0006\u00107\u001a\u0002062\u0006\u00109\u001a\u000208H\u0002\u00a2\u0006\u0004\u0008;\u0010<J\u001f\u0010>\u001a\u00020\u00042\u0006\u0010=\u001a\u00020-2\u0006\u00107\u001a\u000206H\u0002\u00a2\u0006\u0004\u0008>\u0010?J/\u0010C\u001a\u001a\u0012\u0004\u0012\u00020A\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020B0\"0\"0@2\u0006\u00109\u001a\u000208H\u0002\u00a2\u0006\u0004\u0008C\u0010DJ\u0017\u0010E\u001a\u00020\u001a2\u0006\u00107\u001a\u000206H\u0002\u00a2\u0006\u0004\u0008E\u0010FJ\u0017\u0010I\u001a\u00020\u00042\u0006\u0010H\u001a\u00020GH\u0002\u00a2\u0006\u0004\u0008I\u0010JJ\u0017\u0010N\u001a\u00020M2\u0006\u0010L\u001a\u00020KH\u0002\u00a2\u0006\u0004\u0008N\u0010OR\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0005\u0010PR\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0007\u0010QR\u0014\u0010\t\u001a\u00020\u00088\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\t\u0010RR\u0014\u0010\u000b\u001a\u00020\n8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000b\u0010SR\u0014\u0010\r\u001a\u00020\u000c8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\r\u0010TR\u0014\u0010\u000f\u001a\u00020\u000e8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000f\u0010UR\u0014\u0010\u0011\u001a\u00020\u00108\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0011\u0010VR\u0018\u0010X\u001a\u0004\u0018\u00010W8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008X\u0010Y\u00a8\u0006["
    }
    d2 = {
        "Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;",
        "LL8/e;",
        "Lng/e;",
        "Lkg/i;",
        "",
        "tripId",
        "Lxd/D;",
        "observeDisplaySettingsUseCase",
        "Lhc/A;",
        "getTripByIdUseCase",
        "Lhc/S;",
        "toggleJetLagTaskCompletionUseCase",
        "Lhc/K;",
        "observeJetLagPlanUseCase",
        "Lhc/k;",
        "deleteTripUseCase",
        "Lhc/W;",
        "updateTripUseCase",
        "LRc/b;",
        "analytics",
        "<init>",
        "(Ljava/lang/String;Lxd/D;Lhc/A;Lhc/S;Lhc/K;Lhc/k;Lhc/W;LRc/b;)V",
        "LY7/n;",
        "getInitialViewState",
        "()LY7/n;",
        "action",
        "LHm/B;",
        "onUiAction",
        "(Lkg/i;)V",
        "Landroidx/lifecycle/v;",
        "owner",
        "onCreate",
        "(Landroidx/lifecycle/v;)V",
        "planId",
        "",
        "Lng/h;",
        "tasks",
        "showSupplementTaskConfirmationDialog",
        "(Ljava/lang/String;Ljava/util/List;)V",
        "showEndTripConfirmationDialog",
        "(Ljava/lang/String;)V",
        "endTrip",
        "deleteTrip",
        "",
        "isComplete",
        "",
        "supplementCount",
        "onTaskCompletionToggled",
        "(Ljava/lang/String;Ljava/util/List;ZLjava/lang/Integer;)V",
        "getPlanAndTasks",
        "()V",
        "offsetHours",
        "formatTimezoneOffset",
        "(Ljava/lang/Integer;)Ljava/lang/String;",
        "Lgc/o;",
        "trip",
        "Lgc/c;",
        "plan",
        "Lng/g;",
        "mapPlanToUiModel",
        "(Lgc/o;Lgc/c;)Ljava/util/List;",
        "flightNumber",
        "getFormattedFlightCardLocationLabel",
        "(ILgc/o;)Ljava/lang/String;",
        "",
        "Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;",
        "Lgc/e;",
        "groupTasksByPhaseAndDate",
        "(Lgc/c;)Ljava/util/Map;",
        "pollTimeAtDestination",
        "(Lgc/o;)V",
        "Ljava/time/LocalDateTime;",
        "departureDate",
        "formatTimeUntilDeparture",
        "(Ljava/time/LocalDateTime;)Ljava/lang/String;",
        "Lgc/q;",
        "destination",
        "LGa/s;",
        "calculateTimeAtDestination",
        "(Lgc/q;)LGa/s;",
        "Ljava/lang/String;",
        "Lxd/D;",
        "Lhc/A;",
        "Lhc/S;",
        "Lhc/K;",
        "Lhc/k;",
        "Lhc/W;",
        "LGa/f;",
        "displaySettings",
        "LGa/f;",
        "Factory",
        "presentation-jetlag_tencentRelease"
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
.field private final deleteTripUseCase:Lhc/k;

.field private displaySettings:LGa/f;

.field private final getTripByIdUseCase:Lhc/A;

.field private final observeDisplaySettingsUseCase:Lxd/D;

.field private final observeJetLagPlanUseCase:Lhc/K;

.field private final toggleJetLagTaskCompletionUseCase:Lhc/S;

.field private final tripId:Ljava/lang/String;

.field private final updateTripUseCase:Lhc/W;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lxd/D;Lhc/A;Lhc/S;Lhc/K;Lhc/k;Lhc/W;LRc/b;)V
    .locals 1

    const-string v0, "tripId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "observeDisplaySettingsUseCase"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "getTripByIdUseCase"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "toggleJetLagTaskCompletionUseCase"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "observeJetLagPlanUseCase"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "deleteTripUseCase"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "updateTripUseCase"

    invoke-static {p7, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "analytics"

    invoke-static {p8, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, p8}, LL8/e;-><init>(LRc/b;)V

    iput-object p1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->tripId:Ljava/lang/String;

    iput-object p2, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->observeDisplaySettingsUseCase:Lxd/D;

    iput-object p3, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->getTripByIdUseCase:Lhc/A;

    iput-object p4, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->toggleJetLagTaskCompletionUseCase:Lhc/S;

    iput-object p5, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->observeJetLagPlanUseCase:Lhc/K;

    iput-object p6, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->deleteTripUseCase:Lhc/k;

    iput-object p7, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->updateTripUseCase:Lhc/W;

    invoke-static {p0}, Landroidx/lifecycle/V;->h(Landroidx/lifecycle/b0;)Li3/a;

    move-result-object p1

    new-instance p2, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$1;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$1;-><init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;LLm/c;)V

    const/4 p0, 0x3

    invoke-static {p1, p3, p3, p2, p0}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    return-void
.end method

.method public static final synthetic access$calculateTimeAtDestination(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Lgc/q;)LGa/s;
    .locals 0

    invoke-direct {p0, p1}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->calculateTimeAtDestination(Lgc/q;)LGa/s;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$formatTimeUntilDeparture(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/time/LocalDateTime;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->formatTimeUntilDeparture(Ljava/time/LocalDateTime;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$formatTimezoneOffset(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/lang/Integer;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->formatTimezoneOffset(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$getDeleteTripUseCase$p(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;)Lhc/k;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->deleteTripUseCase:Lhc/k;

    return-object p0
.end method

.method public static final synthetic access$getDisplaySettings$p(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;)LGa/f;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->displaySettings:LGa/f;

    return-object p0
.end method

.method public static final synthetic access$getGetTripByIdUseCase$p(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;)Lhc/A;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->getTripByIdUseCase:Lhc/A;

    return-object p0
.end method

.method public static final synthetic access$getObserveDisplaySettingsUseCase$p(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;)Lxd/D;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->observeDisplaySettingsUseCase:Lxd/D;

    return-object p0
.end method

.method public static final synthetic access$getObserveJetLagPlanUseCase$p(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;)Lhc/K;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->observeJetLagPlanUseCase:Lhc/K;

    return-object p0
.end method

.method public static final synthetic access$getToggleJetLagTaskCompletionUseCase$p(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;)Lhc/S;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->toggleJetLagTaskCompletionUseCase:Lhc/S;

    return-object p0
.end method

.method public static final synthetic access$getTripId$p(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->tripId:Ljava/lang/String;

    return-object p0
.end method

.method public static final synthetic access$getUpdateTripUseCase$p(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;)Lhc/W;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->updateTripUseCase:Lhc/W;

    return-object p0
.end method

.method public static final synthetic access$mapPlanToUiModel(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Lgc/o;Lgc/c;)Ljava/util/List;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->mapPlanToUiModel(Lgc/o;Lgc/c;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$pollTimeAtDestination(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Lgc/o;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->pollTimeAtDestination(Lgc/o;)V

    return-void
.end method

.method public static final synthetic access$setDisplaySettings$p(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;LGa/f;)V
    .locals 0

    iput-object p1, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->displaySettings:LGa/f;

    return-void
.end method

.method public static synthetic c(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/lang/String;)LHm/B;
    .locals 0

    invoke-static {p0, p1}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->showEndTripConfirmationDialog$lambda$4(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/lang/String;)LHm/B;

    move-result-object p0

    return-object p0
.end method

.method private final calculateTimeAtDestination(Lgc/q;)LGa/s;
    .locals 1

    sget-object v0, LGa/s;->c:LGa/s;

    iget-object p0, p0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->displaySettings:LGa/f;

    if-eqz p0, :cond_0

    iget-object p0, p0, LGa/f;->d:Lcom/eightsleep/data_core/enums/ClockSystem;

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    invoke-static {p0}, LDl/A0;->v(Lcom/eightsleep/data_core/enums/ClockSystem;)LGa/s;

    move-result-object p0

    iget-object p1, p1, Lgc/q;->c:Ljava/time/ZoneOffset;

    invoke-virtual {p0, p1}, LGa/s;->n(Ljava/time/ZoneOffset;)LGa/s;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Lkg/i;Lng/e;)Lng/e;
    .locals 0

    invoke-static {p0, p1}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->onUiAction$lambda$1(Lkg/i;Lng/e;)Lng/e;

    move-result-object p0

    return-object p0
.end method

.method private final deleteTrip(Ljava/lang/String;)V
    .locals 3

    invoke-static {p0}, Landroidx/lifecycle/V;->h(Landroidx/lifecycle/b0;)Li3/a;

    move-result-object v0

    new-instance v1, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$deleteTrip$1;-><init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/lang/String;LLm/c;)V

    const/4 p0, 0x3

    invoke-static {v0, v2, v2, v1, p0}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    return-void
.end method

.method public static synthetic e(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/lang/String;)LHm/B;
    .locals 0

    invoke-static {p0, p1}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->showEndTripConfirmationDialog$lambda$3(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/lang/String;)LHm/B;

    move-result-object p0

    return-object p0
.end method

.method private final endTrip(Ljava/lang/String;)V
    .locals 3

    invoke-static {p0}, Landroidx/lifecycle/V;->h(Landroidx/lifecycle/b0;)Li3/a;

    move-result-object v0

    new-instance v1, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$endTrip$1;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$endTrip$1;-><init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/lang/String;LLm/c;)V

    const/4 p0, 0x3

    invoke-static {v0, v2, v2, v1, p0}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    return-void
.end method

.method public static synthetic f(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/lang/String;Ljava/util/List;Lan/k;Lkotlin/jvm/internal/y;)LHm/B;
    .locals 0

    invoke-static {p0, p1, p2, p3, p4}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->showSupplementTaskConfirmationDialog$lambda$2(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/lang/String;Ljava/util/List;Lan/k;Lkotlin/jvm/internal/y;)LHm/B;

    move-result-object p0

    return-object p0
.end method

.method private final formatTimeUntilDeparture(Ljava/time/LocalDateTime;)Ljava/lang/String;
    .locals 5

    sget-object p0, Ljava/time/temporal/ChronoUnit;->HOURS:Ljava/time/temporal/ChronoUnit;

    invoke-static {}, Ljava/time/LocalDateTime;->now()Ljava/time/LocalDateTime;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Ljava/time/temporal/ChronoUnit;->between(Ljava/time/temporal/Temporal;Ljava/time/temporal/Temporal;)J

    move-result-wide p0

    const-wide/32 v0, -0x80000000

    cmp-long v0, v0, p0

    const-wide/16 v1, 0x1

    if-gtz v0, :cond_0

    cmp-long v0, p0, v1

    if-gez v0, :cond_0

    const-string p0, "In Flight"

    return-object p0

    :cond_0
    const-wide/16 v3, 0x0

    cmp-long v0, v3, p0

    if-gtz v0, :cond_1

    const-wide/16 v3, 0x2

    cmp-long v0, p0, v3

    if-gez v0, :cond_1

    const-string p0, "<1h"

    return-object p0

    :cond_1
    cmp-long v0, v1, p0

    if-gtz v0, :cond_2

    const-wide/16 v0, 0x31

    cmp-long v0, p0, v0

    if-gez v0, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, "h"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    const/16 v0, 0x18

    int-to-long v0, v0

    div-long/2addr p0, v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, " days"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private final formatTimezoneOffset(Ljava/lang/Integer;)Ljava/lang/String;
    .locals 2

    if-nez p1, :cond_0

    const-string p0, "+0h"

    return-object p0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p0

    const-string v0, "h"

    if-ltz p0, :cond_1

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "+"

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p0

    if-gez p0, :cond_2

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    const-string p0, ""

    return-object p0
.end method

.method public static synthetic g(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;)LHm/B;
    .locals 0

    invoke-static {p0}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->showEndTripConfirmationDialog$lambda$5(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;)LHm/B;

    move-result-object p0

    return-object p0
.end method

.method private final getFormattedFlightCardLocationLabel(ILgc/o;)Ljava/lang/String;
    .locals 2

    iget-object p0, p2, Lgc/o;->d:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    iget-object p2, p2, Lgc/o;->d:Ljava/util/ArrayList;

    const/4 v0, 0x1

    const-string v1, " - "

    if-le p0, v0, :cond_1

    if-ne p1, v0, :cond_0

    invoke-static {p2}, LIm/r;->Z0(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgc/p;

    iget-object p0, p0, Lgc/p;->b:Lgc/q;

    invoke-static {p2}, LIm/r;->Z0(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lgc/p;

    iget-object p2, p2, Lgc/p;->c:Lgc/q;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p0, p0, Lgc/q;->b:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p2, Lgc/q;->b:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    invoke-static {p2}, LIm/r;->k1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgc/p;

    iget-object p0, p0, Lgc/p;->b:Lgc/q;

    invoke-static {p2}, LIm/r;->k1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lgc/p;

    iget-object p2, p2, Lgc/p;->c:Lgc/q;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p0, p0, Lgc/q;->b:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p2, Lgc/q;->b:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_0
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "FLIGHT #"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ": "

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    invoke-static {p2}, LIm/r;->k1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgc/p;

    iget-object p0, p0, Lgc/p;->b:Lgc/q;

    invoke-static {p2}, LIm/r;->k1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lgc/p;

    iget-object p1, p1, Lgc/p;->c:Lgc/q;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p0, p0, Lgc/q;->b:Ljava/lang/String;

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p1, Lgc/q;->b:Ljava/lang/String;

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private final getPlanAndTasks()V
    .locals 3

    invoke-static {p0}, Landroidx/lifecycle/V;->h(Landroidx/lifecycle/b0;)Li3/a;

    move-result-object v0

    new-instance v1, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$getPlanAndTasks$1;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$getPlanAndTasks$1;-><init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;LLm/c;)V

    const/4 p0, 0x3

    invoke-static {v0, v2, v2, v1, p0}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    return-void
.end method

.method private final groupTasksByPhaseAndDate(Lgc/c;)Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgc/c;",
            ")",
            "Ljava/util/Map<",
            "Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lgc/e;",
            ">;>;>;"
        }
    .end annotation

    iget-object p0, p1, Lgc/c;->j:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lgc/e;

    iget-object v2, v2, Lgc/e;->e:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    sget-object v3, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;->PRE_FLIGHT:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    if-ne v2, v3, :cond_0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-static {v0}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->groupTasksByPhaseAndDate$groupByTaskDate(Ljava/util/List;)Ljava/util/SortedMap;

    move-result-object p0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object p1, p1, Lgc/c;->j:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lgc/e;

    iget-object v3, v3, Lgc/e;->e:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    sget-object v4, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;->IN_FLIGHT:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    if-ne v3, v4, :cond_2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_3
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lgc/e;

    iget-object v3, v3, Lgc/e;->j:Lgc/d;

    iget-object v3, v3, Lgc/d;->b:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_4

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    check-cast v4, Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_5
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_6
    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lgc/e;

    iget-object v3, v3, Lgc/e;->e:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    sget-object v4, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;->POST_FLIGHT:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    if-ne v3, v4, :cond_6

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_7
    invoke-static {v0}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->groupTasksByPhaseAndDate$groupPostFlights(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    sget-object v0, Ltimber/log/Timber;->a:Lbr/a;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Post flight tasks: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v2, v3}, Lbr/a;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sget-object v2, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;->PRE_FLIGHT:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    invoke-interface {p0}, Ljava/util/SortedMap;->values()Ljava/util/Collection;

    move-result-object p0

    const-string v3, "<get-values>(...)"

    invoke-static {p0, v3}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p0, Ljava/lang/Iterable;

    invoke-static {p0}, LIm/r;->T1(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {v0, v2, p0}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;->IN_FLIGHT:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v1}, LIm/r;->T1(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;->POST_FLIGHT:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    invoke-virtual {v0, p0, p1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method private static final groupTasksByPhaseAndDate$groupByTaskDate(Ljava/util/List;)Ljava/util/SortedMap;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lgc/e;",
            ">;)",
            "Ljava/util/SortedMap<",
            "Ljava/time/LocalDate;",
            "Ljava/util/List<",
            "Lgc/e;",
            ">;>;"
        }
    .end annotation

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lgc/e;

    iget-object v3, v2, Lgc/e;->f:LGa/s;

    iget-object v2, v2, Lgc/e;->g:Ljava/lang/String;

    invoke-static {v2}, Ljava/time/ZoneOffset;->of(Ljava/lang/String;)Ljava/time/ZoneOffset;

    move-result-object v2

    const-string v4, "of(...)"

    invoke-static {v2, v4}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v3, v2}, LGa/s;->n(Ljava/time/ZoneOffset;)LGa/s;

    move-result-object v2

    invoke-virtual {v2}, LGa/s;->k()Ljava/time/LocalDate;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_0

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    check-cast v3, Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    new-instance p0, Ljava/util/TreeMap;

    invoke-direct {p0, v0}, Ljava/util/TreeMap;-><init>(Ljava/util/Map;)V

    return-object p0
.end method

.method private static final groupTasksByPhaseAndDate$groupPostFlights(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lgc/e;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lgc/e;",
            ">;>;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lgc/e;

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v2, v2, Lgc/e;->d:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    sget-object v3, Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;->SLEEP:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    if-ne v2, v3, :cond_0

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private final mapPlanToUiModel(Lgc/o;Lgc/c;)Ljava/util/List;
    .locals 42
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgc/o;",
            "Lgc/c;",
            ")",
            "Ljava/util/List<",
            "Lng/g;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {}, Ljava/time/Instant;->now()Ljava/time/Instant;

    move-result-object v2

    move-object/from16 v3, p2

    invoke-direct {v0, v3}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->groupTasksByPhaseAndDate(Lgc/c;)Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    check-cast v3, Ljava/lang/Iterable;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v6, 0x0

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    new-instance v8, Ljava/util/ArrayList;

    const/16 v9, 0xa

    invoke-static {v7, v9}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v10

    invoke-direct {v8, v10}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    const/4 v11, 0x0

    const/4 v12, 0x1

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_1c

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    add-int/lit8 v14, v11, 0x1

    if-ltz v11, :cond_1b

    check-cast v13, Ljava/util/List;

    invoke-static {v13}, LIm/r;->Z0(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v5, v16

    check-cast v5, Lgc/e;

    iget-object v5, v5, Lgc/e;->f:LGa/s;

    invoke-static {v13}, LIm/r;->Z0(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v15, v16

    check-cast v15, Lgc/e;

    iget-object v15, v15, Lgc/e;->g:Ljava/lang/String;

    invoke-static {v15}, Lio/sentry/config/a;->r0(Ljava/lang/String;)Ljava/time/ZoneOffset;

    move-result-object v15

    invoke-virtual {v5, v15}, LGa/s;->n(Ljava/time/ZoneOffset;)LGa/s;

    move-result-object v5

    new-instance v15, Ljava/util/ArrayList;

    invoke-static {v13, v9}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v10

    invoke-direct {v15, v10}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v13}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    const/16 v18, 0x0

    :goto_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_8

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v9, v19

    check-cast v9, Lgc/e;

    move-object/from16 v27, v3

    sget-object v3, Lng/h;->k:LXb/a;

    move/from16 v28, v6

    iget-object v6, v9, Lgc/e;->e:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    move-object/from16 v29, v7

    sget-object v7, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;->IN_FLIGHT:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    move-object/from16 v19, v10

    iget-object v10, v9, Lgc/e;->f:LGa/s;

    if-ne v6, v7, :cond_2

    add-int/lit8 v6, v18, 0x1

    rem-int/lit8 v7, v18, 0x3

    if-eqz v7, :cond_1

    move/from16 v20, v6

    const/4 v6, 0x1

    if-eq v7, v6, :cond_0

    const-string v6, "Landing"

    :goto_3
    move-object/from16 v34, v6

    move/from16 v21, v11

    move/from16 v18, v20

    goto :goto_4

    :cond_0
    const-string v6, "In Air"

    goto :goto_3

    :cond_1
    move/from16 v20, v6

    const-string v6, "Take-off"

    goto :goto_3

    :cond_2
    iget-object v6, v9, Lgc/e;->g:Ljava/lang/String;

    invoke-static {v6}, Lio/sentry/config/a;->r0(Ljava/lang/String;)Ljava/time/ZoneOffset;

    move-result-object v6

    invoke-virtual {v10, v6}, LGa/s;->n(Ljava/time/ZoneOffset;)LGa/s;

    move-result-object v6

    move/from16 v21, v11

    const/4 v7, 0x0

    const/4 v11, 0x3

    invoke-static {v6, v7, v11}, LGa/s;->f(LGa/s;LGa/t;I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v34, v6

    :goto_4
    invoke-static {v2}, Lkotlin/jvm/internal/l;->g(Ljava/lang/Object;)V

    iget-object v6, v10, LGa/s;->a:Ljava/time/Instant;

    invoke-virtual {v6, v2}, Ljava/time/Instant;->compareTo(Ljava/time/Instant;)I

    move-result v6

    if-gez v6, :cond_3

    sget-object v6, Lcom/eightsleep/presentation_jetlag/enums/JetLagPlanTaskScheduleStatus;->PAST:Lcom/eightsleep/presentation_jetlag/enums/JetLagPlanTaskScheduleStatus;

    goto :goto_5

    :cond_3
    if-nez v28, :cond_4

    sget-object v6, Lcom/eightsleep/presentation_jetlag/enums/JetLagPlanTaskScheduleStatus;->CURRENT:Lcom/eightsleep/presentation_jetlag/enums/JetLagPlanTaskScheduleStatus;

    const/16 v28, 0x1

    goto :goto_5

    :cond_4
    sget-object v6, Lcom/eightsleep/presentation_jetlag/enums/JetLagPlanTaskScheduleStatus;->FUTURE:Lcom/eightsleep/presentation_jetlag/enums/JetLagPlanTaskScheduleStatus;

    :goto_5
    const-string v7, "scheduleStatus"

    invoke-static {v6, v7}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v30, Lng/h;

    invoke-virtual {v10}, LGa/s;->k()Ljava/time/LocalDate;

    move-result-object v7

    invoke-virtual {v7}, Ljava/time/LocalDate;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v10, "toString(...)"

    invoke-static {v7, v10}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v10, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;->COMPLETE:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    iget-object v11, v9, Lgc/e;->i:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    if-ne v11, v10, :cond_5

    const/16 v35, 0x1

    goto :goto_6

    :cond_5
    const/16 v35, 0x0

    :goto_6
    sget-object v10, Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;->SUPPLEMENT:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    iget-object v11, v9, Lgc/e;->d:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    if-ne v11, v10, :cond_7

    new-instance v10, Ljava/lang/StringBuilder;

    move-object/from16 v41, v2

    const-string v2, "Mapping supplements ui model from domain: "

    invoke-direct {v10, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, v9, Lgc/e;->j:Lgc/d;

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v3, v10}, Lcj/l0;->D(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v3, Lng/m;

    iget-object v2, v2, Lgc/d;->a:Ljava/lang/Integer;

    if-eqz v2, :cond_6

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    goto :goto_7

    :cond_6
    const/4 v2, 0x0

    :goto_7
    invoke-direct {v3, v2}, Lng/m;-><init>(I)V

    move-object/from16 v40, v3

    goto :goto_8

    :cond_7
    move-object/from16 v41, v2

    const/16 v40, 0x0

    :goto_8
    iget-object v2, v9, Lgc/e;->a:Ljava/lang/String;

    iget-object v3, v9, Lgc/e;->c:Ljava/lang/String;

    iget-object v10, v9, Lgc/e;->e:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    iget-object v9, v9, Lgc/e;->h:Ljava/lang/String;

    move-object/from16 v31, v2

    move-object/from16 v32, v3

    move-object/from16 v39, v6

    move-object/from16 v33, v7

    move-object/from16 v38, v9

    move-object/from16 v37, v10

    move-object/from16 v36, v11

    invoke-direct/range {v30 .. v40}, Lng/h;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/eightsleep/data_jetlag/enums/JetLagTaskType;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;Ljava/lang/String;Lcom/eightsleep/presentation_jetlag/enums/JetLagPlanTaskScheduleStatus;Lng/m;)V

    move-object/from16 v2, v30

    invoke-virtual {v15, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object/from16 v10, v19

    move/from16 v11, v21

    move-object/from16 v3, v27

    move/from16 v6, v28

    move-object/from16 v7, v29

    move-object/from16 v2, v41

    const/16 v9, 0xa

    goto/16 :goto_2

    :cond_8
    move-object/from16 v41, v2

    move-object/from16 v27, v3

    move/from16 v28, v6

    move-object/from16 v29, v7

    move/from16 v21, v11

    invoke-static {v15}, LIm/r;->Z0(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lng/h;

    iget-object v2, v2, Lng/h;->g:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    sget-object v3, LGa/p;->MONTH_DAY:LGa/p;

    const/4 v6, 0x2

    invoke-static {v5, v3, v6}, LGa/s;->g(LGa/s;LGa/p;I)Ljava/lang/String;

    move-result-object v19

    invoke-virtual {v15}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_a

    :cond_9
    const/16 v24, 0x1

    goto :goto_9

    :cond_a
    invoke-virtual {v15}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_9

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lng/h;

    iget-object v7, v7, Lng/h;->i:Lcom/eightsleep/presentation_jetlag/enums/JetLagPlanTaskScheduleStatus;

    sget-object v9, Lcom/eightsleep/presentation_jetlag/enums/JetLagPlanTaskScheduleStatus;->FUTURE:Lcom/eightsleep/presentation_jetlag/enums/JetLagPlanTaskScheduleStatus;

    if-ne v7, v9, :cond_b

    const/16 v24, 0x0

    :goto_9
    invoke-virtual {v15}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_d

    :cond_c
    const/16 v25, 0x1

    goto :goto_a

    :cond_d
    invoke-virtual {v15}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_e
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lng/h;

    iget-boolean v7, v7, Lng/h;->e:Z

    if-nez v7, :cond_e

    const/16 v25, 0x0

    :goto_a
    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object v3

    invoke-virtual {v5, v3}, LGa/s;->equals(Ljava/lang/Object;)Z

    move-result v3

    sget-object v5, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v7

    aget v5, v5, v7

    const/4 v7, 0x1

    if-eq v5, v7, :cond_11

    if-eq v5, v6, :cond_10

    const/4 v11, 0x3

    if-eq v5, v11, :cond_f

    const-string v5, ""

    goto :goto_b

    :cond_f
    add-int/lit8 v5, v12, 0x1

    invoke-direct {v0, v12, v1}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->getFormattedFlightCardLocationLabel(ILgc/o;)Ljava/lang/String;

    move-result-object v6

    move v12, v5

    move-object v5, v6

    goto :goto_b

    :cond_10
    iget-object v5, v1, Lgc/o;->d:Ljava/util/ArrayList;

    invoke-static {v5}, LIm/r;->k1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lgc/p;

    iget-object v5, v5, Lgc/p;->c:Lgc/q;

    iget-object v5, v5, Lgc/q;->a:Ljava/lang/String;

    goto :goto_b

    :cond_11
    iget-object v5, v1, Lgc/o;->d:Ljava/util/ArrayList;

    invoke-static {v5}, LIm/r;->Z0(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lgc/p;

    iget-object v5, v5, Lgc/p;->b:Lgc/q;

    iget-object v5, v5, Lgc/q;->a:Ljava/lang/String;

    :goto_b
    sget-object v6, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;->POST_FLIGHT:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    if-ne v2, v6, :cond_1a

    invoke-interface {v13}, Ljava/util/Collection;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_12

    const/4 v7, 0x0

    goto :goto_d

    :cond_12
    invoke-interface {v13}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    const/4 v7, 0x0

    :cond_13
    :goto_c
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_15

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lgc/e;

    iget-object v9, v9, Lgc/e;->e:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    sget-object v10, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;->POST_FLIGHT:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    if-ne v9, v10, :cond_13

    add-int/lit8 v7, v7, 0x1

    if-ltz v7, :cond_14

    goto :goto_c

    :cond_14
    invoke-static {}, LIm/s;->r0()V

    const/16 v17, 0x0

    throw v17

    :cond_15
    :goto_d
    rem-int v11, v21, v7

    const/16 v16, 0x1

    add-int/lit8 v11, v11, 0x1

    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-virtual {v15}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_16

    const/4 v9, 0x0

    goto :goto_f

    :cond_16
    invoke-virtual {v15}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    const/4 v9, 0x0

    :cond_17
    :goto_e
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_19

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lng/h;

    iget-boolean v10, v10, Lng/h;->e:Z

    if-eqz v10, :cond_17

    add-int/lit8 v9, v9, 0x1

    if-ltz v9, :cond_18

    goto :goto_e

    :cond_18
    invoke-static {}, LIm/s;->r0()V

    const/16 v17, 0x0

    throw v17

    :cond_19
    :goto_f
    new-instance v7, Lng/l;

    invoke-direct {v7, v11, v6, v9}, Lng/l;-><init>(III)V

    move-object/from16 v26, v7

    goto :goto_10

    :cond_1a
    const/16 v16, 0x1

    const/16 v26, 0x0

    :goto_10
    new-instance v18, Lng/g;

    move-object/from16 v22, v2

    move/from16 v20, v3

    move-object/from16 v21, v5

    move-object/from16 v23, v15

    invoke-direct/range {v18 .. v26}, Lng/g;-><init>(Ljava/lang/String;ZLjava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;Ljava/util/ArrayList;ZZLng/l;)V

    move-object/from16 v2, v18

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v11, v14

    move-object/from16 v3, v27

    move/from16 v6, v28

    move-object/from16 v7, v29

    move-object/from16 v2, v41

    const/16 v9, 0xa

    goto/16 :goto_1

    :cond_1b
    invoke-static {}, LIm/s;->s0()V

    const/16 v17, 0x0

    throw v17

    :cond_1c
    move-object/from16 v41, v2

    move-object/from16 v27, v3

    invoke-static {v8, v4}, LIm/x;->D0(Ljava/lang/Iterable;Ljava/util/Collection;)V

    goto/16 :goto_0

    :cond_1d
    return-object v4
.end method

.method private final onTaskCompletionToggled(Ljava/lang/String;Ljava/util/List;ZLjava/lang/Integer;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lng/h;",
            ">;Z",
            "Ljava/lang/Integer;",
            ")V"
        }
    .end annotation

    invoke-static {p0}, Landroidx/lifecycle/V;->h(Landroidx/lifecycle/b0;)Li3/a;

    move-result-object v0

    new-instance v1, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;

    const/4 v7, 0x0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v7}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$onTaskCompletionToggled$1;-><init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/lang/String;Ljava/util/List;ZLjava/lang/Integer;LLm/c;)V

    const/4 p0, 0x3

    const/4 p1, 0x0

    invoke-static {v0, p1, p1, v1, p0}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    return-void
.end method

.method public static synthetic onTaskCompletionToggled$default(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/lang/String;Ljava/util/List;ZLjava/lang/Integer;ILjava/lang/Object;)V
    .locals 0

    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_0

    const/4 p4, 0x0

    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->onTaskCompletionToggled(Ljava/lang/String;Ljava/util/List;ZLjava/lang/Integer;)V

    return-void
.end method

.method private static final onUiAction$lambda$1(Lkg/i;Lng/e;)Lng/e;
    .locals 16

    const-string v0, "it"

    move-object/from16 v1, p1

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v0, p0

    check-cast v0, Lkg/g;

    iget-object v4, v0, Lkg/g;->b:Lcom/eightsleep/presentation_jetlag/enums/PlanScheduleType;

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/16 v15, 0x1ffb

    invoke-static/range {v1 .. v15}, Lng/e;->u(Lng/e;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/presentation_jetlag/enums/PlanScheduleType;Lng/a;Lng/a;Ljava/lang/String;Lng/g;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;Ljava/util/List;ILjava/lang/String;LGa/s;Ljava/lang/String;I)Lng/e;

    move-result-object v0

    return-object v0
.end method

.method private final pollTimeAtDestination(Lgc/o;)V
    .locals 3

    invoke-static {p0}, Landroidx/lifecycle/V;->h(Landroidx/lifecycle/b0;)Li3/a;

    move-result-object v0

    new-instance v1, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$pollTimeAtDestination$1;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$pollTimeAtDestination$1;-><init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Lgc/o;LLm/c;)V

    const/4 p0, 0x3

    invoke-static {v0, v2, v2, v1, p0}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    return-void
.end method

.method private final showEndTripConfirmationDialog(Ljava/lang/String;)V
    .locals 10

    new-instance v5, Lcom/eightsleep/presentation_jetlag/viewmodel/b;

    const/4 v0, 0x0

    invoke-direct {v5, p0, p1, v0}, Lcom/eightsleep/presentation_jetlag/viewmodel/b;-><init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/lang/String;I)V

    const v0, 0x7f1207ff

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-instance v7, Lcom/eightsleep/presentation_jetlag/viewmodel/b;

    const/4 v0, 0x1

    invoke-direct {v7, p0, p1, v0}, Lcom/eightsleep/presentation_jetlag/viewmodel/b;-><init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/lang/String;I)V

    new-instance v8, Lcom/eightsleep/presentation_jetlag/viewmodel/c;

    invoke-direct {v8, p0}, Lcom/eightsleep/presentation_jetlag/viewmodel/c;-><init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;)V

    const v3, 0x7f1207fd

    const v4, 0x7f1207fe

    const/4 v1, 0x0

    const v2, 0x7f120801

    const/16 v9, 0x101

    move-object v0, p0

    invoke-static/range {v0 .. v9}, Landroid/support/v4/media/session/b;->H(LL8/e;Lu0/d;IIILVm/a;Ljava/lang/Integer;LVm/a;LVm/a;I)V

    return-void
.end method

.method private static final showEndTripConfirmationDialog$lambda$3(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/lang/String;)LHm/B;
    .locals 2

    new-instance v0, Lkg/d;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lkg/d;-><init>(Ljava/lang/String;Z)V

    invoke-virtual {p0, v0}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->onUiAction(Lkg/i;)V

    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0
.end method

.method private static final showEndTripConfirmationDialog$lambda$4(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/lang/String;)LHm/B;
    .locals 2

    new-instance v0, Lkg/d;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lkg/d;-><init>(Ljava/lang/String;Z)V

    invoke-virtual {p0, v0}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->onUiAction(Lkg/i;)V

    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0
.end method

.method private static final showEndTripConfirmationDialog$lambda$5(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;)LHm/B;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x3

    invoke-static {p0, v0, v1}, Landroid/support/v4/media/session/b;->I(LY7/o;LVm/k;I)V

    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0
.end method

.method private final showSupplementTaskConfirmationDialog(Ljava/lang/String;Ljava/util/List;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lng/h;",
            ">;)V"
        }
    .end annotation

    new-instance v5, Lkotlin/jvm/internal/y;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    iput v0, v5, Lkotlin/jvm/internal/y;->a:I

    new-instance v4, Lan/k;

    const/4 v0, 0x3

    const/4 v1, 0x1

    invoke-direct {v4, v1, v0, v1}, Lan/i;-><init>(III)V

    new-instance v0, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$showSupplementTaskConfirmationDialog$1;

    invoke-direct {v0, v4, v5}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel$showSupplementTaskConfirmationDialog$1;-><init>(Lan/k;Lkotlin/jvm/internal/y;)V

    new-instance v7, Lu0/d;

    const v2, -0x2bed7491

    invoke-direct {v7, v0, v1, v2}, Lu0/d;-><init>(Ljava/lang/Object;ZI)V

    new-instance v0, Lcom/eightsleep/presentation_jetlag/viewmodel/a;

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/eightsleep/presentation_jetlag/viewmodel/a;-><init>(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/lang/String;Ljava/util/List;Lan/k;Lkotlin/jvm/internal/y;)V

    const/4 v13, 0x0

    const/4 v14, 0x0

    const v8, 0x7f12080f

    const v9, 0x7f120393

    const v10, 0x7f12080e

    const/4 v12, 0x0

    const/16 v15, 0x1e0

    move-object/from16 v6, p0

    move-object v11, v0

    invoke-static/range {v6 .. v15}, Landroid/support/v4/media/session/b;->H(LL8/e;Lu0/d;IIILVm/a;Ljava/lang/Integer;LVm/a;LVm/a;I)V

    return-void
.end method

.method private static final showSupplementTaskConfirmationDialog$lambda$2(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/lang/String;Ljava/util/List;Lan/k;Lkotlin/jvm/internal/y;)LHm/B;
    .locals 1

    new-instance v0, Lkg/h;

    invoke-static {p3}, LIm/r;->T1(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p3

    iget p4, p4, Lkotlin/jvm/internal/y;->a:I

    invoke-interface {p3, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Number;

    invoke-virtual {p3}, Ljava/lang/Number;->intValue()I

    move-result p3

    invoke-direct {v0, p1, p2, p3}, Lkg/h;-><init>(Ljava/lang/String;Ljava/util/List;I)V

    invoke-virtual {p0, v0}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->onUiAction(Lkg/i;)V

    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0
.end method


# virtual methods
.method public getInitialViewState()LY7/n;
    .locals 16

    const/4 v0, 0x0

    new-instance v1, LY7/m;

    new-instance v2, Lng/e;

    move-object/from16 v3, p0

    iget-object v3, v3, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->displaySettings:LGa/f;

    new-instance v6, Lng/a;

    invoke-direct {v6, v3}, Lng/a;-><init>(LGa/f;)V

    new-instance v7, Lng/a;

    invoke-direct {v7, v3}, Lng/a;-><init>(LGa/f;)V

    sget-object v4, LGa/s;->c:LGa/s;

    if-eqz v3, :cond_0

    iget-object v3, v3, LGa/f;->d:Lcom/eightsleep/data_core/enums/ClockSystem;

    goto :goto_0

    :cond_0
    move-object v3, v0

    :goto_0
    invoke-static {v3}, LDl/A0;->v(Lcom/eightsleep/data_core/enums/ClockSystem;)LGa/s;

    move-result-object v14

    sget-object v5, Lcom/eightsleep/presentation_jetlag/enums/PlanScheduleType;->TODAY:Lcom/eightsleep/presentation_jetlag/enums/PlanScheduleType;

    sget-object v10, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;->PRE_FLIGHT:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    sget-object v11, LIm/z;->a:LIm/z;

    const/4 v9, 0x0

    const/4 v12, 0x0

    const-string v3, ""

    move-object v4, v3

    move-object v8, v3

    move-object v13, v3

    move-object v15, v3

    invoke-direct/range {v2 .. v15}, Lng/e;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/presentation_jetlag/enums/PlanScheduleType;Lng/a;Lng/a;Ljava/lang/String;Lng/g;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;Ljava/util/List;ILjava/lang/String;LGa/s;Ljava/lang/String;)V

    invoke-direct {v1, v2, v0}, LY7/m;-><init>(Ld8/k;Lc8/e;)V

    return-object v1
.end method

.method public onCreate(Landroidx/lifecycle/v;)V
    .locals 1

    const-string v0, "owner"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-super {p0, p1}, LL8/e;->onCreate(Landroidx/lifecycle/v;)V

    invoke-direct {p0}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->getPlanAndTasks()V

    return-void
.end method

.method public bridge synthetic onUiAction(LZ7/c;)V
    .locals 0

    .line 1
    check-cast p1, Lkg/i;

    invoke-virtual {p0, p1}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->onUiAction(Lkg/i;)V

    return-void
.end method

.method public onUiAction(Lkg/i;)V
    .locals 7

    const-string v2, "action"

    invoke-static {p1, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    sget-object v2, LRc/A;->a:LRc/A;

    invoke-virtual {p0, p1, v2}, LL8/e;->logUiActionEvent(LZ7/c;LRc/B;)V

    .line 3
    sget-object v2, Lkg/b;->b:Lkg/b;

    .line 4
    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    .line 5
    new-instance v1, Lcom/eightsleep/corepresentation/navigation/route/Route$HomeGraph;

    const/4 v2, 0x0

    invoke-direct {v1, v2, v3, v2}, Lcom/eightsleep/corepresentation/navigation/route/Route$HomeGraph;-><init>(Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-static {p0, v1, v4, v3, v2}, LL8/e;->goTo$default(LL8/e;Lcom/eightsleep/corepresentation/navigation/route/NavRoute;ZILjava/lang/Object;)V

    return-void

    .line 6
    :cond_0
    instance-of v2, p1, Lkg/f;

    if-eqz v2, :cond_2

    .line 7
    move-object v1, p1

    check-cast v1, Lkg/f;

    .line 8
    iget-object v2, v1, Lkg/f;->c:Lng/h;

    iget-object v3, v2, Lng/h;->f:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    .line 9
    sget-object v4, Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;->SUPPLEMENT:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    if-ne v3, v4, :cond_1

    iget-boolean v3, v1, Lkg/f;->d:Z

    if-eqz v3, :cond_1

    .line 10
    invoke-static {v2}, LIm/s;->f0(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 11
    iget-object v1, v1, Lkg/f;->b:Ljava/lang/String;

    invoke-direct {p0, v1, v2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->showSupplementTaskConfirmationDialog(Ljava/lang/String;Ljava/util/List;)V

    return-void

    .line 12
    :cond_1
    invoke-static {v2}, LIm/s;->f0(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 13
    iget-boolean v3, v1, Lkg/f;->d:Z

    const/4 v4, 0x0

    iget-object v1, v1, Lkg/f;->b:Ljava/lang/String;

    const/16 v5, 0x8

    const/4 v6, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->onTaskCompletionToggled$default(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/lang/String;Ljava/util/List;ZLjava/lang/Integer;ILjava/lang/Object;)V

    return-void

    .line 14
    :cond_2
    instance-of v2, p1, Lkg/h;

    if-eqz v2, :cond_3

    .line 15
    move-object v1, p1

    check-cast v1, Lkg/h;

    .line 16
    iget v2, v1, Lkg/h;->d:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 17
    iget-object v4, v1, Lkg/h;->b:Ljava/lang/String;

    iget-object v1, v1, Lkg/h;->c:Ljava/util/List;

    invoke-direct {p0, v4, v1, v3, v2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->onTaskCompletionToggled(Ljava/lang/String;Ljava/util/List;ZLjava/lang/Integer;)V

    return-void

    .line 18
    :cond_3
    instance-of v2, p1, Lkg/e;

    if-eqz v2, :cond_7

    .line 19
    move-object v1, p1

    check-cast v1, Lkg/e;

    iget-boolean v2, v1, Lkg/e;->d:Z

    if-eqz v2, :cond_6

    .line 20
    iget-object v2, v1, Lkg/e;->c:Ljava/util/List;

    if-eqz v2, :cond_4

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_4

    goto :goto_0

    .line 21
    :cond_4
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lng/h;

    .line 22
    iget-object v4, v4, Lng/h;->f:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    .line 23
    sget-object v5, Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;->SUPPLEMENT:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    if-ne v4, v5, :cond_5

    .line 24
    iget-object v1, v1, Lkg/e;->b:Ljava/lang/String;

    invoke-direct {p0, v1, v2}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->showSupplementTaskConfirmationDialog(Ljava/lang/String;Ljava/util/List;)V

    return-void

    .line 25
    :cond_6
    :goto_0
    iget-boolean v3, v1, Lkg/e;->d:Z

    const/4 v4, 0x0

    iget-object v2, v1, Lkg/e;->b:Ljava/lang/String;

    iget-object v1, v1, Lkg/e;->c:Ljava/util/List;

    const/16 v5, 0x8

    const/4 v6, 0x0

    move-object v0, v2

    move-object v2, v1

    move-object v1, v0

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->onTaskCompletionToggled$default(Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;Ljava/lang/String;Ljava/util/List;ZLjava/lang/Integer;ILjava/lang/Object;)V

    return-void

    .line 26
    :cond_7
    instance-of v2, p1, Lkg/g;

    if-eqz v2, :cond_8

    new-instance v2, Lcom/eightsleep/presentation_jetlag/viewmodel/g;

    const/4 v4, 0x1

    invoke-direct {v2, p1, v4}, Lcom/eightsleep/presentation_jetlag/viewmodel/g;-><init>(Ljava/lang/Object;I)V

    invoke-static {p0, v2, v3}, Landroid/support/v4/media/session/b;->I(LY7/o;LVm/k;I)V

    return-void

    .line 27
    :cond_8
    instance-of v2, p1, Lkg/c;

    if-eqz v2, :cond_9

    move-object v1, p1

    check-cast v1, Lkg/c;

    iget-object v1, v1, Lkg/c;->b:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->showEndTripConfirmationDialog(Ljava/lang/String;)V

    return-void

    .line 28
    :cond_9
    instance-of v2, p1, Lkg/d;

    if-eqz v2, :cond_a

    move-object v1, p1

    check-cast v1, Lkg/d;

    iget-object v1, v1, Lkg/d;->b:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;->endTrip(Ljava/lang/String;)V

    return-void

    .line 29
    :cond_a
    instance-of v0, p1, Lkg/a;

    if-eqz v0, :cond_b

    return-void

    .line 30
    :cond_b
    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0
.end method
