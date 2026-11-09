.class public final Lyc/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LIl/e;


# instance fields
.field public final synthetic a:I

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x3

    iput v0, p0, Lyc/d;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(LD4/Q;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lyc/d;->a:I

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lyc/d;->b:Ljava/lang/Object;

    .line 14
    new-instance p1, LC/a2;

    invoke-direct {p1}, LC/a2;-><init>()V

    iput-object p1, p0, Lyc/d;->c:Ljava/lang/Object;

    .line 15
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lyc/d;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/content/res/TypedArray;)V
    .locals 1

    const/16 v0, 0x9

    iput v0, p0, Lyc/d;->a:I

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lyc/d;->b:Ljava/lang/Object;

    .line 18
    iput-object p2, p0, Lyc/d;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/eightsleep/eight/AppDatabase_Impl;)V
    .locals 2

    const/4 v0, 0x0

    iput v0, p0, Lyc/d;->a:I

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    iput-object p1, p0, Lyc/d;->b:Ljava/lang/Object;

    .line 5
    new-instance v0, LJd/a;

    const/16 v1, 0x18

    invoke-direct {v0, p0, p1, v1}, LJd/a;-><init>(Ljava/lang/Object;Lcom/eightsleep/eight/AppDatabase_Impl;I)V

    iput-object v0, p0, Lyc/d;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lio/sentry/android/replay/capture/b;Lio/sentry/android/replay/capture/b;)V
    .locals 1

    const/4 v0, 0x7

    iput v0, p0, Lyc/d;->a:I

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lyc/d;->c:Ljava/lang/Object;

    iput-object p2, p0, Lyc/d;->d:Ljava/lang/Object;

    .line 25
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lyc/d;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0

    .line 2
    iput p4, p0, Lyc/d;->a:I

    iput-object p1, p0, Lyc/d;->b:Ljava/lang/Object;

    iput-object p2, p0, Lyc/d;->c:Ljava/lang/Object;

    iput-object p3, p0, Lyc/d;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Runnable;)V
    .locals 1

    const/4 v0, 0x5

    iput v0, p0, Lyc/d;->a:I

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lyc/d;->c:Ljava/lang/Object;

    .line 21
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lyc/d;->d:Ljava/lang/Object;

    .line 22
    iput-object p1, p0, Lyc/d;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lm0/u0;)V
    .locals 2

    const/16 v0, 0x8

    iput v0, p0, Lyc/d;->a:I

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    new-instance v0, Lu0/a;

    const/4 v1, 0x0

    .line 8
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 9
    iput-object v0, p0, Lyc/d;->b:Ljava/lang/Object;

    .line 10
    new-instance v0, LJd/n;

    invoke-direct {v0}, LJd/n;-><init>()V

    iput-object v0, p0, Lyc/d;->c:Ljava/lang/Object;

    .line 11
    new-instance v0, Lgf/b;

    const/4 v1, 0x6

    invoke-direct {v0, v1, p0, p1}, Lgf/b;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, p0, Lyc/d;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lo1/F;Lyc/d;)V
    .locals 1

    const/16 v0, 0xa

    iput v0, p0, Lyc/d;->a:I

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lyc/d;->b:Ljava/lang/Object;

    .line 28
    iput-object p2, p0, Lyc/d;->c:Ljava/lang/Object;

    .line 29
    invoke-interface {p1}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lyc/d;->d:Ljava/lang/Object;

    return-void
.end method

