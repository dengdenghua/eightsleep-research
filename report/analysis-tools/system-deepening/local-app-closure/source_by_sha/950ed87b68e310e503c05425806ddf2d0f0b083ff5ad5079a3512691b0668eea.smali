.class public abstract Lbn/J;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final A(Ljava/lang/Class;Ljava/util/List;)Lbn/F;
    .locals 4

    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    const/16 v1, 0xa

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/ArrayList;

    invoke-static {p1, v1}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbn/B;

    invoke-static {v1}, Lbn/J;->J(Lbn/B;)Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    new-instance p1, Lbn/F;

    const/4 v1, 0x0

    invoke-direct {p1, p0, v1, v0}, Lbn/F;-><init>(Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/util/ArrayList;)V

    return-object p1

    :cond_1
    invoke-virtual {p0}, Ljava/lang/Class;->getModifiers()I

    move-result v2

    invoke-static {v2}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v2

    if-eqz v2, :cond_3

    new-instance v2, Ljava/util/ArrayList;

    invoke-static {p1, v1}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbn/B;

    invoke-static {v1}, Lbn/J;->J(Lbn/B;)Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    new-instance p1, Lbn/F;

    invoke-direct {p1, p0, v0, v2}, Lbn/F;-><init>(Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/util/ArrayList;)V

    return-object p1

    :cond_3
    invoke-virtual {p0}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object v2

    array-length v2, v2

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {p1, v2, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v3

    invoke-static {v0, v3}, Lbn/J;->A(Ljava/lang/Class;Ljava/util/List;)Lbn/F;

    move-result-object v0

    const/4 v3, 0x0

    invoke-interface {p1, v3, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p1

    new-instance v2, Ljava/util/ArrayList;

    invoke-static {p1, v1}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbn/B;

    invoke-static {v1}, Lbn/J;->J(Lbn/B;)Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_4
    new-instance p1, Lbn/F;

    invoke-direct {p1, p0, v0, v2}, Lbn/F;-><init>(Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/util/ArrayList;)V

    return-object p1
.end method

.method public static B(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 8

    const-string v0, "current"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_1

    goto :goto_2

    :cond_1
    move v0, v2

    move v3, v0

    move v4, v3

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v0, v5, :cond_5

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v5

    add-int/lit8 v6, v4, 0x1

    const/16 v7, 0x28

    if-nez v4, :cond_2

    if-eq v5, v7, :cond_2

    goto :goto_2

    :cond_2
    if-ne v5, v7, :cond_3

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_3
    const/16 v7, 0x29

    if-ne v5, v7, :cond_4

    add-int/lit8 v3, v3, -0x1

    if-nez v3, :cond_4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v1

    if-eq v4, v5, :cond_4

    goto :goto_2

    :cond_4
    :goto_1
    add-int/lit8 v0, v0, 0x1

    move v4, v6

    goto :goto_0

    :cond_5
    if-nez v3, :cond_6

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v1

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    const-string v0, "this as java.lang.String\u2026ing(startIndex, endIndex)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0}, Llo/n;->M0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_6
    :goto_2
    return v2
.end method

.method public static C(Ljava/io/File;)Z
    .locals 5

    const/4 v0, 0x1

    if-eqz p0, :cond_5

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result p0

    return p0

    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    if-nez v1, :cond_2

    return v0

    :cond_2
    array-length v0, v1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v0, :cond_4

    aget-object v4, v1, v3

    invoke-static {v4}, Lbn/J;->C(Ljava/io/File;)Z

    move-result v4

    if-nez v4, :cond_3

    return v2

    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_4
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result p0

    return p0

    :cond_5
    :goto_1
    return v0
.end method

.method public static D(Lkn/b;Lkn/b;)Z
    .locals 5

    const-string v0, "superDescriptor"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "subDescriptor"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    instance-of v0, p1, Lvn/f;

    if-eqz v0, :cond_2

    instance-of v0, p0, Lkn/v;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    move-object v0, p1

    check-cast v0, Lvn/f;

    invoke-virtual {v0}, Lnn/s;->O()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    check-cast p0, Lkn/v;

    invoke-interface {p0}, Lkn/b;->O()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    invoke-virtual {v0}, Lnn/I;->g1()Lnn/I;

    move-result-object v0

    invoke-virtual {v0}, Lnn/s;->O()Ljava/util/List;

    move-result-object v0

    const-string v1, "subDescriptor.original.valueParameters"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p0}, Lkn/v;->a()Lkn/v;

    move-result-object v1

    invoke-interface {v1}, Lkn/b;->O()Ljava/util/List;

    move-result-object v1

    const-string v2, "superDescriptor.original.valueParameters"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v0, v1}, LIm/r;->Z1(Ljava/util/Collection;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, LHm/k;

    iget-object v2, v1, LHm/k;->a:Ljava/lang/Object;

    check-cast v2, Lnn/O;

    iget-object v1, v1, LHm/k;->b:Ljava/lang/Object;

    check-cast v1, Lnn/O;

    move-object v3, p1

    check-cast v3, Lkn/v;

    const-string v4, "subParameter"

    invoke-static {v2, v4}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v3, v2}, Lbn/J;->N(Lkn/v;Lnn/O;)LBn/l;

    move-result-object v2

    instance-of v2, v2, LBn/k;

    const-string v3, "superParameter"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0, v1}, Lbn/J;->N(Lkn/v;Lnn/O;)LBn/l;

    move-result-object v1

    instance-of v1, v1, LBn/k;

    if-eq v2, v1, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_2
    :goto_0
    const/4 p0, 0x0

    return p0
.end method

.method public static final E(Ljava/lang/String;I)V
    .locals 1

    const-string v0, "methodName"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0}, Lbn/J;->S(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p1}, Landroid/os/Trace;->endAsyncSection(Ljava/lang/String;I)V

    return-void
.end method

