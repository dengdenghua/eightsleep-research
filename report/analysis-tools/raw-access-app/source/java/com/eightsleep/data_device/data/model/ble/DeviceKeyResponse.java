package com.eightsleep.data_device.data.model.ble;

/* JADX INFO: loaded from: classes2.dex */
@com.squareup.moshi.JsonClass(generateAdapter = true)
@kotlin.Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\u0006\u0010\f\u001a\u00020\rJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u0011\u001a\u00020\u00122\b\u0010\u0013\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0014\u001a\u00020\u0005HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0016"}, d2 = {"Lcom/eightsleep/data_device/data/model/ble/DeviceKeyResponse;", "", "key", "", "expiresIn", "", "<init>", "(Ljava/lang/String;I)V", "getKey", "()Ljava/lang/String;", "getExpiresIn", "()I", "toDomain", "Lcom/eightsleep/data_device/data/model/offline/OfflineSecurityKey;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "toString", "data-device_tencentRelease"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final /* data */ class DeviceKeyResponse {
    private final int expiresIn;
    private final java.lang.String key;

    public DeviceKeyResponse(java.lang.String key, int i10) {
        kotlin.jvm.internal.l.j(key, "key");
        this.key = key;
        this.expiresIn = i10;
    }

    public static /* synthetic */ com.eightsleep.data_device.data.model.ble.DeviceKeyResponse copy$default(com.eightsleep.data_device.data.model.ble.DeviceKeyResponse deviceKeyResponse, java.lang.String str, int i10, int i11, java.lang.Object obj) {
        if ((i11 & 1) != 0) {
            str = deviceKeyResponse.key;
        }
        if ((i11 & 2) != 0) {
            i10 = deviceKeyResponse.expiresIn;
        }
        return deviceKeyResponse.copy(str, i10);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final java.lang.String getKey() {
        return this.key;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final int getExpiresIn() {
        return this.expiresIn;
    }

    public final com.eightsleep.data_device.data.model.ble.DeviceKeyResponse copy(java.lang.String key, int expiresIn) {
        kotlin.jvm.internal.l.j(key, "key");
        return new com.eightsleep.data_device.data.model.ble.DeviceKeyResponse(key, expiresIn);
    }

    public boolean equals(java.lang.Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof com.eightsleep.data_device.data.model.ble.DeviceKeyResponse)) {
            return false;
        }
        com.eightsleep.data_device.data.model.ble.DeviceKeyResponse deviceKeyResponse = (com.eightsleep.data_device.data.model.ble.DeviceKeyResponse) other;
        return kotlin.jvm.internal.l.e(this.key, deviceKeyResponse.key) && this.expiresIn == deviceKeyResponse.expiresIn;
    }

    public final int getExpiresIn() {
        return this.expiresIn;
    }

    public final java.lang.String getKey() {
        return this.key;
    }

    public int hashCode() {
        return java.lang.Integer.hashCode(this.expiresIn) + (this.key.hashCode() * 31);
    }

    public final com.eightsleep.data_device.data.model.offline.OfflineSecurityKey toDomain() {
        java.lang.String str = this.key;
        java.time.Instant instantPlusSeconds = java.time.Instant.now().plusSeconds(this.expiresIn);
        kotlin.jvm.internal.l.i(instantPlusSeconds, "plusSeconds(...)");
        return new com.eightsleep.data_device.data.model.offline.OfflineSecurityKey(str, instantPlusSeconds);
    }

    public java.lang.String toString() {
        return p222j.m.h(this.expiresIn, "DeviceKeyResponse(key=", this.key, ", expiresIn=", ")");
    }
}
