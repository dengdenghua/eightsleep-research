"use strict";
/**
 * Calibration analysis: fits per-bag pressure compensation coefficients from a
 * telemetry pressure CSV.
 *
 * The calibration relationship is `p_true = a * p_measured + b`:
 *   - `a` and `ci` come from a linear fit over the deflate phase, where each
 *     solenoid pulse gives a (trough during flow, settled shelf) pair.
 *   - `b` is the median pump-off overshoot measured during the inflate phase.
 *
 * This is a port of scripts/analyze_calibration.py, which needed numpy and pandas
 * and so could not run on a machine with only Node installed. The Python remains
 * in the repo as the reference implementation and as the engine behind
 * scripts/plot_bag_calibration.py; scripts/compare_analyzers.py checks the two
 * agree over every CSV we have.
 *
 * Constants below are the Python's, unchanged. The detection heuristics are
 * deliberately a literal translation rather than a tidier rewrite -- they were
 * tuned against real runs, and reproducing them exactly is the point.
 */
Object.defineProperty(exports, "__esModule", { value: true });
exports.loadCsv = loadCsv;
exports.computeCalibration = computeCalibration;
exports.analyzeBag = analyzeBag;
exports.analyzeCsv = analyzeCsv;
const fs = require("fs");
const calibration_math_1 = require("./calibration_math");
// Validation thresholds
const MIN_R_SQUARED = 0.70;
const MIN_A_COEFFICIENT = 0.8;
const MAX_A_COEFFICIENT = 3.0;
const MIN_B_COEFFICIENT = -2.0;
const MAX_B_COEFFICIENT = 2.0;
/**
 * Sanity bound on the deflate intercept (kPa). Observed values are 0.07-0.12; a
 * large magnitude indicates the fit ran on absolute instead of gauge pressure.
 */
const MAX_ABS_INTERCEPT_KPA = 2.0;
const MIN_DATA_POINTS = 5;
/**
 * Recovery points whose settled pressure is below this are dropped before fitting
 * (kPa). Below it the recovery is sensor noise, not a measurable shelf.
 */
const MIN_VALID_PRESSURE_KPA = 0.15;
/**
 * Detection windows, in SECONDS, scaled by the CSV's Sample_Rate_Hz rather than
 * fixed sample counts. Each is exactly equivalent to the sample-count constant it
 * replaced at 20 Hz, the rate they were validated at.
 *
 * RECOVERY_WINDOW_S is the flat shelf required after a recovery spike for it to
 * count, and must fit INSIDE hold_duration or every recovery is rejected.
 * OVERSHOOT_SHELF_S is the shelf medianed to get the settled pressure `b` is
 * measured against, and must be long enough for the pump-off decay to finish --
 * at 0.40 s the shelf is sampled mid-decay and `b` halves.
 */
const RECOVERY_WINDOW_S = 0.40;
const OVERSHOOT_SHELF_S = 1.00;
const MEDIAN_FILTER_S = 0.25;
const INFLATION_WINDOW_S = 1.00;
const DERIVATIVE_THRESHOLD_KPA_S = 2.00;
const MAX_STABLE_SLOPE_KPA_S = 0.10;
const MIN_INFLATION_SLOPE_KPA_S = 0.01;
/** Minimum difference between p_after and p_before for a recovery to count (kPa). */
const MIN_PRESSURE_DIFF = 0.05;
/** Aggressive IQR multiplier for outlier removal (lower is stricter). */
const OUTLIER_IQR_MULTIPLIER = 1.0;
/** At least this fraction of samples before a peak must have positive slope. */
const MIN_POSITIVE_SLOPE_FRACTION = 0.3;
/** Smallest peak-to-shelf drop counted as an inflation overshoot (kPa). */
const MIN_OVERSHOOT_KPA = 0.05;
/**
 * Parse a telemetry pressure CSV.
 *
 * A hand-rolled split is safe here: these files are written by this package's own
 * CSV writers, and every field is numeric except the ISO timestamp. Surrounding
 * quotes are stripped, but a field containing an escaped comma would still split
 * wrongly -- that is what the Python fallback in calibration_analysis.ts is for.
 * A short final row -- a run killed mid-write -- is padded with NaN rather than
 * rejected, which is what pandas did with the same file.
 */
