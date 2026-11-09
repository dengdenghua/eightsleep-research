package com.eightsleep.presentation_jetlag.viewmodel;

/* JADX INFO: loaded from: classes2.dex */
@kotlin.Metadata(d1 = {"\u0000\u0082\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0012\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001Bi\b\u0007\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\u0006\u0010\u000b\u001a\u00020\n\u0012\u0006\u0010\r\u001a\u00020\f\u0012\u0006\u0010\u000f\u001a\u00020\u000e\u0012\u0006\u0010\u0011\u001a\u00020\u0010\u0012\u0006\u0010\u0013\u001a\u00020\u0012\u0012\u0006\u0010\u0015\u001a\u00020\u0014\u0012\u0006\u0010\u0017\u001a\u00020\u0016\u0012\u0006\u0010\u0019\u001a\u00020\u0018\u0012\u0006\u0010\u001b\u001a\u00020\u001a¢\u0006\u0004\b\u001c\u0010\u001dJ\u000f\u0010\u001f\u001a\u00020\u001eH\u0016¢\u0006\u0004\b\u001f\u0010 J\u0017\u0010$\u001a\u00020#2\u0006\u0010\"\u001a\u00020!H\u0014¢\u0006\u0004\b$\u0010%J\u0017\u0010'\u001a\u00020#2\u0006\u0010&\u001a\u00020\u0003H\u0016¢\u0006\u0004\b'\u0010(J\u000f\u0010*\u001a\u00020)H\u0016¢\u0006\u0004\b*\u0010+J\u001f\u0010/\u001a\u00020#2\u0006\u0010-\u001a\u00020,2\u0006\u0010.\u001a\u00020,H\u0002¢\u0006\u0004\b/\u00100J\u000f\u00101\u001a\u00020#H\u0002¢\u0006\u0004\b1\u00102J!\u00107\u001a\u00020#2\u0006\u00104\u001a\u0002032\b\u00106\u001a\u0004\u0018\u000105H\u0002¢\u0006\u0004\b7\u00108J\u0017\u00109\u001a\u00020#2\u0006\u0010.\u001a\u00020,H\u0002¢\u0006\u0004\b9\u0010:J'\u0010?\u001a\u00020#2\u0006\u0010<\u001a\u00020;2\u0006\u0010>\u001a\u00020=2\u0006\u0010.\u001a\u00020,H\u0002¢\u0006\u0004\b?\u0010@J\u0017\u0010D\u001a\u00020C2\u0006\u0010B\u001a\u00020AH\u0002¢\u0006\u0004\bD\u0010EJ%\u0010H\u001a\u00020#2\f\u0010G\u001a\b\u0012\u0004\u0012\u00020A0F2\u0006\u0010.\u001a\u00020,H\u0002¢\u0006\u0004\bH\u0010IJ\u001f\u0010J\u001a\u00020#2\u0006\u0010B\u001a\u00020A2\u0006\u0010.\u001a\u00020,H\u0002¢\u0006\u0004\bJ\u0010KJ%\u0010O\u001a\u00020#2\u0006\u0010M\u001a\u00020L2\f\u0010N\u001a\b\u0012\u0004\u0012\u00020C0FH\u0002¢\u0006\u0004\bO\u0010PJ'\u0010U\u001a\u00020#2\u0006\u0010.\u001a\u00020,2\u0006\u0010R\u001a\u00020Q2\u0006\u0010T\u001a\u00020SH\u0002¢\u0006\u0004\bU\u0010VJ3\u0010Z\u001a\u0010\u0012\u0004\u0012\u00020,\u0012\u0006\u0012\u0004\u0018\u00010Y0X2\u0006\u0010W\u001a\u00020L2\f\u0010N\u001a\b\u0012\u0004\u0012\u00020C0FH\u0002¢\u0006\u0004\bZ\u0010[J'\u0010^\u001a\u00020#2\u0006\u0010.\u001a\u00020,2\u0006\u0010R\u001a\u00020Q2\u0006\u0010]\u001a\u00020\\H\u0002¢\u0006\u0004\b^\u0010_J\u001f\u0010a\u001a\u00020#2\u0006\u0010.\u001a\u00020,2\u0006\u0010`\u001a\u00020,H\u0002¢\u0006\u0004\ba\u00100J1\u0010f\u001a\u00020#2\u0006\u0010.\u001a\u00020,2\u0006\u0010R\u001a\u00020Q2\u0006\u0010c\u001a\u00020b2\b\u0010e\u001a\u0004\u0018\u00010dH\u0002¢\u0006\u0004\bf\u0010gJ\u0017\u0010i\u001a\u00020#2\u0006\u0010h\u001a\u00020,H\u0002¢\u0006\u0004\bi\u0010:J\u001f\u0010m\u001a\u00020#2\u0006\u0010j\u001a\u00020;2\u0006\u0010l\u001a\u00020kH\u0002¢\u0006\u0004\bm\u0010nJ)\u0010p\u001a\u00020#2\u0006\u0010o\u001a\u00020L2\u0006\u0010l\u001a\u00020k2\b\u0010.\u001a\u0004\u0018\u00010,H\u0002¢\u0006\u0004\bp\u0010qJ%\u0010s\u001a\u0004\u0018\u00010Y2\b\u0010M\u001a\u0004\u0018\u00010L2\b\u0010r\u001a\u0004\u0018\u00010CH\u0002¢\u0006\u0004\bs\u0010tJ-\u0010v\u001a\u00020#2\u0006\u0010M\u001a\u00020L2\f\u0010N\u001a\b\u0012\u0004\u0012\u00020C0F2\u0006\u0010u\u001a\u000203H\u0002¢\u0006\u0004\bv\u0010wR\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010xR\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010yR\u0014\u0010\t\u001a\u00020\b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010zR\u0014\u0010\u000b\u001a\u00020\n8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010{R\u0014\u0010\r\u001a\u00020\f8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010|R\u0014\u0010\u000f\u001a\u00020\u000e8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010}R\u0019\u0010\u007f\u001a\u0004\u0018\u00010~8\u0002@\u0002X\u0082\u000e¢\u0006\u0007\n\u0005\b\u007f\u0010\u0080\u0001R\u001c\u0010\u0082\u0001\u001a\u0005\u0018\u00010\u0081\u00018\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b\u0082\u0001\u0010\u0083\u0001¨\u0006\u0084\u0001"}, d2 = {"Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;", "LL8/m;", "Lng/i;", "Lkg/S;", "Lhc/P;", "searchTravelLocationsUseCase", "Lhc/a;", "createJetLagPlanUseCase", "Lhc/f;", "createTripUseCase", "Lhc/o;", "findFlightUseCase", "Lxd/h0;", "updateAppUserUseCase", "Lxd/D;", "observeDisplaySettingsUseCase", "LRb/S;", "observeHouseholdSummaryFlowUseCase", "LJa/t;", "observeSelectedUserIdUseCase", "LJa/p;", "observeSelectedDeviceSetIdUseCase", "LJa/r;", "observeSelectedDeviceTypeUseCase", "LWc/b;", "featureFlags", "LRc/b;", "analytics", "<init>", "(Lhc/P;Lhc/a;Lhc/f;Lhc/o;Lxd/h0;Lxd/D;LRb/S;LJa/t;LJa/p;LJa/r;LWc/b;LRc/b;)V", "LY7/n;", "getInitialViewState", "()LY7/n;", "LQb/j;", "household", "LHm/B;", "onHouseholdUpdated", "(LQb/j;)V", "action", "onUiAction", "(Lkg/S;)V", "Lc8/e;", "getDefaultLoadingKey", "()Lc8/e;", "", "flightSearchResultIndex", "destinationIndex", "onFlightSearchResultSelected", "(II)V", "onNotificationsEnabled", "()V", "", "osLevelNotificationsEnabled", "Lyd/e;", "appUserNotificationSettings", "checkNotificationsPermissions", "(ZLyd/e;)V", "onFlightDetailsCtaClicked", "(I)V", "", "flightNumber", "LGa/s;", "departureDate", "findFlight", "(Ljava/lang/String;LGa/s;I)V", "Lgc/a;", "flight", "Lng/a;", "mapFlightToDestinationUiModel", "(Lgc/a;)Lng/a;", "", "flights", "showFlightSearchResults", "(Ljava/util/List;I)V", "selectFlightSearchResult", "(Lgc/a;I)V", "Lng/k;", com.google.android.gms.measurement.api.AppMeasurementSdk$ConditionalUserProperty.ORIGIN, "destinations", "onItineraryCtaClicked", "(Lng/k;Ljava/util/List;)V", "Lcom/eightsleep/presentation_jetlag/enums/TripSegment;", "segment", "Ljava/time/LocalDate;", "date", "onScheduleDateChanged", "(ILcom/eightsleep/presentation_jetlag/enums/TripSegment;Ljava/time/LocalDate;)V", "originLocation", "", "LYa/H;", "validateSchedule", "(Lng/k;Ljava/util/List;)Ljava/util/Map;", "Ljava/time/LocalTime;", "time", "onScheduleTimeChanged", "(ILcom/eightsleep/presentation_jetlag/enums/TripSegment;Ljava/time/LocalTime;)V", "numDestinations", "onScheduleCtaClicked", "Lcom/eightsleep/presentation_jetlag/enums/SchedulePickerType;", "schedulePickerType", "Lng/n;", "currentPickerState", "onScheduleFieldClicked", "(ILcom/eightsleep/presentation_jetlag/enums/TripSegment;Lcom/eightsleep/presentation_jetlag/enums/SchedulePickerType;Lng/n;)V", "index", "onDeleteDestinationClicked", "query", "Lcom/eightsleep/presentation_jetlag/enums/TripLocationType;", "locationType", "searchForLocation", "(Ljava/lang/String;Lcom/eightsleep/presentation_jetlag/enums/TripLocationType;)V", "location", "onLocationSearchResultSelected", "(Lng/k;Lcom/eightsleep/presentation_jetlag/enums/TripLocationType;Ljava/lang/Integer;)V", "destination", "validateLocations", "(Lng/k;Lng/a;)LYa/H;", "includeSupplements", "createTripAndJetLagPlan", "(Lng/k;Ljava/util/List;Z)V", "Lhc/P;", "Lhc/a;", "Lhc/f;", "Lhc/o;", "Lxd/h0;", "Lxd/D;", "Lwo/h0;", "locationSearchJob", "Lwo/h0;", "LGa/f;", "displaySettings", "LGa/f;", "presentation-jetlag_tencentRelease"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class JetLagTripViewModel extends L8.m {
    public static final int $stable = 8;
    private final p187hc.InterfaceC3146a createJetLagPlanUseCase;
    private final p187hc.InterfaceC3151f createTripUseCase;
    private Ga.f displaySettings;
    private final p187hc.InterfaceC3160o findFlightUseCase;
    private p554wo.InterfaceC5088h0 locationSearchJob;
    private final p569xd.D observeDisplaySettingsUseCase;
    private final p187hc.P searchTravelLocationsUseCase;
    private final p569xd.h0 updateAppUserUseCase;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public JetLagTripViewModel(p187hc.P searchTravelLocationsUseCase, p187hc.InterfaceC3146a createJetLagPlanUseCase, p187hc.InterfaceC3151f createTripUseCase, p187hc.InterfaceC3160o findFlightUseCase, p569xd.h0 updateAppUserUseCase, p569xd.D observeDisplaySettingsUseCase, Rb.S observeHouseholdSummaryFlowUseCase, Ja.InterfaceC1109t observeSelectedUserIdUseCase, Ja.InterfaceC1106p observeSelectedDeviceSetIdUseCase, Ja.r observeSelectedDeviceTypeUseCase, Wc.b featureFlags, Rc.C1650b analytics) {
        super(observeHouseholdSummaryFlowUseCase, observeSelectedUserIdUseCase, observeSelectedDeviceSetIdUseCase, observeSelectedDeviceTypeUseCase, featureFlags, analytics);
        kotlin.jvm.internal.l.j(searchTravelLocationsUseCase, "searchTravelLocationsUseCase");
        kotlin.jvm.internal.l.j(createJetLagPlanUseCase, "createJetLagPlanUseCase");
        kotlin.jvm.internal.l.j(createTripUseCase, "createTripUseCase");
        kotlin.jvm.internal.l.j(findFlightUseCase, "findFlightUseCase");
        kotlin.jvm.internal.l.j(updateAppUserUseCase, "updateAppUserUseCase");
        kotlin.jvm.internal.l.j(observeDisplaySettingsUseCase, "observeDisplaySettingsUseCase");
        kotlin.jvm.internal.l.j(observeHouseholdSummaryFlowUseCase, "observeHouseholdSummaryFlowUseCase");
        kotlin.jvm.internal.l.j(observeSelectedUserIdUseCase, "observeSelectedUserIdUseCase");
        kotlin.jvm.internal.l.j(observeSelectedDeviceSetIdUseCase, "observeSelectedDeviceSetIdUseCase");
        kotlin.jvm.internal.l.j(observeSelectedDeviceTypeUseCase, "observeSelectedDeviceTypeUseCase");
        kotlin.jvm.internal.l.j(featureFlags, "featureFlags");
        kotlin.jvm.internal.l.j(analytics, "analytics");
        this.searchTravelLocationsUseCase = searchTravelLocationsUseCase;
        this.createJetLagPlanUseCase = createJetLagPlanUseCase;
        this.createTripUseCase = createTripUseCase;
        this.findFlightUseCase = findFlightUseCase;
        this.updateAppUserUseCase = updateAppUserUseCase;
        this.observeDisplaySettingsUseCase = observeDisplaySettingsUseCase;
        p554wo.C.B(androidx.lifecycle.V.h(this), null, null, new com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$1(this, null), 3);
    }

    public static /* synthetic */ p336ng.i A(p260kg.S s10, p336ng.i iVar) {
        return onUiAction$lambda$19(s10, iVar);
    }

    public static /* synthetic */ p336ng.i B(p336ng.i iVar) {
        return onUiAction$lambda$17(iVar);
    }

    public static final /* synthetic */ p187hc.InterfaceC3146a access$getCreateJetLagPlanUseCase$p(com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel) {
        return jetLagTripViewModel.createJetLagPlanUseCase;
    }

    public static final /* synthetic */ p187hc.InterfaceC3151f access$getCreateTripUseCase$p(com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel) {
        return jetLagTripViewModel.createTripUseCase;
    }

    public static final /* synthetic */ p187hc.InterfaceC3160o access$getFindFlightUseCase$p(com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel) {
        return jetLagTripViewModel.findFlightUseCase;
    }

    public static final /* synthetic */ p569xd.D access$getObserveDisplaySettingsUseCase$p(com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel) {
        return jetLagTripViewModel.observeDisplaySettingsUseCase;
    }

    public static final /* synthetic */ p187hc.P access$getSearchTravelLocationsUseCase$p(com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel) {
        return jetLagTripViewModel.searchTravelLocationsUseCase;
    }

    public static final /* synthetic */ p569xd.h0 access$getUpdateAppUserUseCase$p(com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel) {
        return jetLagTripViewModel.updateAppUserUseCase;
    }

    public static final /* synthetic */ void access$selectFlightSearchResult(com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel, p161gc.a aVar, int i10) {
        jetLagTripViewModel.selectFlightSearchResult(aVar, i10);
    }

    public static final /* synthetic */ void access$setDisplaySettings$p(com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel, Ga.f fVar) {
        jetLagTripViewModel.displaySettings = fVar;
    }

    public static final /* synthetic */ void access$showFlightSearchResults(com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel, java.util.List list, int i10) {
        jetLagTripViewModel.showFlightSearchResults(list, i10);
    }

    public static /* synthetic */ p336ng.i c(java.lang.String str, p336ng.i iVar) {
        return searchForLocation$lambda$44(str, iVar);
    }

    private final void checkNotificationsPermissions(boolean osLevelNotificationsEnabled, p595yd.C5239e appUserNotificationSettings) {
        if (!osLevelNotificationsEnabled) {
            L8.e.goTo$default(this, com.eightsleep.presentation_jetlag.navigation.JetLagRoute$EnableNotifications.INSTANCE, false, 2, null);
            return;
        }
        if (appUserNotificationSettings != null) {
            if (appUserNotificationSettings.f73516c && appUserNotificationSettings.f73515b) {
                L8.e.goTo$default(this, com.eightsleep.presentation_jetlag.navigation.JetLagRoute$ProtocolLoading.INSTANCE, false, 2, null);
            } else {
                L8.e.goTo$default(this, com.eightsleep.presentation_jetlag.navigation.JetLagRoute$EnableNotifications.INSTANCE, false, 2, null);
            }
        }
    }

    private final void createTripAndJetLagPlan(p336ng.k origin, java.util.List<p336ng.a> destinations, boolean includeSupplements) {
        p554wo.C.B(androidx.lifecycle.V.h(this), null, null, new com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1(this, origin, destinations, includeSupplements, null), 3);
    }

    public static /* synthetic */ p336ng.i d(int i10, p336ng.i iVar) {
        return onFlightDetailsCtaClicked$lambda$24(i10, iVar);
    }

    public static /* synthetic */ p336ng.i e(int i10, int i11, com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel, p336ng.i iVar) {
        return onFlightSearchResultSelected$lambda$21(i10, i11, jetLagTripViewModel, iVar);
    }

    public static /* synthetic */ p336ng.i f(java.lang.String str, p336ng.i iVar) {
        return searchForLocation$lambda$45(str, iVar);
    }

    private final void findFlight(java.lang.String flightNumber, Ga.s departureDate, int destinationIndex) {
        android.support.v4.media.session.b.I(this, new Ch.C0402v1(destinationIndex, 17), 1);
        p554wo.C.B(androidx.lifecycle.V.h(this), null, null, new com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$findFlight$2(this, flightNumber, departureDate, destinationIndex, null), 3);
    }

    private static final p336ng.i findFlight$lambda$26(int i10, p336ng.i it) {
        kotlin.jvm.internal.l.j(it, "it");
        java.util.List list = it.f61170b;
        java.util.ArrayList arrayList = new java.util.ArrayList(Im.t.z0(list, 10));
        int i11 = 0;
        for (java.lang.Object obj : list) {
            int i12 = i11 + 1;
            if (i11 < 0) {
                Im.s.s0();
                throw null;
            }
            p336ng.a aVarA = (p336ng.a) obj;
            if (i11 == i10) {
                aVarA = p336ng.a.a(aVarA, null, null, null, null, -1, 15);
            }
            arrayList.add(aVarA);
            i11 = i12;
        }
        return p336ng.i.u(it, null, arrayList, null, Im.A.f14215a, null, null, null, 117);
    }

    public static /* synthetic */ p336ng.i g(int i10, p336ng.n nVar, p336ng.n nVar2, com.eightsleep.presentation_jetlag.enums.TripSegment tripSegment, com.eightsleep.presentation_jetlag.enums.SchedulePickerType schedulePickerType, p336ng.i iVar) {
        return onScheduleFieldClicked$lambda$41(i10, nVar, nVar2, tripSegment, schedulePickerType, iVar);
    }

    public static /* synthetic */ p336ng.i h(int i10, p336ng.i iVar) {
        return findFlight$lambda$26(i10, iVar);
    }

    public static /* synthetic */ p336ng.i i(p336ng.i iVar) {
        return onUiAction$lambda$18(iVar);
    }

    public static /* synthetic */ p336ng.i j(p260kg.S s10, p336ng.i iVar) {
        return onUiAction$lambda$11(s10, iVar);
    }

    public static /* synthetic */ p336ng.i k(com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel, p336ng.k kVar, p336ng.i iVar) {
        return onLocationSearchResultSelected$lambda$47(jetLagTripViewModel, kVar, iVar);
    }

    public static /* synthetic */ p336ng.i l(int i10, p336ng.k kVar, p336ng.a aVar, com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel, p336ng.i iVar) {
        return selectFlightSearchResult$lambda$32(i10, kVar, aVar, jetLagTripViewModel, iVar);
    }

    public static /* synthetic */ p336ng.i m(com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel, p336ng.k kVar, p336ng.i iVar) {
        return onLocationSearchResultSelected$lambda$53(jetLagTripViewModel, kVar, iVar);
    }

    private final p336ng.a mapFlightToDestinationUiModel(p161gc.a flight) {
        p336ng.k kVar = new p336ng.k(flight.f48471i, flight.f48469g, flight.k, 8);
        Ga.s sVar = flight.f48467e;
        return new p336ng.a(kVar, new p336ng.o(null, sVar, flight.f48472j), new p336ng.c(flight.f48463a, sVar, 12), 24);
    }

    public static /* synthetic */ p336ng.i n(p336ng.i iVar) {
        return onUiAction$lambda$13(iVar);
    }

    public static /* synthetic */ p336ng.i o(p260kg.S s10, p336ng.i iVar) {
        return onUiAction$lambda$7(s10, iVar);
    }

    private final void onDeleteDestinationClicked(int index) {
        android.support.v4.media.session.b.I(this, new Ch.C0402v1(index, 16), 1);
    }

    private static final p336ng.i onDeleteDestinationClicked$lambda$43(int i10, p336ng.i model) {
        java.util.List list;
        kotlin.jvm.internal.l.j(model, "model");
        java.util.List list2 = model.f61170b;
        if (list2.isEmpty()) {
            list = Im.z.f14265a;
        } else {
            java.util.ArrayList arrayListU1 = Im.r.U1(list2);
            arrayListU1.remove(i10);
            list = arrayListU1;
        }
        return p336ng.i.u(model, null, list, null, null, null, null, null, 125);
    }

    private final void onFlightDetailsCtaClicked(int destinationIndex) {
        android.support.v4.media.session.b.I(this, new Ch.C0402v1(destinationIndex, 15), 1);
        L8.e.goTo$default(this, com.eightsleep.presentation_jetlag.navigation.JetLagRoute$TripSupplement.INSTANCE, false, 2, null);
    }

    private static final p336ng.i onFlightDetailsCtaClicked$lambda$24(int i10, p336ng.i model) {
        kotlin.jvm.internal.l.j(model, "model");
        java.util.ArrayList arrayList = new java.util.ArrayList();
        int i11 = 0;
        for (java.lang.Object obj : model.f61170b) {
            int i12 = i11 + 1;
            if (i11 < 0) {
                Im.s.s0();
                throw null;
            }
            if (i11 <= i10) {
                arrayList.add(obj);
            }
            i11 = i12;
        }
        return p336ng.i.u(model, null, arrayList, null, null, null, null, null, 125);
    }

    private final void onFlightSearchResultSelected(int flightSearchResultIndex, int destinationIndex) {
        android.support.v4.media.session.b.I(this, new com.eightsleep.presentation_jetlag.viewmodel.h(destinationIndex, flightSearchResultIndex, this), 1);
    }

    private static final p336ng.i onFlightSearchResultSelected$lambda$21(int i10, int i11, com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel, p336ng.i it) {
        int i12 = i11;
        kotlin.jvm.internal.l.j(it, "it");
        java.util.List list = it.f61170b;
        int i13 = 0;
        p336ng.k kVar = i10 == 0 ? ((p336ng.b) ((p336ng.a) list.get(0)).f61122d.get(i12)).f61125b : it.f61169a;
        java.util.ArrayList arrayList = new java.util.ArrayList(Im.t.z0(list, 10));
        for (java.lang.Object obj : list) {
            int i14 = i13 + 1;
            if (i13 < 0) {
                Im.s.s0();
                throw null;
            }
            p336ng.a aVarA = (p336ng.a) obj;
            if (i13 == i10) {
                p336ng.b bVar = (p336ng.b) aVarA.f61122d.get(i12);
                p336ng.k kVar2 = bVar.f61126c;
                Ga.s sVar = bVar.f61127d;
                aVarA = p336ng.a.a(aVarA, kVar2, new p336ng.o(null, sVar, bVar.f61128e), p336ng.c.a(aVarA.f61121c, null, sVar, false, null, 13), null, i12, 8);
            }
            arrayList.add(aVarA);
            i12 = i11;
            i13 = i14;
        }
        return p336ng.i.u(it, kVar, arrayList, null, jetLagTripViewModel.validateSchedule(kVar, arrayList), null, null, null, 116);
    }

    private static final p336ng.i onHouseholdUpdated$lambda$1$lambda$0(Qb.p pVar, p336ng.i model) {
        kotlin.jvm.internal.l.j(model, "model");
        return p336ng.i.u(model, null, null, null, null, null, null, pVar.f22566u, 63);
    }

    private final void onItineraryCtaClicked(p336ng.k origin, java.util.List<p336ng.a> destinations) {
        android.support.v4.media.session.b.I(this, new com.eightsleep.presentation_jetlag.viewmodel.f(2, origin, destinations), 1);
        L8.e.goTo$default(this, new com.eightsleep.presentation_jetlag.navigation.JetLagRoute$ManualEntryTripSchedule(0), false, 2, null);
    }

    private static final p336ng.i onItineraryCtaClicked$lambda$34(p336ng.k kVar, java.util.List list, p336ng.i it) {
        kotlin.jvm.internal.l.j(it, "it");
        java.util.ArrayList arrayList = new java.util.ArrayList();
        for (java.lang.Object obj : list) {
            if (!p294lo.n.q0(((p336ng.a) obj).f61119a.f61181a)) {
                arrayList.add(obj);
            }
        }
        return p336ng.i.u(it, kVar, Im.r.T1(arrayList), null, null, null, null, null, 124);
    }

    private final void onLocationSearchResultSelected(p336ng.k location, com.eightsleep.presentation_jetlag.enums.TripLocationType locationType, java.lang.Integer destinationIndex) {
        int i10 = com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$WhenMappings.$EnumSwitchMapping$0[locationType.ordinal()];
        if (i10 == 1) {
            android.support.v4.media.session.b.I(this, new com.eightsleep.presentation_jetlag.viewmodel.j(this, location, 0), 1);
        } else if (i10 == 2) {
            android.support.v4.media.session.b.I(this, new p061ce.C2684k1(destinationIndex, location, this, 4), 1);
        } else {
            if (i10 != 3) {
                throw new kotlin.NoWhenBranchMatchedException();
            }
            android.support.v4.media.session.b.I(this, new com.eightsleep.presentation_jetlag.viewmodel.j(this, location, 1), 1);
        }
    }

    private static final p336ng.i onLocationSearchResultSelected$lambda$47(com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel, p336ng.k kVar, p336ng.i it) {
        java.lang.Object next;
        kotlin.jvm.internal.l.j(it, "it");
        p336ng.j jVar = new p336ng.j();
        java.util.Iterator it2 = it.f61170b.iterator();
        while (it2.hasNext()) {
            next = it2.next();
            if (((p336ng.a) next).f61119a.f61184d == com.eightsleep.presentation_jetlag.enums.TripLocationType.DESTINATION) {
                return p336ng.i.u(it, kVar, null, jetLagTripViewModel.validateLocations(kVar, (p336ng.a) next), null, jVar, null, null, 106);
            }
        }
        next = null;
        return p336ng.i.u(it, kVar, null, jetLagTripViewModel.validateLocations(kVar, (p336ng.a) next), null, jVar, null, null, 106);
    }

    private static final p336ng.i onLocationSearchResultSelected$lambda$50(java.lang.Integer num, p336ng.k kVar, com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel, p336ng.i it) {
        kotlin.jvm.internal.l.j(it, "it");
        java.util.ArrayList arrayListU1 = Im.r.U1(it.f61170b);
        java.lang.Object obj = null;
        if (num != null) {
            p336ng.a aVar = new p336ng.a(kVar, ((p336ng.a) arrayListU1.get(num.intValue())).f61120b, null, 28);
            arrayListU1.remove(num.intValue());
            arrayListU1.add(num.intValue(), aVar);
        } else {
            for (java.lang.Object obj2 : arrayListU1) {
                if (((p336ng.a) obj2).f61119a.f61184d == com.eightsleep.presentation_jetlag.enums.TripLocationType.DESTINATION) {
                    obj = obj2;
                    break;
                }
            }
            if (((p336ng.a) obj) == null) {
                arrayListU1.add(p336ng.a.a(new p336ng.a(jetLagTripViewModel.displaySettings), kVar, null, null, null, 0, 30));
            } else {
                arrayListU1.add(arrayListU1.size() - 1, p336ng.a.a(new p336ng.a(jetLagTripViewModel.displaySettings), kVar, null, null, null, 0, 30));
            }
        }
        return p336ng.i.u(it, null, arrayListU1, null, null, new p336ng.j(), null, null, 109);
    }

    private static final p336ng.i onLocationSearchResultSelected$lambda$53(com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel, p336ng.k kVar, p336ng.i it) {
        java.lang.Object next;
        kotlin.jvm.internal.l.j(it, "it");
        java.util.List list = it.f61170b;
        java.util.Iterator it2 = list.iterator();
        do {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
        } while (((p336ng.a) next).f61119a.f61184d != com.eightsleep.presentation_jetlag.enums.TripLocationType.DESTINATION);
        p336ng.a aVar = (p336ng.a) next;
        p336ng.a aVarA = p336ng.a.a(new p336ng.a(jetLagTripViewModel.displaySettings), kVar, null, null, null, 0, 30);
        java.util.ArrayList arrayListU1 = Im.r.U1(list);
        if (aVar == null) {
            arrayListU1.add(aVarA);
        } else {
            arrayListU1.remove(aVar);
            arrayListU1.add(aVarA);
        }
        return p336ng.i.u(it, null, arrayListU1, jetLagTripViewModel.validateLocations(it.f61169a, aVarA), null, new p336ng.j(), null, null, com.google.android.gms.location.LocationRequest.PRIORITY_NO_POWER);
    }

    private final void onNotificationsEnabled() {
        p554wo.C.B(androidx.lifecycle.V.h(this), null, null, new com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$onNotificationsEnabled$1(this, null), 3);
    }

    private final void onScheduleCtaClicked(int destinationIndex, int numDestinations) {
        if (destinationIndex < numDestinations - 1) {
            L8.e.goTo$default(this, new com.eightsleep.presentation_jetlag.navigation.JetLagRoute$ManualEntryTripSchedule(destinationIndex + 1), false, 2, null);
        } else {
            L8.e.goTo$default(this, new com.eightsleep.presentation_jetlag.navigation.JetLagRoute$FindFlightReviewDetails(0), false, 2, null);
        }
    }

    private final void onScheduleDateChanged(int destinationIndex, com.eightsleep.presentation_jetlag.enums.TripSegment segment, java.time.LocalDate date) {
        android.support.v4.media.session.b.I(this, new P.C1522f0(this, destinationIndex, segment, date, 3), 1);
    }

    private static final p336ng.i onScheduleDateChanged$lambda$36(com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel, int i10, com.eightsleep.presentation_jetlag.enums.TripSegment tripSegment, java.time.LocalDate localDate, p336ng.i model) {
        Ga.s sVarC;
        Ga.s sVarC2;
        kotlin.jvm.internal.l.j(model, "model");
        java.util.List list = model.f61170b;
        java.util.ArrayList arrayList = new java.util.ArrayList(Im.t.z0(list, 10));
        int i11 = 0;
        for (java.lang.Object obj : list) {
            int i12 = i11 + 1;
            if (i11 < 0) {
                Im.s.s0();
                throw null;
            }
            p336ng.a aVarA = (p336ng.a) obj;
            if (i10 == i11) {
                p336ng.o oVar = aVarA.f61120b;
                if (tripSegment == com.eightsleep.presentation_jetlag.enums.TripSegment.DEPARTURE) {
                    Ga.s sVar = oVar.f61192b;
                    sVar.getClass();
                    kotlin.jvm.internal.l.j(localDate, "localDate");
                    java.time.LocalDateTime localDateTimeOf = java.time.LocalDateTime.of(localDate, sVar.l());
                    kotlin.jvm.internal.l.g(localDateTimeOf);
                    sVarC = Ga.s.c(sVar, localDateTimeOf);
                } else {
                    sVarC = oVar.f61192b;
                }
                com.eightsleep.presentation_jetlag.enums.TripSegment tripSegment2 = com.eightsleep.presentation_jetlag.enums.TripSegment.ARRIVAL;
                p336ng.o oVar2 = aVarA.f61120b;
                if (tripSegment == tripSegment2) {
                    Ga.s sVar2 = oVar2.f61193c;
                    sVar2.getClass();
                    kotlin.jvm.internal.l.j(localDate, "localDate");
                    java.time.LocalDateTime localDateTimeOf2 = java.time.LocalDateTime.of(localDate, sVar2.l());
                    kotlin.jvm.internal.l.g(localDateTimeOf2);
                    sVarC2 = Ga.s.c(sVar2, localDateTimeOf2);
                } else {
                    sVarC2 = oVar2.f61193c;
                }
                aVarA = p336ng.a.a(aVarA, null, p336ng.o.a(oVar, null, sVarC, sVarC2, 1), null, null, 0, 29);
            }
            arrayList.add(aVarA);
            i11 = i12;
        }
        return p336ng.i.u(model, null, arrayList, null, jetLagTripViewModel.validateSchedule(model.f61169a, arrayList), null, null, null, 117);
    }

    private final void onScheduleFieldClicked(int destinationIndex, com.eightsleep.presentation_jetlag.enums.TripSegment segment, com.eightsleep.presentation_jetlag.enums.SchedulePickerType schedulePickerType, p336ng.n currentPickerState) {
        android.support.v4.media.session.b.I(this, new Ng.H(destinationIndex, new p336ng.n(segment, schedulePickerType), currentPickerState, segment, schedulePickerType, 2), 1);
    }

    private static final p336ng.i onScheduleFieldClicked$lambda$41(int i10, p336ng.n nVar, p336ng.n nVar2, com.eightsleep.presentation_jetlag.enums.TripSegment tripSegment, com.eightsleep.presentation_jetlag.enums.SchedulePickerType schedulePickerType, p336ng.i model) {
        kotlin.jvm.internal.l.j(model, "model");
        java.util.List list = model.f61170b;
        java.util.ArrayList arrayList = new java.util.ArrayList(Im.t.z0(list, 10));
        int i11 = 0;
        for (java.lang.Object obj : list) {
            int i12 = i11 + 1;
            if (i11 < 0) {
                Im.s.s0();
                throw null;
            }
            p336ng.a aVarA = (p336ng.a) obj;
            if (i10 == i11) {
                aVarA = p336ng.a.a(aVarA, null, p336ng.o.a(aVarA.f61120b, kotlin.jvm.internal.l.e(nVar, nVar2) ? null : new p336ng.n(tripSegment, schedulePickerType), null, null, 6), null, null, 0, 29);
            }
            arrayList.add(aVarA);
            i11 = i12;
        }
        return p336ng.i.u(model, null, arrayList, null, null, null, null, null, 125);
    }

    private final void onScheduleTimeChanged(int destinationIndex, com.eightsleep.presentation_jetlag.enums.TripSegment segment, java.time.LocalTime time) {
        android.support.v4.media.session.b.I(this, new P.C1522f0(this, destinationIndex, segment, time, 2), 1);
    }

    private static final p336ng.i onScheduleTimeChanged$lambda$39(com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel, int i10, com.eightsleep.presentation_jetlag.enums.TripSegment tripSegment, java.time.LocalTime localTime, p336ng.i model) {
        kotlin.jvm.internal.l.j(model, "model");
        java.util.List list = model.f61170b;
        java.util.ArrayList arrayList = new java.util.ArrayList(Im.t.z0(list, 10));
        int i11 = 0;
        for (java.lang.Object obj : list) {
            int i12 = i11 + 1;
            if (i11 < 0) {
                Im.s.s0();
                throw null;
            }
            p336ng.a aVarA = (p336ng.a) obj;
            if (i10 == i11) {
                p336ng.o oVar = aVarA.f61120b;
                Ga.s sVarR = tripSegment == com.eightsleep.presentation_jetlag.enums.TripSegment.DEPARTURE ? Ga.s.r(oVar.f61192b, localTime, null, 6) : oVar.f61192b;
                com.eightsleep.presentation_jetlag.enums.TripSegment tripSegment2 = com.eightsleep.presentation_jetlag.enums.TripSegment.ARRIVAL;
                p336ng.o oVar2 = aVarA.f61120b;
                aVarA = p336ng.a.a(aVarA, null, p336ng.o.a(oVar, null, sVarR, tripSegment == tripSegment2 ? Ga.s.r(oVar2.f61193c, localTime, null, 6) : oVar2.f61193c, 1), null, null, 0, 29);
            }
            arrayList.add(aVarA);
            i11 = i12;
        }
        return p336ng.i.u(model, null, arrayList, null, jetLagTripViewModel.validateSchedule(model.f61169a, arrayList), null, null, null, 117);
    }

    private static final p336ng.i onUiAction$lambda$11(p260kg.S s10, p336ng.i model) {
        kotlin.jvm.internal.l.j(model, "model");
        java.util.List list = model.f61170b;
        java.util.ArrayList arrayList = new java.util.ArrayList(Im.t.z0(list, 10));
        int i10 = 0;
        for (java.lang.Object obj : list) {
            int i11 = i10 + 1;
            if (i10 < 0) {
                Im.s.s0();
                throw null;
            }
            p336ng.a aVarA = (p336ng.a) obj;
            p260kg.u uVar = (p260kg.u) s10;
            if (i10 == uVar.f55692b) {
                aVarA = p336ng.a.a(aVarA, null, null, p336ng.c.a(aVarA.f61121c, null, uVar.f55691a, false, null, 5), null, 0, 27);
            }
            arrayList.add(aVarA);
            i10 = i11;
        }
        return p336ng.i.u(model, null, arrayList, null, null, null, null, null, 125);
    }

    private static final p336ng.i onUiAction$lambda$13(p336ng.i model) {
        kotlin.jvm.internal.l.j(model, "model");
        java.util.List list = model.f61170b;
        java.util.ArrayList arrayListU1 = Im.r.U1(list);
        arrayListU1.add(new p336ng.a(null, new p336ng.o(null, Ga.s.r(((p336ng.a) list.get(0)).f61120b.f61193c, ((p336ng.a) list.get(0)).f61120b.f61192b.l(), null, 6), ((p336ng.a) list.get(0)).f61120b.f61193c), new p336ng.c(null, ((p336ng.a) arrayListU1.get(0)).f61120b.f61193c, 13), 25));
        return p336ng.i.u(model, null, arrayListU1, null, null, null, null, null, 125);
    }

    private static final p336ng.i onUiAction$lambda$15(p260kg.S s10, p336ng.i model) {
        p336ng.k kVar;
        kotlin.jvm.internal.l.j(model, "model");
        p260kg.y yVar = (p260kg.y) s10;
        int i10 = yVar.f55699b;
        java.util.List list = model.f61170b;
        p336ng.b bVar = (p336ng.b) ((p336ng.a) list.get(i10)).f61122d.get(yVar.f55698a);
        int i11 = 0;
        timber.log.Timber.f67879a.b("FLIGHT SEARCH CTA CLICKED. flight; " + bVar, new java.lang.Object[0]);
        int i12 = yVar.f55699b;
        if (i12 == 0) {
            p336ng.k kVar2 = bVar.f61125b;
            kVar = new p336ng.k(kVar2.f61181a, kVar2.f61182b, kVar2.f61183c, com.eightsleep.presentation_jetlag.enums.TripLocationType.ORIGIN);
        } else {
            kVar = model.f61169a;
        }
        java.util.ArrayList arrayList = new java.util.ArrayList(Im.t.z0(list, 10));
        for (java.lang.Object obj : list) {
            int i13 = i11 + 1;
            if (i11 < 0) {
                Im.s.s0();
                throw null;
            }
            p336ng.a aVarA = (p336ng.a) obj;
            if (i11 == i12) {
                p336ng.k kVar3 = aVarA.f61119a;
                p336ng.k kVar4 = bVar.f61126c;
                com.eightsleep.presentation_jetlag.enums.TripLocationType locationType = com.eightsleep.presentation_jetlag.enums.TripLocationType.DESTINATION;
                kVar3.getClass();
                java.lang.String city = kVar4.f61181a;
                kotlin.jvm.internal.l.j(city, "city");
                java.time.ZoneOffset timeZoneOffset = kVar4.f61183c;
                kotlin.jvm.internal.l.j(timeZoneOffset, "timeZoneOffset");
                kotlin.jvm.internal.l.j(locationType, "locationType");
                aVarA = p336ng.a.a(aVarA, new p336ng.k(city, kVar4.f61182b, timeZoneOffset, locationType), new p336ng.o(null, bVar.f61127d, bVar.f61128e), null, null, 0, 28);
            }
            arrayList.add(aVarA);
            i11 = i13;
        }
        return p336ng.i.u(model, kVar, arrayList, null, null, null, null, null, 124);
    }

    private static final p336ng.i onUiAction$lambda$16(p260kg.S s10, p336ng.i it) {
        kotlin.jvm.internal.l.j(it, "it");
        p260kg.C3567l c3567l = (p260kg.C3567l) s10;
        return p336ng.i.u(it, null, null, null, null, p336ng.j.a(it.f61173e, c3567l.f55678a, c3567l.f55679b, null, null, 24), null, null, 111);
    }

    private static final p336ng.i onUiAction$lambda$17(p336ng.i model) {
        kotlin.jvm.internal.l.j(model, "model");
        return p336ng.i.u(model, null, null, null, null, new p336ng.j(), null, null, 111);
    }

    private static final p336ng.i onUiAction$lambda$18(p336ng.i model) {
        kotlin.jvm.internal.l.j(model, "model");
        return p336ng.i.u(model, null, null, null, null, p336ng.j.a(model.f61173e, null, null, "", Im.B.f14216a, 7), null, null, 111);
    }

    private static final p336ng.i onUiAction$lambda$19(p260kg.S s10, p336ng.i model) {
        kotlin.jvm.internal.l.j(model, "model");
        return p336ng.i.u(model, null, null, null, null, null, java.lang.Boolean.valueOf(((p260kg.O) s10).f55657a), null, 95);
    }

    private static final p336ng.i onUiAction$lambda$3(p260kg.S s10, p336ng.i model) {
        kotlin.jvm.internal.l.j(model, "model");
        java.util.List list = model.f61170b;
        java.util.ArrayList arrayList = new java.util.ArrayList(Im.t.z0(list, 10));
        int i10 = 0;
        for (java.lang.Object obj : list) {
            int i11 = i10 + 1;
            if (i10 < 0) {
                Im.s.s0();
                throw null;
            }
            p336ng.a aVarA = (p336ng.a) obj;
            p260kg.r rVar = (p260kg.r) s10;
            if (i10 == rVar.f55688b) {
                aVarA = p336ng.a.a(aVarA, null, null, p336ng.c.a(aVarA.f61121c, null, null, rVar.f55687a, null, 3), null, 0, 27);
            }
            arrayList.add(aVarA);
            i10 = i11;
        }
        return p336ng.i.u(model, null, arrayList, null, null, null, null, null, 125);
    }

    private static final p336ng.i onUiAction$lambda$5(p260kg.S s10, p336ng.i model) {
        kotlin.jvm.internal.l.j(model, "model");
        java.util.List list = model.f61170b;
        java.util.ArrayList arrayList = new java.util.ArrayList(Im.t.z0(list, 10));
        int i10 = 0;
        for (java.lang.Object obj : list) {
            int i11 = i10 + 1;
            if (i10 < 0) {
                Im.s.s0();
                throw null;
            }
            p336ng.a aVarA = (p336ng.a) obj;
            p260kg.w wVar = (p260kg.w) s10;
            if (i10 == wVar.f55695b) {
                aVarA = p336ng.a.a(aVarA, null, null, p336ng.c.a(aVarA.f61121c, wVar.f55694a, null, false, null, 6), null, 0, 27);
            }
            arrayList.add(aVarA);
            i10 = i11;
        }
        return p336ng.i.u(model, null, arrayList, null, null, null, null, null, 125);
    }

    private static final p336ng.i onUiAction$lambda$7(p260kg.S s10, p336ng.i it) {
        kotlin.jvm.internal.l.j(it, "it");
        java.util.List list = it.f61170b;
        java.util.ArrayList arrayList = new java.util.ArrayList(Im.t.z0(list, 10));
        int i10 = 0;
        for (java.lang.Object obj : list) {
            int i11 = i10 + 1;
            if (i10 < 0) {
                Im.s.s0();
                throw null;
            }
            p336ng.a aVarA = (p336ng.a) obj;
            if (i10 == ((p260kg.t) s10).f55690a) {
                p336ng.c cVar = aVarA.f61121c;
                aVarA = p336ng.a.a(aVarA, null, null, p336ng.c.a(cVar, p294lo.u.a0(cVar.f61129a, " ", ""), null, false, null, 10), null, 0, 27);
            }
            arrayList.add(aVarA);
            i10 = i11;
        }
        return p336ng.i.u(it, null, arrayList, null, null, null, null, null, 125);
    }

    private static final p336ng.i onUiAction$lambda$9(p260kg.S s10, p336ng.i model) {
        kotlin.jvm.internal.l.j(model, "model");
        java.util.List list = model.f61170b;
        java.util.ArrayList arrayList = new java.util.ArrayList(Im.t.z0(list, 10));
        java.util.Iterator it = list.iterator();
        if (!it.hasNext()) {
            return p336ng.i.u(model, null, arrayList, null, null, null, null, null, 125);
        }
        s10.getClass();
        throw new java.lang.ClassCastException();
    }

    public static /* synthetic */ p336ng.i p(com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel, int i10, com.eightsleep.presentation_jetlag.enums.TripSegment tripSegment, java.time.LocalTime localTime, p336ng.i iVar) {
        return onScheduleTimeChanged$lambda$39(jetLagTripViewModel, i10, tripSegment, localTime, iVar);
    }

    public static /* synthetic */ p336ng.i q(Qb.p pVar, p336ng.i iVar) {
        return onHouseholdUpdated$lambda$1$lambda$0(pVar, iVar);
    }

    public static /* synthetic */ p336ng.i r(p336ng.k kVar, java.util.List list, p336ng.i iVar) {
        return onItineraryCtaClicked$lambda$34(kVar, list, iVar);
    }

    public static /* synthetic */ p336ng.i s(p260kg.S s10, p336ng.i iVar) {
        return onUiAction$lambda$16(s10, iVar);
    }

    private final void searchForLocation(java.lang.String query, com.eightsleep.presentation_jetlag.enums.TripLocationType locationType) {
        if (query.length() < 2) {
            android.support.v4.media.session.b.I(this, new com.eightsleep.presentation_jetlag.viewmodel.k(query, 0), 1);
            return;
        }
        setLoading(com.eightsleep.presentation_jetlag.enums.JetLagLoadingKey.LOCATION_SEARCH, new com.eightsleep.presentation_jetlag.viewmodel.k(query, 1));
        p554wo.InterfaceC5088h0 interfaceC5088h0 = this.locationSearchJob;
        if (interfaceC5088h0 != null) {
            interfaceC5088h0.b(null);
        }
        this.locationSearchJob = p554wo.C.B(androidx.lifecycle.V.h(this), null, null, new com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$searchForLocation$3(this, query, locationType, null), 3);
    }

    private static final p336ng.i searchForLocation$lambda$44(java.lang.String str, p336ng.i it) {
        kotlin.jvm.internal.l.j(it, "it");
        return p336ng.i.u(it, null, null, null, null, p336ng.j.a(it.f61173e, null, null, str, Im.B.f14216a, 7), null, null, 111);
    }

    private static final p336ng.i searchForLocation$lambda$45(java.lang.String str, p336ng.i it) {
        kotlin.jvm.internal.l.j(it, "it");
        return p336ng.i.u(it, null, null, null, null, p336ng.j.a(it.f61173e, null, null, str, null, 23), null, null, 111);
    }

    private final void selectFlightSearchResult(p161gc.a flight, int destinationIndex) {
        android.support.v4.media.session.b.I(this, new P.C1522f0(destinationIndex, new p336ng.k(flight.f48466d, flight.f48464b, flight.f48468f, 8), mapFlightToDestinationUiModel(flight), this), 1);
        L8.e.goTo$default(this, new com.eightsleep.presentation_jetlag.navigation.JetLagRoute$FindFlightReviewDetails(destinationIndex), false, 2, null);
    }

    private static final p336ng.i selectFlightSearchResult$lambda$32(int i10, p336ng.k kVar, p336ng.a aVar, com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel, p336ng.i model) {
        java.util.ArrayList arrayListU1;
        kotlin.jvm.internal.l.j(model, "model");
        p336ng.k kVar2 = model.f61169a;
        p336ng.k kVar3 = i10 == 0 ? kVar : kVar2;
        java.util.List list = model.f61170b;
        if (list.size() == i10) {
            arrayListU1 = Im.r.U1(list);
            arrayListU1.add(aVar);
        } else {
            java.util.ArrayList arrayList = new java.util.ArrayList(Im.t.z0(list, 10));
            int i11 = 0;
            for (java.lang.Object obj : list) {
                int i12 = i11 + 1;
                if (i11 < 0) {
                    Im.s.s0();
                    throw null;
                }
                p336ng.a aVarA = (p336ng.a) obj;
                if (i11 == i10) {
                    aVarA = p336ng.a.a(aVarA, aVar.f61119a, aVar.f61120b, p336ng.c.a(aVar.f61121c, null, null, false, jetLagTripViewModel.validateLocations(i10 == 0 ? kVar : kVar2, aVar), 7), null, 0, 24);
                }
                arrayList.add(aVarA);
                i11 = i12;
            }
            arrayListU1 = arrayList;
        }
        return p336ng.i.u(model, kVar3, arrayListU1, null, null, null, null, null, 124);
    }

    private final void showFlightSearchResults(java.util.List<p161gc.a> flights, int destinationIndex) {
        android.support.v4.media.session.b.I(this, new com.eightsleep.presentation_jetlag.viewmodel.l(flights, destinationIndex, 1), 1);
        L8.e.goTo$default(this, new com.eightsleep.presentation_jetlag.navigation.JetLagRoute$FindFlightFlightSearchResults(destinationIndex), false, 2, null);
    }

    private static final p336ng.i showFlightSearchResults$lambda$29(int i10, java.util.List list, p336ng.i model) {
        java.util.Iterator it;
        kotlin.jvm.internal.l.j(model, "model");
        java.util.List list2 = model.f61170b;
        int i11 = 10;
        java.util.ArrayList arrayList = new java.util.ArrayList(Im.t.z0(list2, 10));
        java.util.Iterator it2 = list2.iterator();
        int i12 = 0;
        while (it2.hasNext()) {
            java.lang.Object next = it2.next();
            int i13 = i12 + 1;
            if (i12 < 0) {
                Im.s.s0();
                throw null;
            }
            p336ng.a aVarA = (p336ng.a) next;
            if (i12 == i10) {
                java.util.ArrayList arrayList2 = new java.util.ArrayList(Im.t.z0(list, i11));
                java.util.Iterator it3 = list.iterator();
                while (it3.hasNext()) {
                    p161gc.a aVar = (p161gc.a) it3.next();
                    java.lang.String str = aVar.f48463a;
                    com.eightsleep.presentation_jetlag.enums.TripLocationType tripLocationType = com.eightsleep.presentation_jetlag.enums.TripLocationType.ORIGIN;
                    p336ng.k kVar = new p336ng.k(aVar.f48466d, aVar.f48464b, aVar.f48468f, tripLocationType);
                    com.eightsleep.presentation_jetlag.enums.TripLocationType tripLocationType2 = com.eightsleep.presentation_jetlag.enums.TripLocationType.DESTINATION;
                    arrayList2.add(new p336ng.b(str, kVar, new p336ng.k(aVar.f48471i, aVar.f48469g, aVar.k, tripLocationType2), aVar.f48467e, aVar.f48472j));
                    it2 = it2;
                }
                it = it2;
                aVarA = p336ng.a.a(aVarA, null, null, null, arrayList2, 0, 23);
            } else {
                it = it2;
            }
            arrayList.add(aVarA);
            i12 = i13;
            it2 = it;
            i11 = 10;
        }
        return p336ng.i.u(model, null, arrayList, null, null, null, null, null, 125);
    }

    public static /* synthetic */ p336ng.i t(int i10, p336ng.i iVar) {
        return onDeleteDestinationClicked$lambda$43(i10, iVar);
    }

    public static /* synthetic */ p336ng.i u(int i10, java.util.List list, p336ng.i iVar) {
        return showFlightSearchResults$lambda$29(i10, list, iVar);
    }

    public static /* synthetic */ p336ng.i v(java.lang.Integer num, p336ng.k kVar, com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel, p336ng.i iVar) {
        return onLocationSearchResultSelected$lambda$50(num, kVar, jetLagTripViewModel, iVar);
    }

    private final Ya.H validateLocations(p336ng.k origin, p336ng.a destination) {
        if (origin != null && destination != null) {
            if (kotlin.jvm.internal.l.e(origin.f61181a, destination.f61119a.f61181a)) {
                return new Ya.H(com.eightsleep.eight.R$string.jet_lag_location_error_locations_cannot_be_the_same, null, null, 6);
            }
        }
        return null;
    }

    private final java.util.Map<java.lang.Integer, Ya.H> validateSchedule(p336ng.k originLocation, java.util.List<p336ng.a> destinations) {
        Ya.H h10;
        java.util.LinkedHashMap linkedHashMap = new java.util.LinkedHashMap();
        int size = destinations.size();
        int i10 = 0;
        while (i10 < size) {
            p336ng.a aVar = destinations.get(i10);
            p336ng.k kVar = i10 > 0 ? destinations.get(i10 - 1).f61119a : originLocation;
            java.lang.Integer numValueOf = java.lang.Integer.valueOf(i10);
            Ga.s sVarN = aVar.f61120b.f61192b.n(kVar.f61183c);
            p336ng.o oVar = aVar.f61120b;
            Ga.s sVar = oVar.f61193c;
            p336ng.k kVar2 = aVar.f61119a;
            Ya.H h11 = null;
            if (sVarN.a(sVar.n(kVar2.f61183c)) > 0) {
                h10 = new Ya.H(com.eightsleep.eight.R$string.jet_lag_schedule_error_arrival_time_must_be_after_departure, null, null, 6);
            } else {
                Ga.s sVar2 = oVar.f61192b;
                java.time.ZoneOffset zoneOffset = kVar2.f61183c;
                java.time.ZoneOffset zoneOffset2 = kVar.f61183c;
                if (i10 <= 0 || sVar2.n(zoneOffset).a(destinations.get(i10 - 1).f61120b.f61193c.n(zoneOffset2)) >= 0) {
                    if (kVar2.f61184d == com.eightsleep.presentation_jetlag.enums.TripLocationType.LAYOVER) {
                        if (java.time.temporal.ChronoUnit.HOURS.between(sVar2.n(zoneOffset2).f12088a, oVar.f61193c.n(zoneOffset).f12088a) > 20) {
                            h10 = new Ya.H(com.eightsleep.eight.R$string.jet_lag_schedule_error_layover_over_20_hours, null, null, 6);
                        }
                    }
                    linkedHashMap.put(numValueOf, h11);
                    i10++;
                } else {
                    h10 = new Ya.H(com.eightsleep.eight.R$string.jet_lag_schedule_error_departure_must_be_after_previous_flight_arrival, null, null, 6);
                }
            }
            h11 = h10;
            linkedHashMap.put(numValueOf, h11);
            i10++;
        }
        return linkedHashMap;
    }

    public static /* synthetic */ p336ng.i w(p260kg.S s10, p336ng.i iVar) {
        return onUiAction$lambda$5(s10, iVar);
    }

    public static /* synthetic */ p336ng.i x(p260kg.S s10, p336ng.i iVar) {
        return onUiAction$lambda$3(s10, iVar);
    }

    public static /* synthetic */ p336ng.i y(com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel, int i10, com.eightsleep.presentation_jetlag.enums.TripSegment tripSegment, java.time.LocalDate localDate, p336ng.i iVar) {
        return onScheduleDateChanged$lambda$36(jetLagTripViewModel, i10, tripSegment, localDate, iVar);
    }

    public static /* synthetic */ p336ng.i z(p260kg.S s10, p336ng.i iVar) {
        return onUiAction$lambda$15(s10, iVar);
    }

    @Override // L8.e, Y7.o
    public p055c8.e getDefaultLoadingKey() {
        return com.eightsleep.presentation_jetlag.enums.JetLagLoadingKey.CTA_BUTTON;
    }

    @Override // Y7.o
    public Y7.n getInitialViewState() {
        Ga.f fVar = this.displaySettings;
        return new Y7.i(new p336ng.i(new p336ng.k((java.lang.String) null, (java.lang.String) null, (java.time.ZoneOffset) null, 15), Im.s.f0(new p336ng.a(fVar)), null, Im.A.f14215a, new p336ng.j(), null, null));
    }

    @Override // L8.m
    public void onHouseholdUpdated(Qb.j household) {
        kotlin.jvm.internal.l.j(household, "household");
        Qb.p pVarE = household.e();
        if (pVarE != null) {
            android.support.v4.media.session.b.I(this, new com.eightsleep.presentation_jetlag.viewmodel.g(pVarE, 2), 1);
        }
    }

    @Override // L8.e
    public /* bridge */ /* synthetic */ void onUiAction(Z7.c cVar) {
        onUiAction((p260kg.S) cVar);
    }

    public void onUiAction(p260kg.S action) {
        kotlin.jvm.internal.l.j(action, "action");
        logUiActionEvent(action, Rc.A.f23619a);
        if (action instanceof p260kg.C3568m) {
            onBackPressed();
            return;
        }
        if (action instanceof p260kg.C3566k) {
            L8.e.goTo$default(this, com.eightsleep.presentation_jetlag.navigation.JetLagRoute$ManualEntryTripRoute.INSTANCE, false, 2, null);
            return;
        }
        if (action instanceof p260kg.B) {
            L8.e.goTo$default(this, com.eightsleep.corepresentation.navigation.route.Route$JetLagAnnouncement.INSTANCE, false, 2, null);
            return;
        }
        if (action instanceof p260kg.r) {
            android.support.v4.media.session.b.I(this, new com.eightsleep.presentation_jetlag.viewmodel.i(action, 2), 1);
            return;
        }
        if (action instanceof p260kg.C3572q) {
            p260kg.C3572q c3572q = (p260kg.C3572q) action;
            findFlight(c3572q.f55684a, c3572q.f55685b, c3572q.f55686c);
            return;
        }
        if (action instanceof p260kg.C3573s) {
            L8.e.goTo$default(this, new com.eightsleep.presentation_jetlag.navigation.JetLagRoute$FindFlightNumberSearch(0), false, 2, null);
            return;
        }
        if (action instanceof p260kg.w) {
            android.support.v4.media.session.b.I(this, new com.eightsleep.presentation_jetlag.viewmodel.i(action, 4), 1);
            return;
        }
        if (action instanceof p260kg.t) {
            android.support.v4.media.session.b.I(this, new com.eightsleep.presentation_jetlag.viewmodel.i(action, 5), 1);
            L8.e.goTo$default(this, new com.eightsleep.presentation_jetlag.navigation.JetLagRoute$FindFlightDepartureDate(((p260kg.t) action).f55690a), false, 2, null);
            return;
        }
        if (action instanceof p260kg.u) {
            android.support.v4.media.session.b.I(this, new com.eightsleep.presentation_jetlag.viewmodel.i(action, 6), 1);
            return;
        }
        if (action instanceof p260kg.C3565j) {
            if (((p260kg.C3565j) action).f55676a == 1) {
                android.support.v4.media.session.b.I(this, new p062cf.n(19), 1);
            }
            L8.e.goTo$default(this, new com.eightsleep.presentation_jetlag.navigation.JetLagRoute$FindFlightNumberSearch(1), false, 2, null);
            return;
        }
        if (action instanceof p260kg.x) {
            p260kg.x xVar = (p260kg.x) action;
            onFlightSearchResultSelected(xVar.f55697b, xVar.f55696a);
            return;
        }
        if (action instanceof p260kg.y) {
            android.support.v4.media.session.b.I(this, new com.eightsleep.presentation_jetlag.viewmodel.i(action, 0), 1);
            br.a aVar = timber.log.Timber.f67879a;
            aVar.b("FLIGHT SEARCH CTA CLICKED. origin; " + ((p336ng.i) getUiModel()).f61169a, new java.lang.Object[0]);
            aVar.b("FLIGHT SEARCH CTA CLICKED. destinations: " + ((p336ng.i) getUiModel()).f61170b, new java.lang.Object[0]);
            L8.e.goTo$default(this, new com.eightsleep.presentation_jetlag.navigation.JetLagRoute$FindFlightReviewDetails(((p260kg.y) action).f55699b), false, 2, null);
            return;
        }
        if (action instanceof p260kg.v) {
            onFlightDetailsCtaClicked(((p260kg.v) action).f55693a);
            return;
        }
        if (action instanceof p260kg.z) {
            p260kg.z zVar = (p260kg.z) action;
            onItineraryCtaClicked(zVar.f55700a, zVar.f55701b);
            return;
        }
        if (action instanceof p260kg.C3567l) {
            android.support.v4.media.session.b.I(this, new com.eightsleep.presentation_jetlag.viewmodel.i(action, 1), 1);
            return;
        }
        if (action instanceof p260kg.C) {
            p260kg.C c4 = (p260kg.C) action;
            searchForLocation(c4.f55630a, c4.f55631b);
            return;
        }
        if (action instanceof p260kg.D) {
            p260kg.D d10 = (p260kg.D) action;
            onLocationSearchResultSelected(d10.f55632a, d10.f55633b, d10.f55634c);
            return;
        }
        if (action instanceof p260kg.M) {
            android.support.v4.media.session.b.I(this, new p062cf.n(17), 1);
            return;
        }
        if (action instanceof p260kg.C3570o) {
            onDeleteDestinationClicked(((p260kg.C3570o) action).f55682a);
            return;
        }
        if (action instanceof p260kg.C3569n) {
            p554wo.InterfaceC5088h0 interfaceC5088h0 = this.locationSearchJob;
            if (interfaceC5088h0 != null) {
                interfaceC5088h0.b(null);
            }
            android.support.v4.media.session.b.I(this, new p062cf.n(18), 1);
            return;
        }
        if (action instanceof p260kg.J) {
            p260kg.J j5 = (p260kg.J) action;
            onScheduleFieldClicked(j5.f55645a, j5.f55647c, com.eightsleep.presentation_jetlag.enums.SchedulePickerType.DATE, j5.f55646b);
            return;
        }
        if (action instanceof p260kg.L) {
            p260kg.L l = (p260kg.L) action;
            onScheduleFieldClicked(l.f55651a, l.f55653c, com.eightsleep.presentation_jetlag.enums.SchedulePickerType.TIME, l.f55652b);
            return;
        }
        if (action instanceof p260kg.I) {
            p260kg.I i10 = (p260kg.I) action;
            onScheduleDateChanged(i10.f55642a, i10.f55643b, i10.f55644c);
            return;
        }
        if (action instanceof p260kg.K) {
            p260kg.K k = (p260kg.K) action;
            onScheduleTimeChanged(k.f55648a, k.f55649b, k.f55650c);
            return;
        }
        if (action instanceof p260kg.H) {
            p260kg.H h10 = (p260kg.H) action;
            onScheduleCtaClicked(h10.f55640a, h10.f55641b);
            return;
        }
        if (action instanceof p260kg.O) {
            android.support.v4.media.session.b.I(this, new com.eightsleep.presentation_jetlag.viewmodel.i(action, 3), 1);
            return;
        }
        if (action instanceof p260kg.N) {
            p260kg.N n8 = (p260kg.N) action;
            checkNotificationsPermissions(n8.f55655a, n8.f55656b);
            return;
        }
        if (action instanceof p260kg.P) {
            L8.e.goTo$default(this, new com.eightsleep.corepresentation.navigation.route.Route$WebView("https://www.eightsleep.com/product/jet-lag/", false, (java.lang.String) null, false, (java.lang.String) null, (java.lang.String) null, (java.lang.String) null, false, false, false, false, 2046, (kotlin.jvm.internal.DefaultConstructorMarker) null), false, 2, null);
            return;
        }
        if (action instanceof p260kg.Q) {
            L8.e.goTo$default(this, com.eightsleep.presentation_jetlag.navigation.JetLagRoute$TripSupplement.INSTANCE, false, 2, null);
            return;
        }
        if (action instanceof p260kg.G) {
            p260kg.G g10 = (p260kg.G) action;
            java.lang.Boolean bool = g10.f55639c;
            kotlin.jvm.internal.l.g(bool);
            createTripAndJetLagPlan(g10.f55637a, g10.f55638b, bool.booleanValue());
            return;
        }
        if ((action instanceof p260kg.C3571p) || (action instanceof p260kg.E)) {
            L8.e.goTo$default(this, com.eightsleep.presentation_jetlag.navigation.JetLagRoute$ProtocolLoading.INSTANCE, false, 2, null);
        } else if (action instanceof p260kg.F) {
            onNotificationsEnabled();
        } else {
            if (!(action instanceof p260kg.A)) {
                throw new kotlin.NoWhenBranchMatchedException();
            }
            L8.e.setHeroBottomsheet$default(this, p361og.f.f62673h.invoke(), null, com.eightsleep.eight.R$string.jet_lag_trip_supplements_ingredients_bottomsheet_title, java.lang.Integer.valueOf(com.eightsleep.eight.R$string.jet_lag_trip_supplements_ingredients_bottomsheet_body), 2, null);
        }
    }
}
