package com.eightsleep.data_notifications.data.model;

/* JADX INFO: loaded from: classes2.dex */
@com.squareup.moshi.JsonClass(generateAdapter = true)
@kotlin.Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\t\b\u0087\b\u0018\u00002\u00020\u0001B+\u0012\b\b\u0001\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0004¢\u0006\u0004\b\b\u0010\tJ\r\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\r\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\u0012\u0010\u0011\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b\u0011\u0010\u0010J\u0010\u0010\u0012\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u0012\u0010\u0010J:\u0010\u0013\u001a\u00020\u00002\b\b\u0003\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00042\b\b\u0002\u0010\u0007\u001a\u00020\u0004HÆ\u0001¢\u0006\u0004\b\u0013\u0010\u0014J\u0010\u0010\u0015\u001a\u00020\u0004HÖ\u0001¢\u0006\u0004\b\u0015\u0010\u0010J\u0010\u0010\u0017\u001a\u00020\u0016HÖ\u0001¢\u0006\u0004\b\u0017\u0010\u0018J\u001a\u0010\u001b\u001a\u00020\u001a2\b\u0010\u0019\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u001b\u0010\u001cR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001d\u001a\u0004\b\u001e\u0010\u000eR\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001f\u001a\u0004\b \u0010\u0010R\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001f\u001a\u0004\b!\u0010\u0010R\u0017\u0010\u0007\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0007\u0010\u001f\u001a\u0004\b\"\u0010\u0010¨\u0006#"}, d2 = {"Lcom/eightsleep/data_notifications/data/model/EightNotificationActionResponse;", "", "Lcom/eightsleep/data_notifications/enums/NotificationClickAction;", "clickAction", "", com.google.android.gms.common.internal.ImagesContract.URL, "payload", com.heytap.mcssdk.constant.b.f42624f, "<init>", "(Lcom/eightsleep/data_notifications/enums/NotificationClickAction;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "LEc/b;", "toDomain", "()LEc/b;", "component1", "()Lcom/eightsleep/data_notifications/enums/NotificationClickAction;", "component2", "()Ljava/lang/String;", "component3", "component4", "copy", "(Lcom/eightsleep/data_notifications/enums/NotificationClickAction;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/eightsleep/data_notifications/data/model/EightNotificationActionResponse;", "toString", "", "hashCode", "()I", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/eightsleep/data_notifications/enums/NotificationClickAction;", "getClickAction", "Ljava/lang/String;", "getUrl", "getPayload", "getTitle", "data-notifications_tencentRelease"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final /* data */ class EightNotificationActionResponse {
    private final com.eightsleep.data_notifications.enums.NotificationClickAction clickAction;
    private final java.lang.String payload;
    private final java.lang.String title;
    private final java.lang.String url;

    public EightNotificationActionResponse(@com.squareup.moshi.Json(name = com.heytap.mcssdk.constant.b.f42620b) com.eightsleep.data_notifications.enums.NotificationClickAction clickAction, java.lang.String url, java.lang.String str, java.lang.String title) {
        kotlin.jvm.internal.l.j(clickAction, "clickAction");
        kotlin.jvm.internal.l.j(url, "url");
        kotlin.jvm.internal.l.j(title, "title");
        this.clickAction = clickAction;
        this.url = url;
        this.payload = str;
        this.title = title;
    }

    public static /* synthetic */ com.eightsleep.data_notifications.data.model.EightNotificationActionResponse copy$default(com.eightsleep.data_notifications.data.model.EightNotificationActionResponse eightNotificationActionResponse, com.eightsleep.data_notifications.enums.NotificationClickAction notificationClickAction, java.lang.String str, java.lang.String str2, java.lang.String str3, int i10, java.lang.Object obj) {
        if ((i10 & 1) != 0) {
            notificationClickAction = eightNotificationActionResponse.clickAction;
        }
        if ((i10 & 2) != 0) {
            str = eightNotificationActionResponse.url;
        }
        if ((i10 & 4) != 0) {
            str2 = eightNotificationActionResponse.payload;
        }
        if ((i10 & 8) != 0) {
            str3 = eightNotificationActionResponse.title;
        }
        return eightNotificationActionResponse.copy(notificationClickAction, str, str2, str3);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final com.eightsleep.data_notifications.enums.NotificationClickAction getClickAction() {
        return this.clickAction;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final java.lang.String getUrl() {
        return this.url;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final java.lang.String getPayload() {
        return this.payload;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final java.lang.String getTitle() {
        return this.title;
    }

    public final com.eightsleep.data_notifications.data.model.EightNotificationActionResponse copy(@com.squareup.moshi.Json(name = com.heytap.mcssdk.constant.b.f42620b) com.eightsleep.data_notifications.enums.NotificationClickAction clickAction, java.lang.String url, java.lang.String payload, java.lang.String title) {
        kotlin.jvm.internal.l.j(clickAction, "clickAction");
        kotlin.jvm.internal.l.j(url, "url");
        kotlin.jvm.internal.l.j(title, "title");
        return new com.eightsleep.data_notifications.data.model.EightNotificationActionResponse(clickAction, url, payload, title);
    }

    public boolean equals(java.lang.Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof com.eightsleep.data_notifications.data.model.EightNotificationActionResponse)) {
            return false;
        }
        com.eightsleep.data_notifications.data.model.EightNotificationActionResponse eightNotificationActionResponse = (com.eightsleep.data_notifications.data.model.EightNotificationActionResponse) other;
        return this.clickAction == eightNotificationActionResponse.clickAction && kotlin.jvm.internal.l.e(this.url, eightNotificationActionResponse.url) && kotlin.jvm.internal.l.e(this.payload, eightNotificationActionResponse.payload) && kotlin.jvm.internal.l.e(this.title, eightNotificationActionResponse.title);
    }

    public final com.eightsleep.data_notifications.enums.NotificationClickAction getClickAction() {
        return this.clickAction;
    }

    public final java.lang.String getPayload() {
        return this.payload;
    }

    public final java.lang.String getTitle() {
        return this.title;
    }

    public final java.lang.String getUrl() {
        return this.url;
    }

    public int hashCode() {
        int iA = androidx.fragment.app.AbstractC2375d0.a(this.clickAction.hashCode() * 31, 31, this.url);
        java.lang.String str = this.payload;
        return this.title.hashCode() + ((iA + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final Ec.b toDomain() {
        return new Ec.b(this.clickAction, this.url, this.payload, this.title);
    }

    public java.lang.String toString() {
        com.eightsleep.data_notifications.enums.NotificationClickAction notificationClickAction = this.clickAction;
        java.lang.String str = this.url;
        java.lang.String str2 = this.payload;
        java.lang.String str3 = this.title;
        java.lang.StringBuilder sb2 = new java.lang.StringBuilder("EightNotificationActionResponse(clickAction=");
        sb2.append(notificationClickAction);
        sb2.append(", url=");
        sb2.append(str);
        sb2.append(", payload=");
        return androidx.fragment.app.AbstractC2375d0.k(sb2, str2, ", title=", str3, ")");
    }
}
