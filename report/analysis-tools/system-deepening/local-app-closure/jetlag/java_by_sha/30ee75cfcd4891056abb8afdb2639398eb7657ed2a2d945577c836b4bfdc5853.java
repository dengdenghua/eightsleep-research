package com.eightsleep.presentation_jetlag.viewmodel;

/* JADX INFO: loaded from: classes2.dex */
@kotlin.Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0004\u001a\u00020\u00032\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00010\u0000H\n¢\u0006\u0004\b\u0004\u0010\u0005"}, d2 = {"Lya/j;", "Lgc/c;", "it", "LHm/B;", "<anonymous>", "(Lya/j;)V"}, k = 3, mv = {2, 0, 0})
@Nm.e(c = "com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1$2", f = "JetLagTripViewModel.kt", l = {1052, 1054}, m = "invokeSuspend")
public final class JetLagTripViewModel$createTripAndJetLagPlan$1$2 extends Nm.i implements Vm.n {
    /* synthetic */ java.lang.Object L$0;
    int label;
    final /* synthetic */ com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public JetLagTripViewModel$createTripAndJetLagPlan$1$2(com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel, Lm.c<? super com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1$2> cVar) {
        super(2, cVar);
        this.this$0 = jetLagTripViewModel;
    }

    private static final Hm.B invokeSuspend$lambda$0() {
        return Hm.B.f13117a;
    }

    @Override // Nm.a
    public final Lm.c<Hm.B> create(java.lang.Object obj, Lm.c<?> cVar) {
        com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1$2 jetLagTripViewModel$createTripAndJetLagPlan$1$2 = new com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1$2(this.this$0, cVar);
        jetLagTripViewModel$createTripAndJetLagPlan$1$2.L$0 = obj;
        return jetLagTripViewModel$createTripAndJetLagPlan$1$2;
    }

    @Override // Vm.n
    public /* bridge */ /* synthetic */ java.lang.Object invoke(java.lang.Object obj, java.lang.Object obj2) {
        return invoke((p592ya.j) obj, (Lm.c<? super Hm.B>) obj2);
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x0043, code lost:
    
        if (r7 == r0) goto L15;
     */
    @Override // Nm.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final java.lang.Object invokeSuspend(java.lang.Object obj) {
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i10 = this.label;
        if (i10 == 0) {
            X4.x.M(obj);
            p592ya.j jVar = (p592ya.j) this.L$0;
            com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1$2$1 jetLagTripViewModel$createTripAndJetLagPlan$1$2$1 = new com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1$2$1(this.this$0, null);
            this.label = 1;
            obj = jVar.d(this, jetLagTripViewModel$createTripAndJetLagPlan$1$2$1);
            if (obj != aVar) {
            }
            return aVar;
        }
        if (i10 == 1) {
            X4.x.M(obj);
        } else {
            if (i10 != 2) {
                throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            X4.x.M(obj);
        }
        p592ya.j jVar2 = (p592ya.j) obj;
        jVar2.getClass();
        if (jVar2 instanceof p592ya.f) {
            invokeSuspend$lambda$0();
        }
        return Hm.B.f13117a;
        com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1$2$2 jetLagTripViewModel$createTripAndJetLagPlan$1$2$2 = new com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1$2$2(this.this$0, null);
        this.label = 2;
        obj = ((p592ya.j) obj).c(this, jetLagTripViewModel$createTripAndJetLagPlan$1$2$2);
    }

    public final java.lang.Object invoke(p592ya.j jVar, Lm.c<? super Hm.B> cVar) {
        return ((com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$createTripAndJetLagPlan$1$2) create(jVar, cVar)).invokeSuspend(Hm.B.f13117a);
    }
}
