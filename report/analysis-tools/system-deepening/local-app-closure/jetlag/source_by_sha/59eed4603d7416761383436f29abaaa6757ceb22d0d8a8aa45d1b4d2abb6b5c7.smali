.class public final Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lcom/squareup/moshi/JsonClass;
    generateAdapter = true
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000J\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0015\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0013\u0008\u0087\u0008\u0018\u00002\u00020\u0001BW\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0002\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\u0008\u0012\u0006\u0010\n\u001a\u00020\u0002\u0012\u0006\u0010\u000b\u001a\u00020\u0002\u0012\u0006\u0010\r\u001a\u00020\u000c\u0012\u0006\u0010\u000f\u001a\u00020\u000e\u0012\u0006\u0010\u0011\u001a\u00020\u0010\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\r\u0010\u0015\u001a\u00020\u0014\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u0010\u0010\u0017\u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u0010\u0010\u0019\u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008\u0019\u0010\u0018J\u0010\u0010\u001a\u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008\u001a\u0010\u0018J\u0010\u0010\u001b\u001a\u00020\u0006H\u00c6\u0003\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0008H\u00c6\u0003\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008\u001f\u0010\u0018J\u0010\u0010 \u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008 \u0010\u0018J\u0010\u0010!\u001a\u00020\u000cH\u00c6\u0003\u00a2\u0006\u0004\u0008!\u0010\"J\u0010\u0010#\u001a\u00020\u000eH\u00c6\u0003\u00a2\u0006\u0004\u0008#\u0010$J\u0010\u0010%\u001a\u00020\u0010H\u00c6\u0003\u00a2\u0006\u0004\u0008%\u0010&Jt\u0010\'\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0003\u001a\u00020\u00022\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00022\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u00022\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00062\u0008\u0008\u0002\u0010\t\u001a\u00020\u00082\u0008\u0008\u0002\u0010\n\u001a\u00020\u00022\u0008\u0008\u0002\u0010\u000b\u001a\u00020\u00022\u0008\u0008\u0002\u0010\r\u001a\u00020\u000c2\u0008\u0008\u0002\u0010\u000f\u001a\u00020\u000e2\u0008\u0008\u0002\u0010\u0011\u001a\u00020\u0010H\u00c6\u0001\u00a2\u0006\u0004\u0008\'\u0010(J\u0010\u0010)\u001a\u00020\u0002H\u00d6\u0001\u00a2\u0006\u0004\u0008)\u0010\u0018J\u0010\u0010+\u001a\u00020*H\u00d6\u0001\u00a2\u0006\u0004\u0008+\u0010,J\u001a\u0010/\u001a\u00020.2\u0008\u0010-\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003\u00a2\u0006\u0004\u0008/\u00100R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0003\u00101\u001a\u0004\u00082\u0010\u0018R\u0017\u0010\u0004\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0004\u00101\u001a\u0004\u00083\u0010\u0018R\u0017\u0010\u0005\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0005\u00101\u001a\u0004\u00084\u0010\u0018R\u0017\u0010\u0007\u001a\u00020\u00068\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0007\u00105\u001a\u0004\u00086\u0010\u001cR\u0017\u0010\t\u001a\u00020\u00088\u0006\u00a2\u0006\u000c\n\u0004\u0008\t\u00107\u001a\u0004\u00088\u0010\u001eR\u0017\u0010\n\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\n\u00101\u001a\u0004\u00089\u0010\u0018R\u0017\u0010\u000b\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000b\u00101\u001a\u0004\u0008:\u0010\u0018R\u0017\u0010\r\u001a\u00020\u000c8\u0006\u00a2\u0006\u000c\n\u0004\u0008\r\u0010;\u001a\u0004\u0008<\u0010\"R\u0017\u0010\u000f\u001a\u00020\u000e8\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000f\u0010=\u001a\u0004\u0008>\u0010$R\u0017\u0010\u0011\u001a\u00020\u00108\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0011\u0010?\u001a\u0004\u0008@\u0010&\u00a8\u0006A"
    }
    d2 = {
        "Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;",
        "",
        "",
        "planId",
        "taskId",
        "name",
        "Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;",
        "type",
        "Ljava/time/Instant;",
        "scheduledAt",
        "timezoneId",
        "instructions",
        "Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;",
        "phase",
        "Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;",
        "status",
        "Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;",
        "metadata",
        "<init>",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;)V",
        "Llc/c;",
        "toEntity",
        "()Llc/c;",
        "component1",
        "()Ljava/lang/String;",
        "component2",
        "component3",
        "component4",
        "()Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;",
        "component5",
        "()Ljava/time/Instant;",
        "component6",
        "component7",
        "component8",
        "()Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;",
        "component9",
        "()Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;",
        "component10",
        "()Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;",
        "copy",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;)Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;",
        "toString",
        "",
        "hashCode",
        "()I",
        "other",
        "",
        "equals",
        "(Ljava/lang/Object;)Z",
        "Ljava/lang/String;",
        "getPlanId",
        "getTaskId",
        "getName",
        "Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;",
        "getType",
        "Ljava/time/Instant;",
        "getScheduledAt",
        "getTimezoneId",
        "getInstructions",
        "Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;",
        "getPhase",
        "Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;",
        "getStatus",
        "Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;",
        "getMetadata",
        "data-jetlag_tencentRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final instructions:Ljava/lang/String;

