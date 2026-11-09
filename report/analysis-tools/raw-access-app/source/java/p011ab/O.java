package p011ab;

/* JADX INFO: loaded from: classes2.dex */
public final class O extends Nm.i implements Vm.n {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public int f32310a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public /* synthetic */ java.lang.Object f32311b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public final /* synthetic */ p011ab.P f32312c;

    /* JADX INFO: renamed from: d, reason: collision with root package name */
    public final /* synthetic */ com.eightsleep.data_device.data.model.offline.OfflineHubPeripheralWriteCommandRequest f32313d;

    /* JADX INFO: renamed from: e, reason: collision with root package name */
    public final /* synthetic */ com.eightsleep.data_device.data.model.offline.OfflineSecurityKey f32314e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public O(p011ab.P p8, com.eightsleep.data_device.data.model.offline.OfflineHubPeripheralWriteCommandRequest offlineHubPeripheralWriteCommandRequest, com.eightsleep.data_device.data.model.offline.OfflineSecurityKey offlineSecurityKey, Lm.c cVar) {
        super(2, cVar);
        this.f32312c = p8;
        this.f32313d = offlineHubPeripheralWriteCommandRequest;
        this.f32314e = offlineSecurityKey;
    }

    @Override // Nm.a
    public final Lm.c create(java.lang.Object obj, Lm.c cVar) {
        p011ab.O o4 = new p011ab.O(this.f32312c, this.f32313d, this.f32314e, cVar);
        o4.f32311b = obj;
        return o4;
    }

