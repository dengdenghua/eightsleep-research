.class public final Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalitiesJsonAdapter;
.super Lcom/squareup/moshi/JsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/moshi/JsonAdapter<",
        "Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0017\u0010\u000c\u001a\u00020\u00022\u0006\u0010\u000b\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\rJ!\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u000f\u001a\u00020\u000e2\u0008\u0010\u0010\u001a\u0004\u0018\u00010\u0002H\u0016\u00a2\u0006\u0004\u0008\u0012\u0010\u0013R\u0014\u0010\u0015\u001a\u00020\u00148\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0015\u0010\u0016R\u001c\u0010\u0018\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00170\u00018\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0018\u0010\u0019\u00a8\u0006\u001a"
    }
    d2 = {
        "Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalitiesJsonAdapter;",
        "Lcom/squareup/moshi/JsonAdapter;",
        "Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;",
        "Lcom/squareup/moshi/Moshi;",
        "moshi",
        "<init>",
        "(Lcom/squareup/moshi/Moshi;)V",
        "",
        "toString",
        "()Ljava/lang/String;",
        "Lcom/squareup/moshi/JsonReader;",
        "reader",
        "fromJson",
        "(Lcom/squareup/moshi/JsonReader;)Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;",
        "Lcom/squareup/moshi/JsonWriter;",
        "writer",
        "value_",
        "LHm/B;",
        "toJson",
        "(Lcom/squareup/moshi/JsonWriter;Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;)V",
        "Lcom/squareup/moshi/JsonReader$Options;",
        "options",
        "Lcom/squareup/moshi/JsonReader$Options;",
        "Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;",
        "nullableWellBeingDetailStatsAdapter",
        "Lcom/squareup/moshi/JsonAdapter;",
        "data-metrics_tencentRelease"
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
.field private final nullableWellBeingDetailStatsAdapter:Lcom/squareup/moshi/JsonAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/squareup/moshi/JsonAdapter<",
            "Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;",
            ">;"
        }
    .end annotation
.end field

.field private final options:Lcom/squareup/moshi/JsonReader$Options;


