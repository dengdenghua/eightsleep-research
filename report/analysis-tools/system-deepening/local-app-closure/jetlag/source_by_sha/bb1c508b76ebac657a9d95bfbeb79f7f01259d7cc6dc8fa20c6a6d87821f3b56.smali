.class public final Lcom/eightsleep/eight/push/EightJPushMessageReceiver;
.super Lcn/jpush/android/service/JPushMessageReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/eightsleep/eight/push/EightJPushMessageReceiver$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\t\u0008\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0005"
    }
    d2 = {
        "Lcom/eightsleep/eight/push/EightJPushMessageReceiver;",
        "Lcn/jpush/android/service/JPushMessageReceiver;",
        "<init>",
        "()V",
        "a",
        "com.eightsleep.eight-v1007063005_tencentRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcn/jpush/android/service/JPushMessageReceiver;-><init>()V

    return-void
.end method

.method public static a(Landroid/content/Context;)Lcom/eightsleep/eight/push/EightJPushMessageReceiver$a;
    .locals 1

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-string v0, "getApplicationContext(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, LP2/K;->A(Landroid/content/Context;)Landroid/app/Application;

    move-result-object p0

    const-class v0, Lcom/eightsleep/eight/push/EightJPushMessageReceiver$a;

    invoke-static {v0, p0}, LP2/o;->C(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/eightsleep/eight/push/EightJPushMessageReceiver$a;

    return-object p0
.end method

.method public static b(Ljava/lang/String;)Ljava/util/Map;
    .locals 5

    sget-object v0, LIm/A;->a:LIm/A;

    if-eqz p0, :cond_2

    invoke-static {p0}, Llo/n;->q0(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_2

    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    new-instance p0, LJm/g;

    invoke-direct {p0}, LJm/g;-><init>()V

    invoke-virtual {v1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v2

    const-string v3, "keys(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lkotlin/jvm/internal/l;->g(Ljava/lang/Object;)V

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, LJm/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, LJm/g;->b()LJm/g;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :goto_1
    sget-object v1, Ltimber/log/Timber;->a:Lbr/a;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "Failed to parse JPush extras"

    invoke-virtual {v1, v3, p0, v2}, Lbr/a;->c(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    :cond_2
    :goto_2
    return-object v0
.end method


# virtual methods
.method public final onMessage(Landroid/content/Context;Lcn/jpush/android/api/CustomMessage;)V
    .locals 17

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    const-string v2, "context"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "customMessage"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-super/range {p0 .. p2}, Lcn/jpush/android/service/JPushMessageReceiver;->onMessage(Landroid/content/Context;Lcn/jpush/android/api/CustomMessage;)V

    sget-object v2, Ltimber/log/Timber;->a:Lbr/a;

    iget-object v3, v1, Lcn/jpush/android/api/CustomMessage;->messageId:Ljava/lang/String;

    const-string v4, "JPush onMessage messageId="

    invoke-static {v4, v3}, LB/h;->k(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v6, 0x0

    new-array v4, v6, [Ljava/lang/Object;

    invoke-virtual {v2, v3, v4}, Lbr/a;->f(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, v1, Lcn/jpush/android/api/CustomMessage;->extra:Ljava/lang/String;

    invoke-static {v1}, Lcom/eightsleep/eight/push/EightJPushMessageReceiver;->b(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    invoke-static {v0}, Lcom/eightsleep/eight/push/EightJPushMessageReceiver;->a(Landroid/content/Context;)Lcom/eightsleep/eight/push/EightJPushMessageReceiver$a;

    move-result-object v3

    check-cast v3, Lce/l;

    iget-object v3, v3, Lce/l;->u0:Lim/d;

    invoke-interface {v3}, LGm/a;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljh/f;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    long-to-int v5, v4

    invoke-virtual {v3, v1}, Ljh/f;->a(Ljava/util/Map;)V

    const-string v3, "notificationType"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const-string v4, "otp-verify"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    const-string v7, "NotificationManager is null"

    const-class v8, Landroid/app/NotificationManager;

    const-string v11, "com.eightsleep.eight.MainActivity"

    const-string v12, "android.intent.action.VIEW"

    const-string v13, "body"

    const-string v14, "title"

    const-string v15, "getString(...)"

    if-eqz v3, :cond_5

    const-string v3, "otpCode"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v9, v16

    check-cast v9, Ljava/lang/String;

    if-eqz v9, :cond_0

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v16

    if-nez v16, :cond_1

    :cond_0
    move v3, v6

    goto/16 :goto_0

    :cond_1
    invoke-interface {v1, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    if-nez v14, :cond_2

    const v14, 0x7f1211ca

    invoke-virtual {v0, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14, v15}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_2
    invoke-interface {v1, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    if-nez v13, :cond_3

    const-string v13, "message"

    invoke-interface {v1, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    if-nez v13, :cond_3

    const v13, 0x7f1211d0

    invoke-virtual {v0, v13}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13, v15}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_3
    new-instance v15, Landroid/content/Intent;

    const-class v6, Lcom/eightsleep/presentation_notifications/receiver/OtpVerifyBroadcastReceiver;

    invoke-direct {v15, v0, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v6, "com.eightsleep.eight.OTP_VERIFY"

    invoke-virtual {v15, v6}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v15, v3, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v3, "com.eightsleep.data_home.receiver.NotificationId"

    invoke-virtual {v15, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v4, "otp-verify-"

    invoke-direct {v6, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v4

    const/high16 v6, 0xc000000

    invoke-static {v0, v4, v15, v6}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    new-instance v15, Landroid/content/Intent;

    const-class v10, Lcom/eightsleep/presentation_notifications/receiver/OtpDeclineBroadcastReceiver;

    invoke-direct {v15, v0, v10}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v10, "com.eightsleep.eight.OTP_DECLINE"

    invoke-virtual {v15, v10}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v15, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v10, "otp-decline-"

    invoke-direct {v3, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    invoke-static {v0, v3, v15, v6}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    const-string v10, "otpExpiresAt"

    invoke-interface {v1, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v5, v9, v1}, Ljh/f;->c(ILjava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    new-instance v9, Landroid/content/Intent;

    invoke-direct {v9, v12, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v9, v0, v11}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0x30000000

    invoke-virtual {v9, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v10, "otp-consent-"

    invoke-direct {v1, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    invoke-static {v0, v1, v9, v6}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    new-instance v6, LP1/l;

    const-string v9, "otp_verify_channel_id"

    invoke-direct {v6, v0, v9}, LP1/l;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v10, v6, LP1/l;->w:Landroid/app/Notification;

    const v11, 0x7f08021b

    iput v11, v10, Landroid/app/Notification;->icon:I

    invoke-static {v14}, LP1/l;->b(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v10

    iput-object v10, v6, LP1/l;->e:Ljava/lang/CharSequence;

    invoke-static {v13}, LP1/l;->b(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v10

    iput-object v10, v6, LP1/l;->f:Ljava/lang/CharSequence;

    const/4 v10, 0x1

    iput v10, v6, LP1/l;->j:I

    const-string v11, "msg"

    iput-object v11, v6, LP1/l;->q:Ljava/lang/String;

    const/4 v11, 0x0

    iput v11, v6, LP1/l;->t:I

    const/16 v11, 0x10

    invoke-virtual {v6, v11, v10}, LP1/l;->d(IZ)V

    iput-object v1, v6, LP1/l;->g:Landroid/app/PendingIntent;

    new-instance v1, LP1/f;

    const v10, 0x7f120356

    invoke-virtual {v0, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    invoke-direct {v1, v11, v10, v4}, LP1/f;-><init>(Landroidx/core/graphics/drawable/IconCompat;Ljava/lang/String;Landroid/app/PendingIntent;)V

    iget-object v4, v6, LP1/l;->b:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, LP1/f;

    const v4, 0x7f12037e

    invoke-virtual {v0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v11, v4, v3}, LP1/f;-><init>(Landroidx/core/graphics/drawable/IconCompat;Ljava/lang/String;Landroid/app/PendingIntent;)V

    iget-object v3, v6, LP1/l;->b:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Landroid/app/NotificationChannel;

    const v3, 0x7f1211cf

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x4

    invoke-direct {v1, v9, v3, v4}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    invoke-static {v0, v8}, LQ1/a;->getSystemService(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    if-eqz v0, :cond_4

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    invoke-virtual {v6}, LP1/l;->a()Landroid/app/Notification;

    move-result-object v1

    invoke-virtual {v0, v5, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void

    :cond_4
    const/4 v3, 0x0

    new-array v0, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v7, v0}, Lbr/a;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :goto_0
    const-string v0, "otp-verify push missing otpCode; dropping"

    new-array v1, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v1}, Lbr/a;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_5
    move v3, v6

    const/4 v4, 0x0

    const/4 v10, 0x1

    invoke-interface {v1, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    if-nez v6, :cond_6

    const-string v0, "JPush pass-through message had no renderable payload; dropped"

    new-array v1, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v1}, Lbr/a;->f(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_6
    invoke-interface {v1, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Ljava/lang/String;

    const-string v2, "path"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Ljava/lang/String;

    const-string v2, "uri"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Ljava/lang/String;

    const-string v2, "alarmId"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_7

    const v2, 0x7f1200c8

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v15}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "-snooze"

    invoke-virtual {v1, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    move-object v4, v1

    move-object v1, v2

    const-string v2, "com.eightsleep.eight.SNOOZE_ALARM"

    invoke-static/range {v0 .. v5}, Ljh/f;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)LP1/f;

    move-result-object v1

    const v2, 0x7f1200c7

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v15}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "-dismiss"

    invoke-virtual {v4, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    move-object v15, v1

    move-object v1, v2

    const-string v2, "com.eightsleep.eight.DISMISS_ALARM"

    invoke-static/range {v0 .. v5}, Ljh/f;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)LP1/f;

    move-result-object v1

    filled-new-array {v15, v1}, [LP1/f;

    move-result-object v1

    invoke-static {v1}, LIm/s;->g0([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    :cond_7
    if-nez v13, :cond_8

    move-object v13, v14

    :cond_8
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    invoke-virtual {v1, v0, v11}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v2, 0x4000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    if-eqz v13, :cond_9

    new-instance v2, LP1/x;

    invoke-direct {v2, v0}, LP1/x;-><init>(Landroid/content/Context;)V

    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    invoke-virtual {v3, v12}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {v13}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    invoke-virtual {v3, v11}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    invoke-virtual {v2, v3}, LP1/x;->c(Landroid/content/Intent;)V

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, LP1/x;->g(I)Landroid/app/PendingIntent;

    move-result-object v2

    if-nez v2, :cond_a

    goto :goto_1

    :cond_9
    const/4 v3, 0x0

    :goto_1
    const/high16 v2, 0x44000000    # 512.0f

    invoke-static {v0, v3, v1, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    :cond_a
    new-instance v1, LP1/l;

    sget-object v3, Ljh/f;->c:Landroid/app/NotificationChannel;

    invoke-virtual {v3}, Landroid/app/NotificationChannel;->getId()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v1, v0, v11}, LP1/l;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v11, v1, LP1/l;->w:Landroid/app/Notification;

    const v12, 0x7f08021b

    iput v12, v11, Landroid/app/Notification;->icon:I

    const/16 v11, 0x10

    invoke-virtual {v1, v11, v10}, LP1/l;->d(IZ)V

    const/4 v11, -0x1

    invoke-virtual {v1, v11}, LP1/l;->c(I)V

    iput v10, v1, LP1/l;->j:I

    const/4 v11, 0x0

    iput-boolean v11, v1, LP1/l;->v:Z

    invoke-static {v6}, LP1/l;->b(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v6

    iput-object v6, v1, LP1/l;->e:Ljava/lang/CharSequence;

    invoke-static {v9}, LP1/l;->b(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v6

    iput-object v6, v1, LP1/l;->f:Ljava/lang/CharSequence;

    new-instance v6, LP1/j;

    invoke-direct {v6}, LP1/m;-><init>()V

    invoke-static {v9}, LP1/l;->b(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v9

    iput-object v9, v6, LP1/j;->d:Ljava/lang/CharSequence;

    invoke-virtual {v1, v6}, LP1/l;->e(LP1/m;)V

    iput-object v2, v1, LP1/l;->g:Landroid/app/PendingIntent;

    if-eqz v4, :cond_c

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_b
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, LP1/f;

    if-eqz v4, :cond_b

    iget-object v6, v1, LP1/l;->b:Ljava/util/ArrayList;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_c
    invoke-static {v0, v8}, LQ1/a;->getSystemService(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    if-eqz v0, :cond_d

    invoke-virtual {v0, v3}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    invoke-virtual {v1}, LP1/l;->a()Landroid/app/Notification;

    move-result-object v1

    invoke-virtual {v0, v5, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void

    :cond_d
    sget-object v0, Ltimber/log/Timber;->a:Lbr/a;

    const/4 v3, 0x0

    new-array v1, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v7, v1}, Lbr/a;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public final onNotifyMessageArrived(Landroid/content/Context;Lcn/jpush/android/api/NotificationMessage;)V
    .locals 2

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "message"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-super {p0, p1, p2}, Lcn/jpush/android/service/JPushMessageReceiver;->onNotifyMessageArrived(Landroid/content/Context;Lcn/jpush/android/api/NotificationMessage;)V

    sget-object p0, Ltimber/log/Timber;->a:Lbr/a;

    iget-object v0, p2, Lcn/jpush/android/api/NotificationMessage;->msgId:Ljava/lang/String;

    const-string v1, "JPush onNotifyMessageArrived msgId="

    invoke-static {v1, v0}, LB/h;->k(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p0, v0, v1}, Lbr/a;->f(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {p1}, Lcom/eightsleep/eight/push/EightJPushMessageReceiver;->a(Landroid/content/Context;)Lcom/eightsleep/eight/push/EightJPushMessageReceiver$a;

    move-result-object p0

    check-cast p0, Lce/l;

    iget-object p0, p0, Lce/l;->u0:Lim/d;

    invoke-interface {p0}, LGm/a;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljh/f;

    iget-object p1, p2, Lcn/jpush/android/api/NotificationMessage;->notificationExtras:Ljava/lang/String;

    invoke-static {p1}, Lcom/eightsleep/eight/push/EightJPushMessageReceiver;->b(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljh/f;->a(Ljava/util/Map;)V

    return-void
.end method

.method public final onNotifyMessageOpened(Landroid/content/Context;Lcn/jpush/android/api/NotificationMessage;)V
    .locals 4

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "message"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-super {p0, p1, p2}, Lcn/jpush/android/service/JPushMessageReceiver;->onNotifyMessageOpened(Landroid/content/Context;Lcn/jpush/android/api/NotificationMessage;)V

    sget-object p0, Ltimber/log/Timber;->a:Lbr/a;

    iget-object v0, p2, Lcn/jpush/android/api/NotificationMessage;->notificationTitle:Ljava/lang/String;

    const-string v1, "JPush notification opened: "

    invoke-static {v1, v0}, LB/h;->k(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Object;

    invoke-virtual {p0, v0, v2}, Lbr/a;->f(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p2, Lcn/jpush/android/api/NotificationMessage;->notificationExtras:Ljava/lang/String;

    invoke-static {v0}, Lcom/eightsleep/eight/push/EightJPushMessageReceiver;->b(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    const-string v2, "notificationType"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "otp-verify"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/l;->e(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v2, "otpCode"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/eightsleep/eight/push/EightJPushMessageReceiver;->a(Landroid/content/Context;)Lcom/eightsleep/eight/push/EightJPushMessageReceiver$a;

    move-result-object p0

    check-cast p0, Lce/l;

    iget-object p0, p0, Lce/l;->u0:Lim/d;

    invoke-interface {p0}, LGm/a;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljh/f;

    iget p2, p2, Lcn/jpush/android/api/NotificationMessage;->notificationId:I

    const-string v3, "otpExpiresAt"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p2, v2, v0}, Ljh/f;->c(ILjava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    :cond_1
    :goto_0
    const-string p1, "otp-verify notification opened without otpCode; ignoring"

    new-array p2, v1, [Ljava/lang/Object;

    invoke-virtual {p0, p1, p2}, Lbr/a;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_2
    const-string p0, "path"

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-nez p0, :cond_3

    const-string p0, "uri"

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    :cond_3
    :goto_1
    if-eqz p0, :cond_4

    new-instance p2, LP1/x;

    invoke-direct {p2, p1}, LP1/x;-><init>(Landroid/content/Context;)V

    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string v0, "android.intent.action.VIEW"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    invoke-virtual {p2, p1}, LP1/x;->c(Landroid/content/Intent;)V

    invoke-virtual {p2, v1}, LP1/x;->g(I)Landroid/app/PendingIntent;

    move-result-object p0

    if-eqz p0, :cond_6

    invoke-virtual {p0}, Landroid/app/PendingIntent;->send()V

    return-void

    :cond_4
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    if-eqz p0, :cond_5

    const/high16 p2, 0x10000000

    invoke-virtual {p0, p2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    goto :goto_2

    :cond_5
    const/4 p0, 0x0

    :goto_2
    if-eqz p0, :cond_6

    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_6
    return-void
.end method

.method public final onRegister(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "registrationId"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-super {p0, p1, p2}, Lcn/jpush/android/service/JPushMessageReceiver;->onRegister(Landroid/content/Context;Ljava/lang/String;)V

    sget-object p0, Ltimber/log/Timber;->a:Lbr/a;

    const-string v0, "JPush onRegister regId="

    invoke-virtual {v0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p0, v0, v1}, Lbr/a;->f(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {p1}, Lcom/eightsleep/eight/push/EightJPushMessageReceiver;->a(Landroid/content/Context;)Lcom/eightsleep/eight/push/EightJPushMessageReceiver$a;

    move-result-object p0

    check-cast p0, Lce/l;

    invoke-virtual {p0}, Lce/l;->R2()LCo/c;

    move-result-object p1

    new-instance v0, Lcom/eightsleep/eight/push/a;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p2, v1}, Lcom/eightsleep/eight/push/a;-><init>(Lce/l;Ljava/lang/String;LLm/c;)V

    const/4 p0, 0x3

    invoke-static {p1, v1, v1, v0, p0}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    return-void
.end method
