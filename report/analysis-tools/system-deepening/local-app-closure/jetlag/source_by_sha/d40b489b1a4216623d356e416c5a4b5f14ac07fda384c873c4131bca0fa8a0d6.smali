.class public abstract LP2/r;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static A(Ljava/time/LocalDate;Ljava/time/LocalDate;)Ljava/lang/String;
    .locals 7

    const-string v0, "start"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "end"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/time/LocalDate;->getMonth()Ljava/time/Month;

    move-result-object v0

    sget-object v1, Ljava/time/format/TextStyle;->SHORT:Ljava/time/format/TextStyle;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1, v2}, Ljava/time/Month;->getDisplayName(Ljava/time/format/TextStyle;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "getDisplayName(...)"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v4}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v5, "toUpperCase(...)"

    invoke-static {v0, v5}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/time/LocalDate;->getMonth()Ljava/time/Month;

    move-result-object v6

    invoke-virtual {v6, v1, v2}, Ljava/time/Month;->getDisplayName(Ljava/time/format/TextStyle;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1, v4}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v5}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/time/LocalDate;->getYear()I

    move-result v2

    invoke-virtual {p0}, Ljava/time/LocalDate;->getMonth()Ljava/time/Month;

    move-result-object v3

    invoke-virtual {p1}, Ljava/time/LocalDate;->getMonth()Ljava/time/Month;

    move-result-object v4

    const-string v5, ", "

    const-string v6, " "

    if-ne v3, v4, :cond_0

    invoke-virtual {p0}, Ljava/time/LocalDate;->getYear()I

    move-result v3

    invoke-virtual {p1}, Ljava/time/LocalDate;->getYear()I

    move-result v4

    if-ne v3, v4, :cond_0

    invoke-virtual {p0}, Ljava/time/LocalDate;->getDayOfMonth()I

    move-result p0

    invoke-virtual {p1}, Ljava/time/LocalDate;->getDayOfMonth()I

    move-result p1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, "\u2013"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-static {v2, v5, v1}, Lj/m;->i(ILjava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    invoke-virtual {p0}, Ljava/time/LocalDate;->getDayOfMonth()I

    move-result p0

    invoke-virtual {p1}, Ljava/time/LocalDate;->getDayOfMonth()I

    move-result p1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " \u2013 "

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static B(Ljd/b;LY9/a;Lcom/eightsleep/data_core/enums/DeviceType;)LC8/H;
    .locals 5

    const-string v0, "model"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    invoke-interface {p1}, LY9/a;->getEnabled()Z

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    sget-object v1, Lcom/eightsleep/data_core/enums/DeviceType;->PILLOW:Lcom/eightsleep/data_core/enums/DeviceType;

    if-ne p2, v1, :cond_0

    invoke-interface {p1}, LY9/a;->a()LY9/b;

    move-result-object p1

    invoke-interface {p1}, LY9/b;->f()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, LGa/b;

    goto :goto_0

    :cond_0
    invoke-interface {p1}, LY9/a;->a()LY9/b;

    move-result-object p1

    invoke-interface {p1}, LY9/b;->c()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, LGa/b;

    goto :goto_0

    :cond_1
    move-object p1, v0

    :goto_0
    sget-object p2, LXo/a;->DEBUG:LXo/a;

    sget-object v1, LXo/d;->a:LXo/b;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, LXo/b;->b:LXo/d;

    invoke-interface {v1, p2}, LXo/d;->b(LXo/a;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Ljd/b;->b:Ljd/e;

    if-eqz v2, :cond_2

    iget-object v0, v2, Ljd/e;->b:LGa/b;

    :cond_2
    iget-object v2, p0, Ljd/b;->e:LGa/n;

    iget-object v2, v2, LGa/n;->a:LGa/b;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "override "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " : bedtime "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " : schedule "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "SleepPhaseTempUiModel"

    invoke-interface {v1, p2, v2, v0}, LXo/d;->a(LXo/a;Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    iget-object p2, p0, Ljd/b;->b:Ljd/e;

    if-eqz p2, :cond_5

    iget-object v0, p2, Ljd/e;->b:LGa/b;

    if-nez v0, :cond_4

    goto :goto_1

    :cond_4
    move-object p1, v0

    goto :goto_2

    :cond_5
    :goto_1
    if-nez p1, :cond_6

    iget-object p1, p0, Ljd/b;->e:LGa/n;

    iget-object p1, p1, LGa/n;->a:LGa/b;

    :cond_6
    :goto_2
    if-eqz p2, :cond_7

    iget-object v0, p2, Ljd/e;->c:LGa/b;

    if-nez v0, :cond_8

    :cond_7
    iget-object v0, p0, Ljd/b;->e:LGa/n;

    iget-object v0, v0, LGa/n;->b:LGa/b;

    :cond_8
    if-eqz p2, :cond_9

    iget-object p2, p2, Ljd/e;->d:LGa/b;

    if-nez p2, :cond_a

    :cond_9
    iget-object p0, p0, Ljd/b;->e:LGa/n;

    iget-object p2, p0, LGa/n;->c:LGa/b;

    :cond_a
    new-instance p0, LC8/H;

    invoke-direct {p0, p1, p2, v0}, LC8/H;-><init>(LGa/b;LGa/b;LGa/b;)V

    return-object p0
.end method

.method public static C(Lcom/google/gson/o;)Lz7/N0;
    .locals 7

    const-string v0, "version"

    const-string v1, "name"

    const-string v2, "Unable to parse json into type Os"

    :try_start_0
    invoke-virtual {p0, v1}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/gson/m;->k()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v0}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/gson/m;->k()Ljava/lang/String;

    move-result-object v4

    const-string v5, "build"

    invoke-virtual {p0, v5}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v5

    if-eqz v5, :cond_0

    invoke-virtual {v5}, Lcom/google/gson/m;->k()Ljava/lang/String;

    move-result-object v5

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
    const/4 v5, 0x0

    :goto_0
    const-string v6, "version_major"

    invoke-virtual {p0, v6}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/gson/m;->k()Ljava/lang/String;

    move-result-object p0

    new-instance v6, Lz7/N0;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v4, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "versionMajor"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v6, v3, v4, v5, p0}, Lz7/N0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v6

    :goto_1
    new-instance v0, Lcom/google/gson/JsonParseException;

    invoke-direct {v0, v2, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :goto_2
    new-instance v0, Lcom/google/gson/JsonParseException;

    invoke-direct {v0, v2, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :goto_3
    new-instance v0, Lcom/google/gson/JsonParseException;

    invoke-direct {v0, v2, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static D(Lcom/google/gson/o;)Lz7/d3;
    .locals 5

    const-string v0, "Unable to parse json into type Configuration"

    :try_start_0
    const-string v1, "session_sample_rate"

    invoke-virtual {p0, v1}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/gson/m;->j()Ljava/lang/Number;

    move-result-object v1

    const-string v2, "session_replay_sample_rate"

    invoke-virtual {p0, v2}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/google/gson/m;->j()Ljava/lang/Number;

    move-result-object v2

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
    move-object v2, v3

    :goto_0
    const-string v4, "start_session_replay_recording_manually"

    invoke-virtual {p0, v4}, Lcom/google/gson/o;->r(Ljava/lang/String;)Lcom/google/gson/m;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Lcom/google/gson/m;->c()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    :cond_1
    new-instance p0, Lz7/d3;

    const-string v4, "sessionSampleRate"

    invoke-static {v1, v4}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, v1, v2, v3}, Lz7/d3;-><init>(Ljava/lang/Number;Ljava/lang/Number;Ljava/lang/Boolean;)V
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

.method public static final G(LZn/x;)Ljava/util/List;
    .locals 3

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0}, LP2/r;->O(LZn/x;)Z

    invoke-static {p0}, LP2/r;->v(LZn/x;)I

    move-result v0

    if-nez v0, :cond_0

    sget-object p0, LIm/z;->a:LIm/z;

    return-object p0

    :cond_0
    invoke-virtual {p0}, LZn/x;->d0()Ljava/util/List;

    move-result-object p0

    const/4 v1, 0x0

    invoke-interface {p0, v1, v0}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p0

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p0, v1}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, LZn/Q;

    invoke-virtual {v1}, LZn/Q;->b()LZn/x;

    move-result-object v1

    const-string v2, "it.type"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public static final H(Lkn/i;)Lin/g;
    .locals 3

    instance-of v0, p0, Lkn/f;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p0}, Lhn/h;->H(Lkn/i;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-static {p0}, LPn/e;->h(Lkn/l;)LIn/e;

    move-result-object p0

    invoke-virtual {p0}, LIn/e;->d()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, LIn/e;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    sget-object v0, Lin/g;->Companion:Lin/f;

    invoke-virtual {p0}, LIn/e;->f()LIn/g;

    move-result-object v1

    invoke-virtual {v1}, LIn/g;->b()Ljava/lang/String;

    move-result-object v1

    const-string v2, "shortName().asString()"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, LIn/e;->g()LIn/c;

    move-result-object p0

    invoke-virtual {p0}, LIn/c;->e()LIn/c;

    move-result-object p0

    const-string v2, "toSafe().parent()"

    invoke-static {p0, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1, p0}, Lin/f;->a(Ljava/lang/String;LIn/c;)Lin/e;

    move-result-object p0

    if-eqz p0, :cond_3

    iget-object p0, p0, Lin/e;->a:Lin/g;

    return-object p0

    :cond_3
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static final I(LPo/a;)LPo/a;
    .locals 1

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p0}, LPo/a;->getDescriptor()LRo/g;

    move-result-object v0

    invoke-interface {v0}, LRo/g;->c()Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p0

    :cond_0
    new-instance v0, LTo/Y;

    invoke-direct {v0, p0}, LTo/Y;-><init>(LPo/a;)V

    return-object v0
.end method

