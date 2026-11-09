package Cc;

/* JADX INFO: loaded from: classes2.dex */
public final class c extends Nm.i implements Vm.n {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public int f4818a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public /* synthetic */ java.lang.Object f4819b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public final /* synthetic */ com.eightsleep.data_core.enums.HttpMethod f4820c;

    /* JADX INFO: renamed from: d, reason: collision with root package name */
    public final /* synthetic */ java.lang.String f4821d;

    /* JADX INFO: renamed from: e, reason: collision with root package name */
    public final /* synthetic */ java.lang.String f4822e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(com.eightsleep.data_core.enums.HttpMethod httpMethod, java.lang.String str, java.lang.String str2, Lm.c cVar) {
        super(2, cVar);
        this.f4820c = httpMethod;
        this.f4821d = str;
        this.f4822e = str2;
    }

    @Override // Nm.a
    public final Lm.c create(java.lang.Object obj, Lm.c cVar) {
        Cc.c cVar2 = new Cc.c(this.f4820c, this.f4821d, this.f4822e, cVar);
        cVar2.f4819b = obj;
        return cVar2;
    }

    @Override // Vm.n
    public final java.lang.Object invoke(java.lang.Object obj, java.lang.Object obj2) {
        return ((Cc.c) create((Bc.a) obj, (Lm.c) obj2)).invokeSuspend(Hm.B.f13117a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x005a, code lost:
    
        if (r10 == r0) goto L53;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x007a, code lost:
    
        if (r10 == r0) goto L53;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0092, code lost:
    
        if (r10 == r0) goto L53;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x00aa, code lost:
    
        if (r10 == r0) goto L53;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x00b6, code lost:
    
        if (r10 == r0) goto L53;
     */
    @Override // Nm.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final java.lang.Object invokeSuspend(java.lang.Object obj) {
        okhttp3.RequestBody requestBodyCreate;
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i10 = this.f4818a;
        if (i10 != 0) {
            if (i10 == 1) {
                X4.x.M(obj);
                return (Xq.S) obj;
            }
            if (i10 == 2) {
                X4.x.M(obj);
                return (Xq.S) obj;
            }
            if (i10 == 3) {
                X4.x.M(obj);
                return (Xq.S) obj;
            }
            if (i10 == 4) {
                X4.x.M(obj);
                return (Xq.S) obj;
            }
            if (i10 != 5) {
                throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            X4.x.M(obj);
            return (Xq.S) obj;
        }
        X4.x.M(obj);
        Bc.a aVar2 = (Bc.a) this.f4819b;
        int i11 = Cc.b.f4817a[this.f4820c.ordinal()];
        java.lang.String str = this.f4821d;
        if (i11 != 1) {
            java.lang.String str2 = this.f4822e;
            if (i11 == 2) {
                requestBodyCreate = str2 != null ? okhttp3.RequestBody.Companion.create(str2, com.eightsleep.data_notifications.data.repository.EightNotificationsRepository.access$getJSON_MEDIA_TYPE$cp()) : null;
                this.f4818a = 2;
                obj = aVar2.c(str, requestBodyCreate, this);
            } else if (i11 == 3) {
                requestBodyCreate = str2 != null ? okhttp3.RequestBody.Companion.create(str2, com.eightsleep.data_notifications.data.repository.EightNotificationsRepository.access$getJSON_MEDIA_TYPE$cp()) : null;
                this.f4818a = 3;
                obj = aVar2.f(str, requestBodyCreate, this);
            } else if (i11 == 4) {
                requestBodyCreate = str2 != null ? okhttp3.RequestBody.Companion.create(str2, com.eightsleep.data_notifications.data.repository.EightNotificationsRepository.access$getJSON_MEDIA_TYPE$cp()) : null;
                this.f4818a = 4;
                obj = aVar2.g(str, requestBodyCreate, this);
            } else {
                if (i11 != 5) {
                    throw new java.lang.IllegalArgumentException("Unknown http method");
                }
                this.f4818a = 5;
                obj = aVar2.d(str, this);
            }
        } else {
            this.f4818a = 1;
            obj = aVar2.b(str, this);
        }
        return aVar;
    }
}
