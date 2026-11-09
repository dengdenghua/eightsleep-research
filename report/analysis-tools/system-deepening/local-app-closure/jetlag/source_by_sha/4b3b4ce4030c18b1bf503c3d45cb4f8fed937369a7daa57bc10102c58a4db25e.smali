.class public final Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$getJetLagPlanFlow$$inlined$map$1$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzo/m;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$getJetLagPlanFlow$$inlined$map$1;->collect(Lzo/m;LLm/c;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lzo/m;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $this_unsafeFlow:Lzo/m;

.field final synthetic this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;


# direct methods
.method public constructor <init>(Lzo/m;Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;)V
    .locals 0

    iput-object p1, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$getJetLagPlanFlow$$inlined$map$1$2;->$this_unsafeFlow:Lzo/m;

    iput-object p2, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$getJetLagPlanFlow$$inlined$map$1$2;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;
    .locals 4

    instance-of v0, p2, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$getJetLagPlanFlow$$inlined$map$1$2$1;

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$getJetLagPlanFlow$$inlined$map$1$2$1;

    iget v1, v0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$getJetLagPlanFlow$$inlined$map$1$2$1;->label:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$getJetLagPlanFlow$$inlined$map$1$2$1;->label:I

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$getJetLagPlanFlow$$inlined$map$1$2$1;

    invoke-direct {v0, p0, p2}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$getJetLagPlanFlow$$inlined$map$1$2$1;-><init>(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$getJetLagPlanFlow$$inlined$map$1$2;LLm/c;)V

    :goto_0
    iget-object p2, v0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$getJetLagPlanFlow$$inlined$map$1$2$1;->result:Ljava/lang/Object;

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, v0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$getJetLagPlanFlow$$inlined$map$1$2$1;->label:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    if-ne v2, v3, :cond_1

    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    goto :goto_1

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    invoke-static {p2}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p2, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$getJetLagPlanFlow$$inlined$map$1$2;->$this_unsafeFlow:Lzo/m;

    check-cast p1, Lya/j;

    instance-of v2, p1, Lya/e;

    if-eqz v2, :cond_3

    iget-object p0, p0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$getJetLagPlanFlow$$inlined$map$1$2;->this$0:Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;

    check-cast p1, Lya/e;

    iget-object p1, p1, Lya/e;->b:Ljava/lang/Throwable;

    const-string v2, "Error fetching jet lag plan for active trip"

    invoke-static {p0, v2, p1}, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;->access$logE(Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel;Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance p1, Lya/g;

    new-instance p0, LHm/k;

    const/4 v2, 0x0

    invoke-direct {p0, v2, v2}, LHm/k;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {p1, p0}, Lya/g;-><init>(Ljava/lang/Object;)V

    :cond_3
    iput v3, v0, Lcom/eightsleep/presentation_home/viewmodel/dynamic_home/DynamicHomeViewModel$getJetLagPlanFlow$$inlined$map$1$2$1;->label:I

    invoke-interface {p2, p1, v0}, Lzo/m;->emit(Ljava/lang/Object;LLm/c;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_4

    return-object v1

    :cond_4
    :goto_1
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0
.end method