function loadCsv(csvPath) {
    const text = fs.readFileSync(csvPath, "utf8");
    const lines = text.split(/\r?\n/).filter(line => line.length > 0);
    if (lines.length < 2) {
        throw new Error("CSV has no data rows");
    }
    const unquote = (field) => field.trim().replace(/^"(.*)"$/, "$1");
    const columns = lines[0].split(",").map(unquote);
    const data = new Map();
    for (const col of columns) {
        data.set(col, []);
    }
    for (let r = 1; r < lines.length; r++) {
        const fields = lines[r].split(",");
        for (let c = 0; c < columns.length; c++) {
            const raw = c < fields.length ? unquote(fields[c]) : "";
            const value = raw.length === 0 ? NaN : Number(raw);
            data.get(columns[c]).push(value);
        }
    }
    // Sensor count varies by hardware: 4-bag exposes Pressure_S0-S4 (S4 =
    // atmospheric), 5-bag exposes S0-S5. Requiring S5 rejected every 4-bag CSV.
    const required = ["Timestamp_UTC", "Sample_Rate_Hz"];
    const pressureCount = columns.filter(c => c.startsWith("Pressure_S")).length;
    for (let i = 0; i < pressureCount; i++) {
        required.push(`Pressure_S${i}`);
    }
    const missing = required.filter(c => !columns.includes(c));
    if (missing.length > 0) {
        throw new Error(`Missing required columns: [${missing.map(m => `'${m}'`).join(", ")}]`);
    }
    return { columns, data, rows: lines.length - 1 };
}
/**
 * Detect pressure recovery events -- the positive edges where a deflate solenoid
 * closes and the reading climbs from the flow-depressed trough to true static.
 *
 * Per event: find a large positive derivative, walk back to the true trough, wait
 * out the spike, then require the following window to be a flat shelf once
 * outliers are stripped. p_before is the trough, p_after the first stable sample.
 */
function detectPressureRecoveries(pressure, derivativeThreshold, stableWindowSamples, maxStableSlope, minPressureDiff = MIN_PRESSURE_DIFF) {
    const derivative = (0, calibration_math_1.diff)(pressure);
    const recoveries = [];
    let i = 0;
    while (i < derivative.length - stableWindowSamples) {
        if (Number.isNaN(derivative[i])) {
            i += 1;
            continue;
        }
        if (!(derivative[i] > derivativeThreshold)) {
            i += 1;
            continue;
        }
        const spikeIdx = i;
        if (spikeIdx === 0) {
            i += 1;
            continue;
        }
        // Walk backwards to the true minimum: stop once the previous sample is higher.
        let pBeforeIdx = spikeIdx - 1;
        while (pBeforeIdx > 0) {
            if (pressure[pBeforeIdx - 1] > pressure[pBeforeIdx])
                break;
            pBeforeIdx -= 1;
        }
        const pBefore = pressure[pBeforeIdx];
        // Wait for the spike to finish before sampling the shelf.
        let spikeEnd = spikeIdx;
        while (spikeEnd < derivative.length - 1 && derivative[spikeEnd] > 0.05) {
            spikeEnd += 1;
        }
        const stableStart = spikeEnd;
        const stableEnd = Math.min(stableStart + stableWindowSamples, pressure.length);
        const stableRegion = pressure.slice(stableStart, stableEnd);
        if (stableRegion.length < 5) {
            i = stableEnd;
            continue;
        }
        // Strip solenoid spikes before judging flatness.
        const keep = (0, calibration_math_1.outlierIqrMask)(stableRegion, OUTLIER_IQR_MULTIPLIER);
        if (keep.length < 3) {
            i = stableEnd;
            continue;
        }
        let slope;
        if (keep.length >= 2) {
            const fit = (0, calibration_math_1.linregress)(keep, keep.map(k => stableRegion[k]));
            slope = Math.abs(fit.slope);
        }
        else {
            slope = Infinity;
        }
        if (slope < maxStableSlope) {
            const firstStableIdx = stableStart + keep[0];
            const pAfter = pressure[firstStableIdx];
            if (pAfter > pBefore + minPressureDiff) {
                recoveries.push({
                    dropMinIdx: pBeforeIdx,
                    stableStartIdx: firstStableIdx,
                    stableEndIdx: stableEnd,
                    pBefore,
                    pAfter,
                });
            }
        }
        i = stableEnd;
    }
    return recoveries;
}
/**
 * Detect inflation overshoots -- the pump-off peak and the pressure it settles
 * back to. The gap between them is the `b` offset.
 *
 * Detection runs on the median-filtered trace so noise spikes do not read as
 * peaks, then measures the shelf on the raw trace so the settled value is not
 * smoothed away.
 */
