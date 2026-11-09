.class public final LFd/b;
.super LNm/c;
.source "SourceFile"


# instance fields
.field public a:LFd/f;

.field public synthetic b:Ljava/lang/Object;

.field public final synthetic c:LFd/f;

.field public d:I


# direct methods
.method public constructor <init>(LFd/f;LNm/c;)V
    .locals 0

    iput-object p1, p0, LFd/b;->c:LFd/f;

    invoke-direct {p0, p2}, LNm/c;-><init>(LLm/c;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    iput-object p1, p0, LFd/b;->b:Ljava/lang/Object;

    iget p1, p0, LFd/b;->d:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, LFd/b;->d:I

    iget-object p1, p0, LFd/b;->c:LFd/f;

    invoke-virtual {p1, p0}, LFd/f;->a(LNm/c;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
