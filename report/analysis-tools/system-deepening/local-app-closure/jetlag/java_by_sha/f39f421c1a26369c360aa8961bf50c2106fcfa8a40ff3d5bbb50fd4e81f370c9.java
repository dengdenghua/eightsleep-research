package com.eightsleep.presentation_jetlag.viewmodel;

/* JADX INFO: loaded from: classes2.dex */
@kotlin.Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lwo/z;", "LHm/B;", "<anonymous>", "(Lwo/z;)V"}, k = 3, mv = {2, 0, 0})
@Nm.e(c = "com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$onNotificationsEnabled$1", f = "JetLagTripViewModel.kt", l = {454, 462}, m = "invokeSuspend")
public final class JetLagTripViewModel$onNotificationsEnabled$1 extends Nm.i implements Vm.n {
    int label;
    final /* synthetic */ com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public JetLagTripViewModel$onNotificationsEnabled$1(com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel jetLagTripViewModel, Lm.c<? super com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$onNotificationsEnabled$1> cVar) {
        super(2, cVar);
        this.this$0 = jetLagTripViewModel;
    }

    @Override // Nm.a
    public final Lm.c<Hm.B> create(java.lang.Object obj, Lm.c<?> cVar) {
        return new com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$onNotificationsEnabled$1(this.this$0, cVar);
    }

    @Override // Vm.n
    public /* bridge */ /* synthetic */ java.lang.Object invoke(java.lang.Object obj, java.lang.Object obj2) {
        return invoke((p554wo.InterfaceC5106z) obj, (Lm.c<? super Hm.B>) obj2);
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x0053, code lost:
    
        if (zo.AbstractC5454s.m((zo.InterfaceC5441l) r15, r1, r14) == r0) goto L15;
     */
    @Override // Nm.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final java.lang.Object invokeSuspend(java.lang.Object obj) {
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i10 = this.label;
        if (i10 != 0) {
            if (i10 == 1) {
                X4.x.M(obj);
            } else {
                if (i10 != 2) {
                    throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                X4.x.M(obj);
            }
            return Hm.B.f13117a;
        }
        X4.x.M(obj);
        p569xd.h0 h0VarAccess$getUpdateAppUserUseCase$p = com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel.access$getUpdateAppUserUseCase$p(this.this$0);
        p595yd.U u8 = new p595yd.U((java.lang.String) null, (java.lang.String) null, (java.time.LocalDate) null, (com.eightsleep.data_core.enums.Gender) null, new p595yd.C5239e(true, true, true), (Ga.f) null, (com.eightsleep.data_core.enums.TemperatureSetting) null, (com.eightsleep.data_core.enums.TemperatureSetting) null, 479);
        this.label = 1;
        obj = ((p569xd.k0) h0VarAccess$getUpdateAppUserUseCase$p).a(u8, this);
        if (obj != aVar) {
        }
        return aVar;
        com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$onNotificationsEnabled$1$1 jetLagTripViewModel$onNotificationsEnabled$1$1 = new com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$onNotificationsEnabled$1$1(this.this$0, null);
        this.label = 2;
    }

    public final java.lang.Object invoke(p554wo.InterfaceC5106z interfaceC5106z, Lm.c<? super Hm.B> cVar) {
        return ((com.eightsleep.presentation_jetlag.viewmodel.JetLagTripViewModel$onNotificationsEnabled$1) create(interfaceC5106z, cVar)).invokeSuspend(Hm.B.f13117a);
    }
}
