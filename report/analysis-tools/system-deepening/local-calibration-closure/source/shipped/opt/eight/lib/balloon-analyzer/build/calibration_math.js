"use strict";
/**
 * Numeric primitives for the calibration analyzer.
 *
 * These replace the pandas/numpy calls the Python analyzer used, and each one
 * reproduces its counterpart's exact semantics -- including the fiddly parts that
 * a naive reimplementation gets wrong:
 *
 *   - NaN is used where pandas used NA. JS NaN comparisons are already false in
 *     both directions, which is what the detection loops rely on.
 *   - Centered rolling windows are asymmetric for even window sizes, matching
 *     pandas: left = floor(w/2), right = w - 1 - floor(w/2).
 *   - `rollingMean` defaults to min_periods = window (pandas' default), so a
 *     window that is clipped at an edge or contains a NaN yields NaN rather than
 *     a partial average.
 *   - `quantile` uses the linear interpolation pandas defaults to.
 *   - `std` is population standard deviation (numpy's ddof=0), not sample.
 *
 * Verified against the Python implementation over every CSV in calibration_data/
 * and r12-calibration/data/EVT3; see scripts/compare_analyzers.py.
 */
Object.defineProperty(exports, "__esModule", { value: true });
exports.diff = diff;
exports.median = median;
exports.mean = mean;
exports.max = max;
exports.std = std;
exports.argmax = argmax;
exports.quantile = quantile;
exports.rollingMedian = rollingMedian;
exports.rollingMean = rollingMean;
exports.fillna = fillna;
exports.linregress = linregress;
exports.outlierIqrMask = outlierIqrMask;
exports.roundTo = roundTo;
/** Difference between consecutive samples. First element is NaN, as pandas' diff. */
function diff(values) {
    const out = new Array(values.length);
    out[0] = NaN;
    for (let i = 1; i < values.length; i++) {
        out[i] = values[i] - values[i - 1];
    }
    return out;
}
/**
 * Window bounds for a centered rolling window, clipped to the array.
 *
 * pandas splits an even window one sample to the left of center, so w=4 at index
 * i covers [i-2, i+1]. Odd windows are symmetric.
 */
function centeredWindow(i, w, n) {
    const left = Math.floor(w / 2);
    const right = w - 1 - left;
    return [Math.max(0, i - left), Math.min(n - 1, i + right)];
}
/** Median of the finite values in `values`. NaN if there are none. */
function median(values) {
    const finite = values.filter(v => Number.isFinite(v)).sort((a, b) => a - b);
    if (finite.length === 0)
        return NaN;
    const mid = finite.length >> 1;
    return finite.length % 2 === 1
        ? finite[mid]
        : (finite[mid - 1] + finite[mid]) / 2;
}
/** Mean of the finite values. NaN if there are none, as pandas skips NA. */
function mean(values) {
    let sum = 0;
    let count = 0;
    for (const v of values) {
        if (Number.isFinite(v)) {
            sum += v;
            count++;
        }
    }
    return count === 0 ? NaN : sum / count;
}
/** Max of the finite values. NaN if there are none. */
function max(values) {
    let best = NaN;
    for (const v of values) {
        if (Number.isFinite(v) && (Number.isNaN(best) || v > best)) {
            best = v;
        }
    }
    return best;
}
/** Population standard deviation (numpy's default ddof=0), over finite values. */
function std(values) {
    const finite = values.filter(v => Number.isFinite(v));
    if (finite.length === 0)
        return NaN;
    const m = finite.reduce((a, b) => a + b, 0) / finite.length;
    const variance = finite.reduce((a, v) => a + (v - m) * (v - m), 0) / finite.length;
    return Math.sqrt(variance);
}
/** Index of the first maximum, as numpy's argmax and pandas' idxmax. */
function argmax(values) {
    let bestIdx = 0;
    let best = -Infinity;
    for (let i = 0; i < values.length; i++) {
        if (Number.isFinite(values[i]) && values[i] > best) {
            best = values[i];
            bestIdx = i;
        }
    }
    return bestIdx;
}
/**
 * Linear-interpolated quantile over finite values, matching pandas' default.
 *
 * Position q*(n-1) in the sorted values, interpolating between neighbours.
 */
function quantile(values, q) {
    const finite = values.filter(v => Number.isFinite(v)).sort((a, b) => a - b);
    if (finite.length === 0)
        return NaN;
    if (finite.length === 1)
        return finite[0];
    const pos = q * (finite.length - 1);
    const lo = Math.floor(pos);
    const hi = Math.ceil(pos);
    if (lo === hi)
        return finite[lo];
    return finite[lo] + (pos - lo) * (finite[hi] - finite[lo]);
}
/**
 * Centered rolling median. min_periods defaults to 1, so partial windows at the
 * edges still produce a value -- the median filter the analyzer applies to the
 * pressure trace relies on that to keep the trace the same length.
 */
