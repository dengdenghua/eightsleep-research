.class public final Lj9/F;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public a:I

.field public synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/eightsleep/data_alarm/data/repository/AlarmRepository;


# direct methods
.method public constructor <init>(LLm/c;Lcom/eightsleep/data_alarm/data/repository/AlarmRepository;Ljava/lang/String;)V
    .locals 0

    iput-object p3, p0, Lj9/F;->c:Ljava/lang/String;

    iput-object p2, p0, Lj9/F;->d:Lcom/eightsleep/data_alarm/data/repository/AlarmRepository;

    const/4 p2, 0x2

    invoke-direct {p0, p2, p1}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 2

    new-instance v0, Lj9/F;

    iget-object v1, p0, Lj9/F;->c:Ljava/lang/String;

    iget-object p0, p0, Lj9/F;->d:Lcom/eightsleep/data_alarm/data/repository/AlarmRepository;

    invoke-direct {v0, p2, p0, v1}, Lj9/F;-><init>(LLm/c;Lcom/eightsleep/data_alarm/data/repository/AlarmRepository;Ljava/lang/String;)V

    iput-object p1, v0, Lj9/F;->b:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lcom/eightsleep/data_alarm/data/model/NapModeAlarmSettingsNetwork;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lj9/F;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lj9/F;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lj9/F;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, Lj9/F;->a:I

    sget-object v2, LHm/B;->a:LHm/B;

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    if-ne v1, v3, :cond_0

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_1

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, Lj9/F;->b:Ljava/lang/Object;

    check-cast p1, Lcom/eightsleep/data_alarm/data/model/NapModeAlarmSettingsNetwork;

    iget-object v1, p0, Lj9/F;->c:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/eightsleep/data_alarm/data/model/NapModeAlarmSettingsNetwork;->toEntity(Ljava/lang/String;)Lp9/d;

    move-result-object p1

    iget-object v1, p0, Lj9/F;->d:Lcom/eightsleep/data_alarm/data/repository/AlarmRepository;

    invoke-static {v1}, Lcom/eightsleep/data_alarm/data/repository/AlarmRepository;->access$getAlarmCache$p(Lcom/eightsleep/data_alarm/data/repository/AlarmRepository;)Ln9/b;

    move-result-object v1

    iput v3, p0, Lj9/F;->a:I

    iget-object v1, v1, Ln9/b;->b:Lo9/h;

    new-instance v3, Laa/e;

    const/16 v4, 0x19

    invoke-direct {v3, v4, v1, p1}, Laa/e;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    iget-object p1, v1, Lo9/h;->b:Ljava/lang/Object;

    check-cast p1, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-static {p1, v3, p0}, LP2/A;->K(LE4/t;Ljava/util/concurrent/Callable;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_2

    goto :goto_0

    :cond_2
    move-object p0, v2

    :goto_0
    if-ne p0, v0, :cond_3

    return-object v0

    :cond_3
    :goto_1
    return-object v2
.end method
