.class public final LYd/n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzo/l;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lzo/l;

.field public final synthetic c:LNa/b;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lzo/l;LNa/b;Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0

    iput p5, p0, LYd/n;->a:I

    iput-object p1, p0, LYd/n;->b:Lzo/l;

    iput-object p2, p0, LYd/n;->c:LNa/b;

    iput-object p3, p0, LYd/n;->d:Ljava/lang/Object;

    iput-object p4, p0, LYd/n;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final collect(Lzo/m;LLm/c;)Ljava/lang/Object;
    .locals 7

    iget v0, p0, LYd/n;->a:I

    packed-switch v0, :pswitch_data_0

    new-instance v1, LAo/l;

    iget-object v0, p0, LYd/n;->e:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Ljava/time/LocalDate;

    iget-object v0, p0, LYd/n;->c:LNa/b;

    move-object v3, v0

    check-cast v3, Lcom/eightsleep/data_metrics/data/repository/MetricsTrendsRepository;

    iget-object v0, p0, LYd/n;->d:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Ljava/lang/String;

    const/16 v6, 0xa

    move-object v2, p1

    invoke-direct/range {v1 .. v6}, LAo/l;-><init>(Lzo/m;LNa/b;Ljava/lang/Object;Ljava/lang/Object;I)V

    iget-object p0, p0, LYd/n;->b:Lzo/l;

    invoke-interface {p0, v1, p2}, Lzo/l;->collect(Lzo/m;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    if-ne p0, p1, :cond_0

    goto :goto_0

    :cond_0
    sget-object p0, LHm/B;->a:LHm/B;

    :goto_0
    return-object p0

    :pswitch_0
    move-object v1, p1

    new-instance v0, LAo/l;

    iget-object p1, p0, LYd/n;->c:LNa/b;

    move-object v2, p1

    check-cast v2, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;

    iget-object p1, p0, LYd/n;->d:Ljava/lang/Object;

    move-object v3, p1

    check-cast v3, Ljava/util/List;

    iget-object p1, p0, LYd/n;->e:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    const/16 v5, 0x8

    invoke-direct/range {v0 .. v5}, LAo/l;-><init>(Lzo/m;LNa/b;Ljava/lang/Object;Ljava/lang/Object;I)V

    iget-object p0, p0, LYd/n;->b:Lzo/l;

    invoke-interface {p0, v0, p2}, Lzo/l;->collect(Lzo/m;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    if-ne p0, p1, :cond_1

    goto :goto_1

    :cond_1
    sget-object p0, LHm/B;->a:LHm/B;

    :goto_1
    return-object p0

    :pswitch_1
    move-object v1, p1

    new-instance v0, LAo/l;

    iget-object p1, p0, LYd/n;->d:Ljava/lang/Object;

    move-object v3, p1

    check-cast v3, Ljava/lang/String;

    iget-object p1, p0, LYd/n;->e:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Ljava/lang/String;

    iget-object p1, p0, LYd/n;->c:LNa/b;

    move-object v2, p1

    check-cast v2, Lcom/eightsleep/data_jetlag/data/repository/JetLagPlanRepository;

    const/4 v5, 0x7

    invoke-direct/range {v0 .. v5}, LAo/l;-><init>(Lzo/m;LNa/b;Ljava/lang/Object;Ljava/lang/Object;I)V

    iget-object p0, p0, LYd/n;->b:Lzo/l;

    invoke-interface {p0, v0, p2}, Lzo/l;->collect(Lzo/m;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    if-ne p0, p1, :cond_2

    goto :goto_2

    :cond_2
    sget-object p0, LHm/B;->a:LHm/B;

    :goto_2
    return-object p0

    :pswitch_2
    move-object v1, p1

    new-instance v0, LAo/l;

    iget-object p1, p0, LYd/n;->e:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Lcom/eightsleep/data_device/data/model/offline/OfflineModeData;

    iget-object p1, p0, LYd/n;->c:LNa/b;

    move-object v2, p1

    check-cast v2, Lcom/eightsleep/data_device/data/repository/OfflineRepository;

    iget-object p1, p0, LYd/n;->d:Ljava/lang/Object;

    move-object v3, p1

    check-cast v3, Lcom/eightsleep/data_device/data/model/ble/HubPeripheral;

    const/4 v5, 0x6

    invoke-direct/range {v0 .. v5}, LAo/l;-><init>(Lzo/m;LNa/b;Ljava/lang/Object;Ljava/lang/Object;I)V

    iget-object p0, p0, LYd/n;->b:Lzo/l;

    invoke-interface {p0, v0, p2}, Lzo/l;->collect(Lzo/m;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    if-ne p0, p1, :cond_3

    goto :goto_3

    :cond_3
    sget-object p0, LHm/B;->a:LHm/B;

    :goto_3
    return-object p0

    :pswitch_3
    move-object v1, p1

    new-instance v0, LAo/l;

    iget-object p1, p0, LYd/n;->d:Ljava/lang/Object;

    move-object v3, p1

    check-cast v3, Ljava/lang/String;

    iget-object p1, p0, LYd/n;->e:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Ljava/lang/String;

    iget-object p1, p0, LYd/n;->c:LNa/b;

    move-object v2, p1

    check-cast v2, Lcom/eightsleep/data_wismo/data/repository/OrderRepository;

    const/4 v5, 0x5

    invoke-direct/range {v0 .. v5}, LAo/l;-><init>(Lzo/m;LNa/b;Ljava/lang/Object;Ljava/lang/Object;I)V

    iget-object p0, p0, LYd/n;->b:Lzo/l;

    invoke-interface {p0, v0, p2}, Lzo/l;->collect(Lzo/m;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    if-ne p0, p1, :cond_4

    goto :goto_4

    :cond_4
    sget-object p0, LHm/B;->a:LHm/B;

    :goto_4
    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
