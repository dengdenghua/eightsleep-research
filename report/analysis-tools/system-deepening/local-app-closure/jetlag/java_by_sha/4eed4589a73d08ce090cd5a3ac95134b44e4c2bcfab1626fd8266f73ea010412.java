package com.eightsleep.presentation_jetlag.viewmodel;

/* JADX INFO: loaded from: classes2.dex */
@kotlin.Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lwo/z;", "LHm/B;", "<anonymous>", "(Lwo/z;)V"}, k = 3, mv = {2, 0, 0})
@Nm.e(c = "com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$pollTimeAtDestination$1", f = "JetLagPlanViewModel.kt", l = {524}, m = "invokeSuspend")
public final class JetLagPlanViewModel$pollTimeAtDestination$1 extends Nm.i implements Vm.n {
    final /* synthetic */ p161gc.o $trip;
    private /* synthetic */ java.lang.Object L$0;
    int label;
    final /* synthetic */ com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public JetLagPlanViewModel$pollTimeAtDestination$1(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel, p161gc.o oVar, Lm.c<? super com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$pollTimeAtDestination$1> cVar) {
        super(2, cVar);
        this.this$0 = jetLagPlanViewModel;
        this.$trip = oVar;
    }

    public static /* synthetic */ p336ng.e g(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel, p161gc.o oVar, p336ng.e eVar) {
        return invokeSuspend$lambda$0(jetLagPlanViewModel, oVar, eVar);
    }

    private static final p336ng.e invokeSuspend$lambda$0(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel, p161gc.o oVar, p336ng.e eVar) {
        return p336ng.e.u(eVar, null, null, null, null, null, null, null, null, null, 0, null, com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel.access$calculateTimeAtDestination(jetLagPlanViewModel, ((p161gc.p) Im.r.k1(oVar.f48562d)).f48570c), null, 6143);
    }

    @Override // Nm.a
    public final Lm.c<Hm.B> create(java.lang.Object obj, Lm.c<?> cVar) {
        com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$pollTimeAtDestination$1 jetLagPlanViewModel$pollTimeAtDestination$1 = new com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$pollTimeAtDestination$1(this.this$0, this.$trip, cVar);
        jetLagPlanViewModel$pollTimeAtDestination$1.L$0 = obj;
        return jetLagPlanViewModel$pollTimeAtDestination$1;
    }

    @Override // Vm.n
    public /* bridge */ /* synthetic */ java.lang.Object invoke(java.lang.Object obj, java.lang.Object obj2) {
        return invoke((p554wo.InterfaceC5106z) obj, (Lm.c<? super Hm.B>) obj2);
    }

    @Override // Nm.a
    public final java.lang.Object invokeSuspend(java.lang.Object obj) {
        p554wo.InterfaceC5106z interfaceC5106z;
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i10 = this.label;
        if (i10 == 0) {
            X4.x.M(obj);
            interfaceC5106z = (p554wo.InterfaceC5106z) this.L$0;
        } else {
            if (i10 != 1) {
                throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            interfaceC5106z = (p554wo.InterfaceC5106z) this.L$0;
            X4.x.M(obj);
        }
        while (p554wo.C.A(interfaceC5106z)) {
            com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel = this.this$0;
            android.support.v4.media.session.b.I(jetLagPlanViewModel, new com.eightsleep.presentation_jetlag.viewmodel.f(0, jetLagPlanViewModel, this.$trip), 1);
            this.L$0 = interfaceC5106z;
            this.label = 1;
            if (p554wo.C.n(15000L, this) == aVar) {
                return aVar;
            }
        }
        return Hm.B.f13117a;
    }

    public final java.lang.Object invoke(p554wo.InterfaceC5106z interfaceC5106z, Lm.c<? super Hm.B> cVar) {
        return ((com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$pollTimeAtDestination$1) create(interfaceC5106z, cVar)).invokeSuspend(Hm.B.f13117a);
    }
}
