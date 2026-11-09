package dc;

/* JADX INFO: loaded from: classes2.dex */
@kotlin.Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\bf\u0018\u00002\u00020\u0001J4\u0010\t\u001a\b\u0012\u0004\u0012\u00020\b0\u00072\b\b\u0001\u0010\u0003\u001a\u00020\u00022\b\b\u0001\u0010\u0004\u001a\u00020\u00022\b\b\u0001\u0010\u0006\u001a\u00020\u0005H§@¢\u0006\u0004\b\t\u0010\nJ0\u0010\f\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\b0\u000b0\u00072\b\b\u0001\u0010\u0003\u001a\u00020\u00022\b\b\u0001\u0010\u0004\u001a\u00020\u0002H§@¢\u0006\u0004\b\f\u0010\rJ4\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00100\u00072\b\b\u0001\u0010\u0003\u001a\u00020\u00022\b\b\u0001\u0010\u000e\u001a\u00020\u00022\b\b\u0001\u0010\u000f\u001a\u00020\u0002H§@¢\u0006\u0004\b\u0011\u0010\u0012J4\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00100\u00072\b\b\u0001\u0010\u0003\u001a\u00020\u00022\b\b\u0001\u0010\u000e\u001a\u00020\u00022\b\b\u0001\u0010\u0006\u001a\u00020\u0013H§@¢\u0006\u0004\b\u0014\u0010\u0015J4\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00100\u00072\b\b\u0001\u0010\u0003\u001a\u00020\u00022\b\b\u0001\u0010\u000e\u001a\u00020\u00022\b\b\u0001\u0010\u000f\u001a\u00020\u0002H§@¢\u0006\u0004\b\u0016\u0010\u0012¨\u0006\u0017"}, d2 = {"Ldc/a;", "", "", com.eightsleep.presentation_home.viewmodel.TagBreakdownViewModel.USER_ID, "tripId", "Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;", "request", "LXq/S;", "Lcom/eightsleep/data_jetlag/data/model/JetLagPlanResponse;", "a", "(Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/data/model/CreateJetLagPlanRequest;LLm/c;)Ljava/lang/Object;", "", "d", "(Ljava/lang/String;Ljava/lang/String;LLm/c;)Ljava/lang/Object;", "planId", "taskId", "LHm/B;", "e", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;LLm/c;)Ljava/lang/Object;", "Lcom/eightsleep/data_jetlag/data/model/JetLagBulkTaskUpdateRequest;", "b", "(Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/data/model/JetLagBulkTaskUpdateRequest;LLm/c;)Ljava/lang/Object;", "c", "data-jetlag_tencentRelease"}, k = 1, mv = {2, 0, 0}, xi = 48)
public interface a {
    @Zq.o("v1/users/{USER_ID}/travel/trips/{TRIP_ID}/plans")
    java.lang.Object a(@Zq.s("USER_ID") java.lang.String str, @Zq.s("TRIP_ID") java.lang.String str2, @Zq.a com.eightsleep.data_jetlag.data.model.CreateJetLagPlanRequest createJetLagPlanRequest, Lm.c<? super Xq.S<com.eightsleep.data_jetlag.data.model.JetLagPlanResponse>> cVar);

    @Zq.n("v1/users/{USER_ID}/travel/plans/{PLAN_ID}/tasks")
    java.lang.Object b(@Zq.s("USER_ID") java.lang.String str, @Zq.s("PLAN_ID") java.lang.String str2, @Zq.a com.eightsleep.data_jetlag.data.model.JetLagBulkTaskUpdateRequest jetLagBulkTaskUpdateRequest, Lm.c<? super Xq.S<Hm.B>> cVar);

    @Zq.p("v1/users/{USER_ID}/travel/tasks/{PLAN_ID}/{TASK_ID}/reset")
    java.lang.Object c(@Zq.s("USER_ID") java.lang.String str, @Zq.s("PLAN_ID") java.lang.String str2, @Zq.s("TASK_ID") java.lang.String str3, Lm.c<? super Xq.S<Hm.B>> cVar);

    @Zq.f("v1/users/{USER_ID}/travel/trips/{TRIP_ID}/plans")
    java.lang.Object d(@Zq.s("USER_ID") java.lang.String str, @Zq.s("TRIP_ID") java.lang.String str2, Lm.c<? super Xq.S<java.util.List<com.eightsleep.data_jetlag.data.model.JetLagPlanResponse>>> cVar);

    @Hm.c
    @Zq.p("v1/users/{USER_ID}/travel/tasks/{PLAN_ID}/{TASK_ID}/complete")
    java.lang.Object e(@Zq.s("USER_ID") java.lang.String str, @Zq.s("PLAN_ID") java.lang.String str2, @Zq.s("TASK_ID") java.lang.String str3, Lm.c<? super Xq.S<Hm.B>> cVar);
}
