package com.eightsleep.presentation_jetlag.viewmodel;

/* JADX INFO: loaded from: classes2.dex */
@kotlin.Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0005\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00040\u00030\u00022\u0006\u0010\u0001\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0005\u0010\u0006"}, d2 = {"Lgc/o;", "it", "Lzo/l;", "Lya/j;", "Lgc/c;", "<anonymous>", "(Lgc/o;)Lzo/l;"}, k = 3, mv = {2, 0, 0})
@Nm.e(c = "com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1$1", f = "JetLagTripViewModel.kt", l = {1047}, m = "invokeSuspend")
public final class JetLagTripViewModel$createTripAndJetLagPlan$1$1 extends Nm.i implements Vm.n {
    final /* synthetic */ boolean $includeSupplements;
    /* synthetic */ java.lang.Object L$0;
    int label;
    final /* synthetic */ com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public JetLagTripViewModel$createTripAndJetLagPlan$1$1(com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel, boolean z10, Lm.c<? super com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1$1> cVar) {
        super(2, cVar);
        this.this$0 = jetLagTripViewModel;
        this.$includeSupplements = z10;
    }

    @Override // Nm.a
    public final Lm.c<Hm.B> create(java.lang.Object obj, Lm.c<?> cVar) {
        com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1$1 jetLagTripViewModel$createTripAndJetLagPlan$1$1 = new com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1$1(this.this$0, this.$includeSupplements, cVar);
        jetLagTripViewModel$createTripAndJetLagPlan$1$1.L$0 = obj;
        return jetLagTripViewModel$createTripAndJetLagPlan$1$1;
    }

    public final java.lang.Object invoke(p161gc.o oVar, Lm.c<? super zo.InterfaceC5441l> cVar) {
        return ((com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1$1) create(oVar, cVar)).invokeSuspend(Hm.B.f13117a);
    }

    @Override // Nm.a
    public final java.lang.Object invokeSuspend(java.lang.Object obj) {
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i10 = this.label;
        if (i10 != 0) {
            if (i10 != 1) {
                throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            X4.x.M(obj);
            return obj;
        }
        X4.x.M(obj);
        p161gc.o oVar = (p161gc.o) this.L$0;
        p187hc.InterfaceC3146a interfaceC3146aAccess$getCreateJetLagPlanUseCase$p = com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel.access$getCreateJetLagPlanUseCase$p(this.this$0);
        java.lang.String str = oVar.f48560b;
        boolean z10 = this.$includeSupplements;
        this.label = 1;
        java.lang.Object objA = ((p187hc.C3150e) interfaceC3146aAccess$getCreateJetLagPlanUseCase$p).a(this, str, z10);
        return objA == aVar ? aVar : objA;
    }

    @Override // Vm.n
    public /* bridge */ /* synthetic */ java.lang.Object invoke(java.lang.Object obj, java.lang.Object obj2) {
        return invoke((p161gc.o) obj, (Lm.c<? super zo.InterfaceC5441l>) obj2);
    }
}