function detectInflationOvershoots(pressure, rawPressure, inflationWindow, minSlope, stableWindow, minPositiveFraction = MIN_POSITIVE_SLOPE_FRACTION, minOvershoot = MIN_OVERSHOOT_KPA) {
    const derivative = (0, calibration_math_1.diff)(pressure);
    // 10-sample smoothing for peak finding (catches gentler patterns), 5-sample
    // for shelf detection (more precise).
    const smooth10 = (0, calibration_math_1.fillna)((0, calibration_math_1.rollingMean)(derivative, 10), 0);
    const smooth5 = (0, calibration_math_1.fillna)((0, calibration_math_1.rollingMean)(derivative, 5), 0);
    const overshoots = [];
    let i = inflationWindow;
    while (i < pressure.length - stableWindow - 10) {
        // Local maximum: the smoothed slope crosses from clearly positive to
        // negative. Asymmetric thresholds, because a short inflation can produce a
        // single intermediate sample that barely crosses zero.
        if (!(smooth10[i - 1] > 0.001 && smooth10[i] < 0)) {
            i += 1;
            continue;
        }
        const peakRegionCenter = i - 1;
        // Require that inflation actually preceded this peak.
        const windowStart = Math.max(0, peakRegionCenter - inflationWindow);
        const windowDeriv = derivative.slice(windowStart, peakRegionCenter);
        const positiveCount = windowDeriv.filter(v => v > minSlope).length;
        const positiveFraction = windowDeriv.length > 0 ? positiveCount / windowDeriv.length : 0;
        if (positiveFraction < minPositiveFraction) {
            i += 1;
            continue;
        }
        // Skip the initial drop to find the shelf.
        let shelfSearchStart = i;
        while (shelfSearchStart < smooth5.length - 1 && smooth5[shelfSearchStart] < -0.002) {
            shelfSearchStart += 1;
        }
        const shelfStart = shelfSearchStart;
        const shelfEnd = Math.min(shelfStart + stableWindow, pressure.length);
        // True peak within +/-5 samples of the detected crossing.
        const peakSearchStart = Math.max(0, peakRegionCenter - 5);
        const peakSearchEnd = Math.min(pressure.length, peakRegionCenter + 5);
        const peakIdx = peakSearchStart + (0, calibration_math_1.argmax)(pressure.slice(peakSearchStart, peakSearchEnd));
        const pPeak = pressure[peakIdx];
        const shelfRegion = rawPressure.slice(shelfStart, shelfEnd);
        if (shelfRegion.length >= 5) {
            const pShelf = (0, calibration_math_1.median)(shelfRegion);
            const overshoot = pPeak - pShelf;
            if (overshoot > minOvershoot) {
                overshoots.push({
                    peakIdx,
                    shelfStartIdx: shelfStart,
                    shelfEndIdx: shelfEnd,
                    pPeak,
                    pShelf,
                    overshoot,
                });
            }
        }
        i = shelfEnd;
    }
    return overshoots;
}
/**
 * Extract the fit inputs for one bag.
 *
 * Gauge pressure is the bag's channel minus the atmospheric reference, which is
 * the last POPULATED pressure column -- S4 on 4-bag hardware, S5 on 5-bag.
 * Hardcoding S4 measured every bag against bag 4 on 5-bag units, and `calibration
 * run` writes a fixed 6-column CSV padding absent channels with -1, so
 * subtracting an unpopulated column yields absolute pressure: `a` still looks
 * right while the intercept lands near -65 kPa.
 */
