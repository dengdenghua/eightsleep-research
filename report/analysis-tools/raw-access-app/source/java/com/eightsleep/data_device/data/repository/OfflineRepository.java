package com.eightsleep.data_device.data.repository;

/* JADX INFO: loaded from: classes2.dex */
@kotlin.Metadata(d1 = {"\u0000 \u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\u0003\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\b\n\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0002OPBA\b\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\u0006\u0010\u000b\u001a\u00020\n\u0012\u0006\u0010\r\u001a\u00020\f\u0012\u0006\u0010\u000f\u001a\u00020\u000e¢\u0006\u0004\b\u0010\u0010\u0011J0\u0010\u0018\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00170\u00160\u0015\"\u0004\b\u0000\u0010\u00122\f\u0010\u0014\u001a\b\u0012\u0004\u0012\u00028\u00000\u0013H\u0086@¢\u0006\u0004\b\u0018\u0010\u0019J0\u0010\u001c\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\u00160\u0015\"\u0004\b\u0000\u0010\u001a2\f\u0010\u0014\u001a\b\u0012\u0004\u0012\u00028\u00000\u001bH\u0086@¢\u0006\u0004\b\u001c\u0010\u001dJ8\u0010\"\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00170\u00160\u0015\"\u0004\b\u0000\u0010\u00122\u0006\u0010\u001f\u001a\u00020\u001e2\f\u0010!\u001a\b\u0012\u0004\u0012\u00028\u00000 H\u0086@¢\u0006\u0004\b\"\u0010#J:\u0010%\u001a\u0010\u0012\f\u0012\n\u0012\u0006\u0012\u0004\u0018\u00018\u00000\u00160\u0015\"\u0004\b\u0000\u0010\u001a2\u0006\u0010\u001f\u001a\u00020\u001e2\f\u0010!\u001a\b\u0012\u0004\u0012\u00028\u00000$H\u0086@¢\u0006\u0004\b%\u0010&J$\u0010(\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020'0\u00160\u00152\u0006\u0010\u001f\u001a\u00020\u001eH\u0086@¢\u0006\u0004\b(\u0010)J!\u0010+\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020*0\u00160\u00152\u0006\u0010\u001f\u001a\u00020\u001e¢\u0006\u0004\b+\u0010,J!\u0010.\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020-0\u00160\u00152\u0006\u0010\u001f\u001a\u00020\u001e¢\u0006\u0004\b.\u0010,J&\u0010/\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020-0\u00160\u00152\b\u0010\u001f\u001a\u0004\u0018\u00010\u001eH\u0086@¢\u0006\u0004\b/\u0010)J\u0019\u00101\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u0002000\u00160\u0015¢\u0006\u0004\b1\u00102J\u001c\u00103\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00170\u00160\u0015H\u0086@¢\u0006\u0004\b3\u00104J\u0019\u00105\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00170\u00160\u0015¢\u0006\u0004\b5\u00102J\u0010\u00106\u001a\u00020\u0017H\u0086@¢\u0006\u0004\b6\u00104J.\u0010;\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020'0\u00160\u00152\u0006\u00107\u001a\u00020-2\b\b\u0002\u00108\u001a\u00020*H\u0081@¢\u0006\u0004\b9\u0010:J\u0017\u0010@\u001a\u00020*2\u0006\u0010=\u001a\u00020<H\u0001¢\u0006\u0004\b>\u0010?R\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\bA\u0010B\u001a\u0004\bC\u0010DR:\u0010N\u001a\u001a\u0012\u0016\u0012\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u001e\u0012\u0004\u0012\u00020G0F0\u00160E8\u0000@\u0000X\u0080\u000e¢\u0006\u0012\n\u0004\bH\u0010I\u001a\u0004\bJ\u0010K\"\u0004\bL\u0010M¨\u0006Q"}, d2 = {"Lcom/eightsleep/data_device/data/repository/OfflineRepository;", "LNa/b;", "Lab/o;", "api", "Lab/P;", "offlineApi", "Llb/f;", "deviceDao", "Lkb/e;", "offlineModeDataCache", "Lwo/z;", "coroutineScope", "LWc/b;", "featureFlags", "LRc/b;", "analytics", "<init>", "(Lab/o;Lab/P;Llb/f;Lkb/e;Lwo/z;LWc/b;LRc/b;)V", "REQUEST", "Lfb/b;", com.heytap.mcssdk.constant.b.f42641y, "Lzo/l;", "Lya/j;", "LHm/B;", p219io.opentelemetry.semconv.incubating.DiskIncubatingAttributes$DiskIoDirectionIncubatingValues.WRITE, "(Lfb/b;LLm/c;)Ljava/lang/Object;", "RESPONSE", "Lfb/a;", "read", "(Lfb/a;LLm/c;)Ljava/lang/Object;", "", "deviceId", "Lcom/eightsleep/data_device/data/model/ble/WriteCharacteristic;", "characteristic", "writeCharacteristic", "(Ljava/lang/String;Lcom/eightsleep/data_device/data/model/ble/WriteCharacteristic;LLm/c;)Ljava/lang/Object;", "Lcom/eightsleep/data_device/data/model/ble/ReadCharacteristic;", "readCharacteristic", "(Ljava/lang/String;Lcom/eightsleep/data_device/data/model/ble/ReadCharacteristic;LLm/c;)Ljava/lang/Object;", "Lcom/eightsleep/data_device/data/model/offline/OfflineModeData;", "getOfflineDataForDevice", "(Ljava/lang/String;LLm/c;)Ljava/lang/Object;", "", "isDeviceNearby", "(Ljava/lang/String;)Lzo/l;", "Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;", "getDevicePeripheral", "findHubInPairingMode", "Lcom/eightsleep/data_device/data/model/ble/BasePeripheral;", "scanForBase", "()Lzo/l;", "sendEmergencyFlatCommand", "(LLm/c;)Ljava/lang/Object;", "disconnectBaseBleConnection", "cleanup", "hubPeripheral", "forceFreshToken", "refreshOfflineData$data_device_tencentRelease", "(Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;ZLLm/c;)Ljava/lang/Object;", "refreshOfflineData", "", "throwable", "shouldDisconnect$data_device_tencentRelease", "(Ljava/lang/Throwable;)Z", "shouldDisconnect", "a", "Lab/o;", "getApi", "()Lab/o;", "Lzo/r0;", "", "Lcom/eightsleep/data_device/data/model/ble/EightPeripheral;", "i", "Lzo/r0;", "getHubPeripheralMemCache$data_device_tencentRelease", "()Lzo/r0;", "setHubPeripheralMemCache$data_device_tencentRelease", "(Lzo/r0;)V", "hubPeripheralMemCache", "cb/d0", "cb/e0", "data-device_tencentRelease"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class OfflineRepository implements Na.b {

    /* JADX INFO: renamed from: a, reason: collision with root package name and from kotlin metadata */
    public final p011ab.InterfaceC2341o api;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public final p011ab.P f40065b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public final p282lb.f f40066c;

    /* JADX INFO: renamed from: d, reason: collision with root package name */
    public final p256kb.e f40067d;

    /* JADX INFO: renamed from: e, reason: collision with root package name */
    public final p554wo.InterfaceC5106z f40068e;

    /* JADX INFO: renamed from: f, reason: collision with root package name */
    public final Wc.b f40069f;

    /* JADX INFO: renamed from: g, reason: collision with root package name */
    public final Rc.C1650b f40070g;

    /* JADX INFO: renamed from: h, reason: collision with root package name */
    public final Ya.B f40071h;

    /* JADX INFO: renamed from: i, reason: collision with root package name */
    public final zo.M0 f40072i;

    public OfflineRepository(p011ab.InterfaceC2341o api, p011ab.P offlineApi, p282lb.f deviceDao, p256kb.e offlineModeDataCache, p554wo.InterfaceC5106z coroutineScope, Wc.b featureFlags, Rc.C1650b analytics) {
        kotlin.jvm.internal.l.j(api, "api");
        kotlin.jvm.internal.l.j(offlineApi, "offlineApi");
        kotlin.jvm.internal.l.j(deviceDao, "deviceDao");
        kotlin.jvm.internal.l.j(offlineModeDataCache, "offlineModeDataCache");
        kotlin.jvm.internal.l.j(coroutineScope, "coroutineScope");
        kotlin.jvm.internal.l.j(featureFlags, "featureFlags");
        kotlin.jvm.internal.l.j(analytics, "analytics");
        this.api = api;
        this.f40065b = offlineApi;
        this.f40066c = deviceDao;
        this.f40067d = offlineModeDataCache;
        this.f40068e = coroutineScope;
        this.f40069f = featureFlags;
        this.f40070g = analytics;
        this.f40071h = new Ya.B(coroutineScope, zo.C0.a(2), 1);
        this.f40072i = zo.AbstractC5454s.c(new p592ya.g(Im.A.f14215a));
    }

    public static java.lang.Object a(com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository, java.lang.String str, Nm.i iVar) {
        com.eightsleep.data_device.data.model.offline.OfflineModeData offlineModeDataH = offlineRepository.f40067d.h(str);
        java.lang.String macAddress = offlineModeDataH != null ? offlineModeDataH.getMacAddress() : null;
        offlineRepository.getClass();
        return offlineRepository.b(iVar, new p058cb.B0(offlineRepository, str, macAddress, null), str);
    }

    public static final void access$cacheHubPeripheral(com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository, com.eightsleep.data_device.data.model.ble.EightPeripheral eightPeripheral) {
        offlineRepository.getClass();
        if (eightPeripheral instanceof com.eightsleep.data_device.data.model.ble.HubPeripheral) {
            com.eightsleep.data_device.data.model.ble.HubPeripheral hubPeripheral = (com.eightsleep.data_device.data.model.ble.HubPeripheral) eightPeripheral;
            java.lang.String strK = B.h.k("Caching peripheral for id: ", hubPeripheral.getDeviceId());
            br.a aVar = timber.log.Timber.f67879a;
            aVar.p("OfflineRepository");
            aVar.b(strK, new java.lang.Object[0]);
            zo.M0 m2 = offlineRepository.f40072i;
            java.util.Map map = (java.util.Map) ((p592ya.j) m2.getValue()).e();
            if (map == null) {
                map = Im.A.f14215a;
            }
            m2.k(null, new p592ya.g(Im.F.U(map, new Hm.k(hubPeripheral.getDeviceId(), eightPeripheral))));
        }
    }

    public static final zo.InterfaceC5441l access$canRunOfflineCommandFlow(com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository, java.lang.String str) {
        offlineRepository.getClass();
        return new zo.u0(new p058cb.C2612f0(offlineRepository, str, null));
    }

    public static final zo.InterfaceC5441l access$checkCachedPeripherals(com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository, java.lang.String str) {
        offlineRepository.getClass();
        return new zo.u0(new p058cb.C2616h0(offlineRepository, str, null));
    }

    /* JADX WARN: Code duplicated, block: B:25:0x0085  */
    /* JADX WARN: Code duplicated, block: B:28:0x0093 A[DONT_INVERT] */
    /* JADX WARN: Code duplicated, block: B:29:0x0095  */
    /* JADX WARN: Code duplicated, block: B:30:0x0097  */
    /* JADX WARN: Code duplicated, block: B:7:0x0016  */
    public static final java.lang.Object access$disconnectCachedPeripheral(com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository, java.lang.String str, Lm.c cVar) {
        p058cb.C2622k0 c2622k0;
        com.eightsleep.data_device.data.model.ble.EightPeripheral eightPeripheral;
        com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository2;
        com.eightsleep.data_device.data.model.ble.EightPeripheral eightPeripheral2;
        java.util.Map map;
        java.util.Map mapN;
        java.util.LinkedHashMap linkedHashMapB0;
        int size;
        offlineRepository.getClass();
        if (cVar instanceof p058cb.C2622k0) {
            c2622k0 = (p058cb.C2622k0) cVar;
            int i10 = c2622k0.f35933f;
            if ((i10 & com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE) != 0) {
                c2622k0.f35933f = i10 - com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE;
            } else {
                c2622k0 = new p058cb.C2622k0(offlineRepository, cVar);
            }
        } else {
            c2622k0 = new p058cb.C2622k0(offlineRepository, cVar);
        }
        java.lang.Object obj = c2622k0.f35931d;
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i11 = c2622k0.f35933f;
        if (i11 == 0) {
            X4.x.M(obj);
            java.util.Map map2 = (java.util.Map) ((p592ya.j) offlineRepository.f40072i.getValue()).e();
            if (map2 != null && (eightPeripheral = (com.eightsleep.data_device.data.model.ble.EightPeripheral) map2.get(str)) != null) {
                com.juul.kable.Peripheral peripheral = eightPeripheral.getPeripheral();
                c2622k0.f35928a = offlineRepository;
                c2622k0.f35929b = str;
                c2622k0.f35930c = eightPeripheral;
                c2622k0.f35933f = 1;
                if (peripheral.disconnect(c2622k0) == aVar) {
                    return aVar;
                }
                offlineRepository2 = offlineRepository;
                eightPeripheral2 = eightPeripheral;
            }
            zo.M0 m2 = offlineRepository.f40072i;
            map = (java.util.Map) ((p592ya.j) m2.getValue()).e();
            mapN = Im.A.f14215a;
            if (map == null) {
                map = mapN;
            }
            linkedHashMapB0 = Im.F.b0(map);
            linkedHashMapB0.remove(str);
            size = linkedHashMapB0.size();
            if (size != 0) {
                if (size != 1) {
                    mapN = linkedHashMapB0;
                } else {
                    mapN = Im.G.N(linkedHashMapB0);
                }
            }
            m2.k(null, new p592ya.g(mapN));
            return Hm.B.f13117a;
        }
        if (i11 != 1) {
            throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        eightPeripheral2 = c2622k0.f35930c;
        str = c2622k0.f35929b;
        offlineRepository2 = c2622k0.f35928a;
        X4.x.M(obj);
        p554wo.C.j(eightPeripheral2.getScope(), null);
        offlineRepository = offlineRepository2;
        zo.M0 m10 = offlineRepository.f40072i;
        map = (java.util.Map) ((p592ya.j) m10.getValue()).e();
        mapN = Im.A.f14215a;
        if (map == null) {
            map = mapN;
        }
        linkedHashMapB0 = Im.F.b0(map);
        linkedHashMapB0.remove(str);
        size = linkedHashMapB0.size();
        if (size != 0) {
            if (size != 1) {
                mapN = linkedHashMapB0;
            } else {
                mapN = Im.G.N(linkedHashMapB0);
            }
        }
        m10.k(null, new p592ya.g(mapN));
        return Hm.B.f13117a;
    }

    public static final /* synthetic */ Rc.C1650b access$getAnalytics$p(com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository) {
        return offlineRepository.f40070g;
    }

    public static final /* synthetic */ p554wo.InterfaceC5106z access$getCoroutineScope$p(com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository) {
        return offlineRepository.f40068e;
    }

    public static final /* synthetic */ p282lb.f access$getDeviceDao$p(com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository) {
        return offlineRepository.f40066c;
    }

    public static final /* synthetic */ Wc.b access$getFeatureFlags$p(com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository) {
        return offlineRepository.f40069f;
    }

    public static final /* synthetic */ p011ab.P access$getOfflineApi$p(com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository) {
        return offlineRepository.f40065b;
    }

    public static final /* synthetic */ p256kb.e access$getOfflineModeDataCache$p(com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository) {
        return offlineRepository.f40067d;
    }

    public static final java.lang.Object access$getPeripheral(com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository, java.lang.String str, java.lang.String str2, Lm.c cVar) {
        offlineRepository.getClass();
        return offlineRepository.b(cVar, new p058cb.B0(offlineRepository, str, str2, null), str);
    }

    public static final /* synthetic */ java.lang.Object access$getPeripheralBy(com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository, java.lang.String str, Vm.k kVar, Lm.c cVar) {
        return offlineRepository.b(cVar, kVar, str);
    }

    /* JADX WARN: Code duplicated, block: B:8:0x0017  */
    public static final java.lang.Object access$hydrateOfflineData(com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository, com.eightsleep.data_device.data.model.ble.HubPeripheral hubPeripheral, Lm.c cVar) {
        p058cb.I0 i10;
        com.eightsleep.data_device.data.model.offline.OfflineModeData offlineModeDataH;
        zo.InterfaceC5441l eVar;
        com.eightsleep.data_device.data.model.offline.OfflineModeData offlineModeData;
        com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository2;
        com.eightsleep.data_device.data.model.ble.HubPeripheral hubPeripheral2;
        java.lang.Object obj;
        com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository3;
        com.eightsleep.data_device.data.model.ble.HubPeripheral hubPeripheral3;
        offlineRepository.getClass();
        if (cVar instanceof p058cb.I0) {
            i10 = (p058cb.I0) cVar;
            int i11 = i10.f35755f;
            if ((i11 & com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE) != 0) {
                i10.f35755f = i11 - com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE;
            } else {
                i10 = new p058cb.I0(offlineRepository, cVar);
            }
        } else {
            i10 = new p058cb.I0(offlineRepository, cVar);
        }
        p058cb.I0 i12 = i10;
        java.lang.Object obj2 = i12.f35753d;
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i13 = i12.f35755f;
        if (i13 == 0) {
            X4.x.M(obj2);
            offlineModeDataH = offlineRepository.f40067d.h(hubPeripheral.getDeviceId());
            if (offlineModeDataH == null) {
                i12.f35750a = offlineRepository;
                i12.f35751b = hubPeripheral;
                i12.f35752c = offlineModeDataH;
                i12.f35755f = 1;
                java.lang.Object objRefreshOfflineData$data_device_tencentRelease$default = refreshOfflineData$data_device_tencentRelease$default(offlineRepository, hubPeripheral, false, i12, 2, null);
                if (objRefreshOfflineData$data_device_tencentRelease$default == aVar) {
                    return aVar;
                }
                obj = objRefreshOfflineData$data_device_tencentRelease$default;
                offlineRepository3 = offlineRepository;
                hubPeripheral3 = hubPeripheral;
            } else {
                if (offlineModeDataH.shouldRefresh()) {
                    p554wo.C.B(offlineRepository.f40068e, null, null, new p058cb.K0(offlineRepository, hubPeripheral, null), 3);
                    eVar = new J8.e(new p592ya.g(offlineModeDataH), 9);
                } else {
                    eVar = new J8.e(new p592ya.g(offlineModeDataH), 9);
                }
                offlineModeData = offlineModeDataH;
                offlineRepository2 = offlineRepository;
                hubPeripheral2 = hubPeripheral;
            }
            return new Yd.n(eVar, offlineRepository2, hubPeripheral2, offlineModeData, 1);
        }
        if (i13 != 1) {
            throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        com.eightsleep.data_device.data.model.offline.OfflineModeData offlineModeData2 = i12.f35752c;
        hubPeripheral3 = i12.f35751b;
        com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository4 = i12.f35750a;
        X4.x.M(obj2);
        offlineModeDataH = offlineModeData2;
        offlineRepository3 = offlineRepository4;
        obj = obj2;
        eVar = (zo.InterfaceC5441l) obj;
        offlineRepository2 = offlineRepository3;
        hubPeripheral2 = hubPeripheral3;
        offlineModeData = offlineModeDataH;
        return new Yd.n(eVar, offlineRepository2, hubPeripheral2, offlineModeData, 1);
    }

    public static final boolean access$isDecryptionError(com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository, java.lang.Throwable th2) {
        offlineRepository.getClass();
        return (th2 instanceof javax.crypto.AEADBadTagException) || (th2 instanceof javax.crypto.BadPaddingException) || (th2.getCause() instanceof javax.crypto.AEADBadTagException) || (th2.getCause() instanceof javax.crypto.BadPaddingException);
    }

    public static final void access$log(com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository, java.lang.String str) {
        offlineRepository.getClass();
        br.a aVar = timber.log.Timber.f67879a;
        aVar.p("OfflineRepository");
        aVar.b(str, new java.lang.Object[0]);
    }

    /* JADX WARN: Code duplicated, block: B:7:0x0016  */
    public static final java.lang.Object access$saveOfflineDataForDevice(com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository, com.eightsleep.data_device.data.model.ble.HubPeripheral hubPeripheral, com.eightsleep.data_device.data.model.offline.OfflineSecurityKey offlineSecurityKey, Lm.c cVar) {
        p058cb.T0 t1;
        offlineRepository.getClass();
        if (cVar instanceof p058cb.T0) {
            t1 = (p058cb.T0) cVar;
            int i10 = t1.f35826d;
            if ((i10 & com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE) != 0) {
                t1.f35826d = i10 - com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE;
            } else {
                t1 = new p058cb.T0(offlineRepository, cVar);
            }
        } else {
            t1 = new p058cb.T0(offlineRepository, cVar);
        }
        java.lang.Object obj = t1.f35824b;
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i11 = t1.f35826d;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            com.eightsleep.data_device.data.model.offline.OfflineModeData offlineModeData = t1.f35823a;
            X4.x.M(obj);
            return offlineModeData;
        }
        X4.x.M(obj);
        com.eightsleep.data_device.data.model.offline.OfflineModeData offlineModeData2 = new com.eightsleep.data_device.data.model.offline.OfflineModeData(hubPeripheral.getDeviceId(), hubPeripheral.getPeripheral().getIdentifier(), offlineSecurityKey, null, 8, null);
        java.lang.String deviceId = hubPeripheral.getDeviceId();
        t1.f35823a = offlineModeData2;
        t1.f35826d = 1;
        return offlineRepository.f40067d.i(offlineModeData2, deviceId, t1) == aVar ? aVar : offlineModeData2;
    }

    public static /* synthetic */ java.lang.Object refreshOfflineData$data_device_tencentRelease$default(com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository, com.eightsleep.data_device.data.model.ble.HubPeripheral hubPeripheral, boolean z10, Lm.c cVar, int i10, java.lang.Object obj) {
        if ((i10 & 2) != 0) {
            z10 = false;
        }
        return offlineRepository.refreshOfflineData$data_device_tencentRelease(hubPeripheral, z10, cVar);
    }

    /* JADX WARN: Code duplicated, block: B:7:0x0013  */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0046, code lost:
    
        if (r7 == r1) goto L26;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final java.lang.Object b(Lm.c cVar, Vm.k kVar, java.lang.String str) {
        p058cb.C0 c1;
        if (cVar instanceof p058cb.C0) {
            c1 = (p058cb.C0) cVar;
            int i10 = c1.f35724d;
            if ((i10 & com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE) != 0) {
                c1.f35724d = i10 - com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE;
            } else {
                c1 = new p058cb.C0(this, cVar);
            }
        } else {
            c1 = new p058cb.C0(this, cVar);
        }
        java.lang.Object objInvoke = c1.f35722b;
        java.lang.Object obj = Mm.a.COROUTINE_SUSPENDED;
        int i11 = c1.f35724d;
        if (i11 == 0) {
            X4.x.M(objInvoke);
            if (str == null) {
                c1.f35721a = this;
                c1.f35724d = 1;
                objInvoke = kVar.invoke(c1);
            } else {
                p058cb.G0 g10 = new p058cb.G0(this, str, kVar, null);
                c1.f35724d = 2;
                java.lang.Object objB = this.f40071h.b(str, g10, c1);
                if (objB != obj) {
                    return objB;
                }
            }
            return obj;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            X4.x.M(objInvoke);
            return objInvoke;
        }
        this = c1.f35721a;
        X4.x.M(objInvoke);
        return P2.q.t((zo.InterfaceC5441l) objInvoke, null, new p058cb.D0(this, null), 3);
    }

    public <R> zo.InterfaceC5441l call(p011ab.InterfaceC2341o interfaceC2341o, boolean z10, Ka.c cVar, Vm.n nVar) {
        return P2.AbstractC1563b.s(this, z10, cVar, nVar);
    }

    /* JADX WARN: Code duplicated, block: B:26:0x0073  */
    /* JADX WARN: Code duplicated, block: B:30:0x00a0  */
    /* JADX WARN: Code duplicated, block: B:7:0x0013  */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x004c, code lost:
    
        if (r6.f40071h.a(r0) == r1) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x008f, code lost:
    
        if (r7.disconnect(r0) == r1) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0091, code lost:
    
        return r1;
     */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:27:0x008f -> B:29:0x0092). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final java.lang.Object cleanup(Lm.c<? super Hm.B> cVar) {
        p058cb.C2618i0 c2618i0;
        java.util.Set setEntrySet;
        com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository;
        java.util.Iterator it;
        java.util.Map$Entry map$Entry;
        if (cVar instanceof p058cb.C2618i0) {
            c2618i0 = (p058cb.C2618i0) cVar;
            int i10 = c2618i0.f35920f;
            if ((i10 & com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE) != 0) {
                c2618i0.f35920f = i10 - com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE;
            } else {
                c2618i0 = new p058cb.C2618i0(this, cVar);
            }
        } else {
            c2618i0 = new p058cb.C2618i0(this, cVar);
        }
        java.lang.Object obj = c2618i0.f35918d;
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i11 = c2618i0.f35920f;
        if (i11 != 0) {
            if (i11 == 1) {
                this = c2618i0.f35915a;
                X4.x.M(obj);
            } else {
                if (i11 != 2) {
                    throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                map$Entry = c2618i0.f35917c;
                it = c2618i0.f35916b;
                offlineRepository = c2618i0.f35915a;
                X4.x.M(obj);
            }
            p554wo.C.j(((com.eightsleep.data_device.data.model.ble.EightPeripheral) map$Entry.getValue()).getScope(), null);
            if (!it.hasNext()) {
                this = offlineRepository;
                zo.M0 m2 = this.f40072i;
                p592ya.g gVar = new p592ya.g(Im.A.f14215a);
                m2.getClass();
                m2.k(null, gVar);
                return Hm.B.f13117a;
            }
            map$Entry = (java.util.Map$Entry) it.next();
            com.juul.kable.Peripheral peripheral = ((com.eightsleep.data_device.data.model.ble.EightPeripheral) map$Entry.getValue()).getPeripheral();
            c2618i0.f35915a = offlineRepository;
            c2618i0.f35916b = it;
            c2618i0.f35917c = map$Entry;
            c2618i0.f35920f = 2;
        } else {
            X4.x.M(obj);
            c2618i0.f35915a = this;
            c2618i0.f35920f = 1;
        }
        java.util.Map map = (java.util.Map) ((p592ya.j) this.f40072i.getValue()).e();
        if (map != null && (setEntrySet = map.entrySet()) != null) {
            offlineRepository = this;
            it = setEntrySet.iterator();
            if (!it.hasNext()) {
                map$Entry = (java.util.Map$Entry) it.next();
                com.juul.kable.Peripheral peripheral2 = ((com.eightsleep.data_device.data.model.ble.EightPeripheral) map$Entry.getValue()).getPeripheral();
                c2618i0.f35915a = offlineRepository;
                c2618i0.f35916b = it;
                c2618i0.f35917c = map$Entry;
                c2618i0.f35920f = 2;
            } else {
                this = offlineRepository;
            }
        }
        zo.M0 m10 = this.f40072i;
        p592ya.g gVar2 = new p592ya.g(Im.A.f14215a);
        m10.getClass();
        m10.k(null, gVar2);
        return Hm.B.f13117a;
    }

    public final zo.InterfaceC5441l disconnectBaseBleConnection() {
        return new zo.u0(new p058cb.C2620j0(this, null));
    }

    public final java.lang.Object findHubInPairingMode(java.lang.String str, Lm.c<? super zo.InterfaceC5441l> cVar) {
        return b(cVar, new p058cb.A0(this, null), str);
    }

    @Override // Na.b
    public /* bridge */ /* synthetic */ java.lang.Object getApi() {
        return getApi();
    }

    public final zo.InterfaceC5441l getDevicePeripheral(java.lang.String deviceId) {
        kotlin.jvm.internal.l.j(deviceId, "deviceId");
        return P2.q.C(new zo.u0(new p058cb.C2616h0(this, deviceId, null)), new p058cb.C2641u0(this, deviceId, null));
    }

    public final zo.InterfaceC5453r0 getHubPeripheralMemCache$data_device_tencentRelease() {
        return this.f40072i;
    }

    public final java.lang.Object getOfflineDataForDevice(java.lang.String str, Lm.c<? super zo.InterfaceC5441l> cVar) {
        return P2.q.u(new zo.u0(new p058cb.C2614g0(this, str, null)), null, new p058cb.x0(this, str, null), 3);
    }

    public final zo.InterfaceC5441l isDeviceNearby(java.lang.String deviceId) {
        kotlin.jvm.internal.l.j(deviceId, "deviceId");
        return P2.q.t(getDevicePeripheral(deviceId), null, new p058cb.L0(2, null), 3);
    }

    public final <RESPONSE> java.lang.Object read(p134fb.a aVar, Lm.c<? super zo.InterfaceC5441l> cVar) {
        p058cb.C2610e0 c2610e0 = new p058cb.C2610e0(aVar, new p058cb.M0(this, null, 0));
        java.lang.String deviceId = aVar.getDeviceId();
        return P2.q.u(new zo.u0(new p058cb.C2614g0(this, deviceId, null)), null, new p058cb.C2639t0(null, c2610e0, this, deviceId), 3);
    }

    public final <RESPONSE> java.lang.Object readCharacteristic(java.lang.String str, com.eightsleep.data_device.data.model.ble.ReadCharacteristic<RESPONSE> readCharacteristic, Lm.c<? super zo.InterfaceC5441l> cVar) {
        p134fb.a offlineReadCommand = readCharacteristic.toOfflineReadCommand(str);
        p058cb.C2608d0 c2608d0 = new p058cb.C2608d0(offlineReadCommand, new p058cb.N0(this, null, 0));
        java.lang.String deviceId = offlineReadCommand.getDeviceId();
        return P2.q.u(new zo.u0(new p058cb.C2612f0(this, deviceId, null)), null, new p058cb.C2628n0(this, c2608d0, deviceId, null), 3);
    }

    /* JADX WARN: Code duplicated, block: B:28:0x0088 A[RETURN] */
    /* JADX WARN: Code duplicated, block: B:7:0x0013  */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0067, code lost:
    
        if (r9 == r1) goto L27;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final java.lang.Object refreshOfflineData$data_device_tencentRelease(com.eightsleep.data_device.data.model.ble.HubPeripheral hubPeripheral, boolean z10, Lm.c<? super zo.InterfaceC5441l> cVar) {
        p058cb.O0 o4;
        zo.InterfaceC5441l eVar;
        Ao.n nVarU;
        if (cVar instanceof p058cb.O0) {
            o4 = (p058cb.O0) cVar;
            int i10 = o4.f35792e;
            if ((i10 & com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE) != 0) {
                o4.f35792e = i10 - com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE;
            } else {
                o4 = new p058cb.O0(this, cVar);
            }
        } else {
            o4 = new p058cb.O0(this, cVar);
        }
        java.lang.Object characteristic = o4.f35790c;
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i11 = o4.f35792e;
        if (i11 == 0) {
            X4.x.M(characteristic);
            if (hubPeripheral.getDeviceToken() == null || z10) {
                java.lang.String deviceId = hubPeripheral.getDeviceId();
                com.eightsleep.data_device.data.model.ble.ReadCharacteristic$DeviceToken readCharacteristic$DeviceToken = com.eightsleep.data_device.data.model.ble.ReadCharacteristic$DeviceToken.INSTANCE;
                o4.f35788a = this;
                o4.f35789b = hubPeripheral;
                o4.f35792e = 1;
                characteristic = readCharacteristic(deviceId, readCharacteristic$DeviceToken, o4);
            } else {
                eVar = new J8.e(new p592ya.g(hubPeripheral.getDeviceToken()), 9);
                p058cb.S0 s10 = new p058cb.S0(this, hubPeripheral, null);
                o4.f35788a = null;
                o4.f35789b = null;
                o4.f35792e = 2;
                nVarU = P2.q.u(eVar, null, s10, 3);
                if (nVarU != aVar) {
                    return nVarU;
                }
            }
            return aVar;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            X4.x.M(characteristic);
            return characteristic;
        }
        hubPeripheral = o4.f35789b;
        this = o4.f35788a;
        X4.x.M(characteristic);
        eVar = P2.q.D((zo.InterfaceC5441l) characteristic, new p058cb.P0(this, hubPeripheral, null));
        p058cb.S0 s11 = new p058cb.S0(this, hubPeripheral, null);
        o4.f35788a = null;
        o4.f35789b = null;
        o4.f35792e = 2;
        nVarU = P2.q.u(eVar, null, s11, 3);
        if (nVarU != aVar) {
            return aVar;
        }
        return nVarU;
    }

    public final zo.InterfaceC5441l scanForBase() {
        return P2.q.t(P2.q.C(new zo.u0(new p058cb.C2616h0(this, "OFFLINE_BASE_DEVICE_ID", null)), new p058cb.U0(this, null)), null, new p058cb.V0(this, null), 3);
    }

    public final java.lang.Object sendEmergencyFlatCommand(Lm.c<? super zo.InterfaceC5441l> cVar) {
        return P2.q.u(new zo.u0(new p058cb.C2616h0(this, "OFFLINE_BASE_DEVICE_ID", null)), null, new p058cb.W0(this, null), 3);
    }

    public final boolean shouldDisconnect$data_device_tencentRelease(java.lang.Throwable throwable) {
        kotlin.jvm.internal.l.j(throwable, "throwable");
        return (throwable instanceof com.eightsleep.data_device.exceptions.OfflineApiException$FailedToSendCommandException) || (throwable instanceof com.eightsleep.data_device.exceptions.OfflineApiException$FailedToReadCharacteristicException) || (throwable instanceof com.eightsleep.data_device.exceptions.OfflineApiException$FailedToWriteCharacteristicException) || (throwable instanceof com.eightsleep.data_device.exceptions.OfflineApiException$StaleGattProfileException);
    }

    public final <REQUEST> java.lang.Object write(p134fb.b bVar, Lm.c<? super zo.InterfaceC5441l> cVar) {
        p058cb.C2610e0 c2610e0 = new p058cb.C2610e0(bVar, new p058cb.M0(this, null, 1));
        java.lang.String deviceId = bVar.getDeviceId();
        return P2.q.u(new zo.u0(new p058cb.C2614g0(this, deviceId, null)), null, new p058cb.C2639t0(null, c2610e0, this, deviceId), 3);
    }

    public final <REQUEST> java.lang.Object writeCharacteristic(java.lang.String str, com.eightsleep.data_device.data.model.ble.WriteCharacteristic<REQUEST> writeCharacteristic, Lm.c<? super zo.InterfaceC5441l> cVar) {
        p134fb.b offlineWriteCommand = writeCharacteristic.toOfflineWriteCommand(str);
        p058cb.C2608d0 c2608d0 = new p058cb.C2608d0(offlineWriteCommand, new p058cb.N0(this, null, 1));
        java.lang.String deviceId = offlineWriteCommand.getDeviceId();
        return P2.q.u(new zo.u0(new p058cb.C2612f0(this, deviceId, null)), null, new p058cb.C2628n0(this, c2608d0, deviceId, null), 3);
    }

    @Override // Na.b
    public /* bridge */ /* synthetic */ zo.InterfaceC5441l call(java.lang.Object obj, boolean z10, Ka.c cVar, Vm.n nVar) {
        return call((p011ab.InterfaceC2341o) obj, z10, cVar, nVar);
    }

    @Override // Na.b
    public p011ab.InterfaceC2341o getApi() {
        return this.api;
    }

    public static final void access$log(com.eightsleep.data_device.data.repository.OfflineRepository offlineRepository, java.lang.Throwable th2, java.lang.String str) {
        offlineRepository.getClass();
        br.a aVar = timber.log.Timber.f67879a;
        aVar.p("OfflineRepository");
        aVar.c(str, th2, new java.lang.Object[0]);
    }
}
