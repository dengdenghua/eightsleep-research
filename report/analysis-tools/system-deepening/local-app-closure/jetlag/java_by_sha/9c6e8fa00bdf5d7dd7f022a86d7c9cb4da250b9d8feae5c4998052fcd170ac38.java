package dc;

/* JADX INFO: loaded from: classes2.dex */
@kotlin.Metadata(d1 = {"\u0000P\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\bf\u0018\u00002\u00020\u0001J*\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00070\u00062\b\b\u0001\u0010\u0003\u001a\u00020\u00022\b\b\u0001\u0010\u0005\u001a\u00020\u0004H§@¢\u0006\u0004\b\b\u0010\tJ&\u0010\u000b\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00070\n0\u00062\b\b\u0001\u0010\u0003\u001a\u00020\u0002H§@¢\u0006\u0004\b\u000b\u0010\fJ \u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00070\u00062\b\b\u0001\u0010\r\u001a\u00020\u0002H§@¢\u0006\u0004\b\u000e\u0010\fJ0\u0010\u0013\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00120\n0\u00062\b\b\u0001\u0010\u0010\u001a\u00020\u000f2\b\b\u0001\u0010\u0011\u001a\u00020\u0002H§@¢\u0006\u0004\b\u0013\u0010\u0014J*\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00150\u00062\b\b\u0001\u0010\u0003\u001a\u00020\u00022\b\b\u0001\u0010\r\u001a\u00020\u0002H§@¢\u0006\u0004\b\u0016\u0010\u0017J4\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u00070\u00062\b\b\u0001\u0010\u0003\u001a\u00020\u00022\b\b\u0001\u0010\r\u001a\u00020\u00022\b\b\u0001\u0010\u0005\u001a\u00020\u0018H§@¢\u0006\u0004\b\u0019\u0010\u001aJ*\u0010\u001e\u001a\b\u0012\u0004\u0012\u00020\u001d0\u00062\b\b\u0001\u0010\u001b\u001a\u00020\u00022\b\b\u0001\u0010\u001c\u001a\u00020\u0002H§@¢\u0006\u0004\b\u001e\u0010\u0017¨\u0006\u001f"}, d2 = {"Ldc/b;", "", "", com.eightsleep.presentation_home.viewmodel.TagBreakdownViewModel.USER_ID, "Lcom/eightsleep/data_jetlag/data/model/CreateTripRequest;", "request", "LXq/S;", "Lcom/eightsleep/data_jetlag/data/model/TripResponse;", "c", "(Ljava/lang/String;Lcom/eightsleep/data_jetlag/data/model/CreateTripRequest;LLm/c;)Ljava/lang/Object;", "", "d", "(Ljava/lang/String;LLm/c;)Ljava/lang/Object;", "tripId", "g", "", "maxResults", "query", "Lcom/eightsleep/data_jetlag/data/model/LocationResultResponse;", "f", "(ILjava/lang/String;LLm/c;)Ljava/lang/Object;", "LHm/B;", "e", "(Ljava/lang/String;Ljava/lang/String;LLm/c;)Ljava/lang/Object;", "Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;", "a", "(Ljava/lang/String;Ljava/lang/String;Lcom/eightsleep/data_jetlag/data/model/UpdateTripRequest;LLm/c;)Ljava/lang/Object;", "flightNumber", "departureDate", "Lcom/eightsleep/data_jetlag/data/model/FlightSearchResponse;", "b", "data-jetlag_tencentRelease"}, k = 1, mv = {2, 0, 0}, xi = 48)
public interface b {
    @Zq.p("v1/users/{userId}/travel/trips/{tripId}")
    java.lang.Object a(@Zq.s(com.eightsleep.presentation_home.viewmodel.TagBreakdownViewModel.USER_ID) java.lang.String str, @Zq.s("tripId") java.lang.String str2, @Zq.a com.eightsleep.data_jetlag.data.model.UpdateTripRequest updateTripRequest, Lm.c<? super Xq.S<com.eightsleep.data_jetlag.data.model.TripResponse>> cVar);

    @Zq.f("v1/travel/flight-status")
    java.lang.Object b(@Zq.t("flightNumber") java.lang.String str, @Zq.t("date") java.lang.String str2, Lm.c<? super Xq.S<com.eightsleep.data_jetlag.data.model.FlightSearchResponse>> cVar);

    @Zq.o("v1/users/{USER_ID}/travel/trips")
    java.lang.Object c(@Zq.s("USER_ID") java.lang.String str, @Zq.a com.eightsleep.data_jetlag.data.model.CreateTripRequest createTripRequest, Lm.c<? super Xq.S<com.eightsleep.data_jetlag.data.model.TripResponse>> cVar);

    @Zq.f("v1/users/{USER_ID}/travel/trips")
    java.lang.Object d(@Zq.s("USER_ID") java.lang.String str, Lm.c<? super Xq.S<java.util.List<com.eightsleep.data_jetlag.data.model.TripResponse>>> cVar);

    @Zq.b("v1/users/{USER_ID}/travel/trips/{TRIP_ID}")
    java.lang.Object e(@Zq.s("USER_ID") java.lang.String str, @Zq.s("TRIP_ID") java.lang.String str2, Lm.c<? super Xq.S<Hm.B>> cVar);

    @Zq.f("v1/travel/airport-search")
    java.lang.Object f(@Zq.t("maxResults") int i10, @Zq.t("query") java.lang.String str, Lm.c<? super Xq.S<java.util.List<com.eightsleep.data_jetlag.data.model.LocationResultResponse>>> cVar);

    @Zq.f("v1/users/{USER_ID}/travel/trips/{TRIP_ID}")
    java.lang.Object g(@Zq.a java.lang.String str, Lm.c<? super Xq.S<com.eightsleep.data_jetlag.data.model.TripResponse>> cVar);
}
