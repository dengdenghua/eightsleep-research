package com.eightsleep.data_jetlag.data.repository;

/* JADX INFO: loaded from: classes2.dex */
@kotlin.Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\b\u0000\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0019\b\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J1\u0010\u0010\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u000f0\u000e0\r2\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\n\u001a\u00020\b2\u0006\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\u0010\u0010\u0011J1\u0010\u0013\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u000f0\u000e0\r2\u0006\u0010\n\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\u0012\u001a\u00020\u000b¢\u0006\u0004\b\u0013\u0010\u0011J)\u0010\u0014\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u000f0\u000e0\r2\u0006\u0010\n\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\u0014\u0010\u0015JL\u0010\u001e\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u001d0\u000e0\r2\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\u0016\u001a\u00020\b2\f\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u00180\u00172\u0006\u0010\u001a\u001a\u00020\u000b2\b\u0010\u001c\u001a\u0004\u0018\u00010\u001bH\u0086@¢\u0006\u0004\b\u001e\u0010\u001fR\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b \u0010!\u001a\u0004\b\"\u0010#¨\u0006$"}, d2 = {"Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;", "LNa/b;", "Ldc/a;", "api", "Ljc/d;", p219io.opentelemetry.semconv.incubating.DbIncubatingAttributes$DbSystemIncubatingValues.CACHE, "<init>", "(Ldc/a;Ljc/d;)V", "", com.eightsleep.presentation_home.viewmodel.TagBreakdownViewModel.USER_ID, "tripId", "", "includeSupplements", "Lzo/l;", "Lya/j;", "Lgc/j;", "createPlan", "(Ljava/lang/String;Ljava/lang/String;Z)Lzo/l;", "forceRefresh", "getPlan", "observePlan", "(Ljava/lang/String;Ljava/lang/String;)Lzo/l;", "planId", "", "Lgc/f;", "tasks", "isComplete", "", "supplementCount", "LHm/B;", "updateTasks", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;ZLjava/lang/Integer;LLm/c;)Ljava/lang/Object;", "a", "Ldc/a;", "getApi", "()Ldc/a;", "data-jetlag_tencentRelease"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class JetLagPlanRepository implements Na.b {

    /* JADX INFO: renamed from: a, reason: collision with root package name and from kotlin metadata */
    public final dc.a api;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public final p231jc.d f40140b;

    public JetLagPlanRepository(dc.a api, p231jc.d cache) {
        kotlin.jvm.internal.l.j(api, "api");
        kotlin.jvm.internal.l.j(cache, "cache");
        this.api = api;
        this.f40140b = cache;
    }

    public static final /* synthetic */ p231jc.d access$getCache$p(com.eightsleep.data_jetlag.data.repository.JetLagPlanRepository jetLagPlanRepository) {
        return jetLagPlanRepository.f40140b;
    }

    public <R> zo.InterfaceC5441l call(dc.a aVar, boolean z10, Ka.c cVar, Vm.n nVar) {
        return P2.AbstractC1563b.s(this, z10, cVar, nVar);
    }

    public final zo.InterfaceC5441l createPlan(java.lang.String userId, java.lang.String tripId, boolean includeSupplements) {
        kotlin.jvm.internal.l.j(userId, "userId");
        kotlin.jvm.internal.l.j(tripId, "tripId");
        return P2.q.t(P2.AbstractC1563b.t(this, getApi(), null, new p111ec.a(userId, tripId, includeSupplements, null), 3), null, new p111ec.b(null, this, userId, tripId), 3);
    }

    @Override // Na.b
    public /* bridge */ /* synthetic */ java.lang.Object getApi() {
        return getApi();
    }

    public final zo.InterfaceC5441l getPlan(java.lang.String tripId, java.lang.String userId, boolean forceRefresh) {
        kotlin.jvm.internal.l.j(tripId, "tripId");
        kotlin.jvm.internal.l.j(userId, "userId");
        if (!forceRefresh) {
            p231jc.d dVar = this.f40140b;
            Eo.f fVar = p554wo.M.f71465a;
            p161gc.j jVar = (p161gc.j) p554wo.C.F(Eo.e.f9853b, new p231jc.b(dVar, tripId, null));
            if (jVar != null) {
                return new J8.e(new p592ya.g(jVar), 9);
            }
        }
        return new Yd.n(P2.AbstractC1563b.t(this, getApi(), null, new p111ec.d(userId, tripId, null), 3), this, userId, tripId, 2);
    }

    public final zo.InterfaceC5441l observePlan(java.lang.String tripId, java.lang.String userId) {
        kotlin.jvm.internal.l.j(tripId, "tripId");
        kotlin.jvm.internal.l.j(userId, "userId");
        return zo.AbstractC5454s.G(this.f40140b.d(tripId), new Hb.h((Lm.c) null, this, tripId, userId));
    }

    /* JADX WARN: Code duplicated, block: B:7:0x0013  */
    public final java.lang.Object updateTasks(java.lang.String str, java.lang.String str2, java.util.List<p161gc.f> list, boolean z10, java.lang.Integer num, Lm.c<? super zo.InterfaceC5441l> cVar) {
        p111ec.f fVar;
        com.eightsleep.data_jetlag.enums.JetLagPlanTaskStatus jetLagPlanTaskStatus;
        com.eightsleep.data_jetlag.data.repository.JetLagPlanRepository jetLagPlanRepository;
        com.eightsleep.data_jetlag.enums.JetLagPlanTaskStatus jetLagPlanTaskStatus2;
        if (cVar instanceof p111ec.f) {
            fVar = (p111ec.f) cVar;
            int i10 = fVar.f46580j;
            if ((i10 & com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE) != 0) {
                fVar.f46580j = i10 - com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE;
            } else {
                fVar = new p111ec.f(this, cVar);
            }
        } else {
            fVar = new p111ec.f(this, cVar);
        }
        java.lang.Object obj = fVar.f46578h;
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i11 = fVar.f46580j;
        if (i11 == 0) {
            X4.x.M(obj);
            jetLagPlanTaskStatus = z10 ? com.eightsleep.data_jetlag.enums.JetLagPlanTaskStatus.COMPLETE : com.eightsleep.data_jetlag.enums.JetLagPlanTaskStatus.PENDING;
            com.eightsleep.data_jetlag.enums.JetLagPlanTaskStatus jetLagPlanTaskStatus3 = !z10 ? com.eightsleep.data_jetlag.enums.JetLagPlanTaskStatus.COMPLETE : com.eightsleep.data_jetlag.enums.JetLagPlanTaskStatus.PENDING;
            fVar.f46571a = this;
            fVar.f46572b = str;
            fVar.f46573c = str2;
            fVar.f46574d = list;
            fVar.f46575e = num;
            fVar.f46576f = jetLagPlanTaskStatus;
            fVar.f46577g = jetLagPlanTaskStatus3;
            fVar.f46580j = 1;
            if (this.f40140b.h(list, fVar) == aVar) {
                return aVar;
            }
            jetLagPlanRepository = this;
            jetLagPlanTaskStatus2 = jetLagPlanTaskStatus3;
        } else {
            if (i11 != 1) {
                throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            com.eightsleep.data_jetlag.enums.JetLagPlanTaskStatus jetLagPlanTaskStatus4 = fVar.f46577g;
            com.eightsleep.data_jetlag.enums.JetLagPlanTaskStatus jetLagPlanTaskStatus5 = fVar.f46576f;
            num = fVar.f46575e;
            list = fVar.f46574d;
            str2 = fVar.f46573c;
            java.lang.String str3 = fVar.f46572b;
            com.eightsleep.data_jetlag.data.repository.JetLagPlanRepository jetLagPlanRepository2 = fVar.f46571a;
            X4.x.M(obj);
            jetLagPlanTaskStatus2 = jetLagPlanTaskStatus4;
            jetLagPlanTaskStatus = jetLagPlanTaskStatus5;
            str = str3;
            jetLagPlanRepository = jetLagPlanRepository2;
        }
        java.util.List<p161gc.f> list2 = list;
        java.util.ArrayList arrayList = new java.util.ArrayList(Im.t.z0(list2, 10));
        java.util.Iterator<T> it = list2.iterator();
        while (true) {
            java.lang.Integer num2 = null;
            if (!it.hasNext()) {
                return new Yd.n(P2.AbstractC1563b.t(jetLagPlanRepository, jetLagPlanRepository.getApi(), null, new p111ec.g(str, str2, new com.eightsleep.data_jetlag.data.model.JetLagBulkTaskUpdateRequest(arrayList), null), 3), jetLagPlanRepository, list2, jetLagPlanTaskStatus2, 3);
            }
            p161gc.f fVar2 = (p161gc.f) it.next();
            java.lang.String str4 = fVar2.f48497a;
            if (fVar2.f48498b == com.eightsleep.data_jetlag.enums.JetLagTaskType.SUPPLEMENT) {
                num2 = num;
            }
            arrayList.add(new com.eightsleep.data_jetlag.data.model.JetLagTaskUpdateRequest(str4, jetLagPlanTaskStatus, num2));
        }
    }

    @Override // Na.b
    public /* bridge */ /* synthetic */ zo.InterfaceC5441l call(java.lang.Object obj, boolean z10, Ka.c cVar, Vm.n nVar) {
        return call((dc.a) obj, z10, cVar, nVar);
    }

    @Override // Na.b
    public dc.a getApi() {
        return this.api;
    }
}
