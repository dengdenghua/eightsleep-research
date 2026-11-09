.class public final LDa/E;
.super LNm/i;
.source "SourceFile"

# interfaces
.implements LVm/n;


# instance fields
.field public a:I

.field public synthetic b:Ljava/lang/Object;

.field public final synthetic c:LDa/K;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:I


# direct methods
.method public constructor <init>(LDa/K;Ljava/lang/String;ILLm/c;)V
    .locals 0

    iput-object p1, p0, LDa/E;->c:LDa/K;

    iput-object p2, p0, LDa/E;->d:Ljava/lang/String;

    iput p3, p0, LDa/E;->e:I

    const/4 p1, 0x2

    invoke-direct {p0, p1, p4}, LNm/i;-><init>(ILLm/c;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;LLm/c;)LLm/c;
    .locals 3

    new-instance v0, LDa/E;

    iget-object v1, p0, LDa/E;->d:Ljava/lang/String;

    iget v2, p0, LDa/E;->e:I

    iget-object p0, p0, LDa/E;->c:LDa/K;

    invoke-direct {v0, p0, v1, v2, p2}, LDa/E;-><init>(LDa/K;Ljava/lang/String;ILLm/c;)V

    iput-object p1, v0, LDa/E;->b:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lwo/z;

    check-cast p2, LLm/c;

    invoke-virtual {p0, p1, p2}, LDa/E;->create(Ljava/lang/Object;LLm/c;)LLm/c;

    move-result-object p0

    check-cast p0, LDa/E;

    sget-object p1, LHm/B;->a:LHm/B;

    invoke-virtual {p0, p1}, LDa/E;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 13

    const-string v0, "SENSOR EVENT STREAM"

    sget-object v1, LMm/a;->COROUTINE_SUSPENDED:LMm/a;

    iget v2, p0, LDa/E;->a:I

    const/4 v3, 0x1

    iget v4, p0, LDa/E;->e:I

    iget-object v5, p0, LDa/E;->d:Ljava/lang/String;

    iget-object v6, p0, LDa/E;->c:LDa/K;

    if-eqz v2, :cond_1

    if-ne v2, v3, :cond_0

    iget-object v2, p0, LDa/E;->b:Ljava/lang/Object;

    check-cast v2, Lwo/z;

    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    goto/16 :goto_1

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    invoke-static {p1}, LX4/x;->M(Ljava/lang/Object;)V

    iget-object p1, p0, LDa/E;->b:Ljava/lang/Object;

    check-cast p1, Lwo/z;

    move-object v2, p1

    :goto_0
    invoke-static {v2}, Lwo/C;->A(Lwo/z;)Z

    move-result p1

    if-eqz p1, :cond_3

    const/4 p1, 0x0

    :try_start_0
    sget-object v7, Ltimber/log/Timber;->a:Lbr/a;

    invoke-virtual {v7, v0}, Lbr/a;->p(Ljava/lang/String;)V

    const-string v8, "XXXXXXX SENSOR EVENT STREAM Connecting"

    new-array v9, p1, [Ljava/lang/Object;

    invoke-virtual {v7, v8, v9}, Lbr/a;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v7, v6, LDa/K;->c:Lcom/eightsleep/data_core/enums/AppEnvironment;

    const-string v8, "app-api"

    const/4 v9, 0x2

    const/4 v10, 0x0

    invoke-static {v7, v8, v10, v9, v10}, Lcom/eightsleep/data_core/enums/AppEnvironment;->getBaseUrl$default(Lcom/eightsleep/data_core/enums/AppEnvironment;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "v1/devices/"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "/live"

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/net/URL;

    invoke-direct {v8, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v7

    const-string v8, "null cannot be cast to non-null type java.net.HttpURLConnection"

    invoke-static {v7, v8}, Lkotlin/jvm/internal/l;->h(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v7, Ljava/net/HttpURLConnection;

    const-string v8, "Authorization"

    iget-object v9, v6, LDa/K;->a:LA9/k;

    invoke-virtual {v9}, LA9/k;->a()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lkotlin/jvm/internal/l;->g(Ljava/lang/Object;)V

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Bearer "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v8, "Accept"

    const-string v9, "text/event-stream"

    invoke-virtual {v7, v8, v9}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, v3}, Ljava/net/URLConnection;->setDoInput(Z)V

    invoke-virtual {v7}, Ljava/net/URLConnection;->connect()V

    iput-object v7, v6, LDa/K;->f:Ljava/net/HttpURLConnection;

    iput-boolean v3, v6, LDa/K;->i:Z

    new-instance v7, LDa/D;

    invoke-direct {v7, v6, v5, v4, v10}, LDa/D;-><init>(LDa/K;Ljava/lang/String;ILLm/c;)V

    const/4 v8, 0x3

    invoke-static {v2, v10, v10, v7, v8}, Lwo/C;->B(Lwo/z;LLm/h;Lwo/B;LVm/n;I)Lwo/y0;

    move-result-object v7

    iput-object v7, v6, LDa/K;->g:Lwo/y0;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v7

    sget-object v8, Ltimber/log/Timber;->a:Lbr/a;

    invoke-virtual {v8, v0}, Lbr/a;->p(Ljava/lang/String;)V

    const-string v9, "XXXXXXX Connection failed. Retrying in 3 seconds..."

    new-array p1, p1, [Ljava/lang/Object;

    invoke-virtual {v8, v9, v7, p1}, Lbr/a;->c(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    iput-object v2, p0, LDa/E;->b:Ljava/lang/Object;

    iput v3, p0, LDa/E;->a:I

    const-wide/16 v7, 0xbb8

    invoke-static {v7, v8, p0}, Lwo/C;->n(JLLm/c;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_2

    return-object v1

    :cond_2
    :goto_1
    add-int/lit8 p1, v4, 0x1

    invoke-static {v6, v5, p1}, LDa/K;->a(LDa/K;Ljava/lang/String;I)V

    goto/16 :goto_0

    :cond_3
    :goto_2
    sget-object p0, LHm/B;->a:LHm/B;

    return-object p0
.end method
