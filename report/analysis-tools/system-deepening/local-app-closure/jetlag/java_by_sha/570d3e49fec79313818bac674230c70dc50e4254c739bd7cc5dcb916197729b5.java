package p111ec;

/* JADX INFO: loaded from: classes2.dex */
public final class g extends Nm.i implements Vm.n {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public int f46581a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public /* synthetic */ java.lang.Object f46582b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public final /* synthetic */ java.lang.String f46583c;

    /* JADX INFO: renamed from: d, reason: collision with root package name */
    public final /* synthetic */ java.lang.String f46584d;

    /* JADX INFO: renamed from: e, reason: collision with root package name */
    public final /* synthetic */ com.eightsleep.data_jetlag.data.model.JetLagBulkTaskUpdateRequest f46585e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(java.lang.String str, java.lang.String str2, com.eightsleep.data_jetlag.data.model.JetLagBulkTaskUpdateRequest jetLagBulkTaskUpdateRequest, Lm.c cVar) {
        super(2, cVar);
        this.f46583c = str;
        this.f46584d = str2;
        this.f46585e = jetLagBulkTaskUpdateRequest;
    }

    @Override // Nm.a
    public final Lm.c create(java.lang.Object obj, Lm.c cVar) {
        p111ec.g gVar = new p111ec.g(this.f46583c, this.f46584d, this.f46585e, cVar);
        gVar.f46582b = obj;
        return gVar;
    }

    @Override // Vm.n
    public final java.lang.Object invoke(java.lang.Object obj, java.lang.Object obj2) {
        return ((p111ec.g) create((dc.a) obj, (Lm.c) obj2)).invokeSuspend(Hm.B.f13117a);
    }

    @Override // Nm.a
    public final java.lang.Object invokeSuspend(java.lang.Object obj) {
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i10 = this.f46581a;
        if (i10 != 0) {
            if (i10 != 1) {
                throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            X4.x.M(obj);
            return obj;
        }
        X4.x.M(obj);
        dc.a aVar2 = (dc.a) this.f46582b;
        this.f46581a = 1;
        java.lang.Object objB = aVar2.b(this.f46583c, this.f46584d, this.f46585e, this);
        return objB == aVar ? aVar : objB;
    }
}
