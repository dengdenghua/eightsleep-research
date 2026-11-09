package Bc;

/* JADX INFO: loaded from: classes2.dex */
@kotlin.Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0004\b`\u0018\u00002\u00020\u0001J \u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00042\b\b\u0001\u0010\u0003\u001a\u00020\u0002H§@¢\u0006\u0004\b\u0006\u0010\u0007J*\u0010\n\u001a\b\u0012\u0004\u0012\u00020\t0\u00042\b\b\u0001\u0010\u0003\u001a\u00020\u00022\b\b\u0001\u0010\b\u001a\u00020\u0002H§@¢\u0006\u0004\b\n\u0010\u000bJ \u0010\r\u001a\b\u0012\u0004\u0012\u00020\t0\u00042\b\b\u0001\u0010\f\u001a\u00020\u0002H§@¢\u0006\u0004\b\r\u0010\u0007J,\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\t0\u00042\b\b\u0001\u0010\f\u001a\u00020\u00022\n\b\u0001\u0010\u000f\u001a\u0004\u0018\u00010\u000eH§@¢\u0006\u0004\b\u0010\u0010\u0011J,\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\t0\u00042\b\b\u0001\u0010\f\u001a\u00020\u00022\n\b\u0001\u0010\u000f\u001a\u0004\u0018\u00010\u000eH§@¢\u0006\u0004\b\u0012\u0010\u0011J,\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\t0\u00042\b\b\u0001\u0010\f\u001a\u00020\u00022\n\b\u0001\u0010\u000f\u001a\u0004\u0018\u00010\u000eH§@¢\u0006\u0004\b\u0013\u0010\u0011J \u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\t0\u00042\b\b\u0001\u0010\f\u001a\u00020\u0002H§@¢\u0006\u0004\b\u0014\u0010\u0007J \u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\t0\u00042\b\b\u0001\u0010\u0016\u001a\u00020\u0015H§@¢\u0006\u0004\b\u0017\u0010\u0018¨\u0006\u0019"}, d2 = {"LBc/a;", "", "", com.eightsleep.presentation_home.viewmodel.TagBreakdownViewModel.USER_ID, "LXq/S;", "Lcom/eightsleep/data_notifications/data/model/RemoteNotificationResponse;", "h", "(Ljava/lang/String;LLm/c;)Ljava/lang/Object;", "notificationId", "LHm/B;", "a", "(Ljava/lang/String;Ljava/lang/String;LLm/c;)Ljava/lang/Object;", com.google.android.gms.common.internal.ImagesContract.URL, "b", "Lokhttp3/RequestBody;", "body", "c", "(Ljava/lang/String;Lokhttp3/RequestBody;LLm/c;)Ljava/lang/Object;", "f", "g", "d", "Lcom/eightsleep/data_notifications/data/model/NotificationAckRequest;", "request", "e", "(Lcom/eightsleep/data_notifications/data/model/NotificationAckRequest;LLm/c;)Ljava/lang/Object;", "data-notifications_tencentRelease"}, k = 1, mv = {2, 0, 0}, xi = 48)
public interface a {
    @Zq.p("v1/users/{USER_ID}/notifications/{NOTIFICATION_ID}/dismiss")
    java.lang.Object a(@Zq.s("USER_ID") java.lang.String str, @Zq.s("NOTIFICATION_ID") java.lang.String str2, Lm.c<? super Xq.S<Hm.B>> cVar);

    @Zq.f
    java.lang.Object b(@Zq.y java.lang.String str, Lm.c<? super Xq.S<Hm.B>> cVar);

    @Zq.o
    java.lang.Object c(@Zq.y java.lang.String str, @Zq.a okhttp3.RequestBody requestBody, Lm.c<? super Xq.S<Hm.B>> cVar);

    @Zq.b
    java.lang.Object d(@Zq.y java.lang.String str, Lm.c<? super Xq.S<Hm.B>> cVar);

    @Zq.o("v1/push_event/acknowledge")
    java.lang.Object e(@Zq.a com.eightsleep.data_notifications.data.model.NotificationAckRequest notificationAckRequest, Lm.c<? super Xq.S<Hm.B>> cVar);

    @Zq.p
    java.lang.Object f(@Zq.y java.lang.String str, @Zq.a okhttp3.RequestBody requestBody, Lm.c<? super Xq.S<Hm.B>> cVar);

    @Zq.n
    java.lang.Object g(@Zq.y java.lang.String str, @Zq.a okhttp3.RequestBody requestBody, Lm.c<? super Xq.S<Hm.B>> cVar);

    @Zq.f("v1/users/{USER_ID}/notifications?active=true")
    java.lang.Object h(@Zq.s("USER_ID") java.lang.String str, Lm.c<? super Xq.S<com.eightsleep.data_notifications.data.model.RemoteNotificationResponse>> cVar);
}
