package com.eightsleep.presentation_jetlag.viewmodel;

/* JADX INFO: loaded from: classes2.dex */
@kotlin.Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lwo/z;", "LHm/B;", "<anonymous>", "(Lwo/z;)V"}, k = 3, mv = {2, 0, 0})
@Nm.e(c = "com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$getPlanAndTasks$1", f = "JetLagPlanViewModel.kt", l = {294, 298, coil3.network.internal.UtilsKt.HTTP_RESPONSE_NOT_MODIFIED}, m = "invokeSuspend")
public final class JetLagPlanViewModel$getPlanAndTasks$1 extends Nm.i implements Vm.n {
    java.lang.Object L$0;
    java.lang.Object L$1;
    int label;
    final /* synthetic */ com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public JetLagPlanViewModel$getPlanAndTasks$1(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel, Lm.c<? super com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$getPlanAndTasks$1> cVar) {
        super(2, cVar);
        this.this$0 = jetLagPlanViewModel;
    }

    public static /* synthetic */ p592ya.j g(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel, p161gc.o oVar, p161gc.c cVar) {
        return invokeSuspend$lambda$0(jetLagPlanViewModel, oVar, cVar);
    }

    private static final p592ya.j invokeSuspend$lambda$0(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel, p161gc.o oVar, p161gc.c cVar) {
        com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel.access$pollTimeAtDestination(jetLagPlanViewModel, oVar);
        return new p592ya.g(new Hm.k(oVar, cVar));
    }

    @Override // Nm.a
    public final Lm.c<Hm.B> create(java.lang.Object obj, Lm.c<?> cVar) {
        return new com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$getPlanAndTasks$1(this.this$0, cVar);
    }

    @Override // Vm.n
    public /* bridge */ /* synthetic */ java.lang.Object invoke(java.lang.Object obj, java.lang.Object obj2) {
        return invoke((p554wo.InterfaceC5106z) obj, (Lm.c<? super Hm.B>) obj2);
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0095, code lost:
    
        if (zo.AbstractC5454s.m(r11, r1, r10) == r0) goto L22;
     */
    @Override // Nm.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final java.lang.Object invokeSuspend(java.lang.Object obj) {
        p592ya.d dVar;
        zo.InterfaceC5441l interfaceC5441l;
        p592ya.d dVar2;
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i10 = this.label;
        if (i10 == 0) {
            X4.x.M(obj);
            p592ya.d dVar3 = p592ya.j.f73353a;
            p187hc.A aAccess$getGetTripByIdUseCase$p = com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel.access$getGetTripByIdUseCase$p(this.this$0);
            java.lang.String strAccess$getTripId$p = com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel.access$getTripId$p(this.this$0);
            this.L$0 = dVar3;
            this.label = 1;
            java.lang.Object objA = ((p187hc.E) aAccess$getGetTripByIdUseCase$p).a(strAccess$getTripId$p, this);
            if (objA != aVar) {
                dVar = dVar3;
                obj = objA;
            }
            return aVar;
        }
        if (i10 == 1) {
            dVar = (p592ya.d) this.L$0;
            X4.x.M(obj);
        } else if (i10 == 2) {
            zo.InterfaceC5441l interfaceC5441l2 = (zo.InterfaceC5441l) this.L$1;
            dVar2 = (p592ya.d) this.L$0;
            X4.x.M(obj);
            interfaceC5441l = interfaceC5441l2;
            Gc.h hVarB = p592ya.d.b(dVar2, interfaceC5441l, (zo.InterfaceC5441l) obj, null, new com.eightsleep.presentation_jetlag.viewmodel.d(this.this$0), 12);
            com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$getPlanAndTasks$1$2 jetLagPlanViewModel$getPlanAndTasks$1$2 = new com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$getPlanAndTasks$1$2(this.this$0, null);
            this.L$0 = null;
            this.L$1 = null;
            this.label = 3;
        } else {
            if (i10 != 3) {
                throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            X4.x.M(obj);
        }
        return Hm.B.f13117a;
        zo.InterfaceC5441l interfaceC5441l3 = (zo.InterfaceC5441l) obj;
        p187hc.K kAccess$getObserveJetLagPlanUseCase$p = com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel.access$getObserveJetLagPlanUseCase$p(this.this$0);
        java.lang.String strAccess$getTripId$p2 = com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel.access$getTripId$p(this.this$0);
        this.L$0 = dVar;
        this.L$1 = interfaceC5441l3;
        this.label = 2;
        java.lang.Object objA2 = ((p187hc.O) kAccess$getObserveJetLagPlanUseCase$p).a(strAccess$getTripId$p2, this);
        if (objA2 != aVar) {
            interfaceC5441l = interfaceC5441l3;
            obj = objA2;
            dVar2 = dVar;
            Gc.h hVarB2 = p592ya.d.b(dVar2, interfaceC5441l, (zo.InterfaceC5441l) obj, null, new com.eightsleep.presentation_jetlag.viewmodel.d(this.this$0), 12);
            com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$getPlanAndTasks$1$2 jetLagPlanViewModel$getPlanAndTasks$1$3 = new com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$getPlanAndTasks$1$2(this.this$0, null);
            this.L$0 = null;
            this.L$1 = null;
            this.label = 3;
        }
        return aVar;
    }

    public final java.lang.Object invoke(p554wo.InterfaceC5106z interfaceC5106z, Lm.c<? super Hm.B> cVar) {
        return ((com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$getPlanAndTasks$1) create(interfaceC5106z, cVar)).invokeSuspend(Hm.B.f13117a);
    }
}
