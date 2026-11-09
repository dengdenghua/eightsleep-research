package p011ab;

/* JADX INFO: renamed from: ab.o, reason: case insensitive filesystem */
/* JADX INFO: loaded from: classes2.dex */
@kotlin.Metadata(d1 = {"\u0000\u0092\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bf\u0018\u00002\u00020\u0001J \u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00042\b\b\u0001\u0010\u0003\u001a\u00020\u0002H§@¢\u0006\u0004\b\u0006\u0010\u0007J \u0010\t\u001a\b\u0012\u0004\u0012\u00020\b0\u00042\b\b\u0001\u0010\u0003\u001a\u00020\u0002H§@¢\u0006\u0004\b\t\u0010\u0007J,\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000b0\u00042\b\b\u0001\u0010\u0003\u001a\u00020\u00022\n\b\u0003\u0010\n\u001a\u0004\u0018\u00010\u0002H§@¢\u0006\u0004\b\f\u0010\rJ \u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u000e0\u00042\b\b\u0001\u0010\u0003\u001a\u00020\u0002H§@¢\u0006\u0004\b\u000f\u0010\u0007J*\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u000e0\u00042\b\b\u0001\u0010\u0003\u001a\u00020\u00022\b\b\u0001\u0010\u0010\u001a\u00020\u000eH§@¢\u0006\u0004\b\u0011\u0010\u0012J \u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00130\u00042\b\b\u0001\u0010\u0003\u001a\u00020\u0002H§@¢\u0006\u0004\b\u0014\u0010\u0007J \u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00150\u00042\b\b\u0001\u0010\u0003\u001a\u00020\u0002H§@¢\u0006\u0004\b\u0016\u0010\u0007J*\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\u00190\u00042\b\b\u0001\u0010\u0003\u001a\u00020\u00022\b\b\u0001\u0010\u0018\u001a\u00020\u0017H§@¢\u0006\u0004\b\u001a\u0010\u001bJ \u0010\u001c\u001a\b\u0012\u0004\u0012\u00020\u00190\u00042\b\b\u0001\u0010\u0003\u001a\u00020\u0002H§@¢\u0006\u0004\b\u001c\u0010\u0007J*\u0010!\u001a\b\u0012\u0004\u0012\u00020 0\u00042\b\b\u0001\u0010\u001d\u001a\u00020\u00022\b\b\u0001\u0010\u001f\u001a\u00020\u001eH§@¢\u0006\u0004\b!\u0010\"J*\u0010%\u001a\b\u0012\u0004\u0012\u00020$0\u00042\b\b\u0001\u0010\u001d\u001a\u00020\u00022\b\b\u0001\u0010#\u001a\u00020\u0002H§@¢\u0006\u0004\b%\u0010\rJ*\u0010(\u001a\b\u0012\u0004\u0012\u00020'0\u00042\b\b\u0001\u0010\u0003\u001a\u00020\u00022\b\b\u0001\u0010\u001f\u001a\u00020&H§@¢\u0006\u0004\b(\u0010)J \u0010*\u001a\b\u0012\u0004\u0012\u00020'0\u00042\b\b\u0001\u0010\u0003\u001a\u00020\u0002H§@¢\u0006\u0004\b*\u0010\u0007J*\u0010-\u001a\b\u0012\u0004\u0012\u00020,0\u00042\b\b\u0001\u0010\u0003\u001a\u00020\u00022\b\b\u0001\u0010\u001f\u001a\u00020+H§@¢\u0006\u0004\b-\u0010.J \u00100\u001a\b\u0012\u0004\u0012\u00020/0\u00042\b\b\u0001\u0010\u0003\u001a\u00020\u0002H§@¢\u0006\u0004\b0\u0010\u0007J*\u00102\u001a\b\u0012\u0004\u0012\u00020/0\u00042\b\b\u0001\u0010\u0003\u001a\u00020\u00022\b\b\u0001\u0010\u001f\u001a\u000201H§@¢\u0006\u0004\b2\u00103J \u00106\u001a\b\u0012\u0004\u0012\u0002050\u00042\b\b\u0001\u0010\u001f\u001a\u000204H§@¢\u0006\u0004\b6\u00107¨\u00068"}, d2 = {"Lab/o;", "", "", "deviceId", "LXq/S;", "Lcom/eightsleep/data_device/data/model/DeviceWarrantyResponse;", "h", "(Ljava/lang/String;LLm/c;)Ljava/lang/Object;", "Lcom/eightsleep/data_device/data/model/DeviceStatusResponse;", "b", "lastHeardAfter", "Lcom/eightsleep/data_device/data/model/DeviceLastHeardResponse;", "j", "(Ljava/lang/String;Ljava/lang/String;LLm/c;)Ljava/lang/Object;", "Lcom/eightsleep/data_device/data/model/PrimingScheduleNetwork;", "a", "primingSchedule", "l", "(Ljava/lang/String;Lcom/eightsleep/data_device/data/model/PrimingScheduleNetwork;LLm/c;)Ljava/lang/Object;", "Lcom/eightsleep/data_device/data/model/PrimingTasksResponse;", "c", "Lcom/eightsleep/data_device/data/model/LatestPrimingTaskResponse;", "f", "Lcom/eightsleep/data_device/data/model/PrimingTaskRequest;", "primingTask", "Lcom/eightsleep/data_device/data/model/PrimingTaskResponse;", "i", "(Ljava/lang/String;Lcom/eightsleep/data_device/data/model/PrimingTaskRequest;LLm/c;)Ljava/lang/Object;", "q", "hostDeviceId", "Lcom/eightsleep/data_device/data/model/HubAutoPairingRequest;", "request", "Lcom/eightsleep/data_device/data/model/HubAutoPairingResponse;", "m", "(Ljava/lang/String;Lcom/eightsleep/data_device/data/model/HubAutoPairingRequest;LLm/c;)Ljava/lang/Object;", "pairingId", "Lcom/eightsleep/data_device/data/model/HubAutoPairingStateResponse;", "n", "Lcom/eightsleep/data_device/data/model/DeviceVibrationTestRequest;", "LHm/B;", "d", "(Ljava/lang/String;Lcom/eightsleep/data_device/data/model/DeviceVibrationTestRequest;LLm/c;)Ljava/lang/Object;", "p", "Lcom/eightsleep/data_device/data/model/ble/GetDeviceKeyRequest;", "Lcom/eightsleep/data_device/data/model/ble/DeviceKeyResponse;", "e", "(Ljava/lang/String;Lcom/eightsleep/data_device/data/model/ble/GetDeviceKeyRequest;LLm/c;)Ljava/lang/Object;", "Lcom/eightsleep/data_device/data/model/ShippingAddressResponse;", "k", "Lcom/eightsleep/data_device/data/model/UpdateShippingAddressRequest;", "o", "(Ljava/lang/String;Lcom/eightsleep/data_device/data/model/UpdateShippingAddressRequest;LLm/c;)Ljava/lang/Object;", "Lcom/eightsleep/data_device/data/model/AddressVerifyRequest;", "Lcom/eightsleep/data_device/data/model/AddressVerifyResponse;", "g", "(Lcom/eightsleep/data_device/data/model/AddressVerifyRequest;LLm/c;)Ljava/lang/Object;", "data-device_tencentRelease"}, k = 1, mv = {2, 0, 0}, xi = 48)
public interface InterfaceC2341o {
    @Zq.f("v1/devices/{deviceId}/priming/schedule")
    java.lang.Object a(@Zq.s("deviceId") java.lang.String str, Lm.c<? super Xq.S<com.eightsleep.data_device.data.model.PrimingScheduleNetwork>> cVar);

