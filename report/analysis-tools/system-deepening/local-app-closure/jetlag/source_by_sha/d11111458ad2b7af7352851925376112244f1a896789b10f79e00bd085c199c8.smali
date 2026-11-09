.class public final Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lcom/squareup/moshi/JsonClass;
    generateAdapter = true
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000L\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0015\n\u0002\u0010\u0008\n\u0002\u0008\u0016\u0008\u0087\u0008\u0018\u00002\u00020\u0001BU\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\u0008\u0012\u0006\u0010\n\u001a\u00020\u0002\u0012\u0006\u0010\u000c\u001a\u00020\u000b\u0012\u0006\u0010\r\u001a\u00020\u000b\u0012\u000c\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\u000f0\u000e\u0012\u0006\u0010\u0012\u001a\u00020\u0011\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u001d\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u0015\u001a\u00020\u00022\u0006\u0010\u0016\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0018\u0010\u0019J\u0010\u0010\u001a\u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008\u001a\u0010\u001bJ\u0010\u0010\u001c\u001a\u00020\u0004H\u00c6\u0003\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJ\u0010\u0010\u001e\u001a\u00020\u0006H\u00c6\u0003\u00a2\u0006\u0004\u0008\u001e\u0010\u001fJ\u0010\u0010 \u001a\u00020\u0008H\u00c6\u0003\u00a2\u0006\u0004\u0008 \u0010!J\u0010\u0010\"\u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008\"\u0010\u001bJ\u0010\u0010#\u001a\u00020\u000bH\u00c6\u0003\u00a2\u0006\u0004\u0008#\u0010$J\u0010\u0010%\u001a\u00020\u000bH\u00c6\u0003\u00a2\u0006\u0004\u0008%\u0010$J\u0016\u0010&\u001a\u0008\u0012\u0004\u0012\u00020\u000f0\u000eH\u00c6\u0003\u00a2\u0006\u0004\u0008&\u0010\'J\u0010\u0010(\u001a\u00020\u0011H\u00c6\u0003\u00a2\u0006\u0004\u0008(\u0010)Jp\u0010*\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0003\u001a\u00020\u00022\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u00042\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00062\u0008\u0008\u0002\u0010\t\u001a\u00020\u00082\u0008\u0008\u0002\u0010\n\u001a\u00020\u00022\u0008\u0008\u0002\u0010\u000c\u001a\u00020\u000b2\u0008\u0008\u0002\u0010\r\u001a\u00020\u000b2\u000e\u0008\u0002\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\u000f0\u000e2\u0008\u0008\u0002\u0010\u0012\u001a\u00020\u0011H\u00c6\u0001\u00a2\u0006\u0004\u0008*\u0010+J\u0010\u0010,\u001a\u00020\u0002H\u00d6\u0001\u00a2\u0006\u0004\u0008,\u0010\u001bJ\u0010\u0010.\u001a\u00020-H\u00d6\u0001\u00a2\u0006\u0004\u0008.\u0010/J\u001a\u00101\u001a\u00020\u00062\u0008\u00100\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003\u00a2\u0006\u0004\u00081\u00102R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0003\u00103\u001a\u0004\u00084\u0010\u001bR\u0017\u0010\u0005\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0005\u00105\u001a\u0004\u00086\u0010\u001dR\u0017\u0010\u0007\u001a\u00020\u00068\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0007\u00107\u001a\u0004\u00088\u0010\u001fR\u0017\u0010\t\u001a\u00020\u00088\u0006\u00a2\u0006\u000c\n\u0004\u0008\t\u00109\u001a\u0004\u0008:\u0010!R\u0017\u0010\n\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\n\u00103\u001a\u0004\u0008;\u0010\u001bR\u0017\u0010\u000c\u001a\u00020\u000b8\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000c\u0010<\u001a\u0004\u0008=\u0010$R\u0017\u0010\r\u001a\u00020\u000b8\u0006\u00a2\u0006\u000c\n\u0004\u0008\r\u0010<\u001a\u0004\u0008>\u0010$R\u001d\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\u000f0\u000e8\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0010\u0010?\u001a\u0004\u0008@\u0010\'R\u0017\u0010\u0012\u001a\u00020\u00118\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0012\u0010A\u001a\u0004\u0008B\u0010)\u00a8\u0006C"
    }
    d2 = {
        "Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;",
        "",
        "",
        "planId",
        "Lcom/eightsleep/data_jetlag/enums/TravelDirection;",
        "direction",
        "",
        "supplementsEnabled",
        "Ljava/time/Instant;",
        "createdAt",
        "status",
        "Ljava/time/LocalDate;",
        "startDate",
        "endDate",
        "",
        "Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;",
        "tasks",
        "Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;",
        "summary",
        "<init>",
        "(Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/TravelDirection;ZLjava/time/Instant;Ljava/lang/String;Ljava/time/LocalDate;Ljava/time/LocalDate;Ljava/util/List;Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;)V",
        "userId",
        "tripId",
        "Llc/a;",
        "toEntity",
        "(Ljava/lang/String;Ljava/lang/String;)Llc/a;",
        "component1",
        "()Ljava/lang/String;",
        "component2",
        "()Lcom/eightsleep/data_jetlag/enums/TravelDirection;",
        "component3",
        "()Z",
        "component4",
        "()Ljava/time/Instant;",
        "component5",
        "component6",
        "()Ljava/time/LocalDate;",
        "component7",
        "component8",
        "()Ljava/util/List;",
        "component9",
        "()Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;",
        "copy",
        "(Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/TravelDirection;ZLjava/time/Instant;Ljava/lang/String;Ljava/time/LocalDate;Ljava/time/LocalDate;Ljava/util/List;Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;)Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;",
        "toString",
        "",
        "hashCode",
        "()I",
        "other",
        "equals",
        "(Ljava/lang/Object;)Z",
        "Ljava/lang/String;",
        "getPlanId",
        "Lcom/eightsleep/data_jetlag/enums/TravelDirection;",
        "getDirection",
        "Z",
        "getSupplementsEnabled",
        "Ljava/time/Instant;",
        "getCreatedAt",
        "getStatus",
        "Ljava/time/LocalDate;",
        "getStartDate",
        "getEndDate",
        "Ljava/util/List;",
        "getTasks",
        "Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;",
        "getSummary",
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
.field private final createdAt:Ljava/time/Instant;

.field private final direction:Lcom/eightsleep/data_jetlag/enums/TravelDirection;

.field private final endDate:Ljava/time/LocalDate;

.field private final planId:Ljava/lang/String;

.field private final startDate:Ljava/time/LocalDate;

.field private final status:Ljava/lang/String;

.field private final summary:Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;

.field private final supplementsEnabled:Z

.field private final tasks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/TravelDirection;ZLjava/time/Instant;Ljava/lang/String;Ljava/time/LocalDate;Ljava/time/LocalDate;Ljava/util/List;Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/eightsleep/data_jetlag/enums/TravelDirection;",
            "Z",
            "Ljava/time/Instant;",
            "Ljava/lang/String;",
            "Ljava/time/LocalDate;",
            "Ljava/time/LocalDate;",
            "Ljava/util/List<",
            "Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;",
            ">;",
            "Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;",
            ")V"
        }
    .end annotation

    const-string v0, "planId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "direction"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "createdAt"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "status"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "startDate"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "endDate"

    invoke-static {p7, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "tasks"

    invoke-static {p8, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "summary"

    invoke-static {p9, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->planId:Ljava/lang/String;

    iput-object p2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->direction:Lcom/eightsleep/data_jetlag/enums/TravelDirection;

    iput-boolean p3, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->supplementsEnabled:Z

    iput-object p4, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->createdAt:Ljava/time/Instant;

    iput-object p5, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->status:Ljava/lang/String;

    iput-object p6, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->startDate:Ljava/time/LocalDate;

    iput-object p7, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->endDate:Ljava/time/LocalDate;

    iput-object p8, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->tasks:Ljava/util/List;

    iput-object p9, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->summary:Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;

    return-void
.end method

.method public static synthetic copy$default(Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/TravelDirection;ZLjava/time/Instant;Ljava/lang/String;Ljava/time/LocalDate;Ljava/time/LocalDate;Ljava/util/List;Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;ILjava/lang/Object;)Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;
    .locals 0

    and-int/lit8 p11, p10, 0x1

    if-eqz p11, :cond_0

    iget-object p1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->planId:Ljava/lang/String;

    :cond_0
    and-int/lit8 p11, p10, 0x2

    if-eqz p11, :cond_1

    iget-object p2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->direction:Lcom/eightsleep/data_jetlag/enums/TravelDirection;

    :cond_1
    and-int/lit8 p11, p10, 0x4

    if-eqz p11, :cond_2

    iget-boolean p3, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->supplementsEnabled:Z

    :cond_2
    and-int/lit8 p11, p10, 0x8

    if-eqz p11, :cond_3

    iget-object p4, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->createdAt:Ljava/time/Instant;

    :cond_3
    and-int/lit8 p11, p10, 0x10

    if-eqz p11, :cond_4

    iget-object p5, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->status:Ljava/lang/String;

    :cond_4
    and-int/lit8 p11, p10, 0x20

    if-eqz p11, :cond_5

    iget-object p6, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->startDate:Ljava/time/LocalDate;

    :cond_5
    and-int/lit8 p11, p10, 0x40

    if-eqz p11, :cond_6

    iget-object p7, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->endDate:Ljava/time/LocalDate;

    :cond_6
    and-int/lit16 p11, p10, 0x80

    if-eqz p11, :cond_7

    iget-object p8, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->tasks:Ljava/util/List;

    :cond_7
    and-int/lit16 p10, p10, 0x100

    if-eqz p10, :cond_8

    iget-object p9, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->summary:Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;

    :cond_8
    move-object p10, p8

    move-object p11, p9

    move-object p8, p6

    move-object p9, p7

    move-object p6, p4

    move-object p7, p5

    move-object p4, p2

    move p5, p3

    move-object p2, p0

    move-object p3, p1

    invoke-virtual/range {p2 .. p11}, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->copy(Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/TravelDirection;ZLjava/time/Instant;Ljava/lang/String;Ljava/time/LocalDate;Ljava/time/LocalDate;Ljava/util/List;Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;)Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->planId:Ljava/lang/String;

    return-object p0
.end method

.method public final component2()Lcom/eightsleep/data_jetlag/enums/TravelDirection;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->direction:Lcom/eightsleep/data_jetlag/enums/TravelDirection;

    return-object p0
.end method

.method public final component3()Z
    .locals 0

    iget-boolean p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->supplementsEnabled:Z

    return p0
.end method

.method public final component4()Ljava/time/Instant;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->createdAt:Ljava/time/Instant;

    return-object p0
.end method

.method public final component5()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->status:Ljava/lang/String;

    return-object p0
.end method

.method public final component6()Ljava/time/LocalDate;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->startDate:Ljava/time/LocalDate;

    return-object p0
.end method

.method public final component7()Ljava/time/LocalDate;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->endDate:Ljava/time/LocalDate;

    return-object p0
.end method

.method public final component8()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->tasks:Ljava/util/List;

    return-object p0
.end method

.method public final component9()Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->summary:Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;

    return-object p0
.end method

.method public final copy(Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/TravelDirection;ZLjava/time/Instant;Ljava/lang/String;Ljava/time/LocalDate;Ljava/time/LocalDate;Ljava/util/List;Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;)Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/eightsleep/data_jetlag/enums/TravelDirection;",
            "Z",
            "Ljava/time/Instant;",
            "Ljava/lang/String;",
            "Ljava/time/LocalDate;",
            "Ljava/time/LocalDate;",
            "Ljava/util/List<",
            "Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;",
            ">;",
            "Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;",
            ")",
            "Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;"
        }
    .end annotation

    const-string p0, "planId"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "direction"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "createdAt"

    invoke-static {p4, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "status"

    invoke-static {p5, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "startDate"

    move-object/from16 v6, p6

    invoke-static {v6, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "endDate"

    move-object/from16 v7, p7

    invoke-static {v7, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "tasks"

    move-object/from16 v8, p8

    invoke-static {v8, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "summary"

    move-object/from16 v9, p9

    invoke-static {v9, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v9}, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;-><init>(Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/TravelDirection;ZLjava/time/Instant;Ljava/lang/String;Ljava/time/LocalDate;Ljava/time/LocalDate;Ljava/util/List;Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;

    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->planId:Ljava/lang/String;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->planId:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->direction:Lcom/eightsleep/data_jetlag/enums/TravelDirection;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->direction:Lcom/eightsleep/data_jetlag/enums/TravelDirection;

    if-eq v1, v3, :cond_3

    return v2

    :cond_3
    iget-boolean v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->supplementsEnabled:Z

    iget-boolean v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->supplementsEnabled:Z

    if-eq v1, v3, :cond_4

    return v2

    :cond_4
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->createdAt:Ljava/time/Instant;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->createdAt:Ljava/time/Instant;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    return v2

    :cond_5
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->status:Ljava/lang/String;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->status:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    return v2

    :cond_6
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->startDate:Ljava/time/LocalDate;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->startDate:Ljava/time/LocalDate;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    return v2

    :cond_7
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->endDate:Ljava/time/LocalDate;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->endDate:Ljava/time/LocalDate;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    return v2

    :cond_8
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->tasks:Ljava/util/List;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->tasks:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    return v2

    :cond_9
    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->summary:Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;

    iget-object p1, p1, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->summary:Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a

    return v2

    :cond_a
    return v0
.end method

.method public final getCreatedAt()Ljava/time/Instant;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->createdAt:Ljava/time/Instant;

    return-object p0
.end method

.method public final getDirection()Lcom/eightsleep/data_jetlag/enums/TravelDirection;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->direction:Lcom/eightsleep/data_jetlag/enums/TravelDirection;

    return-object p0
.end method

.method public final getEndDate()Ljava/time/LocalDate;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->endDate:Ljava/time/LocalDate;

    return-object p0
.end method

.method public final getPlanId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->planId:Ljava/lang/String;

    return-object p0
.end method

.method public final getStartDate()Ljava/time/LocalDate;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->startDate:Ljava/time/LocalDate;

    return-object p0
.end method

.method public final getStatus()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->status:Ljava/lang/String;

    return-object p0
.end method

.method public final getSummary()Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->summary:Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;

    return-object p0
.end method

.method public final getSupplementsEnabled()Z
    .locals 0

    iget-boolean p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->supplementsEnabled:Z

    return p0
.end method

.method public final getTasks()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/eightsleep/data_jetlag/data/model/JetLagPlanTaskResponse;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->tasks:Ljava/util/List;

    return-object p0
.end method

.method public hashCode()I
    .locals 3

    iget-object v0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->planId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->direction:Lcom/eightsleep/data_jetlag/enums/TravelDirection;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-boolean v0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->supplementsEnabled:Z

    invoke-static {v2, v1, v0}, Lr4/K;->f(IIZ)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->createdAt:Ljava/time/Instant;

    invoke-static {v2, v0, v1}, LRp/a;->d(Ljava/time/Instant;II)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->status:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/d0;->a(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->startDate:Ljava/time/LocalDate;

    invoke-static {v2, v0, v1}, LRp/a;->e(Ljava/time/LocalDate;II)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->endDate:Ljava/time/LocalDate;

    invoke-static {v2, v0, v1}, LRp/a;->e(Ljava/time/LocalDate;II)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->tasks:Ljava/util/List;

    invoke-static {v0, v1, v2}, LB/h;->d(IILjava/util/List;)I

    move-result v0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->summary:Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;

    invoke-virtual {p0}, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toEntity(Ljava/lang/String;Ljava/lang/String;)Llc/a;
    .locals 11

    const-string v0, "userId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "tripId"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Llc/a;

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->planId:Ljava/lang/String;

    iget-object v5, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->direction:Lcom/eightsleep/data_jetlag/enums/TravelDirection;

    iget-boolean v6, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->supplementsEnabled:Z

    iget-object v7, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->createdAt:Ljava/time/Instant;

    iget-object v8, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->status:Ljava/lang/String;

    iget-object v9, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->startDate:Ljava/time/LocalDate;

    iget-object v10, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->endDate:Ljava/time/LocalDate;

    move-object v3, p1

    move-object v4, p2

    invoke-direct/range {v1 .. v10}, Llc/a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/enums/TravelDirection;ZLjava/time/Instant;Ljava/lang/String;Ljava/time/LocalDate;Ljava/time/LocalDate;)V

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 10

    iget-object v0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->planId:Ljava/lang/String;

    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->direction:Lcom/eightsleep/data_jetlag/enums/TravelDirection;

    iget-boolean v2, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->supplementsEnabled:Z

    iget-object v3, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->createdAt:Ljava/time/Instant;

    iget-object v4, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->status:Ljava/lang/String;

    iget-object v5, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->startDate:Ljava/time/LocalDate;

    iget-object v6, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->endDate:Ljava/time/LocalDate;

    iget-object v7, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->tasks:Ljava/util/List;

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;->summary:Lcom/eightsleep/data_jetlag/data/model/JetLagPlanSummaryResponse;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "JetLagPlanResponse(planId="

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", direction="

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", supplementsEnabled="

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, ", createdAt="

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", status="

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", startDate="

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", endDate="

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", tasks="

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", summary="

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