.method public static d(Lyc/d;)Lxc/g;
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lyc/d;->d:Ljava/lang/Object;

    check-cast v0, Lxc/g;

    if-nez v0, :cond_0

    iget-object v0, p0, Lyc/d;->b:Ljava/lang/Object;

    check-cast v0, Lcom/eightsleep/eight/AppDatabase_Impl;

    const-class v1, Lxc/g;

    iget-object v0, v0, LE4/t;->l:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lxc/g;

    iput-object v0, p0, Lyc/d;->d:Ljava/lang/Object;

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :cond_0
    :goto_0
    iget-object v0, p0, Lyc/d;->d:Ljava/lang/Object;

    check-cast v0, Lxc/g;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public static w(Landroid/content/Context;Landroid/util/AttributeSet;[II)Lyc/d;
    .locals 2

    new-instance v0, Lyc/d;

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Lyc/d;-><init>(Landroid/content/Context;Landroid/content/res/TypedArray;)V

    return-object v0
.end method


# virtual methods
.method public A(Ljava/lang/String;)V
    .locals 0

    if-eqz p1, :cond_0

    iput-object p1, p0, Lyc/d;->b:Ljava/lang/Object;

    return-void

    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    const-string p1, "Null backendName"

    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public B(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lyc/d;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p0, p0, Lyc/d;->b:Ljava/lang/Object;

    check-cast p0, LD4/Q;

    invoke-static {p1}, Landroidx/recyclerview/widget/RecyclerView;->K(Landroid/view/View;)LD4/s0;

    move-result-object p1

    if-eqz p1, :cond_1

    iget v0, p1, LD4/s0;->p:I

    iget-object p0, p0, LD4/Q;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->N()Z

    move-result v1

    if-eqz v1, :cond_0

    iput v0, p1, LD4/s0;->q:I

    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->P0:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    sget-object p0, Lc2/G;->a:Ljava/util/WeakHashMap;

    iget-object p0, p1, LD4/s0;->a:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroid/view/View;->setImportantForAccessibility(I)V

    :goto_0
    const/4 p0, 0x0

    iput p0, p1, LD4/s0;->p:I

    :cond_1
    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 1

    new-instance v0, LIl/a;

    invoke-direct {v0, p0, p1}, LIl/a;-><init>(Lyc/d;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lyc/d;->i(Ljava/lang/Runnable;)V

    return-void
.end method

.method public b(Ljava/lang/String;LIl/k;)V
    .locals 2

    new-instance v0, LA3/C;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, p2, v1}, LA3/C;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    invoke-virtual {p0, v0}, Lyc/d;->i(Ljava/lang/Runnable;)V

    return-void
.end method

.method public c(Ljava/lang/Exception;)V
    .locals 2

    new-instance v0, LA3/M;

    const/16 v1, 0x9

    invoke-direct {v0, v1, p0, p1}, LA3/M;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lyc/d;->i(Ljava/lang/Runnable;)V

    return-void
.end method

.method public e(Landroid/view/View;IZ)V
    .locals 2

    iget-object v0, p0, Lyc/d;->b:Ljava/lang/Object;

    check-cast v0, LD4/Q;

    iget-object v0, v0, LD4/Q;->a:Landroidx/recyclerview/widget/RecyclerView;

    if-gez p2, :cond_0

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p2

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p2}, Lyc/d;->p(I)I

    move-result p2

    :goto_0
    iget-object v1, p0, Lyc/d;->c:Ljava/lang/Object;

    check-cast v1, LC/a2;

    invoke-virtual {v1, p2, p3}, LC/a2;->t(IZ)V

    if-eqz p3, :cond_1

    invoke-virtual {p0, p1}, Lyc/d;->t(Landroid/view/View;)V

    :cond_1
    invoke-virtual {v0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    invoke-static {p1}, Landroidx/recyclerview/widget/RecyclerView;->K(Landroid/view/View;)LD4/s0;

    move-result-object p0

    iget-object p1, v0, Landroidx/recyclerview/widget/RecyclerView;->m:LD4/U;

    if-eqz p1, :cond_2

    if-eqz p0, :cond_2

    invoke-virtual {p1, p0}, LD4/U;->f(LD4/s0;)V

    :cond_2
    iget-object p0, v0, Landroidx/recyclerview/widget/RecyclerView;->C:Ljava/util/ArrayList;

    if-eqz p0, :cond_3

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    add-int/lit8 p0, p0, -0x1

    :goto_1
    if-ltz p0, :cond_3

    iget-object p1, v0, Landroidx/recyclerview/widget/RecyclerView;->C:Ljava/util/ArrayList;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, LD4/C;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    add-int/lit8 p0, p0, -0x1

    goto :goto_1

    :cond_3
    return-void
.end method

.method public f(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)V
    .locals 2

    iget-object v0, p0, Lyc/d;->b:Ljava/lang/Object;

    check-cast v0, LD4/Q;

    iget-object v0, v0, LD4/Q;->a:Landroidx/recyclerview/widget/RecyclerView;

    if-gez p2, :cond_0

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p2

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p2}, Lyc/d;->p(I)I

    move-result p2

    :goto_0
    iget-object v1, p0, Lyc/d;->c:Ljava/lang/Object;

    check-cast v1, LC/a2;

    invoke-virtual {v1, p2, p4}, LC/a2;->t(IZ)V

    if-eqz p4, :cond_1

    invoke-virtual {p0, p1}, Lyc/d;->t(Landroid/view/View;)V

    :cond_1
    invoke-static {p1}, Landroidx/recyclerview/widget/RecyclerView;->K(Landroid/view/View;)LD4/s0;

    move-result-object p0

    if-eqz p0, :cond_4

    invoke-virtual {p0}, LD4/s0;->k()Z

    move-result p4

    if-nez p4, :cond_3

    invoke-virtual {p0}, LD4/s0;->p()Z

    move-result p4

    if-eqz p4, :cond_2

    goto :goto_1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "Called attach on a child which is not detached: "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->A()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    :goto_1
    iget p4, p0, LD4/s0;->j:I

    and-int/lit16 p4, p4, -0x101

    iput p4, p0, LD4/s0;->j:I

    :cond_4
    invoke-static {v0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView;->a(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public g()LKj/j;
    .locals 3

    iget-object v0, p0, Lyc/d;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, " backendName"

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    iget-object v1, p0, Lyc/d;->d:Ljava/lang/Object;

    check-cast v1, LHj/c;

    if-nez v1, :cond_1

    const-string v1, " priority"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v0, LKj/j;

    iget-object v1, p0, Lyc/d;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lyc/d;->c:Ljava/lang/Object;

    check-cast v2, [B

    iget-object p0, p0, Lyc/d;->d:Ljava/lang/Object;

    check-cast p0, LHj/c;

    invoke-direct {v0, v1, v2, p0}, LKj/j;-><init>(Ljava/lang/String;[BLHj/c;)V

    return-object v0

    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v1, "Missing required properties:"

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public h(I)V
    .locals 3

    invoke-virtual {p0, p1}, Lyc/d;->p(I)I

    move-result p1

    iget-object v0, p0, Lyc/d;->c:Ljava/lang/Object;

    check-cast v0, LC/a2;

    invoke-virtual {v0, p1}, LC/a2;->v(I)Z

    iget-object p0, p0, Lyc/d;->b:Ljava/lang/Object;

    check-cast p0, LD4/Q;

    iget-object p0, p0, LD4/Q;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-static {v0}, Landroidx/recyclerview/widget/RecyclerView;->K(Landroid/view/View;)LD4/s0;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, LD4/s0;->k()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, LD4/s0;->p()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "called detach on an already detached child "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->A()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    const/16 v1, 0x100

    invoke-virtual {v0, v1}, LD4/s0;->a(I)V

    :cond_2
    invoke-static {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->c(Landroidx/recyclerview/widget/RecyclerView;I)V

    return-void
.end method

.method public i(Ljava/lang/Runnable;)V
    .locals 3

    iget-object v0, p0, Lyc/d;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/ExecutorService;

    new-instance v1, LA3/M;

    const/16 v2, 0x8

    invoke-direct {v1, v2, p0, p1}, LA3/M;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public j(I)Landroid/view/View;
    .locals 0

    invoke-virtual {p0, p1}, Lyc/d;->p(I)I

    move-result p1

    iget-object p0, p0, Lyc/d;->b:Ljava/lang/Object;

    check-cast p0, LD4/Q;

    iget-object p0, p0, LD4/Q;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public k()I
    .locals 1

    iget-object v0, p0, Lyc/d;->b:Ljava/lang/Object;

    check-cast v0, LD4/Q;

    iget-object v0, v0, LD4/Q;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    iget-object p0, p0, Lyc/d;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    sub-int/2addr v0, p0

    return v0
.end method

.method public l(I)Landroid/content/res/ColorStateList;
    .locals 2

    iget-object v0, p0, Lyc/d;->c:Ljava/lang/Object;

    check-cast v0, Landroid/content/res/TypedArray;

    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    if-eqz v1, :cond_0

    iget-object p0, p0, Lyc/d;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-static {p0, v1}, LQ1/a;->getColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_0

    return-object p0

    :cond_0
    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0
.end method

.method public m(I)Landroid/graphics/drawable/Drawable;
    .locals 2

    iget-object v0, p0, Lyc/d;->c:Ljava/lang/Object;

    check-cast v0, Landroid/content/res/TypedArray;

    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    if-eqz v1, :cond_0

    iget-object p0, p0, Lyc/d;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-static {p0, v1}, LIm/G;->D(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :cond_0
    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public n(I)Landroid/graphics/drawable/Drawable;
    .locals 3

    iget-object v0, p0, Lyc/d;->c:Ljava/lang/Object;

    check-cast v0, Landroid/content/res/TypedArray;

    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lyc/d;->c:Ljava/lang/Object;

    check-cast v0, Landroid/content/res/TypedArray;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {}, Lp/r;->a()Lp/r;

    move-result-object v0

    iget-object p0, p0, Lyc/d;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    monitor-enter v0

    :try_start_0
    iget-object v1, v0, Lp/r;->a:Lp/F0;

    const/4 v2, 0x1

    invoke-virtual {v1, p0, p1, v2}, Lp/F0;->d(Landroid/content/Context;IZ)Landroid/graphics/drawable/Drawable;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public o(IILp/O;)Landroid/graphics/Typeface;
    .locals 9

    iget-object v0, p0, Lyc/d;->c:Ljava/lang/Object;

    check-cast v0, Landroid/content/res/TypedArray;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    if-nez v3, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lyc/d;->d:Ljava/lang/Object;

    check-cast p1, Landroid/util/TypedValue;

    if-nez p1, :cond_1

    new-instance p1, Landroid/util/TypedValue;

    invoke-direct {p1}, Landroid/util/TypedValue;-><init>()V

    iput-object p1, p0, Lyc/d;->d:Ljava/lang/Object;

    :cond_1
    iget-object p1, p0, Lyc/d;->d:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Landroid/util/TypedValue;

    sget-object p1, LR1/k;->a:Ljava/lang/ThreadLocal;

    iget-object p0, p0, Lyc/d;->b:Ljava/lang/Object;

    move-object v2, p0

    check-cast v2, Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->isRestricted()Z

    move-result p0

    if-eqz p0, :cond_2

    :goto_0
    const/4 p0, 0x0

    return-object p0

    :cond_2
    const/4 v8, 0x0

    const/4 v7, 0x1

    move v5, p2

    move-object v6, p3

    invoke-static/range {v2 .. v8}, LR1/k;->b(Landroid/content/Context;ILandroid/util/TypedValue;ILR1/b;ZZ)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method

.method public p(I)I
    .locals 5

    const/4 v0, -0x1

    if-gez p1, :cond_0

    return v0

    :cond_0
    iget-object v1, p0, Lyc/d;->b:Ljava/lang/Object;

    check-cast v1, LD4/Q;

    iget-object v1, v1, LD4/Q;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    move v2, p1

    :goto_0
    if-ge v2, v1, :cond_3

    iget-object v3, p0, Lyc/d;->c:Ljava/lang/Object;

    check-cast v3, LC/a2;

    invoke-virtual {v3, v2}, LC/a2;->p(I)I

    move-result v4

    sub-int v4, v2, v4

    sub-int v4, p1, v4

    if-nez v4, :cond_2

    :goto_1
    invoke-virtual {v3, v2}, LC/a2;->s(I)Z

    move-result p0

    if-eqz p0, :cond_1

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_1
    return v2

    :cond_2
    add-int/2addr v2, v4

    goto :goto_0

    :cond_3
    return v0
.end method

.method public q(I)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lyc/d;->b:Ljava/lang/Object;

    check-cast p0, LD4/Q;

    iget-object p0, p0, LD4/Q;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public r()I
    .locals 0

    iget-object p0, p0, Lyc/d;->b:Ljava/lang/Object;

    check-cast p0, LD4/Q;

    iget-object p0, p0, LD4/Q;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p0

    return p0
.end method

.method public s(Ljava/lang/Exception;)V
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Caught unexpected error from EventHandler: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lyc/d;->d:Ljava/lang/Object;

    check-cast v1, LJl/e;

    invoke-virtual {v1, v0}, LJl/e;->g(Ljava/lang/String;)V

    new-instance v0, Lu5/e;

    const/16 v2, 0x18

    invoke-direct {v0, p1, v2}, Lu5/e;-><init>(Ljava/lang/Object;I)V

    const-string v2, "Stack trace: {}"

    invoke-virtual {v1, v0, v2}, LJl/e;->b(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lyc/d;->y(Ljava/lang/Exception;)V

    return-void
.end method

.method public t(Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Lyc/d;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Lyc/d;->b:Ljava/lang/Object;

    check-cast p0, LD4/Q;

    invoke-static {p1}, Landroidx/recyclerview/widget/RecyclerView;->K(Landroid/view/View;)LD4/s0;

    move-result-object p1

    if-eqz p1, :cond_2

    iget v0, p1, LD4/s0;->q:I

    const/4 v1, -0x1

    iget-object v2, p1, LD4/s0;->a:Landroid/view/View;

    if-eq v0, v1, :cond_0

    iput v0, p1, LD4/s0;->p:I

    goto :goto_0

    :cond_0
    sget-object v0, Lc2/G;->a:Ljava/util/WeakHashMap;

    invoke-virtual {v2}, Landroid/view/View;->getImportantForAccessibility()I

    move-result v0

    iput v0, p1, LD4/s0;->p:I

    :goto_0
    iget-object p0, p0, LD4/Q;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->N()Z

    move-result v0

    const/4 v1, 0x4

    if-eqz v0, :cond_1

    iput v1, p1, LD4/s0;->q:I

    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->P0:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_1
    sget-object p0, Lc2/G;->a:Ljava/util/WeakHashMap;

    invoke-virtual {v2, v1}, Landroid/view/View;->setImportantForAccessibility(I)V

    :cond_2
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    iget v0, p0, Lyc/d;->a:I

    packed-switch v0, :pswitch_data_0

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lyc/d;->c:Ljava/lang/Object;

    check-cast v1, LC/a2;

    invoke-virtual {v1}, LC/a2;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", hidden list:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lyc/d;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public u(Ljava/lang/String;LNm/c;)Ljava/lang/Object;
    .locals 12

    instance-of v0, p2, Lhc/x;

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, Lhc/x;

    iget v1, v0, Lhc/x;->g:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lhc/x;->g:I

    goto :goto_0

    :cond_0
    new-instance v0, Lhc/x;

    invoke-direct {v0, p0, p2}, Lhc/x;-><init>(Lyc/d;LNm/c;)V

    :goto_0
    iget-object p2, v0, Lhc/x;->e:Ljava/lang/Object;

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, v0, Lhc/x;->g:I

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v2, :cond_4

    if-eq v2, v5, :cond_3

    if-eq v2, v4, :cond_2

    if-ne v2, v3, :cond_1

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    return-object p2

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    iget-object p0, v0, Lhc/x;->d:Lzo/l;

    check-cast p0, Lzo/l;

    iget-object p1, v0, Lhc/x;->c:Lya/d;

    iget-object v2, v0, Lhc/x;->b:Ljava/lang/String;

    iget-object v4, v0, Lhc/x;->a:Lyc/d;

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    move-object v6, p0

    :goto_1
    move-object v5, p1

    goto :goto_3

    :cond_3
    iget-object p0, v0, Lhc/x;->c:Lya/d;

    iget-object p1, v0, Lhc/x;->b:Ljava/lang/String;

    iget-object v2, v0, Lhc/x;->a:Lyc/d;

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    move-object v11, p1

    move-object p1, p0

    move-object p0, v2

    move-object v2, p2

    move-object p2, v11

    goto :goto_2

    :cond_4
    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    sget-object p2, Lya/j;->a:Lya/d;

    iput-object p0, v0, Lhc/x;->a:Lyc/d;

    iput-object p1, v0, Lhc/x;->b:Ljava/lang/String;

    iput-object p2, v0, Lhc/x;->c:Lya/d;

    iput v5, v0, Lhc/x;->g:I

    iget-object v2, p0, Lyc/d;->c:Ljava/lang/Object;

    check-cast v2, Lu5/e;

    invoke-virtual {v2, v0}, Lu5/e;->C(LNm/c;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v1, :cond_5

    goto :goto_4

    :cond_5
    move-object v11, p2

    move-object p2, p1

    move-object p1, v11

    :goto_2
    check-cast v2, Lzo/l;

    iget-object v5, p0, Lyc/d;->b:Ljava/lang/Object;

    check-cast v5, Lxd/p;

    iput-object p0, v0, Lhc/x;->a:Lyc/d;

    iput-object p2, v0, Lhc/x;->b:Ljava/lang/String;

    iput-object p1, v0, Lhc/x;->c:Lya/d;

    move-object v6, v2

    check-cast v6, Lzo/l;

    iput-object v6, v0, Lhc/x;->d:Lzo/l;

    iput v4, v0, Lhc/x;->g:I

    invoke-virtual {v5, v0}, Lxd/p;->a(LNm/c;)Ljava/lang/Object;

    move-result-object v4

    if-ne v4, v1, :cond_6

    goto :goto_4

    :cond_6
    move-object v6, v2

    move-object v2, p2

    move-object p2, v4

    move-object v4, p0

    goto :goto_1

    :goto_3
    move-object v7, p2

    check-cast v7, Lzo/l;

    new-instance v9, LXe/l1;

    const/16 p0, 0x19

    invoke-direct {v9, p0}, LXe/l1;-><init>(I)V

    const/16 v10, 0xc

    const/4 v8, 0x0

    invoke-static/range {v5 .. v10}, Lya/d;->b(Lya/d;Lzo/l;Lzo/l;Lcom/eightsleep/presentation_onboarding/viewmodel/h;LVm/n;I)LGc/h;

    move-result-object p0

    new-instance p1, Lhc/z;

    const/4 p2, 0x0

    invoke-direct {p1, v4, v2, p2}, Lhc/z;-><init>(Lyc/d;Ljava/lang/String;LLm/c;)V

    iput-object p2, v0, Lhc/x;->a:Lyc/d;

    iput-object p2, v0, Lhc/x;->b:Ljava/lang/String;

    iput-object p2, v0, Lhc/x;->c:Lya/d;

    iput-object p2, v0, Lhc/x;->d:Lzo/l;

    iput v3, v0, Lhc/x;->g:I

    invoke-static {p0, p2, p1, v3}, LP2/q;->u(Lzo/l;LVm/k;LVm/n;I)LAo/n;

    move-result-object p0

    if-ne p0, v1, :cond_7

    :goto_4
    return-object v1

    :cond_7
    return-object p0
.end method

.method public v()Z
    .locals 2

    iget-object v0, p0, Lyc/d;->b:Ljava/lang/Object;

    check-cast v0, Lo1/F;

    invoke-interface {v0}, Lm0/b1;->getValue()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lyc/d;->d:Ljava/lang/Object;

    if-ne v0, v1, :cond_1

    iget-object p0, p0, Lyc/d;->c:Ljava/lang/Object;

    check-cast p0, Lyc/d;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lyc/d;->v()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public x()V
    .locals 2

    new-instance v0, LIl/a;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, LIl/a;-><init>(Lyc/d;I)V

    invoke-virtual {p0, v0}, Lyc/d;->i(Ljava/lang/Runnable;)V

    return-void
.end method

.method public y(Ljava/lang/Exception;)V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lyc/d;->c:Ljava/lang/Object;

    check-cast v0, Lcom/launchdarkly/sdk/android/p;

    invoke-virtual {v0, p1}, Lcom/launchdarkly/sdk/android/p;->c(Ljava/lang/Exception;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Caught unexpected error from EventHandler.onError(): "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Lyc/d;->d:Ljava/lang/Object;

    check-cast p0, LJl/e;

    invoke-virtual {p0, v0}, LJl/e;->g(Ljava/lang/String;)V

    new-instance v0, Lu5/e;

    const/16 v1, 0x18

    invoke-direct {v0, p1, v1}, Lu5/e;-><init>(Ljava/lang/Object;I)V

    const-string p1, "Stack trace: {}"

    invoke-virtual {p0, v0, p1}, LJl/e;->b(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public z()V
    .locals 0

    iget-object p0, p0, Lyc/d;->c:Ljava/lang/Object;

    check-cast p0, Landroid/content/res/TypedArray;

    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method
