.class public final Lcb/Q0;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public a:I

.field public synthetic b:Ljava/lang/Object;

.field public final synthetic c:Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;

.field public final synthetic d:Lcom/eightsleep/data_device/data/model/ble/DeviceTokenResponse;


# direct methods
.method public constructor <init>(Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;Lcom/eightsleep/data_device/data/model/ble/DeviceTokenResponse;LLm/c;)V
    .locals 0

    iput-object p1, p0, Lcb/Q0;->c:Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;

    iput-object p2, p0, Lcb/Q0;->d:Lcom/eightsleep/data_device/data/model/ble/DeviceTokenResponse;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 2

    new-instance v0, Lcb/Q0;

    iget-object v1, p0, Lcb/Q0;->c:Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;

    iget-object p0, p0, Lcb/Q0;->d:Lcom/eightsleep/data_device/data/model/ble/DeviceTokenResponse;

    invoke-direct {v0, v1, p0, p2}, Lcb/Q0;-><init>(Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;Lcom/eightsleep/data_device/data/model/ble/DeviceTokenResponse;LLm/c;)V

    iput-object p1, v0, Lcb/Q0;->b:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lab/o;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lcb/Q0;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lcb/Q0;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lcb/Q0;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, Lcb/Q0;->a:I

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    if-ne v1, v2, :cond_0

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    return-object p1

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lcb/Q0;->b:Ljava/lang/Object;

    check-cast p1, Lab/o;

    iget-object v1, p0, Lcb/Q0;->c:Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;

    invoke-virtual {v1}, Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    new-instance v3, Lcom/eightsleep/data_device/data/model/ble/GetDeviceKeyRequest;

    iget-object v4, p0, Lcb/Q0;->d:Lcom/eightsleep/data_device/data/model/ble/DeviceTokenResponse;

    invoke-virtual {v4}, Lcom/eightsleep/data_device/data/model/ble/DeviceTokenResponse;->getNonce()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/eightsleep/data_device/data/model/ble/GetDeviceKeyRequest;-><init>(Ljava/lang/String;)V

    iput v2, p0, Lcb/Q0;->a:I

    invoke-interface {p1, v1, v3, p0}, Lab/o;->e(Ljava/lang/String;Lcom/eightsleep/data_device/data/model/ble/GetDeviceKeyRequest;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_2

    return-object v0

    :cond_2
    return-object p0
.end method
