package com.eightsleep.presentation_jetlag.viewmodel;

/* JADX INFO: loaded from: classes2.dex */
@kotlin.Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0005\u001a\u00020\u00042\u0012\u0010\u0003\u001a\u000e\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\u00020\u0000H\n¢\u0006\u0004\b\u0005\u0010\u0006"}, d2 = {"LHm/k;", "Lgc/o;", "Lgc/c;", "<destruct>", "LHm/B;", "<anonymous>", "(LHm/k;)V"}, k = 3, mv = {2, 0, 0})
@Nm.e(c = "com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$getPlanAndTasks$1$2$1", f = "JetLagPlanViewModel.kt", l = {}, m = "invokeSuspend")
public final class JetLagPlanViewModel$getPlanAndTasks$1$2$1 extends Nm.i implements Vm.n {
    /* synthetic */ java.lang.Object L$0;
    int label;
    final /* synthetic */ com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public JetLagPlanViewModel$getPlanAndTasks$1$2$1(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel, Lm.c<? super com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$getPlanAndTasks$1$2$1> cVar) {
        super(2, cVar);
        this.this$0 = jetLagPlanViewModel;
    }

    public static /* synthetic */ p336ng.e g(p161gc.c cVar, p161gc.o oVar, p336ng.g gVar, com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel, java.util.List list, p336ng.e eVar) {
        return invokeSuspend$lambda$3(cVar, oVar, gVar, jetLagPlanViewModel, list, eVar);
    }

    private static final p336ng.e invokeSuspend$lambda$3(p161gc.c cVar, p161gc.o oVar, p336ng.g gVar, com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel, java.util.List list, p336ng.e eVar) {
        com.eightsleep.data_jetlag.enums.JetLagPlanTaskPhase jetLagPlanTaskPhase;
        java.lang.String str = cVar.f48475a;
        java.lang.String str2 = oVar.f48560b;
        java.util.ArrayList arrayList = oVar.f48562d;
        p161gc.p pVar = (p161gc.p) Im.r.Z0(arrayList);
        p161gc.q qVar = pVar.f48569b;
        p336ng.a aVar = new p336ng.a(new p336ng.k(qVar.f48574a, qVar.f48575b, qVar.f48576c, com.eightsleep.presentation_jetlag.enums.TripLocationType.ORIGIN), p336ng.o.a(new p336ng.o(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel.access$getDisplaySettings$p(jetLagPlanViewModel)), null, pVar.f48571d.n(pVar.f48569b.f48576c), null, 5), null, 28);
        p161gc.p pVar2 = (p161gc.p) Im.r.k1(arrayList);
        p161gc.q qVar2 = pVar2.f48570c;
        p336ng.a aVar2 = new p336ng.a(new p336ng.k(qVar2.f48574a, qVar2.f48575b, qVar2.f48576c, com.eightsleep.presentation_jetlag.enums.TripLocationType.DESTINATION), p336ng.o.a(new p336ng.o(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel.access$getDisplaySettings$p(jetLagPlanViewModel)), null, null, pVar2.f48572e.n(pVar2.f48570c.f48576c), 3), null, 28);
        if (gVar == null || (jetLagPlanTaskPhase = gVar.f61154d) == null) {
            jetLagPlanTaskPhase = com.eightsleep.data_jetlag.enums.JetLagPlanTaskPhase.PRE_FLIGHT;
        }
        int iBetween = (int) java.time.temporal.ChronoUnit.DAYS.between(java.time.LocalDate.now(), cVar.f48482h);
        java.lang.String strAccess$formatTimeUntilDeparture = com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel.access$formatTimeUntilDeparture(jetLagPlanViewModel, Ya.C2102d.f(((p161gc.p) Im.r.Z0(arrayList)).f48571d.f12088a));
        p161gc.n nVar = oVar.f48565g;
        return p336ng.e.u(eVar, str, str2, null, aVar, aVar2, oVar.f48567i, gVar, jetLagPlanTaskPhase, list, iBetween, strAccess$formatTimeUntilDeparture, null, com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel.access$formatTimezoneOffset(jetLagPlanViewModel, nVar != null ? java.lang.Integer.valueOf(nVar.f48557a) : null), 2052);
    }

    @Override // Nm.a
    public final Lm.c<Hm.B> create(java.lang.Object obj, Lm.c<?> cVar) {
        com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$getPlanAndTasks$1$2$1 jetLagPlanViewModel$getPlanAndTasks$1$2$1 = new com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$getPlanAndTasks$1$2$1(this.this$0, cVar);
        jetLagPlanViewModel$getPlanAndTasks$1$2$1.L$0 = obj;
        return jetLagPlanViewModel$getPlanAndTasks$1$2$1;
    }

    public final java.lang.Object invoke(Hm.k kVar, Lm.c<? super Hm.B> cVar) {
        return ((com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$getPlanAndTasks$1$2$1) create(kVar, cVar)).invokeSuspend(Hm.B.f13117a);
    }

    @Override // Nm.a
    public final java.lang.Object invokeSuspend(java.lang.Object obj) {
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        if (this.label != 0) {
            throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        X4.x.M(obj);
        Hm.k kVar = (Hm.k) this.L$0;
        p161gc.o oVar = (p161gc.o) kVar.f13128a;
        p161gc.c cVar = (p161gc.c) kVar.f13129b;
        java.util.List listAccess$mapPlanToUiModel = com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel.access$mapPlanToUiModel(this.this$0, oVar, cVar);
        for (java.lang.Object obj2 : listAccess$mapPlanToUiModel) {
            if (((p336ng.g) obj2).f61152b) {
                com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel = this.this$0;
                android.support.v4.media.session.b.I(jetLagPlanViewModel, new com.eightsleep.presentation_jetlag.viewmodel.e(cVar, oVar, (p336ng.g) obj2, jetLagPlanViewModel, listAccess$mapPlanToUiModel), 1);
                return Hm.B.f13117a;
            }
        }
        obj2 = null;
        com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel2 = this.this$0;
        android.support.v4.media.session.b.I(jetLagPlanViewModel2, new com.eightsleep.presentation_jetlag.viewmodel.e(cVar, oVar, (p336ng.g) obj2, jetLagPlanViewModel2, listAccess$mapPlanToUiModel), 1);
        return Hm.B.f13117a;
    }

    @Override // Vm.n
    public /* bridge */ /* synthetic */ java.lang.Object invoke(java.lang.Object obj, java.lang.Object obj2) {
        return invoke((Hm.k) obj, (Lm.c<? super Hm.B>) obj2);
    }
}
