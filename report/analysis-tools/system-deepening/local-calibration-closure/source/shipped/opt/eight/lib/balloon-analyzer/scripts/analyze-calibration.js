#!/usr/bin/env node
/**
 * Standalone runner for the TypeScript calibration analyzer.
 *
 * Same arguments and same JSON on stdout as scripts/analyze_calibration.py, so
 * the two can be diffed directly (see scripts/compare_analyzers.py). Needs a
 * build first: `npm run build`.
 *
 * Usage:
 *   node scripts/analyze-calibration.js <csv_file> [--bags 0,1,2,3]
 */

const path = require('path');

const args = process.argv.slice(2);
const csvFile = args.find(a => !a.startsWith('--'));
const bagsFlagIdx = args.indexOf('--bags');
const bagsArg = bagsFlagIdx >= 0 ? args[bagsFlagIdx + 1] : '0,1,2,3,4';

if (!csvFile) {
    console.error('usage: node scripts/analyze-calibration.js <csv_file> [--bags 0,1,2,3]');
    process.exit(2);
}

let analyzeCsv;
try {
    ({ analyzeCsv } = require(path.resolve(__dirname, '..', 'build', 'calibration_analyzer')));
} catch (err) {
    console.error(`Could not load the built analyzer — run 'npm run build' first.\n${err.message}`);
    process.exit(2);
}

const bags = bagsArg.split(',').map(b => parseInt(b.trim(), 10));
if (bags.some(Number.isNaN)) {
    console.log(JSON.stringify({ success: false, error: `Invalid bag IDs: ${bagsArg}` }));
    process.exit(1);
}

let result;
try {
    result = analyzeCsv(csvFile, bags);
} catch (err) {
    console.log(JSON.stringify({ success: false, error: `Failed to load CSV: ${err.message}` }));
    process.exit(1);
}

console.log(JSON.stringify(result, null, 2));
process.exit(result.success ? 0 : 1);
