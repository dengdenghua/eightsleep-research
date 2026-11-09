package com.eightsleep.data_device.data.model.ble;

/* JADX INFO: loaded from: classes2.dex */
@com.squareup.moshi.JsonClass(generateAdapter = true)
@kotlin.Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/eightsleep/data_device/data/model/ble/GetDeviceKeyRequest;", "", "deviceToken", "", "<init>", "(Ljava/lang/String;)V", "getDeviceToken", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "data-device_tencentRelease"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final /* data */ class GetDeviceKeyRequest {
    private final java.lang.String deviceToken;

    public GetDeviceKeyRequest(java.lang.String deviceToken) {
        kotlin.jvm.internal.l.j(deviceToken, "deviceToken");
        this.deviceToken = deviceToken;
    }

    public static /* synthetic */ com.eightsleep.data_device.data.model.ble.GetDeviceKeyRequest copy$default(com.eightsleep.data_device.data.model.ble.GetDeviceKeyRequest getDeviceKeyRequest, java.lang.String str, int i10, java.lang.Object obj) {
        if ((i10 & 1) != 0) {
            str = getDeviceKeyRequest.deviceToken;
        }
        return getDeviceKeyRequest.copy(str);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final java.lang.String getDeviceToken() {
        return this.deviceToken;
    }

    public final com.eightsleep.data_device.data.model.ble.GetDeviceKeyRequest copy(java.lang.String deviceToken) {
        kotlin.jvm.internal.l.j(deviceToken, "deviceToken");
        return new com.eightsleep.data_device.data.model.ble.GetDeviceKeyRequest(deviceToken);
    }

    public boolean equals(java.lang.Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof com.eightsleep.data_device.data.model.ble.GetDeviceKeyRequest) && kotlin.jvm.internal.l.e(this.deviceToken, ((com.eightsleep.data_device.data.model.ble.GetDeviceKeyRequest) other).deviceToken);
    }

    public final java.lang.String getDeviceToken() {
        return this.deviceToken;
    }

    public int hashCode() {
        return this.deviceToken.hashCode();
    }

    public java.lang.String toString() {
        return B.h.l("GetDeviceKeyRequest(deviceToken=", this.deviceToken, ")");
    }
}
