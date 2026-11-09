package p111ec;

/* JADX INFO: loaded from: classes2.dex */
public final class d extends Nm.i implements Vm.n {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public int f46562a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public /* synthetic */ java.lang.Object f46563b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public final /* synthetic */ java.lang.String f46564c;

    /* JADX INFO: renamed from: d, reason: collision with root package name */
    public final /* synthetic */ java.lang.String f46565d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(java.lang.String str, java.lang.String str2, Lm.c cVar) {
        super(2, cVar);
        this.f46564c = str;
        this.f46565d = str2;
    }

    @Override // Nm.a
    public final Lm.c create(java.lang.Object obj, Lm.c cVar) {
        p111ec.d dVar = new p111ec.d(this.f46564c, this.f46565d, cVar);
        dVar.f46563b = obj;
        return dVar;
    }

    @Override // Vm.n
    public final java.lang.Object invoke(java.lang.Object obj, java.lang.Object obj2) {
        return ((p111ec.d) create((dc.a) obj, (Lm.c) obj2)).invokeSuspend(Hm.B.f13117a);
    }

    @Override // Nm.a
    public final java.lang.Object invokeSuspend(java.lang.Object obj) {
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i10 = this.f46562a;
        if (i10 != 0) {
            if (i10 != 1) {
                throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            X4.x.M(obj);
            return obj;
        }
        X4.x.M(obj);
        dc.a aVar2 = (dc.a) this.f46563b;
        this.f46562a = 1;
        java.lang.Object objD = aVar2.d(this.f46564c, this.f46565d, this);
        return objD == aVar ? aVar : objD;
    }
}
