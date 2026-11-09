package Da;

/* JADX INFO: loaded from: classes2.dex */
public final class E extends Nm.i implements Vm.n {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public int f6912a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public /* synthetic */ java.lang.Object f6913b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Da.K f6914c;

    /* JADX INFO: renamed from: d, reason: collision with root package name */
    public final /* synthetic */ java.lang.String f6915d;

    /* JADX INFO: renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f6916e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public E(Da.K k, java.lang.String str, int i10, Lm.c cVar) {
        super(2, cVar);
        this.f6914c = k;
        this.f6915d = str;
        this.f6916e = i10;
    }

    @Override // Nm.a
    public final Lm.c create(java.lang.Object obj, Lm.c cVar) {
        Da.E e8 = new Da.E(this.f6914c, this.f6915d, this.f6916e, cVar);
        e8.f6913b = obj;
        return e8;
    }

    @Override // Vm.n
    public final java.lang.Object invoke(java.lang.Object obj, java.lang.Object obj2) {
        return ((Da.E) create((p554wo.InterfaceC5106z) obj, (Lm.c) obj2)).invokeSuspend(Hm.B.f13117a);
    }

    /* JADX WARN: Can't wrap try/catch for region: R(3:11|21|12) */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x00ad, code lost:
    
        r7 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x00ae, code lost:
    
        r8 = timber.log.Timber.f67879a;
        r8.p("SENSOR EVENT STREAM");
        r8.c("XXXXXXX Connection failed. Retrying in 3 seconds...", r7, new java.lang.Object[0]);
        r13.f6913b = r2;
        r13.f6912a = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x00c4, code lost:
    
        if (p554wo.C.n(3000, r13) == r1) goto L17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x00c6, code lost:
    
        return r1;
     */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:16:0x00c4 -> B:18:0x00c7). Please report as a decompilation issue!!! */
    @Override // Nm.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final java.lang.Object invokeSuspend(java.lang.Object obj) {
        p554wo.InterfaceC5106z interfaceC5106z;
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i10 = this.f6912a;
        int i11 = this.f6916e;
        java.lang.String str = this.f6915d;
        Da.K k = this.f6914c;
        if (i10 == 0) {
            X4.x.M(obj);
            interfaceC5106z = (p554wo.InterfaceC5106z) this.f6913b;
        } else {
            if (i10 != 1) {
                throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            interfaceC5106z = (p554wo.InterfaceC5106z) this.f6913b;
            X4.x.M(obj);
            Da.K.a(k, str, i11 + 1);
        }
        if (p554wo.C.A(interfaceC5106z)) {
            br.a aVar2 = timber.log.Timber.f67879a;
            aVar2.p("SENSOR EVENT STREAM");
            aVar2.b("XXXXXXX SENSOR EVENT STREAM Connecting", new java.lang.Object[0]);
            java.net.URLConnection uRLConnectionOpenConnection = new java.net.URL(com.eightsleep.data_core.enums.AppEnvironment.getBaseUrl$default(k.f6941c, "app-api", null, 2, null) + "v1/devices/" + str + "/live").openConnection();
            kotlin.jvm.internal.l.h(uRLConnectionOpenConnection, "null cannot be cast to non-null type java.net.HttpURLConnection");
            java.net.HttpURLConnection httpURLConnection = (java.net.HttpURLConnection) uRLConnectionOpenConnection;
            java.lang.String strA = k.f6939a.a();
            kotlin.jvm.internal.l.g(strA);
            httpURLConnection.setRequestProperty("Authorization", "Bearer " + strA);
            httpURLConnection.setRequestProperty("Accept", "text/event-stream");
            httpURLConnection.setDoInput(true);
            httpURLConnection.connect();
            k.f6944f = httpURLConnection;
            k.f6947i = true;
            k.f6945g = p554wo.C.B(interfaceC5106z, null, null, new Da.D(k, str, i11, null), 3);
        }
        return Hm.B.f13117a;
    }
}