.method public static F(Lcom/google/gson/o;)LD7/x;
    .locals 3

    const-string v0, "id"

    const-string v1, "Unable to parse json into type Action"

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/gson/m;->k()Ljava/lang/String;

    move-result-object p0

    new-instance v2, LD7/x;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v2, p0}, LD7/x;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    goto :goto_1

    :catch_2
    move-exception p0

    goto :goto_2

    :goto_0
    new-instance v0, Lcom/google/gson/JsonParseException;

    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :goto_1
    new-instance v0, Lcom/google/gson/JsonParseException;

    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :goto_2
    new-instance v0, Lcom/google/gson/JsonParseException;

    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static G(Lcom/google/gson/o;)Lz7/w;
    .locals 4

    const-string v0, "Unable to parse json into type DdSession"

    :try_start_0
    const-string v1, "plan"

    invoke-virtual {p0, v1}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/google/gson/m;->k()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    sget-object v3, Lz7/K;->Companion:Lz7/J;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Lz7/J;->a(Ljava/lang/String;)Lz7/K;

    move-result-object v1

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_1

    :catch_1
    move-exception p0

    goto :goto_2

    :catch_2
    move-exception p0

    goto :goto_3

    :cond_0
    move-object v1, v2

    :goto_0
    const-string v3, "session_precondition"

    invoke-virtual {p0, v3}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Lcom/google/gson/m;->k()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_1

    sget-object v2, Lz7/O;->Companion:Lz7/N;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Lz7/N;->a(Ljava/lang/String;)Lz7/O;

    move-result-object v2

    :cond_1
    new-instance p0, Lz7/w;

    invoke-direct {p0, v1, v2}, Lz7/w;-><init>(Lz7/K;Lz7/O;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :goto_1
    new-instance v1, Lcom/google/gson/JsonParseException;

    invoke-direct {v1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :goto_2
    new-instance v1, Lcom/google/gson/JsonParseException;

    invoke-direct {v1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :goto_3
    new-instance v1, Lcom/google/gson/JsonParseException;

    invoke-direct {v1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static H(Lcom/google/gson/o;)Lz7/W1;
    .locals 3

    const-string v0, "id"

    const-string v1, "Unable to parse json into type Application"

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/gson/m;->k()Ljava/lang/String;

    move-result-object p0

    new-instance v2, Lz7/W1;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v2, p0}, Lz7/W1;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    goto :goto_1

    :catch_2
    move-exception p0

    goto :goto_2

    :goto_0
    new-instance v0, Lcom/google/gson/JsonParseException;

    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :goto_1
    new-instance v0, Lcom/google/gson/JsonParseException;

    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :goto_2
    new-instance v0, Lcom/google/gson/JsonParseException;

    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static final I(Lbn/y;)Ljava/lang/reflect/Type;
    .locals 1

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    instance-of v0, p0, Lkotlin/jvm/internal/m;

    if-eqz v0, :cond_1

    move-object v0, p0

    check-cast v0, Lkotlin/jvm/internal/m;

    check-cast v0, Len/o0;

    iget-object v0, v0, Len/o0;->b:Len/t0;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Len/t0;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Type;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    return-object v0

    :cond_1
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lbn/J;->z(Lbn/y;Z)Ljava/lang/reflect/Type;

    move-result-object p0

    return-object p0
.end method

.method public static final J(Lbn/B;)Ljava/lang/reflect/Type;
    .locals 4

    iget-object v0, p0, Lbn/B;->a:Lbn/C;

    if-nez v0, :cond_0

    sget-object p0, Lbn/K;->c:Lbn/K;

    return-object p0

    :cond_0
    iget-object p0, p0, Lbn/B;->b:Len/o0;

    invoke-static {p0}, Lkotlin/jvm/internal/l;->g(Ljava/lang/Object;)V

    sget-object v1, Lbn/H;->a:[I

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    aget v0, v1, v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_3

    const/4 v3, 0x2

    if-eq v0, v3, :cond_2

    const/4 v3, 0x3

    if-ne v0, v3, :cond_1

    new-instance v0, Lbn/K;

    invoke-static {p0, v2}, Lbn/J;->z(Lbn/y;Z)Ljava/lang/reflect/Type;

    move-result-object p0

    invoke-direct {v0, p0, v1}, Lbn/K;-><init>(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)V

    return-object v0

    :cond_1
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0

    :cond_2
    invoke-static {p0, v2}, Lbn/J;->z(Lbn/y;Z)Ljava/lang/reflect/Type;

    move-result-object p0

    return-object p0

    :cond_3
    new-instance v0, Lbn/K;

    invoke-static {p0, v2}, Lbn/J;->z(Lbn/y;Z)Ljava/lang/reflect/Type;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lbn/K;-><init>(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)V

    return-object v0
.end method

.method public static K(LS8/k;LNm/i;)LGc/h;
    .locals 2

    check-cast p0, LS8/n;

    iget-object p1, p0, LS8/n;->a:Lcom/eightsleep/data_adjustablebase/data/repository/BaseRepository;

    invoke-virtual {p1}, Lcom/eightsleep/data_adjustablebase/data/repository/BaseRepository;->getBaseState()Lzo/r0;

    move-result-object p1

    new-instance v0, LGc/h;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1, p0}, LGc/h;-><init>(Lzo/r0;Ljava/lang/String;LS8/n;)V

    return-object v0
.end method

.method public static synthetic L(Lld/O0;LGa/b;Ljava/lang/String;Lcom/eightsleep/data_core/enums/DeviceType;LNm/c;I)Ljava/lang/Object;
    .locals 2

    and-int/lit8 v0, p5, 0x1

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    move-object p1, v1

    :cond_0
    and-int/lit8 v0, p5, 0x2

    if-eqz v0, :cond_1

    move-object p2, v1

    :cond_1
    and-int/lit8 p5, p5, 0x4

    if-eqz p5, :cond_2

    move-object p3, v1

    :cond_2
    check-cast p0, Lld/P0;

    invoke-virtual {p0, p1, p2, p3, p4}, Lld/P0;->a(LGa/b;Ljava/lang/String;Lcom/eightsleep/data_core/enums/DeviceType;LNm/c;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static M(B)Z
    .locals 1

    const/16 v0, -0x41

    if-le p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static N(Lkn/v;Lnn/O;)LBn/l;
    .locals 8

    const-string v0, "f"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v0, p0

    check-cast v0, Lnn/l;

    invoke-virtual {v0}, Lnn/l;->getName()LIn/g;

    move-result-object v0

    invoke-virtual {v0}, LIn/g;->b()Ljava/lang/String;

    move-result-object v0

    const-string v1, "remove"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    sget-object v1, Ljo/c;->a:Ljo/c;

    const-string v2, "valueParameterDescriptor.type"

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v0, :cond_5

    invoke-interface {p0}, Lkn/b;->O()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ne v0, v4, :cond_5

    invoke-static {p0}, LPn/e;->k(Lkn/d;)Lkn/d;

    move-result-object v0

    invoke-interface {v0}, Lkn/l;->j()Lkn/l;

    move-result-object v0

    instance-of v0, v0, Lvn/c;

    if-nez v0, :cond_5

    invoke-static {p0}, Lhn/h;->y(Lkn/l;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_2

    :cond_0
    invoke-interface {p0}, Lkn/v;->a()Lkn/v;

    move-result-object v0

    invoke-interface {v0}, Lkn/b;->O()Ljava/util/List;

    move-result-object v0

    const-string v5, "f.original.valueParameters"

    invoke-static {v0, v5}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v0}, LIm/r;->F1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnn/O;

    check-cast v0, Lnn/P;

    invoke-virtual {v0}, Lnn/P;->getType()LZn/x;

    move-result-object v0

    const-string v5, "f.original.valueParameters.single().type"

    invoke-static {v0, v5}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v5, LBn/t;->k:LBn/t;

    invoke-static {v0, v5, v1}, LP2/e;->M(LZn/x;LBn/t;LVm/o;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LBn/l;

    instance-of v6, v0, LBn/k;

    if-eqz v6, :cond_1

    check-cast v0, LBn/k;

    goto :goto_0

    :cond_1
    move-object v0, v3

    :goto_0
    if-eqz v0, :cond_2

    iget-object v0, v0, LBn/k;->i:LQn/c;

    goto :goto_1

    :cond_2
    move-object v0, v3

    :goto_1
    sget-object v6, LQn/c;->INT:LQn/c;

    if-eq v0, v6, :cond_3

    goto :goto_2

    :cond_3
    invoke-static {p0}, Ltn/f;->a(Lkn/v;)Lkn/v;

    move-result-object v0

    if-nez v0, :cond_4

    goto :goto_2

    :cond_4
    invoke-interface {v0}, Lkn/v;->a()Lkn/v;

    move-result-object v6

    invoke-interface {v6}, Lkn/b;->O()Ljava/util/List;

    move-result-object v6

    const-string v7, "overridden.original.valueParameters"

    invoke-static {v6, v7}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v6}, LIm/r;->F1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lnn/O;

    check-cast v6, Lnn/P;

    invoke-virtual {v6}, Lnn/P;->getType()LZn/x;

    move-result-object v6

    const-string v7, "overridden.original.valueParameters.single().type"

    invoke-static {v6, v7}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v6, v5, v1}, LP2/e;->M(LZn/x;LBn/t;LVm/o;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, LBn/l;

    invoke-interface {v0}, Lkn/l;->j()Lkn/l;

    move-result-object v0

    const-string v6, "overridden.containingDeclaration"

    invoke-static {v0, v6}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v0}, LPn/e;->h(Lkn/l;)LIn/e;

    move-result-object v0

    sget-object v6, Lhn/n;->J:LIn/c;

    invoke-virtual {v6}, LIn/c;->i()LIn/e;

    move-result-object v6

    invoke-virtual {v0, v6}, LIn/e;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    instance-of v0, v5, LBn/j;

    if-eqz v0, :cond_5

    check-cast v5, LBn/j;

    iget-object v0, v5, LBn/j;->i:Ljava/lang/String;

    const-string v5, "java/lang/Object"

    invoke-static {v0, v5}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    goto :goto_4

    :cond_5
    :goto_2
    invoke-interface {p0}, Lkn/b;->O()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eq v0, v4, :cond_6

    goto :goto_5

    :cond_6
    invoke-interface {p0}, Lkn/l;->j()Lkn/l;

    move-result-object v0

    instance-of v4, v0, Lkn/f;

    if-eqz v4, :cond_7

    check-cast v0, Lkn/f;

    goto :goto_3

    :cond_7
    move-object v0, v3

    :goto_3
    if-nez v0, :cond_8

    goto :goto_5

    :cond_8
    invoke-interface {p0}, Lkn/b;->O()Ljava/util/List;

    move-result-object p0

    const-string v4, "f.valueParameters"

    invoke-static {p0, v4}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0}, LIm/r;->F1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnn/O;

    check-cast p0, Lnn/P;

    invoke-virtual {p0}, Lnn/P;->getType()LZn/x;

    move-result-object p0

    invoke-virtual {p0}, LZn/x;->o0()LZn/N;

    move-result-object p0

    invoke-interface {p0}, LZn/N;->j()Lkn/i;

    move-result-object p0

    instance-of v4, p0, Lkn/f;

    if-eqz v4, :cond_9

    move-object v3, p0

    check-cast v3, Lkn/f;

    :cond_9
    if-nez v3, :cond_a

    goto :goto_5

    :cond_a
    invoke-static {v0}, Lhn/h;->s(Lkn/f;)Lhn/k;

    move-result-object p0

    if-eqz p0, :cond_b

    invoke-static {v0}, LPn/e;->g(Lkn/l;)LIn/c;

    move-result-object p0

    invoke-static {v3}, LPn/e;->g(Lkn/l;)LIn/c;

    move-result-object v0

    invoke-virtual {p0, v0}, LIn/c;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b

    :goto_4
    check-cast p1, Lnn/P;

    invoke-virtual {p1}, Lnn/P;->getType()LZn/x;

    move-result-object p0

    invoke-static {p0, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0}, LP2/c;->C(LZn/x;)LZn/d0;

    move-result-object p0

    sget-object p1, LBn/t;->k:LBn/t;

    invoke-static {p0, p1, v1}, LP2/e;->M(LZn/x;LBn/t;LVm/o;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, LBn/l;

    return-object p0

    :cond_b
    :goto_5
    check-cast p1, Lnn/P;

    invoke-virtual {p1}, Lnn/P;->getType()LZn/x;

    move-result-object p0

    invoke-static {p0, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object p1, LBn/t;->k:LBn/t;

    invoke-static {p0, p1, v1}, LP2/e;->M(LZn/x;LBn/t;LVm/o;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, LBn/l;

    return-object p0
.end method

.method public static O(JLjava/lang/String;)[B
    .locals 4

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Ljava/io/File;->canRead()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v1

    cmp-long v1, v1, p0

    if-gtz v1, :cond_1

    new-instance p0, Ljava/io/FileInputStream;

    invoke-direct {p0, p2}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    :try_start_0
    new-instance p1, Ljava/io/BufferedInputStream;

    invoke-direct {p1, p0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    new-instance p2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p2}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    const/16 v0, 0x400

    :try_start_2
    new-array v0, v0, [B

    :goto_0
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    const/4 v2, 0x0

    invoke-virtual {p2, v0, v2, v1}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :cond_0
    invoke-virtual {p2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-virtual {p2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :try_start_4
    invoke-virtual {p1}, Ljava/io/BufferedInputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    invoke-virtual {p0}, Ljava/io/FileInputStream;->close()V

    return-object v0

    :catchall_1
    move-exception p1

    goto :goto_5

    :catchall_2
    move-exception p2

    goto :goto_3

    :goto_1
    :try_start_5
    invoke-virtual {p2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    goto :goto_2

    :catchall_3
    move-exception p2

    :try_start_6
    invoke-virtual {v0, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_2
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :goto_3
    :try_start_7
    invoke-virtual {p1}, Ljava/io/BufferedInputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    goto :goto_4

    :catchall_4
    move-exception p1

    :try_start_8
    invoke-virtual {p2, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_4
    throw p2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :goto_5
    :try_start_9
    invoke-virtual {p0}, Ljava/io/FileInputStream;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    goto :goto_6

    :catchall_5
    move-exception p0

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_6
    throw p1

    :cond_1
    new-instance v1, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    filled-new-array {p2, v0, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "Reading file failed, because size located at \'%s\' with %d bytes is bigger than the maximum allowed size of %d bytes."

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_2
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Reading the item "

    const-string v0, " failed, because can\'t read the file."

    invoke-static {p1, p2, v0}, LB/h;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Reading path "

    const-string v0, " failed, because it\'s not a file."

    invoke-static {p1, p2, v0}, LB/h;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_4
    new-instance p0, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p1

    const-string p2, "File \'"

    const-string v0, "\' doesn\'t exists"

    invoke-static {p2, p1, v0}, LB/h;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static P(Ljava/io/File;)Ljava/lang/String;
    .locals 3

    if-eqz p0, :cond_3

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Ljava/io/File;->canRead()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_3

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/FileReader;

    invoke-direct {v2, p0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    :try_start_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_1
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_2

    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :goto_1
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v0

    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_2
    throw p0

    :cond_3
    :goto_3
    const/4 p0, 0x0

    return-object p0
.end method

.method public static final Q(LJd/q;Lzn/b;)Lwn/c;
    .locals 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "annotationsOwner"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lwn/c;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lwn/c;-><init>(LJd/q;Lzn/b;Z)V

    return-object v0
.end method

.method public static final R(J)Ljava/lang/String;
    .locals 4

    sget v0, Lmo/b;->d:I

    sget-object v0, Lmo/d;->HOURS:Lmo/d;

    invoke-static {p0, p1, v0}, Lmo/b;->m(JLmo/d;)J

    move-result-wide v0

    invoke-static {p0, p1}, Lmo/b;->h(J)I

    move-result v2

    invoke-static {p0, p1}, Lmo/b;->j(J)I

    move-result v3

    invoke-static {p0, p1}, Lmo/b;->i(J)I

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x2

    invoke-static {p1, p0}, Llo/n;->u0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Llo/n;->u0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Llo/n;->u0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ":"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static S(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x7f

    if-gt v0, v1, :cond_0

    move-object v0, p0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    const-string v0, "substring(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0

    :cond_1
    return-object v0
.end method

.method public static final T(LI/q;)I
    .locals 5

    iget-object v0, p0, LI/q;->k:Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return v2

    :cond_0
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v1

    move v3, v2

    :goto_0
    if-ge v2, v1, :cond_1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, LI/r;

    iget v4, v4, LI/r;->p:I

    add-int/2addr v3, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    div-int/2addr v3, v0

    iget p0, p0, LI/q;->q:I

    add-int/2addr v3, p0

    return v3
.end method

.method public static U(Lg6/c;LVm/n;)V
    .locals 2

    check-cast p0, Lp6/l;

    iget-object v0, p0, Lp6/l;->a:Lp6/d;

    iget-object v0, v0, Lp6/d;->k:Lp6/a;

    instance-of v1, v0, Lp6/g;

    if-eqz v1, :cond_0

    return-void

    :cond_0
    invoke-interface {v0}, Lp6/a;->getContext()Lf6/a;

    move-result-object v0

    iget-object p0, p0, Lp6/l;->g:Lx6/i;

    new-instance v1, Lio/sentry/android/replay/capture/n;

    invoke-direct {v1, p1, v0}, Lio/sentry/android/replay/capture/n;-><init>(LVm/n;Lf6/a;)V

    invoke-interface {p0, v0, v1}, Lx6/i;->c(Lf6/a;Lio/sentry/android/replay/capture/n;)V

    return-void
.end method

.method public static final a(Lwg/t;LVm/a;LVm/a;LVm/a;LVm/a;Lm0/l;I)V
    .locals 11

    const-string v0, "onRestingHeartRateClick"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onHeartVariabilityRateClick"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onBreathRateClick"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onSnoringClick"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v6, p5

    check-cast v6, Lm0/q;

    const v0, -0x27ad13c2

    invoke-virtual {v6, v0}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v6, p0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int v0, p6, v0

    invoke-virtual {v6, p1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    const/16 v7, 0x20

    goto :goto_1

    :cond_1
    const/16 v7, 0x10

    :goto_1
    or-int/2addr v0, v7

    invoke-virtual {v6, p2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    const/16 v7, 0x100

    goto :goto_2

    :cond_2
    const/16 v7, 0x80

    :goto_2
    or-int/2addr v0, v7

    invoke-virtual {v6, p3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    const/16 v7, 0x800

    goto :goto_3

    :cond_3
    const/16 v7, 0x400

    :goto_3
    or-int/2addr v0, v7

    invoke-virtual {v6, p4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    const/16 v7, 0x4000

    goto :goto_4

    :cond_4
    const/16 v7, 0x2000

    :goto_4
    or-int/2addr v0, v7

    and-int/lit16 v0, v0, 0x2493

    const/16 v7, 0x2492

    if-ne v0, v7, :cond_6

    invoke-virtual {v6}, Lm0/q;->H()Z

    move-result v0

    if-nez v0, :cond_5

    goto :goto_5

    :cond_5
    invoke-virtual {v6}, Lm0/q;->Y()V

    move-object v5, v6

    goto :goto_6

    :cond_6
    :goto_5
    sget-object v0, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->b:Lm0/c1;

    invoke-virtual {v6, v0}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-static {v6}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v0

    iget v0, v0, Lhh/i;->e:F

    invoke-static {v6}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v7

    iget v7, v7, Lhh/i;->e:F

    invoke-static {v6}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v8

    iget v8, v8, Lhh/i;->e:F

    const/16 v9, 0x8

    const/4 v10, 0x0

    invoke-static {v0, v8, v7, v10, v9}, LG/e;->g(FFFFI)LG/N0;

    move-result-object v7

    new-instance v0, LBg/c;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, LBg/c;-><init>(Lwg/t;LVm/a;LVm/a;LVm/a;LVm/a;)V

    const v1, -0x5cddd02d

    invoke-static {v1, v0, v6}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v4

    const/4 v1, 0x0

    const/4 v3, 0x0

    move-object v5, v6

    const/16 v6, 0xc00

    move-object v2, v7

    const/4 v7, 0x5

    invoke-static/range {v1 .. v7}, LP2/f;->q(LA0/r;LG/N0;LVm/a;Lu0/d;Lm0/l;II)V

    :goto_6
    invoke-virtual {v5}, Lm0/q;->u()Lm0/t0;

    move-result-object v8

    if-eqz v8, :cond_7

    new-instance v0, LAe/t;

    const/4 v2, 0x1

    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    move-object v7, p4

    move/from16 v1, p6

    invoke-direct/range {v0 .. v7}, LAe/t;-><init>(IILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, v8, Lm0/t0;->d:LVm/n;

    :cond_7
    return-void
.end method

.method public static final b(LTg/a;JLm0/l;I)V
    .locals 11

    sget-object v0, LG/x;->a:LG/x;

    check-cast p3, Lm0/q;

    const v1, -0x77cf9a91

    invoke-virtual {p3, v1}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {p3, p0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0x20

    goto :goto_0

    :cond_0
    const/16 v1, 0x10

    :goto_0
    or-int/2addr v1, p4

    invoke-virtual {p3, p1, p2}, Lm0/q;->f(J)Z

    move-result v2

    const/16 v3, 0x100

    if-eqz v2, :cond_1

    move v2, v3

    goto :goto_1

    :cond_1
    const/16 v2, 0x80

    :goto_1
    or-int/2addr v1, v2

    and-int/lit16 v2, v1, 0x93

    const/16 v4, 0x92

    if-ne v2, v4, :cond_3

    invoke-virtual {p3}, Lm0/q;->H()Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {p3}, Lm0/q;->Y()V

    move-object v6, p0

    move-wide v7, p1

    goto :goto_6

    :cond_3
    :goto_2
    invoke-static {p3}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v2

    iget-object v2, v2, Lhh/h;->d:Lhh/g;

    iget-wide v9, v2, Lhh/g;->e:J

    sget-object v2, LA0/o;->a:LA0/o;

    invoke-virtual {v0, v2}, LG/x;->matchParentSize(LA0/r;)LA0/r;

    move-result-object v0

    const v2, -0x632ef6bb

    invoke-virtual {p3, v2}, Lm0/q;->f0(I)V

    and-int/lit16 v1, v1, 0x380

    const/4 v2, 0x0

    if-ne v1, v3, :cond_4

    const/4 v1, 0x1

    goto :goto_3

    :cond_4
    move v1, v2

    :goto_3
    invoke-virtual {p3, p0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v3

    or-int/2addr v1, v3

    invoke-virtual {p3, v9, v10}, Lm0/q;->f(J)Z

    move-result v3

    or-int/2addr v1, v3

    invoke-virtual {p3}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v3

    if-nez v1, :cond_6

    sget-object v1, Lm0/k;->a:Lm0/e;

    if-ne v3, v1, :cond_5

    goto :goto_4

    :cond_5
    move-object v6, p0

    move-wide v7, p1

    goto :goto_5

    :cond_6
    :goto_4
    new-instance v4, LCg/e0;

    const/4 v5, 0x1

    move-object v6, p0

    move-wide v7, p1

    invoke-direct/range {v4 .. v10}, LCg/e0;-><init>(ILjava/lang/Object;JJ)V

    invoke-virtual {p3, v4}, Lm0/q;->q0(Ljava/lang/Object;)V

    move-object v3, v4

    :goto_5
    check-cast v3, LVm/k;

    invoke-virtual {p3, v2}, Lm0/q;->q(Z)V

    invoke-static {v0, v3}, LE0/i;->e(LA0/r;LVm/k;)LA0/r;

    move-result-object p0

    invoke-static {p0, p3, v2}, LG/t;->a(LA0/r;Lm0/l;I)V

    :goto_6
    invoke-virtual {p3}, Lm0/q;->u()Lm0/t0;

    move-result-object p0

    if-eqz p0, :cond_7

    new-instance v5, LP/a;

    move-wide v8, v7

    const/4 v7, 0x1

    move-object v10, v6

    move v6, p4

    invoke-direct/range {v5 .. v10}, LP/a;-><init>(IIJLjava/lang/Object;)V

    iput-object v5, p0, Lm0/t0;->d:LVm/n;

    :cond_7
    return-void
.end method

.method public static final c(Ljava/lang/String;LA0/r;Lcom/eightsleep/presentation_home/viewmodel/DecagonChatViewModel;Lm0/l;I)V
    .locals 17

    move-object/from16 v1, p0

    move-object/from16 v6, p1

    const-string v0, "url"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "modifier"

    invoke-static {v6, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v12, p3

    check-cast v12, Lm0/q;

    const v0, -0x5e855282

    invoke-virtual {v12, v0}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v12, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    const/4 v13, 0x4

    if-eqz v0, :cond_0

    move v0, v13

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int v0, p4, v0

    invoke-virtual {v12, v6}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/16 v2, 0x20

    goto :goto_1

    :cond_1
    const/16 v2, 0x10

    :goto_1
    or-int/2addr v0, v2

    or-int/lit16 v0, v0, 0x80

    and-int/lit16 v2, v0, 0x93

    const/16 v3, 0x92

    if-ne v2, v3, :cond_3

    invoke-virtual {v12}, Lm0/q;->H()Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v12}, Lm0/q;->Y()V

    move-object/from16 v3, p2

    goto/16 :goto_c

    :cond_3
    :goto_2
    invoke-virtual {v12}, Lm0/q;->a0()V

    and-int/lit8 v2, p4, 0x1

    const/4 v14, 0x0

    if-eqz v2, :cond_5

    invoke-virtual {v12}, Lm0/q;->E()Z

    move-result v2

    if-eqz v2, :cond_4

    goto :goto_3

    :cond_4
    invoke-virtual {v12}, Lm0/q;->Y()V

    and-int/lit16 v0, v0, -0x381

    move-object/from16 v15, p2

    goto :goto_6

    :cond_5
    :goto_3
    const v2, 0x70b323c8

    invoke-virtual {v12, v2}, Lm0/q;->g0(I)V

    invoke-static {v12}, Lh3/a;->a(Lm0/l;)Landroidx/lifecycle/i0;

    move-result-object v8

    if-eqz v8, :cond_16

    invoke-static {v8, v12, v14}, Landroidx/hilt/navigation/compose/HiltViewModelKt;->createHiltViewModelFactory(Landroidx/lifecycle/i0;Lm0/l;I)Landroidx/lifecycle/d0;

    move-result-object v10

    const v2, 0x671a9c9b

    invoke-virtual {v12, v2}, Lm0/q;->g0(I)V

    instance-of v2, v8, Landroidx/lifecycle/j;

    if-eqz v2, :cond_6

    move-object v2, v8

    check-cast v2, Landroidx/lifecycle/j;

    invoke-interface {v2}, Landroidx/lifecycle/j;->getDefaultViewModelCreationExtras()Lg3/c;

    move-result-object v2

    :goto_4
    move-object v11, v2

    goto :goto_5

    :cond_6
    sget-object v2, Lg3/a;->b:Lg3/a;

    goto :goto_4

    :goto_5
    const-class v7, Lcom/eightsleep/presentation_home/viewmodel/DecagonChatViewModel;

    const/4 v9, 0x0

    invoke-static/range {v7 .. v12}, LP2/c;->O(Ljava/lang/Class;Landroidx/lifecycle/i0;Ljava/lang/String;Landroidx/lifecycle/d0;Lg3/c;Lm0/l;)Landroidx/lifecycle/b0;

    move-result-object v2

    invoke-virtual {v12, v14}, Lm0/q;->q(Z)V

    invoke-virtual {v12, v14}, Lm0/q;->q(Z)V

    check-cast v2, Lcom/eightsleep/presentation_home/viewmodel/DecagonChatViewModel;

    and-int/lit16 v0, v0, -0x381

    move-object v15, v2

    :goto_6
    invoke-virtual {v12}, Lm0/q;->r()V

    invoke-virtual {v15}, Lcom/eightsleep/presentation_home/viewmodel/DecagonChatViewModel;->getAuthState()Lzo/K0;

    move-result-object v2

    invoke-static {v2, v12}, Lm0/r;->o(Lzo/K0;Lm0/l;)Lm0/Z;

    move-result-object v4

    const v2, 0x358975fd

    invoke-virtual {v12, v2}, Lm0/q;->f0(I)V

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v2

    sget-object v7, Lm0/k;->a:Lm0/e;

    const/4 v3, 0x0

    if-ne v2, v7, :cond_7

    invoke-static {v3}, Lm0/r;->C(Ljava/lang/Object;)Lm0/i0;

    move-result-object v2

    invoke-virtual {v12, v2}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_7
    move-object v8, v2

    check-cast v8, Lm0/Z;

    const v2, 0x3589804b

    invoke-static {v2, v12, v14}, Lcom/eightsleep/data_bioage/data/model/a;->f(ILm0/q;Z)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v7, :cond_8

    invoke-static {v3}, Lm0/r;->C(Ljava/lang/Object;)Lm0/i0;

    move-result-object v2

    invoke-virtual {v12, v2}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_8
    check-cast v2, Lm0/Z;

    const v5, 0x35898942

    invoke-static {v5, v12, v14}, Lcom/eightsleep/data_bioage/data/model/a;->f(ILm0/q;Z)Ljava/lang/Object;

    move-result-object v5

    if-ne v5, v7, :cond_9

    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {v5}, Lm0/r;->C(Ljava/lang/Object;)Lm0/i0;

    move-result-object v5

    invoke-virtual {v12, v5}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_9
    check-cast v5, Lm0/Z;

    invoke-virtual {v12, v14}, Lm0/q;->q(Z)V

    new-instance v9, LO2/a;

    const/4 v10, 0x4

    invoke-direct {v9, v10}, LO2/a;-><init>(I)V

    const v10, 0x35899d85

    invoke-virtual {v12, v10}, Lm0/q;->f0(I)V

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v10

    if-ne v10, v7, :cond_a

    new-instance v10, LAg/d0;

    const/16 v11, 0x18

    invoke-direct {v10, v8, v11}, LAg/d0;-><init>(Lm0/Z;I)V

    invoke-virtual {v12, v10}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_a
    check-cast v10, LVm/k;

    invoke-virtual {v12, v14}, Lm0/q;->q(Z)V

    const/16 v11, 0x30

    invoke-static {v9, v10, v12, v11}, LXm/a;->S(Lh/a;LVm/k;Lm0/l;I)Le/i;

    move-result-object v9

    const v10, 0x3589c3cd

    invoke-virtual {v12, v10}, Lm0/q;->f0(I)V

    and-int/lit8 v10, v0, 0xe

    if-ne v10, v13, :cond_b

    const/4 v0, 0x1

    goto :goto_7

    :cond_b
    move v0, v14

    :goto_7
    invoke-virtual {v12, v15}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v16

    or-int v0, v0, v16

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v11

    if-nez v0, :cond_c

    if-ne v11, v7, :cond_d

    :cond_c
    new-instance v11, LKf/X;

    invoke-direct {v11, v15, v1, v3}, LKf/X;-><init>(Lcom/eightsleep/presentation_home/viewmodel/DecagonChatViewModel;Ljava/lang/String;LLm/c;)V

    invoke-virtual {v12, v11}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_d
    check-cast v11, LVm/n;

    invoke-virtual {v12, v14}, Lm0/q;->q(Z)V

    invoke-static {v11, v1, v12}, Lm0/r;->f(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-interface {v4}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/eightsleep/presentation_home/viewmodel/DecagonAuthState;

    invoke-virtual {v0}, Lcom/eightsleep/presentation_home/viewmodel/DecagonAuthState;->getSignature()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v2}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v0

    const v3, 0x3589ee45

    invoke-virtual {v12, v3}, Lm0/q;->f0(I)V

    invoke-virtual {v12, v4}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v3

    if-ne v10, v13, :cond_e

    const/16 v16, 0x1

    goto :goto_8

    :cond_e
    move/from16 v16, v14

    :goto_8
    or-int v3, v3, v16

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v13

    if-nez v3, :cond_f

    if-ne v13, v7, :cond_10

    :cond_f
    move-object v3, v0

    goto :goto_9

    :cond_10
    move-object v1, v13

    move-object v13, v0

    move-object v0, v1

    move-object v1, v2

    goto :goto_a

    :goto_9
    new-instance v0, LKf/Y;

    move-object v1, v2

    move-object v2, v5

    const/4 v5, 0x0

    move-object v13, v3

    move-object/from16 v3, p0

    invoke-direct/range {v0 .. v5}, LKf/Y;-><init>(Lm0/Z;Lm0/Z;Ljava/lang/String;Lm0/Z;LLm/c;)V

    invoke-virtual {v12, v0}, Lm0/q;->q0(Ljava/lang/Object;)V

    :goto_a
    check-cast v0, LVm/n;

    invoke-virtual {v12, v14}, Lm0/q;->q(Z)V

    invoke-static {v11, v13, v0, v12}, Lm0/r;->g(Ljava/lang/Object;Ljava/lang/Object;LVm/n;Lm0/l;)V

    invoke-static {v6}, LG/e;->O(LA0/r;)LA0/r;

    move-result-object v0

    invoke-static {v0}, LG/e;->x(LA0/r;)LA0/r;

    move-result-object v0

    sget-object v2, Landroidx/compose/foundation/layout/b;->c:Landroidx/compose/foundation/layout/FillElement;

    invoke-interface {v0, v2}, LA0/r;->then(LA0/r;)LA0/r;

    move-result-object v11

    const v0, 0x358a5a2e

    invoke-virtual {v12, v0}, Lm0/q;->f0(I)V

    invoke-virtual {v12, v9}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x4

    if-ne v10, v2, :cond_11

    const/4 v2, 0x1

    goto :goto_b

    :cond_11
    move v2, v14

    :goto_b
    or-int/2addr v0, v2

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v2

    if-nez v0, :cond_12

    if-ne v2, v7, :cond_13

    :cond_12
    new-instance v0, LAe/c0;

    const/16 v5, 0xa

    move-object v2, v1

    move-object v3, v8

    move-object v4, v9

    move-object/from16 v1, p0

    invoke-direct/range {v0 .. v5}, LAe/c0;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    invoke-virtual {v12, v0}, Lm0/q;->q0(Ljava/lang/Object;)V

    move-object v2, v0

    :cond_13
    check-cast v2, LVm/k;

    const v0, 0x358b5192

    invoke-static {v0, v12, v14}, Lcom/eightsleep/data_bioage/data/model/a;->f(ILm0/q;Z)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v7, :cond_14

    new-instance v0, LId/u;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, LId/u;-><init>(I)V

    invoke-virtual {v12, v0}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_14
    move-object v9, v0

    check-cast v9, LVm/k;

    invoke-virtual {v12, v14}, Lm0/q;->q(Z)V

    move-object v8, v11

    const/16 v11, 0x180

    move-object v10, v12

    const/4 v12, 0x0

    move-object v7, v2

    invoke-static/range {v7 .. v12}, Lz1/j;->b(LVm/k;LA0/r;LVm/k;Lm0/l;II)V

    move-object v12, v10

    move-object v3, v15

    :goto_c
    invoke-virtual {v12}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_15

    new-instance v0, LBg/D;

    const/16 v5, 0x9

    move-object/from16 v1, p0

    move/from16 v4, p4

    move-object v2, v6

    invoke-direct/range {v0 .. v5}, LBg/D;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_15
    return-void

    :cond_16
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No ViewModelStoreOwner was provided via LocalViewModelStoreOwner"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static final d(LA0/r;LFf/y;LVm/k;Lm0/l;I)V
    .locals 20

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v4, p4

    const-string v0, "eveningCheckIn"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onUiAction"

    invoke-static {v3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v0, p3

    check-cast v0, Lm0/q;

    const v5, -0x1abfd8d

    invoke-virtual {v0, v5}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v5, v4, 0x6

    if-nez v5, :cond_1

    invoke-virtual {v0, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x4

    goto :goto_0

    :cond_0
    const/4 v5, 0x2

    :goto_0
    or-int/2addr v5, v4

    goto :goto_1

    :cond_1
    move v5, v4

    :goto_1
    and-int/lit8 v6, v4, 0x30

    if-nez v6, :cond_3

    invoke-virtual {v0, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    const/16 v6, 0x20

    goto :goto_2

    :cond_2
    const/16 v6, 0x10

    :goto_2
    or-int/2addr v5, v6

    :cond_3
    and-int/lit16 v6, v4, 0x180

    if-nez v6, :cond_5

    invoke-virtual {v0, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    const/16 v6, 0x100

    goto :goto_3

    :cond_4
    const/16 v6, 0x80

    :goto_3
    or-int/2addr v5, v6

    :cond_5
    and-int/lit16 v5, v5, 0x93

    const/16 v6, 0x92

    if-ne v5, v6, :cond_7

    invoke-virtual {v0}, Lm0/q;->H()Z

    move-result v5

    if-nez v5, :cond_6

    goto :goto_4

    :cond_6
    invoke-virtual {v0}, Lm0/q;->Y()V

    move-object/from16 v17, v0

    goto/16 :goto_6

    :cond_7
    :goto_4
    invoke-virtual {v2}, LFf/y;->d()Lcom/eightsleep/presentation_home/enums/EveningCheckInState;

    move-result-object v5

    sget-object v6, Lcom/eightsleep/presentation_home/enums/EveningCheckInState;->SAVING:Lcom/eightsleep/presentation_home/enums/EveningCheckInState;

    const/4 v7, 0x0

    if-ne v5, v6, :cond_8

    const/4 v5, 0x1

    goto :goto_5

    :cond_8
    move v5, v7

    :goto_5
    const/high16 v6, 0x3f800000    # 1.0f

    invoke-static {v1, v6}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v6

    invoke-static {v0}, Lhh/j;->c(Lm0/l;)Lme/u;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v8, Lme/u;->c:Lme/t;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v9, Lme/t;->g:Lme/l;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lme/l;->b()J

    move-result-wide v10

    sget-object v12, Lme/L;->d:Lme/v;

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget v12, Lme/v;->f:F

    invoke-static {v12}, LO/e;->b(F)LO/d;

    move-result-object v12

    const-string v13, "$this$pulsingGlow"

    invoke-static {v6, v13}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v13, Leh/d;

    invoke-direct {v13, v5, v12, v10, v11}, Leh/d;-><init>(ZLO/d;J)V

    invoke-static {v6, v13}, LA0/a;->a(LA0/r;LVm/o;)LA0/r;

    move-result-object v5

    const v6, 0x7f120538

    invoke-static {v0, v6}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v6

    const v10, 0xfb4d514

    invoke-virtual {v0, v10}, Lm0/q;->f0(I)V

    invoke-static {v0}, Lhh/j;->c(Lm0/l;)Lme/u;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v11, Lfh/h;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lme/l;->c()J

    move-result-wide v12

    invoke-static {}, Lme/l;->b()J

    move-result-wide v14

    invoke-static {}, Lme/l;->a()J

    move-result-wide v16

    invoke-direct/range {v11 .. v17}, Lfh/h;-><init>(JJJ)V

    invoke-virtual {v0, v7}, Lm0/q;->q(Z)V

    invoke-static {v0}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v7

    iget v15, v7, Lhh/i;->g:F

    new-instance v7, LAe/b0;

    const/16 v8, 0x1a

    invoke-direct {v7, v8, v2, v3}, LAe/b0;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    const v8, -0x3518fb31    # -7570023.5f

    invoke-static {v8, v7, v0}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v16

    const/4 v14, 0x0

    const/16 v18, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v9, v11

    const-wide/16 v10, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/16 v19, 0x1ec

    move-object/from16 v17, v0

    invoke-static/range {v5 .. v19}, LP2/g;->g(LA0/r;Ljava/lang/String;Lu0/d;Lu0/d;Lfh/h;JLu0/d;LG/N0;LA0/g;FLu0/d;Lm0/l;II)V

    :goto_6
    invoke-virtual/range {v17 .. v17}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_9

    new-instance v0, LP/T0;

    const/4 v5, 0x6

    invoke-direct/range {v0 .. v5}, LP/T0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_9
    return-void
.end method

.method public static final e(Ljava/util/ArrayList;Lm0/l;I)V
    .locals 27

    move-object/from16 v0, p0

    move-object/from16 v9, p1

    check-cast v9, Lm0/q;

    const v2, -0x43d4c50d

    invoke-virtual {v9, v2}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v9, v0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x2

    if-eqz v2, :cond_0

    const/4 v2, 0x4

    goto :goto_0

    :cond_0
    move v2, v3

    :goto_0
    or-int v2, p2, v2

    and-int/lit8 v2, v2, 0x3

    if-ne v2, v3, :cond_2

    invoke-virtual {v9}, Lm0/q;->H()Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v9}, Lm0/q;->Y()V

    goto/16 :goto_6

    :cond_2
    :goto_1
    sget-object v2, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->b:Lm0/c1;

    invoke-virtual {v9, v2}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/Context;

    const v3, -0x2f0f7a5a

    invoke-virtual {v9, v3}, Lm0/q;->f0(I)V

    invoke-virtual {v9}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v3

    sget-object v12, Lm0/k;->a:Lm0/e;

    const/4 v4, 0x0

    if-ne v3, v12, :cond_3

    invoke-static {v4}, Lw/e;->a(F)Lw/d;

    move-result-object v3

    invoke-virtual {v9, v3}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_3
    check-cast v3, Lw/d;

    const/4 v13, 0x0

    const v5, -0x2f0f747a

    invoke-static {v5, v9, v13}, Lcom/eightsleep/data_bioage/data/model/a;->f(ILm0/q;Z)Ljava/lang/Object;

    move-result-object v5

    if-ne v5, v12, :cond_4

    invoke-static {v4}, Lw/e;->a(F)Lw/d;

    move-result-object v5

    invoke-virtual {v9, v5}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_4
    move-object v14, v5

    check-cast v14, Lw/d;

    invoke-virtual {v9, v13}, Lm0/q;->q(Z)V

    sget-object v5, LHm/B;->a:LHm/B;

    const v6, -0x2f0f6224

    invoke-virtual {v9, v6}, Lm0/q;->f0(I)V

    invoke-virtual {v9, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    invoke-virtual {v9, v14}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    or-int/2addr v6, v7

    invoke-virtual {v9}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v7

    if-nez v6, :cond_5

    if-ne v7, v12, :cond_6

    :cond_5
    new-instance v7, LWf/Y;

    const/4 v6, 0x0

    invoke-direct {v7, v3, v14, v6}, LWf/Y;-><init>(Lw/d;Lw/d;LLm/c;)V

    invoke-virtual {v9, v7}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_6
    check-cast v7, LVm/n;

    invoke-virtual {v9, v13}, Lm0/q;->q(Z)V

    invoke-static {v7, v5, v9}, Lm0/r;->f(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v15, LA0/o;->a:LA0/o;

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-static {v15, v5}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v6

    invoke-static {v9}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v7

    iget v7, v7, Lhh/i;->g:F

    const/4 v8, 0x1

    invoke-static {v6, v4, v7, v8}, LG/e;->J(LA0/r;FFI)LA0/r;

    move-result-object v4

    sget-object v6, LA0/d;->n:LA0/g;

    sget-object v7, LG/l;->c:LG/f;

    const/16 v10, 0x30

    invoke-static {v7, v6, v9, v10}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v11

    move-object/from16 v16, v14

    iget-wide v13, v9, Lm0/q;->T:J

    invoke-static {v13, v14}, Ljava/lang/Long;->hashCode(J)I

    move-result v13

    invoke-virtual {v9}, Lm0/q;->m()Lm0/o0;

    move-result-object v14

    invoke-static {v4, v9}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v4

    sget-object v17, LZ0/h;->l0:LZ0/g;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object/from16 v17, v6

    sget-object v6, LZ0/g;->b:LZ0/f;

    invoke-virtual {v9}, Lm0/q;->j0()V

    iget-boolean v8, v9, Lm0/q;->S:Z

    if-eqz v8, :cond_7

    invoke-virtual {v9, v6}, Lm0/q;->l(LVm/a;)V

    goto :goto_2

    :cond_7
    invoke-virtual {v9}, Lm0/q;->t0()V

    :goto_2
    sget-object v8, LZ0/g;->f:LZ0/e;

    invoke-static {v8, v11, v9}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v11, LZ0/g;->e:LZ0/e;

    invoke-static {v11, v14, v9}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    sget-object v14, LZ0/g;->g:LZ0/e;

    invoke-static {v9, v13, v14}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v13, LZ0/g;->h:LZ0/d;

    invoke-static {v9, v13}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    move-object/from16 v18, v6

    sget-object v6, LZ0/g;->d:LZ0/e;

    invoke-static {v6, v4, v9}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const v4, -0x66fd0daf

    invoke-virtual {v9, v4}, Lm0/q;->f0(I)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_a

    invoke-static {v15, v5}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v4

    const v5, -0x66fcfc46

    invoke-virtual {v9, v5}, Lm0/q;->f0(I)V

    invoke-virtual {v9, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    invoke-virtual {v9}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v10

    if-nez v5, :cond_8

    if-ne v10, v12, :cond_9

    :cond_8
    new-instance v10, LSg/a;

    const/4 v5, 0x2

    invoke-direct {v10, v3, v5}, LSg/a;-><init>(Lw/d;I)V

    invoke-virtual {v9, v10}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_9
    check-cast v10, LVm/k;

    const/4 v3, 0x0

    invoke-virtual {v9, v3}, Lm0/q;->q(Z)V

    invoke-static {v4, v10}, LH0/F;->s(LA0/r;LVm/k;)LA0/r;

    move-result-object v3

    invoke-static {v9}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v4

    iget v4, v4, Lhh/i;->d:F

    invoke-static {v3, v4}, LG/e;->H(LA0/r;F)LA0/r;

    move-result-object v3

    invoke-static {v9}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v4

    iget v4, v4, Lhh/i;->d:F

    invoke-static {v4}, LG/l;->h(F)LG/j;

    move-result-object v4

    new-instance v5, LAe/b0;

    const/16 v10, 0x1b

    invoke-direct {v5, v10, v0, v2}, LAe/b0;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    const v2, 0x13fd8ee9

    invoke-static {v2, v5, v9}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v2

    move-object v5, v6

    const/4 v6, 0x0

    move-object v10, v8

    move-object v8, v2

    move-object v2, v3

    move-object v3, v4

    move-object v4, v7

    const/4 v7, 0x0

    move-object/from16 v19, v5

    const/4 v5, 0x0

    move-object/from16 v20, v10

    const v10, 0x180180

    move-object/from16 v21, v11

    const/16 v11, 0x38

    move-object/from16 v0, v17

    move-object/from16 v22, v18

    move-object/from16 v25, v19

    move-object/from16 v23, v20

    move-object/from16 v24, v21

    const/16 v1, 0x30

    invoke-static/range {v2 .. v11}, LG/e;->b(LA0/r;LG/h;LG/k;LA0/h;IILu0/d;Lm0/l;II)V

    const/4 v3, 0x0

    invoke-static {v9, v3}, LP2/z;->J(Lm0/l;I)V

    goto :goto_3

    :cond_a
    move-object/from16 v25, v6

    move-object v4, v7

    move-object/from16 v23, v8

    move v1, v10

    move-object/from16 v24, v11

    move-object/from16 v0, v17

    move-object/from16 v22, v18

    const/4 v3, 0x0

    :goto_3
    invoke-virtual {v9, v3}, Lm0/q;->q(Z)V

    const v2, -0x66fc8865

    invoke-virtual {v9, v2}, Lm0/q;->f0(I)V

    move-object/from16 v5, v16

    invoke-virtual {v9, v5}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v9}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v3

    if-nez v2, :cond_b

    if-ne v3, v12, :cond_c

    :cond_b
    new-instance v3, LSg/a;

    const/4 v2, 0x3

    invoke-direct {v3, v5, v2}, LSg/a;-><init>(Lw/d;I)V

    invoke-virtual {v9, v3}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_c
    check-cast v3, LVm/k;

    const/4 v2, 0x0

    invoke-virtual {v9, v2}, Lm0/q;->q(Z)V

    invoke-static {v15, v3}, LH0/F;->s(LA0/r;LVm/k;)LA0/r;

    move-result-object v3

    invoke-static {v4, v0, v9, v1}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v0

    iget-wide v4, v9, Lm0/q;->T:J

    invoke-static {v4, v5}, Ljava/lang/Long;->hashCode(J)I

    move-result v1

    invoke-virtual {v9}, Lm0/q;->m()Lm0/o0;

    move-result-object v4

    invoke-static {v3, v9}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v3

    invoke-virtual {v9}, Lm0/q;->j0()V

    iget-boolean v5, v9, Lm0/q;->S:Z

    if-eqz v5, :cond_d

    move-object/from16 v5, v22

    invoke-virtual {v9, v5}, Lm0/q;->l(LVm/a;)V

    :goto_4
    move-object/from16 v10, v23

    goto :goto_5

    :cond_d
    invoke-virtual {v9}, Lm0/q;->t0()V

    goto :goto_4

    :goto_5
    invoke-static {v10, v0, v9}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object/from16 v0, v24

    invoke-static {v0, v4, v9}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v1, v9, v14, v9, v13}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    move-object/from16 v5, v25

    invoke-static {v5, v3, v9}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move v3, v2

    sget-object v2, Lih/h;->e:Lih/h;

    const v0, 0x7f12053c

    invoke-static {v9, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v0

    const/4 v11, 0x0

    const/4 v13, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    const/4 v8, 0x3

    move-object v12, v9

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v14, 0x0

    const/16 v15, 0x3ee

    move/from16 v26, v3

    move-object v3, v0

    move/from16 v0, v26

    invoke-virtual/range {v2 .. v15}, Lih/h;->b(Ljava/lang/String;LA0/r;Lk1/U;JIZIILm0/l;III)V

    move-object v9, v12

    invoke-static {v9, v0}, LP2/z;->S(Lm0/l;I)V

    sget-object v2, Lih/h;->b:Lih/h;

    const v0, 0x7f12053b

    invoke-static {v9, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v9}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v0

    iget-object v0, v0, Lhh/h;->k:Lhh/v;

    iget-wide v5, v0, Lhh/v;->d:J

    const/4 v10, 0x0

    const/4 v12, 0x0

    const/4 v4, 0x0

    const/4 v7, 0x3

    const/4 v8, 0x0

    move-object v11, v9

    const/4 v9, 0x0

    const/4 v13, 0x0

    const/16 v14, 0x3e6

    invoke-virtual/range {v2 .. v14}, Lih/h;->h(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    move-object v9, v11

    const/4 v0, 0x1

    invoke-virtual {v9, v0}, Lm0/q;->q(Z)V

    invoke-virtual {v9, v0}, Lm0/q;->q(Z)V

    :goto_6
    invoke-virtual {v9}, Lm0/q;->u()Lm0/t0;

    move-result-object v0

    if-eqz v0, :cond_e

    new-instance v1, LPe/m;

    const/4 v2, 0x1

    move-object/from16 v3, p0

    move/from16 v4, p2

    invoke-direct {v1, v3, v4, v2}, LPe/m;-><init>(Ljava/util/ArrayList;II)V

    iput-object v1, v0, Lm0/t0;->d:LVm/n;

    :cond_e
    return-void
.end method

.method public static final f(ILVm/a;Lm0/l;I)V
    .locals 19

    move/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p3

    move-object/from16 v12, p2

    check-cast v12, Lm0/q;

    const v3, 0x2f8cb90d

    invoke-virtual {v12, v3}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v12, v0}, Lm0/q;->e(I)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x4

    goto :goto_0

    :cond_0
    const/4 v3, 0x2

    :goto_0
    or-int/2addr v3, v2

    invoke-virtual {v12, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    const/16 v5, 0x20

    if-eqz v4, :cond_1

    move v4, v5

    goto :goto_1

    :cond_1
    const/16 v4, 0x10

    :goto_1
    or-int/2addr v3, v4

    and-int/lit8 v4, v3, 0x13

    const/16 v6, 0x12

    if-ne v4, v6, :cond_3

    invoke-virtual {v12}, Lm0/q;->H()Z

    move-result v4

    if-nez v4, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v12}, Lm0/q;->Y()V

    move-object v13, v12

    goto/16 :goto_6

    :cond_3
    :goto_2
    const v4, 0x4dc1535d    # 4.0543325E8f

    invoke-virtual {v12, v4}, Lm0/q;->f0(I)V

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v4

    sget-object v6, Lm0/k;->a:Lm0/e;

    const/4 v7, 0x0

    if-ne v4, v6, :cond_4

    invoke-static {v7}, Lw/e;->a(F)Lw/d;

    move-result-object v4

    invoke-virtual {v12, v4}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_4
    check-cast v4, Lw/d;

    const/4 v8, 0x0

    invoke-virtual {v12, v8}, Lm0/q;->q(Z)V

    sget-object v9, LHm/B;->a:LHm/B;

    const v10, 0x4dc16172    # 4.055486E8f

    invoke-virtual {v12, v10}, Lm0/q;->f0(I)V

    invoke-virtual {v12, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v10

    and-int/lit8 v3, v3, 0x70

    const/4 v11, 0x1

    if-ne v3, v5, :cond_5

    move v3, v11

    goto :goto_3

    :cond_5
    move v3, v8

    :goto_3
    or-int/2addr v3, v10

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v5

    if-nez v3, :cond_6

    if-ne v5, v6, :cond_7

    :cond_6
    new-instance v5, LWf/Z;

    const/4 v3, 0x0

    invoke-direct {v5, v4, v1, v3}, LWf/Z;-><init>(Lw/d;LVm/a;LLm/c;)V

    invoke-virtual {v12, v5}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_7
    check-cast v5, LVm/n;

    invoke-virtual {v12, v8}, Lm0/q;->q(Z)V

    invoke-static {v5, v9, v12}, Lm0/r;->f(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v3, LA0/o;->a:LA0/o;

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-static {v3, v5}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v3

    invoke-static {v12}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v5

    iget v5, v5, Lhh/i;->h:F

    invoke-static {v3, v7, v5, v11}, LG/e;->J(LA0/r;FFI)LA0/r;

    move-result-object v3

    invoke-virtual {v4}, Lw/d;->d()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->floatValue()F

    move-result v4

    invoke-static {v3, v4}, LE0/i;->a(LA0/r;F)LA0/r;

    move-result-object v3

    sget-object v4, LA0/d;->n:LA0/g;

    sget-object v5, LG/l;->c:LG/f;

    const/16 v6, 0x30

    invoke-static {v5, v4, v12, v6}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v4

    iget-wide v5, v12, Lm0/q;->T:J

    invoke-static {v5, v6}, Ljava/lang/Long;->hashCode(J)I

    move-result v5

    invoke-virtual {v12}, Lm0/q;->m()Lm0/o0;

    move-result-object v6

    invoke-static {v3, v12}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v3

    sget-object v7, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v7, LZ0/g;->b:LZ0/f;

    invoke-virtual {v12}, Lm0/q;->j0()V

    iget-boolean v9, v12, Lm0/q;->S:Z

    if-eqz v9, :cond_8

    invoke-virtual {v12, v7}, Lm0/q;->l(LVm/a;)V

    goto :goto_4

    :cond_8
    invoke-virtual {v12}, Lm0/q;->t0()V

    :goto_4
    sget-object v7, LZ0/g;->f:LZ0/e;

    invoke-static {v7, v4, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v4, LZ0/g;->e:LZ0/e;

    invoke-static {v4, v6, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    sget-object v5, LZ0/g;->g:LZ0/e;

    invoke-static {v12, v4, v5}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v4, LZ0/g;->h:LZ0/d;

    invoke-static {v12, v4}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v4, LZ0/g;->d:LZ0/e;

    invoke-static {v4, v3, v12}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v12}, Loe/y;->I(Lm0/l;)LF8/d;

    move-result-object v3

    sget-object v4, Lih/h;->e:Lih/h;

    if-ne v0, v11, :cond_9

    const v5, 0x5536ec43

    const v6, 0x7f12063c

    invoke-static {v12, v5, v6, v12, v8}, Lcom/eightsleep/data_bioage/data/model/a;->n(Lm0/q;IILm0/q;Z)Ljava/lang/String;

    move-result-object v5

    goto :goto_5

    :cond_9
    const v5, 0x55386fa4

    const v6, 0x7f12063d

    invoke-static {v12, v5, v6, v12, v8}, Lcom/eightsleep/data_bioage/data/model/a;->n(Lm0/q;IILm0/q;Z)Ljava/lang/String;

    move-result-object v5

    :goto_5
    iget-object v6, v3, LF8/d;->b:Lk1/U;

    move-object v13, v12

    const/4 v12, 0x0

    const/4 v14, 0x0

    iget-object v3, v3, LF8/d;->a:LA0/r;

    move v9, v8

    const-wide/16 v7, 0x0

    move v10, v9

    const/4 v9, 0x3

    move v15, v10

    const/4 v10, 0x0

    move/from16 v16, v11

    const/4 v11, 0x0

    move/from16 v17, v15

    const/4 v15, 0x0

    move/from16 v18, v16

    const/16 v16, 0x3e8

    move-object v0, v5

    move-object v5, v3

    move-object v3, v4

    move-object v4, v0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual/range {v3 .. v16}, Lih/h;->b(Ljava/lang/String;LA0/r;Lk1/U;JIZIILm0/l;III)V

    invoke-static {v13, v0}, LP2/z;->S(Lm0/l;I)V

    sget-object v3, Lih/h;->b:Lih/h;

    const v0, 0x7f12063b

    invoke-static {v13, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v13}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v0

    iget-object v0, v0, Lhh/h;->k:Lhh/v;

    iget-wide v6, v0, Lhh/v;->d:J

    const/4 v11, 0x0

    move-object v12, v13

    const/4 v13, 0x0

    const/4 v5, 0x0

    const/4 v8, 0x3

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v14, 0x0

    const/16 v15, 0x3e6

    invoke-virtual/range {v3 .. v15}, Lih/h;->h(Ljava/lang/String;LA0/r;JIZIILm0/l;III)V

    move-object v13, v12

    invoke-virtual {v13, v1}, Lm0/q;->q(Z)V

    :goto_6
    invoke-virtual {v13}, Lm0/q;->u()Lm0/t0;

    move-result-object v0

    if-eqz v0, :cond_a

    new-instance v1, LAe/H;

    const/4 v3, 0x4

    move/from16 v4, p0

    move-object/from16 v5, p1

    invoke-direct {v1, v4, v5, v2, v3}, LAe/H;-><init>(ILVm/a;II)V

    iput-object v1, v0, Lm0/t0;->d:LVm/n;

    :cond_a
    return-void
.end method

.method public static final g(LVm/k;Lm0/l;I)V
    .locals 29

    move-object/from16 v0, p0

    const-string v2, "onUiAction"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v14, p1

    check-cast v14, Lm0/q;

    const v2, -0x71acc0f8

    invoke-virtual {v14, v2}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v2, p2, 0x6

    const/4 v12, 0x4

    const/4 v13, 0x2

    if-nez v2, :cond_1

    invoke-virtual {v14, v0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v2, v12

    goto :goto_0

    :cond_0
    move v2, v13

    :goto_0
    or-int v2, p2, v2

    goto :goto_1

    :cond_1
    move/from16 v2, p2

    :goto_1
    and-int/lit8 v3, v2, 0x3

    if-ne v3, v13, :cond_3

    invoke-virtual {v14}, Lm0/q;->H()Z

    move-result v3

    if-nez v3, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v14}, Lm0/q;->Y()V

    goto/16 :goto_a

    :cond_3
    :goto_2
    sget-object v15, LA0/o;->a:LA0/o;

    sget-object v3, Landroidx/compose/foundation/layout/b;->c:Landroidx/compose/foundation/layout/FillElement;

    sget-object v4, LG/l;->e:LG/g;

    sget-object v5, LA0/d;->n:LA0/g;

    const/16 v6, 0x36

    invoke-static {v4, v5, v14, v6}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v4

    iget-wide v5, v14, Lm0/q;->T:J

    invoke-static {v5, v6}, Ljava/lang/Long;->hashCode(J)I

    move-result v5

    invoke-virtual {v14}, Lm0/q;->m()Lm0/o0;

    move-result-object v6

    invoke-static {v3, v14}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v3

    sget-object v7, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v7, LZ0/g;->b:LZ0/f;

    invoke-virtual {v14}, Lm0/q;->j0()V

    iget-boolean v8, v14, Lm0/q;->S:Z

    if-eqz v8, :cond_4

    invoke-virtual {v14, v7}, Lm0/q;->l(LVm/a;)V

    goto :goto_3

    :cond_4
    invoke-virtual {v14}, Lm0/q;->t0()V

    :goto_3
    sget-object v7, LZ0/g;->f:LZ0/e;

    invoke-static {v7, v4, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v4, LZ0/g;->e:LZ0/e;

    invoke-static {v4, v6, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    sget-object v5, LZ0/g;->g:LZ0/e;

    invoke-static {v14, v4, v5}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v4, LZ0/g;->h:LZ0/d;

    invoke-static {v14, v4}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v4, LZ0/g;->d:LZ0/e;

    invoke-static {v4, v3, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v16, LG/D;->a:LG/D;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v15, v3}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v5

    sget-object v3, Log/b;->h:Log/b;

    invoke-virtual {v3}, Ld8/j;->invoke()Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "toString(...)"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v8, LX0/p;->d:LX0/p0;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v4, "Globe"

    const v10, 0x301b0

    const/16 v11, 0x18

    move-object v9, v14

    invoke-static/range {v3 .. v11}, LP2/i;->i(Ljava/lang/String;Ljava/lang/String;LA0/r;LL0/a;LL0/a;LX0/q;Lm0/l;II)V

    const/4 v3, 0x0

    invoke-static {v14, v3}, LP2/z;->N(Lm0/l;I)V

    const v4, 0x7f1207f3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    move v4, v3

    move-object/from16 v3, v16

    const/16 v16, 0x0

    const v18, 0x6000006

    move v5, v4

    const/4 v4, 0x0

    move v7, v5

    const v5, 0x7f1207f4

    move v8, v7

    const/4 v7, 0x0

    move v10, v8

    const-wide/16 v8, 0x0

    move/from16 v17, v10

    const-wide/16 v10, 0x0

    move/from16 v19, v12

    move/from16 v20, v13

    const-wide/16 v12, 0x0

    move/from16 v21, v17

    move-object/from16 v17, v14

    const/4 v14, 0x1

    move-object/from16 v22, v15

    const/4 v15, 0x0

    move/from16 v23, v19

    const/16 v19, 0x0

    move/from16 v24, v20

    const/16 v20, 0x379

    move/from16 p1, v2

    move/from16 v2, v21

    move-object/from16 v0, v22

    move/from16 v1, v24

    invoke-static/range {v3 .. v20}, LP2/z;->B(LG/C;LA0/r;ILjava/lang/Integer;Ljava/lang/Integer;JJJZLo8/a;ZLm0/l;III)V

    move-object/from16 v14, v17

    invoke-static {v14, v2}, LP2/z;->K(Lm0/l;I)V

    sget-object v3, LOg/e;->b:LOg/e;

    const/16 v4, 0x28

    int-to-float v4, v4

    const/4 v5, 0x0

    invoke-static {v0, v4, v5, v1}, LG/e;->J(LA0/r;FFI)LA0/r;

    move-result-object v6

    const/16 v7, 0x140

    int-to-float v7, v7

    invoke-static {v6, v7}, Landroidx/compose/foundation/layout/b;->s(LA0/r;F)LA0/r;

    move-result-object v6

    const v8, 0x7f120362

    invoke-static {v14, v8}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v8

    const v9, -0x47436e09

    invoke-virtual {v14, v9}, Lm0/q;->f0(I)V

    and-int/lit8 v9, p1, 0xe

    const/4 v10, 0x1

    const/4 v11, 0x4

    if-ne v9, v11, :cond_5

    move v11, v10

    goto :goto_4

    :cond_5
    move v11, v2

    :goto_4
    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v12

    sget-object v13, Lm0/k;->a:Lm0/e;

    if-nez v11, :cond_7

    if-ne v12, v13, :cond_6

    goto :goto_5

    :cond_6
    move-object/from16 v15, p0

    goto :goto_6

    :cond_7
    :goto_5
    new-instance v12, Lmi/k;

    const/16 v11, 0x14

    move-object/from16 v15, p0

    invoke-direct {v12, v11, v15}, Lmi/k;-><init>(ILVm/k;)V

    invoke-virtual {v14, v12}, Lm0/q;->q0(Ljava/lang/Object;)V

    :goto_6
    check-cast v12, LVm/a;

    invoke-virtual {v14, v2}, Lm0/q;->q(Z)V

    move-object v11, v13

    move-object v13, v12

    const/4 v12, 0x0

    const/4 v15, 0x6

    move/from16 v16, v4

    move-object v4, v6

    const/4 v6, 0x0

    move/from16 v17, v7

    const/4 v7, 0x0

    move/from16 v18, v5

    move-object v5, v8

    const/4 v8, 0x0

    move/from16 v19, v9

    const/4 v9, 0x0

    move/from16 v20, v10

    const/4 v10, 0x0

    move-object/from16 v21, v11

    const/4 v11, 0x0

    move/from16 v22, v16

    const/16 v16, 0x0

    move/from16 v24, v17

    const/16 v17, 0x3fc

    move/from16 v27, v19

    move-object/from16 v28, v21

    move/from16 v25, v22

    move/from16 v26, v24

    invoke-virtual/range {v3 .. v17}, LOg/e;->g(LA0/r;Ljava/lang/String;Ljava/lang/Integer;Lhh/n;Lhh/d;ZZLhh/e;LJg/b;LVm/a;Lm0/l;III)V

    invoke-static {v14, v2}, LP2/z;->Q(Lm0/l;I)V

    sget-object v3, LOg/e;->d:LOg/e;

    move/from16 v4, v25

    const/4 v5, 0x0

    invoke-static {v0, v4, v5, v1}, LG/e;->J(LA0/r;FFI)LA0/r;

    move-result-object v0

    move/from16 v1, v26

    invoke-static {v0, v1}, Landroidx/compose/foundation/layout/b;->s(LA0/r;F)LA0/r;

    move-result-object v4

    const v0, 0x7f1207f2

    invoke-static {v14, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v14}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v0

    iget-object v0, v0, Lhh/h;->k:Lhh/v;

    iget-wide v0, v0, Lhh/v;->c:J

    const v6, -0x474338ce

    invoke-static {v0, v1, v14, v6}, Lj/m;->c(JLm0/q;I)LH0/w;

    move-result-object v6

    move/from16 v0, v27

    const/4 v11, 0x4

    if-ne v0, v11, :cond_8

    const/4 v0, 0x1

    goto :goto_7

    :cond_8
    move v0, v2

    :goto_7
    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v1

    if-nez v0, :cond_a

    move-object/from16 v11, v28

    if-ne v1, v11, :cond_9

    goto :goto_8

    :cond_9
    move-object/from16 v7, p0

    goto :goto_9

    :cond_a
    :goto_8
    new-instance v1, Lmi/k;

    const/16 v0, 0x15

    move-object/from16 v7, p0

    invoke-direct {v1, v0, v7}, Lmi/k;-><init>(ILVm/k;)V

    invoke-virtual {v14, v1}, Lm0/q;->q0(Ljava/lang/Object;)V

    :goto_9
    check-cast v1, LVm/a;

    invoke-virtual {v14, v2}, Lm0/q;->q(Z)V

    const/4 v13, 0x0

    const/16 v16, 0x6

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x7f8

    move-object/from16 v0, p0

    move-object v15, v14

    move-object v14, v1

    invoke-virtual/range {v3 .. v18}, LOg/e;->j(LA0/r;Ljava/lang/String;LH0/w;Ljava/lang/Integer;Lhh/n;Lhh/d;ZZLhh/e;LJg/b;LVm/a;Lm0/l;III)V

    move-object v14, v15

    const/4 v1, 0x1

    invoke-virtual {v14, v1}, Lm0/q;->q(Z)V

    :goto_a
    invoke-virtual {v14}, Lm0/q;->u()Lm0/t0;

    move-result-object v1

    if-eqz v1, :cond_b

    new-instance v2, LXe/u;

    const/4 v3, 0x5

    move/from16 v4, p2

    invoke-direct {v2, v0, v4, v3}, LXe/u;-><init>(LVm/k;II)V

    iput-object v2, v1, Lm0/t0;->d:LVm/n;

    :cond_b
    return-void
.end method

.method public static final h(LA0/r;Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;LVm/k;LVm/k;Lm0/l;I)V
    .locals 16

    move-object/from16 v3, p0

    move-object/from16 v5, p1

    move-object/from16 v4, p2

    move-object/from16 v7, p3

    const-string v0, "viewModel"

    invoke-static {v5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onOneTimeEvent"

    invoke-static {v4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onNavEvent"

    invoke-static {v7, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v13, p4

    check-cast v13, Lm0/q;

    const v0, -0x33585f75    # -8.788489E7f

    invoke-virtual {v13, v0}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v13, v3}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int v0, p5, v0

    invoke-virtual {v13, v5}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x20

    goto :goto_1

    :cond_1
    const/16 v1, 0x10

    :goto_1
    or-int/2addr v0, v1

    invoke-virtual {v13, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x100

    goto :goto_2

    :cond_2
    const/16 v1, 0x80

    :goto_2
    or-int/2addr v0, v1

    invoke-virtual {v13, v7}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/16 v1, 0x800

    goto :goto_3

    :cond_3
    const/16 v1, 0x400

    :goto_3
    or-int/2addr v0, v1

    and-int/lit16 v1, v0, 0x493

    const/16 v2, 0x492

    if-ne v1, v2, :cond_5

    invoke-virtual {v13}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_4

    goto :goto_4

    :cond_4
    invoke-virtual {v13}, Lm0/q;->Y()V

    goto :goto_5

    :cond_5
    :goto_4
    sget-object v1, Landroidx/compose/foundation/layout/b;->c:Landroidx/compose/foundation/layout/FillElement;

    invoke-interface {v3, v1}, LA0/r;->then(LA0/r;)LA0/r;

    move-result-object v1

    sget-object v12, Lqg/c;->a:Lu0/d;

    and-int/lit8 v2, v0, 0x70

    const/high16 v6, 0x6000000

    or-int/2addr v2, v6

    and-int/lit16 v6, v0, 0x380

    or-int/2addr v2, v6

    and-int/lit16 v0, v0, 0x1c00

    or-int v14, v2, v0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/16 v15, 0xf0

    move-object v6, v4

    move-object v4, v1

    invoke-static/range {v4 .. v15}, LP2/o;->g(LA0/r;LL8/e;LVm/k;LVm/k;ZZLH0/w;Ljava/lang/String;LVm/r;Lm0/l;II)V

    :goto_5
    invoke-virtual {v13}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_6

    new-instance v0, Lqg/h;

    const/4 v2, 0x1

    move-object/from16 v6, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move/from16 v1, p5

    invoke-direct/range {v0 .. v6}, Lqg/h;-><init>(IILA0/r;LVm/k;LVm/k;Lcom/eightsleep/presentation_jetlag/viewmodel/JetLagTripViewModel;)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_6
    return-void
.end method

.method public static final i(LA0/r;LFf/y;LVm/k;Lm0/l;I)V
    .locals 11

    const-string v0, "eveningCheckIn"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onUiAction"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v8, p3

    check-cast v8, Lm0/q;

    const p3, 0x47ad65f

    invoke-virtual {v8, p3}, Lm0/q;->h0(I)Lm0/q;

    or-int/lit8 p3, p4, 0x6

    invoke-virtual {v8, p1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x20

    goto :goto_0

    :cond_0
    const/16 v0, 0x10

    :goto_0
    or-int/2addr p3, v0

    invoke-virtual {v8, p2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0x100

    goto :goto_1

    :cond_1
    const/16 v0, 0x80

    :goto_1
    or-int/2addr p3, v0

    and-int/lit16 p3, p3, 0x93

    const/16 v0, 0x92

    if-ne p3, v0, :cond_3

    invoke-virtual {v8}, Lm0/q;->H()Z

    move-result p3

    if-nez p3, :cond_2

    goto :goto_3

    :cond_2
    invoke-virtual {v8}, Lm0/q;->Y()V

    :goto_2
    move-object v1, p0

    goto/16 :goto_5

    :cond_3
    :goto_3
    sget-object p0, LA0/o;->a:LA0/o;

    invoke-virtual {p1}, LFf/y;->d()Lcom/eightsleep/presentation_home/enums/EveningCheckInState;

    move-result-object v1

    sget-object p3, LG/l;->c:LG/f;

    sget-object v0, LA0/d;->m:LA0/g;

    const/4 v2, 0x0

    invoke-static {p3, v0, v8, v2}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object p3

    iget-wide v3, v8, Lm0/q;->T:J

    invoke-static {v3, v4}, Ljava/lang/Long;->hashCode(J)I

    move-result v0

    invoke-virtual {v8}, Lm0/q;->m()Lm0/o0;

    move-result-object v3

    invoke-static {p0, v8}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v4

    sget-object v5, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v5, LZ0/g;->b:LZ0/f;

    invoke-virtual {v8}, Lm0/q;->j0()V

    iget-boolean v6, v8, Lm0/q;->S:Z

    if-eqz v6, :cond_4

    invoke-virtual {v8, v5}, Lm0/q;->l(LVm/a;)V

    goto :goto_4

    :cond_4
    invoke-virtual {v8}, Lm0/q;->t0()V

    :goto_4
    sget-object v5, LZ0/g;->f:LZ0/e;

    invoke-static {v5, p3, v8}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object p3, LZ0/g;->e:LZ0/e;

    invoke-static {p3, v3, v8}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    sget-object v0, LZ0/g;->g:LZ0/e;

    invoke-static {v8, p3, v0}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object p3, LZ0/g;->h:LZ0/d;

    invoke-static {v8, p3}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object p3, LZ0/g;->d:LZ0/e;

    invoke-static {p3, v4, v8}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const p3, 0x4fa26a49

    invoke-virtual {v8, p3}, Lm0/q;->f0(I)V

    invoke-virtual {v8}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object p3

    sget-object v0, Lm0/k;->a:Lm0/e;

    if-ne p3, v0, :cond_5

    new-instance p3, LUo/n;

    const/4 v0, 0x5

    invoke-direct {p3, v0}, LUo/n;-><init>(I)V

    invoke-virtual {v8, p3}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_5
    move-object v3, p3

    check-cast v3, LVm/k;

    invoke-virtual {v8, v2}, Lm0/q;->q(Z)V

    new-instance p3, LBe/g;

    const/16 v0, 0xc

    invoke-direct {p3, v0, p1, p2}, LBe/g;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    const v0, -0x570849a4

    invoke-static {v0, p3, v8}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v7

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v4, 0x0

    const v9, 0x180180

    const/16 v10, 0x3a

    invoke-static/range {v1 .. v10}, Lv/j;->a(Ljava/lang/Object;LA0/r;LVm/k;LA0/i;Ljava/lang/String;LVm/k;Lu0/d;Lm0/l;II)V

    const/4 p3, 0x1

    invoke-virtual {v8, p3}, Lm0/q;->q(Z)V

    goto/16 :goto_2

    :goto_5
    invoke-virtual {v8}, Lm0/q;->u()Lm0/t0;

    move-result-object p0

    if-eqz p0, :cond_6

    new-instance v0, LBg/D;

    const/16 v5, 0x1c

    move-object v2, p1

    move-object v3, p2

    move v4, p4

    invoke-direct/range {v0 .. v5}, LBg/D;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object v0, p0, Lm0/t0;->d:LVm/n;

    :cond_6
    return-void
.end method

.method public static final j(ILA0/r;LVm/k;LVm/k;Lm0/l;)V
    .locals 12

    move-object v3, p3

    const-string v0, "modifier"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onNavEvent"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onOneTimeEvent"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v9, p4

    check-cast v9, Lm0/q;

    const v0, 0x4a57b18

    invoke-virtual {v9, v0}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v9, p1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int/2addr v0, p0

    invoke-virtual {v9, p2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x20

    goto :goto_1

    :cond_1
    const/16 v1, 0x10

    :goto_1
    or-int/2addr v0, v1

    invoke-virtual {v9, p3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x100

    goto :goto_2

    :cond_2
    const/16 v1, 0x80

    :goto_2
    or-int/2addr v0, v1

    and-int/lit16 v1, v0, 0x93

    const/16 v4, 0x92

    if-ne v1, v4, :cond_4

    invoke-virtual {v9}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_3

    :cond_3
    invoke-virtual {v9}, Lm0/q;->Y()V

    goto :goto_6

    :cond_4
    :goto_3
    const v1, 0x70b323c8

    invoke-virtual {v9, v1}, Lm0/q;->g0(I)V

    invoke-static {v9}, Lh3/a;->a(Lm0/l;)Landroidx/lifecycle/i0;

    move-result-object v5

    if-eqz v5, :cond_7

    const/4 v1, 0x0

    invoke-static {v5, v9, v1}, Landroidx/hilt/navigation/compose/HiltViewModelKt;->createHiltViewModelFactory(Landroidx/lifecycle/i0;Lm0/l;I)Landroidx/lifecycle/d0;

    move-result-object v7

    const v4, 0x671a9c9b

    invoke-virtual {v9, v4}, Lm0/q;->g0(I)V

    instance-of v4, v5, Landroidx/lifecycle/j;

    if-eqz v4, :cond_5

    move-object v4, v5

    check-cast v4, Landroidx/lifecycle/j;

    invoke-interface {v4}, Landroidx/lifecycle/j;->getDefaultViewModelCreationExtras()Lg3/c;

    move-result-object v4

    :goto_4
    move-object v8, v4

    goto :goto_5

    :cond_5
    sget-object v4, Lg3/a;->b:Lg3/a;

    goto :goto_4

    :goto_5
    const-class v4, Lcom/eightsleep/presentation_user/viewmodel/SettingsProfileViewModel;

    const/4 v6, 0x0

    invoke-static/range {v4 .. v9}, LP2/c;->O(Ljava/lang/Class;Landroidx/lifecycle/i0;Ljava/lang/String;Landroidx/lifecycle/d0;Lg3/c;Lm0/l;)Landroidx/lifecycle/b0;

    move-result-object v4

    invoke-virtual {v9, v1}, Lm0/q;->q(Z)V

    invoke-virtual {v9, v1}, Lm0/q;->q(Z)V

    move-object v1, v4

    check-cast v1, Lcom/eightsleep/presentation_user/viewmodel/SettingsProfileViewModel;

    new-instance v4, LMi/s;

    const/4 v5, 0x0

    invoke-direct {v4, p1, v5}, LMi/s;-><init>(LA0/r;I)V

    const v5, -0x7834f480

    invoke-static {v5, v4, v9}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v8

    and-int/lit16 v4, v0, 0x380

    const/high16 v5, 0x6c00000

    or-int/2addr v4, v5

    shl-int/lit8 v0, v0, 0x6

    and-int/lit16 v0, v0, 0x1c00

    or-int v10, v4, v0

    const/4 v6, 0x0

    const-string v7, "notification_settings"

    const/4 v0, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v11, 0x71

    move-object v2, v3

    move-object v3, p2

    invoke-static/range {v0 .. v11}, LP2/o;->g(LA0/r;LL8/e;LVm/k;LVm/k;ZZLH0/w;Ljava/lang/String;LVm/r;Lm0/l;II)V

    :goto_6
    invoke-virtual {v9}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_6

    new-instance v0, LAg/J;

    const/16 v5, 0xa

    move v4, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, LAg/J;-><init>(LA0/r;LVm/k;LVm/k;II)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_6
    return-void

    :cond_7
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "No ViewModelStoreOwner was provided via LocalViewModelStoreOwner"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final k(LA0/r;LKi/d;LVm/k;Lm0/l;I)V
    .locals 8

    const-string v0, "modifier"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "model"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onUiAction"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v4, p3

    check-cast v4, Lm0/q;

    const p3, 0x34ca7612

    invoke-virtual {v4, p3}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 p3, p4, 0x6

    if-nez p3, :cond_1

    invoke-virtual {v4, p0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_0

    const/4 p3, 0x4

    goto :goto_0

    :cond_0
    const/4 p3, 0x2

    :goto_0
    or-int/2addr p3, p4

    goto :goto_1

    :cond_1
    move p3, p4

    :goto_1
    and-int/lit8 v0, p4, 0x30

    if-nez v0, :cond_3

    invoke-virtual {v4, p1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/16 v0, 0x20

    goto :goto_2

    :cond_2
    const/16 v0, 0x10

    :goto_2
    or-int/2addr p3, v0

    :cond_3
    and-int/lit16 v0, p4, 0x180

    if-nez v0, :cond_5

    invoke-virtual {v4, p2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/16 v0, 0x100

    goto :goto_3

    :cond_4
    const/16 v0, 0x80

    :goto_3
    or-int/2addr p3, v0

    :cond_5
    and-int/lit16 p3, p3, 0x93

    const/16 v0, 0x92

    if-ne p3, v0, :cond_7

    invoke-virtual {v4}, Lm0/q;->H()Z

    move-result p3

    if-nez p3, :cond_6

    goto :goto_4

    :cond_6
    invoke-virtual {v4}, Lm0/q;->Y()V

    goto/16 :goto_6

    :cond_7
    :goto_4
    sget-object p3, Landroidx/compose/foundation/layout/b;->c:Landroidx/compose/foundation/layout/FillElement;

    invoke-interface {p0, p3}, LA0/r;->then(LA0/r;)LA0/r;

    move-result-object p3

    sget-object v0, LG/l;->c:LG/f;

    sget-object v1, LA0/d;->m:LA0/g;

    const/4 v7, 0x0

    invoke-static {v0, v1, v4, v7}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v0

    iget-wide v1, v4, Lm0/q;->T:J

    invoke-static {v1, v2}, Ljava/lang/Long;->hashCode(J)I

    move-result v1

    invoke-virtual {v4}, Lm0/q;->m()Lm0/o0;

    move-result-object v2

    invoke-static {p3, v4}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object p3

    sget-object v3, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, LZ0/g;->b:LZ0/f;

    invoke-virtual {v4}, Lm0/q;->j0()V

    iget-boolean v5, v4, Lm0/q;->S:Z

    if-eqz v5, :cond_8

    invoke-virtual {v4, v3}, Lm0/q;->l(LVm/a;)V

    goto :goto_5

    :cond_8
    invoke-virtual {v4}, Lm0/q;->t0()V

    :goto_5
    sget-object v3, LZ0/g;->f:LZ0/e;

    invoke-static {v3, v0, v4}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v0, LZ0/g;->e:LZ0/e;

    invoke-static {v0, v2, v4}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v1, LZ0/g;->g:LZ0/e;

    invoke-static {v4, v0, v1}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v0, LZ0/g;->h:LZ0/d;

    invoke-static {v4, v0}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v0, LZ0/g;->d:LZ0/e;

    invoke-static {v0, p3, v4}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const p3, 0x3ead0ac8

    invoke-virtual {v4, p3}, Lm0/q;->f0(I)V

    iget-boolean p3, p1, LKi/d;->f:Z

    if-eqz p3, :cond_9

    const p3, 0x7f12034f

    invoke-static {v4, p3}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v1

    int-to-float v2, v7

    new-instance p3, LMi/u;

    const/4 v0, 0x0

    invoke-direct {p3, v0, p1, p2}, LMi/u;-><init>(ILKi/d;LVm/k;)V

    const v0, 0x6bf43e2b

    invoke-static {v0, p3, v4}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v3

    const/16 v5, 0x1b0

    const/4 v6, 0x0

    invoke-static/range {v1 .. v6}, LP2/K;->k(Ljava/lang/String;FLu0/d;Lm0/l;II)V

    :cond_9
    invoke-virtual {v4, v7}, Lm0/q;->q(Z)V

    const p3, 0x7f121519

    invoke-static {v4, p3}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v1

    int-to-float v2, v7

    new-instance p3, LMi/u;

    const/4 v0, 0x1

    invoke-direct {p3, v0, p1, p2}, LMi/u;-><init>(ILKi/d;LVm/k;)V

    const v0, 0x4f97f926

    invoke-static {v0, p3, v4}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v3

    const/16 v5, 0x1b0

    const/4 v6, 0x0

    invoke-static/range {v1 .. v6}, LP2/K;->k(Ljava/lang/String;FLu0/d;Lm0/l;II)V

    const/4 p3, 0x1

    invoke-virtual {v4, p3}, Lm0/q;->q(Z)V

    :goto_6
    invoke-virtual {v4}, Lm0/q;->u()Lm0/t0;

    move-result-object p3

    if-eqz p3, :cond_a

    new-instance v0, LMi/r;

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p4

    invoke-direct/range {v0 .. v5}, LMi/r;-><init>(LA0/r;LKi/d;LVm/k;II)V

    iput-object v0, p3, Lm0/t0;->d:LVm/n;

    :cond_a
    return-void
.end method

.method public static final l(LA0/r;Lii/a;LVm/k;Lc8/e;Lm0/l;I)V
    .locals 26

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v5, p5

    const-string v0, "model"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onUiAction"

    invoke-static {v3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v14, p4

    check-cast v14, Lm0/q;

    const v0, -0x61473e0

    invoke-virtual {v14, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, v5, 0x6

    const/4 v4, 0x2

    if-nez v0, :cond_1

    invoke-virtual {v14, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    move v0, v4

    :goto_0
    or-int/2addr v0, v5

    goto :goto_1

    :cond_1
    move v0, v5

    :goto_1
    and-int/lit8 v6, v5, 0x30

    if-nez v6, :cond_3

    invoke-virtual {v14, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    const/16 v6, 0x20

    goto :goto_2

    :cond_2
    const/16 v6, 0x10

    :goto_2
    or-int/2addr v0, v6

    :cond_3
    and-int/lit16 v6, v5, 0x180

    const/16 v7, 0x100

    if-nez v6, :cond_5

    invoke-virtual {v14, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    move v6, v7

    goto :goto_3

    :cond_4
    const/16 v6, 0x80

    :goto_3
    or-int/2addr v0, v6

    :cond_5
    and-int/lit16 v6, v0, 0x93

    const/16 v8, 0x92

    if-ne v6, v8, :cond_7

    invoke-virtual {v14}, Lm0/q;->H()Z

    move-result v6

    if-nez v6, :cond_6

    goto :goto_4

    :cond_6
    invoke-virtual {v14}, Lm0/q;->Y()V

    goto/16 :goto_a

    :cond_7
    :goto_4
    sget-object v6, Landroidx/compose/foundation/layout/b;->c:Landroidx/compose/foundation/layout/FillElement;

    invoke-interface {v1, v6}, LA0/r;->then(LA0/r;)LA0/r;

    move-result-object v6

    invoke-static {v14}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v8

    iget v8, v8, Lhh/i;->e:F

    const/4 v9, 0x0

    invoke-static {v6, v8, v9, v4}, LG/e;->J(LA0/r;FFI)LA0/r;

    move-result-object v4

    invoke-static {v14}, Ly/x;->n(Lm0/l;)Ly/B0;

    move-result-object v6

    const/4 v8, 0x1

    invoke-static {v4, v6, v8}, Ly/x;->o(LA0/r;Ly/B0;Z)LA0/r;

    move-result-object v4

    sget-object v6, LG/l;->c:LG/f;

    sget-object v9, LA0/d;->m:LA0/g;

    const/4 v10, 0x0

    invoke-static {v6, v9, v14, v10}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v6

    iget-wide v11, v14, Lm0/q;->T:J

    invoke-static {v11, v12}, Ljava/lang/Long;->hashCode(J)I

    move-result v9

    invoke-virtual {v14}, Lm0/q;->m()Lm0/o0;

    move-result-object v11

    invoke-static {v4, v14}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v4

    sget-object v12, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v12, LZ0/g;->b:LZ0/f;

    invoke-virtual {v14}, Lm0/q;->j0()V

    iget-boolean v13, v14, Lm0/q;->S:Z

    if-eqz v13, :cond_8

    invoke-virtual {v14, v12}, Lm0/q;->l(LVm/a;)V

    goto :goto_5

    :cond_8
    invoke-virtual {v14}, Lm0/q;->t0()V

    :goto_5
    sget-object v12, LZ0/g;->f:LZ0/e;

    invoke-static {v12, v6, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v6, LZ0/g;->e:LZ0/e;

    invoke-static {v6, v11, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    sget-object v9, LZ0/g;->g:LZ0/e;

    invoke-static {v14, v6, v9}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v6, LZ0/g;->h:LZ0/d;

    invoke-static {v14, v6}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v6, LZ0/g;->d:LZ0/e;

    invoke-static {v6, v4, v14}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v6, LG/D;->a:LG/D;

    move v4, v7

    const/4 v7, 0x0

    move v9, v8

    const v8, 0x7f121249

    move v11, v9

    const/4 v9, 0x0

    move v12, v10

    const/4 v10, 0x0

    move v13, v11

    move v15, v12

    const-wide/16 v11, 0x0

    move/from16 v17, v13

    move-object/from16 v16, v14

    const-wide/16 v13, 0x0

    move/from16 v19, v15

    move-object/from16 v18, v16

    const-wide/16 v15, 0x0

    move/from16 v20, v17

    const/16 v17, 0x0

    move/from16 v21, v20

    move-object/from16 v20, v18

    const/16 v18, 0x0

    move/from16 v22, v19

    const/16 v19, 0x0

    move/from16 v23, v21

    const/16 v21, 0x6

    move/from16 v24, v22

    const/16 v22, 0x0

    move/from16 v25, v23

    const/16 v23, 0x3fd

    move/from16 v4, v24

    invoke-static/range {v6 .. v23}, LP2/z;->B(LG/C;LA0/r;ILjava/lang/Integer;Ljava/lang/Integer;JJJZLo8/a;ZLm0/l;III)V

    move-object/from16 v14, v20

    move-object/from16 v20, v6

    invoke-static {v14, v4}, LP2/z;->J(Lm0/l;I)V

    sget-object v6, Lih/h;->d:Lih/h;

    const v7, 0x7f12124b

    invoke-static {v14, v7}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v14}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v8

    iget-object v8, v8, Lhh/h;->k:Lhh/v;

    iget-wide v10, v8, Lhh/v;->c:J

    const/4 v15, 0x0

    const/16 v17, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v16, v14

    const/4 v14, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x3f6

    invoke-virtual/range {v6 .. v19}, Lih/h;->o(Ljava/lang/String;LA0/r;Lk1/U;JIZIILm0/l;III)V

    move-object/from16 v14, v16

    move-object/from16 v16, v6

    const v6, 0x7f121247

    invoke-static {v14, v6}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v7

    const v6, 0x305202dd

    invoke-virtual {v14, v6}, Lm0/q;->f0(I)V

    and-int/lit16 v0, v0, 0x380

    const/16 v6, 0x100

    if-ne v0, v6, :cond_9

    move/from16 v8, v25

    goto :goto_6

    :cond_9
    move v8, v4

    :goto_6
    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v6

    sget-object v9, Lm0/k;->a:Lm0/e;

    if-nez v8, :cond_a

    if-ne v6, v9, :cond_b

    :cond_a
    new-instance v6, LWf/A0;

    const/16 v8, 0x19

    invoke-direct {v6, v8, v3}, LWf/A0;-><init>(ILVm/k;)V

    invoke-virtual {v14, v6}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_b
    move-object v13, v6

    check-cast v13, LVm/k;

    invoke-virtual {v14, v4}, Lm0/q;->q(Z)V

    iget-object v8, v2, Lii/a;->f:LGa/s;

    const/4 v10, 0x0

    const-wide/16 v11, 0x0

    const/4 v6, 0x0

    move-object v15, v9

    const/4 v9, 0x0

    move-object/from16 v17, v15

    const/4 v15, 0x0

    move-object/from16 v4, v17

    invoke-static/range {v6 .. v15}, LP2/a;->a(LA0/o;Ljava/lang/String;LGa/s;Ljava/time/LocalTime;Ljava/time/LocalTime;JLVm/k;Lm0/l;I)V

    const v6, 0x7f12124a

    invoke-static {v14, v6}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v7

    const v6, 0x30523799

    invoke-virtual {v14, v6}, Lm0/q;->f0(I)V

    const/16 v6, 0x100

    if-ne v0, v6, :cond_c

    move/from16 v8, v25

    goto :goto_7

    :cond_c
    const/4 v8, 0x0

    :goto_7
    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v6

    if-nez v8, :cond_d

    if-ne v6, v4, :cond_e

    :cond_d
    new-instance v6, LWf/A0;

    const/16 v8, 0x1a

    invoke-direct {v6, v8, v3}, LWf/A0;-><init>(ILVm/k;)V

    invoke-virtual {v14, v6}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_e
    move-object v13, v6

    check-cast v13, LVm/k;

    const/4 v6, 0x0

    invoke-virtual {v14, v6}, Lm0/q;->q(Z)V

    iget-object v8, v2, Lii/a;->g:LGa/s;

    const/4 v10, 0x0

    const-wide/16 v11, 0x0

    move/from16 v22, v6

    const/4 v6, 0x0

    const/4 v9, 0x0

    const/4 v15, 0x0

    move/from16 v1, v22

    invoke-static/range {v6 .. v15}, LP2/a;->a(LA0/o;Ljava/lang/String;LGa/s;Ljava/time/LocalTime;Ljava/time/LocalTime;JLVm/k;Lm0/l;I)V

    invoke-static {v14, v1}, LP2/z;->J(Lm0/l;I)V

    const v1, 0x7f12124c

    invoke-static {v14, v1}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v14}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v1

    iget-object v1, v1, Lhh/h;->k:Lhh/v;

    iget-wide v10, v1, Lhh/v;->c:J

    const/4 v15, 0x0

    const/16 v17, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v18, v14

    const/4 v14, 0x0

    move-object/from16 v6, v16

    move-object/from16 v16, v18

    const/16 v18, 0x0

    const/16 v19, 0x3f6

    invoke-virtual/range {v6 .. v19}, Lih/h;->o(Ljava/lang/String;LA0/r;Lk1/U;JIZIILm0/l;III)V

    move-object/from16 v14, v16

    const v1, 0x7f121248

    invoke-static {v14, v1}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v6

    const v1, 0x305288e1

    invoke-virtual {v14, v1}, Lm0/q;->f0(I)V

    const/16 v1, 0x100

    if-ne v0, v1, :cond_f

    move/from16 v8, v25

    goto :goto_8

    :cond_f
    const/4 v8, 0x0

    :goto_8
    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v1

    if-nez v8, :cond_10

    if-ne v1, v4, :cond_11

    :cond_10
    new-instance v1, LWf/A0;

    const/16 v7, 0x1b

    invoke-direct {v1, v7, v3}, LWf/A0;-><init>(ILVm/k;)V

    invoke-virtual {v14, v1}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_11
    move-object v11, v1

    check-cast v11, LVm/k;

    const/4 v12, 0x0

    invoke-virtual {v14, v12}, Lm0/q;->q(Z)V

    const/4 v9, 0x0

    const/4 v10, 0x0

    iget-boolean v7, v2, Lii/a;->h:Z

    const/4 v8, 0x0

    const/4 v13, 0x0

    move-object/from16 v16, v14

    const/16 v14, 0x3c

    move-object/from16 v12, v16

    invoke-static/range {v6 .. v14}, LP2/C;->b(Ljava/lang/String;ZZLcom/eightsleep/corepresentation/enums/CellVariant;ZLVm/k;Lm0/l;II)V

    move-object v14, v12

    iget-boolean v1, v2, Lii/a;->h:Z

    xor-int/lit8 v7, v1, 0x1

    new-instance v1, LWf/I0;

    const/16 v6, 0x8

    invoke-direct {v1, v6, v2, v3}, LWf/I0;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    const v6, 0x218f946e

    invoke-static {v6, v1, v14}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v12

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object/from16 v16, v14

    const v14, 0x180006

    const/16 v15, 0x1e

    move-object/from16 v13, v16

    move-object/from16 v6, v20

    invoke-static/range {v6 .. v15}, Lv/d;->b(LG/C;ZLA0/r;Lv/c0;Lv/d0;Ljava/lang/String;Lu0/d;Lm0/l;II)V

    move-object v14, v13

    const/4 v12, 0x0

    invoke-static {v14, v12}, LP2/z;->J(Lm0/l;I)V

    const/4 v1, 0x6

    invoke-static {v6, v14, v1}, LP2/z;->I(LG/C;Lm0/l;I)V

    sget-object v6, LOg/e;->c:LOg/e;

    const v1, 0x7f120366

    invoke-static {v14, v1}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v9

    const v1, 0x3053495c

    invoke-virtual {v14, v1}, Lm0/q;->f0(I)V

    const/16 v1, 0x100

    if-ne v0, v1, :cond_12

    move/from16 v8, v25

    goto :goto_9

    :cond_12
    const/4 v8, 0x0

    :goto_9
    invoke-virtual {v14}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v0

    if-nez v8, :cond_13

    if-ne v0, v4, :cond_14

    :cond_13
    new-instance v0, Lcf/o;

    const/16 v1, 0x9

    invoke-direct {v0, v1, v3}, Lcf/o;-><init>(ILVm/k;)V

    invoke-virtual {v14, v0}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_14
    move-object/from16 v17, v0

    check-cast v17, LVm/a;

    const/4 v12, 0x0

    invoke-virtual {v14, v12}, Lm0/q;->q(Z)V

    const/16 v16, 0x0

    const/16 v19, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v18, v14

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x7fb

    invoke-virtual/range {v6 .. v21}, LOg/e;->h(LA0/r;Lkm/o;Ljava/lang/String;Ljava/lang/Integer;Lhh/n;Lhh/d;ZZLhh/e;LJg/b;LVm/a;Lm0/l;III)V

    move-object/from16 v14, v18

    move/from16 v11, v25

    invoke-virtual {v14, v11}, Lm0/q;->q(Z)V

    :goto_a
    invoke-virtual {v14}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_15

    new-instance v0, Lci/a;

    const/4 v6, 0x7

    move-object/from16 v1, p0

    move-object/from16 v4, p3

    invoke-direct/range {v0 .. v6}, Lci/a;-><init>(LA0/r;Lii/a;LVm/k;Lc8/e;II)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_15
    return-void
.end method

.method public static final m(Lcom/eightsleep/presentation_onboarding/viewmodel/Pod6LaunchAnnouncementOnboardingViewModel;LVm/k;LVm/k;Lm0/l;I)V
    .locals 13

    move/from16 v12, p4

    const-string v0, "viewModel"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onOneTimeEvent"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onNavEvent"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v9, p3

    check-cast v9, Lm0/q;

    const v0, 0x61d6ee85

    invoke-virtual {v9, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, v12, 0x6

    if-nez v0, :cond_1

    invoke-virtual {v9, p0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int/2addr v0, v12

    goto :goto_1

    :cond_1
    move v0, v12

    :goto_1
    and-int/lit8 v4, v12, 0x30

    if-nez v4, :cond_3

    invoke-virtual {v9, p1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    const/16 v4, 0x20

    goto :goto_2

    :cond_2
    const/16 v4, 0x10

    :goto_2
    or-int/2addr v0, v4

    :cond_3
    and-int/lit16 v4, v12, 0x180

    if-nez v4, :cond_5

    invoke-virtual {v9, p2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const/16 v4, 0x100

    goto :goto_3

    :cond_4
    const/16 v4, 0x80

    :goto_3
    or-int/2addr v0, v4

    :cond_5
    and-int/lit16 v4, v0, 0x93

    const/16 v5, 0x92

    if-ne v4, v5, :cond_6

    invoke-virtual {v9}, Lm0/q;->H()Z

    move-result v4

    if-nez v4, :cond_7

    :cond_6
    move v4, v0

    goto :goto_4

    :cond_7
    invoke-virtual {v9}, Lm0/q;->Y()V

    goto :goto_5

    :goto_4
    sget-object v0, Landroidx/compose/foundation/layout/b;->c:Landroidx/compose/foundation/layout/FillElement;

    new-instance v5, LAe/u;

    const/16 v6, 0xb

    invoke-direct {v5, p0, v6}, LAe/u;-><init>(Ljava/lang/Object;I)V

    const v6, -0x7d64ff0b

    invoke-static {v6, v5, v9}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v8

    shl-int/lit8 v4, v4, 0x3

    and-int/lit8 v5, v4, 0x70

    const v6, 0x6c06006

    or-int/2addr v5, v6

    and-int/lit16 v6, v4, 0x380

    or-int/2addr v5, v6

    and-int/lit16 v4, v4, 0x1c00

    or-int v10, v5, v4

    const/4 v6, 0x0

    const-string v7, "pod_6_launch_announcement"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v11, 0x60

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-static/range {v0 .. v11}, LP2/o;->g(LA0/r;LL8/e;LVm/k;LVm/k;ZZLH0/w;Ljava/lang/String;LVm/r;Lm0/l;II)V

    :goto_5
    invoke-virtual {v9}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_8

    new-instance v0, Lj0/f0;

    const/16 v5, 0x9

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, v12

    invoke-direct/range {v0 .. v5}, Lj0/f0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_8
    return-void
.end method

.method public static final n(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;ZLVm/a;Lm0/l;II)V
    .locals 18

    move-object/from16 v2, p1

    move/from16 v7, p7

    move-object/from16 v0, p6

    check-cast v0, Lm0/q;

    const v1, 0x243ffb62

    invoke-virtual {v0, v1}, Lm0/q;->h0(I)Lm0/q;

    move-object/from16 v8, p0

    invoke-virtual {v0, v8}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x4

    goto :goto_0

    :cond_0
    const/4 v1, 0x2

    :goto_0
    or-int/2addr v1, v7

    invoke-virtual {v0, v2}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const/16 v3, 0x20

    goto :goto_1

    :cond_1
    const/16 v3, 0x10

    :goto_1
    or-int/2addr v1, v3

    move/from16 v9, p2

    invoke-virtual {v0, v9}, Lm0/q;->h(Z)Z

    move-result v3

    if-eqz v3, :cond_2

    const/16 v3, 0x100

    goto :goto_2

    :cond_2
    const/16 v3, 0x80

    :goto_2
    or-int/2addr v1, v3

    move-object/from16 v10, p3

    invoke-virtual {v0, v10}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    const/16 v3, 0x800

    goto :goto_3

    :cond_3
    const/16 v3, 0x400

    :goto_3
    or-int/2addr v1, v3

    and-int/lit8 v3, p8, 0x10

    if-eqz v3, :cond_5

    or-int/lit16 v1, v1, 0x6000

    :cond_4
    move/from16 v4, p4

    :goto_4
    move-object/from16 v14, p5

    goto :goto_6

    :cond_5
    and-int/lit16 v4, v7, 0x6000

    if-nez v4, :cond_4

    move/from16 v4, p4

    invoke-virtual {v0, v4}, Lm0/q;->h(Z)Z

    move-result v5

    if-eqz v5, :cond_6

    const/16 v5, 0x4000

    goto :goto_5

    :cond_6
    const/16 v5, 0x2000

    :goto_5
    or-int/2addr v1, v5

    goto :goto_4

    :goto_6
    invoke-virtual {v0, v14}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    const/high16 v5, 0x20000

    goto :goto_7

    :cond_7
    const/high16 v5, 0x10000

    :goto_7
    or-int/2addr v1, v5

    const v5, 0x12493

    and-int/2addr v5, v1

    const v6, 0x12492

    if-ne v5, v6, :cond_9

    invoke-virtual {v0}, Lm0/q;->H()Z

    move-result v5

    if-nez v5, :cond_8

    goto :goto_8

    :cond_8
    invoke-virtual {v0}, Lm0/q;->Y()V

    move-object/from16 v16, v0

    move v5, v4

    goto :goto_a

    :cond_9
    :goto_8
    if-eqz v3, :cond_a

    const/4 v3, 0x1

    move v12, v3

    goto :goto_9

    :cond_a
    move v12, v4

    :goto_9
    sget-object v3, LA0/o;->a:LA0/o;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v3, v4}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v3

    const/16 v4, 0x40

    int-to-float v4, v4

    invoke-static {v3, v4}, Landroidx/compose/foundation/layout/b;->e(LA0/r;F)LA0/r;

    move-result-object v11

    new-instance v3, LBg/d;

    const/4 v4, 0x0

    invoke-direct {v3, v2, v4}, LBg/d;-><init>(Ljava/lang/String;I)V

    const v4, -0x99569d2

    invoke-static {v4, v3, v0}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v15

    and-int/lit8 v3, v1, 0xe

    const v4, 0xc30c00

    or-int/2addr v3, v4

    shr-int/lit8 v4, v1, 0x3

    and-int/lit8 v5, v4, 0x70

    or-int/2addr v3, v5

    and-int/lit16 v4, v4, 0x380

    or-int/2addr v3, v4

    const v4, 0xe000

    and-int/2addr v4, v1

    or-int/2addr v3, v4

    const/high16 v4, 0x380000

    shl-int/lit8 v1, v1, 0x3

    and-int/2addr v1, v4

    or-int v17, v3, v1

    const/4 v13, 0x1

    move-object/from16 v16, v0

    invoke-static/range {v8 .. v17}, LP2/f;->v(Ljava/lang/String;ZLjava/lang/String;LA0/r;ZZLVm/a;Lu0/d;Lm0/l;I)V

    move v5, v12

    :goto_a
    invoke-virtual/range {v16 .. v16}, Lm0/q;->u()Lm0/t0;

    move-result-object v9

    if-eqz v9, :cond_b

    new-instance v0, LBg/a;

    move-object/from16 v1, p0

    move/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v6, p5

    move/from16 v8, p8

    invoke-direct/range {v0 .. v8}, LBg/a;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;ZLVm/a;II)V

    iput-object v0, v9, Lm0/t0;->d:LVm/n;

    :cond_b
    return-void
.end method

.method public static final o(LA0/r;Lcom/eightsleep/presentation_temperature/viewmodel/TemperatureSettingsViewModel;LVm/k;LVm/k;Lm0/l;I)V
    .locals 13

    move-object/from16 v2, p3

    move/from16 v12, p5

    const-string v0, "modifier"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onNavEvent"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onOneTimeEvent"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v9, p4

    check-cast v9, Lm0/q;

    const v0, -0x5d3fea66

    invoke-virtual {v9, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, v12, 0x6

    if-nez v0, :cond_1

    invoke-virtual {v9, p0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int/2addr v0, v12

    goto :goto_1

    :cond_1
    move v0, v12

    :goto_1
    and-int/lit8 v1, v12, 0x30

    if-nez v1, :cond_3

    invoke-virtual {v9, p1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    const/16 v4, 0x20

    goto :goto_2

    :cond_2
    const/16 v4, 0x10

    :goto_2
    or-int/2addr v0, v4

    :cond_3
    and-int/lit16 v4, v12, 0x180

    if-nez v4, :cond_5

    invoke-virtual {v9, p2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const/16 v4, 0x100

    goto :goto_3

    :cond_4
    const/16 v4, 0x80

    :goto_3
    or-int/2addr v0, v4

    :cond_5
    and-int/lit16 v4, v12, 0xc00

    if-nez v4, :cond_7

    invoke-virtual {v9, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    const/16 v4, 0x800

    goto :goto_4

    :cond_6
    const/16 v4, 0x400

    :goto_4
    or-int/2addr v0, v4

    :cond_7
    and-int/lit16 v4, v0, 0x493

    const/16 v5, 0x492

    if-ne v4, v5, :cond_9

    invoke-virtual {v9}, Lm0/q;->H()Z

    move-result v4

    if-nez v4, :cond_8

    goto :goto_5

    :cond_8
    invoke-virtual {v9}, Lm0/q;->Y()V

    goto :goto_6

    :cond_9
    :goto_5
    new-instance v4, LAe/Q;

    const/16 v5, 0xb

    invoke-direct {v4, p0, v5}, LAe/Q;-><init>(LA0/r;I)V

    const v5, 0x250928b4

    invoke-static {v5, v4, v9}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v8

    and-int/lit8 v4, v0, 0x70

    const/high16 v5, 0x6c00000

    or-int/2addr v4, v5

    shr-int/lit8 v5, v0, 0x3

    and-int/lit16 v5, v5, 0x380

    or-int/2addr v4, v5

    shl-int/lit8 v0, v0, 0x3

    and-int/lit16 v0, v0, 0x1c00

    or-int v10, v4, v0

    const/4 v6, 0x0

    const-string v7, "sleep_stage_response"

    const/4 v0, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v11, 0x71

    move-object v1, p1

    move-object v3, p2

    invoke-static/range {v0 .. v11}, LP2/o;->g(LA0/r;LL8/e;LVm/k;LVm/k;ZZLH0/w;Ljava/lang/String;LVm/r;Lm0/l;II)V

    :goto_6
    invoke-virtual {v9}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_a

    new-instance v0, LEi/b;

    const/4 v6, 0x1

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object/from16 v4, p3

    move v5, v12

    invoke-direct/range {v0 .. v6}, LEi/b;-><init>(LA0/r;Lcom/eightsleep/presentation_temperature/viewmodel/TemperatureSettingsViewModel;LVm/k;LVm/k;II)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_a
    return-void
.end method

.method public static final p(LA0/r;LDi/d;LVm/k;Lc8/e;Lm0/l;I)V
    .locals 23

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v5, p5

    const-string v0, "modifier"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "model"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onUiAction"

    invoke-static {v3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v0, p4

    check-cast v0, Lm0/q;

    const v4, 0x568260e4

    invoke-virtual {v0, v4}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v4, v5, 0x6

    if-nez v4, :cond_1

    invoke-virtual {v0, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v4, 0x4

    goto :goto_0

    :cond_0
    const/4 v4, 0x2

    :goto_0
    or-int/2addr v4, v5

    goto :goto_1

    :cond_1
    move v4, v5

    :goto_1
    and-int/lit8 v6, v5, 0x30

    if-nez v6, :cond_4

    and-int/lit8 v6, v5, 0x40

    if-nez v6, :cond_2

    invoke-virtual {v0, v2}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v6

    goto :goto_2

    :cond_2
    invoke-virtual {v0, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    :goto_2
    if-eqz v6, :cond_3

    const/16 v6, 0x20

    goto :goto_3

    :cond_3
    const/16 v6, 0x10

    :goto_3
    or-int/2addr v4, v6

    :cond_4
    and-int/lit16 v6, v5, 0x180

    const/16 v7, 0x100

    if-nez v6, :cond_6

    invoke-virtual {v0, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    move v6, v7

    goto :goto_4

    :cond_5
    const/16 v6, 0x80

    :goto_4
    or-int/2addr v4, v6

    :cond_6
    and-int/lit16 v6, v4, 0x93

    const/16 v8, 0x92

    if-ne v6, v8, :cond_8

    invoke-virtual {v0}, Lm0/q;->H()Z

    move-result v6

    if-nez v6, :cond_7

    goto :goto_5

    :cond_7
    invoke-virtual {v0}, Lm0/q;->Y()V

    goto/16 :goto_8

    :cond_8
    :goto_5
    sget-object v6, LG/l;->c:LG/f;

    sget-object v8, LA0/d;->m:LA0/g;

    const/4 v9, 0x0

    invoke-static {v6, v8, v0, v9}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v6

    iget-wide v10, v0, Lm0/q;->T:J

    invoke-static {v10, v11}, Ljava/lang/Long;->hashCode(J)I

    move-result v8

    invoke-virtual {v0}, Lm0/q;->m()Lm0/o0;

    move-result-object v10

    invoke-static {v1, v0}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v11

    sget-object v12, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v12, LZ0/g;->b:LZ0/f;

    invoke-virtual {v0}, Lm0/q;->j0()V

    iget-boolean v13, v0, Lm0/q;->S:Z

    if-eqz v13, :cond_9

    invoke-virtual {v0, v12}, Lm0/q;->l(LVm/a;)V

    goto :goto_6

    :cond_9
    invoke-virtual {v0}, Lm0/q;->t0()V

    :goto_6
    sget-object v12, LZ0/g;->f:LZ0/e;

    invoke-static {v12, v6, v0}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v6, LZ0/g;->e:LZ0/e;

    invoke-static {v6, v10, v0}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    sget-object v8, LZ0/g;->g:LZ0/e;

    invoke-static {v0, v6, v8}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v6, LZ0/g;->h:LZ0/d;

    invoke-static {v0, v6}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v6, LZ0/g;->d:LZ0/e;

    invoke-static {v6, v11, v0}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const v6, 0x7f1202aa

    invoke-static {v0, v6}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v10

    const v6, 0x7f1202a4

    invoke-static {v0, v6}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v8

    sget-object v13, Lcom/eightsleep/corepresentation/enums/CellVariant;->STACKED:Lcom/eightsleep/corepresentation/enums/CellVariant;

    sget-object v14, LLg/g;->AUTOPILOT:LLg/g;

    const v6, -0x4fa89512

    invoke-virtual {v0, v6}, Lm0/q;->f0(I)V

    and-int/lit16 v4, v4, 0x380

    const/4 v6, 0x1

    if-ne v4, v7, :cond_a

    move v4, v6

    goto :goto_7

    :cond_a
    move v4, v9

    :goto_7
    invoke-virtual {v0}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v7

    if-nez v4, :cond_b

    sget-object v4, Lm0/k;->a:Lm0/e;

    if-ne v7, v4, :cond_c

    :cond_b
    new-instance v7, LCg/I0;

    const/4 v4, 0x6

    invoke-direct {v7, v4, v3}, LCg/I0;-><init>(ILVm/k;)V

    invoke-virtual {v0, v7}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_c
    move-object/from16 v17, v7

    check-cast v17, LVm/k;

    invoke-virtual {v0, v9}, Lm0/q;->q(Z)V

    const/16 v18, 0x0

    const/high16 v20, 0x36000000

    move v4, v6

    const/4 v6, 0x0

    iget-boolean v7, v2, LDi/d;->l:Z

    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v21, 0x6

    const/16 v22, 0x28d5

    move-object/from16 v19, v0

    invoke-static/range {v6 .. v22}, LP2/H;->c(LA0/r;ZLjava/lang/String;ZLjava/lang/String;Lu0/d;ZLcom/eightsleep/corepresentation/enums/CellVariant;LLg/g;ZZLVm/k;LVm/a;Lm0/l;III)V

    invoke-virtual {v0, v4}, Lm0/q;->q(Z)V

    :goto_8
    invoke-virtual {v0}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_d

    new-instance v0, LEi/a;

    const/4 v6, 0x1

    move-object/from16 v4, p3

    invoke-direct/range {v0 .. v6}, LEi/a;-><init>(LA0/r;LDi/d;LVm/k;Lc8/e;II)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_d
    return-void
.end method

.method public static final q(Lji/k;LVm/k;Lm0/l;I)V
    .locals 7

    const-string v0, "model"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onUiAction"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v4, p2

    check-cast v4, Lm0/q;

    const p2, 0x78c935b2

    invoke-virtual {v4, p2}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 p2, p3, 0x6

    if-nez p2, :cond_1

    invoke-virtual {v4, p0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 p2, 0x4

    goto :goto_0

    :cond_0
    const/4 p2, 0x2

    :goto_0
    or-int/2addr p2, p3

    goto :goto_1

    :cond_1
    move p2, p3

    :goto_1
    and-int/lit8 v0, p3, 0x30

    if-nez v0, :cond_3

    invoke-virtual {v4, p1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/16 v0, 0x20

    goto :goto_2

    :cond_2
    const/16 v0, 0x10

    :goto_2
    or-int/2addr p2, v0

    :cond_3
    and-int/lit8 p2, p2, 0x13

    const/16 v0, 0x12

    if-ne p2, v0, :cond_5

    invoke-virtual {v4}, Lm0/q;->H()Z

    move-result p2

    if-nez p2, :cond_4

    goto :goto_3

    :cond_4
    invoke-virtual {v4}, Lm0/q;->Y()V

    goto/16 :goto_7

    :cond_5
    :goto_3
    sget-object p2, Landroidx/compose/foundation/layout/b;->c:Landroidx/compose/foundation/layout/FillElement;

    sget-object v0, LA0/d;->e:LA0/i;

    const/4 v1, 0x0

    invoke-static {v0, v1}, LG/t;->d(LA0/e;Z)LX0/h0;

    move-result-object v0

    iget-wide v2, v4, Lm0/q;->T:J

    invoke-static {v2, v3}, Ljava/lang/Long;->hashCode(J)I

    move-result v2

    invoke-virtual {v4}, Lm0/q;->m()Lm0/o0;

    move-result-object v3

    invoke-static {p2, v4}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object p2

    sget-object v5, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v5, LZ0/g;->b:LZ0/f;

    invoke-virtual {v4}, Lm0/q;->j0()V

    iget-boolean v6, v4, Lm0/q;->S:Z

    if-eqz v6, :cond_6

    invoke-virtual {v4, v5}, Lm0/q;->l(LVm/a;)V

    goto :goto_4

    :cond_6
    invoke-virtual {v4}, Lm0/q;->t0()V

    :goto_4
    sget-object v5, LZ0/g;->f:LZ0/e;

    invoke-static {v5, v0, v4}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v0, LZ0/g;->e:LZ0/e;

    invoke-static {v0, v3, v4}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v2, LZ0/g;->g:LZ0/e;

    invoke-static {v4, v0, v2}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v0, LZ0/g;->h:LZ0/d;

    invoke-static {v4, v0}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v0, LZ0/g;->d:LZ0/e;

    invoke-static {v0, p2, v4}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    iget-object p2, p0, Lji/k;->a:LWh/s;

    invoke-interface {p2}, LWh/s;->getCaptionResId()Ljava/lang/Integer;

    move-result-object v0

    const v2, 0x5dfe40f

    invoke-virtual {v4, v2}, Lm0/q;->f0(I)V

    if-nez v0, :cond_7

    const/4 v0, 0x0

    goto :goto_5

    :cond_7
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-static {v4, v0}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v0

    :goto_5
    invoke-virtual {v4, v1}, Lm0/q;->q(Z)V

    const v2, 0x5dfe37b

    invoke-virtual {v4, v2}, Lm0/q;->f0(I)V

    if-nez v0, :cond_9

    iget-object v0, p0, Lji/k;->i:Lji/j;

    iget-object v2, v0, Lji/j;->c:Lcom/eightsleep/data_core/enums/HeatingCoolingState;

    invoke-virtual {v2}, Lcom/eightsleep/data_core/enums/HeatingCoolingState;->getStatusLabelResId()I

    move-result v2

    invoke-static {v4, v2}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "toLowerCase(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v3, v0, Lji/j;->b:LGa/b;

    iget-object v0, v0, Lji/j;->a:LGa/b;

    invoke-virtual {v3, v0}, LGa/b;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    const v0, -0x6cb03491

    const v2, 0x7f1217ca

    invoke-static {v4, v0, v2, v4, v1}, Lcom/eightsleep/data_bioage/data/model/a;->n(Lm0/q;IILm0/q;Z)Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    :cond_8
    const v0, -0x6cae9a0f

    invoke-virtual {v4, v0}, Lm0/q;->f0(I)V

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v0

    const v2, 0x7f1217c5

    invoke-static {v2, v0, v4}, LP2/j;->H(I[Ljava/lang/Object;Lm0/l;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v1}, Lm0/q;->q(Z)V

    :cond_9
    :goto_6
    move-object v2, v0

    invoke-virtual {v4, v1}, Lm0/q;->q(Z)V

    invoke-interface {p2}, LPh/a;->getTitleResId()I

    move-result p2

    invoke-static {v4, p2}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v1

    new-instance p2, Lui/j;

    invoke-direct {p2, p0, p1}, Lui/j;-><init>(Lji/k;LVm/k;)V

    const v0, 0x7cc4b9aa

    invoke-static {v0, p2, v4}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v3

    const/16 v5, 0x180

    const/4 v6, 0x0

    invoke-static/range {v1 .. v6}, LP2/K;->n(Ljava/lang/String;Ljava/lang/String;Lu0/d;Lm0/l;II)V

    const/4 p2, 0x1

    invoke-virtual {v4, p2}, Lm0/q;->q(Z)V

    :goto_7
    invoke-virtual {v4}, Lm0/q;->u()Lm0/t0;

    move-result-object p2

    if-eqz p2, :cond_a

    new-instance v0, Lui/i;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p1, p3, v1}, Lui/i;-><init>(Lji/k;LVm/k;II)V

    iput-object v0, p2, Lm0/t0;->d:LVm/n;

    :cond_a
    return-void
.end method

.method public static final r(Ljava/lang/String;Ljava/lang/String;JLVm/a;Lm0/l;I)V
    .locals 7

    const-string v0, "title"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p5, Lm0/q;

    const v0, 0xc103c78

    invoke-virtual {p5, v0}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {p5, p0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int/2addr v0, p6

    invoke-virtual {p5, p1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x20

    goto :goto_1

    :cond_1
    const/16 v1, 0x10

    :goto_1
    or-int/2addr v0, v1

    invoke-virtual {p5, p2, p3}, Lm0/q;->f(J)Z

    move-result v1

    const/16 v2, 0x100

    if-eqz v1, :cond_2

    move v1, v2

    goto :goto_2

    :cond_2
    const/16 v1, 0x80

    :goto_2
    or-int/2addr v0, v1

    invoke-virtual {p5, p4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    const/16 v3, 0x800

    if-eqz v1, :cond_3

    move v1, v3

    goto :goto_3

    :cond_3
    const/16 v1, 0x400

    :goto_3
    or-int/2addr v0, v1

    and-int/lit16 v1, v0, 0x493

    const/16 v4, 0x492

    if-ne v1, v4, :cond_5

    invoke-virtual {p5}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_4

    goto :goto_4

    :cond_4
    invoke-virtual {p5}, Lm0/q;->Y()V

    goto :goto_7

    :cond_5
    :goto_4
    sget-object v1, Lm0/k;->a:Lm0/e;

    const v4, 0x3a83416

    invoke-virtual {p5, v4}, Lm0/q;->f0(I)V

    and-int/lit16 v4, v0, 0x380

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-ne v4, v2, :cond_6

    move v2, v6

    goto :goto_5

    :cond_6
    move v2, v5

    :goto_5
    and-int/lit16 v0, v0, 0x1c00

    if-ne v0, v3, :cond_7

    goto :goto_6

    :cond_7
    move v6, v5

    :goto_6
    or-int v0, v2, v6

    invoke-virtual {p5}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v2

    if-nez v0, :cond_8

    if-ne v2, v1, :cond_9

    :cond_8
    new-instance v2, Lz8/k;

    const/4 v0, 0x0

    invoke-direct {v2, p2, p3, p4, v0}, Lz8/k;-><init>(JLVm/a;LLm/c;)V

    invoke-virtual {p5, v2}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_9
    check-cast v2, LVm/n;

    invoke-virtual {p5, v5}, Lm0/q;->q(Z)V

    invoke-static {v2, p0, p5}, Lm0/r;->f(LVm/n;Ljava/lang/Object;Lm0/l;)V

    new-instance v0, Lg8/D0;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p1, v1}, Lg8/D0;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    const v1, 0x566f42eb

    invoke-static {v1, v0, p5}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v0

    const/4 v1, 0x6

    invoke-static {v0, p5, v1}, Landroidx/room/migration/bundle/a;->p(Lu0/d;Lm0/l;I)V

    :goto_7
    invoke-virtual {p5}, Lm0/q;->u()Lm0/t0;

    move-result-object p5

    if-eqz p5, :cond_a

    new-instance v0, Lz8/j;

    move-object v1, p0

    move-object v2, p1

    move-wide v3, p2

    move-object v5, p4

    move v6, p6

    invoke-direct/range {v0 .. v6}, Lz8/j;-><init>(Ljava/lang/String;Ljava/lang/String;JLVm/a;I)V

    iput-object v0, p5, Lm0/t0;->d:LVm/n;

    :cond_a
    return-void
.end method

.method public static final s(LC8/K;Lm0/l;I)V
    .locals 20

    move-object/from16 v0, p0

    move/from16 v1, p2

    move-object/from16 v9, p1

    check-cast v9, Lm0/q;

    const v2, 0x69567066

    invoke-virtual {v9, v2}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v9, v0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x2

    if-eqz v2, :cond_0

    const/4 v2, 0x4

    goto :goto_0

    :cond_0
    move v2, v3

    :goto_0
    or-int/2addr v2, v1

    and-int/lit8 v2, v2, 0x3

    if-ne v2, v3, :cond_2

    invoke-virtual {v9}, Lm0/q;->H()Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v9}, Lm0/q;->Y()V

    move-object v7, v9

    goto/16 :goto_5

    :cond_2
    :goto_1
    sget-object v10, LA0/o;->a:LA0/o;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v10, v2}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v2

    const/16 v3, 0xc8

    int-to-float v3, v3

    invoke-static {v2, v3}, Landroidx/compose/foundation/layout/b;->e(LA0/r;F)LA0/r;

    move-result-object v2

    sget-object v3, LA0/d;->a:LA0/i;

    const/4 v12, 0x0

    invoke-static {v3, v12}, LG/t;->d(LA0/e;Z)LX0/h0;

    move-result-object v3

    iget-wide v4, v9, Lm0/q;->T:J

    invoke-static {v4, v5}, Ljava/lang/Long;->hashCode(J)I

    move-result v4

    invoke-virtual {v9}, Lm0/q;->m()Lm0/o0;

    move-result-object v5

    invoke-static {v2, v9}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v2

    sget-object v6, LZ0/h;->l0:LZ0/g;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v11, LZ0/g;->b:LZ0/f;

    invoke-virtual {v9}, Lm0/q;->j0()V

    iget-boolean v6, v9, Lm0/q;->S:Z

    if-eqz v6, :cond_3

    invoke-virtual {v9, v11}, Lm0/q;->l(LVm/a;)V

    goto :goto_2

    :cond_3
    invoke-virtual {v9}, Lm0/q;->t0()V

    :goto_2
    sget-object v13, LZ0/g;->f:LZ0/e;

    invoke-static {v13, v3, v9}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v14, LZ0/g;->e:LZ0/e;

    invoke-static {v14, v5, v9}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    sget-object v15, LZ0/g;->g:LZ0/e;

    invoke-static {v9, v3, v15}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v3, LZ0/g;->h:LZ0/d;

    invoke-static {v9, v3}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v4, LZ0/g;->d:LZ0/e;

    invoke-static {v4, v2, v9}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v2, LG/x;->a:LG/x;

    const v5, 0x5f4c2ada

    invoke-virtual {v9, v5}, Lm0/q;->f0(I)V

    move-object v5, v4

    iget-object v4, v0, LC8/K;->c:Landroid/net/Uri;

    if-nez v4, :cond_4

    move-object/from16 v18, v3

    move-object/from16 v19, v5

    move-object v7, v9

    goto :goto_3

    :cond_4
    invoke-virtual {v2, v10}, LG/x;->matchParentSize(LA0/r;)LA0/r;

    move-result-object v2

    move-object v6, v5

    sget-object v5, LX0/p;->a:LX0/p0;

    move-object v7, v3

    const/4 v3, 0x0

    move-object v8, v6

    const-string v6, "Hero Header Background Image"

    move-object/from16 v16, v8

    const/16 v8, 0x6c00

    move-object/from16 v17, v7

    move-object v7, v9

    const/4 v9, 0x2

    move-object/from16 v19, v16

    move-object/from16 v18, v17

    invoke-static/range {v2 .. v9}, LP2/l;->k(LA0/r;Ljava/lang/Integer;Landroid/net/Uri;LX0/q;Ljava/lang/String;Lm0/l;II)V

    :goto_3
    invoke-virtual {v7, v12}, Lm0/q;->q(Z)V

    invoke-static {v7}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v2

    iget v2, v2, Lhh/i;->e:F

    invoke-static {v10, v2}, LG/e;->H(LA0/r;F)LA0/r;

    move-result-object v2

    sget-object v3, LG/l;->c:LG/f;

    sget-object v4, LA0/d;->m:LA0/g;

    invoke-static {v3, v4, v7, v12}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v3

    iget-wide v4, v7, Lm0/q;->T:J

    invoke-static {v4, v5}, Ljava/lang/Long;->hashCode(J)I

    move-result v4

    invoke-virtual {v7}, Lm0/q;->m()Lm0/o0;

    move-result-object v5

    invoke-static {v2, v7}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v2

    invoke-virtual {v7}, Lm0/q;->j0()V

    iget-boolean v6, v7, Lm0/q;->S:Z

    if-eqz v6, :cond_5

    invoke-virtual {v7, v11}, Lm0/q;->l(LVm/a;)V

    goto :goto_4

    :cond_5
    invoke-virtual {v7}, Lm0/q;->t0()V

    :goto_4
    invoke-static {v13, v3, v7}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v14, v5, v7}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object/from16 v3, v18

    invoke-static {v4, v7, v15, v7, v3}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    move-object/from16 v5, v19

    invoke-static {v5, v2, v7}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v2, LG/D;->a:LG/D;

    const/4 v3, 0x6

    invoke-static {v2, v7, v3}, LP2/z;->I(LG/C;Lm0/l;I)V

    sget-object v2, Lg8/h0;->a:Lg8/h0;

    iget v3, v0, LC8/K;->a:I

    invoke-static {v7, v3}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v3

    const/4 v10, 0x0

    const/4 v8, 0x0

    const/4 v6, 0x0

    const/4 v5, 0x0

    const/4 v11, 0x0

    move-object v9, v7

    move-object v7, v3

    const/high16 v3, 0xc00000

    const/16 v4, 0x7e

    invoke-virtual/range {v2 .. v11}, Lg8/h0;->i(IILA0/r;LH0/w;Ljava/lang/String;Lk1/U;Lm0/l;Lv1/k;Z)V

    move-object v7, v9

    const v3, 0x5969bcf0

    invoke-virtual {v7, v3}, Lm0/q;->f0(I)V

    iget-object v3, v0, LC8/K;->b:Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    invoke-static {v7, v12}, LP2/z;->Q(Lm0/l;I)V

    invoke-static {v7, v3}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v3

    const/4 v10, 0x0

    const/4 v8, 0x0

    const/4 v6, 0x0

    const/4 v5, 0x0

    const/4 v11, 0x0

    move-object v9, v7

    move-object v7, v3

    const/high16 v3, 0xc00000

    const/16 v4, 0x7e

    invoke-virtual/range {v2 .. v11}, Lg8/h0;->a(IILA0/r;LH0/w;Ljava/lang/String;Lk1/U;Lm0/l;Lv1/k;Z)V

    move-object v7, v9

    invoke-virtual {v7, v12}, Lm0/q;->q(Z)V

    invoke-static {v7, v12}, LP2/z;->M(Lm0/l;I)V

    const/4 v2, 0x1

    invoke-virtual {v7, v2}, Lm0/q;->q(Z)V

    invoke-virtual {v7, v2}, Lm0/q;->q(Z)V

    :goto_5
    invoke-virtual {v7}, Lm0/q;->u()Lm0/t0;

    move-result-object v2

    if-eqz v2, :cond_6

    new-instance v3, LWf/i0;

    const/16 v4, 0x14

    invoke-direct {v3, v0, v1, v4}, LWf/i0;-><init>(Ljava/lang/Object;II)V

    iput-object v3, v2, Lm0/t0;->d:LVm/n;

    :cond_6
    return-void
.end method

.method public static final t(ZLu0/d;Lm0/l;I)V
    .locals 9

    move-object v6, p2

    check-cast v6, Lm0/q;

    const p2, 0x1730764

    invoke-virtual {v6, p2}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 p2, p3, 0x6

    const/4 v0, 0x2

    if-nez p2, :cond_1

    invoke-virtual {v6, p0}, Lm0/q;->h(Z)Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 p2, 0x4

    goto :goto_0

    :cond_0
    move p2, v0

    :goto_0
    or-int/2addr p2, p3

    goto :goto_1

    :cond_1
    move p2, p3

    :goto_1
    and-int/lit8 v1, p3, 0x30

    if-nez v1, :cond_3

    invoke-virtual {v6, p1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x20

    goto :goto_2

    :cond_2
    const/16 v1, 0x10

    :goto_2
    or-int/2addr p2, v1

    :cond_3
    and-int/lit8 v1, p2, 0x13

    const/16 v2, 0x12

    if-ne v1, v2, :cond_5

    invoke-virtual {v6}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_4

    goto :goto_3

    :cond_4
    invoke-virtual {v6}, Lm0/q;->Y()V

    move v0, p0

    goto/16 :goto_4

    :cond_5
    :goto_3
    sget-object v1, Lhh/j;->a:Lgh/a;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lgh/a;->d()Lw/G0;

    move-result-object v1

    invoke-static {v1, v0}, Lv/W;->e(Lw/C;I)Lv/c0;

    move-result-object v1

    invoke-static {}, Lgh/a;->d()Lw/G0;

    move-result-object v2

    const v3, -0x1b1080f4

    invoke-virtual {v6, v3}, Lm0/q;->f0(I)V

    invoke-virtual {v6}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v3

    sget-object v4, Lm0/k;->a:Lm0/e;

    if-ne v3, v4, :cond_6

    new-instance v3, Ldg/g;

    const/4 v5, 0x3

    invoke-direct {v3, v5}, Ldg/g;-><init>(I)V

    invoke-virtual {v6, v3}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_6
    check-cast v3, LVm/k;

    const/4 v5, 0x0

    invoke-virtual {v6, v5}, Lm0/q;->q(Z)V

    invoke-static {v3, v2}, Lv/W;->m(LVm/k;Lw/C;)Lv/c0;

    move-result-object v2

    invoke-virtual {v1, v2}, Lv/c0;->a(Lv/c0;)Lv/c0;

    move-result-object v2

    invoke-static {}, Lgh/a;->e()Lw/G0;

    move-result-object v1

    invoke-static {v1, v0}, Lv/W;->f(Lw/C;I)Lv/d0;

    move-result-object v0

    invoke-static {}, Lgh/a;->e()Lw/G0;

    move-result-object v1

    const v3, -0x1b1065d4

    invoke-virtual {v6, v3}, Lm0/q;->f0(I)V

    invoke-virtual {v6}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v4, :cond_7

    new-instance v3, Ldg/g;

    const/4 v4, 0x3

    invoke-direct {v3, v4}, Ldg/g;-><init>(I)V

    invoke-virtual {v6, v3}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_7
    check-cast v3, LVm/k;

    invoke-virtual {v6, v5}, Lm0/q;->q(Z)V

    invoke-static {v3, v1}, Lv/W;->o(LVm/k;Lw/C;)Lv/d0;

    move-result-object v1

    invoke-virtual {v0, v1}, Lv/d0;->a(Lv/d0;)Lv/d0;

    move-result-object v3

    new-instance v0, LBg/I;

    const/16 v1, 0x9

    invoke-direct {v0, p1, v1}, LBg/I;-><init>(Lu0/d;I)V

    const v1, 0x7d792d8c

    invoke-static {v1, v0, v6}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v5

    and-int/lit8 p2, p2, 0xe

    const/high16 v0, 0x30000

    or-int v7, p2, v0

    const/4 v1, 0x0

    const/4 v4, 0x0

    const/16 v8, 0x12

    move v0, p0

    invoke-static/range {v0 .. v8}, Lv/d;->e(ZLA0/r;Lv/c0;Lv/d0;Ljava/lang/String;Lu0/d;Lm0/l;II)V

    :goto_4
    invoke-virtual {v6}, Lm0/q;->u()Lm0/t0;

    move-result-object p0

    if-eqz p0, :cond_8

    new-instance p2, LZh/a;

    invoke-direct {p2, p3, p1, v0}, LZh/a;-><init>(ILu0/d;Z)V

    iput-object p2, p0, Lm0/t0;->d:LVm/n;

    :cond_8
    return-void
.end method

.method public static final u(Ljava/lang/reflect/Type;)Ljava/lang/String;
    .locals 2

    instance-of v0, p0, Ljava/lang/Class;

    if-eqz v0, :cond_1

    move-object v0, p0

    check-cast v0, Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v0, Lbn/I;->a:Lbn/I;

    invoke-static {p0, v0}, Lko/l;->Q(Ljava/lang/Object;LVm/k;)Lko/i;

    move-result-object p0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lko/l;->S(Lko/i;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "[]"

    invoke-static {p0}, Lko/l;->L(Lko/i;)I

    move-result p0

    invoke-static {p0, v1}, Llo/u;->Y(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final v(Ljava/lang/String;I)V
    .locals 1

    const-string v0, "methodName"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0}, Lbn/J;->S(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p1}, Landroid/os/Trace;->beginAsyncSection(Ljava/lang/String;I)V

    return-void
.end method

.method public static final w(Ljava/lang/String;)V
    .locals 1

    const-string v0, "label"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0}, Lbn/J;->S(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    return-void
.end method

.method public static final x([I[IIIIZ)V
    .locals 17

    move/from16 v0, p4

    if-eqz p5, :cond_0

    move/from16 v1, p3

    goto :goto_0

    :cond_0
    move/from16 v1, p2

    :goto_0
    if-eqz p5, :cond_1

    move/from16 v2, p2

    goto :goto_1

    :cond_1
    move/from16 v2, p3

    :goto_1
    const/4 v3, 0x1

    if-eqz p5, :cond_2

    move v4, v3

    goto :goto_2

    :cond_2
    move/from16 v4, p2

    :goto_2
    mul-int/lit8 v5, v0, 0x2

    add-int/2addr v5, v3

    const/4 v6, 0x0

    move v7, v6

    :goto_3
    if-ge v7, v1, :cond_6

    if-eqz p5, :cond_3

    mul-int v8, v7, p2

    goto :goto_4

    :cond_3
    move v8, v7

    :goto_4
    neg-int v9, v0

    move v10, v6

    move v11, v10

    move v12, v11

    move v13, v12

    if-gt v9, v0, :cond_4

    :goto_5
    add-int/lit8 v14, v2, -0x1

    invoke-static {v9, v6, v14}, LP2/H;->C(III)I

    move-result v14

    mul-int/2addr v14, v4

    add-int/2addr v14, v8

    aget v14, p0, v14

    ushr-int/lit8 v15, v14, 0x18

    add-int/2addr v10, v15

    shr-int/lit8 v15, v14, 0x10

    and-int/lit16 v15, v15, 0xff

    add-int/2addr v11, v15

    shr-int/lit8 v15, v14, 0x8

    and-int/lit16 v15, v15, 0xff

    add-int/2addr v12, v15

    and-int/lit16 v14, v14, 0xff

    add-int/2addr v13, v14

    if-eq v9, v0, :cond_4

    add-int/lit8 v9, v9, 0x1

    goto :goto_5

    :cond_4
    move v9, v6

    :goto_6
    if-ge v9, v2, :cond_5

    mul-int v14, v9, v4

    add-int/2addr v14, v8

    div-int v15, v10, v5

    shl-int/lit8 v15, v15, 0x18

    div-int v16, v11, v5

    shl-int/lit8 v16, v16, 0x10

    or-int v15, v15, v16

    div-int v16, v12, v5

    shl-int/lit8 v16, v16, 0x8

    or-int v15, v15, v16

    div-int v16, v13, v5

    or-int v15, v15, v16

    aput v15, p1, v14

    add-int v14, v9, v0

    add-int/2addr v14, v3

    add-int/lit8 v15, v2, -0x1

    invoke-static {v14, v6, v15}, LP2/H;->C(III)I

    move-result v14

    mul-int/2addr v14, v4

    add-int/2addr v14, v8

    aget v14, p0, v14

    sub-int v3, v9, v0

    invoke-static {v3, v6, v15}, LP2/H;->C(III)I

    move-result v3

    mul-int/2addr v3, v4

    add-int/2addr v3, v8

    aget v3, p0, v3

    ushr-int/lit8 v15, v14, 0x18

    ushr-int/lit8 v16, v3, 0x18

    sub-int v15, v15, v16

    add-int/2addr v10, v15

    shr-int/lit8 v15, v14, 0x10

    and-int/lit16 v15, v15, 0xff

    shr-int/lit8 v6, v3, 0x10

    and-int/lit16 v6, v6, 0xff

    sub-int/2addr v15, v6

    add-int/2addr v11, v15

    shr-int/lit8 v6, v14, 0x8

    and-int/lit16 v6, v6, 0xff

    shr-int/lit8 v15, v3, 0x8

    and-int/lit16 v15, v15, 0xff

    sub-int/2addr v6, v15

    add-int/2addr v12, v6

    and-int/lit16 v6, v14, 0xff

    and-int/lit16 v3, v3, 0xff

    sub-int/2addr v6, v3

    add-int/2addr v13, v6

    add-int/lit8 v9, v9, 0x1

    const/4 v3, 0x1

    const/4 v6, 0x0

    goto :goto_6

    :cond_5
    add-int/lit8 v7, v7, 0x1

    const/4 v3, 0x1

    const/4 v6, 0x0

    goto/16 :goto_3

    :cond_6
    return-void
.end method

.method public static final y(Landroid/view/View;LNm/c;)Ljava/lang/Object;
    .locals 12

    instance-of v0, p1, LTg/b;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, LTg/b;

    iget v1, v0, LTg/b;->e:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, LTg/b;->e:I

    goto :goto_0

    :cond_0
    new-instance v0, LTg/b;

    invoke-direct {v0, p1}, LNm/c;-><init>(LLm/c;)V

    :goto_0
    iget-object p1, v0, LTg/b;->d:Ljava/lang/Object;

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, v0, LTg/b;->e:I

    const/16 v3, 0x8

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v2, :cond_3

    if-eq v2, v5, :cond_2

    if-ne v2, v4, :cond_1

    iget-object p0, v0, LTg/b;->a:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto/16 :goto_7

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    iget-object p0, v0, LTg/b;->c:Landroid/graphics/Bitmap;

    iget-object v2, v0, LTg/b;->b:Landroid/view/View;

    iget-object v7, v0, LTg/b;->a:Ljava/lang/Object;

    check-cast v7, Landroid/view/Window;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    move-object v11, v2

    move-object v2, p0

    move-object p0, v11

    goto/16 :goto_5

    :cond_3
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    :goto_1
    if-eqz p1, :cond_5

    instance-of v2, p1, LA1/E;

    if-eqz v2, :cond_4

    check-cast p1, LA1/E;

    invoke-interface {p1}, LA1/E;->getWindow()Landroid/view/Window;

    move-result-object p1

    goto :goto_4

    :cond_4
    invoke-interface {p1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    goto :goto_1

    :cond_5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v2, "getContext(...)"

    invoke-static {p1, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    :goto_2
    instance-of v2, p1, Landroid/app/Activity;

    if-eqz v2, :cond_6

    check-cast p1, Landroid/app/Activity;

    goto :goto_3

    :cond_6
    instance-of v2, p1, Landroid/content/ContextWrapper;

    if-eqz v2, :cond_7

    check-cast p1, Landroid/content/ContextWrapper;

    invoke-virtual {p1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p1

    const-string v2, "getBaseContext(...)"

    invoke-static {p1, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_2

    :cond_7
    move-object p1, v6

    :goto_3
    if-eqz p1, :cond_8

    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    goto :goto_4

    :cond_8
    move-object p1, v6

    :goto_4
    if-nez p1, :cond_9

    goto/16 :goto_8

    :cond_9
    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v2

    if-eqz v2, :cond_11

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v2

    if-nez v2, :cond_a

    goto/16 :goto_8

    :cond_a
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v2

    div-int/2addr v2, v3

    if-ge v2, v5, :cond_b

    move v2, v5

    :cond_b
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v7

    div-int/2addr v7, v3

    if-ge v7, v5, :cond_c

    move v7, v5

    :cond_c
    sget-object v8, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v7, v8}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    const-string v7, "createBitmap(...)"

    invoke-static {v2, v7}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, v0, LTg/b;->a:Ljava/lang/Object;

    iput-object p0, v0, LTg/b;->b:Landroid/view/View;

    iput-object v2, v0, LTg/b;->c:Landroid/graphics/Bitmap;

    iput v5, v0, LTg/b;->e:I

    new-instance v7, Lwo/k;

    invoke-static {v0}, LGk/n;->K(LLm/c;)LLm/c;

    move-result-object v8

    invoke-direct {v7, v5, v8}, Lwo/k;-><init>(ILLm/c;)V

    invoke-virtual {v7}, Lwo/k;->r()V

    new-instance v8, LTg/d;

    invoke-direct {v8, v7}, LTg/d;-><init>(Lwo/k;)V

    new-instance v9, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v10

    invoke-direct {v9, v10}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-static {p1, v2, v8, v9}, Landroid/view/PixelCopy;->request(Landroid/view/Window;Landroid/graphics/Bitmap;Landroid/view/PixelCopy$OnPixelCopyFinishedListener;Landroid/os/Handler;)V

    invoke-virtual {v7}, Lwo/k;->q()Ljava/lang/Object;

    move-result-object p1

    sget-object v7, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    if-ne p1, v1, :cond_d

    goto :goto_6

    :cond_d
    :goto_5
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_e

    goto :goto_8

    :cond_e
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v7, 0x41c00000    # 24.0f

    mul-float/2addr p1, v7

    int-to-float v3, v3

    div-float/2addr p1, v3

    int-to-float v3, v4

    div-float/2addr p1, v3

    invoke-static {p1}, LXm/a;->U(F)I

    move-result p1

    if-ge p1, v5, :cond_f

    move p1, v5

    :cond_f
    sget-object v3, Lwo/M;->a:LEo/f;

    new-instance v7, LTg/c;

    invoke-direct {v7, v2, p1, v6}, LTg/c;-><init>(Landroid/graphics/Bitmap;ILLm/c;)V

    iput-object p0, v0, LTg/b;->a:Ljava/lang/Object;

    iput-object v6, v0, LTg/b;->b:Landroid/view/View;

    iput-object v6, v0, LTg/b;->c:Landroid/graphics/Bitmap;

    iput v4, v0, LTg/b;->e:I

    invoke-static {v3, v7, v0}, Lwo/C;->N(LLm/h;LVm/n;LLm/c;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_10

    :goto_6
    return-object v1

    :cond_10
    :goto_7
    check-cast p1, Landroid/graphics/Bitmap;

    new-array v0, v4, [I

    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    new-instance p0, LTg/a;

    new-instance v1, LH0/f;

    invoke-direct {v1, p1}, LH0/f;-><init>(Landroid/graphics/Bitmap;)V

    const/4 p1, 0x0

    aget p1, v0, p1

    int-to-float p1, p1

    aget v0, v0, v5

    int-to-float v0, v0

    invoke-static {p1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p1

    int-to-long v2, p1

    invoke-static {v0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p1

    int-to-long v4, p1

    const/16 p1, 0x20

    shl-long/2addr v2, p1

    const-wide v6, 0xffffffffL

    and-long/2addr v4, v6

    or-long/2addr v2, v4

    invoke-direct {p0, v1, v2, v3}, LTg/a;-><init>(LH0/f;J)V

    return-object p0

    :cond_11
    :goto_8
    return-object v6
.end method

.method public static final z(Lbn/y;Z)Ljava/lang/reflect/Type;
    .locals 3

    invoke-interface {p0}, Lbn/y;->q()Lbn/e;

    move-result-object v0

    instance-of v1, v0, Lbn/z;

    if-eqz v1, :cond_0

    new-instance p0, Lbn/G;

    check-cast v0, Lbn/z;

    invoke-direct {p0, v0}, Lbn/G;-><init>(Lbn/z;)V

    return-object p0

    :cond_0
    instance-of v1, v0, Lbn/d;

    if-eqz v1, :cond_b

    check-cast v0, Lbn/d;

    if-eqz p1, :cond_1

    invoke-static {v0}, LP2/g;->B(Lbn/d;)Ljava/lang/Class;

    move-result-object p1

    goto :goto_0

    :cond_1
    invoke-static {v0}, LP2/g;->A(Lbn/d;)Ljava/lang/Class;

    move-result-object p1

    :goto_0
    invoke-interface {p0}, Lbn/y;->p()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_3

    :cond_2
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_a

    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_3

    :cond_3
    invoke-static {v0}, LIm/r;->H1(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbn/B;

    if-eqz v0, :cond_9

    const/4 p0, -0x1

    iget-object v1, v0, Lbn/B;->a:Lbn/C;

    if-nez v1, :cond_4

    move v1, p0

    goto :goto_1

    :cond_4
    sget-object v2, Lbn/H;->a:[I

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v1, v2, v1

    :goto_1
    if-eq v1, p0, :cond_8

    const/4 p0, 0x1

    if-eq v1, p0, :cond_8

    const/4 p0, 0x2

    if-eq v1, p0, :cond_6

    const/4 p0, 0x3

    if-ne v1, p0, :cond_5

    goto :goto_2

    :cond_5
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0

    :cond_6
    :goto_2
    iget-object p0, v0, Lbn/B;->b:Len/o0;

    invoke-static {p0}, Lkotlin/jvm/internal/l;->g(Ljava/lang/Object;)V

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lbn/J;->z(Lbn/y;Z)Ljava/lang/reflect/Type;

    move-result-object p0

    instance-of v0, p0, Ljava/lang/Class;

    if-eqz v0, :cond_7

    goto :goto_3

    :cond_7
    new-instance p1, Lbn/a;

    invoke-direct {p1, p0}, Lbn/a;-><init>(Ljava/lang/reflect/Type;)V

    :cond_8
    :goto_3
    return-object p1

    :cond_9
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "kotlin.Array must have exactly one type argument: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_a
    invoke-static {p1, v0}, Lbn/J;->A(Ljava/lang/Class;Ljava/util/List;)Lbn/F;

    move-result-object p0

    return-object p0

    :cond_b
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unsupported type classifier: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
