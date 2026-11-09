package p111ec;

/* JADX INFO: loaded from: classes2.dex */
public final class b extends Nm.i implements Vm.n {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public int f46552a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public /* synthetic */ java.lang.Object f46553b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public final /* synthetic */ java.lang.String f46554c;

    /* JADX INFO: renamed from: d, reason: collision with root package name */
    public final /* synthetic */ java.lang.String f46555d;

    /* JADX INFO: renamed from: e, reason: collision with root package name */
    public final /* synthetic */ com.eightsleep.data_jetlag.data.repository.JetLagPlanRepository f46556e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(Lm.c cVar, com.eightsleep.data_jetlag.data.repository.JetLagPlanRepository jetLagPlanRepository, java.lang.String str, java.lang.String str2) {
        super(2, cVar);
        this.f46554c = str;
        this.f46555d = str2;
        this.f46556e = jetLagPlanRepository;
    }

    @Override // Nm.a
    public final Lm.c create(java.lang.Object obj, Lm.c cVar) {
        p111ec.b bVar = new p111ec.b(cVar, this.f46556e, this.f46554c, this.f46555d);
        bVar.f46553b = obj;
        return bVar;
    }

    @Override // Vm.n
    public final java.lang.Object invoke(java.lang.Object obj, java.lang.Object obj2) {
        return ((p111ec.b) create((com.eightsleep.data_jetlag.data.model.JetLagPlanResponse) obj, (Lm.c) obj2)).invokeSuspend(Hm.B.f13117a);
    }

    @Override // Nm.a
    public final java.lang.Object invokeSuspend(java.lang.Object obj) {
        p283lc.d dVar;
        java.lang.Object obj2 = Mm.a.COROUTINE_SUSPENDED;
        int i10 = this.f46552a;
        if (i10 == 0) {
            X4.x.M(obj);
            com.eightsleep.data_jetlag.data.model.JetLagPlanResponse response = (com.eightsleep.data_jetlag.data.model.JetLagPlanResponse) this.f46553b;
            kotlin.jvm.internal.l.j(response, "response");
            p283lc.a entity = response.toEntity(this.f46554c, this.f46555d);
            java.util.List<com.eightsleep.data_jetlag.data.model.JetLagPlanTaskResponse> tasks = response.getTasks();
            java.util.ArrayList arrayList = new java.util.ArrayList(Im.t.z0(tasks, 10));
            java.util.Iterator<T> it = tasks.iterator();
            while (it.hasNext()) {
                arrayList.add(((com.eightsleep.data_jetlag.data.model.JetLagPlanTaskResponse) it.next()).toEntity());
            }
            p283lc.d dVar2 = new p283lc.d(entity, arrayList);
            p231jc.d dVarAccess$getCache$p = com.eightsleep.data_jetlag.data.repository.JetLagPlanRepository.access$getCache$p(this.f46556e);
            this.f46553b = dVar2;
            this.f46552a = 1;
            kc.d dVar3 = dVarAccess$getCache$p.f54351a;
            java.lang.Object objM = P2.E.M((com.eightsleep.eight.AppDatabase_Impl) dVar3.f55565a, new p189hf.c(11, dVar3, dVar2), this);
            if (objM != Mm.a.COROUTINE_SUSPENDED) {
                objM = Hm.B.f13117a;
            }
            if (objM == obj2) {
                return obj2;
            }
            dVar = dVar2;
        } else {
            if (i10 != 1) {
                throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = (p283lc.d) this.f46553b;
            X4.x.M(obj);
        }
        return dVar.a();
    }
}
