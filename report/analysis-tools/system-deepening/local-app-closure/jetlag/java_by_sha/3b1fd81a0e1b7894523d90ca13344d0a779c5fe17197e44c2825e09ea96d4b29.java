package p187hc;

/* JADX INFO: loaded from: classes2.dex */
public final class V implements p187hc.S {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public final u5.e f49489a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public final com.eightsleep.data_jetlag.data.repository.JetLagPlanRepository f49490b;

    public V(u5.e eVar, com.eightsleep.data_jetlag.data.repository.JetLagPlanRepository jetLagPlanRepository) {
        this.f49489a = eVar;
        this.f49490b = jetLagPlanRepository;
    }

    /* JADX WARN: Code duplicated, block: B:7:0x0015  */
    public final java.lang.Object a(java.lang.String str, java.util.ArrayList arrayList, boolean z10, java.lang.Integer num, Nm.c cVar) {
        p187hc.T t7;
        p187hc.V v10;
        java.lang.String str2;
        java.util.List list;
        java.lang.Integer num2;
        boolean z11;
        if (cVar instanceof p187hc.T) {
            t7 = (p187hc.T) cVar;
            int i10 = t7.f49481h;
            if ((i10 & com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE) != 0) {
                t7.f49481h = i10 - com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE;
            } else {
                t7 = new p187hc.T(this, cVar);
            }
        } else {
            t7 = new p187hc.T(this, cVar);
        }
        java.lang.Object obj = t7.f49479f;
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i11 = t7.f49481h;
        if (i11 == 0) {
            X4.x.M(obj);
            t7.f49474a = this;
            t7.f49475b = str;
            t7.f49476c = arrayList;
            t7.f49477d = num;
            t7.f49478e = z10;
            t7.f49481h = 1;
            java.lang.Object objC = this.f49489a.C(t7);
            if (objC != aVar) {
                v10 = this;
                str2 = str;
                list = arrayList;
                num2 = num;
                obj = objC;
                z11 = z10;
            }
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            X4.x.M(obj);
            return obj;
        }
        boolean z12 = t7.f49478e;
        java.lang.Integer num3 = t7.f49477d;
        java.util.List list2 = t7.f49476c;
        java.lang.String str3 = t7.f49475b;
        p187hc.V v11 = t7.f49474a;
        X4.x.M(obj);
        z11 = z12;
        num2 = num3;
        list = list2;
        str2 = str3;
        v10 = v11;
        p187hc.U u8 = new p187hc.U(v10, str2, list, z11, num2, null);
        t7.f49474a = null;
        t7.f49475b = null;
        t7.f49476c = null;
        t7.f49477d = null;
        t7.f49481h = 2;
        Ao.n nVarU = P2.q.u((zo.InterfaceC5441l) obj, null, u8, 3);
        return nVarU == aVar ? aVar : nVarU;
    }
}