    @Zq.f("v1/devices/{deviceId}/status")
    java.lang.Object b(@Zq.s("deviceId") java.lang.String str, Lm.c<? super Xq.S<com.eightsleep.data_device.data.model.DeviceStatusResponse>> cVar);

    @Zq.f("v1/devices/{deviceId}/priming/tasks")
    java.lang.Object c(@Zq.s("deviceId") java.lang.String str, Lm.c<? super Xq.S<com.eightsleep.data_device.data.model.PrimingTasksResponse>> cVar);

    @Zq.o("v2/devices/{DEVICE_ID}/vibration-test")
    java.lang.Object d(@Zq.s("DEVICE_ID") java.lang.String str, @Zq.a com.eightsleep.data_device.data.model.DeviceVibrationTestRequest deviceVibrationTestRequest, Lm.c<? super Xq.S<Hm.B>> cVar);

    @Zq.o("v1/devices/{DEVICE_ID}/security/key")
    java.lang.Object e(@Zq.s("DEVICE_ID") java.lang.String str, @Zq.a com.eightsleep.data_device.data.model.ble.GetDeviceKeyRequest getDeviceKeyRequest, Lm.c<? super Xq.S<com.eightsleep.data_device.data.model.ble.DeviceKeyResponse>> cVar);

    @Zq.f("v1/devices/{deviceId}/priming/tasks/latest")
    java.lang.Object f(@Zq.s("deviceId") java.lang.String str, Lm.c<? super Xq.S<com.eightsleep.data_device.data.model.LatestPrimingTaskResponse>> cVar);