function extractCalibrationPoints(table, bagId) {
    const pressureCol = `Pressure_S${bagId}`;
    const pressureCols = table.columns
        .filter(c => c.startsWith("Pressure_S"))
        .sort((a, b) => parseInt(a.split("_S")[1], 10) - parseInt(b.split("_S")[1], 10));
    const populated = pressureCols.filter(c => (0, calibration_math_1.max)(table.data.get(c)) > 0);
    if (populated.length === 0) {
        throw new Error("No populated pressure columns found");
    }
    const atmCol = populated[populated.length - 1];
    const atmMean = (0, calibration_math_1.mean)(table.data.get(atmCol));
    if (!(atmMean > 50.0 && atmMean < 150.0)) {
        throw new Error(`Atmospheric reference ${atmCol} averages ${atmMean.toFixed(2)} kPa, which is ` +
            `not plausible ambient pressure. Gauge pressure would be wrong.`);
    }
    if (!table.columns.includes(pressureCol)) {
        throw new Error(`Column ${pressureCol} not found`);
    }
    // Scale the detection windows to the actual sample rate. The originals were
    // sample counts tuned for 10 Hz, but the hardware streams at 20 Hz, so a fixed
    // 20-sample stable window is really 1.0 s -- which silently rejected every
    // recovery on a run whose hold_duration was 0.5 s.
    const rate = table.data.get("Sample_Rate_Hz")[0];
    const medianFilter = Math.max(3, Math.round(MEDIAN_FILTER_S * rate) | 1);
    const recoveryWindow = Math.max(5, Math.round(RECOVERY_WINDOW_S * rate));
    const shelfWindow = Math.max(5, Math.round(OVERSHOOT_SHELF_S * rate));
    const inflationWindow = Math.max(5, Math.round(INFLATION_WINDOW_S * rate));
    const derivativeThreshold = DERIVATIVE_THRESHOLD_KPA_S / rate;
    const maxStableSlope = MAX_STABLE_SLOPE_KPA_S / rate;
    const minInflationSlope = MIN_INFLATION_SLOPE_KPA_S / rate;
    const bagValues = table.data.get(pressureCol);
    const atmValues = table.data.get(atmCol);
    const gaugeRaw = bagValues.map((v, idx) => v - atmValues[idx]);
    // Median filter removes spikes while preserving edges and slopes.
    const gauge = (0, calibration_math_1.rollingMedian)(gaugeRaw, medianFilter, 1);
    // Split the trace at the peak. Overshoots only occur while inflating and
    // recoveries only while deflating, but the overshoot detector cannot tell a
    // deflate step from a pump-off decay -- run over the whole trace it read 5
    // deflate steps as overshoots (3.03, 2.36, 1.79, 1.34, 0.97 kPa) alongside 6
    // real values near 0.15, and the IQR filter could not remove them because at
    // that level of contamination the outliers shift the quartiles meant to catch
    // them. Restricting each detector to its own phase makes that impossible.
    const peakIdx = (0, calibration_math_1.argmax)(gauge);
    const overshoots = detectInflationOvershoots(gauge.slice(0, peakIdx + 1), gaugeRaw.slice(0, peakIdx + 1), inflationWindow, minInflationSlope, shelfWindow);
    const recoveriesLocal = detectPressureRecoveries(gauge.slice(peakIdx), derivativeThreshold, recoveryWindow, maxStableSlope);
    // Shift indices back into whole-trace coordinates so callers and plots line up.
    const recoveries = recoveriesLocal.map(r => ({
        ...r,
        dropMinIdx: r.dropMinIdx + peakIdx,
        stableStartIdx: r.stableStartIdx + peakIdx,
        stableEndIdx: r.stableEndIdx + peakIdx,
    }));
    // Drop near-zero pressure points; see MIN_VALID_PRESSURE_KPA.
    const valid = recoveries.filter(r => r.pAfter >= MIN_VALID_PRESSURE_KPA);
    return {
        pBefore: valid.map(r => r.pBefore),
        pAfter: valid.map(r => r.pAfter),
        recoveries: valid,
        overshoots,
    };
}
/**
 * Fit `p_after = a * p_before + b` with iterative outlier removal.
 *
 * Points whose residual exceeds `outlierThreshold` standard deviations are
 * dropped and the fit repeated, up to `maxIterations`.
 */
