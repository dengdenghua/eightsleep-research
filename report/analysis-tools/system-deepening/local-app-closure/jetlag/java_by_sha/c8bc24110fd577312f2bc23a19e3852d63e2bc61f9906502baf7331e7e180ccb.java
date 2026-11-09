package com.eightsleep.presentation_jetlag.viewmodel;

/* JADX INFO: loaded from: classes2.dex */
@kotlin.Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lwo/z;", "LHm/B;", "<anonymous>", "(Lwo/z;)V"}, k = 3, mv = {2, 0, 0})
@Nm.e(c = "com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1", f = "JetLagTripViewModel.kt", l = {1044, 1046, 1051}, m = "invokeSuspend")
public final class JetLagTripViewModel$createTripAndJetLagPlan$1 extends Nm.i implements Vm.n {
    final /* synthetic */ java.util.List<p336ng.a> $destinations;
    final /* synthetic */ boolean $includeSupplements;
    final /* synthetic */ p336ng.k $origin;
    int label;
    final /* synthetic */ com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public JetLagTripViewModel$createTripAndJetLagPlan$1(com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel, p336ng.k kVar, java.util.List<p336ng.a> list, boolean z10, Lm.c<? super com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1> cVar) {
        super(2, cVar);
        this.this$0 = jetLagTripViewModel;
        this.$origin = kVar;
        this.$destinations = list;
        this.$includeSupplements = z10;
    }

    @Override // Nm.a
    public final Lm.c<Hm.B> create(java.lang.Object obj, Lm.c<?> cVar) {
        return new com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1(this.this$0, this.$origin, this.$destinations, this.$includeSupplements, cVar);
    }

    @Override // Vm.n
    public /* bridge */ /* synthetic */ java.lang.Object invoke(java.lang.Object obj, java.lang.Object obj2) {
        return invoke((p554wo.InterfaceC5106z) obj, (Lm.c<? super Hm.B>) obj2);
    }

    /* JADX WARN: Code restructure failed: missing block: B:33:0x00d6, code lost:
    
        if (zo.AbstractC5454s.m((zo.InterfaceC5441l) r2, r3, r18) == r1) goto L34;
     */
    @Override // Nm.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final java.lang.Object invokeSuspend(java.lang.Object obj) {
        java.lang.Object objA;
        int i10;
        java.lang.Object objU;
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i11 = this.label;
        if (i11 != 0) {
            if (i11 == 1) {
                X4.x.M(obj);
                objA = obj;
            } else if (i11 == 2) {
                X4.x.M(obj);
                objU = obj;
                i10 = 3;
                com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1$2 jetLagTripViewModel$createTripAndJetLagPlan$1$2 = new com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1$2(this.this$0, null);
                this.label = i10;
            } else {
                if (i11 != 3) {
                    throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                X4.x.M(obj);
            }
            return Hm.B.f13117a;
        }
        X4.x.M(obj);
        p187hc.InterfaceC3151f interfaceC3151fAccess$getCreateTripUseCase$p = com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel.access$getCreateTripUseCase$p(this.this$0);
        p336ng.k kVar = this.$origin;
        java.util.List<p336ng.a> destinations = this.$destinations;
        kVar.getClass();
        kotlin.jvm.internal.l.j(destinations, "destinations");
        java.util.ArrayList arrayList = new java.util.ArrayList();
        for (p336ng.a aVar2 : destinations) {
            java.lang.String str = kVar.f61182b;
            java.lang.String str2 = kVar.f61181a;
            java.time.ZoneOffset zoneOffset = kVar.f61183c;
            p161gc.q qVar = new p161gc.q(str2, str, zoneOffset);
            p336ng.k kVar2 = aVar2.f61119a;
            p161gc.q qVar2 = new p161gc.q(kVar2.f61181a, kVar2.f61182b, kVar2.f61183c);
            boolean zB = aVar2.b();
            p336ng.o oVar = aVar2.f61120b;
            Ga.s sVarN = zB ? oVar.f61192b.n(zoneOffset) : oVar.f61192b;
            boolean zB2 = aVar2.b();
            kVar = aVar2.f61119a;
            arrayList.add(new p161gc.p("", qVar, qVar2, sVarN, zB2 ? oVar.f61193c.n(kVar.f61183c) : oVar.f61193c, null));
        }
        this.label = 1;
        objA = ((p187hc.C3155j) interfaceC3151fAccess$getCreateTripUseCase$p).a(arrayList, this);
        if (objA != aVar) {
        }
        return aVar;
        com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1$1 jetLagTripViewModel$createTripAndJetLagPlan$1$1 = new com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1$1(this.this$0, this.$includeSupplements, null);
        this.label = 2;
        i10 = 3;
        objU = P2.q.u((zo.InterfaceC5441l) objA, null, jetLagTripViewModel$createTripAndJetLagPlan$1$1, 3);
        if (objU != aVar) {
            com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1$2 jetLagTripViewModel$createTripAndJetLagPlan$1$3 = new com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1$2(this.this$0, null);
            this.label = i10;
        }
        return aVar;
    }

    public final java.lang.Object invoke(p554wo.InterfaceC5106z interfaceC5106z, Lm.c<? super Hm.B> cVar) {
        return ((com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1) create(interfaceC5106z, cVar)).invokeSuspend(Hm.B.f13117a);
    }
}