    @Zq.o("v1/address/verify")
    java.lang.Object g(@Zq.a com.eightsleep.data_device.data.model.AddressVerifyRequest addressVerifyRequest, Lm.c<? super Xq.S<com.eightsleep.data_device.data.model.AddressVerifyResponse>> cVar);

    @Zq.f("v1/devices/{deviceId}/warranty")
    java.lang.Object h(@Zq.s("deviceId") java.lang.String str, Lm.c<? super Xq.S<com.eightsleep.data_device.data.model.DeviceWarrantyResponse>> cVar);

    @Zq.o("v1/devices/{deviceId}/priming/tasks")
    java.lang.Object i(@Zq.s("deviceId") java.lang.String str, @Zq.a com.eightsleep.data_device.data.model.PrimingTaskRequest primingTaskRequest, Lm.c<? super Xq.S<com.eightsleep.data_device.data.model.PrimingTaskResponse>> cVar);

    @Zq.f("v1/devices/{deviceId}/online")
    java.lang.Object j(@Zq.s("deviceId") java.lang.String str, @Zq.t("lastHeardAfter") java.lang.String str2, Lm.c<? super Xq.S<com.eightsleep.data_device.data.model.DeviceLastHeardResponse>> cVar);

    @Zq.f("v1/device/{DEVICE_ID}/maintenance/address")
    java.lang.Object k(@Zq.s("DEVICE_ID") java.lang.String str, Lm.c<? super Xq.S<com.eightsleep.data_device.data.model.ShippingAddressResponse>> cVar);

    @Zq.p("v1/devices/{deviceId}/priming/schedule")
    java.lang.Object l(@Zq.s("deviceId") java.lang.String str, @Zq.a com.eightsleep.data_device.data.model.PrimingScheduleNetwork primingScheduleNetwork, Lm.c<? super Xq.S<com.eightsleep.data_device.data.model.PrimingScheduleNetwork>> cVar);

    @Zq.o("v1/devices/{DEVICE_ID}/auto-pairing/start")
    java.lang.Object m(@Zq.s("DEVICE_ID") java.lang.String str, @Zq.a com.eightsleep.data_device.data.model.HubAutoPairingRequest hubAutoPairingRequest, Lm.c<? super Xq.S<com.eightsleep.data_device.data.model.HubAutoPairingResponse>> cVar);

    @Zq.f("v1/devices/{DEVICE_ID}/auto-pairing/status/{PAIRING_ID}")
    java.lang.Object n(@Zq.s("DEVICE_ID") java.lang.String str, @Zq.s("PAIRING_ID") java.lang.String str2, Lm.c<? super Xq.S<com.eightsleep.data_device.data.model.HubAutoPairingStateResponse>> cVar);

    @Zq.p("v1/device/{DEVICE_ID}/maintenance/address")
    java.lang.Object o(@Zq.s("DEVICE_ID") java.lang.String str, @Zq.a com.eightsleep.data_device.data.model.UpdateShippingAddressRequest updateShippingAddressRequest, Lm.c<? super Xq.S<com.eightsleep.data_device.data.model.ShippingAddressResponse>> cVar);

    @Zq.p("v2/devices/{DEVICE_ID}/vibration-test/stop")
    java.lang.Object p(@Zq.s("DEVICE_ID") java.lang.String str, Lm.c<? super Xq.S<Hm.B>> cVar);

    @Zq.b("v1/devices/{deviceId}/priming/tasks")
    java.lang.Object q(@Zq.s("deviceId") java.lang.String str, Lm.c<? super Xq.S<com.eightsleep.data_device.data.model.PrimingTaskResponse>> cVar);
}
