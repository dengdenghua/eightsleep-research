"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.DeviceApi = exports.DeviceApiClient = exports.EIGHT_HOST_SUFFIXES = void 0;
exports.isAllowedHost = isAllowedHost;
exports.spkiSha256 = spkiSha256;
exports.helloPayload = helloPayload;
exports.credentialsToOptions = credentialsToOptions;
exports.tlsConnect = tlsConnect;
const crypto_1 = require("crypto");
const tls_1 = require("tls");
const promise_streams_1 = require("@eight/promise-streams");
const utils_1 = require("./utils");
const promises_1 = require("@eight/promises");
const coap_stream_1 = require("./dev_api/coap_stream");
const device_protocol_1 = require("./dev_api/device_protocol");
const v2_frame_stream_1 = require("./dev_api/v2_frame_stream");
const v2_handshake_1 = require("./dev_api/v2_handshake");
const howdySize = 128;
function wrapSocketError(err) {
    const error = new Error(`socker error: ${err.toString()}`);
    error.name = "TransportError";
    return error;
}
exports.EIGHT_HOST_SUFFIXES = [".8slp.net", ".8slp.net.cn"];
function isAllowedHost(host, allowedSuffixes) {
    return allowedSuffixes.some(suffix => host === suffix.replace(/^\./, "") || host.endsWith(suffix));
}
function spkiSha256(certificateDer) {
    const spki = new crypto_1.X509Certificate(certificateDer).publicKey.export({ type: "spki", format: "der" });
    return (0, crypto_1.createHash)("sha256").update(spki).digest("hex");
}
function helloPayload(deviceInfo) {
    // osVersion is the running rootfs's eight-os SHA (/etc/rat_version). It rides the hello rather
    // than being served as a variable because it is immutable for the life of the connection: a new
    // image means a reboot, which means a new hello. JSON.stringify omits the key entirely when the
    // file was unreadable, which device-api reads as "not reported" and falls back to update-api.
    const payload = { specialization: deviceInfo.specialization, osVersion: deviceInfo.osVersion };
    return Buffer.from(JSON.stringify(payload));
}
function unverifiedOptions(timeout) {
    return { rejectUnauthorized: false, timeout, checkServerIdentity: () => undefined };
}
function credentialsToOptions(policy, timeout) {
    if (!policy.rejectUnauthorized)
        return unverifiedOptions(timeout);
    return {
        rejectUnauthorized: true,
        timeout,
        ...(policy.extraCa ? { ca: [policy.extraCa] } : {}),
        checkServerIdentity: (host, cert) => {
            const identityError = (0, tls_1.checkServerIdentity)(host, cert);
            if (identityError)
                return identityError;
            if (!isAllowedHost(host, policy.allowedHostSuffixes)) {
                return new Error(`refusing connection: "${host}" is not an Eight (${policy.allowedHostSuffixes.join(", ")}) host`);
            }
            return undefined;
        },
    };
}
async function tlsConnect(host, port, options) {
    return await new Promise((resolve, reject) => {
        const socket = (0, tls_1.connect)(port, host, options, () => {
            socket.removeListener("error", fail);
            socket.removeListener("timeout", stall);
            resolve(socket);
        });
        const fail = (err) => {
            socket.destroy();
            reject(err);
        };
        const stall = () => fail(new Error(`connect to ${host}:${port} timed out`));
        socket.once("error", fail);
        socket.once("timeout", stall);
    });
}
function assertDefined(value, name = "value") {
    if (value === undefined)
        throw new Error(`${name} is undefined`);
}
class DeviceApiClient {
    constructor(deviceInfo, protocol, socket, watchdog, logger, sessionProtocol) {
        this.deviceInfo = deviceInfo;
        this.protocol = protocol;
        this.socket = socket;
        this.watchdog = watchdog;
        this.logger = logger;
        this.sessionProtocol = sessionProtocol;
        this.varHandler = this.unhandledVariables.bind(this);
        this.funcHandler = this.unhandledFunctions.bind(this);
        protocol.register("/d", this.handleDescribe.bind(this));
        protocol.register("/v", this.handleVariable.bind(this));
        protocol.register("/f", this.handleFunction.bind(this));
    }
    async unhandledVariables() {
        throw new Error("unhandled variables");
    }
    async unhandledFunctions() {
        throw new Error("unhandled functions");
    }
    async handleDescribe(_) {
        return { type: "content", payload: (0, utils_1.describePayload)() };
    }
    async handleVariable(request) {
        var _a;
        const varName = (_a = /\/v\/(.*)/.exec(request.path)) === null || _a === void 0 ? void 0 : _a[1];
        assertDefined(varName, "variable name");
        // If invalid varaiable name, return empty/undefined
        if (!(0, utils_1.isValidVariableName)(varName))
            return { type: "content" };
        const varValue = await this.varHandler(varName);
        return { type: "content", payload: Buffer.from(varValue) };
    }
    async handleFunction(request) {
        var _a;
        if (request.path === "/f") {
            this.logger.info("responding to FW update");
            return { type: "changed" };
        }
        const funcName = (_a = /\/f\/(.*)/.exec(request.path)) === null || _a === void 0 ? void 0 : _a[1];
        const funcArg = request.query;
        assertDefined(funcName, "func name");
        assertDefined(funcArg, "func arg");
        this.logger.info({ funcName, funcArg }, "function request");
        const dacErrCode = -8; // DAC-specific error code
        const payload = Buffer.alloc(4, 0);
        try {
            const errCode = await this.funcHandler(funcName, funcArg);
            payload.writeInt32BE(errCode, 0);
        }
        catch (e) {
            this.logger.error(e, "failed to execute frank function");
            payload.writeInt32BE(dacErrCode, 0);
        }
        return { type: "changed", payload };
    }
    async sendHello() {
        const payload = helloPayload(this.deviceInfo);
        await this.protocol.sendMessage({ method: "post", path: "/hello", payload, confirmable: true });
    }
    async sendPing(millisTimeout) {
        await this.protocol.sendMessage({ method: "post", path: "/", confirmable: true }, millisTimeout);
    }
    async sendLog(message) {
        const payload = Buffer.from(message);
        await this.protocol.sendMessage({ method: "post", path: "/E/tracing/rat", payload });
    }
    async notifyWaterState(waterPresent) {
        const payload = Buffer.from([waterPresent ? 1 : 0]);
        await this.protocol.sendMessage({ method: "post", path: "/v/water", payload });
    }
    async notifyCapState(capPresent) {
        const payload = Buffer.from([capPresent ? 1 : 0]);
        await this.protocol.sendMessage({ method: "post", path: "/v/cap", payload });
    }
    async notifyPriming(priming) {
        const payload = Buffer.from([priming]);
        await this.protocol.sendMessage({ method: "post", path: "/v/needsPrime", payload });
    }
    // frank's peripheralState variable string, verbatim (single-line JSON). Non-confirmable like
    // the other /v pushes; delivery guarantees live in PeripheralStatePusher's retry.
    async notifyPeripheralState(json) {
        const payload = Buffer.from(json);
        await this.protocol.sendMessage({ method: "post", path: "/v/sensors", payload });
    }
    async dismissAlarm(times) {
        this.logger.info({ times }, "dismiss alarm");
        const payload = Buffer.from(JSON.stringify(times));
        await this.protocol.sendMessage({ method: "post", path: "/E/alarm/dismiss", payload });
    }
    async doubleTap(times) {
        this.logger.info({ times }, "double tap");
        const payload = Buffer.from(JSON.stringify(times));
        await this.protocol.sendMessage({ method: "post", path: "/E/gesture/doubletap", payload });
    }
    async tripleTap(times) {
        this.logger.info({ times }, "triple tap");
        const payload = Buffer.from(JSON.stringify(times));
        await this.protocol.sendMessage({ method: "post", path: "/E/gesture/tripletap", payload });
    }
    async quadTap(times) {
        this.logger.info({ times }, "quad tap");
        const payload = Buffer.from(JSON.stringify(times));
        await this.protocol.sendMessage({ method: "post", path: "/E/gesture/quadrupletap", payload });
    }
    async pinger() {
        const pingTimeoutMs = 10 * 1000;
        const pingIntervalMs = 10 * 1000;
        while (true) {
            await promises_1.Promises.wait(pingIntervalMs);
            try {
                await this.sendPing(pingTimeoutMs);
            }
            catch (err) {
                this.logger.error(err, "pinger error");
                throw err;
            }
            this.watchdog.kick();
        }
    }
    onVar(handler) {
        this.varHandler = handler;
    }
    onFunc(handler) {
        this.funcHandler = handler;
    }
    async run() {
        const proto = this.protocol.run();
        await Promise.race([this.sendHello(), proto]);
        await Promise.race([this.pinger(), proto]);
    }
    close() {
        if (!this.socket.destroyed)
            this.socket.destroy(new Error("DeviceApiClient closed"));
    }
}
exports.DeviceApiClient = DeviceApiClient;
class DeviceApi {
    constructor(endpoints, deviceInfo, clientVersion, tlsPolicy, watchdog, timer, logger) {
        this.endpoints = endpoints;
        this.deviceInfo = deviceInfo;
        this.clientVersion = clientVersion;
        this.tlsPolicy = tlsPolicy;
        this.watchdog = watchdog;
        this.timer = timer;
        this.logger = logger;
        this.sessionTimeout = 60 * 1000;
    }
    static formatHeader(messageSize, protocolVersion = 1) {
        const header = Buffer.alloc(8);
        header.writeUInt16BE(0x8888, 0);
        header.writeUInt16BE(protocolVersion, 2);
        header.writeUInt32BE(messageSize, 4);
        return header;
    }
    async createSecureStream(socket) {
        const socketStream = promise_streams_1.PromiseStreams.toPromise(socket, wrapSocketError);
        const reader = new promise_streams_1.ExactReader(socketStream);
        const howdy = await reader.read(howdySize);
        if (!howdy)
            throw new Error("rude server");
        const encodedMessage = Buffer.from(this.deviceInfo.deviceId);
        const header = DeviceApi.formatHeader(encodedMessage.length);
        await socketStream.write(Buffer.concat([header, encodedMessage]));
        return socketStream;
    }
    configSocket(socket) {
        socket.setNoDelay(true);
        socket.setTimeout(this.sessionTimeout, () => {
            socket.destroy(new Error("connection timed out"));
        });
    }
    newClient(socket, coapStream, sessionProtocol) {
        const deviceProtocol = new device_protocol_1.DeviceProtocol(coapStream);
        const logger = this.logger.child({ component: "device-api", protocol: sessionProtocol });
        return new DeviceApiClient(this.deviceInfo, deviceProtocol, socket, this.watchdog, logger, sessionProtocol);
    }
    async connectV2() {
        const { host, v2 } = this.endpoints;
        const socket = await tlsConnect(host, v2.port, credentialsToOptions(this.tlsPolicy, v2.connectTimeoutMs));
        try {
            this.configSocket(socket);
            const frames = new v2_frame_stream_1.V2FrameStream(promise_streams_1.PromiseStreams.toPromise(socket, wrapSocketError));
            const identity = { deviceId: this.deviceInfo.deviceId, clientVersion: this.clientVersion };
            await (0, v2_handshake_1.v2Handshake)(frames, identity, this.timer, this.logger);
            return this.newClient(socket, new coap_stream_1.CoapStream(frames.coap()), "v2");
        }
        catch (err) {
            socket.destroy();
            throw err;
        }
    }
    async connectV1() {
        const { host, v1 } = this.endpoints;
        const socket = await tlsConnect(host, v1.port, unverifiedOptions(this.sessionTimeout));
        try {
            if (this.tlsPolicy.rejectUnauthorized) {
                const raw = socket.getPeerCertificate().raw;
                const spki = raw ? spkiSha256(raw) : undefined;
                if (spki === undefined || !v1.spkiPins.includes(spki))
                    throw new Error(`device-api v1 pin mismatch (spki sha256 ${spki})`);
            }
            this.configSocket(socket);
            return this.newClient(socket, new coap_stream_1.CoapStream(await this.createSecureStream(socket)), "v1");
        }
        catch (err) {
            socket.destroy();
            throw err;
        }
    }
    async connect() {
        this.watchdog.kick();
        const { host, v2 } = this.endpoints;
        if (v2.enabled) {
            try {
                return await this.connectV2();
            }
            catch (err) {
                this.logger.warn({ host, port: v2.port, reason: err.message }, "device-api v2 unavailable, falling back to v1");
            }
        }
        return await this.connectV1();
    }
}
exports.DeviceApi = DeviceApi;
//# sourceMappingURL=device_api.js.map