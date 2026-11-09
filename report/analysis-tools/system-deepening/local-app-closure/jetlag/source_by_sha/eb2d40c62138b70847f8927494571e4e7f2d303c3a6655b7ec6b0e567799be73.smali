.class public final Lkc/c;
.super LE4/i;
.source "SourceFile"


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Lkc/d;


# direct methods
.method public synthetic constructor <init>(Lkc/d;Lcom/eightsleep/eight/AppDatabase_Impl;I)V
    .locals 0

    iput p3, p0, Lkc/c;->e:I

    iput-object p1, p0, Lkc/c;->f:Lkc/d;

    invoke-direct {p0, p2}, LE4/C;-><init>(LE4/t;)V

    return-void
.end method


# virtual methods
.method public final f()Ljava/lang/String;
    .locals 0

    iget p0, p0, Lkc/c;->e:I

    packed-switch p0, :pswitch_data_0

    const-string p0, "INSERT OR REPLACE INTO `jet_lag_plan_task` (`id`,`planId`,`name`,`type`,`phase`,`scheduledAt`,`timezoneId`,`instructions`,`status`,`metadata`) VALUES (?,?,?,?,?,?,?,?,?,?)"

    return-object p0

    :pswitch_0
    const-string p0, "INSERT OR REPLACE INTO `jet_lag_plan` (`id`,`userId`,`tripId`,`direction`,`supplementsEnabled`,`createdAt`,`status`,`startDate`,`endDate`) VALUES (?,?,?,?,?,?,?,?,?)"

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final x(LL4/f;Ljava/lang/Object;)V
    .locals 3

    iget v0, p0, Lkc/c;->e:I

    packed-switch v0, :pswitch_data_0

    check-cast p2, Llc/c;

    iget-object v0, p2, Llc/c;->a:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-interface {p1, v1, v0}, LL4/d;->g(ILjava/lang/String;)V

    const/4 v0, 0x2

    iget-object v1, p2, Llc/c;->b:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, LL4/d;->g(ILjava/lang/String;)V

    const/4 v0, 0x3

    iget-object v1, p2, Llc/c;->c:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, LL4/d;->g(ILjava/lang/String;)V

    iget-object p0, p0, Lkc/c;->f:Lkc/d;

    invoke-virtual {p0}, Lkc/d;->b()Ljc/a;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "type"

    iget-object v1, p2, Llc/c;->d:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x4

    invoke-interface {p1, v1, v0}, LL4/d;->g(ILjava/lang/String;)V

    invoke-virtual {p0}, Lkc/d;->b()Ljc/a;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "phase"

    iget-object v1, p2, Llc/c;->e:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x5

    invoke-interface {p1, v1, v0}, LL4/d;->g(ILjava/lang/String;)V

    invoke-virtual {p0}, Lkc/d;->c()Lxc/g;

    move-result-object v0

    iget-object v1, p2, Llc/c;->f:Ljava/time/Instant;

    invoke-virtual {v0, v1}, Lxc/g;->a(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x6

    invoke-interface {p1, v1, v0}, LL4/d;->g(ILjava/lang/String;)V

    const/4 v0, 0x7

    iget-object v1, p2, Llc/c;->g:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, LL4/d;->g(ILjava/lang/String;)V

    const/16 v0, 0x8

    iget-object v1, p2, Llc/c;->h:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, LL4/d;->g(ILjava/lang/String;)V

    invoke-virtual {p0}, Lkc/d;->b()Ljc/a;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "status"

    iget-object v1, p2, Llc/c;->i:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x9

    invoke-interface {p1, v1, v0}, LL4/d;->g(ILjava/lang/String;)V

    invoke-virtual {p0}, Lkc/d;->b()Ljc/a;

    move-result-object p0

    iget-object p0, p0, Ljc/a;->a:Lcom/squareup/moshi/Moshi;

    const-class v0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;

    invoke-virtual {p0, v0}, Lcom/squareup/moshi/Moshi;->adapter(Ljava/lang/Class;)Lcom/squareup/moshi/JsonAdapter;

    move-result-object p0

    const-string v0, "adapter(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p2, p2, Llc/c;->j:Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;

    if-eqz p2, :cond_0

    invoke-virtual {p0, p2}, Lcom/squareup/moshi/JsonAdapter;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    const/16 p2, 0xa

    if-nez p0, :cond_1

    invoke-interface {p1, p2}, LL4/d;->M(I)V

    goto :goto_1

    :cond_1
    invoke-interface {p1, p2, p0}, LL4/d;->g(ILjava/lang/String;)V

    :goto_1
    return-void

    :pswitch_0
    check-cast p2, Llc/a;

    iget-object v0, p2, Llc/a;->a:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-interface {p1, v1, v0}, LL4/d;->g(ILjava/lang/String;)V

    const/4 v0, 0x2

    iget-object v1, p2, Llc/a;->b:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, LL4/d;->g(ILjava/lang/String;)V

    const/4 v0, 0x3

    iget-object v1, p2, Llc/a;->c:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, LL4/d;->g(ILjava/lang/String;)V

    iget-object p0, p0, Lkc/c;->f:Lkc/d;

    invoke-virtual {p0}, Lkc/d;->b()Ljc/a;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "travelDirection"

    iget-object v1, p2, Llc/a;->d:Lcom/eightsleep/data_jetlag/enums/TravelDirection;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x4

    invoke-interface {p1, v1, v0}, LL4/d;->g(ILjava/lang/String;)V

    iget-boolean v0, p2, Llc/a;->e:Z

    int-to-long v0, v0

    const/4 v2, 0x5

    invoke-interface {p1, v2, v0, v1}, LL4/d;->w(IJ)V

    invoke-virtual {p0}, Lkc/d;->c()Lxc/g;

    move-result-object v0

    iget-object v1, p2, Llc/a;->f:Ljava/time/Instant;

    invoke-virtual {v0, v1}, Lxc/g;->a(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x6

    invoke-interface {p1, v1, v0}, LL4/d;->g(ILjava/lang/String;)V

    const/4 v0, 0x7

    iget-object v1, p2, Llc/a;->g:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, LL4/d;->g(ILjava/lang/String;)V

    invoke-virtual {p0}, Lkc/d;->c()Lxc/g;

    move-result-object v0

    iget-object v1, p2, Llc/a;->h:Ljava/time/LocalDate;

    invoke-virtual {v0, v1}, Lxc/g;->b(Ljava/time/LocalDate;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x8

    invoke-interface {p1, v1, v0}, LL4/d;->g(ILjava/lang/String;)V

    invoke-virtual {p0}, Lkc/d;->c()Lxc/g;

    move-result-object p0

    iget-object p2, p2, Llc/a;->i:Ljava/time/LocalDate;

    invoke-virtual {p0, p2}, Lxc/g;->b(Ljava/time/LocalDate;)Ljava/lang/String;

    move-result-object p0

    const/16 p2, 0x9

    invoke-interface {p1, p2, p0}, LL4/d;->g(ILjava/lang/String;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
