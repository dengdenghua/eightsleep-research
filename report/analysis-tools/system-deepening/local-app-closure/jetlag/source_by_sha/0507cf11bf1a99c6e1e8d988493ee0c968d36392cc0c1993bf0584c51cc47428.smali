.class public final LS4/r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzo/l;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lzo/u0;


# direct methods
.method public synthetic constructor <init>(Lzo/u0;I)V
    .locals 0

    iput p2, p0, LS4/r;->a:I

    iput-object p1, p0, LS4/r;->b:Lzo/u0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final collect(Lzo/m;LLm/c;)Ljava/lang/Object;
    .locals 2

    iget v0, p0, LS4/r;->a:I

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ld9/E;

    const/16 v1, 0x13

    invoke-direct {v0, p1, v1}, Ld9/E;-><init>(Lzo/m;I)V

    iget-object p0, p0, LS4/r;->b:Lzo/u0;

    invoke-virtual {p0, v0, p2}, Lzo/u0;->collect(Lzo/m;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    if-ne p0, p1, :cond_0

    goto :goto_0

    :cond_0
    sget-object p0, LHm/B;->a:LHm/B;

    :goto_0
    return-object p0

    :pswitch_0
    new-instance v0, Ld9/E;

    const/16 v1, 0xd

    invoke-direct {v0, p1, v1}, Ld9/E;-><init>(Lzo/m;I)V

    iget-object p0, p0, LS4/r;->b:Lzo/u0;

    invoke-virtual {p0, v0, p2}, Lzo/u0;->collect(Lzo/m;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    if-ne p0, p1, :cond_1

    goto :goto_1

    :cond_1
    sget-object p0, LHm/B;->a:LHm/B;

    :goto_1
    return-object p0

    :pswitch_1
    new-instance v0, Ld9/E;

    const/16 v1, 0xc

    invoke-direct {v0, p1, v1}, Ld9/E;-><init>(Lzo/m;I)V

    iget-object p0, p0, LS4/r;->b:Lzo/u0;

    invoke-virtual {p0, v0, p2}, Lzo/u0;->collect(Lzo/m;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    if-ne p0, p1, :cond_2

    goto :goto_2

    :cond_2
    sget-object p0, LHm/B;->a:LHm/B;

    :goto_2
    return-object p0

    :pswitch_2
    new-instance v0, Ld9/E;

    const/4 v1, 0x7

    invoke-direct {v0, p1, v1}, Ld9/E;-><init>(Lzo/m;I)V

    iget-object p0, p0, LS4/r;->b:Lzo/u0;

    invoke-virtual {p0, v0, p2}, Lzo/u0;->collect(Lzo/m;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    if-ne p0, p1, :cond_3

    goto :goto_3

    :cond_3
    sget-object p0, LHm/B;->a:LHm/B;

    :goto_3
    return-object p0

    :pswitch_3
    new-instance v0, Ld9/E;

    const/4 v1, 0x6

    invoke-direct {v0, p1, v1}, Ld9/E;-><init>(Lzo/m;I)V

    iget-object p0, p0, LS4/r;->b:Lzo/u0;

    invoke-virtual {p0, v0, p2}, Lzo/u0;->collect(Lzo/m;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    if-ne p0, p1, :cond_4

    goto :goto_4

    :cond_4
    sget-object p0, LHm/B;->a:LHm/B;

    :goto_4
    return-object p0

    :pswitch_4
    new-instance v0, LJa/F;

    const/16 v1, 0x1c

    invoke-direct {v0, p1, v1}, LJa/F;-><init>(Lzo/m;I)V

    iget-object p0, p0, LS4/r;->b:Lzo/u0;

    invoke-virtual {p0, v0, p2}, Lzo/u0;->collect(Lzo/m;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    if-ne p0, p1, :cond_5

    goto :goto_5

    :cond_5
    sget-object p0, LHm/B;->a:LHm/B;

    :goto_5
    return-object p0

    :pswitch_5
    new-instance v0, LJa/F;

    const/16 v1, 0x19

    invoke-direct {v0, p1, v1}, LJa/F;-><init>(Lzo/m;I)V

    iget-object p0, p0, LS4/r;->b:Lzo/u0;

    invoke-virtual {p0, v0, p2}, Lzo/u0;->collect(Lzo/m;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    if-ne p0, p1, :cond_6

    goto :goto_6

    :cond_6
    sget-object p0, LHm/B;->a:LHm/B;

    :goto_6
    return-object p0

    :pswitch_6
    new-instance v0, LJa/F;

    const/16 v1, 0x15

    invoke-direct {v0, p1, v1}, LJa/F;-><init>(Lzo/m;I)V

    iget-object p0, p0, LS4/r;->b:Lzo/u0;

    invoke-virtual {p0, v0, p2}, Lzo/u0;->collect(Lzo/m;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    if-ne p0, p1, :cond_7

    goto :goto_7

    :cond_7
    sget-object p0, LHm/B;->a:LHm/B;

    :goto_7
    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
