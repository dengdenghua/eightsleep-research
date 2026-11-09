package p011ab;

/* JADX INFO: loaded from: classes2.dex */
public final class P {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public final p011ab.C2339m f32315a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public final com.squareup.moshi.Moshi f32316b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public final Co.c f32317c;

    /* JADX INFO: renamed from: d, reason: collision with root package name */
    public final java.util.concurrent.atomic.AtomicBoolean f32318d = new java.util.concurrent.atomic.AtomicBoolean(false);

    public P(p011ab.C2339m c2339m, com.squareup.moshi.Moshi moshi, Co.c cVar) {
        this.f32315a = c2339m;
        this.f32316b = moshi;
        this.f32317c = cVar;
    }

    public static final void a(p011ab.P p8, java.lang.String str) {
        p8.getClass();
        br.a aVar = timber.log.Timber.f67879a;
        aVar.p("OfflineApi");
        aVar.b(str, new java.lang.Object[0]);
    }

    /* JADX WARN: Code duplicated, block: B:7:0x0013  */
    public static final java.lang.Object b(p011ab.P p8, com.eightsleep.data_device.data.model.ble.HubPeripheral hubPeripheral, com.eightsleep.data_device.data.model.offline.OfflineSecurityKey offlineSecurityKey, com.eightsleep.data_device.data.model.ble.ReadCharacteristic readCharacteristic, Nm.c cVar) throws javax.crypto.BadPaddingException, javax.crypto.NoSuchPaddingException, com.eightsleep.data_device.exceptions.OfflineApiException$StaleGattProfileException, javax.crypto.IllegalBlockSizeException, java.security.NoSuchAlgorithmException, com.eightsleep.data_device.exceptions.OfflineApiException$IncorrectResponseVersionException, com.eightsleep.data_device.exceptions.OfflineApiException$MalformedResponseException, java.security.InvalidKeyException, java.io.IOException, java.security.InvalidAlgorithmParameterException, com.eightsleep.data_device.exceptions.OfflineApiException$FailedToParseResponseException {
        p011ab.H h10;
        if (cVar instanceof p011ab.H) {
            h10 = (p011ab.H) cVar;
            int i10 = h10.f32288f;
            if ((i10 & com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE) != 0) {
                h10.f32288f = i10 - com.eightsleep.data_device.data.model.ble.UpdatePodTemperatureBluetoothRequest.OFF_VALUE;
            } else {
                h10 = new p011ab.H(p8, cVar);
            }
        } else {
            h10 = new p011ab.H(p8, cVar);
        }
        java.lang.Object obj = h10.f32286d;
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i11 = h10.f32288f;
        try {
            if (i11 == 0) {
                X4.x.M(obj);
                com.juul.kable.Peripheral peripheral = hubPeripheral.getPeripheral();
                com.juul.kable.Characteristic characteristicCharacteristicOf = com.juul.kable.ProfileKt.characteristicOf(com.eightsleep.data_core.enums.BleAddress.SERVICE.getUuid(), readCharacteristic.getUuid());
                h10.f32283a = p8;
                h10.f32284b = offlineSecurityKey;
                h10.f32285c = readCharacteristic;
                h10.f32288f = 1;
                obj = peripheral.read(characteristicCharacteristicOf, h10);
                if (obj == aVar) {
                    return aVar;
                }
            } else {
                if (i11 != 1) {
                    throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                readCharacteristic = h10.f32285c;
                offlineSecurityKey = h10.f32284b;
                p8 = h10.f32283a;
                X4.x.M(obj);
            }
            byte[] bArr = (byte[]) obj;
            p8.getClass();
            if (bArr.length < 33) {
                throw new com.eightsleep.data_device.exceptions.OfflineApiException$MalformedResponseException(0);
            }
            if (bArr[0] != 1) {
                throw new com.eightsleep.data_device.exceptions.OfflineApiException$IncorrectResponseVersionException(0);
            }
            byte[] bArrDecode = java.util.Base64.getDecoder().decode(offlineSecurityKey.getKey());
            byte[] bArrB0 = Im.AbstractC1087n.b0(bArr, 1, 13);
            byte[] bArrB1 = Im.AbstractC1087n.b0(bArr, 13, 29);
            byte[] bArrB2 = Im.AbstractC1087n.b0(bArr, 29, bArr.length);
            kotlin.jvm.internal.l.g(bArrDecode);
            javax.crypto.Cipher cipher = javax.crypto.Cipher.getInstance("AES/GCM/NoPadding");
            cipher.init(2, new javax.crypto.spec.SecretKeySpec(bArrDecode, "AES"), new javax.crypto.spec.GCMParameterSpec(128, bArrB0));
            byte[] bArrDoFinal = cipher.doFinal(Im.AbstractC1087n.w0(bArrB2, bArrB1));
            kotlin.jvm.internal.l.i(bArrDoFinal, "doFinal(...)");
            java.io.ByteArrayInputStream byteArrayInputStream = new java.io.ByteArrayInputStream(bArrDoFinal);
            java.io.ByteArrayOutputStream byteArrayOutputStream = new java.io.ByteArrayOutputStream();
            java.util.zip.GZIPInputStream gZIPInputStream = new java.util.zip.GZIPInputStream(byteArrayInputStream);
            try {
                P2.E.D(gZIPInputStream, byteArrayOutputStream, okio.Segment.SIZE);
                gZIPInputStream.close();
                byte[] byteArray = byteArrayOutputStream.toByteArray();
                kotlin.jvm.internal.l.i(byteArray, "toByteArray(...)");
                try {
                    java.lang.Object objFromJson = p8.f32316b.adapter(readCharacteristic.getModelClass()).fromJson(new java.lang.String(byteArray, p294lo.a.f58353a));
                    return objFromJson == null ? p011ab.C2342p.f32368a : objFromJson;
                } catch (java.lang.Exception e8) {
                    f("Failed to parse BLE response", e8);
                    throw new com.eightsleep.data_device.exceptions.OfflineApiException$FailedToParseResponseException(0);
                }
            } catch (java.lang.Throwable th2) {
                try {
                    throw th2;
                } catch (java.lang.Throwable th3) {
                    P2.F.w(gZIPInputStream, th2);
                    throw th3;
                }
            }
        } catch (java.util.NoSuchElementException e10) {
            com.eightsleep.data_device.exceptions.OfflineApiException$StaleGattProfileException offlineApiException$StaleGattProfileException = new com.eightsleep.data_device.exceptions.OfflineApiException$StaleGattProfileException(0);
            java.lang.String str = "Dropping the peripheral so the next command rediscovers: " + e10.getMessage();
            p8.getClass();
            f(str, offlineApiException$StaleGattProfileException);
            throw offlineApiException$StaleGattProfileException;
        }
    }

    public static zo.C5460x c(p011ab.P p8, java.lang.String str) {
        return new zo.C5460x(new zo.u0(new p011ab.y(p8, str, p8.d(), null)), new p011ab.t(p8, null, 1));
    }

    public static void f(java.lang.String str, java.lang.Throwable th2) {
        if ((th2 instanceof com.eightsleep.data_device.exceptions.BluetoothApiException$BluetoothPermissionException) || (th2 instanceof com.eightsleep.data_device.exceptions.BluetoothApiException$BluetoothDisabledException) || (th2 instanceof com.eightsleep.data_device.exceptions.OfflineApiException$StaleGattProfileException)) {
            br.a aVar = timber.log.Timber.f67879a;
            aVar.p("OfflineApi");
            aVar.k(str, th2, new java.lang.Object[0]);
        } else {
            br.a aVar2 = timber.log.Timber.f67879a;
            aVar2.p("OfflineApi");
            aVar2.c(str, th2, new java.lang.Object[0]);
        }
    }

    public final Co.c d() {
        Co.c cVar = this.f32317c;
        return p554wo.C.c(cVar.f6060a.plus(p554wo.C.d()));
    }

    public final zo.C5460x e(Vm.k kVar) {
        return new zo.C5460x(new zo.u0(new p011ab.D(this, kVar, null)), new p011ab.t(this, null, 4));
    }
}
