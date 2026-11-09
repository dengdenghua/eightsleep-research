.class public final synthetic Lmg/g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LVm/a;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(II)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lmg/g;->a:I

    iput p2, p0, Lmg/g;->b:I

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    iget v0, p0, Lmg/g;->a:I

    int-to-float v0, v0

    iget p0, p0, Lmg/g;->b:I

    int-to-float p0, p0

    div-float/2addr v0, p0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0
.end method
