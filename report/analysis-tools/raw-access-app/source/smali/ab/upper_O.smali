.class public final Lab/O;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public a:I

.field public synthetic b:Ljava/lang/Object;

.field public final synthetic c:Lab/P;

.field public final synthetic d:Lcom/eightsleep/data_device/data/model/offline/OfflineHubPeripheralWriteCommandRequest;

.field public final synthetic e:Lcom/eightsleep/data_device/data/model/offline/OfflineSecurityKey;


# direct methods
.method public constructor <init>(Lab/P;Lcom/eightsleep/data_device/data/model/offline/OfflineHubPeripheralWriteCommandRequest;Lcom/eightsleep/data_device/data/model/offline/OfflineSecurityKey;LLm/c;)V
    .locals 0

    iput-object p1, p0, Lab/O;->c:Lab/P;

    iput-object p2, p0, Lab/O;->d:Lcom/eightsleep/data_device/data/model/offline/OfflineHubPeripheralWriteCommandRequest;

    iput-object p3, p0, Lab/O;->e:Lcom/eightsleep/data_device/data/model/offline/OfflineSecurityKey;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p4}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 3

    new-instance v0, Lab/O;

    iget-object v1, p0, Lab/O;->d:Lcom/eightsleep/data_device/data/model/offline/OfflineHubPeripheralWriteCommandRequest;

    iget-object v2, p0, Lab/O;->e:Lcom/eightsleep/data_device/data/model/offline/OfflineSecurityKey;

    iget-object p0, p0, Lab/O;->c:Lab/P;

    invoke-direct {v0, p0, v1, v2, p2}, Lab/O;-><init>(Lab/P;Lcom/eightsleep/data_device/data/model/offline/OfflineHubPeripheralWriteCommandRequest;Lcom/eightsleep/data_device/data/model/offline/OfflineSecurityKey;LLm/c;)V

    iput-object p1, v0, Lab/O;->b:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lzo/m;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lab/O;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lab/O;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lab/O;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 23

    move-object/from16 v6, p0

    const/4 v7, 0x2

    const/4 v8, 0x3

    const/16 v0, 0x10

    const/4 v1, 0x1

    sget-object v10, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, v6, Lab/O;->a:I

    sget-object v11, LHm/B;->a:LHm/B;

    iget-object v12, v6, Lab/O;->c:Lab/P;

    iget-object v13, v6, Lab/O;->d:Lcom/eightsleep/data_device/data/model/offline/OfflineHubPeripheralWriteCommandRequest;

    if-eqz v2, :cond_3

    if-eq v2, v1, :cond_2

    if-eq v2, v7, :cond_1

    if-ne v2, v8, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    invoke-static/range {p1 .. p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto/16 :goto_9

    :cond_2
    iget-object v0, v6, Lab/O;->b:Ljava/lang/Object;

    check-cast v0, Lzo/m;

    invoke-static/range {p1 .. p1}, LX4/x;->M(Ljava/lang/Object;)V

    move-object v14, v0

    move/from16 v17, v7

    move/from16 v16, v8

    move-object/from16 v0, p1

    goto/16 :goto_7

    :cond_3
    invoke-static/range {p1 .. p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object v2, v6, Lab/O;->b:Ljava/lang/Object;

    move-object v14, v2

    check-cast v14, Lzo/m;

    invoke-virtual {v13}, Lcom/eightsleep/data_device/data/model/offline/OfflineHubPeripheralWriteCommandRequest;->getHubPeripheral()Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;

    move-result-object v2

    move-object v3, v2

    invoke-virtual {v13}, Lcom/eightsleep/data_device/data/model/offline/OfflineHubPeripheralWriteCommandRequest;->getCharacteristic()Lcom/eightsleep/data_device/data/model/ble/WriteCharacteristic;

    move-result-object v2

    iput-object v14, v6, Lab/O;->b:Ljava/lang/Object;

    iput v1, v6, Lab/O;->a:I

    invoke-static {}, Ljava/util/Base64;->getDecoder()Ljava/util/Base64$Decoder;

    move-result-object v4

    iget-object v5, v6, Lab/O;->e:Lcom/eightsleep/data_device/data/model/offline/OfflineSecurityKey;

    invoke-virtual {v5}, Lcom/eightsleep/data_device/data/model/offline/OfflineSecurityKey;->getKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/Base64$Decoder;->decode(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v2}, Lcom/eightsleep/data_device/data/model/ble/WriteCharacteristic;->getModelClass()Ljava/lang/Class;

    move-result-object v5

    iget-object v15, v12, Lab/P;->b:Lcom/squareup/moshi/Moshi;

    invoke-virtual {v15, v5}, Lcom/squareup/moshi/Moshi;->adapter(Ljava/lang/Class;)Lcom/squareup/moshi/JsonAdapter;

    move-result-object v5

    invoke-virtual {v2}, Lcom/eightsleep/data_device/data/model/ble/WriteCharacteristic;->getRequest()Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v5, v15}, Lcom/squareup/moshi/JsonAdapter;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lkotlin/jvm/internal/l;->g(Ljava/lang/Object;)V

    sget-object v15, Llo/a;->a:Ljava/nio/charset/Charset;

    invoke-virtual {v5, v15}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v5

    const-string v15, "getBytes(...)"

    invoke-static {v5, v15}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v15, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v15}, Ljava/io/ByteArrayOutputStream;-><init>()V

    move/from16 v16, v8

    new-instance v8, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v8, v15}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    :try_start_0
    invoke-virtual {v8, v5}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {v8}, Ljava/io/Closeable;->close()V

    invoke-virtual {v15}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    const-string v8, "toByteArray(...)"

    invoke-static {v5, v8}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v8, Ljava/security/SecureRandom;

    invoke-direct {v8}, Ljava/security/SecureRandom;-><init>()V

    const/16 v15, 0xc

    invoke-virtual {v8, v15}, Ljava/security/SecureRandom;->generateSeed(I)[B

    move-result-object v8

    invoke-static {v4}, Lkotlin/jvm/internal/l;->g(Ljava/lang/Object;)V

    invoke-static {v8}, Lkotlin/jvm/internal/l;->g(Ljava/lang/Object;)V

    const-string v15, "AES/GCM/NoPadding"

    invoke-static {v15}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v15

    move/from16 v17, v7

    new-instance v7, Ljavax/crypto/spec/SecretKeySpec;

    const/16 v18, 0x0

    const-string v9, "AES"

    invoke-direct {v7, v4, v9}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    new-instance v4, Ljavax/crypto/spec/GCMParameterSpec;

    const/16 v9, 0x80

    invoke-direct {v4, v9, v8}, Ljavax/crypto/spec/GCMParameterSpec;-><init>(I[B)V

    invoke-virtual {v15, v1, v7, v4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    invoke-virtual {v15, v5}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v4

    invoke-static {v4}, Lkotlin/jvm/internal/l;->g(Ljava/lang/Object;)V

    array-length v5, v4

    if-lt v0, v5, :cond_4

    invoke-static {v4}, LIm/n;->F0([B)Ljava/util/List;

    move-result-object v5

    goto :goto_2

    :cond_4
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7, v0}, Ljava/util/ArrayList;-><init>(I)V

    add-int/lit8 v9, v5, -0x10

    :goto_1
    if-ge v9, v5, :cond_5

    aget-byte v15, v4, v9

    invoke-static {v15}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v15

    invoke-virtual {v7, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/2addr v9, v1

    goto :goto_1

    :cond_5
    move-object v5, v7

    :goto_2
    invoke-static {v5}, LIm/r;->P1(Ljava/util/List;)[B

    move-result-object v5

    array-length v7, v4

    sub-int/2addr v7, v0

    if-gez v7, :cond_6

    move/from16 v7, v18

    :cond_6
    if-ltz v7, :cond_f

    if-nez v7, :cond_7

    sget-object v4, LIm/z;->a:LIm/z;

    :goto_3
    move/from16 v19, v0

    move/from16 v22, v1

    goto :goto_6

    :cond_7
    array-length v9, v4

    if-lt v7, v9, :cond_8

    invoke-static {v4}, LIm/n;->F0([B)Ljava/util/List;

    move-result-object v4

    goto :goto_3

    :cond_8
    if-ne v7, v1, :cond_9

    aget-byte v4, v4, v18

    invoke-static {v4}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    invoke-static {v4}, LIm/s;->f0(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    goto :goto_3

    :cond_9
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9, v7}, Ljava/util/ArrayList;-><init>(I)V

    array-length v15, v4

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v20, v0

    :goto_4
    if-ge v0, v15, :cond_b

    aget-byte v21, v4, v0

    move/from16 v22, v1

    invoke-static/range {v21 .. v21}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v1

    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v20, 0x1

    if-ne v1, v7, :cond_a

    goto :goto_5

    :cond_a
    add-int/lit8 v0, v0, 0x1

    move/from16 v20, v1

    move/from16 v1, v22

    goto :goto_4

    :cond_b
    move/from16 v22, v1

    :goto_5
    move-object v4, v9

    :goto_6
    invoke-static {v4}, LIm/r;->P1(Ljava/util/List;)[B

    move-result-object v0

    new-instance v1, Lan/k;

    const v4, 0x7fffffff

    move/from16 v9, v18

    move/from16 v7, v22

    invoke-direct {v1, v9, v4, v7}, Lan/i;-><init>(III)V

    sget-object v4, LYm/d;->a:LYm/a;

    :try_start_1
    invoke-static {v1}, LP2/f;->P(Lan/k;)I

    move-result v1
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    new-array v4, v7, [B

    aput-byte v7, v4, v9

    and-int/lit16 v7, v1, 0xff

    int-to-byte v7, v7

    shr-int/lit8 v9, v1, 0x8

    and-int/lit16 v9, v9, 0xff

    int-to-byte v9, v9

    shr-int/lit8 v15, v1, 0x10

    and-int/lit16 v15, v15, 0xff

    int-to-byte v15, v15

    shr-int/lit8 v1, v1, 0x18

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    move/from16 v19, v1

    const/4 v1, 0x4

    new-array v1, v1, [B

    const/16 v18, 0x0

    aput-byte v7, v1, v18

    const/16 v22, 0x1

    aput-byte v9, v1, v22

    aput-byte v15, v1, v17

    aput-byte v19, v1, v16

    invoke-static {v4, v1}, LIm/n;->w0([B[B)[B

    move-result-object v1

    invoke-static {v1, v8}, LIm/n;->w0([B[B)[B

    move-result-object v1

    invoke-static {v1, v5}, LIm/n;->w0([B[B)[B

    move-result-object v1

    invoke-static {v1, v0}, LIm/n;->w0([B[B)[B

    move-result-object v0

    invoke-interface {v3}, Lcom/eightsleep/data_device/data/model/ble/EightPeripheral;->getPeripheral()Lcom/juul/kable/Peripheral;

    move-result-object v1

    move-object v3, v0

    iget-object v0, v12, Lab/P;->a:Lab/m;

    sget-object v4, Lcom/eightsleep/data_core/enums/BleAddress;->SERVICE:Lcom/eightsleep/data_core/enums/BleAddress;

    invoke-virtual {v4}, Lcom/eightsleep/data_core/enums/BleAddress;->getUuid()Ljava/lang/String;

    move-result-object v5

    const/4 v4, 0x3

    invoke-virtual/range {v0 .. v6}, Lab/m;->h(Lcom/juul/kable/Peripheral;Lcom/eightsleep/data_device/data/model/ble/WriteCharacteristic;[BILjava/lang/String;LNm/c;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v10, :cond_c

    goto :goto_8

    :cond_c
    :goto_7
    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_d

    new-instance v0, Lya/g;

    invoke-direct {v0, v11}, Lya/g;-><init>(Ljava/lang/Object;)V

    iput-object v1, v6, Lab/O;->b:Ljava/lang/Object;

    move/from16 v1, v17

    iput v1, v6, Lab/O;->a:I

    invoke-interface {v14, v0, v6}, Lzo/m;->emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v10, :cond_e

    goto :goto_8

    :cond_d
    new-instance v0, Lya/e;

    new-instance v2, Lcom/eightsleep/data_device/exceptions/OfflineApiException$FailedToSendCommandException;

    const/4 v9, 0x0

    invoke-direct {v2, v9}, Lcom/eightsleep/data_device/exceptions/OfflineApiException$FailedToSendCommandException;-><init>(I)V

    invoke-direct {v0, v2}, Lya/e;-><init>(Ljava/lang/Throwable;)V

    iput-object v1, v6, Lab/O;->b:Ljava/lang/Object;

    move/from16 v1, v16

    iput v1, v6, Lab/O;->a:I

    invoke-interface {v14, v0, v6}, Lzo/m;->emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v10, :cond_e

    :goto_8
    return-object v10

    :cond_e
    :goto_9
    invoke-virtual {v13}, Lcom/eightsleep/data_device/data/model/offline/OfflineHubPeripheralWriteCommandRequest;->getCharacteristic()Lcom/eightsleep/data_device/data/model/ble/WriteCharacteristic;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    sget-object v1, Lkotlin/jvm/internal/B;->a:Lkotlin/jvm/internal/C;

    invoke-virtual {v1, v0}, Lkotlin/jvm/internal/C;->b(Ljava/lang/Class;)Lbn/d;

    move-result-object v0

    invoke-interface {v0}, Lbn/d;->k()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Wrote "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " characteristic successfully"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v12, v0}, Lab/P;->a(Lab/P;Ljava/lang/String;)V

    return-object v11

    :catch_0
    move-exception v0

    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_f
    const-string v0, "Requested element count "

    const-string v1, " is less than zero."

    invoke-static {v7, v0, v1}, Lj/m;->g(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :catchall_0
    move-exception v0

    move-object v1, v0

    :try_start_2
    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :catchall_1
    move-exception v0

    invoke-static {v8, v1}, LP2/F;->w(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
.end method