.method public static final J(LZn/x;)LZn/x;
    .locals 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0}, LP2/r;->O(LZn/x;)Z

    invoke-virtual {p0}, LZn/x;->getAnnotations()Lln/h;

    move-result-object v0

    sget-object v1, Lhn/n;->p:LIn/c;

    invoke-interface {v0, v1}, Lln/h;->P(LIn/c;)Lln/b;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {p0}, LP2/r;->v(LZn/x;)I

    move-result v0

    invoke-virtual {p0}, LZn/x;->d0()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, LZn/Q;

    invoke-virtual {p0}, LZn/Q;->b()LZn/x;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static final K(LZn/x;)Ljava/util/List;
    .locals 4

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0}, LP2/r;->O(LZn/x;)Z

    invoke-virtual {p0}, LZn/x;->d0()Ljava/util/List;

    move-result-object v0

    invoke-static {p0}, LP2/r;->v(LZn/x;)I

    move-result v1

    invoke-static {p0}, LP2/r;->O(LZn/x;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    invoke-virtual {p0}, LZn/x;->getAnnotations()Lln/h;

    move-result-object p0

    sget-object v2, Lhn/n;->p:LIn/c;

    invoke-interface {p0, v2}, Lln/h;->P(LIn/c;)Lln/b;

    move-result-object p0

    if-eqz p0, :cond_0

    move p0, v3

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    add-int/2addr p0, v1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    sub-int/2addr v1, v3

    invoke-interface {v0, p0, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static final L(Lk1/h;)Z
    .locals 6

    iget-object v0, p0, Lk1/h;->b:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    iget-object p0, p0, Lk1/h;->a:Ljava/util/List;

    if-eqz p0, :cond_1

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v2

    move v3, v1

    :goto_0
    if-ge v3, v2, :cond_1

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lk1/f;

    iget-object v5, v4, Lk1/f;->a:Ljava/lang/Object;

    instance-of v5, v5, Lk1/o;

    if-eqz v5, :cond_0

    iget v5, v4, Lk1/f;->b:I

    iget v4, v4, Lk1/f;->c:I

    invoke-static {v1, v0, v5, v4}, Lk1/i;->b(IIII)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method public static final M(II)I
    .locals 0

    shr-int/2addr p0, p1

    and-int/lit8 p0, p0, 0x1f

    return p0
.end method

.method public static N(Lkc/d;Llc/d;LLm/c;)Ljava/lang/Object;
    .locals 5

    instance-of v0, p2, Lkc/a;

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, Lkc/a;

    iget v1, v0, Lkc/a;->d:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lkc/a;->d:I

    goto :goto_0

    :cond_0
    new-instance v0, Lkc/a;

    invoke-direct {v0, p2}, LNm/c;-><init>(LLm/c;)V

    :goto_0
    iget-object p2, v0, Lkc/a;->c:Ljava/lang/Object;

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, v0, Lkc/a;->d:I

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz v2, :cond_3

    if-eq v2, v4, :cond_2

    if-ne v2, v3, :cond_1

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_3

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    iget-object p1, v0, Lkc/a;->b:Llc/d;

    iget-object p0, v0, Lkc/a;->a:Lkc/d;

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_1

    :cond_3
    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p2, p1, Llc/d;->a:Llc/a;

    iput-object p0, v0, Lkc/a;->a:Lkc/d;

    iput-object p1, v0, Lkc/a;->b:Llc/d;

    iput v4, v0, Lkc/a;->d:I

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Laa/e;

    const/16 v4, 0xf

    invoke-direct {v2, v4, p0, p2}, Laa/e;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    iget-object p2, p0, Lkc/d;->a:Ljava/lang/Object;

    check-cast p2, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-static {p2, v2, v0}, LP2/A;->K(LE4/t;Ljava/util/concurrent/Callable;LLm/c;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_4

    goto :goto_2

    :cond_4
    :goto_1
    iget-object p1, p1, Llc/d;->b:Ljava/util/ArrayList;

    const/4 p2, 0x0

    iput-object p2, v0, Lkc/a;->a:Lkc/d;

    iput-object p2, v0, Lkc/a;->b:Llc/d;

    iput v3, v0, Lkc/a;->d:I

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p2, Lkc/b;

    const/4 v2, 0x0

    invoke-direct {p2, p0, p1, v2}, Lkc/b;-><init>(Lkc/d;Ljava/util/ArrayList;I)V

    iget-object p0, p0, Lkc/d;->a:Ljava/lang/Object;

    check-cast p0, Lcom/eightsleep/eight/AppDatabase_Impl;

    invoke-static {p0, p2, v0}, LP2/A;->K(LE4/t;Ljava/util/concurrent/Callable;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_5

    :goto_2
    return-object v1

    :cond_5
    :goto_3
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0
.end method

.method public static final O(LZn/x;)Z
    .locals 1

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, LZn/x;->o0()LZn/N;

    move-result-object p0

    invoke-interface {p0}, LZn/N;->j()Lkn/i;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-static {p0}, LP2/r;->H(Lkn/i;)Lin/g;

    move-result-object p0

    sget-object v0, Lin/g;->Function:Lin/g;

    if-eq p0, v0, :cond_0

    sget-object v0, Lin/g;->SuspendFunction:Lin/g;

    if-ne p0, v0, :cond_1

    :cond_0
    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public static final P(LZn/x;)Z
    .locals 1

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, LZn/x;->o0()LZn/N;

    move-result-object p0

    invoke-interface {p0}, LZn/N;->j()Lkn/i;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-static {p0}, LP2/r;->H(Lkn/i;)Lin/g;

    move-result-object p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    sget-object v0, Lin/g;->SuspendFunction:Lin/g;

    if-ne p0, v0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public static final Q(LDn/z;)Lkn/c;
    .locals 1

    if-nez p0, :cond_0

    const/4 p0, -0x1

    goto :goto_0

    :cond_0
    sget-object v0, LVn/x;->a:[I

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    aget p0, v0, p0

    :goto_0
    const/4 v0, 0x1

    if-eq p0, v0, :cond_4

    const/4 v0, 0x2

    if-eq p0, v0, :cond_3

    const/4 v0, 0x3

    if-eq p0, v0, :cond_2

    const/4 v0, 0x4

    if-eq p0, v0, :cond_1

    sget-object p0, Lkn/c;->DECLARATION:Lkn/c;

    return-object p0

    :cond_1
    sget-object p0, Lkn/c;->SYNTHESIZED:Lkn/c;

    return-object p0

    :cond_2
    sget-object p0, Lkn/c;->DELEGATION:Lkn/c;

    return-object p0

    :cond_3
    sget-object p0, Lkn/c;->FAKE_OVERRIDE:Lkn/c;

    return-object p0

    :cond_4
    sget-object p0, Lkn/c;->DECLARATION:Lkn/c;

    return-object p0
.end method

.method public static final T(LCo/p;LCo/p;LVm/n;)Ljava/lang/Object;
    .locals 1

    const/4 v0, 0x2

    :try_start_0
    invoke-static {v0, p2}, Lkotlin/jvm/internal/E;->e(ILjava/lang/Object;)V

    invoke-interface {p2, p1, p0}, LVm/n;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    new-instance p2, Lwo/t;

    const/4 v0, 0x0

    invoke-direct {p2, v0, p1}, Lwo/t;-><init>(ZLjava/lang/Throwable;)V

    move-object p1, p2

    :goto_0
    sget-object p2, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    if-ne p1, p2, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p0, p1}, Lwo/q0;->T(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lwo/C;->e:LCo/s;

    if-ne p0, p1, :cond_1

    goto :goto_1

    :cond_1
    instance-of p1, p0, Lwo/t;

    if-nez p1, :cond_2

    invoke-static {p0}, Lwo/C;->L(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    :goto_1
    return-object p2

    :cond_2
    check-cast p0, Lwo/t;

    iget-object p0, p0, Lwo/t;->a:Ljava/lang/Throwable;

    throw p0
.end method

.method public static U(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    const-string v0, "input"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, " "

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x6

    invoke-static {p0, v0, v1}, Llo/n;->B0(Ljava/lang/CharSequence;[Ljava/lang/String;I)Ljava/util/List;

    move-result-object p0

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p0, v1}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    const-string v3, "getDefault(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "toLowerCase(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v5

    invoke-static {v5, v3}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v4, v5}, Lkj/e;->d0(CLjava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const-string v3, "substring(...)"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_0
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v1, " "

    const/4 v2, 0x0

    const/16 v5, 0x3e

    invoke-static/range {v0 .. v5}, LIm/r;->i1(Ljava/lang/Iterable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;LVm/k;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final a(LA0/r;Lcom/eightsleep/presentation_home/viewmodel/BedtimeScheduleViewModel;LVm/k;LVm/k;Lm0/l;I)V
    .locals 12

    const-string v0, "modifier"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "viewModel"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onOneTimeEvent"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onNavEvent"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v9, p4

    check-cast v9, Lm0/q;

    const v0, -0x2b32fdb3

    invoke-virtual {v9, v0}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v9, p0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int v0, p5, v0

    invoke-virtual {v9, p1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x20

    goto :goto_1

    :cond_1
    const/16 v1, 0x10

    :goto_1
    or-int/2addr v0, v1

    invoke-virtual {v9, p2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x100

    goto :goto_2

    :cond_2
    const/16 v1, 0x80

    :goto_2
    or-int/2addr v0, v1

    invoke-virtual {v9, p3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/16 v1, 0x800

    goto :goto_3

    :cond_3
    const/16 v1, 0x400

    :goto_3
    or-int/2addr v0, v1

    and-int/lit16 v1, v0, 0x493

    const/16 v4, 0x492

    if-ne v1, v4, :cond_5

    invoke-virtual {v9}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_4

    goto :goto_4

    :cond_4
    invoke-virtual {v9}, Lm0/q;->Y()V

    goto :goto_5

    :cond_5
    :goto_4
    new-instance v1, LKf/i;

    const/16 v4, 0x16

    invoke-direct {v1, p0, v4}, LKf/i;-><init>(LA0/r;I)V

    const v4, -0x189252b3

    invoke-static {v4, v1, v9}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v8

    and-int/lit8 v1, v0, 0x70

    const/high16 v4, 0x6c00000

    or-int/2addr v1, v4

    and-int/lit16 v4, v0, 0x380

    or-int/2addr v1, v4

    and-int/lit16 v0, v0, 0x1c00

    or-int v10, v1, v0

    const/4 v6, 0x0

    const-string v7, "bedtime_audio_settings"

    const/4 v0, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v11, 0x71

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v11}, LP2/o;->g(LA0/r;LL8/e;LVm/k;LVm/k;ZZLH0/w;Ljava/lang/String;LVm/r;Lm0/l;II)V

    :goto_5
    invoke-virtual {v9}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_6

    new-instance v0, LLf/a;

    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move/from16 v5, p5

    invoke-direct/range {v0 .. v6}, LLf/a;-><init>(LA0/r;Lcom/eightsleep/presentation_home/viewmodel/BedtimeScheduleViewModel;LVm/k;LVm/k;II)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_6
    return-void
.end method

.method public static final b(Ljava/lang/String;Ljava/util/Set;LA0/r;Lm0/l;I)V
    .locals 7

    move-object v4, p3

    check-cast v4, Lm0/q;

    const p3, 0x13299d22

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

    invoke-virtual {v4, p2}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/16 v0, 0x100

    goto :goto_3

    :cond_4
    const/16 v0, 0x80

    :goto_3
    or-int/2addr p3, v0

    :cond_5
    and-int/lit16 v0, p3, 0x93

    const/16 v1, 0x92

    if-ne v0, v1, :cond_7

    invoke-virtual {v4}, Lm0/q;->H()Z

    move-result v0

    if-nez v0, :cond_6

    goto :goto_4

    :cond_6
    invoke-virtual {v4}, Lm0/q;->Y()V

    move-object v0, p2

    goto :goto_5

    :cond_7
    :goto_4
    sget-object v0, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->b:Lm0/c1;

    invoke-virtual {v4, v0}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    new-instance v1, Lqg/u;

    const/4 v2, 0x6

    invoke-direct {v1, p0, p1, v0, v2}, Lqg/u;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    const v0, -0x2407d808

    invoke-static {v0, v1, v4}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v3

    shr-int/lit8 p3, p3, 0x6

    and-int/lit8 p3, p3, 0xe

    or-int/lit16 v5, p3, 0xc00

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v6, 0x6

    move-object v0, p2

    invoke-static/range {v0 .. v6}, LG/e;->a(LA0/r;LA0/e;ZLu0/d;Lm0/l;II)V

    :goto_5
    invoke-virtual {v4}, Lm0/q;->u()Lm0/t0;

    move-result-object p2

    if-eqz p2, :cond_8

    new-instance p3, Lj0/f0;

    invoke-direct {p3, p0, p1, v0, p4}, Lj0/f0;-><init>(Ljava/lang/String;Ljava/util/Set;LA0/r;I)V

    iput-object p3, p2, Lm0/t0;->d:LVm/n;

    :cond_8
    return-void
.end method

.method public static final c(LVm/a;Lm0/l;I)V
    .locals 15

    move/from16 v14, p2

    const-string v0, "onDismiss"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v11, p1

    check-cast v11, Lm0/q;

    const v0, 0x56dd0235

    invoke-virtual {v11, v0}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v11, p0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x2

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    or-int/2addr v0, v14

    and-int/lit8 v2, v0, 0x3

    if-ne v2, v1, :cond_2

    invoke-virtual {v11}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v11}, Lm0/q;->Y()V

    goto :goto_3

    :cond_2
    :goto_1
    const v1, 0x70b323c8

    invoke-virtual {v11, v1}, Lm0/q;->g0(I)V

    invoke-static {v11}, Lh3/a;->a(Lm0/l;)Landroidx/lifecycle/i0;

    move-result-object v8

    if-eqz v8, :cond_5

    const/4 v1, 0x0

    invoke-static {v8, v11, v1}, Landroidx/hilt/navigation/compose/HiltViewModelKt;->createHiltViewModelFactory(Landroidx/lifecycle/i0;Lm0/l;I)Landroidx/lifecycle/d0;

    move-result-object v10

    const v2, 0x671a9c9b

    invoke-virtual {v11, v2}, Lm0/q;->g0(I)V

    instance-of v2, v8, Landroidx/lifecycle/j;

    if-eqz v2, :cond_3

    move-object v2, v8

    check-cast v2, Landroidx/lifecycle/j;

    invoke-interface {v2}, Landroidx/lifecycle/j;->getDefaultViewModelCreationExtras()Lg3/c;

    move-result-object v2

    goto :goto_2

    :cond_3
    sget-object v2, Lg3/a;->b:Lg3/a;

    :goto_2
    const-class v7, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeCustomizationViewModel;

    const/4 v9, 0x0

    move-object v12, v11

    move-object v11, v2

    invoke-static/range {v7 .. v12}, LP2/c;->O(Ljava/lang/Class;Landroidx/lifecycle/i0;Ljava/lang/String;Landroidx/lifecycle/d0;Lg3/c;Lm0/l;)Landroidx/lifecycle/b0;

    move-result-object v2

    move-object v11, v12

    invoke-virtual {v11, v1}, Lm0/q;->q(Z)V

    invoke-virtual {v11, v1}, Lm0/q;->q(Z)V

    check-cast v2, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeCustomizationViewModel;

    sget-object v3, Le3/e;->a:Lm0/r0;

    invoke-virtual {v11, v3}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/lifecycle/v;

    invoke-interface {v3}, Landroidx/lifecycle/v;->getLifecycle()Landroidx/lifecycle/q;

    move-result-object v3

    invoke-static {v2, v3, v11, v1}, La7/d;->j(LL8/e;Landroidx/lifecycle/q;Lm0/l;I)V

    sget-object v5, LNf/c;->a:Lu0/d;

    new-instance v1, LBe/g;

    const/16 v3, 0x8

    invoke-direct {v1, v3, v2, p0}, LBe/g;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    const v2, 0x3bf4a5a2

    invoke-static {v2, v1, v11}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v10

    shl-int/lit8 v0, v0, 0xc

    const v1, 0xe000

    and-int/2addr v0, v1

    const v1, 0x6000c00

    or-int v12, v0, v1

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v0, 0x0

    const-wide/16 v1, 0x0

    const-wide/16 v3, 0x0

    const/4 v7, 0x0

    const/16 v13, 0xe7

    move-object v6, p0

    invoke-static/range {v0 .. v13}, LP2/e;->m(Lj0/w2;JJLu0/d;LVm/a;ZZLVm/n;Lu0/d;Lm0/l;II)V

    :goto_3
    invoke-virtual {v11}, Lm0/q;->u()Lm0/t0;

    move-result-object v0

    if-eqz v0, :cond_4

    new-instance v1, LFi/c;

    const/4 v2, 0x2

    invoke-direct {v1, v14, v2, p0}, LFi/c;-><init>(IILVm/a;)V

    iput-object v1, v0, Lm0/t0;->d:LVm/n;

    :cond_4
    return-void

    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No ViewModelStoreOwner was provided via LocalViewModelStoreOwner"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static final d(LVm/a;LVm/k;LVm/a;Lm0/l;I)V
    .locals 31

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v6, p2

    move/from16 v11, p4

    const-string v0, "model"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onUiAction"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onDismiss"

    invoke-static {v6, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v12, p3

    check-cast v12, Lm0/q;

    const v0, -0x64e7dfb

    invoke-virtual {v12, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, v11, 0x6

    if-nez v0, :cond_1

    invoke-virtual {v12, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int/2addr v0, v11

    goto :goto_1

    :cond_1
    move v0, v11

    :goto_1
    and-int/lit8 v4, v11, 0x30

    if-nez v4, :cond_3

    invoke-virtual {v12, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    const/16 v4, 0x20

    goto :goto_2

    :cond_2
    const/16 v4, 0x10

    :goto_2
    or-int/2addr v0, v4

    :cond_3
    and-int/lit16 v4, v11, 0x180

    if-nez v4, :cond_5

    invoke-virtual {v12, v6}, Lm0/q;->i(Ljava/lang/Object;)Z

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

    const/16 v7, 0x92

    if-ne v4, v7, :cond_7

    invoke-virtual {v12}, Lm0/q;->H()Z

    move-result v4

    if-nez v4, :cond_6

    goto :goto_4

    :cond_6
    invoke-virtual {v12}, Lm0/q;->Y()V

    goto/16 :goto_10

    :cond_7
    :goto_4
    const/4 v7, 0x0

    const/4 v4, 0x3

    invoke-static {v7, v4, v12}, LJ/B;->a(IILm0/l;)LJ/z;

    move-result-object v8

    invoke-interface {v1}, LVm/a;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, LFf/t;

    iget-object v4, v4, LFf/t;->b:LFf/L0;

    iget-object v4, v4, LFf/L0;->c:LGf/e;

    iget-object v4, v4, LGf/e;->a:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    const/4 v9, 0x1

    xor-int/2addr v4, v9

    const v10, 0x2559abd6

    invoke-virtual {v12, v10}, Lm0/q;->f0(I)V

    invoke-virtual {v12, v4}, Lm0/q;->h(Z)Z

    move-result v4

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v10

    sget-object v13, Lm0/k;->a:Lm0/e;

    const/16 v14, 0xa

    if-nez v4, :cond_9

    if-ne v10, v13, :cond_8

    goto :goto_5

    :cond_8
    move/from16 p3, v9

    goto :goto_8

    :cond_9
    :goto_5
    invoke-interface {v1}, LVm/a;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, LFf/t;

    iget-object v4, v4, LFf/t;->b:LFf/L0;

    iget-object v4, v4, LFf/L0;->c:LGf/e;

    iget-object v4, v4, LGf/e;->a:Ljava/util/List;

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_6
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_b

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    move/from16 p3, v9

    move-object v9, v15

    check-cast v9, LGf/f;

    invoke-interface {v1}, LVm/a;->invoke()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v3, v16

    check-cast v3, LFf/t;

    iget-object v3, v3, LFf/t;->b:LFf/L0;

    iget-object v3, v3, LFf/L0;->b:Ljava/util/List;

    iget-object v9, v9, LGf/f;->a:Lyd/b;

    invoke-interface {v3, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    invoke-virtual {v10, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_a
    move/from16 v9, p3

    goto :goto_6

    :cond_b
    move/from16 p3, v9

    new-instance v3, LNf/l;

    const/4 v4, 0x1

    invoke-direct {v3, v4, v1}, LNf/l;-><init>(ILVm/a;)V

    invoke-static {v10, v3}, LIm/r;->J1(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v3

    new-instance v4, Ljava/util/ArrayList;

    invoke-static {v3, v14}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v9

    invoke-direct {v4, v9}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_7
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, LGf/f;

    iget-object v9, v9, LGf/f;->a:Lyd/b;

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7

    :cond_c
    invoke-static {v4}, Lm0/r;->C(Ljava/lang/Object;)Lm0/i0;

    move-result-object v10

    invoke-virtual {v12, v10}, Lm0/q;->q0(Ljava/lang/Object;)V

    :goto_8
    move-object v3, v10

    check-cast v3, Lm0/Z;

    invoke-virtual {v12, v7}, Lm0/q;->q(Z)V

    invoke-interface {v1}, LVm/a;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, LFf/t;

    iget-object v4, v4, LFf/t;->b:LFf/L0;

    iget-object v4, v4, LFf/L0;->c:LGf/e;

    iget-object v4, v4, LGf/e;->a:Ljava/util/List;

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_d
    :goto_9
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_e

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    move-object v15, v10

    check-cast v15, LGf/f;

    invoke-interface {v3}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v5, v16

    check-cast v5, Ljava/util/List;

    iget-object v15, v15, LGf/f;->a:Lyd/b;

    invoke-interface {v5, v15}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_9

    :cond_e
    new-instance v4, LNf/e;

    const/4 v5, 0x0

    invoke-direct {v4, v3, v5}, LNf/e;-><init>(Lm0/Z;I)V

    invoke-static {v9, v4}, LIm/r;->J1(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v9

    invoke-interface {v1}, LVm/a;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, LFf/t;

    iget-object v4, v4, LFf/t;->b:LFf/L0;

    iget-object v4, v4, LFf/L0;->c:LGf/e;

    iget-object v4, v4, LGf/e;->a:Ljava/util/List;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_a
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_10

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    move-object v15, v10

    check-cast v15, LGf/f;

    invoke-interface {v3}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v7, v16

    check-cast v7, Ljava/util/List;

    iget-object v15, v15, LGf/f;->a:Lyd/b;

    invoke-interface {v7, v15}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_f

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_f
    const/4 v7, 0x0

    goto :goto_a

    :cond_10
    new-instance v4, LNf/f;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    invoke-static {v5, v4}, LIm/r;->J1(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v1}, LVm/a;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, LFf/t;

    iget-object v4, v4, LFf/t;->c:LFf/H;

    iget-object v4, v4, LFf/H;->c:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    xor-int/lit8 v4, v4, 0x1

    const v5, 0x255a0a39

    invoke-virtual {v12, v5}, Lm0/q;->f0(I)V

    invoke-virtual {v12, v4}, Lm0/q;->h(Z)Z

    move-result v4

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v5

    if-nez v4, :cond_11

    if-ne v5, v13, :cond_15

    :cond_11
    invoke-interface {v1}, LVm/a;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, LFf/t;

    iget-object v4, v4, LFf/t;->c:LFf/H;

    iget-object v4, v4, LFf/H;->c:Ljava/util/List;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_b
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_13

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    move-object v15, v10

    check-cast v15, LFf/G;

    invoke-interface {v1}, LVm/a;->invoke()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v14, v16

    check-cast v14, LFf/t;

    iget-object v14, v14, LFf/t;->c:LFf/H;

    iget-object v14, v14, LFf/H;->b:Ljava/util/List;

    invoke-interface {v15}, LFf/G;->a()Lyd/a;

    move-result-object v15

    invoke-interface {v14, v15}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_12

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_12
    const/16 v14, 0xa

    goto :goto_b

    :cond_13
    new-instance v4, LNf/l;

    const/4 v10, 0x0

    invoke-direct {v4, v10, v1}, LNf/l;-><init>(ILVm/a;)V

    invoke-static {v5, v4}, LIm/r;->J1(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v4

    new-instance v5, Ljava/util/ArrayList;

    const/16 v10, 0xa

    invoke-static {v4, v10}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v10

    invoke-direct {v5, v10}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_c
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_14

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, LFf/G;

    invoke-interface {v10}, LFf/G;->a()Lyd/a;

    move-result-object v10

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_c

    :cond_14
    invoke-static {v5}, Lm0/r;->C(Ljava/lang/Object;)Lm0/i0;

    move-result-object v5

    invoke-virtual {v12, v5}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_15
    move-object v4, v5

    check-cast v4, Lm0/Z;

    const/4 v5, 0x0

    invoke-virtual {v12, v5}, Lm0/q;->q(Z)V

    invoke-interface {v1}, LVm/a;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, LFf/t;

    iget-object v5, v5, LFf/t;->c:LFf/H;

    iget-object v5, v5, LFf/H;->c:Ljava/util/List;

    new-instance v10, LNf/e;

    const/4 v14, 0x1

    invoke-direct {v10, v4, v14}, LNf/e;-><init>(Lm0/Z;I)V

    invoke-static {v5, v10}, LIm/r;->J1(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v10

    sget-object v14, Lar/O;->INSERT:Lar/O;

    const v5, 0x255a5d69

    invoke-virtual {v12, v5}, Lm0/q;->f0(I)V

    invoke-virtual {v12, v3}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v5

    and-int/lit8 v15, v0, 0x70

    move/from16 v16, v0

    const/16 v0, 0x20

    if-ne v15, v0, :cond_16

    move/from16 v0, p3

    goto :goto_d

    :cond_16
    const/4 v0, 0x0

    :goto_d
    or-int/2addr v0, v5

    invoke-virtual {v12, v4}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v5

    or-int/2addr v0, v5

    and-int/lit8 v5, v16, 0xe

    const/4 v15, 0x4

    if-ne v5, v15, :cond_17

    move/from16 v5, p3

    goto :goto_e

    :cond_17
    const/4 v5, 0x0

    :goto_e
    or-int/2addr v0, v5

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v5

    if-nez v0, :cond_18

    if-ne v5, v13, :cond_19

    :cond_18
    new-instance v0, LNf/m;

    const/4 v5, 0x0

    move-object/from16 v30, v2

    move-object v2, v1

    move-object/from16 v1, v30

    invoke-direct/range {v0 .. v5}, LNf/m;-><init>(LVm/k;LVm/a;Lm0/Z;Lm0/Z;LLm/c;)V

    invoke-virtual {v12, v0}, Lm0/q;->q0(Ljava/lang/Object;)V

    move-object v5, v0

    :cond_19
    check-cast v5, LVm/p;

    const/4 v0, 0x0

    invoke-virtual {v12, v0}, Lm0/q;->q(Z)V

    const-string v1, "lazyGridState"

    invoke-static {v8, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "onMove"

    invoke-static {v5, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const v1, 0x48116013

    invoke-virtual {v12, v1}, Lm0/q;->f0(I)V

    int-to-float v1, v0

    new-instance v0, LG/N0;

    invoke-direct {v0, v1, v1, v1, v1}, LG/N0;-><init>(FFFF)V

    sget v2, Lar/s;->a:F

    const v15, -0x4a53aaa6

    invoke-virtual {v12, v15}, Lm0/q;->f0(I)V

    invoke-virtual {v12, v8}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v15

    move-object/from16 p3, v3

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v3

    if-nez v15, :cond_1a

    if-ne v3, v13, :cond_1b

    :cond_1a
    new-instance v3, LSn/s;

    const/16 v15, 0x12

    invoke-direct {v3, v8, v15}, LSn/s;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v12, v3}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_1b
    check-cast v3, LVm/a;

    const/4 v15, 0x0

    invoke-virtual {v12, v15}, Lm0/q;->q(Z)V

    const-string v15, "pixelAmountProvider"

    invoke-static {v3, v15}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const v15, 0x3b679380

    invoke-virtual {v12, v15}, Lm0/q;->f0(I)V

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v15

    if-ne v15, v13, :cond_1c

    invoke-static {v12}, Lm0/r;->q(Lm0/l;)Lwo/z;

    move-result-object v15

    move-object/from16 v16, v4

    new-instance v4, Lm0/A;

    invoke-direct {v4, v15}, Lm0/A;-><init>(Lwo/z;)V

    invoke-virtual {v12, v4}, Lm0/q;->q0(Ljava/lang/Object;)V

    move-object v15, v4

    goto :goto_f

    :cond_1c
    move-object/from16 v16, v4

    :goto_f
    check-cast v15, Lm0/A;

    iget-object v4, v15, Lm0/A;->a:Lwo/z;

    invoke-static {v3, v12}, Lm0/r;->I(Ljava/lang/Object;Lm0/l;)Lm0/Z;

    move-result-object v3

    move-object v15, v7

    const-wide/16 v17, 0x64

    invoke-static/range {v17 .. v18}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-static {v6, v12}, Lm0/r;->I(Ljava/lang/Object;Lm0/l;)Lm0/Z;

    move-result-object v6

    const v7, 0x6e6c34f1

    invoke-virtual {v12, v7}, Lm0/q;->f0(I)V

    invoke-virtual {v12, v8}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v7

    invoke-virtual {v12, v4}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v19

    or-int v7, v7, v19

    move-object/from16 v28, v9

    move-object/from16 v29, v10

    move-wide/from16 v9, v17

    invoke-virtual {v12, v9, v10}, Lm0/q;->f(J)Z

    move-result v9

    or-int/2addr v7, v9

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v9

    if-nez v7, :cond_1d

    if-ne v9, v13, :cond_1e

    :cond_1d
    new-instance v9, Lar/Z;

    new-instance v7, LA6/c;

    const/16 v10, 0x12

    invoke-direct {v7, v10, v3, v6}, LA6/c;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {v9, v8, v4, v7}, Lar/Z;-><init>(LJ/z;Lwo/z;LA6/c;)V

    invoke-virtual {v12, v9}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_1e
    check-cast v9, Lar/Z;

    const/4 v3, 0x0

    invoke-virtual {v12, v3}, Lm0/q;->q(Z)V

    invoke-virtual {v12, v3}, Lm0/q;->q(Z)V

    sget-object v3, La1/k0;->h:Lm0/c1;

    invoke-virtual {v12, v3}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lw1/c;

    invoke-interface {v3, v2}, Lw1/c;->Z(F)F

    move-result v23

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v4

    if-ne v4, v13, :cond_1f

    invoke-static {v12}, Lm0/r;->q(Lm0/l;)Lwo/z;

    move-result-object v4

    new-instance v6, Lm0/A;

    invoke-direct {v6, v4}, Lm0/A;-><init>(Lwo/z;)V

    invoke-virtual {v12, v6}, Lm0/q;->q0(Ljava/lang/Object;)V

    move-object v4, v6

    :cond_1f
    check-cast v4, Lm0/A;

    iget-object v4, v4, Lm0/A;->a:Lwo/z;

    invoke-static {v5, v12}, Lm0/r;->I(Ljava/lang/Object;Lm0/l;)Lm0/Z;

    move-result-object v22

    sget-object v5, La1/k0;->n:Lm0/c1;

    invoke-virtual {v12, v5}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lw1/m;

    invoke-static {v0, v5}, LG/e;->p(LG/J0;Lw1/m;)F

    move-result v6

    invoke-interface {v3, v6}, Lw1/c;->Z(F)F

    move-result v6

    invoke-static {v0, v5}, LG/e;->o(LG/J0;Lw1/m;)F

    move-result v7

    invoke-interface {v3, v7}, Lw1/c;->Z(F)F

    move-result v7

    invoke-interface {v3, v1}, Lw1/c;->Z(F)F

    move-result v10

    invoke-interface {v3, v1}, Lw1/c;->Z(F)F

    move-result v1

    new-instance v3, Lar/a;

    invoke-direct {v3, v6, v7, v10, v1}, Lar/a;-><init>(FFFF)V

    const v1, -0x4a532924

    invoke-virtual {v12, v1}, Lm0/q;->f0(I)V

    invoke-virtual {v12, v4}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v12, v8}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v6

    or-int/2addr v1, v6

    invoke-virtual {v12, v2}, Lm0/q;->d(F)Z

    move-result v2

    or-int/2addr v1, v2

    invoke-virtual {v12, v0}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    or-int/2addr v0, v1

    invoke-virtual {v12, v9}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v1

    or-int/2addr v0, v1

    invoke-virtual {v12}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v1

    if-nez v0, :cond_20

    if-ne v1, v13, :cond_21

    :cond_20
    new-instance v19, Lar/M;

    const-string v0, "scroller"

    invoke-static {v9, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "scrollMoveMode"

    invoke-static {v14, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "layoutDirection"

    invoke-static {v5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, LJ/v;

    invoke-direct {v0, v8}, LJ/v;-><init>(LJ/z;)V

    move-object/from16 v20, v0

    move-object/from16 v24, v3

    move-object/from16 v21, v4

    move-object/from16 v27, v5

    move-object/from16 v25, v9

    move-object/from16 v26, v14

    invoke-direct/range {v19 .. v27}, Lar/M;-><init>(LJ/v;Lwo/z;Lm0/Z;FLar/a;Lar/Z;Lar/O;Lw1/m;)V

    move-object/from16 v1, v19

    invoke-virtual {v12, v1}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_21
    move-object v6, v1

    check-cast v6, Lar/M;

    const/4 v0, 0x0

    invoke-virtual {v12, v0}, Lm0/q;->q(Z)V

    invoke-virtual {v12, v0}, Lm0/q;->q(Z)V

    new-instance v0, LNf/k;

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move-object/from16 v2, p2

    move-object/from16 v7, p3

    move-object v1, v8

    move-object v8, v15

    move-object/from16 v10, v16

    move-object/from16 v5, v28

    move-object/from16 v9, v29

    invoke-direct/range {v0 .. v10}, LNf/k;-><init>(LJ/z;LVm/a;LVm/a;LVm/k;Ljava/util/List;Lar/M;Lm0/Z;Ljava/util/List;Ljava/util/List;Lm0/Z;)V

    const v1, 0x45d78f84

    invoke-static {v1, v0, v12}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v0

    const/4 v1, 0x6

    invoke-static {v0, v12, v1}, LX0/K;->a(Lu0/d;Lm0/l;I)V

    :goto_10
    invoke-virtual {v12}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_22

    new-instance v0, LNf/d;

    const/4 v5, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move v4, v11

    invoke-direct/range {v0 .. v5}, LNf/d;-><init>(LVm/a;LVm/k;LVm/a;II)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_22
    return-void
.end method

.method public static final e(LA0/r;Ljava/time/LocalTime;Ljava/time/LocalTime;Ljava/time/LocalTime;LYl/V;JILk1/U;LG/Q;LVm/k;Lm0/l;III)V
    .locals 21

    move-object/from16 v11, p10

    move/from16 v0, p14

    const-string v1, "onTimeChanged"

    invoke-static {v11, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v6, p11

    check-cast v6, Lm0/q;

    const v1, 0x4353dc9a

    invoke-virtual {v6, v1}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v1, v0, 0x1

    if-eqz v1, :cond_0

    or-int/lit8 v4, p12, 0x6

    move v5, v4

    move-object/from16 v4, p0

    :goto_0
    move v7, v1

    move-object/from16 v1, p1

    goto :goto_2

    :cond_0
    move-object/from16 v4, p0

    invoke-virtual {v6, v4}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    const/4 v5, 0x4

    goto :goto_1

    :cond_1
    const/4 v5, 0x2

    :goto_1
    or-int v5, p12, v5

    goto :goto_0

    :goto_2
    invoke-virtual {v6, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    const/16 v8, 0x20

    goto :goto_3

    :cond_2
    const/16 v8, 0x10

    :goto_3
    or-int/2addr v5, v8

    and-int/lit8 v8, v0, 0x4

    if-eqz v8, :cond_3

    or-int/lit16 v5, v5, 0x180

    move-object/from16 v9, p2

    goto :goto_5

    :cond_3
    move-object/from16 v9, p2

    invoke-virtual {v6, v9}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    const/16 v10, 0x100

    goto :goto_4

    :cond_4
    const/16 v10, 0x80

    :goto_4
    or-int/2addr v5, v10

    :goto_5
    and-int/lit8 v10, v0, 0x8

    if-eqz v10, :cond_5

    or-int/lit16 v5, v5, 0xc00

    move-object/from16 v12, p3

    :goto_6
    move-object/from16 v13, p4

    goto :goto_8

    :cond_5
    move-object/from16 v12, p3

    invoke-virtual {v6, v12}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_6

    const/16 v13, 0x800

    goto :goto_7

    :cond_6
    const/16 v13, 0x400

    :goto_7
    or-int/2addr v5, v13

    goto :goto_6

    :goto_8
    invoke-virtual {v6, v13}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_7

    const/16 v14, 0x4000

    goto :goto_9

    :cond_7
    const/16 v14, 0x2000

    :goto_9
    or-int/2addr v5, v14

    and-int/lit8 v14, v0, 0x20

    if-eqz v14, :cond_8

    const/high16 v15, 0x30000

    or-int/2addr v5, v15

    move-wide/from16 v2, p5

    goto :goto_b

    :cond_8
    move-wide/from16 v2, p5

    invoke-virtual {v6, v2, v3}, Lm0/q;->f(J)Z

    move-result v16

    if-eqz v16, :cond_9

    const/high16 v16, 0x20000

    goto :goto_a

    :cond_9
    const/high16 v16, 0x10000

    :goto_a
    or-int v5, v5, v16

    :goto_b
    const/high16 v16, 0x180000

    or-int v16, v5, v16

    and-int/lit16 v15, v0, 0x80

    if-eqz v15, :cond_a

    const/high16 v16, 0xd80000

    or-int v5, v5, v16

    move/from16 v16, v5

    move-object/from16 v5, p8

    goto :goto_d

    :cond_a
    move-object/from16 v5, p8

    invoke-virtual {v6, v5}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_b

    const/high16 v18, 0x800000

    goto :goto_c

    :cond_b
    const/high16 v18, 0x400000

    :goto_c
    or-int v16, v16, v18

    :goto_d
    const/high16 v18, 0x6000000

    or-int v16, v16, v18

    and-int/lit16 v1, v0, 0x200

    if-nez v1, :cond_c

    move-object/from16 v1, p9

    invoke-virtual {v6, v1}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_d

    const/high16 v18, 0x20000000

    goto :goto_e

    :cond_c
    move-object/from16 v1, p9

    :cond_d
    const/high16 v18, 0x10000000

    :goto_e
    or-int v16, v16, v18

    and-int/lit8 v18, p13, 0x6

    if-nez v18, :cond_f

    invoke-virtual {v6, v11}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_e

    const/16 v18, 0x4

    goto :goto_f

    :cond_e
    const/16 v18, 0x2

    :goto_f
    or-int v18, p13, v18

    goto :goto_10

    :cond_f
    move/from16 v18, p13

    :goto_10
    const v19, 0x12492493

    and-int v1, v16, v19

    const v2, 0x12492492

    if-ne v1, v2, :cond_11

    and-int/lit8 v1, v18, 0x3

    const/4 v2, 0x2

    if-ne v1, v2, :cond_11

    invoke-virtual {v6}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_10

    goto :goto_11

    :cond_10
    invoke-virtual {v6}, Lm0/q;->Y()V

    move/from16 v8, p7

    move-object/from16 v10, p9

    move-object v1, v4

    move-object v14, v6

    move-object v3, v9

    move-object v4, v12

    move-wide/from16 v6, p5

    move-object v9, v5

    goto/16 :goto_1a

    :cond_11
    :goto_11
    invoke-virtual {v6}, Lm0/q;->a0()V

    and-int/lit8 v1, p12, 0x1

    const v17, -0x70000001

    const/4 v2, 0x0

    if-eqz v1, :cond_14

    invoke-virtual {v6}, Lm0/q;->E()Z

    move-result v1

    if-eqz v1, :cond_12

    goto :goto_13

    :cond_12
    invoke-virtual {v6}, Lm0/q;->Y()V

    and-int/lit16 v1, v0, 0x200

    if-eqz v1, :cond_13

    and-int v16, v16, v17

    :cond_13
    move-wide/from16 v19, p5

    move/from16 v7, p7

    move-object/from16 v11, p9

    move v14, v2

    move-object v1, v4

    move-object/from16 v17, v5

    move-object v2, v9

    :goto_12
    move-object v3, v12

    goto :goto_18

    :cond_14
    :goto_13
    if-eqz v7, :cond_15

    sget-object v1, LA0/o;->a:LA0/o;

    goto :goto_14

    :cond_15
    move-object v1, v4

    :goto_14
    if-eqz v8, :cond_16

    sget-object v3, Ljava/time/LocalTime;->MIN:Ljava/time/LocalTime;

    move-object v9, v3

    :cond_16
    if-eqz v10, :cond_17

    sget-object v3, Ljava/time/LocalTime;->MAX:Ljava/time/LocalTime;

    move-object v12, v3

    :cond_17
    if-eqz v14, :cond_18

    const/16 v3, 0xc8

    int-to-float v3, v3

    const/16 v4, 0x8c

    int-to-float v4, v4

    invoke-static {v3, v4}, LIm/G;->l(FF)J

    move-result-wide v3

    move-wide/from16 v19, v3

    goto :goto_15

    :cond_18
    move-wide/from16 v19, p5

    :goto_15
    if-eqz v15, :cond_19

    const/4 v3, 0x0

    move-object v8, v3

    goto :goto_16

    :cond_19
    move-object v8, v5

    :goto_16
    and-int/lit16 v3, v0, 0x200

    const/4 v10, 0x5

    if-eqz v3, :cond_1a

    sget-wide v3, LH0/w;->g:J

    int-to-float v5, v2

    invoke-static {v3, v4, v5}, Ly/x;->a(JF)Ly/E;

    move-result-object v5

    const/4 v7, 0x2

    move v14, v2

    const/4 v2, 0x1

    invoke-static/range {v2 .. v7}, LP2/c;->I(ZJLy/E;Lm0/l;I)LG/Q;

    move-result-object v2

    and-int v16, v16, v17

    move-object v11, v2

    :goto_17
    move-object/from16 v17, v8

    move-object v2, v9

    move v7, v10

    goto :goto_12

    :cond_1a
    move v14, v2

    move-object/from16 v11, p9

    goto :goto_17

    :goto_18
    invoke-virtual {v6}, Lm0/q;->r()V

    const v4, 0x6dd10c6a

    invoke-virtual {v6, v4}, Lm0/q;->f0(I)V

    if-nez v17, :cond_1b

    invoke-static {v6}, Lhh/j;->e(Lm0/l;)Lhh/k;

    move-result-object v4

    iget-object v4, v4, Lhh/k;->s:Lk1/U;

    move-object v8, v4

    goto :goto_19

    :cond_1b
    move-object/from16 v8, v17

    :goto_19
    invoke-virtual {v6, v14}, Lm0/q;->q(Z)V

    const v4, 0x6dd1150b

    invoke-virtual {v6, v4}, Lm0/q;->f0(I)V

    invoke-static {v6}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v4

    iget-object v4, v4, Lhh/h;->k:Lhh/v;

    iget-wide v9, v4, Lhh/v;->a:J

    invoke-virtual {v6, v14}, Lm0/q;->q(Z)V

    const v4, 0x703ffffe

    and-int v15, v16, v4

    and-int/lit8 v16, v18, 0xe

    const/4 v13, 0x0

    move-object/from16 v4, p4

    move-object/from16 v12, p10

    move-object v0, v1

    move-object v14, v6

    move-wide/from16 v5, v19

    move-object/from16 v1, p1

    invoke-static/range {v0 .. v16}, LV5/s;->O(LA0/r;Ljava/time/LocalTime;Ljava/time/LocalTime;Ljava/time/LocalTime;LYl/V;JILk1/U;JLG/Q;LVm/k;LVm/k;Lm0/l;II)V

    move-object v6, v14

    move-object v1, v0

    move-object v4, v3

    move-object v14, v6

    move v8, v7

    move-object v10, v11

    move-object/from16 v9, v17

    move-wide/from16 v6, v19

    move-object v3, v2

    :goto_1a
    invoke-virtual {v14}, Lm0/q;->u()Lm0/t0;

    move-result-object v15

    if-eqz v15, :cond_1c

    new-instance v0, Lg8/M;

    move-object/from16 v2, p1

    move-object/from16 v5, p4

    move-object/from16 v11, p10

    move/from16 v12, p12

    move/from16 v13, p13

    move/from16 v14, p14

    invoke-direct/range {v0 .. v14}, Lg8/M;-><init>(LA0/r;Ljava/time/LocalTime;Ljava/time/LocalTime;Ljava/time/LocalTime;LYl/V;JILk1/U;LG/Q;LVm/k;III)V

    iput-object v0, v15, Lm0/t0;->d:LVm/n;

    :cond_1c
    return-void
.end method

.method public static final f(Lwg/Q;LVm/a;Lm0/l;I)V
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v8, p1

    move/from16 v13, p3

    const-string v1, "uiModel"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "onClick"

    invoke-static {v8, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v11, p2

    check-cast v11, Lm0/q;

    const v1, -0x132ad14c

    invoke-virtual {v11, v1}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v1, v13, 0x6

    if-nez v1, :cond_1

    invoke-virtual {v11, v0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x4

    goto :goto_0

    :cond_0
    const/4 v1, 0x2

    :goto_0
    or-int/2addr v1, v13

    goto :goto_1

    :cond_1
    move v1, v13

    :goto_1
    and-int/lit8 v2, v13, 0x30

    if-nez v2, :cond_3

    invoke-virtual {v11, v8}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/16 v2, 0x20

    goto :goto_2

    :cond_2
    const/16 v2, 0x10

    :goto_2
    or-int/2addr v1, v2

    :cond_3
    and-int/lit8 v2, v1, 0x13

    const/16 v3, 0x12

    if-ne v2, v3, :cond_5

    invoke-virtual {v11}, Lm0/q;->H()Z

    move-result v2

    if-nez v2, :cond_4

    goto :goto_3

    :cond_4
    invoke-virtual {v11}, Lm0/q;->Y()V

    goto :goto_4

    :cond_5
    :goto_3
    sget-object v2, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->b:Lm0/c1;

    invoke-virtual {v11, v2}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/Context;

    const v4, 0x7f12072c

    invoke-static {v11, v4}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v4

    iget-object v5, v0, Lwg/Q;->a:LYa/H;

    invoke-virtual {v5, v2}, LYa/H;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    iget-object v6, v0, Lwg/Q;->d:Lwg/k;

    move v7, v3

    iget-object v3, v6, Lwg/k;->a:Ljava/lang/Double;

    iget-wide v9, v6, Lwg/k;->c:D

    double-to-int v9, v9

    iget-wide v14, v6, Lwg/k;->d:D

    double-to-int v6, v14

    iget-object v10, v0, Lwg/Q;->b:LYa/H;

    invoke-virtual {v10, v2}, LYa/H;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    iget-object v12, v0, Lwg/Q;->c:LYa/H;

    invoke-virtual {v12, v2}, LYa/H;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    const/high16 v12, 0x1c00000

    shl-int/2addr v1, v7

    and-int/2addr v12, v1

    move-object v1, v4

    move v4, v9

    iget-object v9, v0, Lwg/Q;->e:Ljava/lang/Boolean;

    move-object v7, v2

    move-object v2, v5

    move v5, v6

    move-object v6, v10

    iget-object v10, v0, Lwg/Q;->f:Ljava/lang/Integer;

    invoke-static/range {v1 .. v12}, LP2/l;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Double;IILjava/lang/String;Ljava/lang/String;LVm/a;Ljava/lang/Boolean;Ljava/lang/Integer;Lm0/l;I)V

    :goto_4
    invoke-virtual {v11}, Lm0/q;->u()Lm0/t0;

    move-result-object v1

    if-eqz v1, :cond_6

    new-instance v2, LAg/g;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v8, v13, v3}, LAg/g;-><init>(Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object v2, v1, Lm0/t0;->d:LVm/n;

    :cond_6
    return-void
.end method

.method public static final g(LA0/r;Lng/h;IZLVm/n;Lm0/l;I)V
    .locals 38

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move/from16 v4, p3

    move-object/from16 v5, p4

    move/from16 v6, p6

    const-string v0, "task"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onCompletionChecked"

    invoke-static {v5, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v0, p5

    check-cast v0, Lm0/q;

    const v7, 0x471dfe17

    invoke-virtual {v0, v7}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v7, v6, 0x6

    if-nez v7, :cond_1

    invoke-virtual {v0, v1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    const/4 v7, 0x4

    goto :goto_0

    :cond_0
    const/4 v7, 0x2

    :goto_0
    or-int/2addr v7, v6

    goto :goto_1

    :cond_1
    move v7, v6

    :goto_1
    and-int/lit8 v8, v6, 0x30

    if-nez v8, :cond_3

    invoke-virtual {v0, v2}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    const/16 v8, 0x20

    goto :goto_2

    :cond_2
    const/16 v8, 0x10

    :goto_2
    or-int/2addr v7, v8

    :cond_3
    and-int/lit16 v8, v6, 0x180

    if-nez v8, :cond_5

    invoke-virtual {v0, v3}, Lm0/q;->e(I)Z

    move-result v8

    if-eqz v8, :cond_4

    const/16 v8, 0x100

    goto :goto_3

    :cond_4
    const/16 v8, 0x80

    :goto_3
    or-int/2addr v7, v8

    :cond_5
    and-int/lit16 v8, v6, 0xc00

    if-nez v8, :cond_7

    invoke-virtual {v0, v4}, Lm0/q;->h(Z)Z

    move-result v8

    if-eqz v8, :cond_6

    const/16 v8, 0x800

    goto :goto_4

    :cond_6
    const/16 v8, 0x400

    :goto_4
    or-int/2addr v7, v8

    :cond_7
    and-int/lit16 v8, v6, 0x6000

    if-nez v8, :cond_9

    invoke-virtual {v0, v5}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_8

    const/16 v8, 0x4000

    goto :goto_5

    :cond_8
    const/16 v8, 0x2000

    :goto_5
    or-int/2addr v7, v8

    :cond_9
    and-int/lit16 v8, v7, 0x2493

    const/16 v9, 0x2492

    if-ne v8, v9, :cond_b

    invoke-virtual {v0}, Lm0/q;->H()Z

    move-result v8

    if-nez v8, :cond_a

    goto :goto_6

    :cond_a
    invoke-virtual {v0}, Lm0/q;->Y()V

    move-object v7, v0

    goto/16 :goto_e

    :cond_b
    :goto_6
    const/4 v8, 0x3

    invoke-static {v1, v8}, Landroidx/compose/foundation/layout/b;->w(LA0/r;I)LA0/r;

    move-result-object v9

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-static {v9, v10}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v9

    sget-object v11, LA0/d;->a:LA0/i;

    const/4 v12, 0x0

    invoke-static {v11, v12}, LG/t;->d(LA0/e;Z)LX0/h0;

    move-result-object v13

    iget-wide v14, v0, Lm0/q;->T:J

    invoke-static {v14, v15}, Ljava/lang/Long;->hashCode(J)I

    move-result v14

    invoke-virtual {v0}, Lm0/q;->m()Lm0/o0;

    move-result-object v15

    invoke-static {v9, v0}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v9

    sget-object v16, LZ0/h;->l0:LZ0/g;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move/from16 p5, v14

    sget-object v14, LZ0/g;->b:LZ0/f;

    invoke-virtual {v0}, Lm0/q;->j0()V

    iget-boolean v8, v0, Lm0/q;->S:Z

    if-eqz v8, :cond_c

    invoke-virtual {v0, v14}, Lm0/q;->l(LVm/a;)V

    goto :goto_7

    :cond_c
    invoke-virtual {v0}, Lm0/q;->t0()V

    :goto_7
    sget-object v8, LZ0/g;->f:LZ0/e;

    invoke-static {v8, v13, v0}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v13, LZ0/g;->e:LZ0/e;

    invoke-static {v13, v15, v0}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static/range {p5 .. p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    sget-object v10, LZ0/g;->g:LZ0/e;

    invoke-static {v0, v15, v10}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v15, LZ0/g;->h:LZ0/d;

    invoke-static {v0, v15}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v1, LZ0/g;->d:LZ0/e;

    invoke-static {v1, v9, v0}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v9, LA0/o;->a:LA0/o;

    sget-object v12, LG/l;->g:LG/g;

    sget-object v3, LA0/d;->k:LA0/h;

    const/16 v6, 0x36

    invoke-static {v12, v3, v0, v6}, LG/S0;->a(LG/h;LA0/h;Lm0/l;I)LG/U0;

    move-result-object v3

    move v12, v7

    iget-wide v6, v0, Lm0/q;->T:J

    invoke-static {v6, v7}, Ljava/lang/Long;->hashCode(J)I

    move-result v6

    invoke-virtual {v0}, Lm0/q;->m()Lm0/o0;

    move-result-object v7

    move-object/from16 v18, v11

    invoke-static {v9, v0}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v11

    invoke-virtual {v0}, Lm0/q;->j0()V

    move-object/from16 v19, v9

    iget-boolean v9, v0, Lm0/q;->S:Z

    if-eqz v9, :cond_d

    invoke-virtual {v0, v14}, Lm0/q;->l(LVm/a;)V

    goto :goto_8

    :cond_d
    invoke-virtual {v0}, Lm0/q;->t0()V

    :goto_8
    invoke-static {v8, v3, v0}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v13, v7, v0}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v6, v0, v10, v0, v15}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    invoke-static {v1, v11, v0}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v7, Lih/h;->d:Lih/h;

    const/16 v3, 0x44

    int-to-float v3, v3

    invoke-static {v3}, Landroidx/compose/foundation/layout/b;->m(F)LA0/r;

    move-result-object v3

    move-object v9, v7

    move-object/from16 p5, v8

    const/high16 v6, 0x3f800000    # 1.0f

    float-to-double v7, v6

    const-wide/16 v21, 0x0

    cmpl-double v7, v7, v21

    const-string v23, "invalid weight; must be greater than zero"

    if-lez v7, :cond_e

    goto :goto_9

    :cond_e
    invoke-static/range {v23 .. v23}, LH/a;->a(Ljava/lang/String;)V

    :goto_9
    new-instance v7, LG/x0;

    const v24, 0x7f7fffff    # Float.MAX_VALUE

    cmpl-float v8, v6, v24

    if-lez v8, :cond_f

    move/from16 v6, v24

    :cond_f
    const/4 v8, 0x1

    invoke-direct {v7, v6, v8}, LG/x0;-><init>(FZ)V

    invoke-interface {v3, v7}, LA0/r;->then(LA0/r;)LA0/r;

    move-result-object v3

    invoke-static {v0}, Lhh/j;->a(Lm0/l;)Lhh/h;

    move-result-object v6

    iget-object v6, v6, Lhh/h;->k:Lhh/v;

    iget-wide v6, v6, Lhh/v;->c:J

    move v11, v8

    iget-object v8, v2, Lng/h;->d:Ljava/lang/String;

    const/16 v20, 0x3

    const/16 v16, 0x0

    move-object/from16 v25, v18

    const/16 v18, 0x0

    move-object/from16 v26, v10

    const/4 v10, 0x0

    move-object/from16 v27, v13

    const/4 v13, 0x0

    move-object/from16 v28, v14

    const/4 v14, 0x0

    move-object/from16 v29, v15

    const/4 v15, 0x0

    move-object/from16 v30, v19

    const/16 v19, 0x0

    move/from16 v31, v20

    const/16 v20, 0x3f4

    move-object/from16 v33, p5

    move-object/from16 v17, v0

    move/from16 p5, v12

    move-object/from16 v35, v26

    move-object/from16 v34, v27

    move-object/from16 v32, v28

    move-object/from16 v36, v29

    move-object/from16 v0, v30

    move-object/from16 v37, v9

    move-object v9, v3

    move v3, v11

    move-wide v11, v6

    move-object/from16 v7, v37

    move-object/from16 v6, v25

    invoke-virtual/range {v7 .. v20}, Lih/h;->o(Ljava/lang/String;LA0/r;Lk1/U;JIZIILm0/l;III)V

    move-object/from16 v7, v17

    const/16 v8, 0x64

    int-to-float v8, v8

    invoke-static {v0, v8}, Landroidx/compose/foundation/layout/b;->e(LA0/r;F)LA0/r;

    move-result-object v0

    const/4 v8, 0x0

    invoke-static {v6, v8}, LG/t;->d(LA0/e;Z)LX0/h0;

    move-result-object v6

    iget-wide v9, v7, Lm0/q;->T:J

    invoke-static {v9, v10}, Ljava/lang/Long;->hashCode(J)I

    move-result v9

    invoke-virtual {v7}, Lm0/q;->m()Lm0/o0;

    move-result-object v10

    invoke-static {v0, v7}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v0

    invoke-virtual {v7}, Lm0/q;->j0()V

    iget-boolean v11, v7, Lm0/q;->S:Z

    if-eqz v11, :cond_10

    move-object/from16 v11, v32

    invoke-virtual {v7, v11}, Lm0/q;->l(LVm/a;)V

    :goto_a
    move-object/from16 v11, v33

    goto :goto_b

    :cond_10
    invoke-virtual {v7}, Lm0/q;->t0()V

    goto :goto_a

    :goto_b
    invoke-static {v11, v6, v7}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object/from16 v6, v34

    invoke-static {v6, v10, v7}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    move-object/from16 v6, v35

    move-object/from16 v10, v36

    invoke-static {v9, v7, v6, v7, v10}, LB/h;->w(ILm0/q;LZ0/e;Lm0/q;LZ0/d;)V

    invoke-static {v1, v0, v7}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    if-nez p2, :cond_11

    move v12, v3

    goto :goto_c

    :cond_11
    move v12, v8

    :goto_c
    shr-int/lit8 v0, p5, 0x3

    and-int/lit16 v0, v0, 0x380

    iget-object v1, v2, Lng/h;->i:Lcom/eightsleep/presentation_jetlag/enums/JetLagPlanTaskScheduleStatus;

    invoke-static {v1, v12, v4, v7, v0}, LP2/p;->m(Lcom/eightsleep/presentation_jetlag/enums/JetLagPlanTaskScheduleStatus;ZZLm0/l;I)V

    invoke-virtual {v7, v3}, Lm0/q;->q(Z)V

    const/high16 v0, 0x40400000    # 3.0f

    float-to-double v8, v0

    cmpl-double v1, v8, v21

    if-lez v1, :cond_12

    goto :goto_d

    :cond_12
    invoke-static/range {v23 .. v23}, LH/a;->a(Ljava/lang/String;)V

    :goto_d
    new-instance v1, LG/x0;

    cmpl-float v6, v0, v24

    if-lez v6, :cond_13

    move/from16 v0, v24

    :cond_13
    invoke-direct {v1, v0, v3}, LG/x0;-><init>(FZ)V

    const/4 v0, 0x3

    invoke-static {v1, v0}, Landroidx/compose/foundation/layout/b;->w(LA0/r;I)LA0/r;

    move-result-object v0

    and-int/lit8 v1, p5, 0x70

    shr-int/lit8 v6, p5, 0x6

    and-int/lit16 v6, v6, 0x380

    or-int/2addr v1, v6

    invoke-static {v0, v2, v5, v7, v1}, LP2/s;->g(LA0/r;Lng/h;LVm/n;Lm0/l;I)V

    invoke-virtual {v7, v3}, Lm0/q;->q(Z)V

    invoke-virtual {v7, v3}, Lm0/q;->q(Z)V

    :goto_e
    invoke-virtual {v7}, Lm0/q;->u()Lm0/t0;

    move-result-object v7

    if-eqz v7, :cond_14

    new-instance v0, LBg/l;

    move-object/from16 v1, p0

    move/from16 v3, p2

    move/from16 v6, p6

    invoke-direct/range {v0 .. v6}, LBg/l;-><init>(LA0/r;Lng/h;IZLVm/n;I)V

    iput-object v0, v7, Lm0/t0;->d:LVm/n;

    :cond_14
    return-void
.end method

.method public static final h(ILA0/o;Ljava/lang/String;Lm0/l;)V
    .locals 7

    const-string v0, "orderNumber"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v4, p3

    check-cast v4, Lm0/q;

    const p3, 0x43c035d2

    invoke-virtual {v4, p3}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v4, p2}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_0

    const/4 p3, 0x4

    goto :goto_0

    :cond_0
    const/4 p3, 0x2

    :goto_0
    or-int/2addr p3, p0

    or-int/lit8 p3, p3, 0x30

    and-int/lit8 p3, p3, 0x13

    const/16 v0, 0x12

    if-ne p3, v0, :cond_2

    invoke-virtual {v4}, Lm0/q;->H()Z

    move-result p3

    if-nez p3, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v4}, Lm0/q;->Y()V

    goto :goto_2

    :cond_2
    :goto_1
    sget-object v1, LA0/o;->a:LA0/o;

    new-instance p1, LBg/d;

    const/4 p3, 0x7

    invoke-direct {p1, p2, p3}, LBg/d;-><init>(Ljava/lang/String;I)V

    const p3, 0x2e85a1e

    invoke-static {p3, p1, v4}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v3

    const/4 v6, 0x2

    const/4 v2, 0x0

    const/16 v5, 0x186

    invoke-static/range {v1 .. v6}, LWi/k;->b(LA0/r;LG/N0;Lu0/d;Lm0/l;II)V

    move-object p1, v1

    :goto_2
    invoke-virtual {v4}, Lm0/q;->u()Lm0/t0;

    move-result-object p3

    if-eqz p3, :cond_3

    new-instance v0, LWi/n;

    const/4 v1, 0x0

    invoke-direct {v0, p2, p1, p0, v1}, LWi/n;-><init>(Ljava/lang/String;LA0/o;II)V

    iput-object v0, p3, Lm0/t0;->d:LVm/n;

    :cond_3
    return-void
.end method

.method public static final i(Ljava/lang/String;Ljava/lang/String;ZLVm/k;LA0/o;Lm0/l;I)V
    .locals 41

    move/from16 v3, p2

    move-object/from16 v0, p3

    const-string v4, "onUiAction"

    invoke-static {v0, v4}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v4, p5

    check-cast v4, Lm0/q;

    const v5, 0x67997dd

    invoke-virtual {v4, v5}, Lm0/q;->h0(I)Lm0/q;

    move-object/from16 v9, p0

    invoke-virtual {v4, v9}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x4

    goto :goto_0

    :cond_0
    const/4 v5, 0x2

    :goto_0
    or-int v5, p6, v5

    move-object/from16 v6, p1

    invoke-virtual {v4, v6}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    const/16 v7, 0x20

    goto :goto_1

    :cond_1
    const/16 v7, 0x10

    :goto_1
    or-int/2addr v5, v7

    invoke-virtual {v4, v3}, Lm0/q;->h(Z)Z

    move-result v7

    const/16 v8, 0x100

    if-eqz v7, :cond_2

    move v7, v8

    goto :goto_2

    :cond_2
    const/16 v7, 0x80

    :goto_2
    or-int/2addr v5, v7

    invoke-virtual {v4, v0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v7

    const/16 v10, 0x800

    if-eqz v7, :cond_3

    move v7, v10

    goto :goto_3

    :cond_3
    const/16 v7, 0x400

    :goto_3
    or-int/2addr v5, v7

    or-int/lit16 v5, v5, 0x6000

    and-int/lit16 v7, v5, 0x2493

    const/16 v11, 0x2492

    if-ne v7, v11, :cond_5

    invoke-virtual {v4}, Lm0/q;->H()Z

    move-result v7

    if-nez v7, :cond_4

    goto :goto_4

    :cond_4
    invoke-virtual {v4}, Lm0/q;->Y()V

    move-object/from16 v5, p4

    move-object v0, v4

    goto/16 :goto_c

    :cond_5
    :goto_4
    sget-object v7, LA0/o;->a:LA0/o;

    const v11, -0x2dda7e32

    invoke-virtual {v4, v11}, Lm0/q;->f0(I)V

    invoke-virtual {v4}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v11

    sget-object v12, Lm0/k;->a:Lm0/e;

    if-ne v11, v12, :cond_6

    new-instance v11, LF0/x;

    invoke-direct {v11}, LF0/x;-><init>()V

    invoke-virtual {v4, v11}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_6
    check-cast v11, LF0/x;

    const/4 v13, 0x0

    invoke-virtual {v4, v13}, Lm0/q;->q(Z)V

    sget-object v14, La1/k0;->p:Lm0/c1;

    invoke-virtual {v4, v14}, Lm0/q;->k(Lm0/r0;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, La1/N0;

    sget-object v15, LHm/B;->a:LHm/B;

    const/16 v16, 0x1b

    const v1, -0x2dda6e23

    invoke-virtual {v4, v1}, Lm0/q;->f0(I)V

    and-int/lit16 v1, v5, 0x380

    if-ne v1, v8, :cond_7

    const/4 v1, 0x1

    goto :goto_5

    :cond_7
    move v1, v13

    :goto_5
    invoke-virtual {v4, v14}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v8

    or-int/2addr v1, v8

    invoke-virtual {v4}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v8

    if-nez v1, :cond_8

    if-ne v8, v12, :cond_9

    :cond_8
    new-instance v8, Luh/e;

    const/4 v1, 0x0

    invoke-direct {v8, v3, v11, v14, v1}, Luh/e;-><init>(ZLF0/x;La1/N0;LLm/c;)V

    invoke-virtual {v4, v8}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_9
    check-cast v8, LVm/n;

    invoke-virtual {v4, v13}, Lm0/q;->q(Z)V

    invoke-static {v8, v15, v4}, Lm0/r;->f(LVm/n;Ljava/lang/Object;Lm0/l;)V

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v7, v1}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v8

    sget-object v14, LG/l;->a:LG/d;

    invoke-static {v4}, Lhh/j;->d(Lm0/l;)Lhh/i;

    move-result-object v14

    iget v14, v14, Lhh/i;->d:F

    invoke-static {v14}, LG/l;->g(F)LG/j;

    move-result-object v14

    sget-object v15, LA0/d;->m:LA0/g;

    invoke-static {v14, v15, v4, v13}, LG/A;->a(LG/k;LA0/g;Lm0/l;I)LG/B;

    move-result-object v14

    const/4 v15, 0x1

    iget-wide v1, v4, Lm0/q;->T:J

    invoke-static {v1, v2}, Ljava/lang/Long;->hashCode(J)I

    move-result v1

    invoke-virtual {v4}, Lm0/q;->m()Lm0/o0;

    move-result-object v2

    invoke-static {v8, v4}, LA0/a;->c(LA0/r;Lm0/l;)LA0/r;

    move-result-object v8

    sget-object v17, LZ0/h;->l0:LZ0/g;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move/from16 p5, v15

    sget-object v15, LZ0/g;->b:LZ0/f;

    invoke-virtual {v4}, Lm0/q;->j0()V

    iget-boolean v13, v4, Lm0/q;->S:Z

    if-eqz v13, :cond_a

    invoke-virtual {v4, v15}, Lm0/q;->l(LVm/a;)V

    goto :goto_6

    :cond_a
    invoke-virtual {v4}, Lm0/q;->t0()V

    :goto_6
    sget-object v13, LZ0/g;->f:LZ0/e;

    invoke-static {v13, v14, v4}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    sget-object v13, LZ0/g;->e:LZ0/e;

    invoke-static {v13, v2, v4}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, LZ0/g;->g:LZ0/e;

    invoke-static {v4, v1, v2}, Lm0/r;->z(Lm0/l;Ljava/lang/Integer;LZ0/e;)V

    sget-object v1, LZ0/g;->h:LZ0/d;

    invoke-static {v4, v1}, Lm0/r;->G(Lm0/l;LZ0/d;)V

    sget-object v1, LZ0/g;->d:LZ0/e;

    invoke-static {v1, v8, v4}, Lm0/r;->K(LVm/n;Ljava/lang/Object;Lm0/l;)V

    xor-int/lit8 v13, v3, 0x1

    const v1, 0x7f120e6e

    invoke-static {v4, v1}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v1

    const v2, -0x52f7533

    invoke-virtual {v4, v2}, Lm0/q;->f0(I)V

    and-int/lit16 v2, v5, 0x1c00

    if-ne v2, v10, :cond_b

    move/from16 v8, p5

    goto :goto_7

    :cond_b
    const/4 v8, 0x0

    :goto_7
    invoke-virtual {v4}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v14

    if-nez v8, :cond_c

    if-ne v14, v12, :cond_d

    :cond_c
    new-instance v14, Lqg/x;

    const/16 v8, 0x1a

    invoke-direct {v14, v8, v0}, Lqg/x;-><init>(ILVm/k;)V

    invoke-virtual {v4, v14}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_d
    check-cast v14, LVm/k;

    const/4 v8, 0x0

    invoke-virtual {v4, v8}, Lm0/q;->q(Z)V

    shl-int/lit8 v15, v5, 0x9

    const/high16 v17, 0x70000

    and-int v15, v15, v17

    shl-int/lit8 v17, v5, 0x1b

    const/high16 v18, 0x70000000

    and-int v17, v17, v18

    or-int v26, v15, v17

    const/16 v24, 0x0

    const/16 v27, 0x0

    const/4 v0, 0x0

    move-object v3, v1

    const/4 v1, 0x0

    move v15, v2

    const/4 v2, 0x0

    move-object/from16 v25, v4

    const/4 v4, 0x0

    const/4 v6, 0x0

    move-object/from16 v17, v7

    const/4 v7, 0x0

    move/from16 v18, v8

    const/4 v8, 0x0

    move-object/from16 v19, v11

    const/4 v11, 0x0

    move-object/from16 v20, v12

    const/4 v12, 0x0

    move/from16 v21, v10

    move-object v10, v14

    const/4 v14, 0x0

    move/from16 v22, v15

    const/4 v15, 0x0

    move/from16 v23, v16

    const/16 v16, 0x0

    move-object/from16 v28, v17

    const/16 v17, 0x0

    move/from16 v29, v18

    const/16 v18, 0x0

    move-object/from16 v30, v19

    const/16 v19, 0x0

    move-object/from16 v31, v20

    const/16 v20, 0x0

    move/from16 v32, v21

    const/16 v21, 0x0

    move/from16 v33, v22

    move/from16 v34, v23

    const-wide/16 v22, 0x0

    move-object/from16 v35, v28

    const/16 v28, 0x0

    move/from16 v36, v29

    const v29, 0xffd9d7

    move-object/from16 v39, v30

    move-object/from16 v38, v31

    move/from16 v40, v33

    move-object/from16 v37, v35

    move/from16 v30, v5

    move/from16 v5, p2

    invoke-static/range {v0 .. v29}, LP2/p;->d(Ljava/lang/String;Ljava/lang/String;LVm/a;Ljava/lang/String;Lp1/l;ZLVm/a;LVm/a;Ljava/util/List;Ljava/lang/String;LVm/k;LA0/r;ZZLu0/d;Lu0/d;Lp1/E;LP/n0;LP/m0;ZIIJLE/l;Lm0/l;IIII)V

    move-object/from16 v0, v25

    move-object/from16 v1, v37

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v1, v2}, Landroidx/compose/foundation/layout/b;->d(LA0/r;F)LA0/r;

    move-result-object v2

    move-object/from16 v11, v39

    invoke-static {v2, v11}, LF0/d;->k(LA0/r;LF0/x;)LA0/r;

    move-result-object v14

    const v2, 0x7f120e6a

    invoke-static {v0, v2}, LP2/j;->I(Lm0/l;I)Ljava/lang/String;

    move-result-object v9

    const v2, -0x52f2fd1

    invoke-virtual {v0, v2}, Lm0/q;->f0(I)V

    move/from16 v15, v40

    const/16 v2, 0x800

    if-ne v15, v2, :cond_e

    const/4 v3, 0x1

    goto :goto_8

    :cond_e
    const/4 v3, 0x0

    :goto_8
    invoke-virtual {v0}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v4

    if-nez v3, :cond_10

    move-object/from16 v3, v38

    if-ne v4, v3, :cond_f

    goto :goto_9

    :cond_f
    move-object/from16 v6, p3

    goto :goto_a

    :cond_10
    move-object/from16 v3, v38

    :goto_9
    new-instance v4, Lrh/g;

    const/16 v5, 0x16

    move-object/from16 v6, p3

    invoke-direct {v4, v5, v6}, Lrh/g;-><init>(ILVm/k;)V

    invoke-virtual {v0, v4}, Lm0/q;->q0(Ljava/lang/Object;)V

    :goto_a
    move-object v11, v4

    check-cast v11, LVm/a;

    const/4 v8, 0x0

    invoke-virtual {v0, v8}, Lm0/q;->q(Z)V

    const v4, -0x52f462f

    invoke-virtual {v0, v4}, Lm0/q;->f0(I)V

    if-ne v15, v2, :cond_11

    const/4 v2, 0x1

    goto :goto_b

    :cond_11
    move v2, v8

    :goto_b
    invoke-virtual {v0}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v4

    if-nez v2, :cond_12

    if-ne v4, v3, :cond_13

    :cond_12
    new-instance v4, Lqg/x;

    const/16 v2, 0x1b

    invoke-direct {v4, v2, v6}, Lqg/x;-><init>(ILVm/k;)V

    invoke-virtual {v0, v4}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_13
    move-object v13, v4

    check-cast v13, LVm/k;

    invoke-virtual {v0, v8}, Lm0/q;->q(Z)V

    shl-int/lit8 v2, v30, 0x15

    const/high16 v3, 0xe000000

    and-int/2addr v2, v3

    or-int/lit8 v20, v2, 0x6

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v10, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v21, 0x0

    const v22, 0x3f86e

    move-object/from16 v12, p1

    move-object/from16 v19, v0

    invoke-static/range {v5 .. v22}, LP2/p;->c(ZLjava/lang/String;Ljava/lang/String;LVm/a;Ljava/lang/String;ZLVm/a;Ljava/lang/String;LVm/k;LA0/r;ZIILE/l;Lm0/l;III)V

    const/4 v15, 0x1

    invoke-virtual {v0, v15}, Lm0/q;->q(Z)V

    move-object v5, v1

    :goto_c
    invoke-virtual {v0}, Lm0/q;->u()Lm0/t0;

    move-result-object v8

    if-eqz v8, :cond_14

    new-instance v0, LGh/H;

    const/4 v7, 0x7

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move-object/from16 v4, p3

    move/from16 v6, p6

    invoke-direct/range {v0 .. v7}, LGh/H;-><init>(Ljava/lang/String;Ljava/lang/String;ZLVm/k;Ljava/lang/Object;II)V

    iput-object v0, v8, Lm0/t0;->d:LVm/n;

    :cond_14
    return-void
.end method

.method public static final j(Lw8/a;LA0/r;Lm0/l;I)V
    .locals 3

    const-string v0, "image"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p2, Lm0/q;

    const v0, 0x66cd498f

    invoke-virtual {p2, v0}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {p2, p0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int/2addr v0, p3

    and-int/lit8 v1, p3, 0x30

    if-nez v1, :cond_2

    invoke-virtual {p2, p1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x20

    goto :goto_1

    :cond_1
    const/16 v1, 0x10

    :goto_1
    or-int/2addr v0, v1

    :cond_2
    and-int/lit8 v1, v0, 0x13

    const/16 v2, 0x12

    if-ne v1, v2, :cond_4

    invoke-virtual {p2}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_2

    :cond_3
    invoke-virtual {p2}, Lm0/q;->Y()V

    goto :goto_3

    :cond_4
    :goto_2
    shl-int/lit8 v0, v0, 0x3

    and-int/lit16 v0, v0, 0x380

    or-int/lit8 v0, v0, 0x6

    const-string v1, "pod-card-layers.json"

    iget-object v2, p0, Lw8/a;->a:Ljava/util/Set;

    invoke-static {v1, v2, p1, p2, v0}, LP2/r;->b(Ljava/lang/String;Ljava/util/Set;LA0/r;Lm0/l;I)V

    :goto_3
    invoke-virtual {p2}, Lm0/q;->u()Lm0/t0;

    move-result-object p2

    if-eqz p2, :cond_5

    new-instance v0, Lg8/f;

    const/16 v1, 0xf

    invoke-direct {v0, p0, p1, p3, v1}, Lg8/f;-><init>(Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object v0, p2, Lm0/t0;->d:LVm/n;

    :cond_5
    return-void
.end method

.method public static final k(Lw8/h;LA0/r;Lm0/l;I)V
    .locals 3

    const-string v0, "image"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p2, Lm0/q;

    const v0, 0x56d1508f

    invoke-virtual {p2, v0}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {p2, p0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int/2addr v0, p3

    and-int/lit8 v1, p3, 0x30

    if-nez v1, :cond_2

    invoke-virtual {p2, p1}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x20

    goto :goto_1

    :cond_1
    const/16 v1, 0x10

    :goto_1
    or-int/2addr v0, v1

    :cond_2
    and-int/lit8 v1, v0, 0x13

    const/16 v2, 0x12

    if-ne v1, v2, :cond_4

    invoke-virtual {p2}, Lm0/q;->H()Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_2

    :cond_3
    invoke-virtual {p2}, Lm0/q;->Y()V

    goto :goto_3

    :cond_4
    :goto_2
    shl-int/lit8 v0, v0, 0x3

    and-int/lit16 v0, v0, 0x380

    or-int/lit8 v0, v0, 0x6

    const-string v1, "pod-layers-front.json"

    iget-object v2, p0, Lw8/h;->a:Ljava/util/Set;

    invoke-static {v1, v2, p1, p2, v0}, LP2/r;->b(Ljava/lang/String;Ljava/util/Set;LA0/r;Lm0/l;I)V

    :goto_3
    invoke-virtual {p2}, Lm0/q;->u()Lm0/t0;

    move-result-object p2

    if-eqz p2, :cond_5

    new-instance v0, Lg8/f;

    const/16 v1, 0x10

    invoke-direct {v0, p0, p1, p3, v1}, Lg8/f;-><init>(Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object v0, p2, Lm0/t0;->d:LVm/n;

    :cond_5
    return-void
.end method

.method public static final l(Lyd/r;LVm/k;LVm/a;LVm/k;Lm0/l;I)V
    .locals 15

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move/from16 v14, p5

    const-string v0, "tag"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onSaveTag"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onCancelEdit"

    invoke-static {v3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onDeleteTag"

    invoke-static {v4, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v11, p4

    check-cast v11, Lm0/q;

    const v0, -0x73acc9f4

    invoke-virtual {v11, v0}, Lm0/q;->h0(I)Lm0/q;

    and-int/lit8 v0, v14, 0x6

    if-nez v0, :cond_1

    invoke-virtual {v11, p0}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int/2addr v0, v14

    goto :goto_1

    :cond_1
    move v0, v14

    :goto_1
    and-int/lit8 v1, v14, 0x30

    if-nez v1, :cond_3

    invoke-virtual {v11, v2}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x20

    goto :goto_2

    :cond_2
    const/16 v1, 0x10

    :goto_2
    or-int/2addr v0, v1

    :cond_3
    and-int/lit16 v1, v14, 0x180

    if-nez v1, :cond_5

    invoke-virtual {v11, v3}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const/16 v1, 0x100

    goto :goto_3

    :cond_4
    const/16 v1, 0x80

    :goto_3
    or-int/2addr v0, v1

    :cond_5
    and-int/lit16 v1, v14, 0xc00

    if-nez v1, :cond_7

    invoke-virtual {v11, v4}, Lm0/q;->i(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    const/16 v1, 0x800

    goto :goto_4

    :cond_6
    const/16 v1, 0x400

    :goto_4
    or-int/2addr v0, v1

    :cond_7
    move v6, v0

    and-int/lit16 v0, v6, 0x493

    const/16 v1, 0x492

    if-ne v0, v1, :cond_9

    invoke-virtual {v11}, Lm0/q;->H()Z

    move-result v0

    if-nez v0, :cond_8

    goto :goto_5

    :cond_8
    invoke-virtual {v11}, Lm0/q;->Y()V

    goto :goto_6

    :cond_9
    :goto_5
    const v0, 0x1c48dbb

    invoke-virtual {v11, v0}, Lm0/q;->f0(I)V

    invoke-virtual {v11}, Lm0/q;->S()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lm0/k;->a:Lm0/e;

    if-ne v0, v1, :cond_a

    invoke-interface {p0}, Lyd/r;->getTimestamp()LGa/s;

    move-result-object v0

    invoke-static {v0}, Lm0/r;->C(Ljava/lang/Object;)Lm0/i0;

    move-result-object v0

    invoke-virtual {v11, v0}, Lm0/q;->q0(Ljava/lang/Object;)V

    :cond_a
    check-cast v0, Lm0/Z;

    const/4 v1, 0x0

    invoke-virtual {v11, v1}, Lm0/q;->q(Z)V

    move-object v3, v0

    new-instance v0, LBg/V;

    move-object v1, p0

    move-object v5, v4

    move-object v4, v2

    move-object/from16 v2, p2

    invoke-direct/range {v0 .. v5}, LBg/V;-><init>(Lyd/r;LVm/a;Lm0/Z;LVm/k;LVm/k;)V

    const v1, -0x7cd13247

    invoke-static {v1, v0, v11}, Lu0/e;->e(ILHm/e;Lm0/l;)Lu0/d;

    move-result-object v10

    const v0, 0xe000

    shl-int/lit8 v1, v6, 0x6

    and-int/2addr v0, v1

    const/high16 v1, 0x6000000

    or-int v12, v0, v1

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v0, 0x0

    const-wide/16 v1, 0x0

    const-wide/16 v3, 0x0

    const/4 v5, 0x0

    const/4 v7, 0x0

    const/16 v13, 0xef

    move-object/from16 v6, p2

    invoke-static/range {v0 .. v13}, LP2/e;->m(Lj0/w2;JJLu0/d;LVm/a;ZZLVm/n;Lu0/d;Lm0/l;II)V

    :goto_6
    invoke-virtual {v11}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_b

    new-instance v0, LSf/L;

    move-object v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move v5, v14

    invoke-direct/range {v0 .. v5}, LSf/L;-><init>(Lyd/r;LVm/k;LVm/a;LVm/k;I)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_b
    return-void
.end method

.method public static final m(IILA0/o;Ljava/lang/String;Lm0/l;)V
    .locals 11

    const-string v0, "text"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v7, p4

    check-cast v7, Lm0/q;

    const v0, 0x253baf40

    invoke-virtual {v7, v0}, Lm0/q;->h0(I)Lm0/q;

    invoke-virtual {v7, p3}, Lm0/q;->g(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    or-int/2addr v0, p1

    or-int/lit16 v0, v0, 0x190

    and-int/lit16 v2, v0, 0x93

    const/16 v3, 0x92

    if-ne v2, v3, :cond_2

    invoke-virtual {v7}, Lm0/q;->H()Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v7}, Lm0/q;->Y()V

    move v2, p0

    move-object v3, p2

    goto :goto_4

    :cond_2
    :goto_1
    invoke-virtual {v7}, Lm0/q;->a0()V

    and-int/lit8 v2, p1, 0x1

    if-eqz v2, :cond_4

    invoke-virtual {v7}, Lm0/q;->E()Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_2

    :cond_3
    invoke-virtual {v7}, Lm0/q;->Y()V

    and-int/lit8 v0, v0, -0x71

    move v10, p0

    move-object v3, p2

    goto :goto_3

    :cond_4
    :goto_2
    and-int/lit8 v0, v0, -0x71

    sget-object v2, LA0/o;->a:LA0/o;

    const/4 v3, 0x5

    move v10, v3

    move-object v3, v2

    :goto_3
    invoke-virtual {v7}, Lm0/q;->r()V

    sget-object v2, Lg8/h0;->a:Lg8/h0;

    new-instance v8, Lv1/k;

    invoke-direct {v8, v10}, Lv1/k;-><init>(I)V

    and-int/lit16 v0, v0, 0x38e

    const/4 v9, 0x0

    const/4 v6, 0x0

    const/4 v4, 0x0

    move v1, v0

    move-object v0, v2

    const/16 v2, 0x6a

    move-object v5, p3

    invoke-virtual/range {v0 .. v9}, Lg8/h0;->w(IILA0/r;LH0/w;Ljava/lang/String;Lk1/U;Lm0/l;Lv1/k;Z)V

    move v2, v10

    :goto_4
    invoke-virtual {v7}, Lm0/q;->u()Lm0/t0;

    move-result-object v6

    if-eqz v6, :cond_5

    new-instance v0, LSe/a;

    const/4 v5, 0x3

    move v4, p1

    move-object v1, p3

    invoke-direct/range {v0 .. v5}, LSe/a;-><init>(Ljava/lang/String;ILA0/o;II)V

    iput-object v0, v6, Lm0/t0;->d:LVm/n;

    :cond_5
    return-void
.end method

.method public static n(IILjava/lang/String;)B
    .locals 3

    sub-int v0, p1, p0

    if-lez v0, :cond_6

    const/4 v1, 0x3

    if-gt v0, v1, :cond_6

    const/4 v1, 0x1

    if-le v0, v1, :cond_1

    invoke-virtual {p2, p0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x30

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/lang/NumberFormatException;

    invoke-direct {p0}, Ljava/lang/NumberFormatException;-><init>()V

    throw p0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    :goto_1
    if-ge p0, p1, :cond_4

    mul-int/lit8 v0, v0, 0xa

    invoke-virtual {p2, p0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x7f

    if-le v1, v2, :cond_2

    const/4 v1, -0x1

    goto :goto_2

    :cond_2
    const/16 v2, 0xa

    invoke-static {v1, v2}, Ljava/lang/Character;->digit(CI)I

    move-result v1

    :goto_2
    if-ltz v1, :cond_3

    add-int/2addr v0, v1

    add-int/lit8 p0, p0, 0x1

    goto :goto_1

    :cond_3
    new-instance p0, Ljava/lang/NumberFormatException;

    invoke-direct {p0}, Ljava/lang/NumberFormatException;-><init>()V

    throw p0

    :cond_4
    const/16 p0, 0xff

    if-gt v0, p0, :cond_5

    int-to-byte p0, v0

    return p0

    :cond_5
    new-instance p0, Ljava/lang/NumberFormatException;

    invoke-direct {p0}, Ljava/lang/NumberFormatException;-><init>()V

    throw p0

    :cond_6
    new-instance p0, Ljava/lang/NumberFormatException;

    invoke-direct {p0}, Ljava/lang/NumberFormatException;-><init>()V

    throw p0
.end method

.method public static o(Ljava/lang/String;)[B
    .locals 7

    const/4 v0, 0x0

    move v1, v0

    move v2, v1

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x2e

    if-ge v1, v3, :cond_1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v4, :cond_0

    add-int/lit8 v2, v2, 0x1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    add-int/lit8 v2, v2, 0x1

    const/4 v1, 0x4

    if-eq v2, v1, :cond_2

    goto :goto_2

    :cond_2
    new-array v2, v1, [B

    move v3, v0

    :goto_1
    if-ge v0, v1, :cond_4

    invoke-virtual {p0, v4, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_3

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    :cond_3
    :try_start_0
    invoke-static {v3, v5, p0}, LP2/r;->n(IILjava/lang/String;)B

    move-result v3

    aput-byte v3, v2, v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v3, v5, 0x1

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :catch_0
    :goto_2
    const/4 p0, 0x0

    return-object p0

    :cond_4
    return-object v2
.end method

.method public static final p([Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 3

    array-length v0, p0

    add-int/lit8 v0, v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const/4 v2, 0x6

    invoke-static {p0, v1, v0, p1, v2}, LIm/n;->a0([Ljava/lang/Object;I[Ljava/lang/Object;II)V

    add-int/lit8 v1, p1, 0x2

    array-length v2, p0

    invoke-static {p0, v1, v0, p1, v2}, LIm/n;->Y([Ljava/lang/Object;I[Ljava/lang/Object;II)V

    aput-object p2, v0, p1

    add-int/lit8 p1, p1, 0x1

    aput-object p3, v0, p1

    return-object v0
.end method

.method public static final q(I[Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 3

    array-length v0, p1

    add-int/lit8 v0, v0, -0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const/4 v2, 0x6

    invoke-static {p1, v1, v0, p0, v2}, LIm/n;->a0([Ljava/lang/Object;I[Ljava/lang/Object;II)V

    add-int/lit8 v1, p0, 0x2

    array-length v2, p1

    invoke-static {p1, p0, v0, v1, v2}, LIm/n;->Y([Ljava/lang/Object;I[Ljava/lang/Object;II)V

    return-object v0
.end method

.method public static final r(F)LA0/r;
    .locals 2

    sget-object v0, LA0/o;->a:LA0/o;

    invoke-static {v0, p0}, Landroidx/compose/foundation/layout/b;->n(LA0/r;F)LA0/r;

    move-result-object v0

    const/high16 v1, 0x3e800000    # 0.25f

    mul-float/2addr p0, v1

    invoke-static {p0}, LO/e;->b(F)LO/d;

    move-result-object p0

    invoke-static {v0, p0}, LE0/i;->c(LA0/r;LH0/X;)LA0/r;

    move-result-object p0

    return-object p0
.end method

.method public static final v(LZn/x;)I
    .locals 1

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, LZn/x;->getAnnotations()Lln/h;

    move-result-object p0

    sget-object v0, Lhn/n;->q:LIn/c;

    invoke-interface {p0, v0}, Lln/h;->P(LIn/c;)Lln/b;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-interface {p0}, Lln/b;->b()Ljava/util/Map;

    move-result-object p0

    sget-object v0, Lhn/o;->d:LIn/g;

    invoke-static {p0, v0}, LIm/F;->Q(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, LNn/g;

    const-string v0, "null cannot be cast to non-null type org.jetbrains.kotlin.resolve.constants.IntValue"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->h(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p0, LNn/k;

    iget-object p0, p0, LNn/g;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    return p0
.end method

.method public static final w(Lhn/h;Lln/h;LZn/x;Ljava/util/List;Ljava/util/ArrayList;LZn/x;Z)LZn/B;
    .locals 8

    const/4 v0, 0x1

    const/4 v1, 0x0

    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v4

    add-int/2addr v4, v3

    if-eqz p2, :cond_0

    move v3, v0

    goto :goto_0

    :cond_0
    move v3, v1

    :goto_0
    add-int/2addr v4, v3

    add-int/2addr v4, v0

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v3, Ljava/util/ArrayList;

    const/16 v4, 0xa

    invoke-static {p3, v4}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, LZn/x;

    invoke-static {v5}, LP2/c;->e(LZn/x;)LZn/G;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    const/4 v3, 0x0

    if-eqz p2, :cond_2

    invoke-static {p2}, LP2/c;->e(LZn/x;)LZn/G;

    move-result-object v4

    goto :goto_2

    :cond_2
    move-object v4, v3

    :goto_2
    invoke-static {v2, v4}, Ljo/j;->a(Ljava/util/AbstractCollection;Ljava/lang/Object;)V

    invoke-virtual {p4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move v5, v1

    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    sget-object v7, Lln/g;->a:Lln/f;

    if-eqz v6, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v7, v5, 0x1

    if-ltz v5, :cond_3

    check-cast v6, LZn/x;

    invoke-static {v6}, LP2/c;->e(LZn/x;)LZn/G;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v5, v7

    goto :goto_3

    :cond_3
    invoke-static {}, LIm/s;->s0()V

    throw v3

    :cond_4
    invoke-static {p5}, LP2/c;->e(LZn/x;)LZn/G;

    move-result-object p5

    invoke-virtual {v2, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    move-result p4

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p5

    add-int/2addr p5, p4

    if-nez p2, :cond_5

    move v0, v1

    :cond_5
    add-int/2addr p5, v0

    if-eqz p6, :cond_6

    invoke-virtual {p0, p5}, Lhn/h;->u(I)Lkn/f;

    move-result-object p4

    goto :goto_4

    :cond_6
    sget-object p4, Lhn/o;->a:LIn/g;

    new-instance p4, Ljava/lang/StringBuilder;

    const-string p6, "Function"

    invoke-direct {p4, p6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p0, p4}, Lhn/h;->j(Ljava/lang/String;)Lkn/f;

    move-result-object p4

    :goto_4
    if-eqz p2, :cond_9

    sget-object p2, Lhn/n;->p:LIn/c;

    invoke-interface {p1, p2}, Lln/h;->y(LIn/c;)Z

    move-result p5

    if-eqz p5, :cond_7

    goto :goto_5

    :cond_7
    new-instance p5, Lln/j;

    sget-object p6, LIm/A;->a:LIm/A;

    invoke-direct {p5, p0, p2, p6}, Lln/j;-><init>(Lhn/h;LIn/c;Ljava/util/Map;)V

    invoke-static {p1, p5}, LIm/r;->A1(Ljava/lang/Iterable;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_8

    move-object p1, v7

    goto :goto_5

    :cond_8
    new-instance p2, Lln/i;

    invoke-direct {p2, p1, v1}, Lln/i;-><init>(Ljava/util/List;I)V

    move-object p1, p2

    :cond_9
    :goto_5
    invoke-interface {p3}, Ljava/util/Collection;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_c

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p2

    sget-object p3, Lhn/n;->q:LIn/c;

    invoke-interface {p1, p3}, Lln/h;->y(LIn/c;)Z

    move-result p5

    if-eqz p5, :cond_a

    goto :goto_7

    :cond_a
    new-instance p5, Lln/j;

    sget-object p6, Lhn/o;->d:LIn/g;

    new-instance v0, LNn/k;

    invoke-direct {v0, p2}, LNn/k;-><init>(I)V

    new-instance p2, LHm/k;

    invoke-direct {p2, p6, v0}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {p2}, LIm/G;->K(LHm/k;)Ljava/util/Map;

    move-result-object p2

    invoke-direct {p5, p0, p3, p2}, Lln/j;-><init>(Lhn/h;LIn/c;Ljava/util/Map;)V

    invoke-static {p1, p5}, LIm/r;->A1(Ljava/lang/Iterable;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_b

    goto :goto_6

    :cond_b
    new-instance v7, Lln/i;

    invoke-direct {v7, p0, v1}, Lln/i;-><init>(Ljava/util/List;I)V

    :goto_6
    move-object p1, v7

    :cond_c
    :goto_7
    invoke-static {p1}, LZn/c;->w(Lln/h;)LZn/I;

    move-result-object p0

    invoke-static {p0, p4, v2}, LZn/f;->q(LZn/I;Lkn/f;Ljava/util/List;)LZn/B;

    move-result-object p0

    return-object p0
.end method

.method public static x()Lcom/eightsleep/data_user/domain/model/DynamicHomeCustomizations;
    .locals 4

    new-instance v0, Lcom/eightsleep/data_user/domain/model/DynamicHomeCustomizations;

    invoke-static {}, Lyd/b;->a()LOm/a;

    move-result-object v1

    invoke-static {}, Lyd/a;->a()LOm/a;

    move-result-object v2

    invoke-static {}, Lyd/a;->a()LOm/a;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/eightsleep/data_user/domain/model/DynamicHomeCustomizations;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    return-object v0
.end method

.method public static final y(LDn/f0;)Lkn/p;
    .locals 1

    if-nez p0, :cond_0

    const/4 p0, -0x1

    goto :goto_0

    :cond_0
    sget-object v0, LVn/x;->b:[I

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    aget p0, v0, p0

    :goto_0
    const-string v0, "PRIVATE"

    packed-switch p0, :pswitch_data_0

    sget-object p0, Lkn/q;->a:Lkn/p;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0

    :pswitch_0
    sget-object p0, Lkn/q;->f:Lkn/p;

    const-string v0, "LOCAL"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0

    :pswitch_1
    sget-object p0, Lkn/q;->e:Lkn/p;

    const-string v0, "PUBLIC"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0

    :pswitch_2
    sget-object p0, Lkn/q;->c:Lkn/p;

    const-string v0, "PROTECTED"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0

    :pswitch_3
    sget-object p0, Lkn/q;->b:Lkn/p;

    const-string v0, "PRIVATE_TO_THIS"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0

    :pswitch_4
    sget-object p0, Lkn/q;->a:Lkn/p;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0

    :pswitch_5
    sget-object p0, Lkn/q;->d:Lkn/p;

    const-string v0, "INTERNAL"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static final z(LZn/x;)LIn/g;
    .locals 2

    invoke-virtual {p0}, LZn/x;->getAnnotations()Lln/h;

    move-result-object p0

    sget-object v0, Lhn/n;->r:LIn/c;

    invoke-interface {p0, v0}, Lln/h;->P(LIn/c;)Lln/b;

    move-result-object p0

    const/4 v0, 0x0

    if-nez p0, :cond_0

    goto :goto_2

    :cond_0
    invoke-interface {p0}, Lln/b;->b()Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    invoke-static {p0}, LIm/r;->G1(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object p0

    instance-of v1, p0, LNn/x;

    if-eqz v1, :cond_1

    check-cast p0, LNn/x;

    goto :goto_0

    :cond_1
    move-object p0, v0

    :goto_0
    if-eqz p0, :cond_3

    iget-object p0, p0, LNn/g;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_3

    invoke-static {p0}, LIn/g;->f(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_1

    :cond_2
    move-object p0, v0

    :goto_1
    if-eqz p0, :cond_3

    invoke-static {p0}, LIn/g;->e(Ljava/lang/String;)LIn/g;

    move-result-object p0

    return-object p0

    :cond_3
    :goto_2
    return-object v0
.end method


# virtual methods
.method public abstract E(LGk/k;)LGk/c;
.end method

.method public abstract F(LGk/k;)LGk/j;
.end method

.method public abstract R(LGk/j;LGk/j;)V
.end method

.method public abstract S(LGk/j;Ljava/lang/Thread;)V
.end method

.method public abstract s(LGk/k;LGk/c;LGk/c;)Z
.end method

.method public abstract t(LGk/k;Ljava/lang/Object;Ljava/lang/Object;)Z
.end method

.method public abstract u(LGk/k;LGk/j;LGk/j;)Z
.end method
