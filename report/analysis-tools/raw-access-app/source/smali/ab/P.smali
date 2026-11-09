.class public final Lab/P;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lab/m;

.field public final b:Lcom/squareup/moshi/Moshi;

.field public final c:LCo/c;

.field public final d:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public constructor <init>(Lab/m;Lcom/squareup/moshi/Moshi;LCo/c;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lab/P;->a:Lab/m;

    iput-object p2, p0, Lab/P;->b:Lcom/squareup/moshi/Moshi;

    iput-object p3, p0, Lab/P;->c:LCo/c;

    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p1, p0, Lab/P;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method public static final a(Lab/P;Ljava/lang/String;)V
    .locals 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Ltimber/log/Timber;->a:Lbr/a;

    const-string v0, "OfflineApi"

    invoke-virtual {p0, v0}, Lbr/a;->p(Ljava/lang/String;)V

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-virtual {p0, p1, v0}, Lbr/a;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public static final b(Lab/P;Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;Lcom/eightsleep/data_device/data/model/offline/OfflineSecurityKey;Lcom/eightsleep/data_device/data/model/ble/ReadCharacteristic;LNm/c;)Ljava/lang/Object;
    .locals 5

    instance-of v0, p4, Lab/H;

    if-eqz v0, :cond_0

    move-object v0, p4

    check-cast v0, Lab/H;

    iget v1, v0, Lab/H;->f:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lab/H;->f:I

    goto :goto_0

    :cond_0
    new-instance v0, Lab/H;

    invoke-direct {v0, p0, p4}, Lab/H;-><init>(Lab/P;LNm/c;)V

    :goto_0
    iget-object p4, v0, Lab/H;->d:Ljava/lang/Object;

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, v0, Lab/H;->f:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2

    if-ne v2, v4, :cond_1

    iget-object p3, v0, Lab/H;->c:Lcom/eightsleep/data_device/data/model/ble/ReadCharacteristic;

    iget-object p2, v0, Lab/H;->b:Lcom/eightsleep/data_device/data/model/offline/OfflineSecurityKey;

    iget-object p0, v0, Lab/H;->a:Lab/P;

    :try_start_0
    invoke-static {p4}, LX4/x;->M(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    goto/16 :goto_3

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    invoke-static {p4}, LX4/x;->M(Ljava/lang/Object;)V

    :try_start_1
    invoke-interface {p1}, Lcom/eightsleep/data_device/data/model/ble/EightPeripheral;->getPeripheral()Lcom/juul/kable/Peripheral;

    move-result-object p1

    sget-object p4, Lcom/eightsleep/data_core/enums/BleAddress;->SERVICE:Lcom/eightsleep/data_core/enums/BleAddress;

    invoke-virtual {p4}, Lcom/eightsleep/data_core/enums/BleAddress;->getUuid()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3}, Lcom/eightsleep/data_device/data/model/ble/ReadCharacteristic;->getUuid()Ljava/lang/String;

    move-result-object v2

    invoke-static {p4, v2}, Lcom/juul/kable/ProfileKt;->characteristicOf(Ljava/lang/String;Ljava/lang/String;)Lcom/juul/kable/Characteristic;

    move-result-object p4

    iput-object p0, v0, Lab/H;->a:Lab/P;

    iput-object p2, v0, Lab/H;->b:Lcom/eightsleep/data_device/data/model/offline/OfflineSecurityKey;

    iput-object p3, v0, Lab/H;->c:Lcom/eightsleep/data_device/data/model/ble/ReadCharacteristic;

    iput v4, v0, Lab/H;->f:I

    invoke-interface {p1, p4, v0}, Lcom/juul/kable/Peripheral;->read(Lcom/juul/kable/Characteristic;LLm/c;)Ljava/lang/Object;

    move-result-object p4

    if-ne p4, v1, :cond_3

    return-object v1

    :cond_3
    :goto_1
    check-cast p4, [B
    :try_end_1
    .catch Ljava/util/NoSuchElementException; {:try_start_1 .. :try_end_1} :catch_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    array-length p1, p4

    const/16 v0, 0x21

    if-lt p1, v0, :cond_6

    aget-byte p1, p4, v3

    if-ne p1, v4, :cond_5

    invoke-static {}, Ljava/util/Base64;->getDecoder()Ljava/util/Base64$Decoder;

    move-result-object p1

    invoke-virtual {p2}, Lcom/eightsleep/data_device/data/model/offline/OfflineSecurityKey;->getKey()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/util/Base64$Decoder;->decode(Ljava/lang/String;)[B

    move-result-object p1

    const/16 p2, 0xd

    invoke-static {p4, v4, p2}, LIm/n;->b0([BII)[B

    move-result-object v0

    const/16 v1, 0x1d

    invoke-static {p4, p2, v1}, LIm/n;->b0([BII)[B

    move-result-object p2

    array-length v2, p4

    invoke-static {p4, v1, v2}, LIm/n;->b0([BII)[B

    move-result-object p4

    invoke-static {p1}, Lkotlin/jvm/internal/l;->g(Ljava/lang/Object;)V

    const-string v1, "AES/GCM/NoPadding"

    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    new-instance v2, Ljavax/crypto/spec/SecretKeySpec;

    const-string v4, "AES"

    invoke-direct {v2, p1, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    new-instance p1, Ljavax/crypto/spec/GCMParameterSpec;

    const/16 v4, 0x80

    invoke-direct {p1, v4, v0}, Ljavax/crypto/spec/GCMParameterSpec;-><init>(I[B)V

    const/4 v0, 0x2

    invoke-virtual {v1, v0, v2, p1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    invoke-static {p4, p2}, LIm/n;->w0([B[B)[B

    move-result-object p1

    invoke-virtual {v1, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object p1

    const-string p2, "doFinal(...)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p2, Ljava/io/ByteArrayInputStream;

    invoke-direct {p2, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    new-instance p1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    new-instance p4, Ljava/util/zip/GZIPInputStream;

    invoke-direct {p4, p2}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    const/16 p2, 0x2000

    :try_start_2
    invoke-static {p4, p1, p2}, LP2/E;->D(Ljava/io/InputStream;Ljava/io/OutputStream;I)J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    invoke-virtual {p4}, Ljava/util/zip/GZIPInputStream;->close()V

    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    const-string p2, "toByteArray(...)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lab/P;->b:Lcom/squareup/moshi/Moshi;

    invoke-virtual {p3}, Lcom/eightsleep/data_device/data/model/ble/ReadCharacteristic;->getModelClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {p0, p2}, Lcom/squareup/moshi/Moshi;->adapter(Ljava/lang/Class;)Lcom/squareup/moshi/JsonAdapter;

    move-result-object p0

    :try_start_3
    new-instance p2, Ljava/lang/String;

    sget-object p3, Llo/a;->a:Ljava/nio/charset/Charset;

    invoke-direct {p2, p1, p3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-virtual {p0, p2}, Lcom/squareup/moshi/JsonAdapter;->fromJson(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_4

    sget-object p0, Lab/p;->a:Lab/p;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    return-object p0

    :catch_1
    move-exception p0

    goto :goto_2

    :cond_4
    return-object p0

    :goto_2
    const-string p1, "Failed to parse BLE response"

    invoke-static {p1, p0}, Lab/P;->f(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance p0, Lcom/eightsleep/data_device/exceptions/OfflineApiException$FailedToParseResponseException;

    invoke-direct {p0, v3}, Lcom/eightsleep/data_device/exceptions/OfflineApiException$FailedToParseResponseException;-><init>(I)V

    throw p0

    :catchall_0
    move-exception p0

    :try_start_4
    throw p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception p1

    invoke-static {p4, p0}, LP2/F;->w(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw p1

    :cond_5
    new-instance p0, Lcom/eightsleep/data_device/exceptions/OfflineApiException$IncorrectResponseVersionException;

    invoke-direct {p0, v3}, Lcom/eightsleep/data_device/exceptions/OfflineApiException$IncorrectResponseVersionException;-><init>(I)V

    throw p0

    :cond_6
    new-instance p0, Lcom/eightsleep/data_device/exceptions/OfflineApiException$MalformedResponseException;

    invoke-direct {p0, v3}, Lcom/eightsleep/data_device/exceptions/OfflineApiException$MalformedResponseException;-><init>(I)V

    throw p0

    :goto_3
    new-instance p2, Lcom/eightsleep/data_device/exceptions/OfflineApiException$StaleGattProfileException;

    invoke-direct {p2, v3}, Lcom/eightsleep/data_device/exceptions/OfflineApiException$StaleGattProfileException;-><init>(I)V

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    new-instance p3, Ljava/lang/StringBuilder;

    const-string p4, "Dropping the peripheral so the next command rediscovers: "

    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1, p2}, Lab/P;->f(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2
.end method

.method public static c(Lab/P;Ljava/lang/String;)Lzo/x;
    .locals 3

    invoke-virtual {p0}, Lab/P;->d()LCo/c;

    move-result-object v0

    new-instance v1, Lab/y;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v0, v2}, Lab/y;-><init>(Lab/P;Ljava/lang/String;LCo/c;LLm/c;)V

    new-instance p1, Lzo/u0;

    invoke-direct {p1, v1}, Lzo/u0;-><init>(LVm/n;)V

    new-instance v0, Lab/t;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v2, v1}, Lab/t;-><init>(Lab/P;LLm/c;I)V

    new-instance p0, Lzo/x;

    invoke-direct {p0, p1, v0}, Lzo/x;-><init>(Lzo/l;LVm/o;)V

    return-object p0
.end method

.method public static f(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 3

    instance-of v0, p1, Lcom/eightsleep/data_device/exceptions/BluetoothApiException$BluetoothPermissionException;

    const/4 v1, 0x0

    const-string v2, "OfflineApi"

    if-nez v0, :cond_1

    instance-of v0, p1, Lcom/eightsleep/data_device/exceptions/BluetoothApiException$BluetoothDisabledException;

    if-nez v0, :cond_1

    instance-of v0, p1, Lcom/eightsleep/data_device/exceptions/OfflineApiException$StaleGattProfileException;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    sget-object v0, Ltimber/log/Timber;->a:Lbr/a;

    invoke-virtual {v0, v2}, Lbr/a;->p(Ljava/lang/String;)V

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p0, p1, v1}, Lbr/a;->c(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    return-void

    :cond_1
    :goto_0
    sget-object v0, Ltimber/log/Timber;->a:Lbr/a;

    invoke-virtual {v0, v2}, Lbr/a;->p(Ljava/lang/String;)V

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p0, p1, v1}, Lbr/a;->k(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final d()LCo/c;
    .locals 1

    iget-object p0, p0, Lab/P;->c:LCo/c;

    invoke-static {}, Lwo/C;->d()Lwo/i0;

    move-result-object v0

    iget-object p0, p0, LCo/c;->a:LLm/h;

    invoke-interface {p0, v0}, LLm/h;->plus(LLm/h;)LLm/h;

    move-result-object p0

    invoke-static {p0}, Lwo/C;->c(LLm/h;)LCo/c;

    move-result-object p0

    return-object p0
.end method

.method public final e(LVm/k;)Lzo/x;
    .locals 3

    new-instance v0, Lab/D;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lab/D;-><init>(Lab/P;LVm/k;LLm/c;)V

    new-instance p1, Lzo/u0;

    invoke-direct {p1, v0}, Lzo/u0;-><init>(LVm/n;)V

    new-instance v0, Lab/t;

    const/4 v2, 0x4

    invoke-direct {v0, p0, v1, v2}, Lab/t;-><init>(Lab/P;LLm/c;I)V

    new-instance p0, Lzo/x;

    invoke-direct {p0, p1, v0}, Lzo/x;-><init>(Lzo/l;LVm/o;)V

    return-object p0
.end method
