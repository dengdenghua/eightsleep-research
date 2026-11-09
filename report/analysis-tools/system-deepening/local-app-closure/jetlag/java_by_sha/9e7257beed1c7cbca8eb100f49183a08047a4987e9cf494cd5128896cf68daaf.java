package com.eightsleep.presentation_jetlag.viewmodel;

/* JADX INFO: loaded from: classes2.dex */
@kotlin.Metadata(d1 = {"\u0000¶\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0002\b\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001ZBK\b\u0007\u0012\b\b\u0001\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\u0006\u0010\u000b\u001a\u00020\n\u0012\u0006\u0010\r\u001a\u00020\f\u0012\u0006\u0010\u000f\u001a\u00020\u000e\u0012\u0006\u0010\u0011\u001a\u00020\u0010\u0012\u0006\u0010\u0013\u001a\u00020\u0012¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0017\u001a\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u0017\u0010\u001b\u001a\u00020\u001a2\u0006\u0010\u0019\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0017\u0010\u001f\u001a\u00020\u001a2\u0006\u0010\u001e\u001a\u00020\u001dH\u0016¢\u0006\u0004\b\u001f\u0010 J%\u0010%\u001a\u00020\u001a2\u0006\u0010!\u001a\u00020\u00042\f\u0010$\u001a\b\u0012\u0004\u0012\u00020#0\"H\u0002¢\u0006\u0004\b%\u0010&J\u0017\u0010'\u001a\u00020\u001a2\u0006\u0010\u0005\u001a\u00020\u0004H\u0002¢\u0006\u0004\b'\u0010(J\u0017\u0010)\u001a\u00020\u001a2\u0006\u0010\u0005\u001a\u00020\u0004H\u0002¢\u0006\u0004\b)\u0010(J\u0017\u0010*\u001a\u00020\u001a2\u0006\u0010\u0005\u001a\u00020\u0004H\u0002¢\u0006\u0004\b*\u0010(J9\u0010/\u001a\u00020\u001a2\u0006\u0010!\u001a\u00020\u00042\f\u0010$\u001a\b\u0012\u0004\u0012\u00020#0\"2\u0006\u0010,\u001a\u00020+2\n\b\u0002\u0010.\u001a\u0004\u0018\u00010-H\u0002¢\u0006\u0004\b/\u00100J\u000f\u00101\u001a\u00020\u001aH\u0002¢\u0006\u0004\b1\u00102J\u0019\u00104\u001a\u00020\u00042\b\u00103\u001a\u0004\u0018\u00010-H\u0002¢\u0006\u0004\b4\u00105J%\u0010;\u001a\b\u0012\u0004\u0012\u00020:0\"2\u0006\u00107\u001a\u0002062\u0006\u00109\u001a\u000208H\u0002¢\u0006\u0004\b;\u0010<J\u001f\u0010>\u001a\u00020\u00042\u0006\u0010=\u001a\u00020-2\u0006\u00107\u001a\u000206H\u0002¢\u0006\u0004\b>\u0010?J/\u0010C\u001a\u001a\u0012\u0004\u0012\u00020A\u0012\u0010\u0012\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020B0\"0\"0@2\u0006\u00109\u001a\u000208H\u0002¢\u0006\u0004\bC\u0010DJ\u0017\u0010E\u001a\u00020\u001a2\u0006\u00107\u001a\u000206H\u0002¢\u0006\u0004\bE\u0010FJ\u0017\u0010I\u001a\u00020\u00042\u0006\u0010H\u001a\u00020GH\u0002¢\u0006\u0004\bI\u0010JJ\u0017\u0010N\u001a\u00020M2\u0006\u0010L\u001a\u00020KH\u0002¢\u0006\u0004\bN\u0010OR\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010PR\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010QR\u0014\u0010\t\u001a\u00020\b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010RR\u0014\u0010\u000b\u001a\u00020\n8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010SR\u0014\u0010\r\u001a\u00020\f8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010TR\u0014\u0010\u000f\u001a\u00020\u000e8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010UR\u0014\u0010\u0011\u001a\u00020\u00108\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010VR\u0018\u0010X\u001a\u0004\u0018\u00010W8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bX\u0010Y¨\u0006["}, d2 = {"Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagPlanViewModel;", "LL8/e;", "Lng/e;", "Lkg/i;", "", "tripId", "Lxd/D;", "observeDisplaySettingsUseCase", "Lhc/A;", "getTripByIdUseCase", "Lhc/S;", "toggleJetLagTaskCompletionUseCase", "Lhc/K;", "observeJetLagPlanUseCase", "Lhc/k;", "deleteTripUseCase", "Lhc/W;", "updateTripUseCase", "LRc/b;", "analytics", "<init>", "(Ljava/lang/String;Lxd/D;Lhc/A;Lhc/S;Lhc/K;Lhc/k;Lhc/W;LRc/b;)V", "LY7/n;", "getInitialViewState", "()LY7/n;", "action", "LHm/B;", "onUiAction", "(Lkg/i;)V", "Landroidx/lifecycle/v;", "owner", "onCreate", "(Landroidx/lifecycle/v;)V", "planId", "", "Lng/h;", "tasks", "showSupplementTaskConfirmationDialog", "(Ljava/lang/String;Ljava/util/List;)V", "showEndTripConfirmationDialog", "(Ljava/lang/String;)V", "endTrip", "deleteTrip", "", "isComplete", "", "supplementCount", "onTaskCompletionToggled", "(Ljava/lang/String;Ljava/util/List;ZLjava/lang/Integer;)V", "getPlanAndTasks", "()V", "offsetHours", "formatTimezoneOffset", "(Ljava/lang/Integer;)Ljava/lang/String;", "Lgc/o;", "trip", "Lgc/c;", "plan", "Lng/g;", "mapPlanToUiModel", "(Lgc/o;Lgc/c;)Ljava/util/List;", "flightNumber", "getFormattedFlightCardLocationLabel", "(ILgc/o;)Ljava/lang/String;", "", "Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;", "Lgc/e;", "groupTasksByPhaseAndDate", "(Lgc/c;)Ljava/util/Map;", "pollTimeAtDestination", "(Lgc/o;)V", "Ljava/time/LocalDateTime;", "departureDate", "formatTimeUntilDeparture", "(Ljava/time/LocalDateTime;)Ljava/lang/String;", "Lgc/q;", "destination", "LGa/s;", "calculateTimeAtDestination", "(Lgc/q;)LGa/s;", "Ljava/lang/String;", "Lxd/D;", "Lhc/A;", "Lhc/S;", "Lhc/K;", "Lhc/k;", "Lhc/W;", "LGa/f;", "displaySettings", "LGa/f;", "Factory", "presentation-jetlag_tencentRelease"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class JetLagPlanViewModel extends L8.e {
    public static final int $stable = 8;
    private final p187hc.InterfaceC3156k deleteTripUseCase;
    private Ga.f displaySettings;
    private final p187hc.A getTripByIdUseCase;
    private final p569xd.D observeDisplaySettingsUseCase;
    private final p187hc.K observeJetLagPlanUseCase;
    private final p187hc.S toggleJetLagTaskCompletionUseCase;
    private final java.lang.String tripId;
    private final p187hc.W updateTripUseCase;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public JetLagPlanViewModel(java.lang.String tripId, p569xd.D observeDisplaySettingsUseCase, p187hc.A getTripByIdUseCase, p187hc.S toggleJetLagTaskCompletionUseCase, p187hc.K observeJetLagPlanUseCase, p187hc.InterfaceC3156k deleteTripUseCase, p187hc.W updateTripUseCase, Rc.C1650b analytics) {
        super(analytics);
        kotlin.jvm.internal.l.j(tripId, "tripId");
        kotlin.jvm.internal.l.j(observeDisplaySettingsUseCase, "observeDisplaySettingsUseCase");
        kotlin.jvm.internal.l.j(getTripByIdUseCase, "getTripByIdUseCase");
        kotlin.jvm.internal.l.j(toggleJetLagTaskCompletionUseCase, "toggleJetLagTaskCompletionUseCase");
        kotlin.jvm.internal.l.j(observeJetLagPlanUseCase, "observeJetLagPlanUseCase");
        kotlin.jvm.internal.l.j(deleteTripUseCase, "deleteTripUseCase");
        kotlin.jvm.internal.l.j(updateTripUseCase, "updateTripUseCase");
        kotlin.jvm.internal.l.j(analytics, "analytics");
        this.tripId = tripId;
        this.observeDisplaySettingsUseCase = observeDisplaySettingsUseCase;
        this.getTripByIdUseCase = getTripByIdUseCase;
        this.toggleJetLagTaskCompletionUseCase = toggleJetLagTaskCompletionUseCase;
        this.observeJetLagPlanUseCase = observeJetLagPlanUseCase;
        this.deleteTripUseCase = deleteTripUseCase;
        this.updateTripUseCase = updateTripUseCase;
        p554wo.C.B(androidx.lifecycle.V.h(this), null, null, new com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$1(this, null), 3);
    }

    public static final /* synthetic */ Ga.s access$calculateTimeAtDestination(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel, p161gc.q qVar) {
        return jetLagPlanViewModel.calculateTimeAtDestination(qVar);
    }

    public static final /* synthetic */ java.lang.String access$formatTimeUntilDeparture(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel, java.time.LocalDateTime localDateTime) {
        return jetLagPlanViewModel.formatTimeUntilDeparture(localDateTime);
    }

    public static final /* synthetic */ java.lang.String access$formatTimezoneOffset(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel, java.lang.Integer num) {
        return jetLagPlanViewModel.formatTimezoneOffset(num);
    }

    public static final /* synthetic */ p187hc.InterfaceC3156k access$getDeleteTripUseCase$p(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel) {
        return jetLagPlanViewModel.deleteTripUseCase;
    }

    public static final /* synthetic */ Ga.f access$getDisplaySettings$p(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel) {
        return jetLagPlanViewModel.displaySettings;
    }

    public static final /* synthetic */ p187hc.A access$getGetTripByIdUseCase$p(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel) {
        return jetLagPlanViewModel.getTripByIdUseCase;
    }

    public static final /* synthetic */ p569xd.D access$getObserveDisplaySettingsUseCase$p(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel) {
        return jetLagPlanViewModel.observeDisplaySettingsUseCase;
    }

    public static final /* synthetic */ p187hc.K access$getObserveJetLagPlanUseCase$p(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel) {
        return jetLagPlanViewModel.observeJetLagPlanUseCase;
    }

    public static final /* synthetic */ p187hc.S access$getToggleJetLagTaskCompletionUseCase$p(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel) {
        return jetLagPlanViewModel.toggleJetLagTaskCompletionUseCase;
    }

    public static final /* synthetic */ java.lang.String access$getTripId$p(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel) {
        return jetLagPlanViewModel.tripId;
    }

    public static final /* synthetic */ p187hc.W access$getUpdateTripUseCase$p(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel) {
        return jetLagPlanViewModel.updateTripUseCase;
    }

    public static final /* synthetic */ java.util.List access$mapPlanToUiModel(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel, p161gc.o oVar, p161gc.c cVar) {
        return jetLagPlanViewModel.mapPlanToUiModel(oVar, cVar);
    }

    public static final /* synthetic */ void access$pollTimeAtDestination(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel, p161gc.o oVar) {
        jetLagPlanViewModel.pollTimeAtDestination(oVar);
    }

    public static final /* synthetic */ void access$setDisplaySettings$p(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel, Ga.f fVar) {
        jetLagPlanViewModel.displaySettings = fVar;
    }

    public static /* synthetic */ Hm.B c(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel, java.lang.String str) {
        return showEndTripConfirmationDialog$lambda$4(jetLagPlanViewModel, str);
    }

    private final Ga.s calculateTimeAtDestination(p161gc.q destination) {
        Ga.s sVar = Ga.s.f12085c;
        Ga.f fVar = this.displaySettings;
        return Dl.A0.v(fVar != null ? fVar.f12062d : null).n(destination.f48576c);
    }

    public static /* synthetic */ p336ng.e d(p260kg.AbstractC3564i abstractC3564i, p336ng.e eVar) {
        return onUiAction$lambda$1(abstractC3564i, eVar);
    }

    private final void deleteTrip(java.lang.String tripId) {
        p554wo.C.B(androidx.lifecycle.V.h(this), null, null, new com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$deleteTrip$1(this, tripId, null), 3);
    }

    public static /* synthetic */ Hm.B e(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel, java.lang.String str) {
        return showEndTripConfirmationDialog$lambda$3(jetLagPlanViewModel, str);
    }

    private final void endTrip(java.lang.String tripId) {
        p554wo.C.B(androidx.lifecycle.V.h(this), null, null, new com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$endTrip$1(this, tripId, null), 3);
    }

    public static /* synthetic */ Hm.B f(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel, java.lang.String str, java.util.List list, p021an.k kVar, kotlin.jvm.internal.y yVar) {
        return showSupplementTaskConfirmationDialog$lambda$2(jetLagPlanViewModel, str, list, kVar, yVar);
    }

    private final java.lang.String formatTimeUntilDeparture(java.time.LocalDateTime departureDate) {
        long jBetween = java.time.temporal.ChronoUnit.HOURS.between(java.time.LocalDateTime.now(), departureDate);
        if (-2147483648L <= jBetween && jBetween < 1) {
            return "In Flight";
        }
        if (0 <= jBetween && jBetween < 2) {
            return "<1h";
        }
        if (1 <= jBetween && jBetween < 49) {
            return jBetween + "h";
        }
        return (jBetween / ((long) 24)) + " days";
    }

    private final java.lang.String formatTimezoneOffset(java.lang.Integer offsetHours) {
        if (offsetHours == null) {
            return "+0h";
        }
        if (offsetHours.intValue() >= 0) {
            return "+" + offsetHours + "h";
        }
        if (offsetHours.intValue() >= 0) {
            return "";
        }
        return offsetHours + "h";
    }

    public static /* synthetic */ Hm.B g(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel) {
        return showEndTripConfirmationDialog$lambda$5(jetLagPlanViewModel);
    }

    private final java.lang.String getFormattedFlightCardLocationLabel(int flightNumber, p161gc.o trip) {
        java.lang.String str;
        int size = trip.f48562d.size();
        java.util.ArrayList arrayList = trip.f48562d;
        if (size <= 1) {
            return ((p161gc.p) Im.r.k1(arrayList)).f48569b.f48575b + " - " + ((p161gc.p) Im.r.k1(arrayList)).f48570c.f48575b;
        }
        if (flightNumber == 1) {
            str = ((p161gc.p) Im.r.Z0(arrayList)).f48569b.f48575b + " - " + ((p161gc.p) Im.r.Z0(arrayList)).f48570c.f48575b;
        } else {
            str = ((p161gc.p) Im.r.k1(arrayList)).f48569b.f48575b + " - " + ((p161gc.p) Im.r.k1(arrayList)).f48570c.f48575b;
        }
        return "FLIGHT #" + flightNumber + ": " + str;
    }

    private final void getPlanAndTasks() {
        p554wo.C.B(androidx.lifecycle.V.h(this), null, null, new com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$getPlanAndTasks$1(this, null), 3);
    }

    private final java.util.Map<com.eightsleep.data_jetlag.enums.JetLagPlanTaskPhase, java.util.List<java.util.List<p161gc.e>>> groupTasksByPhaseAndDate(p161gc.c plan) {
        java.util.ArrayList arrayList = plan.f48484j;
        java.util.ArrayList arrayList2 = new java.util.ArrayList();
        for (java.lang.Object obj : arrayList) {
            if (((p161gc.e) obj).f48491e == com.eightsleep.data_jetlag.enums.JetLagPlanTaskPhase.PRE_FLIGHT) {
                arrayList2.add(obj);
            }
        }
        java.util.SortedMap<java.time.LocalDate, java.util.List<p161gc.e>> sortedMapGroupTasksByPhaseAndDate$groupByTaskDate = groupTasksByPhaseAndDate$groupByTaskDate(arrayList2);
        java.util.ArrayList arrayList3 = new java.util.ArrayList();
        java.util.ArrayList arrayList4 = plan.f48484j;
        for (java.lang.Object obj2 : arrayList4) {
            if (((p161gc.e) obj2).f48491e == com.eightsleep.data_jetlag.enums.JetLagPlanTaskPhase.IN_FLIGHT) {
                arrayList3.add(obj2);
            }
        }
        java.util.LinkedHashMap linkedHashMap = new java.util.LinkedHashMap();
        for (java.lang.Object obj3 : arrayList3) {
            java.lang.String str = ((p161gc.e) obj3).f48496j.f48486b;
            java.lang.Object arrayList5 = linkedHashMap.get(str);
            if (arrayList5 == null) {
                arrayList5 = new java.util.ArrayList();
                linkedHashMap.put(str, arrayList5);
            }
            ((java.util.List) arrayList5).add(obj3);
        }
        java.util.ArrayList arrayList6 = new java.util.ArrayList();
        for (java.lang.Object obj4 : arrayList4) {
            if (((p161gc.e) obj4).f48491e == com.eightsleep.data_jetlag.enums.JetLagPlanTaskPhase.POST_FLIGHT) {
                arrayList6.add(obj4);
            }
        }
        java.util.List<java.util.List<p161gc.e>> listGroupTasksByPhaseAndDate$groupPostFlights = groupTasksByPhaseAndDate$groupPostFlights(arrayList6);
        timber.log.Timber.f67879a.b("Post flight tasks: " + listGroupTasksByPhaseAndDate$groupPostFlights, new java.lang.Object[0]);
        java.util.LinkedHashMap linkedHashMap2 = new java.util.LinkedHashMap();
        com.eightsleep.data_jetlag.enums.JetLagPlanTaskPhase jetLagPlanTaskPhase = com.eightsleep.data_jetlag.enums.JetLagPlanTaskPhase.PRE_FLIGHT;
        java.util.Collection<java.util.List<p161gc.e>> collectionValues = sortedMapGroupTasksByPhaseAndDate$groupByTaskDate.values();
        kotlin.jvm.internal.l.i(collectionValues, "<get-values>(...)");
        linkedHashMap2.put(jetLagPlanTaskPhase, Im.r.T1(collectionValues));
        linkedHashMap2.put(com.eightsleep.data_jetlag.enums.JetLagPlanTaskPhase.IN_FLIGHT, Im.r.T1(linkedHashMap.values()));
        linkedHashMap2.put(com.eightsleep.data_jetlag.enums.JetLagPlanTaskPhase.POST_FLIGHT, listGroupTasksByPhaseAndDate$groupPostFlights);
        return linkedHashMap2;
    }

    private static final java.util.SortedMap<java.time.LocalDate, java.util.List<p161gc.e>> groupTasksByPhaseAndDate$groupByTaskDate(java.util.List<p161gc.e> list) {
        java.util.LinkedHashMap linkedHashMap = new java.util.LinkedHashMap();
        for (java.lang.Object obj : list) {
            p161gc.e eVar = (p161gc.e) obj;
            Ga.s sVar = eVar.f48492f;
            java.time.ZoneOffset zoneOffsetOf = java.time.ZoneOffset.of(eVar.f48493g);
            kotlin.jvm.internal.l.i(zoneOffsetOf, "of(...)");
            java.time.LocalDate localDateK = sVar.n(zoneOffsetOf).k();
            java.lang.Object arrayList = linkedHashMap.get(localDateK);
            if (arrayList == null) {
                arrayList = new java.util.ArrayList();
                linkedHashMap.put(localDateK, arrayList);
            }
            ((java.util.List) arrayList).add(obj);
        }
        return new java.util.TreeMap(linkedHashMap);
    }

    private static final java.util.List<java.util.List<p161gc.e>> groupTasksByPhaseAndDate$groupPostFlights(java.util.List<p161gc.e> list) {
        java.util.ArrayList arrayList = new java.util.ArrayList();
        java.util.ArrayList arrayList2 = new java.util.ArrayList();
        for (p161gc.e eVar : list) {
            arrayList2.add(eVar);
            if (eVar.f48490d == com.eightsleep.data_jetlag.enums.JetLagTaskType.SLEEP) {
                arrayList.add(arrayList2);
                arrayList2 = new java.util.ArrayList();
            }
        }
        return arrayList;
    }

    private final java.util.List<p336ng.g> mapPlanToUiModel(p161gc.o trip, p161gc.c plan) {
        boolean z10;
        boolean z11;
        java.lang.String str;
        p336ng.l lVar;
        int i10;
        int i11;
        java.lang.String strF;
        com.eightsleep.presentation_jetlag.enums.JetLagPlanTaskScheduleStatus scheduleStatus;
        p336ng.m mVar;
        int i12;
        java.lang.String str2;
        java.time.Instant instantNow = java.time.Instant.now();
        java.util.Collection<java.util.List<java.util.List<p161gc.e>>> collectionValues = groupTasksByPhaseAndDate(plan).values();
        java.util.ArrayList arrayList = new java.util.ArrayList();
        java.util.Iterator it = collectionValues.iterator();
        boolean z12 = false;
        while (it.hasNext()) {
            java.util.List list = (java.util.List) it.next();
            int i13 = 10;
            java.util.ArrayList arrayList2 = new java.util.ArrayList(Im.t.z0(list, 10));
            java.util.Iterator it2 = list.iterator();
            int i14 = 0;
            int i15 = 1;
            while (it2.hasNext()) {
                java.lang.Object next = it2.next();
                int i16 = i14 + 1;
                if (i14 < 0) {
                    Im.s.s0();
                    throw null;
                }
                java.util.List list2 = (java.util.List) next;
                Ga.s sVarN = ((p161gc.e) Im.r.Z0(list2)).f48492f.n(p219io.sentry.config.a.r0(((p161gc.e) Im.r.Z0(list2)).f48493g));
                java.util.ArrayList arrayList3 = new java.util.ArrayList(Im.t.z0(list2, i13));
                java.util.Iterator it3 = list2.iterator();
                int i17 = 0;
                while (it3.hasNext()) {
                    p161gc.e eVar = (p161gc.e) it3.next();
                    java.util.Iterator it4 = it;
                    Xb.a aVar = p336ng.h.k;
                    boolean z13 = z12;
                    com.eightsleep.data_jetlag.enums.JetLagPlanTaskPhase jetLagPlanTaskPhase = eVar.f48491e;
                    java.util.Iterator it5 = it2;
                    com.eightsleep.data_jetlag.enums.JetLagPlanTaskPhase jetLagPlanTaskPhase2 = com.eightsleep.data_jetlag.enums.JetLagPlanTaskPhase.IN_FLIGHT;
                    java.util.Iterator it6 = it3;
                    Ga.s sVar = eVar.f48492f;
                    if (jetLagPlanTaskPhase == jetLagPlanTaskPhase2) {
                        int i18 = i17 + 1;
                        int i19 = i17 % 3;
                        if (i19 != 0) {
                            i12 = i18;
                            str2 = i19 != 1 ? "Landing" : "In Air";
                        } else {
                            i12 = i18;
                            str2 = "Take-off";
                        }
                        strF = str2;
                        i17 = i12;
                    } else {
                        strF = Ga.s.f(sVar.n(p219io.sentry.config.a.r0(eVar.f48493g)), null, 3);
                    }
                    kotlin.jvm.internal.l.g(instantNow);
                    if (sVar.f12088a.compareTo(instantNow) < 0) {
                        scheduleStatus = com.eightsleep.presentation_jetlag.enums.JetLagPlanTaskScheduleStatus.PAST;
                    } else if (z13) {
                        scheduleStatus = com.eightsleep.presentation_jetlag.enums.JetLagPlanTaskScheduleStatus.FUTURE;
                    } else {
                        scheduleStatus = com.eightsleep.presentation_jetlag.enums.JetLagPlanTaskScheduleStatus.CURRENT;
                        z13 = true;
                    }
                    kotlin.jvm.internal.l.j(scheduleStatus, "scheduleStatus");
                    java.lang.String string = sVar.k().toString();
                    kotlin.jvm.internal.l.i(string, "toString(...)");
                    boolean z14 = eVar.f48495i == com.eightsleep.data_jetlag.enums.JetLagPlanTaskStatus.COMPLETE;
                    com.eightsleep.data_jetlag.enums.JetLagTaskType jetLagTaskType = com.eightsleep.data_jetlag.enums.JetLagTaskType.SUPPLEMENT;
                    com.eightsleep.data_jetlag.enums.JetLagTaskType jetLagTaskType2 = eVar.f48490d;
                    if (jetLagTaskType2 == jetLagTaskType) {
                        java.lang.StringBuilder sb2 = new java.lang.StringBuilder("Mapping supplements ui model from domain: ");
                        p161gc.d dVar = eVar.f48496j;
                        sb2.append(dVar);
                        p066cj.l0.D(aVar, sb2.toString());
                        java.lang.Integer num = dVar.f48485a;
                        mVar = new p336ng.m(num != null ? num.intValue() : 0);
                    } else {
                        mVar = null;
                    }
                    arrayList3.add(new p336ng.h(eVar.f48487a, eVar.f48489c, string, strF, z14, jetLagTaskType2, eVar.f48491e, eVar.f48494h, scheduleStatus, mVar));
                    it3 = it6;
                    i14 = i14;
                    it = it4;
                    z12 = z13;
                    it2 = it5;
                    instantNow = instantNow;
                }
                java.time.Instant instant = instantNow;
                java.util.Iterator it7 = it;
                boolean z15 = z12;
                java.util.Iterator it8 = it2;
                int i20 = i14;
                com.eightsleep.data_jetlag.enums.JetLagPlanTaskPhase jetLagPlanTaskPhase3 = ((p336ng.h) Im.r.Z0(arrayList3)).f61165g;
                java.lang.String strG = Ga.s.g(sVarN, Ga.p.MONTH_DAY, 2);
                if (!arrayList3.isEmpty()) {
                    java.util.Iterator it9 = arrayList3.iterator();
                    while (true) {
                        if (!it9.hasNext()) {
                            z10 = true;
                            break;
                        }
                        if (((p336ng.h) it9.next()).f61167i == com.eightsleep.presentation_jetlag.enums.JetLagPlanTaskScheduleStatus.FUTURE) {
                            z10 = false;
                            break;
                        }
                    }
                } else {
                    z10 = true;
                    break;
                }
                if (!arrayList3.isEmpty()) {
                    java.util.Iterator it10 = arrayList3.iterator();
                    while (true) {
                        if (!it10.hasNext()) {
                            z11 = true;
                            break;
                        }
                        if (!((p336ng.h) it10.next()).f61163e) {
                            z11 = false;
                            break;
                        }
                    }
                } else {
                    z11 = true;
                    break;
                }
                boolean zEquals = sVarN.equals(java.time.LocalDate.now());
                int i21 = com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$WhenMappings.$EnumSwitchMapping$0[jetLagPlanTaskPhase3.ordinal()];
                if (i21 == 1) {
                    str = ((p161gc.p) Im.r.Z0(trip.f48562d)).f48569b.f48574a;
                } else if (i21 == 2) {
                    str = ((p161gc.p) Im.r.k1(trip.f48562d)).f48570c.f48574a;
                } else if (i21 != 3) {
                    str = "";
                } else {
                    java.lang.String formattedFlightCardLocationLabel = getFormattedFlightCardLocationLabel(i15, trip);
                    i15++;
                    str = formattedFlightCardLocationLabel;
                }
                if (jetLagPlanTaskPhase3 == com.eightsleep.data_jetlag.enums.JetLagPlanTaskPhase.POST_FLIGHT) {
                    if (list2.isEmpty()) {
                        i10 = 0;
                    } else {
                        java.util.Iterator it11 = list2.iterator();
                        i10 = 0;
                        while (it11.hasNext()) {
                            if (((p161gc.e) it11.next()).f48491e == com.eightsleep.data_jetlag.enums.JetLagPlanTaskPhase.POST_FLIGHT && (i10 = i10 + 1) < 0) {
                                Im.s.r0();
                                throw null;
                            }
                        }
                    }
                    int i22 = (i20 % i10) + 1;
                    int size = arrayList3.size();
                    if (arrayList3.isEmpty()) {
                        i11 = 0;
                    } else {
                        java.util.Iterator it12 = arrayList3.iterator();
                        i11 = 0;
                        while (it12.hasNext()) {
                            if (((p336ng.h) it12.next()).f61163e && (i11 = i11 + 1) < 0) {
                                Im.s.r0();
                                throw null;
                            }
                        }
                    }
                    lVar = new p336ng.l(i22, size, i11);
                } else {
                    lVar = null;
                }
                arrayList2.add(new p336ng.g(strG, zEquals, str, jetLagPlanTaskPhase3, arrayList3, z10, z11, lVar));
                i14 = i16;
                it = it7;
                z12 = z15;
                it2 = it8;
                instantNow = instant;
                i13 = 10;
            }
            Im.x.D0(arrayList2, arrayList);
        }
        return arrayList;
    }

    private final void onTaskCompletionToggled(java.lang.String planId, java.util.List<p336ng.h> tasks, boolean isComplete, java.lang.Integer supplementCount) {
        p554wo.C.B(androidx.lifecycle.V.h(this), null, null, new com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$onTaskCompletionToggled$1(this, planId, tasks, isComplete, supplementCount, null), 3);
    }

    public static /* synthetic */ void onTaskCompletionToggled$default(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel, java.lang.String str, java.util.List list, boolean z10, java.lang.Integer num, int i10, java.lang.Object obj) {
        if ((i10 & 8) != 0) {
            num = null;
        }
        jetLagPlanViewModel.onTaskCompletionToggled(str, list, z10, num);
    }

    private static final p336ng.e onUiAction$lambda$1(p260kg.AbstractC3564i abstractC3564i, p336ng.e it) {
        kotlin.jvm.internal.l.j(it, "it");
        return p336ng.e.u(it, null, null, ((p260kg.C3562g) abstractC3564i).f55671b, null, null, null, null, null, null, 0, null, null, null, 8187);
    }

    private final void pollTimeAtDestination(p161gc.o trip) {
        p554wo.C.B(androidx.lifecycle.V.h(this), null, null, new com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$pollTimeAtDestination$1(this, trip, null), 3);
    }

    private final void showEndTripConfirmationDialog(java.lang.String tripId) {
        android.support.v4.media.session.b.H(this, null, com.eightsleep.eight.R$string.jet_lag_plan_end_trip_dialog_title, com.eightsleep.eight.R$string.jet_lag_plan_end_trip_dialog_body, com.eightsleep.eight.R$string.jet_lag_plan_end_trip_dialog_button_cta, new com.eightsleep.presentation_jetlag.viewmodel.b(this, tripId, 0), java.lang.Integer.valueOf(com.eightsleep.eight.R$string.jet_lag_plan_end_trip_dialog_button_negative), new com.eightsleep.presentation_jetlag.viewmodel.b(this, tripId, 1), new com.eightsleep.presentation_jetlag.viewmodel.c(this), 257);
    }

    private static final Hm.B showEndTripConfirmationDialog$lambda$3(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel, java.lang.String str) {
        jetLagPlanViewModel.onUiAction((p260kg.AbstractC3564i) new p260kg.C3559d(str, true));
        return Hm.B.f13117a;
    }

    private static final Hm.B showEndTripConfirmationDialog$lambda$4(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel, java.lang.String str) {
        jetLagPlanViewModel.onUiAction((p260kg.AbstractC3564i) new p260kg.C3559d(str, false));
        return Hm.B.f13117a;
    }

    private static final Hm.B showEndTripConfirmationDialog$lambda$5(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel) {
        android.support.v4.media.session.b.I(jetLagPlanViewModel, null, 3);
        return Hm.B.f13117a;
    }

    private final void showSupplementTaskConfirmationDialog(java.lang.String planId, java.util.List<p336ng.h> tasks) {
        kotlin.jvm.internal.y yVar = new kotlin.jvm.internal.y();
        yVar.f56417a = 2;
        p021an.k kVar = new p021an.k(1, 3, 1);
        android.support.v4.media.session.b.H(this, new p487u0.d(new com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$showSupplementTaskConfirmationDialog$1(kVar, yVar), true, -736982161), com.eightsleep.eight.R$string.jet_lag_supplement_task_confirmation_bottomsheet_title, com.eightsleep.eight.R$string.common_empty, com.eightsleep.eight.R$string.jet_lag_supplement_task_confirmation_bottomsheet_cta, new com.eightsleep.presentation_jetlag.viewmodel.a(this, planId, tasks, kVar, yVar), null, null, null, 480);
    }

    private static final Hm.B showSupplementTaskConfirmationDialog$lambda$2(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel, java.lang.String str, java.util.List list, p021an.k kVar, kotlin.jvm.internal.y yVar) {
        jetLagPlanViewModel.onUiAction((p260kg.AbstractC3564i) new p260kg.C3563h(str, list, ((java.lang.Number) Im.r.T1(kVar).get(yVar.f56417a)).intValue()));
        return Hm.B.f13117a;
    }

    @Override // Y7.o
    public Y7.n getInitialViewState() {
        Ga.f fVar = this.displaySettings;
        p336ng.a aVar = new p336ng.a(fVar);
        p336ng.a aVar2 = new p336ng.a(fVar);
        Ga.s sVar = Ga.s.f12085c;
        return new Y7.m(new p336ng.e("", "", com.eightsleep.presentation_jetlag.enums.PlanScheduleType.TODAY, aVar, aVar2, "", null, com.eightsleep.data_jetlag.enums.JetLagPlanTaskPhase.PRE_FLIGHT, Im.z.f14265a, 0, "", Dl.A0.v(fVar != null ? fVar.f12062d : null), ""), null);
    }

    @Override // L8.e, androidx.lifecycle.DefaultLifecycleObserver
    public void onCreate(androidx.lifecycle.InterfaceC2475v owner) {
        kotlin.jvm.internal.l.j(owner, "owner");
        super.onCreate(owner);
        getPlanAndTasks();
    }

    @Override // L8.e
    public /* bridge */ /* synthetic */ void onUiAction(Z7.c cVar) {
        onUiAction((p260kg.AbstractC3564i) cVar);
    }

    public void onUiAction(p260kg.AbstractC3564i action) {
        java.util.List<p336ng.h> list;
        kotlin.jvm.internal.l.j(action, "action");
        logUiActionEvent(action, Rc.A.f23619a);
        if (action.equals(p260kg.C3557b.f55661b)) {
            L8.e.goTo$default(this, new com.eightsleep.corepresentation.navigation.route.Route$HomeGraph((java.lang.String) null, 1, (kotlin.jvm.internal.DefaultConstructorMarker) null), false, 2, null);
            return;
        }
        if (action instanceof p260kg.C3561f) {
            p260kg.C3561f c3561f = (p260kg.C3561f) action;
            p336ng.h hVar = c3561f.f55669c;
            if (hVar.f61164f == com.eightsleep.data_jetlag.enums.JetLagTaskType.SUPPLEMENT && c3561f.f55670d) {
                showSupplementTaskConfirmationDialog(c3561f.f55668b, Im.s.f0(hVar));
                return;
            } else {
                onTaskCompletionToggled$default(this, c3561f.f55668b, Im.s.f0(hVar), c3561f.f55670d, null, 8, null);
                return;
            }
        }
        if (action instanceof p260kg.C3563h) {
            p260kg.C3563h c3563h = (p260kg.C3563h) action;
            onTaskCompletionToggled(c3563h.f55672b, c3563h.f55673c, true, java.lang.Integer.valueOf(c3563h.f55674d));
            return;
        }
        if (action instanceof p260kg.C3560e) {
            p260kg.C3560e c3560e = (p260kg.C3560e) action;
            if (c3560e.f55667d && ((list = c3560e.f55666c) == null || !list.isEmpty())) {
                java.util.Iterator<T> it = list.iterator();
                while (it.hasNext()) {
                    if (((p336ng.h) it.next()).f61164f == com.eightsleep.data_jetlag.enums.JetLagTaskType.SUPPLEMENT) {
                        showSupplementTaskConfirmationDialog(c3560e.f55665b, list);
                        return;
                    }
                }
            }
            onTaskCompletionToggled$default(this, c3560e.f55665b, c3560e.f55666c, c3560e.f55667d, null, 8, null);
            return;
        }
        if (action instanceof p260kg.C3562g) {
            android.support.v4.media.session.b.I(this, new com.eightsleep.presentation_jetlag.viewmodel.g(action, 1), 1);
            return;
        }
        if (action instanceof p260kg.C3558c) {
            showEndTripConfirmationDialog(((p260kg.C3558c) action).f55662b);
        } else if (action instanceof p260kg.C3559d) {
            endTrip(((p260kg.C3559d) action).f55663b);
        } else if (!(action instanceof p260kg.C3556a)) {
            throw new kotlin.NoWhenBranchMatchedException();
        }
    }
}
