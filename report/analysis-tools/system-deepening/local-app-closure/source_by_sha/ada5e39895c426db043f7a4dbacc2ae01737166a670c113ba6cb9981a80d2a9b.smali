.class public final synthetic Lgd/l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LVm/k;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;Ljava/lang/String;I)V
    .locals 0

    iput p3, p0, Lgd/l;->a:I

    iput-object p1, p0, Lgd/l;->b:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;

    iput-object p2, p0, Lgd/l;->c:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    iget v0, p0, Lgd/l;->a:I

    check-cast p1, Lya/e;

    packed-switch v0, :pswitch_data_0

    const-string v0, "e"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p1, p1, Lya/e;->b:Ljava/lang/Throwable;

    instance-of p1, p1, Lcom/eightsleep/data_temperature/exceptions/NapException$NoActiveNapException;

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    iget-object v0, p0, Lgd/l;->b:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;

    iget-object p0, p0, Lgd/l;->c:Ljava/lang/String;

    invoke-virtual {v0, p0, p1}, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->a(Ljava/lang/String;Lkd/f;)V

    :cond_0
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0

    :pswitch_0
    const-string v0, "e"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p1, p1, Lya/e;->b:Ljava/lang/Throwable;

    instance-of p1, p1, Lcom/eightsleep/data_temperature/exceptions/NapException$NoActiveNapException;

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    iget-object v0, p0, Lgd/l;->b:Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;

    iget-object p0, p0, Lgd/l;->c:Ljava/lang/String;

    invoke-virtual {v0, p0, p1}, Lcom/eightsleep/data_temperature/data/repository/NapModeRepository;->a(Ljava/lang/String;Lkd/f;)V

    :cond_1
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
