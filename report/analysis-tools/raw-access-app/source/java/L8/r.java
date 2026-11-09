package L8;

/* JADX INFO: loaded from: classes.dex */
public final class r extends Nm.i implements Vm.n {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public int f17818a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Ec.b f17819b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public final /* synthetic */ L8.s f17820c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r(Ec.b bVar, L8.s sVar, Lm.c cVar) {
        super(2, cVar);
        this.f17819b = bVar;
        this.f17820c = sVar;
    }

    @Override // Nm.a
    public final Lm.c create(java.lang.Object obj, Lm.c cVar) {
        return new L8.r(this.f17819b, this.f17820c, cVar);
    }

    @Override // Vm.n
    public final java.lang.Object invoke(java.lang.Object obj, java.lang.Object obj2) {
        return ((L8.r) create((p554wo.InterfaceC5106z) obj, (Lm.c) obj2)).invokeSuspend(Hm.B.f13117a);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code duplicated, block: B:35:0x00df A[RETURN] */
    /* JADX WARN: Type inference failed for: r2v5, types: [Vm.k, kotlin.jvm.internal.a] */
    @Override // Nm.a
    public final java.lang.Object invokeSuspend(java.lang.Object obj) {
        java.lang.Object objV;
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i10 = this.f17818a;
        Hm.B b7 = Hm.B.f13117a;
        if (i10 != 0) {
            if (i10 != 1) {
                throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            X4.x.M(obj);
            return b7;
        }
        X4.x.M(obj);
        Ec.b bVar = this.f17819b;
        int i11 = L8.q.f17817a[bVar.f9185a.ordinal()];
        L8.s sVar = this.f17820c;
        switch (i11) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
                this.f17818a = 1;
                sVar.getClass();
                com.eightsleep.data_core.enums.HttpMethod httpMethod = bVar.f9185a.toHttpMethod();
                Ec.a aVar2 = sVar.f17821a;
                Fc.b bVar2 = (Fc.b) sVar.f17822b;
                kotlin.jvm.internal.l.j(httpMethod, "httpMethod");
                java.lang.String url = bVar.f9186b;
                kotlin.jvm.internal.l.j(url, "url");
                com.eightsleep.data_notifications.enums.NotificationType type = aVar2.f9179e;
                kotlin.jvm.internal.l.j(type, "type");
                java.lang.Object objM = zo.AbstractC5454s.m(bVar2.f10192a.dynamicUrl(httpMethod, url, bVar.f9187c), new L8.p(sVar, null), this);
                if (objM != aVar) {
                    objM = b7;
                }
                if (objM == aVar) {
                    return aVar;
                }
                return b7;
            case 6:
            case 7:
                java.lang.String str = bVar.f9186b;
                sVar.getClass();
                try {
                    java.net.URI uriCreate = java.net.URI.create(str);
                    boolean zE = kotlin.jvm.internal.l.e(uriCreate.getScheme(), "eightsleep");
                    ?? r10 = sVar.f17823c;
                    if (zE) {
                        r10.invoke(new com.eightsleep.corepresentation.navigation.route.Route$Deeplink(str));
                    } else if (kotlin.jvm.internal.l.e(uriCreate.getAuthority(), "eightsleep.com")) {
                        java.lang.String path = uriCreate.getPath();
                        kotlin.jvm.internal.l.i(path, "getPath(...)");
                        r10.invoke(new com.eightsleep.corepresentation.navigation.route.Route$EightWebsite(path, (java.lang.String) null, (java.lang.String) null, (java.lang.String) null, (java.lang.String) null, 30, (kotlin.jvm.internal.DefaultConstructorMarker) null));
                    } else {
                        r10.invoke(new com.eightsleep.corepresentation.navigation.route.Route$WebView(str, false, (java.lang.String) null, false, (java.lang.String) null, (java.lang.String) null, (java.lang.String) null, false, false, false, false, 2046, (kotlin.jvm.internal.DefaultConstructorMarker) null));
                    }
                    objV = b7;
                } catch (java.lang.Throwable th2) {
                    objV = X4.x.v(th2);
                }
                java.lang.Throwable thA = Hm.n.a(objV);
                if (thA != null) {
                    timber.log.Timber.f67879a.e(thA);
                }
                return b7;
            case 8:
                return b7;
            default:
                throw new kotlin.NoWhenBranchMatchedException();
        }
    }
}
