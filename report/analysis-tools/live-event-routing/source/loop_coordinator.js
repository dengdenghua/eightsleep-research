"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.LoopCoordinator = void 0;
const utils_1 = require("./utils");
const promises_1 = require("@eight/promises");
const capybara_1 = require("./capybara");
const device_api_networkinfo_1 = require("./device_api_networkinfo");
const commands_1 = require("./commands");
const fs_1 = require("fs");
const peripheral_state_pusher_1 = require("./peripheral_state_pusher");
class FrankNotReadyError extends Error {
    constructor(message) {
        super(message);
        this.name = "FrankNotReadyError";
    }
}
const defaultAlarmDismiss = {};
const defaultDoubleTap = {};
const defaultTripleTap = {};
const defaultQuadTap = {};
const defaultVarValues = {
    sensorLabel: "null",
    leftPillowLabel: "null",
    rightPillowLabel: "null",
    leftSensorLabel: "null",
    rightSensorLabel: "null",
    waterLevel: "true",
    hasCap: "unknown",
    priming: "false",
    primingState: "{}",
    peripheralState: "{}",
    updating: "false",
    settings: "null",
    heatLevelL: "10",
    heatLevelR: "10",
    tgHeatLevelL: "10",
    tgHeatLevelR: "10",
    heatTimeL: "0",
    heatTimeR: "0",
    dismissAlarm: JSON.stringify(defaultAlarmDismiss),
    doubleTap: JSON.stringify(defaultDoubleTap),
    tripleTap: JSON.stringify(defaultTripleTap),
    quadTap: JSON.stringify(defaultQuadTap),
    needsPrime: "0",
    leftPillowOrientation: "null",
    rightPillowOrientation: "null",
    blanketState: JSON.stringify({
        left: {
            correct_orientation: null,
            error_string: "[tmag disconnected]",
            flow_direction: null,
            is_connected: false,
            temp: -1.0,
            x: -3.4028234663852886e38,
            y: -3.4028234663852886e38,
            z: -3.4028234663852886e38,
        },
        right: {
            correct_orientation: null,
            error_string: "[tmag disconnected]",
            flow_direction: null,
            is_connected: false,
            temp: -1.0,
            x: -3.4028234663852886e38,
            y: -3.4028234663852886e38,
            z: -3.4028234663852886e38,
        },
    }),
};
async function using(closable, body) {
    try {
        await body(closable);
    }
    finally {
        closable.close();
    }
}
class LoopCoordinator {
    constructor(frankenServer, deviceApi, capybara, hwInfo, vibrationProxy, logger) {
        this.frankenServer = frankenServer;
        this.deviceApi = deviceApi;
        this.capybara = capybara;
        this.hwInfo = hwInfo;
        this.vibrationProxy = vibrationProxy;
        this.logger = logger;
        this.variableValues = defaultVarValues;
        this.networkInfo = device_api_networkinfo_1.DeviceApiNetworkInfo.default;
        this.alarmDismiss = defaultAlarmDismiss;
        this.doubleTap = defaultDoubleTap;
        this.tripleTap = defaultTripleTap;
        this.quadTap = defaultQuadTap;
        // Constructed here, not as a field initializer: `logger` is a parameter property, and
        // field-initializer evaluation order relative to parameter properties is an emit detail.
        this.peripheralPusher = new peripheral_state_pusher_1.PeripheralStatePusher(this.logger);
    }
    async run(enabledFunc) {
        this.initSensorLabels();
        await Promise.all([
            this.deviceApiLoop(enabledFunc),
            this.frankenLoop(),
            this.capybaraLoop(),
            this.networkInfoLoop(),
        ]);
    }
    initSensorLabels() {
        this.variableValues["sensorLabel"] = this.hwInfo.sensorLabel;
        this.variableValues["leftPillowLabel"] = this.hwInfo.leftPillowLabel;
        this.variableValues["rightPillowLabel"] = this.hwInfo.rightPillowLabel;
    }
    pod3Cover() {
        const sensorLabel = this.variableValues["sensorLabel"];
        if (sensorLabel === "null")
            return false;
        const hwRev = sensorLabel.split("-")[2];
        // https://github.com/lunasleep/frankenfirmware/blob/0898272fd24ff28f2cf99cb831219ed4d5ceb729/firmware/src/subsystem/Sensor.cpp#L992C7-L992C7
        return hwRev >= "H00";
    }
    pod4Cover() {
        const sensorLabel = this.variableValues["sensorLabel"];
        if (sensorLabel === "null")
            return false;
        const hwRev = sensorLabel.split("-")[2];
        // https://github.com/lunasleep/frankenfirmware/blob/0898272fd24ff28f2cf99cb831219ed4d5ceb729/firmware/src/subsystem/Sensor.cpp#L992C7-L992C7
        return hwRev >= "I00";
    }
    k30Cover() {
        const sensorLabel = this.variableValues["sensorLabel"];
        if (sensorLabel === "null")
            return false;
        const hwRev = sensorLabel.split("-")[2];
        // Orbit-capable 6-ERM cover hardware. Orbit alarm patterns (frankenfirmware
        // PR #179) are UsbSensor-only; K30 is the cover rev that carries the ERM array.
        return hwRev >= "K30";
    }
    pod4Hub() {
        const label = this.hwInfo.deviceLabel;
        if (label === "null")
            return false;
        const hwRev = label.split("-")[2];
        return hwRev >= "G00";
    }
    a29() {
        const sensorLabel = this.variableValues["sensorLabel"];
        if (sensorLabel === "null")
            return false;
        const hwRev = sensorLabel.split("-")[2];
        return hwRev >= "J50";
    }
    a32Cover() {
        const labels = [
            this.variableValues["sensorLabel"],
            this.variableValues["leftSensorLabel"],
            this.variableValues["rightSensorLabel"],
        ];
        return labels.some((label) => label && label !== "null" && label.split("-")[0] === "20602");
    }
    I00Hub() {
        const label = this.hwInfo.deviceLabel;
        if (label === "null")
            return false;
        const hwRev = label.split("-")[2];
        return hwRev >= "I00";
    }
    pillowHardware() {
        const leftPillowLabel = this.variableValues["leftPillowLabel"];
        const rightPillowLabel = this.variableValues["rightPillowLabel"];
        return leftPillowLabel !== "null" || rightPillowLabel !== "null";
    }
    pillow() {
        const spec = this.hwInfo.specialization;
        return spec === "pillow";
    }
    async onVarRequest(name) {
        var _a, _b, _c, _d, _e, _f, _g;
        if (name === "supportedPatterns") {
            if (this.k30Cover()) {
                return JSON.stringify(utils_1.k30PatternNames);
            }
            else if (this.pod4Cover() || this.pillow() || this.pillowHardware()) {
                return JSON.stringify(utils_1.pod4PatternNames);
            }
            else if (this.pod3Cover()) {
                return JSON.stringify(utils_1.alarmPatternNames);
            }
            return JSON.stringify(utils_1.legacyAlarmPatternNames);
        }
        if (name === "macAddr")
            return JSON.stringify(this.networkInfo.macAddress);
        if (name === "ipaddr")
            return JSON.stringify(this.networkInfo.ipAddress);
        if (name === "ssid")
            return JSON.stringify(this.networkInfo.ssid);
        if (name === "sigstr")
            return JSON.stringify(this.networkInfo.rssi);
        if (name === "hubInfo")
            return JSON.stringify(this.hwInfo.deviceLabel);
        if (name === "sshPort")
            return JSON.stringify((0, fs_1.existsSync)("/run/dac/port") ? (_a = (0, fs_1.readFileSync)("/run/dac/ssh_port")) === null || _a === void 0 ? void 0 : _a.toString() : null);
        if (name === "adjBaseAddr")
            return JSON.stringify((0, fs_1.existsSync)("/persistent/AdjustableBaseConfiguration.json")
                ? (_d = (_c = (_b = JSON.parse((0, fs_1.readFileSync)("/persistent/AdjustableBaseConfiguration.json", "utf8"))) === null || _b === void 0 ? void 0 : _b.Address) === null || _c === void 0 ? void 0 : _c.toString()) !== null && _d !== void 0 ? _d : null
                : null);
        if (name === "b12Addr")
            return JSON.stringify((0, fs_1.existsSync)("/persistent/B12Configuration.json")
                ? (_g = (_f = (_e = JSON.parse((0, fs_1.readFileSync)("/persistent/B12Configuration.json", "utf8"))) === null || _e === void 0 ? void 0 : _e.Address) === null || _f === void 0 ? void 0 : _f.toString()) !== null && _g !== void 0 ? _g : null
                : null);
        // needsPrime is based on the priming reservoirs only on Pod4 hubs
        if (name === "needsPrime") {
            if (!this.pod4Hub()) {
                return JSON.stringify(null);
            }
        }
        if (name === "blanketState" && (!this.a29() || this.a32Cover())) {
            return JSON.stringify(null);
        }
        if (name.includes("PillowOrientation") && !this.pillow()) {
            return JSON.stringify(null);
        }
        return this.variableValues[name];
    }
    async onFuncRequest(name, arg) {
        const frankenCommand = utils_1.funcNameToFrankenCommand[name];
        if (frankenCommand) {
            const franken = this.franken;
            // if franken disconnects right before a function call this will throw
            // the error will bubble up to the main loop of the device-api-client (protocol handling)
            // and the client will crash disconnecting from device-api - this is safe, it's correctly cleaned-up,
            // deviceApiLoop will take care of reconnecting to device-api
            if (franken !== undefined) {
                return await this.vibrationProxy.callFunction(franken.callFunction.bind(franken), frankenCommand, arg);
            }
            throw new FrankNotReadyError("Calling function when frank connection is down");
        }
        const dacCommand = utils_1.funcNameToDACCommand[name];
        if (dacCommand) {
            try {
                await (0, commands_1.handleDACCommands)(dacCommand, arg);
            }
            catch (ex) {
                throw new Error(`Failed to properly handle DAC Command: ${ex}`);
            }
        }
        return 0;
    }
    async clearAlarm() {
        const franken = this.franken;
        if (franken !== undefined)
            await franken.callFunction("ALARM_CLEAR", "empty");
    }
    async networkInfoLoop() {
        while (true) {
            try {
                const info = await this.hwInfo.readNetworkInfo();
                this.networkInfo = device_api_networkinfo_1.DeviceApiNetworkInfo.fromNetworkInfo(info);
            }
            catch (error) {
                this.logger.error(error, "failed reading networkinfo");
                this.networkInfo = device_api_networkinfo_1.DeviceApiNetworkInfo.default;
            }
            await promises_1.Promises.wait(5000);
        }
    }
    async deviceApiLoop(enabledFunc) {
        while (true) {
            try {
                this.logger.info("connecting to device-api");
                await using(await this.deviceApi.connect(), async (client) => {
                    this.logger.info({ protocol: client.sessionProtocol }, "device-api connected");
                    client.onVar(this.onVarRequest.bind(this));
                    if (enabledFunc) {
                        client.onFunc(this.onFuncRequest.bind(this));
                    }
                    else {
                        client.onFunc(async (name, arg) => {
                            this.logger.info({ funcName: name, funcArg: arg }, "ignoring function request in cavia mode");
                            return 0;
                        });
                    }
                    this.waterNotification = client.notifyWaterState.bind(client);
                    this.peripheralPusher.bind(client.notifyPeripheralState.bind(client));
                    this.capNotification = client.notifyCapState.bind(client);
                    this.needPrimeNotification = client.notifyPriming.bind(client);
                    this.dismissNotification = client.dismissAlarm.bind(client);
                    this.doubleTapNotification = client.doubleTap.bind(client);
                    this.tripleTapNotification = client.tripleTap.bind(client);
                    this.quadTapNotification = client.quadTap.bind(client);
                    await client.run();
                });
            }
            catch (error) {
                this.logger.error(error, "device-api disconnected");
                this.peripheralPusher.unbind();
                this.waterNotification = undefined;
                this.capNotification = undefined;
                this.needPrimeNotification = undefined;
                this.dismissNotification = undefined;
                this.doubleTapNotification = undefined;
                this.tripleTapNotification = undefined;
                this.quadTapNotification = undefined;
                await promises_1.Promises.wait(5000);
            }
        }
    }
    async capybaraLoop() {
        var logger = this.logger.child({ component: "capybara" });
        while (true) {
            const req = await this.capybara.waitRequest();
            switch (req.type) {
                case capybara_1.CapybaraRequest.DismissAlarm:
                    logger.info("dismiss alarm");
                    await this.clearAlarm();
                    break;
                case capybara_1.CapybaraRequest.GetVariable:
                    logger.info(`get variable: ${req.arguments}`);
                    const response = await this.onVarRequest(req.arguments);
                    logger.info(`variable response: ${response}`);
                    await this.capybara.sendResponse(response);
                    break;
                case capybara_1.CapybaraRequest.FunctionCall:
                    logger.info(`function call received with arguments: ${JSON.stringify(req.arguments)}`);
                    try {
                        var resp = await this.onFuncRequest(req.arguments.name, req.arguments.arg);
                        var status = resp === 0 ? "success" : "error";
                        const responseJson = JSON.stringify({ status: status, responseCode: resp });
                        logger.info(`Sending function response: ${responseJson}`);
                        await this.capybara.sendResponse(responseJson);
                    }
                    catch (error) {
                        logger.error(error, "Frank socket not currently connected");
                        const errorResponse = JSON.stringify({
                            status: "error",
                            responseCode: -1,
                            reason: "frank_down",
                        });
                        await this.capybara.sendResponse(errorResponse);
                    }
                    break;
                default:
                    logger.error(new Error(`Unknown request type`), `Received unknown request type: ${req.type}`);
            }
        }
    }
    async tryNotifyWaterChange(waterPresent) {
        if (this.waterNotification === undefined)
            return;
        await this.waterNotification(waterPresent);
    }
    async updateWaterState(waterPresent) {
        const currentState = this.waterState;
        if (currentState === undefined) {
            this.waterState = waterPresent;
            return;
        }
        if (waterPresent !== currentState) {
            this.logger.info(`water state change: ${currentState} -> ${waterPresent}`);
            this.waterState = waterPresent;
            await this.tryNotifyWaterChange(waterPresent);
        }
    }
    async tryNotifyCapChange(capPresent) {
        if (this.capNotification === undefined)
            return;
        await this.capNotification(capPresent);
    }
    async updateCapState(capPresent) {
        const currentState = this.capState;
        if (currentState === undefined) {
            this.capState = capPresent;
            return;
        }
        if (capPresent !== currentState) {
            this.logger.info(`cap state change: ${currentState} -> ${capPresent}`);
            this.capState = capPresent;
            await this.tryNotifyCapChange(capPresent);
        }
    }
    async refreshCapState() {
        const hasCap = this.variableValues["hasCap"];
        if (this.I00Hub() && (hasCap === "true" || hasCap === "false")) {
            await this.updateCapState(hasCap === "true");
        }
    }
    async tryNotifyNeedPrime(needPrime) {
        if (this.needPrimeNotification === undefined)
            return;
        await this.needPrimeNotification(needPrime);
    }
    async updatePrimeNeeded(needPrime) {
        const currentState = this.primeNeeded;
        if (currentState === undefined) {
            this.primeNeeded = needPrime;
            return;
        }
        if (needPrime !== currentState) {
            this.logger.info(`prime needed state change: ${currentState} -> ${needPrime}`);
            this.primeNeeded = needPrime;
            await this.tryNotifyNeedPrime(needPrime);
        }
    }
    async tryNotifyDismiss(dismiss) {
        if (this.dismissNotification === undefined)
            return;
        await this.dismissNotification(dismiss);
    }
    async processAlarmDismiss() {
        await this.processGesture("dismissAlarm", this.alarmDismiss, this.tryNotifyDismiss.bind(this));
    }
    async tryNotifyDoubleTap(doubleTap) {
        if (this.doubleTapNotification === undefined)
            return;
        await this.doubleTapNotification(doubleTap);
    }
    async tryNotifyTripleTap(tripleTap) {
        if (this.tripleTapNotification === undefined)
            return;
        await this.tripleTapNotification(tripleTap);
    }
    async tryNotifyQuadTap(quadTap) {
        if (this.quadTapNotification === undefined)
            return;
        await this.quadTapNotification(quadTap);
    }
    async processTTC() {
        await this.processGesture("doubleTap", this.doubleTap, this.tryNotifyDoubleTap.bind(this));
        await this.processGesture("tripleTap", this.tripleTap, this.tryNotifyTripleTap.bind(this));
        await this.processGesture("quadTap", this.quadTap, this.tryNotifyQuadTap.bind(this));
    }
    async processGesture(variableName, currentState, notifyUpdate) {
        if (Object.keys(currentState).length === 0) {
            Object.assign(currentState, JSON.parse(this.variableValues[variableName]));
            return;
        }
        const current = currentState;
        const next = JSON.parse(this.variableValues[variableName]);
        if (next.l > current.l || next.r > current.r || next.s > current.s) {
            this.logger.info({ next }, `${variableName} state change`);
            const diff = {};
            Object.keys(next).forEach((key) => {
                if (next[key] > current[key])
                    diff[key] = next[key];
            });
            if (Object.keys(diff).length > 0) {
                await notifyUpdate(diff);
            }
            Object.assign(currentState, next);
        }
    }
    async frankenLoop() {
        while (true) {
            try {
                const franken = await this.frankenServer.waitForFranken();
                try {
                    this.franken = franken;
                    while (true) {
                        await promises_1.Promises.wait(1000);
                        const resp = await franken.getVariables();
                        this.variableValues = { ...this.variableValues, ...resp };
                        await this.processAlarmDismiss();
                        await this.processTTC();
                        await this.updateWaterState(this.variableValues["waterLevel"] == "true");
                        await this.refreshCapState();
                        await this.updatePrimeNeeded(parseInt(this.variableValues["needsPrime"], 10));
                        await this.peripheralPusher.push(this.variableValues["peripheralState"]);
                    }
                }
                finally {
                    franken.close();
                    this.franken = undefined;
                }
            }
            catch (err) {
                this.logger.error(err, "franken disconnected");
            }
        }
    }
}
exports.LoopCoordinator = LoopCoordinator;
//# sourceMappingURL=loop_coordinator.js.map