function rollingMedian(values, window, minPeriods = 1) {
    const n = values.length;
    const out = new Array(n);
    for (let i = 0; i < n; i++) {
        const [lo, hi] = centeredWindow(i, window, n);
        const slice = [];
        for (let j = lo; j <= hi; j++) {
            if (Number.isFinite(values[j]))
                slice.push(values[j]);
        }
        out[i] = slice.length >= minPeriods ? median(slice) : NaN;
    }
    return out;
}
/**
 * Centered rolling mean. min_periods defaults to the window size, as pandas
 * does, so an edge-clipped window or one containing a NaN yields NaN.
 */
function rollingMean(values, window, minPeriods) {
    const required = minPeriods !== null && minPeriods !== void 0 ? minPeriods : window;
    const n = values.length;
    const out = new Array(n);
    for (let i = 0; i < n; i++) {
        const [lo, hi] = centeredWindow(i, window, n);
        let sum = 0;
        let count = 0;
        for (let j = lo; j <= hi; j++) {
            if (Number.isFinite(values[j])) {
                sum += values[j];
                count++;
            }
        }
        out[i] = count >= required ? sum / count : NaN;
    }
    return out;
}
/** Replace NaN with `fill`, as pandas' fillna. */
function fillna(values, fill) {
    return values.map(v => (Number.isFinite(v) ? v : fill));
}
/**
 * Least-squares fit of y = slope * x + intercept.
 *
 * Equivalent to numpy's polyfit at degree 1; r_squared is 0 when y is constant,
 * matching the Python guard on a zero total sum of squares.
 */
function linregress(x, y) {
    const n = x.length;
    let sx = 0, sy = 0, sxx = 0, sxy = 0;
    for (let i = 0; i < n; i++) {
        sx += x[i];
        sy += y[i];
        sxx += x[i] * x[i];
        sxy += x[i] * y[i];
    }
    const denom = n * sxx - sx * sx;
    const slope = denom === 0 ? 0 : (n * sxy - sx * sy) / denom;
    const intercept = (sy - slope * sx) / n;
    const yMean = sy / n;
    let ssRes = 0, ssTot = 0;
    for (let i = 0; i < n; i++) {
        const predicted = slope * x[i] + intercept;
        ssRes += (y[i] - predicted) ** 2;
        ssTot += (y[i] - yMean) ** 2;
    }
    return { slope, intercept, rSquared: ssTot === 0 ? 0 : 1 - ssRes / ssTot };
}
/**
 * Positions surviving an IQR outlier filter, in their original order.
 *
 * Returns indices rather than values because the recovery detector needs to know
 * WHERE the first surviving sample sits, not just what it was. Series shorter
 * than 4 are returned untouched, as the Python does -- a quartile off three
 * points is not worth trusting.
 */
function outlierIqrMask(values, iqrMultiplier) {
    const all = values.map((_, i) => i);
    if (values.length < 4)
        return all;
    const q1 = quantile(values, 0.25);
    const q3 = quantile(values, 0.75);
    const iqr = q3 - q1;
    const lower = q1 - iqrMultiplier * iqr;
    const upper = q3 + iqrMultiplier * iqr;
    return all.filter(i => values[i] >= lower && values[i] <= upper);
}
/**
 * Round to `digits` decimal places for reporting, matching Python's round().
 *
 * Not `toFixed`, which rounds a tie away from zero where Python rounds it to even.
 * That difference is not theoretical: b_cv is a ratio of two already-rounded
 * numbers, so it lands on exact ties in real data -- 0.007/0.112 is exactly
 * 0.0625, which Python reports as 0.062 and toFixed as 0.063.
 *
 * A genuine tie at `digits` places requires a dyadic value, whose decimal
 * expansion terminates a few places in, so the padded expansion below is always
 * wide enough to tell a true tie from a value that merely starts with 5.
 */
function roundTo(value, digits) {
    if (!Number.isFinite(value))
        return value;
    const sign = value < 0 ? -1 : 1;
    const expanded = Math.abs(value).toFixed(Math.min(100, digits + 25));
    const dot = expanded.indexOf(".");
    const kept = expanded.slice(0, dot) + expanded.slice(dot + 1, dot + 1 + digits);
    const rest = expanded.slice(dot + 1 + digits);
    const truncated = Number(kept);
    const first = rest.length > 0 ? rest.charCodeAt(0) - 48 : 0;
    const remainderNonZero = /[1-9]/.test(rest.slice(1));
    let roundUp;
    if (first > 5) {
        roundUp = true;
    }
    else if (first < 5) {
        roundUp = false;
    }
    else {
        // Exactly half rounds to even; anything past the 5 makes it more than half.
        roundUp = remainderNonZero || truncated % 2 === 1;
    }
    return (sign * (truncated + (roundUp ? 1 : 0))) / Math.pow(10, digits);
}
//# sourceMappingURL=calibration_math.js.map