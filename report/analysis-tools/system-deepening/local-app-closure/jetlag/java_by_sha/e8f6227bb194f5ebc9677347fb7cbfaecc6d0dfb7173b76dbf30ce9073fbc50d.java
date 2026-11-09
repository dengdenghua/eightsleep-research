package p111ec;

/* JADX INFO: loaded from: classes2.dex */
public final class a extends Nm.i implements Vm.n {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public int f46547a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public /* synthetic */ java.lang.Object f46548b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public final /* synthetic */ java.lang.String f46549c;

    /* JADX INFO: renamed from: d, reason: collision with root package name */
    public final /* synthetic */ java.lang.String f46550d;

    /* JADX INFO: renamed from: e, reason: collision with root package name */
    public final /* synthetic */ boolean f46551e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(java.lang.String str, java.lang.String str2, boolean z10, Lm.c cVar) {
        super(2, cVar);
        this.f46549c = str;
        this.f46550d = str2;
        this.f46551e = z10;
    }

    @Override // Nm.a
    public final Lm.c create(java.lang.Object obj, Lm.c cVar) {
        p111ec.a aVar = new p111ec.a(this.f46549c, this.f46550d, this.f46551e, cVar);
        aVar.f46548b = obj;
        return aVar;
    }

    @Override // Vm.n
    public final java.lang.Object invoke(java.lang.Object obj, java.lang.Object obj2) {
        return ((p111ec.a) create((dc.a) obj, (Lm.c) obj2)).invokeSuspend(Hm.B.f13117a);
    }

    @Override // Nm.a
    public final java.lang.Object invokeSuspend(java.lang.Object obj) {
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i10 = this.f46547a;
        if (i10 != 0) {
            if (i10 != 1) {
                throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            X4.x.M(obj);
            return obj;
        }
        X4.x.M(obj);
        dc.a aVar2 = (dc.a) this.f46548b;
        com.eightsleep.data_jetlag.data.model.CreateJetLagPlanRequest createJetLagPlanRequest = new com.eightsleep.data_jetlag.data.model.CreateJetLagPlanRequest(this.f46551e, true);
        this.f46547a = 1;
        java.lang.Object objA = aVar2.a(this.f46549c, this.f46550d, createJetLagPlanRequest, this);
        return objA == aVar ? aVar : objA;
    }
}
