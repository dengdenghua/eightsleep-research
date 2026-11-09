package com.eightsleep.data_jetlag.data.repository;

/* JADX INFO: loaded from: classes2.dex */
@kotlin.Metadata(d1 = {"\u0000d\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0019\b\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J)\u0010\u000f\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u000e0\r0\f2\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\u000f\u0010\u0010J/\u0010\u0016\u001a\u0014\u0012\u0010\u0012\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00150\u00140\r0\f2\u0006\u0010\u0011\u001a\u00020\b2\u0006\u0010\u0013\u001a\u00020\u0012¢\u0006\u0004\b\u0016\u0010\u0017J4\u0010\u0019\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00150\r0\f2\u0006\u0010\u0011\u001a\u00020\b2\u0006\u0010\u0018\u001a\u00020\b2\u0006\u0010\u0013\u001a\u00020\u0012H\u0086@¢\u0006\u0004\b\u0019\u0010\u001aJ/\u0010\u001d\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00150\r0\f2\u0006\u0010\u0011\u001a\u00020\b2\f\u0010\u001c\u001a\b\u0012\u0004\u0012\u00020\u001b0\u0014¢\u0006\u0004\b\u001d\u0010\u001eJ'\u0010!\u001a\u0014\u0012\u0010\u0012\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020 0\u00140\r0\f2\u0006\u0010\u001f\u001a\u00020\b¢\u0006\u0004\b!\u0010\"J)\u0010$\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020#0\r0\f2\u0006\u0010\u0011\u001a\u00020\b2\u0006\u0010\u0018\u001a\u00020\b¢\u0006\u0004\b$\u0010%JM\u0010)\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00150\r0\f2\u0006\u0010\u0011\u001a\u00020\b2\u0006\u0010\u0018\u001a\u00020\b2\b\u0010'\u001a\u0004\u0018\u00010&2\b\u0010(\u001a\u0004\u0018\u00010\b2\u000e\u0010\u001c\u001a\n\u0012\u0004\u0012\u00020\u001b\u0018\u00010\u0014¢\u0006\u0004\b)\u0010*R\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b+\u0010,\u001a\u0004\b-\u0010.¨\u0006/"}, d2 = {"Lcom/eightsleep/data_jetlag/data/repository/JetLagTripRepository;", "LNa/b;", "Ldc/b;", "api", "Ljc/g;", "tripCache", "<init>", "(Ldc/b;Ljc/g;)V", "", "flightNumber", "Ljava/time/LocalDate;", "date", "Lzo/l;", "Lya/j;", "Lgc/i;", "findFlights", "(Ljava/lang/String;Ljava/time/LocalDate;)Lzo/l;", com.eightsleep.presentation_home.viewmodel.TagBreakdownViewModel.USER_ID, "", "forceRefresh", "", "Lgc/l;", "getTrips", "(Ljava/lang/String;Z)Lzo/l;", "tripId", "getTripById", "(Ljava/lang/String;Ljava/lang/String;ZLLm/c;)Ljava/lang/Object;", "Lgc/p;", "legs", "createTrip", "(Ljava/lang/String;Ljava/util/List;)Lzo/l;", "query", "Lgc/g;", "searchLocations", "(Ljava/lang/String;)Lzo/l;", "LHm/B;", "deleteTrip", "(Ljava/lang/String;Ljava/lang/String;)Lzo/l;", "Lcom/eightsleep/data_jetlag/enums/TripStatus;", "status", com.google.android.gms.measurement.api.AppMeasurementSdk$ConditionalUserProperty.NAME, "updateTrip", "(Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/TripStatus;Ljava/lang/String;Ljava/util/List;)Lzo/l;", "a", "Ldc/b;", "getApi", "()Ldc/b;", "data-jetlag_tencentRelease"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class JetLagTripRepository implements Na.b {

    /* JADX INFO: renamed from: a, reason: collision with root package name and from kotlin metadata */
    public final dc.b api;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public final p231jc.g f40142b;

    public JetLagTripRepository(dc.b api, p231jc.g tripCache) {
        kotlin.jvm.internal.l.j(api, "api");
        kotlin.jvm.internal.l.j(tripCache, "tripCache");
        this.api = api;
        this.f40142b = tripCache;
    }

    public static final /* synthetic */ p231jc.g access$getTripCache$p(com.eightsleep.data_jetlag.data.repository.JetLagTripRepository jetLagTripRepository) {
        return jetLagTripRepository.f40142b;
    }

    public <R> zo.InterfaceC5441l call(dc.b bVar, boolean z10, Ka.c cVar, Vm.n nVar) {
        return P2.AbstractC1563b.s(this, z10, cVar, nVar);
    }

    public final zo.InterfaceC5441l createTrip(java.lang.String userId, java.util.List<p161gc.p> legs) {
        kotlin.jvm.internal.l.j(userId, "userId");
        kotlin.jvm.internal.l.j(legs, "legs");
        return P2.q.t(P2.AbstractC1563b.t(this, getApi(), null, new p111ec.h(userId, legs, null), 3), null, new p111ec.i(userId, this, null), 3);
    }

    public final zo.InterfaceC5441l deleteTrip(java.lang.String userId, java.lang.String tripId) {
        kotlin.jvm.internal.l.j(userId, "userId");
        kotlin.jvm.internal.l.j(tripId, "tripId");
        return P2.AbstractC1563b.t(this, getApi(), null, new p111ec.j(userId, tripId, null), 3);
    }

    public final zo.InterfaceC5441l findFlights(java.lang.String flightNumber, java.time.LocalDate date) {
        kotlin.jvm.internal.l.j(flightNumber, "flightNumber");
        kotlin.jvm.internal.l.j(date, "date");
        return P2.q.D(P2.AbstractC1563b.t(this, getApi(), new p209ic.a(), new p111ec.k(flightNumber, date, null), 1), new p111ec.l(2, null));
    }

    @Override // Na.b
    public /* bridge */ /* synthetic */ java.lang.Object getApi() {
        return getApi();
    }

    /* JADX WARN: Code duplicated, block: B:7:0x0013  */
    public final java.lang.Object getTripById(java.lang.String str, java.lang.String str2, boolean z10, Lm.c<? super zo.InterfaceC5441l> cVar) {
        p111ec.m mVar;
        if (cVar instanceof p111ec.m) {
            mVar = (p111ec.m) cVar;
            int i10 = mVar.f46608f;
            if ((i10 & com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE) != 0) {
                mVar.f46608f = i10 - com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE;
            } else {
                mVar = new p111ec.m(this, cVar);
            }
        } else {
            mVar = new p111ec.m(this, cVar);
        }
        java.lang.Object objL = mVar.f46606d;
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i11 = mVar.f46608f;
        if (i11 == 0) {
            X4.x.M(objL);
            if (!z10) {
                mVar.f46603a = this;
                mVar.f46604b = str;
                mVar.f46605c = str2;
                mVar.f46608f = 1;
                kc.i iVar = this.f40142b.f54360a;
                E4.A a10 = E4.A.a(1, "SELECT * FROM trip WHERE id = ?");
                a10.g(1, str2);
                objL = P2.A.L(iVar.f55584a, true, new android.os.CancellationSignal(), new kc.f(iVar, a10, 1), mVar);
                if (objL == aVar) {
                    return aVar;
                }
            }
            return P2.q.t(P2.AbstractC1563b.t(this, this.getApi(), null, new p111ec.n(str2, null), 3), null, new p111ec.o(str, this, null), 3);
        }
        if (i11 != 1) {
            throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        str2 = mVar.f46605c;
        str = mVar.f46604b;
        this = mVar.f46603a;
        X4.x.M(objL);
        p283lc.j jVar = (p283lc.j) objL;
        if (jVar != null) {
            return new J8.e(new p592ya.g(jVar.a()), 9);
        }
        return P2.q.t(P2.AbstractC1563b.t(this, this.getApi(), null, new p111ec.n(str2, null), 3), null, new p111ec.o(str, this, null), 3);
    }

    public final zo.InterfaceC5441l getTrips(java.lang.String userId, boolean forceRefresh) {
        kotlin.jvm.internal.l.j(userId, "userId");
        br.a aVar = timber.log.Timber.f67879a;
        aVar.b("getTrips forceRefresh: " + forceRefresh, new java.lang.Object[0]);
        if (forceRefresh) {
            return P2.q.t(P2.AbstractC1563b.t(this, getApi(), null, new p111ec.p(userId, null), 3), null, new p111ec.q(userId, this, null), 3);
        }
        java.lang.Iterable iterable = (java.util.List) p554wo.C.F(Lm.i.f18689a, new p231jc.e(this.f40142b, userId, null));
        if (iterable == null) {
            iterable = Im.z.f14265a;
        }
        aVar.b("getTrips Jet lag Cache " + iterable, new java.lang.Object[0]);
        java.util.ArrayList arrayList = new java.util.ArrayList(Im.t.z0(iterable, 10));
        java.util.Iterator it = iterable.iterator();
        while (it.hasNext()) {
            arrayList.add(((p283lc.j) it.next()).a());
        }
        return new J8.e(new p592ya.g(arrayList), 9);
    }

    public final zo.InterfaceC5441l searchLocations(java.lang.String query) {
        kotlin.jvm.internal.l.j(query, "query");
        return P2.q.D(P2.AbstractC1563b.t(this, getApi(), null, new p111ec.r(query, null), 3), new p111ec.s(2, null));
    }

    public final zo.InterfaceC5441l updateTrip(java.lang.String userId, java.lang.String tripId, com.eightsleep.data_jetlag.enums.TripStatus status, java.lang.String name, java.util.List<p161gc.p> legs) {
        kotlin.jvm.internal.l.j(userId, "userId");
        kotlin.jvm.internal.l.j(tripId, "tripId");
        return P2.q.t(P2.AbstractC1563b.t(this, getApi(), null, new p111ec.t(userId, tripId, legs, status, name, null), 3), null, new p111ec.u(userId, this, null), 3);
    }

    @Override // Na.b
    public /* bridge */ /* synthetic */ zo.InterfaceC5441l call(java.lang.Object obj, boolean z10, Ka.c cVar, Vm.n nVar) {
        return call((dc.b) obj, z10, cVar, nVar);
    }

    @Override // Na.b
    public dc.b getApi() {
        return this.api;
    }
}