# direct methods
.method public constructor <init>(Lcom/squareup/moshi/Moshi;)V
    .locals 3

    const-string v0, "moshi"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/squareup/moshi/JsonAdapter;-><init>()V

    const-string v0, "hrv"

    const-string v1, "rr"

    const-string v2, "hr"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/squareup/moshi/JsonReader$Options;->of([Ljava/lang/String;)Lcom/squareup/moshi/JsonReader$Options;

    move-result-object v0

    const-string v1, "of(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalitiesJsonAdapter;->options:Lcom/squareup/moshi/JsonReader$Options;

    sget-object v0, LIm/B;->a:LIm/B;

    const-class v1, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;

    invoke-virtual {p1, v1, v0, v2}, Lcom/squareup/moshi/Moshi;->adapter(Ljava/lang/reflect/Type;Ljava/util/Set;Ljava/lang/String;)Lcom/squareup/moshi/JsonAdapter;

    move-result-object p1

    const-string v0, "adapter(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalitiesJsonAdapter;->nullableWellBeingDetailStatsAdapter:Lcom/squareup/moshi/JsonAdapter;

    return-void
.end method


# virtual methods
.method public fromJson(Lcom/squareup/moshi/JsonReader;)Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;
    .locals 5

    const-string v0, "reader"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    invoke-virtual {p1}, Lcom/squareup/moshi/JsonReader;->beginObject()V

    const/4 v0, 0x0

    move-object v1, v0

    move-object v2, v1

    .line 3
    :goto_0
    invoke-virtual {p1}, Lcom/squareup/moshi/JsonReader;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 4
    iget-object v3, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalitiesJsonAdapter;->options:Lcom/squareup/moshi/JsonReader$Options;

    invoke-virtual {p1, v3}, Lcom/squareup/moshi/JsonReader;->selectName(Lcom/squareup/moshi/JsonReader$Options;)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_3

    if-eqz v3, :cond_2

    const/4 v4, 0x1

    if-eq v3, v4, :cond_1

    const/4 v4, 0x2

    if-eq v3, v4, :cond_0

    goto :goto_0

    .line 5
    :cond_0
    iget-object v2, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalitiesJsonAdapter;->nullableWellBeingDetailStatsAdapter:Lcom/squareup/moshi/JsonAdapter;

    invoke-virtual {v2, p1}, Lcom/squareup/moshi/JsonAdapter;->fromJson(Lcom/squareup/moshi/JsonReader;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;

    goto :goto_0

    .line 6
    :cond_1
    iget-object v1, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalitiesJsonAdapter;->nullableWellBeingDetailStatsAdapter:Lcom/squareup/moshi/JsonAdapter;

    invoke-virtual {v1, p1}, Lcom/squareup/moshi/JsonAdapter;->fromJson(Lcom/squareup/moshi/JsonReader;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;

    goto :goto_0

    .line 7
    :cond_2
    iget-object v0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalitiesJsonAdapter;->nullableWellBeingDetailStatsAdapter:Lcom/squareup/moshi/JsonAdapter;

    invoke-virtual {v0, p1}, Lcom/squareup/moshi/JsonAdapter;->fromJson(Lcom/squareup/moshi/JsonReader;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;

    goto :goto_0

    .line 8
    :cond_3
    invoke-virtual {p1}, Lcom/squareup/moshi/JsonReader;->skipName()V

    .line 9
    invoke-virtual {p1}, Lcom/squareup/moshi/JsonReader;->skipValue()V

    goto :goto_0

    .line 10
    :cond_4
    invoke-virtual {p1}, Lcom/squareup/moshi/JsonReader;->endObject()V

    .line 11
    new-instance p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;

    invoke-direct {p0, v0, v1, v2}, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;-><init>(Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;)V

    return-object p0
.end method

.method public bridge synthetic fromJson(Lcom/squareup/moshi/JsonReader;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalitiesJsonAdapter;->fromJson(Lcom/squareup/moshi/JsonReader;)Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;

    move-result-object p0

    return-object p0
.end method

.method public toJson(Lcom/squareup/moshi/JsonWriter;Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;)V
    .locals 2

    const-string v0, "writer"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz p2, :cond_0

    .line 2
    invoke-virtual {p1}, Lcom/squareup/moshi/JsonWriter;->beginObject()Lcom/squareup/moshi/JsonWriter;

    .line 3
    const-string v0, "hr"

    invoke-virtual {p1, v0}, Lcom/squareup/moshi/JsonWriter;->name(Ljava/lang/String;)Lcom/squareup/moshi/JsonWriter;

    .line 4
    iget-object v0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalitiesJsonAdapter;->nullableWellBeingDetailStatsAdapter:Lcom/squareup/moshi/JsonAdapter;

    invoke-virtual {p2}, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;->getHr()Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/squareup/moshi/JsonAdapter;->toJson(Lcom/squareup/moshi/JsonWriter;Ljava/lang/Object;)V

    .line 5
    const-string v0, "hrv"

    invoke-virtual {p1, v0}, Lcom/squareup/moshi/JsonWriter;->name(Ljava/lang/String;)Lcom/squareup/moshi/JsonWriter;

    .line 6
    iget-object v0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalitiesJsonAdapter;->nullableWellBeingDetailStatsAdapter:Lcom/squareup/moshi/JsonAdapter;

    invoke-virtual {p2}, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;->getHrv()Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/squareup/moshi/JsonAdapter;->toJson(Lcom/squareup/moshi/JsonWriter;Ljava/lang/Object;)V

    .line 7
    const-string v0, "rr"

    invoke-virtual {p1, v0}, Lcom/squareup/moshi/JsonWriter;->name(Ljava/lang/String;)Lcom/squareup/moshi/JsonWriter;

    .line 8
    iget-object p0, p0, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalitiesJsonAdapter;->nullableWellBeingDetailStatsAdapter:Lcom/squareup/moshi/JsonAdapter;

    invoke-virtual {p2}, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;->getRr()Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingDetailStats;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/squareup/moshi/JsonAdapter;->toJson(Lcom/squareup/moshi/JsonWriter;Ljava/lang/Object;)V

    .line 9
    invoke-virtual {p1}, Lcom/squareup/moshi/JsonWriter;->endObject()Lcom/squareup/moshi/JsonWriter;

    return-void

    .line 10
    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    const-string p1, "value_ was null! Wrap in .nullSafe() to write nullable values."

    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public bridge synthetic toJson(Lcom/squareup/moshi/JsonWriter;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p2, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;

    invoke-virtual {p0, p1, p2}, Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalitiesJsonAdapter;->toJson(Lcom/squareup/moshi/JsonWriter;Lcom/eightsleep/data_metrics/data/model/health_score/WellBeingAbnormalities;)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    const/16 p0, 0x2c

    const-string v0, "GeneratedJsonAdapter(WellBeingAbnormalities)"

    invoke-static {p0, v0}, Lcom/eightsleep/data_bioage/data/model/a;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
