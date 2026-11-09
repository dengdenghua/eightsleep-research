.class public final Ljh/f;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Landroid/app/NotificationChannel;


# instance fields
.field public final a:LCo/c;

.field public final b:Lu5/e;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Landroid/app/NotificationChannel;

    const-string v1, "Default Channel"

    const/4 v2, 0x4

    const-string v3, "default_channel_id"

    invoke-direct {v0, v3, v1, v2}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    sput-object v0, Ljh/f;->c:Landroid/app/NotificationChannel;

    return-void
.end method

.method public constructor <init>(LCo/c;Lu5/e;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljh/f;->a:LCo/c;

    iput-object p2, p0, Ljh/f;->b:Lu5/e;

    return-void
.end method

.method public static b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)LP1/f;
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/eightsleep/presentation_notifications/receiver/AlarmNotificationBroadcastReceiver;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, p2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "com.eightsleep.data_home.receiver.AlarmId"

    invoke-virtual {v0, p2, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "com.eightsleep.data_home.receiver.NotificationId"

    invoke-virtual {v0, p2, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/high16 p2, 0xc000000

    invoke-static {p0, p3, v0, p2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    new-instance p2, LP1/f;

    const/4 p3, 0x0

    invoke-direct {p2, p3, p1, p0}, LP1/f;-><init>(Landroidx/core/graphics/drawable/IconCompat;Ljava/lang/String;Landroid/app/PendingIntent;)V

    return-object p2
.end method

.method public static c(ILjava/lang/String;Ljava/lang/String;)Landroid/net/Uri;
    .locals 2

    const-string v0, "code"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "eightapp://otp-consent"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "otpCode"

    invoke-virtual {v0, v1, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v0, "notificationId"

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    if-eqz p2, :cond_0

    const-string p1, "otpExpiresAt"

    invoke-virtual {p0, p1, p2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_0
    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    const-string p1, "build(...)"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method


# virtual methods
.method public final a(Ljava/util/Map;)V
    .locals 2

    const-string v0, "notificationId"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_0

    new-instance v0, Ljh/e;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Ljh/e;-><init>(Ljh/f;Ljava/lang/String;LLm/c;)V

    iget-object p0, p0, Ljh/f;->a:LCo/c;

    const/4 p1, 0x3

    invoke-static {p0, v1, v1, v0, p1}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    :cond_0
    return-void
.end method