.field private final metadata:Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;

.field private final name:Ljava/lang/String;

.field private final phase:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

.field private final planId:Ljava/lang/String;

.field private final scheduledAt:Ljava/time/Instant;

.field private final status:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

.field private final taskId:Ljava/lang/String;

.field private final timezoneId:Ljava/lang/String;

.field private final type:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;)V
    .locals 1

    const-string v0, "planId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "taskId"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "name"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "type"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "scheduledAt"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "timezoneId"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "instructions"

    invoke-static {p7, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "phase"

    invoke-static {p8, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "status"

    invoke-static {p9, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "metadata"

    invoke-static {p10, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->planId:Ljava/lang/String;

    iput-object p2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->taskId:Ljava/lang/String;

    iput-object p3, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->name:Ljava/lang/String;

    iput-object p4, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->type:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    iput-object p5, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->scheduledAt:Ljava/time/Instant;

    iput-object p6, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->timezoneId:Ljava/lang/String;

    iput-object p7, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->instructions:Ljava/lang/String;

    iput-object p8, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->phase:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    iput-object p9, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->status:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    iput-object p10, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->metadata:Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;

    return-void
.end method

.method public static synthetic copy$default(Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;ILjava/lang/Object;)Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;
    .locals 0

    and-int/lit8 p12, p11, 0x1

    if-eqz p12, :cond_0

    iget-object p1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->planId:Ljava/lang/String;

    :cond_0
    and-int/lit8 p12, p11, 0x2

    if-eqz p12, :cond_1

    iget-object p2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->taskId:Ljava/lang/String;

    :cond_1
    and-int/lit8 p12, p11, 0x4

    if-eqz p12, :cond_2

    iget-object p3, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->name:Ljava/lang/String;

    :cond_2
    and-int/lit8 p12, p11, 0x8

    if-eqz p12, :cond_3

    iget-object p4, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->type:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    :cond_3
    and-int/lit8 p12, p11, 0x10

    if-eqz p12, :cond_4

    iget-object p5, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->scheduledAt:Ljava/time/Instant;

    :cond_4
    and-int/lit8 p12, p11, 0x20

    if-eqz p12, :cond_5

    iget-object p6, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->timezoneId:Ljava/lang/String;

    :cond_5
    and-int/lit8 p12, p11, 0x40

    if-eqz p12, :cond_6

    iget-object p7, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->instructions:Ljava/lang/String;

    :cond_6
    and-int/lit16 p12, p11, 0x80

    if-eqz p12, :cond_7

    iget-object p8, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->phase:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    :cond_7
    and-int/lit16 p12, p11, 0x100

    if-eqz p12, :cond_8

    iget-object p9, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->status:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    :cond_8
    and-int/lit16 p11, p11, 0x200

    if-eqz p11, :cond_9

    iget-object p10, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->metadata:Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;

    :cond_9
    move-object p11, p9

    move-object p12, p10

    move-object p9, p7

    move-object p10, p8

    move-object p7, p5

    move-object p8, p6

    move-object p5, p3

    move-object p6, p4

    move-object p3, p1

    move-object p4, p2

    move-object p2, p0

    invoke-virtual/range {p2 .. p12}, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->copy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;)Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->planId:Ljava/lang/String;

    return-object p0
.end method

.method public final component10()Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->metadata:Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;

    return-object p0
.end method

.method public final component2()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->taskId:Ljava/lang/String;

    return-object p0
.end method

.method public final component3()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->name:Ljava/lang/String;

    return-object p0
.end method

.method public final component4()Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->type:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    return-object p0
.end method

.method public final component5()Ljava/time/Instant;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->scheduledAt:Ljava/time/Instant;

    return-object p0
.end method

.method public final component6()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->timezoneId:Ljava/lang/String;

    return-object p0
.end method

.method public final component7()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->instructions:Ljava/lang/String;

    return-object p0
.end method

.method public final component8()Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->phase:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    return-object p0
.end method

.method public final component9()Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->status:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    return-object p0
.end method

.method public final copy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;)Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;
    .locals 11

    const-string p0, "planId"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "taskId"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "name"

    invoke-static {p3, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "type"

    invoke-static {p4, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "scheduledAt"

    move-object/from16 v5, p5

    invoke-static {v5, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "timezoneId"

    move-object/from16 v6, p6

    invoke-static {v6, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "instructions"

    move-object/from16 v7, p7

    invoke-static {v7, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "phase"

    move-object/from16 v8, p8

    invoke-static {v8, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "status"

    move-object/from16 v9, p9

    invoke-static {v9, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "metadata"

    move-object/from16 v10, p10

    invoke-static {v10, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v10}, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;

    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->planId:Ljava/lang/String;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->planId:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->taskId:Ljava/lang/String;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->taskId:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->name:Ljava/lang/String;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->name:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    :cond_4
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->type:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->type:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    if-eq v1, v3, :cond_5

    return v2

    :cond_5
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->scheduledAt:Ljava/time/Instant;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->scheduledAt:Ljava/time/Instant;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    return v2

    :cond_6
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->timezoneId:Ljava/lang/String;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->timezoneId:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    return v2

    :cond_7
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->instructions:Ljava/lang/String;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->instructions:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    return v2

    :cond_8
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->phase:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->phase:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    if-eq v1, v3, :cond_9

    return v2

    :cond_9
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->status:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->status:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    if-eq v1, v3, :cond_a

    return v2

    :cond_a
    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->metadata:Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;

    iget-object p1, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->metadata:Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b

    return v2

    :cond_b
    return v0
.end method

.method public final getInstructions()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->instructions:Ljava/lang/String;

    return-object p0
.end method

.method public final getMetadata()Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->metadata:Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;

    return-object p0
.end method

.method public final getName()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->name:Ljava/lang/String;

    return-object p0
.end method

.method public final getPhase()Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->phase:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    return-object p0
.end method

.method public final getPlanId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->planId:Ljava/lang/String;

    return-object p0
.end method

.method public final getScheduledAt()Ljava/time/Instant;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->scheduledAt:Ljava/time/Instant;

    return-object p0
.end method

.method public final getStatus()Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->status:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    return-object p0
.end method

.method public final getTaskId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->taskId:Ljava/lang/String;

    return-object p0
.end method

.method public final getTimezoneId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->timezoneId:Ljava/lang/String;

    return-object p0
.end method

.method public final getType()Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->type:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    return-object p0
.end method

.method public hashCode()I
    .locals 3

    iget-object v0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->planId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->taskId:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/d0;->a(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->name:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/d0;->a(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->type:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->scheduledAt:Ljava/time/Instant;

    invoke-static {v0, v2, v1}, LRp/a;->d(Ljava/time/Instant;II)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->timezoneId:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/d0;->a(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->instructions:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/d0;->a(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->phase:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->status:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->metadata:Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;

    invoke-virtual {p0}, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toEntity()Llc/c;
    .locals 11

    new-instance v0, Llc/c;

    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->taskId:Ljava/lang/String;

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->planId:Ljava/lang/String;

    iget-object v3, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->name:Ljava/lang/String;

    iget-object v4, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->type:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    iget-object v8, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->phase:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    iget-object v5, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->scheduledAt:Ljava/time/Instant;

    iget-object v6, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->timezoneId:Ljava/lang/String;

    iget-object v7, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->instructions:Ljava/lang/String;

    iget-object v9, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->status:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    iget-object v10, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->metadata:Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;

    invoke-direct/range {v0 .. v10}, Llc/c;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 12

    iget-object v0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->planId:Ljava/lang/String;

    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->taskId:Ljava/lang/String;

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->name:Ljava/lang/String;

    iget-object v3, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->type:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    iget-object v4, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->scheduledAt:Ljava/time/Instant;

    iget-object v5, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->timezoneId:Ljava/lang/String;

    iget-object v6, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->instructions:Ljava/lang/String;

    iget-object v7, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->phase:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskPhase;

    iget-object v8, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->status:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;->metadata:Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;

    const-string v9, "JetLagPlanTaskResponse(planId="

    const-string v10, ", taskId="

    const-string v11, ", name="

    invoke-static {v9, v0, v10, v1, v11}, Lj/m;->s(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", scheduledAt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", timezoneId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", instructions="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", phase="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", status="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", metadata="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
