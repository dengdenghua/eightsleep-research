.class public final Lcb/S0;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public synthetic a:Ljava/lang/Object;

.field public final synthetic b:Lcom/eightsleep/data_device/data/repository/OfflineRepository;

.field public final synthetic c:Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;


# direct methods
.method public constructor <init>(Lcom/eightsleep/data_device/data/repository/OfflineRepository;Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;LLm/c;)V
    .locals 0

    iput-object p1, p0, Lcb/S0;->b:Lcom/eightsleep/data_device/data/repository/OfflineRepository;

    iput-object p2, p0, Lcb/S0;->c:Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 2

    new-instance v0, Lcb/S0;

    iget-object v1, p0, Lcb/S0;->b:Lcom/eightsleep/data_device/data/repository/OfflineRepository;

    iget-object p0, p0, Lcb/S0;->c:Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;

    invoke-direct {v0, v1, p0, p2}, Lcb/S0;-><init>(Lcom/eightsleep/data_device/data/repository/OfflineRepository;Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;LLm/c;)V

    iput-object p1, v0, Lcb/S0;->a:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lcom/eightsleep/data_device/data/model/ble/DeviceTokenResponse;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lcb/S0;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lcb/S0;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lcb/S0;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lcb/S0;->a:Ljava/lang/Object;

    check-cast p1, Lcom/eightsleep/data_device/data/model/ble/DeviceTokenResponse;

    iget-object v0, p0, Lcb/S0;->b:Lcom/eightsleep/data_device/data/repository/OfflineRepository;

    invoke-virtual {v0}, Lcom/eightsleep/data_device/data/repository/OfflineRepository;->getApi()Lab/o;

    move-result-object v1

    new-instance v2, Lcb/Q0;

    iget-object p0, p0, Lcb/S0;->c:Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;

    const/4 v3, 0x0

    invoke-direct {v2, p0, p1, v3}, Lcb/Q0;-><init>(Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;Lcom/eightsleep/data_device/data/model/ble/DeviceTokenResponse;LLm/c;)V

    const/4 p1, 0x3

    invoke-static {v0, v1, v3, v2, p1}, LP2/b;->t(LNa/b;Ljava/lang/Object;LKa/c;LVm/n;I)Lzo/l;

    move-result-object v1

    new-instance v2, Lcb/R0;

    invoke-direct {v2, v0, p0, v3}, Lcb/R0;-><init>(Lcom/eightsleep/data_device/data/repository/OfflineRepository;Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;LLm/c;)V

    invoke-static {v1, v3, v2, p1}, LP2/q;->t(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object p0

    return-object p0
.end method
