package p187hc;

/* JADX INFO: loaded from: classes2.dex */
public final class U extends Nm.i implements Vm.n {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public int f49482a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public /* synthetic */ java.lang.Object f49483b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public final /* synthetic */ p187hc.V f49484c;

    /* JADX INFO: renamed from: d, reason: collision with root package name */
    public final /* synthetic */ java.lang.String f49485d;

    /* JADX INFO: renamed from: e, reason: collision with root package name */
    public final /* synthetic */ java.util.List f49486e;

    /* JADX INFO: renamed from: f, reason: collision with root package name */
    public final /* synthetic */ boolean f49487f;

    /* JADX INFO: renamed from: g, reason: collision with root package name */
    public final /* synthetic */ java.lang.Integer f49488g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public U(p187hc.V v10, java.lang.String str, java.util.List list, boolean z10, java.lang.Integer num, Lm.c cVar) {
        super(2, cVar);
        this.f49484c = v10;
        this.f49485d = str;
        this.f49486e = list;
        this.f49487f = z10;
        this.f49488g = num;
    }

    @Override // Nm.a
    public final Lm.c create(java.lang.Object obj, Lm.c cVar) {
        p187hc.U u8 = new p187hc.U(this.f49484c, this.f49485d, this.f49486e, this.f49487f, this.f49488g, cVar);
        u8.f49483b = obj;
        return u8;
    }

    @Override // Vm.n
    public final java.lang.Object invoke(java.lang.Object obj, java.lang.Object obj2) {
        return ((p187hc.U) create((java.lang.String) obj, (Lm.c) obj2)).invokeSuspend(Hm.B.f13117a);
    }

    @Override // Nm.a
    public final java.lang.Object invokeSuspend(java.lang.Object obj) {
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i10 = this.f49482a;
        if (i10 != 0) {
            if (i10 != 1) {
                throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            X4.x.M(obj);
            return obj;
        }
        X4.x.M(obj);
        java.lang.String str = (java.lang.String) this.f49483b;
        com.eightsleep.data_jetlag.data.repository.JetLagPlanRepository jetLagPlanRepository = this.f49484c.f49490b;
        this.f49482a = 1;
        java.lang.Object objUpdateTasks = jetLagPlanRepository.updateTasks(str, this.f49485d, this.f49486e, this.f49487f, this.f49488g, this);
        return objUpdateTasks == aVar ? aVar : objUpdateTasks;
    }
}