function computeCalibration(pBefore, pAfter, outlierThreshold = 3.5, maxIterations = 2) {
    if (pBefore.length < MIN_DATA_POINTS) {
        throw new Error(`Insufficient data points: ${pBefore.length} < ${MIN_DATA_POINTS}`);
    }
    let x = pBefore.slice();
    let y = pAfter.slice();
    for (let iter = 0; iter < maxIterations; iter++) {
        if (x.length < MIN_DATA_POINTS)
            break;
        const fit = (0, calibration_math_1.linregress)(x, y);
        const residuals = x.map((xi, idx) => Math.abs(y[idx] - (fit.slope * xi + fit.intercept)));
        const stdResidual = (0, calibration_math_1.std)(residuals);
        if (stdResidual === 0)
            break;
        const limit = outlierThreshold * stdResidual;
        const inliers = residuals.map((r, idx) => (r < limit ? idx : -1)).filter(idx => idx >= 0);
        if (inliers.length === residuals.length)
            break;
        x = inliers.map(idx => x[idx]);
        y = inliers.map(idx => y[idx]);
    }
    if (x.length < MIN_DATA_POINTS) {
        throw new Error(`Too few points after outlier removal: ${x.length} < ${MIN_DATA_POINTS}`);
    }
    const final = (0, calibration_math_1.linregress)(x, y);
    return { a: final.slope, intercept: final.intercept, rSquared: final.rSquared };
}
/** Validate coefficients against expected ranges. Returns null when they pass. */
function validateCalibration(a, b, rSquared, deflateIntercept) {
    if (rSquared < MIN_R_SQUARED) {
        return `R^2 too low: ${rSquared.toFixed(3)} < ${MIN_R_SQUARED}`;
    }
    // The intercept is a small kPa offset (observed 0.07-0.12). A large magnitude
    // means the fit ran on absolute rather than gauge pressure, which leaves `a`
    // looking correct while the intercept lands near -65 kPa. The firmware rejects
    // this, but catch it here so it never gets as far as a flash write.
    if (Math.abs(deflateIntercept) > MAX_ABS_INTERCEPT_KPA) {
        return `deflate intercept out of range: ${deflateIntercept.toFixed(4)} kPa, ` +
            `|ci| > ${MAX_ABS_INTERCEPT_KPA} — gauge pressure is likely wrong ` +
            `(check that the atmospheric reference column was identified)`;
    }
    if (a < MIN_A_COEFFICIENT || a > MAX_A_COEFFICIENT) {
        return `'a' coefficient out of range: ${a.toFixed(3)} not in [${MIN_A_COEFFICIENT}, ${MAX_A_COEFFICIENT}]`;
    }
    if (b < MIN_B_COEFFICIENT || b > MAX_B_COEFFICIENT) {
        return `'b' coefficient out of range: ${b.toFixed(3)} not in [${MIN_B_COEFFICIENT}, ${MAX_B_COEFFICIENT}]`;
    }
    return null;
}
/** Analyze one bag. Never throws: a failure comes back as `success: false`. */
function analyzeBag(table, bagId) {
    const blank = (error, dataPoints = 0, overshootPoints = 0, overshootValues = []) => ({
        bag_id: bagId,
        success: false,
        a: null,
        b: null,
        b_std: null,
        b_cv: null,
        b_cv_warning: null,
        deflate_intercept: null,
        r_squared: null,
        data_points: dataPoints,
        overshoot_points: overshootPoints,
        overshoot_values: overshootValues,
        deflate_multiplier_low: null,
        deflate_intercept_low: null,
        error,
    });
    let points;
    try {
        points = extractCalibrationPoints(table, bagId);
    }
    catch (err) {
        return blank(err instanceof Error ? err.message : String(err));
    }
    const overshootValues = points.overshoots.map(o => (0, calibration_math_1.roundTo)(o.overshoot, 3));
    // `b` is the median inflation overshoot, with IQR outlier removal. It comes from the inflate
    // phase alone, so it is reported even when the deflate fit below fails.
    let b = 0.0;
    let bStd = 0.0;
    if (points.overshoots.length > 0) {
        let values = points.overshoots.map(o => o.overshoot);
        if (values.length >= 3) {
            const keep = (0, calibration_math_1.outlierIqrMask)(values, OUTLIER_IQR_MULTIPLIER).map(i => values[i]);
            if (keep.length > 0)
                values = keep;
        }
        b = (0, calibration_math_1.median)(values);
        bStd = values.length > 1 ? (0, calibration_math_1.std)(values) : 0.0;
    }
    const bRounded = (0, calibration_math_1.roundTo)(b, 3);
    const bStdRounded = (0, calibration_math_1.roundTo)(bStd, 3);
    let bCv = null;
    let bCvWarning = null;
    if (bRounded > 0) {
        bCv = (0, calibration_math_1.roundTo)(bStdRounded / bRounded, 3);
        if (bCv > 0.3) {
            bCvWarning = "High variance in overshoot measurements";
        }
    }
    // A bag with no overshoots reports no b rather than b = 0.
    const withB = points.overshoots.length > 0
        ? {
            b: bRounded, b_std: bStdRounded, b_cv: bCv, b_cv_warning: bCvWarning,
            overshoot_points: points.overshoots.length, overshoot_values: overshootValues,
        }
        : {};
    if (points.pBefore.length < MIN_DATA_POINTS) {
        return {
            ...blank(`Insufficient data points: ${points.pBefore.length} < ${MIN_DATA_POINTS}`, points.pBefore.length, points.overshoots.length, overshootValues),
            ...withB,
        };
    }
    let a;
    let deflateIntercept;
    let rSquared;
    try {
        // One linear fit over every valid point. The device takes a low-segment pair
        // (al, cl) but not the breakpoint it applies them at, so fitting a separate
        // low line would fit a knee the firmware does not share. Reporting al == a
        // and cl == ci makes the two segments one continuous line, whatever
        // breakpoint the firmware uses.
        ({ a, intercept: deflateIntercept, rSquared } = computeCalibration(points.pBefore, points.pAfter));
    }
    catch (err) {
        // data_points stays 0 here, matching the Python.
        return { ...blank(err instanceof Error ? err.message : String(err)), ...withB };
    }
    const validationError = validateCalibration(a, b, rSquared, deflateIntercept);
    return {
        bag_id: bagId,
        success: validationError === null,
        a: (0, calibration_math_1.roundTo)(a, 3),
        b: bRounded,
        b_std: bStdRounded,
        b_cv: bCv,
        b_cv_warning: bCvWarning,
        deflate_intercept: (0, calibration_math_1.roundTo)(deflateIntercept, 4),
        r_squared: (0, calibration_math_1.roundTo)(rSquared, 3),
        data_points: points.pBefore.length,
        overshoot_points: points.overshoots.length,
        overshoot_values: overshootValues,
        deflate_multiplier_low: (0, calibration_math_1.roundTo)(a, 3),
        deflate_intercept_low: (0, calibration_math_1.roundTo)(deflateIntercept, 4),
        error: validationError,
    };
}
/** Analyze a CSV for the given bags. Mirrors the Python CLI's JSON output. */
function analyzeCsv(csvPath, bags) {
    const table = loadCsv(csvPath);
    const results = bags.map(bagId => analyzeBag(table, bagId));
    return {
        success: results.every(r => r.success),
        csv_file: csvPath,
        bags: results,
    };
}
//# sourceMappingURL=calibration_analyzer.js.map