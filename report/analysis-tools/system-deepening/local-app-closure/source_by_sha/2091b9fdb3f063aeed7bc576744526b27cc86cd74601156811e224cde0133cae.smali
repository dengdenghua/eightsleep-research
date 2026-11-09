.class public final Lj9/E;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public a:I

.field public synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll9/f;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ll9/f;LLm/c;)V
    .locals 0

    iput-object p1, p0, Lj9/E;->c:Ljava/lang/String;

    iput-object p2, p0, Lj9/E;->d:Ll9/f;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 2

    new-instance v0, Lj9/E;

    iget-object v1, p0, Lj9/E;->c:Ljava/lang/String;

    iget-object p0, p0, Lj9/E;->d:Ll9/f;

    invoke-direct {v0, v1, p0, p2}, Lj9/E;-><init>(Ljava/lang/String;Ll9/f;LLm/c;)V

    iput-object p1, v0, Lj9/E;->b:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Li9/a;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, Lj9/E;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, Lj9/E;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, Lj9/E;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    sget-object v0, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v1, p0, Lj9/E;->a:I

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

    iget-object p1, p0, Lj9/E;->b:Ljava/lang/Object;

    check-cast p1, Li9/a;

    new-instance v3, Lcom/eightsleep/data_alarm/data/model/NapModeAlarmSettingsNetwork;

    iget-object v1, p0, Lj9/E;->d:Ll9/f;

    iget-object v4, v1, Ll9/f;->a:Lcom/eightsleep/data_alarm/enums/VibrationPower;

    invoke-virtual {v4}, Lcom/eightsleep/data_alarm/enums/VibrationPower;->getLevel()I

    move-result v4

    iget-boolean v8, v1, Ll9/f;->e:Z

    iget-object v9, v1, Ll9/f;->f:Ljava/lang/Integer;

    iget-object v5, v1, Ll9/f;->b:Lcom/eightsleep/data_alarm/enums/VibrationPattern;

    iget-boolean v6, v1, Ll9/f;->c:Z

    iget-object v7, v1, Ll9/f;->d:Ljava/lang/String;

    invoke-direct/range {v3 .. v9}, Lcom/eightsleep/data_alarm/data/model/NapModeAlarmSettingsNetwork;-><init>(ILcom/eightsleep/data_alarm/enums/VibrationPattern;ZLjava/lang/String;ZLjava/lang/Integer;)V

    iput v2, p0, Lj9/E;->a:I

    iget-object v1, p0, Lj9/E;->c:Ljava/lang/String;

    invoke-interface {p1, v1, v3, p0}, Li9/a;->g(Ljava/lang/String;Lcom/eightsleep/data_alarm/data/model/NapModeAlarmSettingsNetwork;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_2

    return-object v0

    :cond_2
    return-object p0
.end method
