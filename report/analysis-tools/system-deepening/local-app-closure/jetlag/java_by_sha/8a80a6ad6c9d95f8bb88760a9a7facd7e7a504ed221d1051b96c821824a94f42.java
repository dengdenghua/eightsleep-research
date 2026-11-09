package Yd;

/* JADX INFO: loaded from: classes2.dex */
public final class n implements zo.InterfaceC5441l {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f29851a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public final /* synthetic */ zo.InterfaceC5441l f29852b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Na.b f29853c;

    /* JADX INFO: renamed from: d, reason: collision with root package name */
    public final /* synthetic */ java.lang.Object f29854d;

    /* JADX INFO: renamed from: e, reason: collision with root package name */
    public final /* synthetic */ java.lang.Object f29855e;

    public /* synthetic */ n(zo.InterfaceC5441l interfaceC5441l, Na.b bVar, java.lang.Object obj, java.lang.Object obj2, int i10) {
        this.f29851a = i10;
        this.f29852b = interfaceC5441l;
        this.f29853c = bVar;
        this.f29854d = obj;
        this.f29855e = obj2;
    }

    @Override // zo.InterfaceC5441l
    public final java.lang.Object collect(zo.InterfaceC5443m interfaceC5443m, Lm.c cVar) {
        switch (this.f29851a) {
            case 0:
                java.lang.Object objCollect = this.f29852b.collect(new Ao.l(interfaceC5443m, this.f29853c, this.f29854d, this.f29855e, 5), cVar);
                return objCollect == Mm.a.COROUTINE_SUSPENDED ? objCollect : Hm.B.f13117a;
            case 1:
                java.lang.Object objCollect2 = this.f29852b.collect(new Ao.l(interfaceC5443m, this.f29853c, this.f29854d, this.f29855e, 6), cVar);
                return objCollect2 == Mm.a.COROUTINE_SUSPENDED ? objCollect2 : Hm.B.f13117a;
            case 2:
                java.lang.Object objCollect3 = this.f29852b.collect(new Ao.l(interfaceC5443m, this.f29853c, this.f29854d, this.f29855e, 7), cVar);
                return objCollect3 == Mm.a.COROUTINE_SUSPENDED ? objCollect3 : Hm.B.f13117a;
            case 3:
                java.lang.Object objCollect4 = this.f29852b.collect(new Ao.l(interfaceC5443m, this.f29853c, this.f29854d, this.f29855e, 8), cVar);
                return objCollect4 == Mm.a.COROUTINE_SUSPENDED ? objCollect4 : Hm.B.f13117a;
            default:
                java.lang.Object objCollect5 = this.f29852b.collect(new Ao.l(interfaceC5443m, this.f29853c, this.f29854d, this.f29855e, 10), cVar);
                return objCollect5 == Mm.a.COROUTINE_SUSPENDED ? objCollect5 : Hm.B.f13117a;
        }
    }
}
