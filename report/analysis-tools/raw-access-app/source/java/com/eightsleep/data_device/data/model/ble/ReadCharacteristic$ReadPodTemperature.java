package com.eightsleep.data_device.data.model.ble;

/* JADX INFO: loaded from: classes2.dex */
@kotlin.Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\bÆ\n\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u0013\u0010\u0005\u001a\u00020\u00062\b\u0010\u0007\u001a\u0004\u0018\u00010\bHÖ\u0003J\t\u0010\t\u001a\u00020\nHÖ\u0001J\t\u0010\u000b\u001a\u00020\fHÖ\u0001¨\u0006\r"}, d2 = {"Lcom/eightsleep/data_device/data/model/ble/ReadCharacteristic$ReadPodTemperature;", "Lcom/eightsleep/data_device/data/model/ble/ReadCharacteristic;", "Lcom/eightsleep/data_device/data/model/ble/PodTemperatureBluetoothResponse;", "<init>", "()V", "equals", "", "other", "", "hashCode", "", "toString", "", "data-device_tencentRelease"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final /* data */ class ReadCharacteristic$ReadPodTemperature extends com.eightsleep.data_device.data.model.ble.ReadCharacteristic<com.eightsleep.data_device.data.model.ble.PodTemperatureBluetoothResponse> {
    public static final com.eightsleep.data_device.data.model.ble.ReadCharacteristic$ReadPodTemperature INSTANCE = new com.eightsleep.data_device.data.model.ble.ReadCharacteristic$ReadPodTemperature();

    private ReadCharacteristic$ReadPodTemperature() {
        super(com.eightsleep.data_core.enums.BleAddress.READ_TEMPERATURE_CHARACTERISTIC.getUuid(), Za.u.READ_TEMPERATURE, com.eightsleep.data_device.data.model.ble.PodTemperatureBluetoothResponse.class, null);
    }

    public boolean equals(java.lang.Object other) {
        return this == other || (other instanceof com.eightsleep.data_device.data.model.ble.ReadCharacteristic$ReadPodTemperature);
    }

    public int hashCode() {
        return -342320542;
    }

    public java.lang.String toString() {
        return "ReadPodTemperature";
    }
}
