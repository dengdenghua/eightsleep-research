.class public final Lcb/R0;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public a:I

.field public synthetic b:Ljava/lang/Object;

.field public final synthetic c:Lcom/eightsleep/data_device/data/repository/OfflineRepository;

.field public final synthetic d:Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;


# direct methods
.method public constructor <init>(Lcom/eightsleep/data_device/data/repository/OfflineRepository;Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;LLm/c;)V
    .locals 0

    iput-object p1, p0, Lcb/R0;->c:Lcom/eightsleep/data_device/data/repository/OfflineRepository;

    iput-object p2, p0, Lcb/R0;->d:Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 2

    new-instance v0, Lcb/R0;

    iget-object v1, p0, Lcb/R0;->c:Lcom/eightsleep/data_device/data/repository/OfflineRepository;

    iget-object p0, p0, Lcb/R0;->d:Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;

    invoke-direct {v0, v1, p0, p2}, Lcb/R0;-><init>(Lcom/eightsleep/data_device/data/repository/OfflineRepository;Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;LLm/c;)V

    iput-object p1, v0, Lcb/R0;->b:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lcom/eightsleep/data_device/data/model/ble/DeviceKeyResponse;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lcb/R0;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lcb/R0;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lcb/R0;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, Lcb/R0;->a:I

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

    iget-object p1, p0, Lcb/R0;->b:Ljava/lang/Object;

    check-cast p1, Lcom/eightsleep/data_device/data/model/ble/DeviceKeyResponse;

    invoke-virtual {p1}, Lcom/eightsleep/data_device/data/model/ble/DeviceKeyResponse;->toDomain()Lcom/eightsleep/data_device/data/model/offline/OfflineSecurityKey;

    move-result-object p1

    iput v2, p0, Lcb/R0;->a:I

    iget-object v1, p0, Lcb/R0;->c:Lcom/eightsleep/data_device/data/repository/OfflineRepository;

    iget-object v2, p0, Lcb/R0;->d:Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;

    invoke-static {v1, v2, p1, p0}, Lcom/eightsleep/data_device/data/repository/OfflineRepository;->access$saveOfflineDataForDevice(Lcom/eightsleep/data_device/data/repository/OfflineRepository;Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;Lcom/eightsleep/data_device/data/model/offline/OfflineSecurityKey;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_2

    return-object v0

    :cond_2
    return-object p0
.end method
