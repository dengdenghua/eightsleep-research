package com.eightsleep.data_notifications.data.repository;

/* JADX INFO: loaded from: classes2.dex */
@kotlin.Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\b\u0000\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0011\b\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J'\u0010\f\u001a\u0014\u0012\u0010\u0012\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u000b0\n0\t0\b2\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\f\u0010\rJ5\u0010\u0013\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00120\t0\b2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0010\u001a\u00020\u00062\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b\u0013\u0010\u0014J!\u0010\u0017\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00120\t0\b2\u0006\u0010\u0016\u001a\u00020\u0015¢\u0006\u0004\b\u0017\u0010\u0018R\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0019\u0010\u001a\u001a\u0004\b\u001b\u0010\u001c¨\u0006\u001d"}, d2 = {"Lcom/eightsleep/data_notifications/data/repository/EightNotificationsRepository;", "LNa/b;", "LBc/a;", "api", "<init>", "(LBc/a;)V", "", com.eightsleep.presentation_home.viewmodel.TagBreakdownViewModel.USER_ID, "Lzo/l;", "Lya/j;", "", "LEc/a;", "getNotifications", "(Ljava/lang/String;)Lzo/l;", "Lcom/eightsleep/data_core/enums/HttpMethod;", "httpMethod", com.google.android.gms.common.internal.ImagesContract.URL, "body", "LHm/B;", "dynamicUrl", "(Lcom/eightsleep/data_core/enums/HttpMethod;Ljava/lang/String;Ljava/lang/String;)Lzo/l;", "Lcom/eightsleep/data_notifications/data/model/NotificationAckRequest;", "request", "acknowledgePushNotification", "(Lcom/eightsleep/data_notifications/data/model/NotificationAckRequest;)Lzo/l;", "a", "LBc/a;", "getApi", "()LBc/a;", "data-notifications_tencentRelease"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class EightNotificationsRepository implements Na.b {

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public static final okhttp3.MediaType f40637b = okhttp3.MediaType.Companion.get("application/json; charset=utf-8");

    /* JADX INFO: renamed from: a, reason: collision with root package name and from kotlin metadata */
    public final Bc.a api;

    public EightNotificationsRepository(Bc.a api) {
        kotlin.jvm.internal.l.j(api, "api");
        this.api = api;
    }

    public static final /* synthetic */ okhttp3.MediaType access$getJSON_MEDIA_TYPE$cp() {
        return f40637b;
    }

    public final zo.InterfaceC5441l acknowledgePushNotification(com.eightsleep.data_notifications.data.model.NotificationAckRequest request) {
        kotlin.jvm.internal.l.j(request, "request");
        return P2.AbstractC1563b.t(this, getApi(), null, new Cc.a(request, null), 3);
    }

    public <R> zo.InterfaceC5441l call(Bc.a aVar, boolean z10, Ka.c cVar, Vm.n nVar) {
        return P2.AbstractC1563b.s(this, z10, cVar, nVar);
    }

    public final zo.InterfaceC5441l dynamicUrl(com.eightsleep.data_core.enums.HttpMethod httpMethod, java.lang.String url, java.lang.String body) {
        kotlin.jvm.internal.l.j(httpMethod, "httpMethod");
        kotlin.jvm.internal.l.j(url, "url");
        return new zo.C5460x(P2.AbstractC1563b.t(this, getApi(), null, new Cc.c(httpMethod, url, body, null), 3), new Cc.d(3, null, 0));
    }

    @Override // Na.b
    public /* bridge */ /* synthetic */ java.lang.Object getApi() {
        return getApi();
    }

    public final zo.InterfaceC5441l getNotifications(java.lang.String userId) {
        kotlin.jvm.internal.l.j(userId, "userId");
        return P2.q.D(P2.AbstractC1563b.t(this, getApi(), null, new Cc.e(userId, null), 3), new Cc.f(2, null));
    }

    @Override // Na.b
    public /* bridge */ /* synthetic */ zo.InterfaceC5441l call(java.lang.Object obj, boolean z10, Ka.c cVar, Vm.n nVar) {
        return call((Bc.a) obj, z10, cVar, nVar);
    }

    @Override // Na.b
    public Bc.a getApi() {
        return this.api;
    }
}
