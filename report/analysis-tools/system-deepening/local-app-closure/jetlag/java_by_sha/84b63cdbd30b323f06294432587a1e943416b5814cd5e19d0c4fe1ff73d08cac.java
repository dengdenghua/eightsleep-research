package com.eightsleep.presentation_jetlag.viewmodel;

/* JADX INFO: loaded from: classes2.dex */
@kotlin.Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lwo/z;", "LHm/B;", "<anonymous>", "(Lwo/z;)V"}, k = 3, mv = {2, 0, 0})
@Nm.e(c = "com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$onTaskCompletionToggled$1", f = "JetLagPlanViewModel.kt", l = {261, 271}, m = "invokeSuspend")
public final class JetLagPlanViewModel$onTaskCompletionToggled$1 extends Nm.i implements Vm.n {
    final /* synthetic */ boolean $isComplete;
    final /* synthetic */ java.lang.String $planId;
    final /* synthetic */ java.lang.Integer $supplementCount;
    final /* synthetic */ java.util.List<p336ng.h> $tasks;
    int label;
    final /* synthetic */ com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public JetLagPlanViewModel$onTaskCompletionToggled$1(com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel jetLagPlanViewModel, java.lang.String str, java.util.List<p336ng.h> list, boolean z10, java.lang.Integer num, Lm.c<? super com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$onTaskCompletionToggled$1> cVar) {
        super(2, cVar);
        this.this$0 = jetLagPlanViewModel;
        this.$planId = str;
        this.$tasks = list;
        this.$isComplete = z10;
        this.$supplementCount = num;
    }

    @Override // Nm.a
    public final Lm.c<Hm.B> create(java.lang.Object obj, Lm.c<?> cVar) {
        return new com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$onTaskCompletionToggled$1(this.this$0, this.$planId, this.$tasks, this.$isComplete, this.$supplementCount, cVar);
    }

    @Override // Vm.n
    public /* bridge */ /* synthetic */ java.lang.Object invoke(java.lang.Object obj, java.lang.Object obj2) {
        return invoke((p554wo.InterfaceC5106z) obj, (Lm.c<? super Hm.B>) obj2);
    }

    /* JADX WARN: Code restructure failed: missing block: B:30:0x00be, code lost:
    
        if (zo.AbstractC5454s.m((zo.InterfaceC5441l) r0, r1, r16) == r6) goto L31;
     */
    @Override // Nm.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final java.lang.Object invokeSuspend(java.lang.Object obj) {
        java.lang.Object objA;
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i10 = this.label;
        if (i10 != 0) {
            if (i10 == 1) {
                X4.x.M(obj);
                objA = obj;
            } else {
                if (i10 != 2) {
                    throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                X4.x.M(obj);
            }
            return Hm.B.f13117a;
        }
        X4.x.M(obj);
        p187hc.S sAccess$getToggleJetLagTaskCompletionUseCase$p = com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel.access$getToggleJetLagTaskCompletionUseCase$p(this.this$0);
        java.lang.String str = this.$planId;
        java.util.List<p336ng.h> list = this.$tasks;
        boolean z10 = this.$isComplete;
        java.lang.Integer num = this.$supplementCount;
        java.util.ArrayList arrayList = new java.util.ArrayList(Im.t.z0(list, 10));
        for (p336ng.h hVar : list) {
            hVar.getClass();
            br.a aVar2 = timber.log.Timber.f67879a;
            p336ng.m mVar = hVar.f61168j;
            java.lang.Integer numValueOf = mVar != null ? java.lang.Integer.valueOf(mVar.f61188a) : null;
            java.lang.StringBuilder sb2 = new java.lang.StringBuilder("Mapping supplements in JetLagTaskUiModel toUpdate: type: ");
            com.eightsleep.data_jetlag.enums.JetLagTaskType jetLagTaskType = hVar.f61164f;
            sb2.append(jetLagTaskType);
            sb2.append(" num taken ");
            sb2.append(numValueOf);
            aVar2.b(sb2.toString(), new java.lang.Object[0]);
            arrayList.add(new p161gc.f(hVar.f61159a, jetLagTaskType, z10 ? com.eightsleep.data_jetlag.enums.JetLagPlanTaskStatus.COMPLETE : com.eightsleep.data_jetlag.enums.JetLagPlanTaskStatus.PENDING, new p161gc.d(jetLagTaskType == com.eightsleep.data_jetlag.enums.JetLagTaskType.SUPPLEMENT ? num : null, null)));
        }
        boolean z11 = this.$isComplete;
        java.lang.Integer num2 = this.$supplementCount;
        this.label = 1;
        objA = ((p187hc.V) sAccess$getToggleJetLagTaskCompletionUseCase$p).a(str, arrayList, z11, num2, this);
        if (objA != aVar) {
        }
        return aVar;
        com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$onTaskCompletionToggled$1$2 jetLagPlanViewModel$onTaskCompletionToggled$1$2 = new com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$onTaskCompletionToggled$1$2(this.this$0, null);
        this.label = 2;
    }

    public final java.lang.Object invoke(p554wo.InterfaceC5106z interfaceC5106z, Lm.c<? super Hm.B> cVar) {
        return ((com.eightsleep.presentation_jetlag.viewmodel.JetLagPlanViewModel$onTaskCompletionToggled$1) create(interfaceC5106z, cVar)).invokeSuspend(Hm.B.f13117a);
    }
}
