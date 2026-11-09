package p336ng;

/* JADX INFO: loaded from: classes2.dex */
public final class l implements d8.k {

    /* JADX INFO: renamed from: a, reason: collision with root package name */
    public final int f61185a;

    /* JADX INFO: renamed from: b, reason: collision with root package name */
    public final int f61186b;

    /* JADX INFO: renamed from: c, reason: collision with root package name */
    public final int f61187c;

    public l(int i10, int i11, int i12) {
        this.f61185a = i10;
        this.f61186b = i11;
        this.f61187c = i12;
    }

    public final boolean equals(java.lang.Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p336ng.l)) {
            return false;
        }
        p336ng.l lVar = (p336ng.l) obj;
        return this.f61185a == lVar.f61185a && this.f61186b == lVar.f61186b && this.f61187c == lVar.f61187c;
    }

    public final int hashCode() {
        return java.lang.Integer.hashCode(this.f61187c) + p417r4.K.c(this.f61186b, java.lang.Integer.hashCode(this.f61185a) * 31, 31);
    }

    public final java.lang.String toString() {
        java.lang.StringBuilder sb2 = new java.lang.StringBuilder("PostFlightUiModel(nightNumber=");
        sb2.append(this.f61185a);
        sb2.append(", totalTaskCount=");
        sb2.append(this.f61186b);
        sb2.append(", completedTaskCount=");
        return B.h.i(this.f61187c, ")", sb2);
    }
}