    @Override // Vm.n
    public final java.lang.Object invoke(java.lang.Object obj, java.lang.Object obj2) {
        return ((p011ab.O) create((zo.InterfaceC5443m) obj, (Lm.c) obj2)).invokeSuspend(Hm.B.f13117a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:49:0x01b1, code lost:
    
        if (r14.emit(r0, r23) == r10) goto L53;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x01c9, code lost:
    
        if (r14.emit(r0, r23) == r10) goto L53;
     */
    @Override // Nm.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final java.lang.Object invokeSuspend(java.lang.Object obj) throws javax.crypto.BadPaddingException, javax.crypto.NoSuchPaddingException, javax.crypto.IllegalBlockSizeException, java.security.NoSuchAlgorithmException, java.io.IOException, java.security.InvalidKeyException, java.security.InvalidAlgorithmParameterException {
        zo.InterfaceC5443m interfaceC5443m;
        int i10;
        int i11;
        java.util.List listF0;
        boolean z10;
        java.util.List listF1;
        java.lang.Object objH;
        boolean z11 = true;
        Mm.a aVar = Mm.a.COROUTINE_SUSPENDED;
        int i12 = this.f32310a;
        Hm.B b7 = Hm.B.f13117a;
        p011ab.P p8 = this.f32312c;
        com.eightsleep.data_device.data.model.offline.OfflineHubPeripheralWriteCommandRequest offlineHubPeripheralWriteCommandRequest = this.f32313d;
        if (i12 != 0) {
            if (i12 == 1) {
                zo.InterfaceC5443m interfaceC5443m2 = (zo.InterfaceC5443m) this.f32311b;
                X4.x.M(obj);
                interfaceC5443m = interfaceC5443m2;
                i11 = 2;
                i10 = 3;
                objH = obj;
            } else {
                if (i12 != 2 && i12 != 3) {
                    throw new java.lang.IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                X4.x.M(obj);
            }
            p011ab.P.a(p8, "Wrote " + kotlin.jvm.internal.B.f56400a.b(offlineHubPeripheralWriteCommandRequest.getCharacteristic().getClass()).k() + " characteristic successfully");
            return b7;
        }
        X4.x.M(obj);
        interfaceC5443m = (zo.InterfaceC5443m) this.f32311b;
        com.eightsleep.data_device.data.model.ble.HubPeripheral hubPeripheral = offlineHubPeripheralWriteCommandRequest.getHubPeripheral();
        com.eightsleep.data_device.data.model.ble.WriteCharacteristic characteristic = offlineHubPeripheralWriteCommandRequest.getCharacteristic();
        this.f32311b = interfaceC5443m;
        this.f32310a = 1;
        byte[] bArrDecode = java.util.Base64.getDecoder().decode(this.f32314e.getKey());
        java.lang.String json = p8.f32316b.adapter(characteristic.getModelClass()).toJson(characteristic.getRequest());
        kotlin.jvm.internal.l.g(json);
        byte[] bytes = json.getBytes(p294lo.a.f58353a);
        kotlin.jvm.internal.l.i(bytes, "getBytes(...)");
        java.io.ByteArrayOutputStream byteArrayOutputStream = new java.io.ByteArrayOutputStream();
        i10 = 3;
        java.util.zip.GZIPOutputStream gZIPOutputStream = new java.util.zip.GZIPOutputStream(byteArrayOutputStream);
        try {
            gZIPOutputStream.write(bytes);
            gZIPOutputStream.close();
            byte[] byteArray = byteArrayOutputStream.toByteArray();
            kotlin.jvm.internal.l.i(byteArray, "toByteArray(...)");
            byte[] bArrGenerateSeed = new java.security.SecureRandom().generateSeed(12);
            kotlin.jvm.internal.l.g(bArrDecode);
            kotlin.jvm.internal.l.g(bArrGenerateSeed);
            javax.crypto.Cipher cipher = javax.crypto.Cipher.getInstance("AES/GCM/NoPadding");
            i11 = 2;
            cipher.init(1, new javax.crypto.spec.SecretKeySpec(bArrDecode, "AES"), new javax.crypto.spec.GCMParameterSpec(128, bArrGenerateSeed));
            byte[] bArrDoFinal = cipher.doFinal(byteArray);
            kotlin.jvm.internal.l.g(bArrDoFinal);
            int length = bArrDoFinal.length;
            if (16 >= length) {
                listF0 = Im.AbstractC1087n.F0(bArrDoFinal);
            } else {
                java.util.ArrayList arrayList = new java.util.ArrayList(16);
                for (int i13 = length - 16; i13 < length; i13++) {
                    arrayList.add(java.lang.Byte.valueOf(bArrDoFinal[i13]));
                }
                listF0 = arrayList;
            }
            byte[] bArrP1 = Im.r.P1(listF0);
            int length2 = bArrDoFinal.length - 16;
            if (length2 < 0) {
                length2 = 0;
            }
            if (length2 < 0) {
                throw new java.lang.IllegalArgumentException(p222j.m.g(length2, "Requested element count ", " is less than zero.").toString());
            }
            try {
                if (length2 == 0) {
                    listF1 = Im.z.f14265a;
                } else {
                    if (length2 < bArrDoFinal.length) {
                        if (length2 == 1) {
                            listF1 = Im.s.f0(java.lang.Byte.valueOf(bArrDoFinal[0]));
                        } else {
                            java.util.ArrayList arrayList2 = new java.util.ArrayList(length2);
                            int length3 = bArrDoFinal.length;
                            int i14 = 0;
                            int i15 = 0;
                            while (true) {
                                if (i14 >= length3) {
                                    z10 = z11;
                                    break;
                                }
                                z10 = z11;
                                arrayList2.add(java.lang.Byte.valueOf(bArrDoFinal[i14]));
                                int i16 = i15 + 1;
                                if (i16 == length2) {
                                    break;
                                }
                                i14++;
                                i15 = i16;
                                z11 = z10;
                            }
                            listF1 = arrayList2;
                        }
                        byte[] bArrP2 = Im.r.P1(listF1);
                        int i17 = z10;
                        p021an.k kVar = new p021an.k(0, com.google.android.gms.common.api.Api$BaseClientBuilder.API_PRIORITY_OTHER, i17);
                        Ym.a aVar2 = Ym.d.f30285a;
                        int iP = P2.AbstractC1567f.P(kVar);
                        byte[] bArr = new byte[i17];
                        bArr[0] = i17;
                        objH = p8.f32315a.h(hubPeripheral.getPeripheral(), characteristic, Im.AbstractC1087n.w0(Im.AbstractC1087n.w0(Im.AbstractC1087n.w0(Im.AbstractC1087n.w0(bArr, new byte[]{(byte) (iP & com.juul.kable.external.ConstantsKt.GATT_OUT_OF_RANGE), (byte) ((iP >> 8) & com.juul.kable.external.ConstantsKt.GATT_OUT_OF_RANGE), (byte) ((iP >> 16) & com.juul.kable.external.ConstantsKt.GATT_OUT_OF_RANGE), (byte) ((iP >> 24) & com.juul.kable.external.ConstantsKt.GATT_OUT_OF_RANGE)}), bArrGenerateSeed), bArrP1), bArrP2), 3, com.eightsleep.data_core.enums.BleAddress.SERVICE.getUuid(), this);
                        if (objH != aVar) {
                        }
                        return aVar;
                    }
                    listF1 = Im.AbstractC1087n.F0(bArrDoFinal);
                }
                int iP2 = P2.AbstractC1567f.P(kVar);
                byte[] bArr2 = new byte[i17];
                bArr2[0] = i17;
                objH = p8.f32315a.h(hubPeripheral.getPeripheral(), characteristic, Im.AbstractC1087n.w0(Im.AbstractC1087n.w0(Im.AbstractC1087n.w0(Im.AbstractC1087n.w0(bArr2, new byte[]{(byte) (iP2 & com.juul.kable.external.ConstantsKt.GATT_OUT_OF_RANGE), (byte) ((iP2 >> 8) & com.juul.kable.external.ConstantsKt.GATT_OUT_OF_RANGE), (byte) ((iP2 >> 16) & com.juul.kable.external.ConstantsKt.GATT_OUT_OF_RANGE), (byte) ((iP2 >> 24) & com.juul.kable.external.ConstantsKt.GATT_OUT_OF_RANGE)}), bArrGenerateSeed), bArrP1), bArrP2), 3, com.eightsleep.data_core.enums.BleAddress.SERVICE.getUuid(), this);
                if (objH != aVar) {
                }
                return aVar;
            } catch (java.lang.IllegalArgumentException e8) {
                throw new java.util.NoSuchElementException(e8.getMessage());
            }
            z10 = true;
            byte[] bArrP3 = Im.r.P1(listF1);
            int i18 = z10;
            p021an.k kVar2 = new p021an.k(0, com.google.android.gms.common.api.Api$BaseClientBuilder.API_PRIORITY_OTHER, i18);
            Ym.a aVar3 = Ym.d.f30285a;
        } catch (java.lang.Throwable th2) {
            try {
                throw th2;
            } catch (java.lang.Throwable th3) {
                P2.F.w(gZIPOutputStream, th2);
                throw th3;
            }
        }
        if (((java.lang.Boolean) objH).booleanValue()) {
            p592ya.g gVar = new p592ya.g(b7);
            this.f32311b = null;
            this.f32310a = i11;
        } else {
            p592ya.e eVar = new p592ya.e(new com.eightsleep.data_device.exceptions.OfflineApiException$FailedToSendCommandException(0));
            this.f32311b = null;
            this.f32310a = i10;
        }
    }
}
