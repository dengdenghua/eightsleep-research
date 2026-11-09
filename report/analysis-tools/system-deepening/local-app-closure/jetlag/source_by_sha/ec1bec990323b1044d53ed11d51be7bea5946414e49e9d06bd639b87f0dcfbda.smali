.class public final LDl/A0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LDl/B0;
.implements Landroidx/glance/appwidget/protobuf/x;
.implements LB4/e;
.implements LB7/e;
.implements LDl/x;
.implements LJn/s;
.implements LE6/n;
.implements LFa/d;
.implements LG3/f;
.implements LM5/e;
.implements Lcom/google/crypto/tink/shaded/protobuf/C;
.implements LUk/l;


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    iput p1, p0, LDl/A0;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static o(Lorg/json/JSONObject;)V
    .locals 5

    :try_start_0
    const-string v0, "createdAt"

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    const-wide/16 v3, 0x3e8

    div-long/2addr v1, v3

    invoke-virtual {p0, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    const-string p0, "OnlineRequestProcessor"

    const-string v0, "Could not add createdAt timestamp to json object"

    invoke-static {p0, v0}, LP2/n;->K(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static p(Ljava/util/Map;)Ljava/lang/String;
    .locals 3

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/time/Instant;

    invoke-virtual {v1}, Ljava/time/Instant;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static q(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 6

    const-string v0, "tapSettingsEntityString"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, ","

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x6

    invoke-static {p0, v0, v1}, Llo/n;->B0(Ljava/lang/CharSequence;[Ljava/lang/String;I)Ljava/util/List;

    move-result-object p0

    new-instance v0, Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {p0, v2}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "string"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, ":"

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Llo/n;->B0(Ljava/lang/CharSequence;[Ljava/lang/String;I)Ljava/util/List;

    move-result-object v2

    new-instance v3, LNd/a;

    const/4 v4, 0x0

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lcom/eightsleep/data_core/enums/TapType;->valueOf(Ljava/lang/String;)Lcom/eightsleep/data_core/enums/TapType;

    move-result-object v4

    const/4 v5, 0x1

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/eightsleep/data_core/enums/AlarmTapAction;->valueOf(Ljava/lang/String;)Lcom/eightsleep/data_core/enums/AlarmTapAction;

    move-result-object v2

    invoke-direct {v3, v4, v2}, LNd/a;-><init>(Lcom/eightsleep/data_core/enums/TapType;Lcom/eightsleep/data_core/enums/AlarmTapAction;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static r(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 6

    const-string v0, "tapSettingsEntityString"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, ","

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x6

    invoke-static {p0, v0, v1}, Llo/n;->B0(Ljava/lang/CharSequence;[Ljava/lang/String;I)Ljava/util/List;

    move-result-object p0

    new-instance v0, Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {p0, v2}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "string"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, ":"

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Llo/n;->B0(Ljava/lang/CharSequence;[Ljava/lang/String;I)Ljava/util/List;

    move-result-object v2

    new-instance v3, LNd/c;

    const/4 v4, 0x0

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lcom/eightsleep/data_core/enums/TapType;->valueOf(Ljava/lang/String;)Lcom/eightsleep/data_core/enums/TapType;

    move-result-object v4

    const/4 v5, 0x1

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/eightsleep/data_core/enums/GenericTapAction;->valueOf(Ljava/lang/String;)Lcom/eightsleep/data_core/enums/GenericTapAction;

    move-result-object v2

    invoke-direct {v3, v4, v2}, LNd/c;-><init>(Lcom/eightsleep/data_core/enums/TapType;Lcom/eightsleep/data_core/enums/GenericTapAction;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static t(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 6

    const-string v0, "tapSettingsEntityString"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, ","

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x6

    invoke-static {p0, v0, v1}, Llo/n;->B0(Ljava/lang/CharSequence;[Ljava/lang/String;I)Ljava/util/List;

    move-result-object p0

    new-instance v0, Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {p0, v2}, LIm/t;->z0(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "string"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, ":"

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Llo/n;->B0(Ljava/lang/CharSequence;[Ljava/lang/String;I)Ljava/util/List;

    move-result-object v2

    new-instance v3, LNd/e;

    const/4 v4, 0x0

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lcom/eightsleep/data_core/enums/TapType;->valueOf(Ljava/lang/String;)Lcom/eightsleep/data_core/enums/TapType;

    move-result-object v4

    const/4 v5, 0x1

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/eightsleep/data_core/enums/QuadTapAction;->valueOf(Ljava/lang/String;)Lcom/eightsleep/data_core/enums/QuadTapAction;

    move-result-object v2

    invoke-direct {v3, v4, v2}, LNd/e;-><init>(Lcom/eightsleep/data_core/enums/TapType;Lcom/eightsleep/data_core/enums/QuadTapAction;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static u(Ljava/lang/String;)Ljava/util/LinkedHashMap;
    .locals 4

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    new-instance p0, Ljava/util/LinkedHashMap;

    invoke-direct {p0}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    const-string v2, "keys(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/time/Instant;->parse(Ljava/lang/CharSequence;)Ljava/time/Instant;

    move-result-object v3

    invoke-interface {p0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-object p0

    :cond_2
    :goto_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static v(Lcom/eightsleep/data_core/enums/ClockSystem;)LGa/s;
    .locals 3

    new-instance v0, LGa/s;

    invoke-static {}, Ljava/time/Instant;->now()Ljava/time/Instant;

    move-result-object v1

    const-string v2, "now(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    if-nez p0, :cond_0

    sget-object p0, LGa/f;->f:Lcom/eightsleep/data_core/enums/ClockSystem;

    :cond_0
    invoke-direct {v0, v1, p0}, LGa/s;-><init>(Ljava/time/Instant;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    return-object v0
.end method

.method private final w(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method private final x(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public static y(Ljava/time/Instant;Lcom/eightsleep/data_core/enums/ClockSystem;)LGa/s;
    .locals 1

    const-string v0, "instant"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, LGa/s;

    if-nez p1, :cond_0

    sget-object p1, LGa/f;->f:Lcom/eightsleep/data_core/enums/ClockSystem;

    :cond_0
    invoke-direct {v0, p0, p1}, LGa/s;-><init>(Ljava/time/Instant;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    return-object v0
.end method

.method public static z(Ljava/time/LocalTime;Lcom/eightsleep/data_core/enums/ClockSystem;)LGa/s;
    .locals 1

    const-string v0, "localTime"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, LGa/s;

    if-nez p1, :cond_0

    sget-object p1, LGa/f;->f:Lcom/eightsleep/data_core/enums/ClockSystem;

    :cond_0
    invoke-direct {v0, p0, p1}, LGa/s;-><init>(Ljava/time/LocalTime;Lcom/eightsleep/data_core/enums/ClockSystem;)V

    return-object v0
.end method


# virtual methods
.method public a(Landroid/content/Context;)V
    .locals 0

    iget p0, p0, LDl/A0;->a:I

    return-void
.end method

.method public b()V
    .locals 0

    return-void
.end method

.method public c(Ljava/lang/String;Ljava/security/Provider;)Ljava/lang/Object;
    .locals 0

    iget p0, p0, LDl/A0;->a:I

    packed-switch p0, :pswitch_data_0

    if-nez p2, :cond_0

    invoke-static {p1}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object p0

    goto :goto_0

    :cond_0
    invoke-static {p1, p2}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljavax/crypto/Mac;

    move-result-object p0

    :goto_0
    return-object p0

    :pswitch_0
    if-nez p2, :cond_1

    invoke-static {p1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object p0

    goto :goto_1

    :cond_1
    invoke-static {p1, p2}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljavax/crypto/Cipher;

    move-result-object p0

    :goto_1
    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x1a
        :pswitch_0
    .end packed-switch
.end method

.method public d(Ljava/lang/String;)V
    .locals 3

    const-string p0, "IterableApi"

    if-nez p1, :cond_0

    const-string p1, "Remote configuration returned null"

    invoke-static {p0, p1}, LP2/n;->K(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "offlineMode"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    sget-object v0, LDl/i;->q:LDl/i;

    iget-object v0, v0, LDl/i;->i:Lf5/b;

    invoke-virtual {v0, p1}, Lf5/b;->L(Z)V

    sget-object v0, LDl/i;->q:LDl/i;

    iget-object v0, v0, LDl/i;->a:Landroid/content/Context;

    const-string v1, "itbl_saved_configuration"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "itbl_offline_mode"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    const-string p1, "Failed to read remote configuration"

    invoke-static {p0, p1}, LP2/n;->K(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public e(J)J
    .locals 0

    return-wide p1
.end method

.method public f(ILjava/lang/Exception;)V
    .locals 0

    return-void
.end method

.method public g(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;LDl/x;)V
    .locals 7

    new-instance v0, LDl/m;

    invoke-static {p3}, LDl/A0;->o(Lorg/json/JSONObject;)V

    const-string v4, "GET"

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, LDl/m;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;LDl/x;)V

    new-instance p0, LDl/n0;

    invoke-direct {p0}, LDl/n0;-><init>()V

    filled-new-array {v0}, [LDl/m;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public h(LA5/f;)LH5/e;
    .locals 9

    iget-object p0, p1, LA5/f;->a:LA5/i;

    const-string v0, "null cannot be cast to non-null type com.amplitude.android.Configuration"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->h(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "amplitude-identify-intercept-"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, LA5/i;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    iget-object v2, p0, LA5/i;->a:Landroid/content/Context;

    invoke-virtual {v2, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    new-instance v3, LH5/e;

    iget-object v0, p0, LA5/i;->f:LI5/e;

    invoke-virtual {v0, p1}, LI5/e;->m(LA5/f;)LJ5/b;

    move-result-object v5

    const-string v0, "sharedPreferences"

    invoke-static {v6, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v7, Ljava/io/File;

    invoke-virtual {p0}, LA5/i;->a()Ljava/io/File;

    move-result-object v0

    const-string v1, "identify-intercept"

    invoke-direct {v7, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iget-object v4, p0, LA5/i;->d:Ljava/lang/String;

    iget-object v8, p1, LA5/f;->o:Lf5/d;

    invoke-direct/range {v3 .. v8}, LH5/e;-><init>(Ljava/lang/String;LJ5/b;Landroid/content/SharedPreferences;Ljava/io/File;Lf5/d;)V

    return-object v3
.end method

.method public i()LE6/m;
    .locals 0

    new-instance p0, LE6/m;

    invoke-direct {p0}, LE6/m;-><init>()V

    return-object p0
.end method

.method public j(DILcom/eightsleep/data_core/enums/TemperatureDisplaySetting;)Ljava/lang/String;
    .locals 0

    invoke-static {p0, p3, p4}, LGk/n;->y(LFa/d;ILcom/eightsleep/data_core/enums/TemperatureDisplaySetting;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public k()V
    .locals 0

    return-void
.end method

.method public l(Ll6/a;Landroid/content/Context;)V
    .locals 0

    const-string p0, "context"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 6

    new-instance v0, LDl/m;

    invoke-static {p4}, LDl/A0;->o(Lorg/json/JSONObject;)V

    const-string v4, "POST"

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    move-object v3, p4

    invoke-direct/range {v0 .. v5}, LDl/m;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    new-instance p0, LDl/n0;

    invoke-direct {p0}, LDl/n0;-><init>()V

    filled-new-array {v0}, [LDl/m;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public n(ILcom/eightsleep/data_core/enums/TemperatureDisplaySetting;)Ljava/lang/String;
    .locals 0

    invoke-static {p1, p2}, LGk/n;->P(ILcom/eightsleep/data_core/enums/TemperatureDisplaySetting;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public s(ILcom/eightsleep/data_core/enums/TemperatureDisplaySetting;)Ljava/lang/String;
    .locals 0

    invoke-static {p2}, LGk/n;->Q(Lcom/eightsleep/data_core/enums/TemperatureDisplaySetting;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
