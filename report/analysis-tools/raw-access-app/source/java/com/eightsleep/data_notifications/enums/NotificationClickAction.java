package com.eightsleep.data_notifications.enums;

/* JADX INFO: loaded from: classes2.dex */
@kotlin.Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0000\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0006\u0010\f\u001a\u00020\rj\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006j\u0002\b\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\nj\u0002\b\u000b¨\u0006\u000e"}, d2 = {"Lcom/eightsleep/data_notifications/enums/NotificationClickAction;", "", "<init>", "(Ljava/lang/String;I)V", "UNKNOWN", "GET", "POST", "PUT", "PATCH", "DELETE", "NAVIGATE", "DEEPLINK", "toHttpMethod", "Lcom/eightsleep/data_core/enums/HttpMethod;", "data-notifications_tencentRelease"}, k = 1, mv = {2, 0, 0}, xi = 48)
public enum NotificationClickAction {
    UNKNOWN,
    GET,
    POST,
    PUT,
    PATCH,
    DELETE,
    NAVIGATE,
    DEEPLINK;

    private static final /* synthetic */ Om.a $ENTRIES = android.support.v4.media.session.b.u(values());

    public static Om.a getEntries() {
        return $ENTRIES;
    }

    public final com.eightsleep.data_core.enums.HttpMethod toHttpMethod() {
        int i10 = com.eightsleep.data_notifications.enums.NotificationClickAction$WhenMappings.$EnumSwitchMapping$0[ordinal()];
        if (i10 == 1) {
            return com.eightsleep.data_core.enums.HttpMethod.GET;
        }
        if (i10 == 2) {
            return com.eightsleep.data_core.enums.HttpMethod.POST;
        }
        if (i10 == 3) {
            return com.eightsleep.data_core.enums.HttpMethod.PUT;
        }
        if (i10 != 4) {
            return i10 != 5 ? com.eightsleep.data_core.enums.HttpMethod.UNKNOWN : com.eightsleep.data_core.enums.HttpMethod.DELETE;
        }
        return com.eightsleep.data_core.enums.HttpMethod.PATCH;
    }
}
