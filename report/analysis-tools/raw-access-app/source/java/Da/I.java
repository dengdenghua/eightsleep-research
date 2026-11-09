package Da;

/* JADX INFO: loaded from: classes2.dex */
public final class I extends Nm.i implements Vm.n {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public java.io.Closeable f6926a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public Da.K f6927b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public java.io.BufferedReader f6928c;

    /* JADX INFO: renamed from: d, reason: collision with root package name */
    public int f6929d;

    /* JADX INFO: renamed from: e, reason: collision with root package name */
    public /* synthetic */ java.lang.Object f6930e;

    /* JADX INFO: renamed from: f, reason: collision with root package name */
    public final /* synthetic */ java.net.HttpURLConnection f6931f;

    /* JADX INFO: renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Da.K f6932g;

    /* JADX INFO: renamed from: h, reason: collision with root package name */
    public final /* synthetic */ java.lang.String f6933h;

    /* JADX INFO: renamed from: i, reason: collision with root package name */
    public final /* synthetic */ int f6934i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public I(java.net.HttpURLConnection httpURLConnection, Da.K k, java.lang.String str, int i10, Lm.c cVar) {
        super(2, cVar);
        this.f6931f = httpURLConnection;
        this.f6932g = k;
        this.f6933h = str;
        this.f6934i = i10;
    }

    @Override // Nm.a
    public final Lm.c create(java.lang.Object obj, Lm.c cVar) {
        Da.I i10 = new Da.I(this.f6931f, this.f6932g, this.f6933h, this.f6934i, cVar);
        i10.f6930e = obj;
        return i10;
    }

    @Override // Vm.n
    public final java.lang.Object invoke(java.lang.Object obj, java.lang.Object obj2) {
        return ((Da.I) create((p554wo.InterfaceC5106z) obj, (Lm.c) obj2)).invokeSuspend(Hm.B.f13117a);
    }

    /* JADX WARN: Code duplicated, block: B:24:0x0089 A[Catch: all -> 0x00a0, TryCatch #1 {all -> 0x00a0, blocks: (B:22:0x0083, B:24:0x0089, B:26:0x008f, B:28:0x0097, B:35:0x00b2, B:33:0x00a3, B:40:0x00ef, B:41:0x00f6), top: B:79:0x0083, inners: #8 }] */
    /* JADX WARN: Code duplicated, block: B:26:0x008f A[Catch: all -> 0x00a0, TRY_LEAVE, TryCatch #1 {all -> 0x00a0, blocks: (B:22:0x0083, B:24:0x0089, B:26:0x008f, B:28:0x0097, B:35:0x00b2, B:33:0x00a3, B:40:0x00ef, B:41:0x00f6), top: B:79:0x0083, inners: #8 }] */
    /* JADX WARN: Code duplicated, block: B:35:0x00b2 A[Catch: all -> 0x00a0, TryCatch #1 {all -> 0x00a0, blocks: (B:22:0x0083, B:24:0x0089, B:26:0x008f, B:28:0x0097, B:35:0x00b2, B:33:0x00a3, B:40:0x00ef, B:41:0x00f6), top: B:79:0x0083, inners: #8 }] */
    /* JADX WARN: Code duplicated, block: B:37:0x00e8  */
    /* JADX WARN: Code duplicated, block: B:39:0x00ed  */
    /* JADX WARN: Code duplicated, block: B:40:0x00ef A[Catch: all -> 0x00a0, TryCatch #1 {all -> 0x00a0, blocks: (B:22:0x0083, B:24:0x0089, B:26:0x008f, B:28:0x0097, B:35:0x00b2, B:33:0x00a3, B:40:0x00ef, B:41:0x00f6), top: B:79:0x0083, inners: #8 }] */
    /* JADX WARN: Code duplicated, block: B:42:0x00f7  */
    /* JADX WARN: Code duplicated, block: B:85:0x0097 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v12 */
    /* JADX WARN: Type inference failed for: r0v13, types: [wo.z] */
    /* JADX WARN: Type inference failed for: r0v15, types: [wo.z] */
    /* JADX WARN: Type inference failed for: r0v17, types: [wo.z] */
    /* JADX WARN: Type inference failed for: r0v49 */
    /* JADX WARN: Type inference failed for: r0v50 */
    /* JADX WARN: Type inference failed for: r0v51 */
    /* JADX WARN: Type inference failed for: r0v6 */
    /* JADX WARN: Type inference failed for: r0v9 */
    /* JADX WARN: Type inference failed for: r12v10 */
    /* JADX WARN: Type inference failed for: r12v4 */
    /* JADX WARN: Type inference failed for: r12v5, types: [java.lang.Object, wo.z] */
    /* JADX WARN: Type inference failed for: r12v6 */
    /* JADX WARN: Type inference failed for: r12v9 */
    /* JADX WARN: Type inference failed for: r4v1 */
    /* JADX WARN: Type inference failed for: r4v11, types: [java.io.BufferedReader] */
    /* JADX WARN: Type inference failed for: r4v14 */
    /* JADX WARN: Type inference failed for: r4v17 */
    /* JADX WARN: Type inference failed for: r4v18 */
    /* JADX WARN: Type inference failed for: r4v2 */
    /* JADX WARN: Type inference failed for: r4v3 */
    /* JADX WARN: Type inference failed for: r4v4, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r4v5, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r4v6, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r4v8, types: [wo.z] */
    /* JADX WARN: Type inference failed for: r4v9 */
    /* JADX WARN: Type inference failed for: r5v1 */
    /* JADX WARN: Type inference failed for: r5v10 */
    /* JADX WARN: Type inference failed for: r5v11 */
    /* JADX WARN: Type inference failed for: r5v12 */
    /* JADX WARN: Type inference failed for: r5v2 */
    /* JADX WARN: Type inference failed for: r5v3 */
    /* JADX WARN: Type inference failed for: r5v4, types: [Lm.c, Lm.h, wo.B] */
    /* JADX WARN: Type inference failed for: r5v5, types: [Lm.c, Lm.h, wo.B] */
    /* JADX WARN: Type inference failed for: r5v6, types: [Lm.c, Lm.h, wo.B] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:36:0x00e6 -> B:38:0x00ea). Please report as a decompilation issue!!! */
    /*  JADX ERROR: JadxOverflowException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxOverflowException: Regions stack size limit reached
        	at jadx.core.utils.ErrorsCounter.addError(ErrorsCounter.java:59)
        	at jadx.core.utils.ErrorsCounter.error(ErrorsCounter.java:31)
        	at jadx.core.dex.attributes.nodes.NotificationAttrNode.addError(NotificationAttrNode.java:19)
        */
    @Override // Nm.a
    public final java.lang.Object invokeSuspend(java.lang.Object r17) {
        /*
            Method dump skipped, instruction units count: 410
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: Da.I.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
