package Ao;

/* JADX INFO: loaded from: classes4.dex */
public final class l implements zo.InterfaceC5443m {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f2722a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public final /* synthetic */ java.lang.Object f2723b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public final /* synthetic */ java.lang.Object f2724c;

    /* JADX INFO: renamed from: d, reason: collision with root package name */
    public final /* synthetic */ java.lang.Object f2725d;

    /* JADX INFO: renamed from: e, reason: collision with root package name */
    public final /* synthetic */ java.lang.Object f2726e;

    public /* synthetic */ l(java.lang.Object obj, java.lang.Object obj2, java.lang.Object obj3, java.lang.Object obj4, int i10) {
        this.f2722a = i10;
        this.f2723b = obj;
        this.f2724c = obj2;
        this.f2725d = obj3;
        this.f2726e = obj4;
    }

    /* JADX WARN: Code duplicated, block: B:41:0x00d9 A[RETURN] */
    /* JADX WARN: Code duplicated, block: B:7:0x0013  */
    public java.lang.Object a(p592ya.j jVar, Lm.c cVar) {
        U9.g gVar;
        p034ba.d entity;
        if (cVar instanceof U9.g) {
            gVar = (U9.g) cVar;
            int i10 = gVar.f25926e;
            if ((i10 & com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE) != 0) {
                gVar.f25926e = i10 - com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE;
            } else {
                gVar = new U9.g(this, cVar);
            }
        } else {
            gVar = new U9.g(this, cVar);
        }
        java.lang.Object obj = gVar.f25924c;
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i11 = gVar.f25926e;
        Hm.B b7 = Hm.B.f13117a;
        if (i11 == 0) {
            X4.x.M(obj);
            if (jVar instanceof p592ya.g) {
                com.eightsleep.data_bedtime.data.model.RecommendedBedtimeResponse recommendedBedtimeResponse = (com.eightsleep.data_bedtime.data.model.RecommendedBedtimeResponse) ((p592ya.g) jVar).f73344b;
                long jCurrentTimeMillis = java.lang.System.currentTimeMillis();
                java.lang.String str = (java.lang.String) this.f2723b;
                entity = recommendedBedtimeResponse.toEntity(str, jCurrentTimeMillis);
                Z9.b bVarAccess$getCache$p = com.eightsleep.data_bedtime.data.repository.RecommendedBedtimeRepository.access$getCache$p((com.eightsleep.data_bedtime.data.repository.RecommendedBedtimeRepository) this.f2724c);
                gVar.f25922a = this;
                gVar.f25923b = entity;
                gVar.f25926e = 1;
                if (bVarAccess$getCache$p.h(entity, str, gVar) != aVar) {
                }
            } else {
                if (!(jVar instanceof p592ya.e)) {
                    if (jVar instanceof p592ya.f) {
                        return b7;
                    }
                    throw new kotlin.NoWhenBranchMatchedException();
                }
                br.a aVar2 = timber.log.Timber.f67879a;
                aVar2.c("Failed to fetch recommended bedtime", ((p592ya.e) jVar).f73342b, new java.lang.Object[0]);
                zo.InterfaceC5443m interfaceC5443m = (zo.InterfaceC5443m) this.f2726e;
                p034ba.d dVar = (p034ba.d) this.f2725d;
                if (dVar != null) {
                    aVar2.b("Returning stale cached recommended bedtime", new java.lang.Object[0]);
                    p592ya.g gVar2 = new p592ya.g(dVar.a());
                    gVar.f25926e = 3;
                    if (interfaceC5443m.emit(gVar2, gVar) != aVar) {
                        return b7;
                    }
                } else {
                    p592ya.g gVar3 = new p592ya.g(null);
                    gVar.f25926e = 4;
                    if (interfaceC5443m.emit(gVar3, gVar) != aVar) {
                        return b7;
                    }
                }
            }
            return aVar;
        }
        if (i11 != 1) {
            if (i11 == 2) {
                X4.x.M(obj);
                return b7;
            }
            if (i11 == 3) {
                X4.x.M(obj);
                return b7;
            }
            if (i11 != 4) {
                throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            X4.x.M(obj);
            return b7;
        }
        p034ba.d dVar2 = gVar.f25923b;
        Ao.l lVar = gVar.f25922a;
        X4.x.M(obj);
        entity = dVar2;
        this = lVar;
        zo.InterfaceC5443m interfaceC5443m2 = (zo.InterfaceC5443m) this.f2726e;
        p592ya.g gVar4 = new p592ya.g(entity.a());
        gVar.f25922a = null;
        gVar.f25923b = null;
        gVar.f25926e = 2;
        if (interfaceC5443m2.emit(gVar4, gVar) == aVar) {
            return aVar;
        }
        return b7;
    }

    /* JADX WARN: Code duplicated, block: B:101:0x01a6  */
    /* JADX WARN: Code duplicated, block: B:138:0x026d  */
    /* JADX WARN: Code duplicated, block: B:181:0x0361  */
    /* JADX WARN: Code duplicated, block: B:200:0x03c0  */
    /* JADX WARN: Code duplicated, block: B:267:0x050f  */
    /* JADX WARN: Code duplicated, block: B:287:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:289:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:291:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:56:0x00b8  */
    @Override // zo.InterfaceC5443m
    public final java.lang.Object emit(java.lang.Object obj, Lm.c cVar) {
        Ao.k kVar;
        Yd.m mVar;
        p058cb.H0 h10;
        p111ec.c cVar2;
        zo.InterfaceC5443m interfaceC5443m;
        p283lc.d dVar;
        zo.InterfaceC5443m interfaceC5443m2;
        p111ec.e eVar;
        java.lang.Object obj2;
        zo.InterfaceC5443m interfaceC5443m3;
        zo.InterfaceC5443m interfaceC5443m4;
        p378pc.g0 g0Var;
        zo.InterfaceC5443m interfaceC5443m5;
        zo.InterfaceC5443m interfaceC5443m6;
        boolean z10;
        boolean z11;
        Ao.l lVar = this;
        java.lang.Object obj3 = obj;
        java.lang.Object eVar2 = p592ya.f.f73343b;
        boolean z12 = true;
        java.lang.Object obj4 = lVar.f2726e;
        java.lang.Object obj5 = lVar.f2724c;
        java.lang.Object obj6 = lVar.f2725d;
        Hm.B b7 = Hm.B.f13117a;
        java.lang.Object obj7 = lVar.f2723b;
        switch (lVar.f2722a) {
            case 0:
                if (cVar instanceof Ao.k) {
                    kVar = (Ao.k) cVar;
                    int i10 = kVar.f2721e;
                    if ((i10 & com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE) != 0) {
                        kVar.f2721e = i10 - com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE;
                    } else {
                        kVar = new Ao.k(lVar, cVar);
                    }
                } else {
                    kVar = new Ao.k(lVar, cVar);
                }
                java.lang.Object obj8 = kVar.f2719c;
                Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
                int i11 = kVar.f2721e;
                if (i11 == 0) {
                    X4.x.M(obj8);
                    p554wo.InterfaceC5088h0 interfaceC5088h0 = (p554wo.InterfaceC5088h0) ((kotlin.jvm.internal.A) obj7).f56399a;
                    if (interfaceC5088h0 != null) {
                        interfaceC5088h0.b(new kotlinx.coroutines.flow.internal.ChildCancelledException());
                        kVar.f2717a = lVar;
                        kVar.f2718b = obj3;
                        kVar.f2721e = 1;
                        if (interfaceC5088h0.u(kVar) == aVar) {
                            return aVar;
                        }
                    }
                } else {
                    if (i11 != 1) {
                        throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    java.lang.Object obj9 = kVar.f2718b;
                    Ao.l lVar2 = kVar.f2717a;
                    X4.x.M(obj8);
                    obj3 = obj9;
                    lVar = lVar2;
                }
                ((kotlin.jvm.internal.A) lVar.f2723b).f56399a = p554wo.C.B((p554wo.InterfaceC5106z) lVar.f2724c, null, p554wo.B.UNDISPATCHED, new Ao.j((Ao.n) lVar.f2725d, (zo.InterfaceC5443m) lVar.f2726e, obj3, null), 1);
                return b7;
            case 1:
                P.C1540o0 c1540o0 = (P.C1540o0) obj7;
                if (((java.lang.Boolean) obj3).booleanValue() && c1540o0.b()) {
                    p076d0.d0 d0Var = (p076d0.d0) obj6;
                    P.H.A((p371p1.x) obj5, c1540o0, d0Var.n(), (p371p1.j) obj4, d0Var.f45525b);
                } else {
                    P.H.q(c1540o0);
                }
                return b7;
            case 2:
                E.k kVar2 = (E.k) obj3;
                kotlin.jvm.internal.z zVar = (kotlin.jvm.internal.z) obj6;
                kotlin.jvm.internal.A a10 = (kotlin.jvm.internal.A) obj7;
                p298m0.Z z13 = (p298m0.Z) obj4;
                if (kVar2 instanceof E.n) {
                    p554wo.InterfaceC5088h0 interfaceC5088h1 = (p554wo.InterfaceC5088h0) a10.f56399a;
                    if (interfaceC5088h1 != null) {
                        interfaceC5088h1.b(null);
                    }
                    zVar.f56418a = android.os.SystemClock.uptimeMillis();
                    float f2 = Qg.w.f22716a;
                    z13.setValue(java.lang.Boolean.TRUE);
                } else if ((kVar2 instanceof E.o) || (kVar2 instanceof E.m)) {
                    long jUptimeMillis = 130 - (android.os.SystemClock.uptimeMillis() - zVar.f56418a);
                    if (jUptimeMillis < 0) {
                        jUptimeMillis = 0;
                    }
                    a10.f56399a = p554wo.C.B((p554wo.InterfaceC5106z) obj5, null, null, new Qg.t(jUptimeMillis, z13, null), 3);
                }
                return b7;
            case 3:
                p592ya.j jVar = (p592ya.j) obj3;
                kotlin.jvm.internal.v vVar = (kotlin.jvm.internal.v) obj7;
                if (!vVar.f56414a && !(jVar instanceof p592ya.f)) {
                    vVar.f56414a = true;
                    java.lang.String str = (java.lang.String) obj6;
                    ((Rb.E0) obj5).f23335f.a("onboarding_device_registration", jVar instanceof p592ya.e ? Im.F.R(new Hm.k("outcome", "failure"), new Hm.k("device_id", str), new Hm.k("error_description", ((p592ya.e) jVar).f73342b.toString())) : Im.F.R(new Hm.k("outcome", "success"), new Hm.k("device_id", str)));
                }
                java.lang.Object objEmit = ((zo.InterfaceC5443m) obj4).emit(jVar, cVar);
                return objEmit == Mm.a.COROUTINE_SUSPENDED ? objEmit : b7;
            case 4:
                return lVar.a((p592ya.j) obj3, cVar);
            case 5:
                if (cVar instanceof Yd.m) {
                    mVar = (Yd.m) cVar;
                    int i12 = mVar.f29849b;
                    if ((i12 & com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE) != 0) {
                        mVar.f29849b = i12 - com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE;
                    } else {
                        mVar = new Yd.m(lVar, cVar);
                    }
                } else {
                    mVar = new Yd.m(lVar, cVar);
                }
                java.lang.Object obj10 = mVar.f29848a;
                Mm.a aVar2 = Mm.a.COROUTINE_SUSPENDED;
                int i13 = mVar.f29849b;
                if (i13 != 0) {
                    if (i13 != 1) {
                        throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    X4.x.M(obj10);
                    return b7;
                }
                X4.x.M(obj10);
                java.lang.Object gVar = (p592ya.j) obj3;
                if (!(gVar instanceof p592ya.f)) {
                    java.lang.String str2 = (java.lang.String) obj6;
                    java.lang.String str3 = (java.lang.String) obj5;
                    com.eightsleep.data_wismo.data.repository.OrderRepository orderRepository = (com.eightsleep.data_wismo.data.repository.OrderRepository) obj7;
                    if (gVar instanceof p592ya.g) {
                        com.eightsleep.data_wismo.data.repository.OrderRepository.access$releaseLiveClaimLocally(orderRepository, str3, str2);
                    } else {
                        if (!(gVar instanceof p592ya.e)) {
                            throw new kotlin.NoWhenBranchMatchedException();
                        }
                        Vm.k kVarAccess$setupStatusRuling = com.eightsleep.data_wismo.data.repository.OrderRepository.access$setupStatusRuling(orderRepository, ((p592ya.e) gVar).f73342b);
                        if (kVarAccess$setupStatusRuling != null) {
                            com.eightsleep.data_wismo.data.repository.OrderRepository.access$updateSetupStatusLocally(orderRepository, str3, str2, kVarAccess$setupStatusRuling);
                            gVar = new p592ya.g(b7);
                        }
                    }
                }
                mVar.f29849b = 1;
                return ((zo.InterfaceC5443m) obj4).emit(gVar, mVar) == aVar2 ? aVar2 : b7;
            case 6:
                if (cVar instanceof p058cb.H0) {
                    h10 = (p058cb.H0) cVar;
                    int i14 = h10.f35748b;
                    if ((i14 & com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE) != 0) {
                        h10.f35748b = i14 - com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE;
                    } else {
                        h10 = new p058cb.H0(lVar, cVar);
                    }
                } else {
                    h10 = new p058cb.H0(lVar, cVar);
                }
                java.lang.Object obj11 = h10.f35747a;
                Mm.a aVar3 = Mm.a.COROUTINE_SUSPENDED;
                int i15 = h10.f35748b;
                if (i15 != 0) {
                    if (i15 != 1) {
                        throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    X4.x.M(obj11);
                    return b7;
                }
                X4.x.M(obj11);
                java.lang.Object gVar2 = (p592ya.j) obj3;
                if (gVar2 instanceof p592ya.e) {
                    com.eightsleep.data_device.data.repository.OfflineRepository.access$log((com.eightsleep.data_device.data.repository.OfflineRepository) obj7, ((p592ya.e) gVar2).f73342b, B.h.k("Error fetching security key for device ", ((com.eightsleep.data_device.data.model.ble.HubPeripheral) obj5).getDeviceId()));
                    gVar2 = new p592ya.g((com.eightsleep.data_device.data.model.offline.OfflineModeData) obj6);
                }
                h10.f35748b = 1;
                return ((zo.InterfaceC5443m) obj4).emit(gVar2, h10) == aVar3 ? aVar3 : b7;
            case 7:
                if (cVar instanceof p111ec.c) {
                    cVar2 = (p111ec.c) cVar;
                    int i16 = cVar2.f46558b;
                    if ((i16 & com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE) != 0) {
                        cVar2.f46558b = i16 - com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE;
                    } else {
                        cVar2 = new p111ec.c(lVar, cVar);
                    }
                } else {
                    cVar2 = new p111ec.c(lVar, cVar);
                }
                java.lang.Object obj12 = cVar2.f46557a;
                Mm.a aVar4 = Mm.a.COROUTINE_SUSPENDED;
                int i17 = cVar2.f46558b;
                if (i17 == 0) {
                    X4.x.M(obj12);
                    p592ya.j jVar2 = (p592ya.j) obj3;
                    interfaceC5443m = (zo.InterfaceC5443m) obj4;
                    if (jVar2 instanceof p592ya.g) {
                        com.eightsleep.data_jetlag.data.model.JetLagPlanResponse jetLagPlanResponse = (com.eightsleep.data_jetlag.data.model.JetLagPlanResponse) Im.r.b1((java.util.List) ((p592ya.g) jVar2).f73344b);
                        java.lang.String str4 = (java.lang.String) obj6;
                        if (jetLagPlanResponse != null) {
                            p283lc.a entity = jetLagPlanResponse.toEntity((java.lang.String) obj5, str4);
                            java.util.List<com.eightsleep.data_jetlag.data.model.JetLagPlanTaskResponse> tasks = jetLagPlanResponse.getTasks();
                            java.util.ArrayList arrayList = new java.util.ArrayList(Im.t.z0(tasks, 10));
                            java.util.Iterator<T> it = tasks.iterator();
                            while (it.hasNext()) {
                                arrayList.add(((com.eightsleep.data_jetlag.data.model.JetLagPlanTaskResponse) it.next()).toEntity());
                            }
                            p283lc.d dVar2 = new p283lc.d(entity, arrayList);
                            p231jc.d dVarAccess$getCache$p = com.eightsleep.data_jetlag.data.repository.JetLagPlanRepository.access$getCache$p((com.eightsleep.data_jetlag.data.repository.JetLagPlanRepository) obj7);
                            cVar2.f46560d = interfaceC5443m;
                            cVar2.f46561e = dVar2;
                            cVar2.f46558b = 1;
                            kc.d dVar3 = dVarAccess$getCache$p.f54351a;
                            java.lang.Object objM = P2.E.M((com.eightsleep.eight.AppDatabase_Impl) dVar3.f55565a, new p189hf.c(11, dVar3, dVar2), cVar2);
                            if (objM != Mm.a.COROUTINE_SUSPENDED) {
                                objM = b7;
                            }
                            if (objM != aVar4) {
                                dVar = dVar2;
                                interfaceC5443m2 = interfaceC5443m;
                            }
                        } else {
                            eVar2 = new p592ya.e(new java.lang.Throwable("No plan found for tripId: ".concat(str4)));
                        }
                        return aVar4;
                    }
                    if (jVar2 instanceof p592ya.e) {
                        eVar2 = new p592ya.e(((p592ya.e) jVar2).f73342b);
                    } else if (!kotlin.jvm.internal.l.e(jVar2, eVar2)) {
                        throw new kotlin.NoWhenBranchMatchedException();
                    }
                    cVar2.f46560d = null;
                    cVar2.f46561e = null;
                    cVar2.f46558b = 2;
                    if (interfaceC5443m.emit(eVar2, cVar2) != aVar4) {
                        return b7;
                    }
                    return aVar4;
                }
                if (i17 != 1) {
                    if (i17 != 2) {
                        throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    X4.x.M(obj12);
                    return b7;
                }
                dVar = cVar2.f46561e;
                interfaceC5443m2 = cVar2.f46560d;
                X4.x.M(obj12);
                eVar2 = new p592ya.g(dVar.a());
                interfaceC5443m = interfaceC5443m2;
                cVar2.f46560d = null;
                cVar2.f46561e = null;
                cVar2.f46558b = 2;
                if (interfaceC5443m.emit(eVar2, cVar2) != aVar4) {
                    return b7;
                }
                return aVar4;
            case 8:
                if (cVar instanceof p111ec.e) {
                    eVar = (p111ec.e) cVar;
                    int i18 = eVar.f46567b;
                    if ((i18 & com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE) != 0) {
                        eVar.f46567b = i18 - com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE;
                    } else {
                        eVar = new p111ec.e(lVar, cVar);
                    }
                } else {
                    eVar = new p111ec.e(lVar, cVar);
                }
                java.lang.Object obj13 = eVar.f46566a;
                Mm.a aVar5 = Mm.a.COROUTINE_SUSPENDED;
                int i19 = eVar.f46567b;
                if (i19 == 0) {
                    X4.x.M(obj13);
                    obj2 = (p592ya.j) obj3;
                    interfaceC5443m3 = (zo.InterfaceC5443m) obj4;
                    if (obj2 instanceof p592ya.f) {
                        eVar.f46568c = null;
                        eVar.f46570e = null;
                        eVar.f46567b = 2;
                        if (interfaceC5443m3.emit(eVar2, eVar) != aVar5) {
                            return b7;
                        }
                    } else if (obj2 instanceof p592ya.g) {
                        eVar2 = new p592ya.g(b7);
                        eVar.f46568c = null;
                        eVar.f46570e = null;
                        eVar.f46567b = 2;
                        if (interfaceC5443m3.emit(eVar2, eVar) != aVar5) {
                            return b7;
                        }
                    } else {
                        if (!(obj2 instanceof p592ya.e)) {
                            throw new kotlin.NoWhenBranchMatchedException();
                        }
                        p231jc.d dVarAccess$getCache$p2 = com.eightsleep.data_jetlag.data.repository.JetLagPlanRepository.access$getCache$p((com.eightsleep.data_jetlag.data.repository.JetLagPlanRepository) obj7);
                        java.util.List<p161gc.f> list = (java.util.List) obj5;
                        java.util.ArrayList arrayList2 = new java.util.ArrayList(Im.t.z0(list, 10));
                        for (p161gc.f fVar : list) {
                            java.lang.String id2 = fVar.f48497a;
                            p161gc.d dVar4 = fVar.f48500d;
                            kotlin.jvm.internal.l.j(id2, "id");
                            com.eightsleep.data_jetlag.enums.JetLagTaskType type = fVar.f48498b;
                            kotlin.jvm.internal.l.j(type, "type");
                            com.eightsleep.data_jetlag.enums.JetLagPlanTaskStatus status = (com.eightsleep.data_jetlag.enums.JetLagPlanTaskStatus) obj6;
                            kotlin.jvm.internal.l.j(status, "status");
                            arrayList2.add(new p161gc.f(id2, type, status, dVar4));
                        }
                        eVar.f46568c = interfaceC5443m3;
                        eVar.f46570e = (p592ya.e) obj2;
                        eVar.f46567b = 1;
                        if (dVarAccess$getCache$p2.h(arrayList2, eVar) != aVar5) {
                            interfaceC5443m4 = interfaceC5443m3;
                        }
                    }
                    return aVar5;
                }
                if (i19 != 1) {
                    if (i19 != 2) {
                        throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    X4.x.M(obj13);
                    return b7;
                }
                obj2 = eVar.f46570e;
                interfaceC5443m4 = eVar.f46568c;
                X4.x.M(obj13);
                eVar2 = new p592ya.e(((p592ya.e) obj2).f73342b);
                interfaceC5443m3 = interfaceC5443m4;
                eVar.f46568c = null;
                eVar.f46570e = null;
                eVar.f46567b = 2;
                if (interfaceC5443m3.emit(eVar2, eVar) != aVar5) {
                    return b7;
                }
                return aVar5;
            case 9:
                ((java.lang.Number) obj3).intValue();
                I.t tVar = ((I.A) obj7).f13186e;
                int iK = tVar.f13326b.k() / 12;
                int iK2 = (tVar.f13326b.k() % 12) + 1;
                int i20 = ((p021an.k) obj4).f32590a + iK;
                p246k0.I i21 = (p246k0.I) ((p246k0.G) obj6);
                i21.getClass();
                ((Vm.k) obj5).invoke(new java.lang.Long(i21.e(java.time.LocalDate.of(i20, iK2, 1)).f54764e));
                return b7;
            case 10:
                if (cVar instanceof p378pc.g0) {
                    g0Var = (p378pc.g0) cVar;
                    int i22 = g0Var.f63753b;
                    if ((i22 & com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE) != 0) {
                        g0Var.f63753b = i22 - com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE;
                    } else {
                        g0Var = new p378pc.g0(lVar, cVar);
                    }
                } else {
                    g0Var = new p378pc.g0(lVar, cVar);
                }
                java.lang.Object objU = g0Var.f63752a;
                Mm.a aVar6 = Mm.a.COROUTINE_SUSPENDED;
                int i23 = g0Var.f63753b;
                if (i23 == 0) {
                    X4.x.M(objU);
                    p592ya.j jVar3 = (p592ya.j) obj3;
                    interfaceC5443m5 = (zo.InterfaceC5443m) obj4;
                    if (jVar3 instanceof p592ya.g) {
                        java.time.LocalDate localDate = (java.time.LocalDate) obj6;
                        zo.InterfaceC5441l interfaceC5441lH = com.eightsleep.data_metrics.data.repository.MetricsTrendsRepository.access$getCache$p((com.eightsleep.data_metrics.data.repository.MetricsTrendsRepository) obj7).h((java.lang.String) obj5, localDate, localDate);
                        g0Var.f63754c = interfaceC5443m5;
                        g0Var.f63753b = 1;
                        objU = zo.AbstractC5454s.u(interfaceC5441lH, g0Var);
                        if (objU != aVar6) {
                            interfaceC5443m6 = interfaceC5443m5;
                        }
                    } else {
                        if (jVar3 instanceof p592ya.e) {
                            eVar2 = new p592ya.e(((p592ya.e) jVar3).f73342b);
                        } else if (!(jVar3 instanceof p592ya.f)) {
                            throw new kotlin.NoWhenBranchMatchedException();
                        }
                        g0Var.f63754c = null;
                        g0Var.f63753b = 2;
                        if (interfaceC5443m5.emit(eVar2, g0Var) != aVar6) {
                            return b7;
                        }
                    }
                    return aVar6;
                }
                if (i23 != 1) {
                    if (i23 != 2) {
                        throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    X4.x.M(objU);
                    return b7;
                }
                interfaceC5443m6 = g0Var.f63754c;
                X4.x.M(objU);
                java.lang.Iterable iterable = (java.lang.Iterable) objU;
                if ((iterable instanceof java.util.Collection) && ((java.util.Collection) iterable).isEmpty()) {
                    z10 = false;
                } else {
                    java.util.Iterator it2 = iterable.iterator();
                    while (true) {
                        if (!it2.hasNext()) {
                            z10 = false;
                        } else if (((p618zc.c) it2.next()).f74702d != null) {
                            z10 = true;
                        }
                    }
                }
                eVar2 = new p592ya.g(java.lang.Boolean.valueOf(z10));
                interfaceC5443m5 = interfaceC5443m6;
                g0Var.f63754c = null;
                g0Var.f63753b = 2;
                if (interfaceC5443m5.emit(eVar2, g0Var) != aVar6) {
                    return b7;
                }
                return aVar6;
            default:
                E.k kVar3 = (E.k) obj3;
                kotlin.jvm.internal.y yVar = (kotlin.jvm.internal.y) obj6;
                kotlin.jvm.internal.y yVar2 = (kotlin.jvm.internal.y) obj5;
                kotlin.jvm.internal.y yVar3 = (kotlin.jvm.internal.y) obj7;
                if (kVar3 instanceof E.n) {
                    yVar3.f56417a++;
                } else if ((kVar3 instanceof E.o) || (kVar3 instanceof E.m)) {
                    yVar3.f56417a--;
                } else if (kVar3 instanceof E.h) {
                    yVar2.f56417a++;
                } else if (kVar3 instanceof E.i) {
                    yVar2.f56417a--;
                } else if (kVar3 instanceof E.d) {
                    yVar.f56417a++;
                } else if (kVar3 instanceof E.e) {
                    yVar.f56417a--;
                }
                boolean z14 = yVar3.f56417a > 0;
                boolean z15 = yVar2.f56417a > 0;
                boolean z16 = yVar.f56417a > 0;
                p582y.P p8 = (p582y.P) obj4;
                if (p8.f72525b != z14) {
                    p8.f72525b = z14;
                    z11 = true;
                } else {
                    z11 = false;
                }
                if (p8.f72526c != z15) {
                    p8.f72526c = z15;
                    z11 = true;
                }
                if (p8.f72527d != z16) {
                    p8.f72527d = z16;
                } else {
                    z12 = z11;
                }
                if (z12) {
                    Z0.AbstractC2210l.l(p8);
                }
                return b7;
        }
    }

    public l(java.lang.String str, com.eightsleep.data_bedtime.data.repository.RecommendedBedtimeRepository recommendedBedtimeRepository, zo.InterfaceC5443m interfaceC5443m, p034ba.d dVar) {
        this.f2722a = 4;
        this.f2723b = str;
        this.f2724c = recommendedBedtimeRepository;
        this.f2726e = interfaceC5443m;
        this.f2725d = dVar;
    }

    public l(kotlin.jvm.internal.A a10, kotlin.jvm.internal.z zVar, p554wo.InterfaceC5106z interfaceC5106z, p298m0.Z z10) {
        this.f2722a = 2;
        this.f2723b = a10;
        this.f2725d = zVar;
        this.f2724c = interfaceC5106z;
        this.f2726e = z10;
    }

    public /* synthetic */ l(zo.InterfaceC5443m interfaceC5443m, Na.b bVar, java.lang.Object obj, java.lang.Object obj2, int i10) {
        this.f2722a = i10;
        this.f2726e = interfaceC5443m;
        this.f2723b = bVar;
        this.f2724c = obj;
        this.f2725d = obj2;
    }
}
