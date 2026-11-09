.class public final Lng/a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lng/k;

.field public final b:Lng/o;

.field public final c:Lng/c;

.field public final d:Ljava/util/List;

.field public final e:I


# direct methods
.method public constructor <init>(LGa/f;)V
    .locals 6

    .line 11
    new-instance v1, Lng/k;

    const/4 v0, 0x0

    const/16 v2, 0xf

    invoke-direct {v1, v0, v0, v0, v2}, Lng/k;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/time/ZoneOffset;I)V

    move v3, v2

    .line 12
    new-instance v2, Lng/o;

    invoke-direct {v2, p1}, Lng/o;-><init>(LGa/f;)V

    move p1, v3

    .line 13
    new-instance v3, Lng/c;

    invoke-direct {v3, v0, v0, p1}, Lng/c;-><init>(Ljava/lang/String;LGa/s;I)V

    .line 14
    sget-object v4, LIm/z;->a:LIm/z;

    const/4 v5, -0x1

    move-object v0, p0

    .line 15
    invoke-direct/range {v0 .. v5}, Lng/a;-><init>(Lng/k;Lng/o;Lng/c;Ljava/util/List;I)V

    return-void
.end method

.method public synthetic constructor <init>(Lng/k;Lng/o;Lng/c;I)V
    .locals 9

    and-int/lit8 v0, p4, 0x1

    const/16 v1, 0xf

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 7
    new-instance p1, Lng/k;

    invoke-direct {p1, v2, v2, v2, v1}, Lng/k;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/time/ZoneOffset;I)V

    :cond_0
    move-object v4, p1

    and-int/lit8 p1, p4, 0x4

    if-eqz p1, :cond_1

    .line 8
    new-instance p3, Lng/c;

    invoke-direct {p3, v2, v2, v1}, Lng/c;-><init>(Ljava/lang/String;LGa/s;I)V

    :cond_1
    move-object v6, p3

    .line 9
    sget-object v7, LIm/z;->a:LIm/z;

    const/4 v8, -0x1

    move-object v3, p0

    move-object v5, p2

    .line 10
    invoke-direct/range {v3 .. v8}, Lng/a;-><init>(Lng/k;Lng/o;Lng/c;Ljava/util/List;I)V

    return-void
.end method

.method public constructor <init>(Lng/k;Lng/o;Lng/c;Ljava/util/List;I)V
    .locals 1

    const-string v0, "location"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "schedule"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "flight"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lng/a;->a:Lng/k;

    .line 3
    iput-object p2, p0, Lng/a;->b:Lng/o;

    .line 4
    iput-object p3, p0, Lng/a;->c:Lng/c;

    .line 5
    iput-object p4, p0, Lng/a;->d:Ljava/util/List;

    .line 6
    iput p5, p0, Lng/a;->e:I

    return-void
.end method

.method public static a(Lng/a;Lng/k;Lng/o;Lng/c;Ljava/util/ArrayList;II)Lng/a;
    .locals 6

    and-int/lit8 v0, p6, 0x1

    if-eqz v0, :cond_0

    iget-object p1, p0, Lng/a;->a:Lng/k;

    :cond_0
    move-object v1, p1

    and-int/lit8 p1, p6, 0x2

    if-eqz p1, :cond_1

    iget-object p2, p0, Lng/a;->b:Lng/o;

    :cond_1
    move-object v2, p2

    and-int/lit8 p1, p6, 0x4

    if-eqz p1, :cond_2

    iget-object p3, p0, Lng/a;->c:Lng/c;

    :cond_2
    move-object v3, p3

    and-int/lit8 p1, p6, 0x8

    if-eqz p1, :cond_3

    iget-object p4, p0, Lng/a;->d:Ljava/util/List;

    :cond_3
    move-object v4, p4

    and-int/lit8 p1, p6, 0x10

    if-eqz p1, :cond_4

    iget p5, p0, Lng/a;->e:I

    :cond_4
    move v5, p5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string p0, "location"

    invoke-static {v1, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "schedule"

    invoke-static {v2, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "flight"

    invoke-static {v3, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "flightSearchResults"

    invoke-static {v4, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lng/a;

    invoke-direct/range {v0 .. v5}, Lng/a;-><init>(Lng/k;Lng/o;Lng/c;Ljava/util/List;I)V

    return-object v0
.end method


# virtual methods
.method public final b()Z
    .locals 0

    iget-object p0, p0, Lng/a;->c:Lng/c;

    iget-object p0, p0, Lng/c;->a:Ljava/lang/String;

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lng/a;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lng/a;

    iget-object v1, p1, Lng/a;->a:Lng/k;

    iget-object v3, p0, Lng/a;->a:Lng/k;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lng/a;->b:Lng/o;

    iget-object v3, p1, Lng/a;->b:Lng/o;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lng/a;->c:Lng/c;

    iget-object v3, p1, Lng/a;->c:Lng/c;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    :cond_4
    iget-object v1, p0, Lng/a;->d:Ljava/util/List;

    iget-object v3, p1, Lng/a;->d:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    return v2

    :cond_5
    iget p0, p0, Lng/a;->e:I

    iget p1, p1, Lng/a;->e:I

    if-eq p0, p1, :cond_6

    return v2

    :cond_6
    return v0
.end method

.method public final hashCode()I
    .locals 3

    iget-object v0, p0, Lng/a;->a:Lng/k;

    invoke-virtual {v0}, Lng/k;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lng/a;->b:Lng/o;

    invoke-virtual {v2}, Lng/o;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lng/a;->c:Lng/c;

    invoke-virtual {v0}, Lng/c;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lng/a;->d:Ljava/util/List;

    invoke-static {v0, v1, v2}, LB/h;->d(IILjava/util/List;)I

    move-result v0

    iget p0, p0, Lng/a;->e:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DestinationUiModel(location="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lng/a;->a:Lng/k;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", schedule="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lng/a;->b:Lng/o;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", flight="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lng/a;->c:Lng/c;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", flightSearchResults="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lng/a;->d:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", selectedSearchResultIndex="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lng/a;->e:I

    const-string v1, ")"

    invoke-static {p0, v1, v0}, LB/h;->i(ILjava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
