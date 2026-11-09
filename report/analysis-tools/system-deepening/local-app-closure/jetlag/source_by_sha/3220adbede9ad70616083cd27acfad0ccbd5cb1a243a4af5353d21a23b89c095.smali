.class public final Lcom/eightsleep/data_jetlag/data/model/FlightResponse;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lcom/squareup/moshi/JsonClass;
    generateAdapter = true
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0015\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0013\u0008\u0087\u0008\u0018\u00002\u00020\u0001B\u0093\u0001\u0012\u0008\u0008\u0001\u0010\u0003\u001a\u00020\u0002\u0012\u0008\u0008\u0001\u0010\u0004\u001a\u00020\u0002\u0012\u0008\u0008\u0001\u0010\u0005\u001a\u00020\u0002\u0012\u0008\u0008\u0001\u0010\u0006\u001a\u00020\u0002\u0012\u0008\u0008\u0001\u0010\u0007\u001a\u00020\u0002\u0012\u0008\u0008\u0001\u0010\t\u001a\u00020\u0008\u0012\u0008\u0008\u0001\u0010\n\u001a\u00020\u0002\u0012\u0008\u0008\u0001\u0010\u000b\u001a\u00020\u0002\u0012\u0008\u0008\u0001\u0010\u000c\u001a\u00020\u0002\u0012\u0008\u0008\u0001\u0010\r\u001a\u00020\u0002\u0012\u0008\u0008\u0001\u0010\u000e\u001a\u00020\u0008\u0012\u0008\u0008\u0001\u0010\u000f\u001a\u00020\u0002\u0012\u0008\u0008\u0001\u0010\u0010\u001a\u00020\u0002\u0012\u0008\u0008\u0001\u0010\u0011\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\r\u0010\u0015\u001a\u00020\u0014\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u0010\u0010\u0017\u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u0010\u0010\u0019\u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008\u0019\u0010\u0018J\u0010\u0010\u001a\u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008\u001a\u0010\u0018J\u0010\u0010\u001b\u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008\u001b\u0010\u0018J\u0010\u0010\u001c\u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008\u001c\u0010\u0018J\u0010\u0010\u001d\u001a\u00020\u0008H\u00c6\u0003\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008\u001f\u0010\u0018J\u0010\u0010 \u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008 \u0010\u0018J\u0010\u0010!\u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008!\u0010\u0018J\u0010\u0010\"\u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008\"\u0010\u0018J\u0010\u0010#\u001a\u00020\u0008H\u00c6\u0003\u00a2\u0006\u0004\u0008#\u0010\u001eJ\u0010\u0010$\u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008$\u0010\u0018J\u0010\u0010%\u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008%\u0010\u0018J\u0010\u0010&\u001a\u00020\u0002H\u00c6\u0003\u00a2\u0006\u0004\u0008&\u0010\u0018J\u009c\u0001\u0010\'\u001a\u00020\u00002\u0008\u0008\u0003\u0010\u0003\u001a\u00020\u00022\u0008\u0008\u0003\u0010\u0004\u001a\u00020\u00022\u0008\u0008\u0003\u0010\u0005\u001a\u00020\u00022\u0008\u0008\u0003\u0010\u0006\u001a\u00020\u00022\u0008\u0008\u0003\u0010\u0007\u001a\u00020\u00022\u0008\u0008\u0003\u0010\t\u001a\u00020\u00082\u0008\u0008\u0003\u0010\n\u001a\u00020\u00022\u0008\u0008\u0003\u0010\u000b\u001a\u00020\u00022\u0008\u0008\u0003\u0010\u000c\u001a\u00020\u00022\u0008\u0008\u0003\u0010\r\u001a\u00020\u00022\u0008\u0008\u0003\u0010\u000e\u001a\u00020\u00082\u0008\u0008\u0003\u0010\u000f\u001a\u00020\u00022\u0008\u0008\u0003\u0010\u0010\u001a\u00020\u00022\u0008\u0008\u0003\u0010\u0011\u001a\u00020\u0002H\u00c6\u0001\u00a2\u0006\u0004\u0008\'\u0010(J\u0010\u0010)\u001a\u00020\u0002H\u00d6\u0001\u00a2\u0006\u0004\u0008)\u0010\u0018J\u0010\u0010+\u001a\u00020*H\u00d6\u0001\u00a2\u0006\u0004\u0008+\u0010,J\u001a\u0010/\u001a\u00020.2\u0008\u0010-\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003\u00a2\u0006\u0004\u0008/\u00100R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0003\u00101\u001a\u0004\u00082\u0010\u0018R\u0017\u0010\u0004\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0004\u00101\u001a\u0004\u00083\u0010\u0018R\u0017\u0010\u0005\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0005\u00101\u001a\u0004\u00084\u0010\u0018R\u0017\u0010\u0006\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0006\u00101\u001a\u0004\u00085\u0010\u0018R\u0017\u0010\u0007\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0007\u00101\u001a\u0004\u00086\u0010\u0018R\u0017\u0010\t\u001a\u00020\u00088\u0006\u00a2\u0006\u000c\n\u0004\u0008\t\u00107\u001a\u0004\u00088\u0010\u001eR\u0017\u0010\n\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\n\u00101\u001a\u0004\u00089\u0010\u0018R\u0017\u0010\u000b\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000b\u00101\u001a\u0004\u0008:\u0010\u0018R\u0017\u0010\u000c\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000c\u00101\u001a\u0004\u0008;\u0010\u0018R\u0017\u0010\r\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\r\u00101\u001a\u0004\u0008<\u0010\u0018R\u0017\u0010\u000e\u001a\u00020\u00088\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000e\u00107\u001a\u0004\u0008=\u0010\u001eR\u0017\u0010\u000f\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000f\u00101\u001a\u0004\u0008>\u0010\u0018R\u0017\u0010\u0010\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0010\u00101\u001a\u0004\u0008?\u0010\u0018R\u0017\u0010\u0011\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0011\u00101\u001a\u0004\u0008@\u0010\u0018\u00a8\u0006A"
    }
    d2 = {
        "Lcom/eightsleep/data_jetlag/data/model/FlightResponse;",
        "",
        "",
        "carrierCode",
        "flightNumber",
        "departureAirport",
        "departureAirportName",
        "departureCity",
        "Ljava/time/Instant;",
        "scheduledDepartureTime",
        "departureTimezoneOffset",
        "arrivalAirport",
        "arrivalAirportName",
        "arrivalCity",
        "scheduledArrivalTime",
        "arrivalTimezoneOffset",
        "aircraft",
        "duration",
        "<init>",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V",
        "Lgc/h;",
        "toDomain",
        "()Lgc/h;",
        "component1",
        "()Ljava/lang/String;",
        "component2",
        "component3",
        "component4",
        "component5",
        "component6",
        "()Ljava/time/Instant;",
        "component7",
        "component8",
        "component9",
        "component10",
        "component11",
        "component12",
        "component13",
        "component14",
        "copy",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/eightsleep/data_jetlag/data/model/FlightResponse;",
        "toString",
        "",
        "hashCode",
        "()I",
        "other",
        "",
        "equals",
        "(Ljava/lang/Object;)Z",
        "Ljava/lang/String;",
        "getCarrierCode",
        "getFlightNumber",
        "getDepartureAirport",
        "getDepartureAirportName",
        "getDepartureCity",
        "Ljava/time/Instant;",
        "getScheduledDepartureTime",
        "getDepartureTimezoneOffset",
        "getArrivalAirport",
        "getArrivalAirportName",
        "getArrivalCity",
        "getScheduledArrivalTime",
        "getArrivalTimezoneOffset",
        "getAircraft",
        "getDuration",
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
.field private final aircraft:Ljava/lang/String;

.field private final arrivalAirport:Ljava/lang/String;

.field private final arrivalAirportName:Ljava/lang/String;

.field private final arrivalCity:Ljava/lang/String;

.field private final arrivalTimezoneOffset:Ljava/lang/String;

.field private final carrierCode:Ljava/lang/String;

.field private final departureAirport:Ljava/lang/String;

.field private final departureAirportName:Ljava/lang/String;

.field private final departureCity:Ljava/lang/String;

.field private final departureTimezoneOffset:Ljava/lang/String;

.field private final duration:Ljava/lang/String;

.field private final flightNumber:Ljava/lang/String;

.field private final scheduledArrivalTime:Ljava/time/Instant;

.field private final scheduledDepartureTime:Ljava/time/Instant;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "carrierCode"
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "flightNumber"
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "departureAirport"
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "departureAirportName"
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "departureCity"
        .end annotation
    .end param
    .param p6    # Ljava/time/Instant;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "scheduledDepartureTime"
        .end annotation
    .end param
    .param p7    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "departureTimezone"
        .end annotation
    .end param
    .param p8    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "arrivalAirport"
        .end annotation
    .end param
    .param p9    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "arrivalAirportName"
        .end annotation
    .end param
    .param p10    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "arrivalCity"
        .end annotation
    .end param
    .param p11    # Ljava/time/Instant;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "scheduledArrivalTime"
        .end annotation
    .end param
    .param p12    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "arrivalTimezone"
        .end annotation
    .end param
    .param p13    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "aircraft"
        .end annotation
    .end param
    .param p14    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "duration"
        .end annotation
    .end param

    const-string v0, "carrierCode"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "flightNumber"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "departureAirport"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "departureAirportName"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "departureCity"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "scheduledDepartureTime"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "departureTimezoneOffset"

    invoke-static {p7, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "arrivalAirport"

    invoke-static {p8, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "arrivalAirportName"

    invoke-static {p9, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "arrivalCity"

    invoke-static {p10, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "scheduledArrivalTime"

    invoke-static {p11, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "arrivalTimezoneOffset"

    invoke-static {p12, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "aircraft"

    invoke-static {p13, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "duration"

    invoke-static {p14, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->carrierCode:Ljava/lang/String;

    iput-object p2, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->flightNumber:Ljava/lang/String;

    iput-object p3, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureAirport:Ljava/lang/String;

    iput-object p4, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureAirportName:Ljava/lang/String;

    iput-object p5, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureCity:Ljava/lang/String;

    iput-object p6, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->scheduledDepartureTime:Ljava/time/Instant;

    iput-object p7, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureTimezoneOffset:Ljava/lang/String;

    iput-object p8, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalAirport:Ljava/lang/String;

    iput-object p9, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalAirportName:Ljava/lang/String;

    iput-object p10, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalCity:Ljava/lang/String;

    iput-object p11, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->scheduledArrivalTime:Ljava/time/Instant;

    iput-object p12, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalTimezoneOffset:Ljava/lang/String;

    iput-object p13, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->aircraft:Ljava/lang/String;

    iput-object p14, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->duration:Ljava/lang/String;

    return-void
.end method

.method public static synthetic copy$default(Lcom/eightsleep/data_jetlag/data/model/FlightResponse;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lcom/eightsleep/data_jetlag/data/model/FlightResponse;
    .locals 14

    move/from16 v0, p15

    and-int/lit8 v1, v0, 0x1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->carrierCode:Ljava/lang/String;

    goto :goto_0

    :cond_0
    move-object v1, p1

    :goto_0
    and-int/lit8 v2, v0, 0x2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->flightNumber:Ljava/lang/String;

    goto :goto_1

    :cond_1
    move-object/from16 v2, p2

    :goto_1
    and-int/lit8 v3, v0, 0x4

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureAirport:Ljava/lang/String;

    goto :goto_2

    :cond_2
    move-object/from16 v3, p3

    :goto_2
    and-int/lit8 v4, v0, 0x8

    if-eqz v4, :cond_3

    iget-object v4, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureAirportName:Ljava/lang/String;

    goto :goto_3

    :cond_3
    move-object/from16 v4, p4

    :goto_3
    and-int/lit8 v5, v0, 0x10

    if-eqz v5, :cond_4

    iget-object v5, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureCity:Ljava/lang/String;

    goto :goto_4

    :cond_4
    move-object/from16 v5, p5

    :goto_4
    and-int/lit8 v6, v0, 0x20

    if-eqz v6, :cond_5

    iget-object v6, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->scheduledDepartureTime:Ljava/time/Instant;

    goto :goto_5

    :cond_5
    move-object/from16 v6, p6

    :goto_5
    and-int/lit8 v7, v0, 0x40

    if-eqz v7, :cond_6

    iget-object v7, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureTimezoneOffset:Ljava/lang/String;

    goto :goto_6

    :cond_6
    move-object/from16 v7, p7

    :goto_6
    and-int/lit16 v8, v0, 0x80

    if-eqz v8, :cond_7

    iget-object v8, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalAirport:Ljava/lang/String;

    goto :goto_7

    :cond_7
    move-object/from16 v8, p8

    :goto_7
    and-int/lit16 v9, v0, 0x100

    if-eqz v9, :cond_8

    iget-object v9, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalAirportName:Ljava/lang/String;

    goto :goto_8

    :cond_8
    move-object/from16 v9, p9

    :goto_8
    and-int/lit16 v10, v0, 0x200

    if-eqz v10, :cond_9

    iget-object v10, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalCity:Ljava/lang/String;

    goto :goto_9

    :cond_9
    move-object/from16 v10, p10

    :goto_9
    and-int/lit16 v11, v0, 0x400

    if-eqz v11, :cond_a

    iget-object v11, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->scheduledArrivalTime:Ljava/time/Instant;

    goto :goto_a

    :cond_a
    move-object/from16 v11, p11

    :goto_a
    and-int/lit16 v12, v0, 0x800

    if-eqz v12, :cond_b

    iget-object v12, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalTimezoneOffset:Ljava/lang/String;

    goto :goto_b

    :cond_b
    move-object/from16 v12, p12

    :goto_b
    and-int/lit16 v13, v0, 0x1000

    if-eqz v13, :cond_c

    iget-object v13, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->aircraft:Ljava/lang/String;

    goto :goto_c

    :cond_c
    move-object/from16 v13, p13

    :goto_c
    and-int/lit16 v0, v0, 0x2000

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->duration:Ljava/lang/String;

    move-object/from16 p15, v0

    :goto_d
    move-object p1, p0

    move-object/from16 p2, v1

    move-object/from16 p3, v2

    move-object/from16 p4, v3

    move-object/from16 p5, v4

    move-object/from16 p6, v5

    move-object/from16 p7, v6

    move-object/from16 p8, v7

    move-object/from16 p9, v8

    move-object/from16 p10, v9

    move-object/from16 p11, v10

    move-object/from16 p12, v11

    move-object/from16 p13, v12

    move-object/from16 p14, v13

    goto :goto_e

    :cond_d
    move-object/from16 p15, p14

    goto :goto_d

    :goto_e
    invoke-virtual/range {p1 .. p15}, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->copy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/eightsleep/data_jetlag/data/model/FlightResponse;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->carrierCode:Ljava/lang/String;

    return-object p0
.end method

.method public final component10()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalCity:Ljava/lang/String;

    return-object p0
.end method

.method public final component11()Ljava/time/Instant;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->scheduledArrivalTime:Ljava/time/Instant;

    return-object p0
.end method

.method public final component12()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalTimezoneOffset:Ljava/lang/String;

    return-object p0
.end method

.method public final component13()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->aircraft:Ljava/lang/String;

    return-object p0
.end method

.method public final component14()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->duration:Ljava/lang/String;

    return-object p0
.end method

.method public final component2()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->flightNumber:Ljava/lang/String;

    return-object p0
.end method

.method public final component3()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureAirport:Ljava/lang/String;

    return-object p0
.end method

.method public final component4()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureAirportName:Ljava/lang/String;

    return-object p0
.end method

.method public final component5()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureCity:Ljava/lang/String;

    return-object p0
.end method

.method public final component6()Ljava/time/Instant;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->scheduledDepartureTime:Ljava/time/Instant;

    return-object p0
.end method

.method public final component7()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureTimezoneOffset:Ljava/lang/String;

    return-object p0
.end method

.method public final component8()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalAirport:Ljava/lang/String;

    return-object p0
.end method

.method public final component9()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalAirportName:Ljava/lang/String;

    return-object p0
.end method

.method public final copy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/eightsleep/data_jetlag/data/model/FlightResponse;
    .locals 16
    .param p1    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "carrierCode"
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "flightNumber"
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "departureAirport"
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "departureAirportName"
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "departureCity"
        .end annotation
    .end param
    .param p6    # Ljava/time/Instant;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "scheduledDepartureTime"
        .end annotation
    .end param
    .param p7    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "departureTimezone"
        .end annotation
    .end param
    .param p8    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "arrivalAirport"
        .end annotation
    .end param
    .param p9    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "arrivalAirportName"
        .end annotation
    .end param
    .param p10    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "arrivalCity"
        .end annotation
    .end param
    .param p11    # Ljava/time/Instant;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "scheduledArrivalTime"
        .end annotation
    .end param
    .param p12    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "arrivalTimezone"
        .end annotation
    .end param
    .param p13    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "aircraft"
        .end annotation
    .end param
    .param p14    # Ljava/lang/String;
        .annotation runtime Lcom/squareup/moshi/Json;
            name = "duration"
        .end annotation
    .end param

    const-string v0, "carrierCode"

    move-object/from16 v2, p1

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "flightNumber"

    move-object/from16 v3, p2

    invoke-static {v3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "departureAirport"

    move-object/from16 v4, p3

    invoke-static {v4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "departureAirportName"

    move-object/from16 v5, p4

    invoke-static {v5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "departureCity"

    move-object/from16 v6, p5

    invoke-static {v6, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "scheduledDepartureTime"

    move-object/from16 v7, p6

    invoke-static {v7, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "departureTimezoneOffset"

    move-object/from16 v8, p7

    invoke-static {v8, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "arrivalAirport"

    move-object/from16 v9, p8

    invoke-static {v9, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "arrivalAirportName"

    move-object/from16 v10, p9

    invoke-static {v10, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "arrivalCity"

    move-object/from16 v11, p10

    invoke-static {v11, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "scheduledArrivalTime"

    move-object/from16 v12, p11

    invoke-static {v12, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "arrivalTimezoneOffset"

    move-object/from16 v13, p12

    invoke-static {v13, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "aircraft"

    move-object/from16 v14, p13

    invoke-static {v14, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "duration"

    move-object/from16 v15, p14

    invoke-static {v15, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;

    invoke-direct/range {v1 .. v15}, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;

    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->carrierCode:Ljava/lang/String;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->carrierCode:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->flightNumber:Ljava/lang/String;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->flightNumber:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureAirport:Ljava/lang/String;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureAirport:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    :cond_4
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureAirportName:Ljava/lang/String;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureAirportName:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    return v2

    :cond_5
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureCity:Ljava/lang/String;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureCity:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    return v2

    :cond_6
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->scheduledDepartureTime:Ljava/time/Instant;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->scheduledDepartureTime:Ljava/time/Instant;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    return v2

    :cond_7
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureTimezoneOffset:Ljava/lang/String;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureTimezoneOffset:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    return v2

    :cond_8
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalAirport:Ljava/lang/String;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalAirport:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    return v2

    :cond_9
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalAirportName:Ljava/lang/String;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalAirportName:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a

    return v2

    :cond_a
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalCity:Ljava/lang/String;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalCity:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_b

    return v2

    :cond_b
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->scheduledArrivalTime:Ljava/time/Instant;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->scheduledArrivalTime:Ljava/time/Instant;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    return v2

    :cond_c
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalTimezoneOffset:Ljava/lang/String;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalTimezoneOffset:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_d

    return v2

    :cond_d
    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->aircraft:Ljava/lang/String;

    iget-object v3, p1, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->aircraft:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_e

    return v2

    :cond_e
    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->duration:Ljava/lang/String;

    iget-object p1, p1, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->duration:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f

    return v2

    :cond_f
    return v0
.end method

.method public final getAircraft()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->aircraft:Ljava/lang/String;

    return-object p0
.end method

.method public final getArrivalAirport()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalAirport:Ljava/lang/String;

    return-object p0
.end method

.method public final getArrivalAirportName()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalAirportName:Ljava/lang/String;

    return-object p0
.end method

.method public final getArrivalCity()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalCity:Ljava/lang/String;

    return-object p0
.end method

.method public final getArrivalTimezoneOffset()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalTimezoneOffset:Ljava/lang/String;

    return-object p0
.end method

.method public final getCarrierCode()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->carrierCode:Ljava/lang/String;

    return-object p0
.end method

.method public final getDepartureAirport()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureAirport:Ljava/lang/String;

    return-object p0
.end method

.method public final getDepartureAirportName()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureAirportName:Ljava/lang/String;

    return-object p0
.end method

.method public final getDepartureCity()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureCity:Ljava/lang/String;

    return-object p0
.end method

.method public final getDepartureTimezoneOffset()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureTimezoneOffset:Ljava/lang/String;

    return-object p0
.end method

.method public final getDuration()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->duration:Ljava/lang/String;

    return-object p0
.end method

.method public final getFlightNumber()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->flightNumber:Ljava/lang/String;

    return-object p0
.end method

.method public final getScheduledArrivalTime()Ljava/time/Instant;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->scheduledArrivalTime:Ljava/time/Instant;

    return-object p0
.end method

.method public final getScheduledDepartureTime()Ljava/time/Instant;
    .locals 0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->scheduledDepartureTime:Ljava/time/Instant;

    return-object p0
.end method

.method public hashCode()I
    .locals 3

    iget-object v0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->carrierCode:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->flightNumber:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/d0;->a(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureAirport:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/d0;->a(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureAirportName:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/d0;->a(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureCity:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/d0;->a(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->scheduledDepartureTime:Ljava/time/Instant;

    invoke-static {v2, v0, v1}, LRp/a;->d(Ljava/time/Instant;II)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureTimezoneOffset:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/d0;->a(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalAirport:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/d0;->a(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalAirportName:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/d0;->a(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalCity:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/d0;->a(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->scheduledArrivalTime:Ljava/time/Instant;

    invoke-static {v2, v0, v1}, LRp/a;->d(Ljava/time/Instant;II)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalTimezoneOffset:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/d0;->a(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->aircraft:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/fragment/app/d0;->a(IILjava/lang/String;)I

    move-result v0

    iget-object p0, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->duration:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toDomain()Lgc/h;
    .locals 14

    new-instance v0, Lgc/h;

    iget-object v1, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->carrierCode:Ljava/lang/String;

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->flightNumber:Ljava/lang/String;

    invoke-static {v1, v2}, LRp/a;->o(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureAirport:Ljava/lang/String;

    iget-object v3, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureAirportName:Ljava/lang/String;

    iget-object v4, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureCity:Ljava/lang/String;

    iget-object v5, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->scheduledDepartureTime:Ljava/time/Instant;

    iget-object v6, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureTimezoneOffset:Ljava/lang/String;

    iget-object v7, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalAirport:Ljava/lang/String;

    iget-object v8, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalAirportName:Ljava/lang/String;

    iget-object v9, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalCity:Ljava/lang/String;

    iget-object v10, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->scheduledArrivalTime:Ljava/time/Instant;

    iget-object v11, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalTimezoneOffset:Ljava/lang/String;

    iget-object v12, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->aircraft:Ljava/lang/String;

    iget-object v13, p0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->duration:Ljava/lang/String;

    invoke-direct/range {v0 .. v13}, Lgc/h;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 16

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->carrierCode:Ljava/lang/String;

    iget-object v2, v0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->flightNumber:Ljava/lang/String;

    iget-object v3, v0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureAirport:Ljava/lang/String;

    iget-object v4, v0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureAirportName:Ljava/lang/String;

    iget-object v5, v0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureCity:Ljava/lang/String;

    iget-object v6, v0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->scheduledDepartureTime:Ljava/time/Instant;

    iget-object v7, v0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->departureTimezoneOffset:Ljava/lang/String;

    iget-object v8, v0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalAirport:Ljava/lang/String;

    iget-object v9, v0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalAirportName:Ljava/lang/String;

    iget-object v10, v0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalCity:Ljava/lang/String;

    iget-object v11, v0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->scheduledArrivalTime:Ljava/time/Instant;

    iget-object v12, v0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->arrivalTimezoneOffset:Ljava/lang/String;

    iget-object v13, v0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->aircraft:Ljava/lang/String;

    iget-object v0, v0, Lcom/eightsleep/data_jetlag/data/model/FlightResponse;->duration:Ljava/lang/String;

    const-string v14, "FlightResponse(carrierCode="

    const-string v15, ", flightNumber="

    move-object/from16 p0, v0

    const-string v0, ", departureAirport="

    invoke-static {v14, v1, v15, v2, v0}, Lj/m;->s(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", departureAirportName="

    const-string v2, ", departureCity="

    invoke-static {v0, v3, v1, v4, v2}, LB/h;->A(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", scheduledDepartureTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", departureTimezoneOffset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", arrivalAirport="

    const-string v2, ", arrivalAirportName="

    invoke-static {v0, v7, v1, v8, v2}, LB/h;->A(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, ", arrivalCity="

    const-string v2, ", scheduledArrivalTime="

    invoke-static {v0, v9, v1, v10, v2}, LB/h;->A(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", arrivalTimezoneOffset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", aircraft="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", duration="

    const-string v2, ")"

    move-object/from16 v3, p0

    invoke-static {v0, v13, v1, v3, v2}, Landroidx/fragment/app/d0;->k(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
