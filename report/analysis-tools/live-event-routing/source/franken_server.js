"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.SocketFrankenServer = exports.SocketFranken = void 0;
const sequential_queue_1 = require("./sequential_queue");
const message_stream_1 = require("./message_stream");
const promise_streams_1 = require("@eight/promise-streams");
const utils_1 = require("./utils");
const unix_socket_server_1 = require("./unix_socket_server");
const promises_1 = require("@eight/promises");
class SocketFranken {
    constructor(writeStream, messageStream, sequentialQueue, socket, logger) {
        this.writeStream = writeStream;
        this.messageStream = messageStream;
        this.sequentialQueue = sequentialQueue;
        this.socket = socket;
        this.logger = logger;
    }
    async sendMessage(request) {
        const responseBytes = await this.sequentialQueue.exec(async () => {
            const requestBytes = Buffer.concat([Buffer.from(request), SocketFranken.separator]);
            await this.writeStream.write(requestBytes);
            const resp = await this.messageStream.readMessage();
            await promises_1.Promises.wait(50);
            return resp;
        });
        return responseBytes.toString();
    }
    tryStripNewlines(arg) {
        const containsNewline = arg.indexOf("\n") >= 0;
        if (!containsNewline)
            return arg;
        this.logger.info(`newline detected in function arg "${arg}"`);
        return arg.replace(/\n/gm, "");
    }
    async callFunction(name, arg) {
        const commandNumber = utils_1.frankenCommands[name];
        const cleanedArg = this.tryStripNewlines(arg);
        return parseInt(await this.sendMessage(`${commandNumber}\n${cleanedArg}`));
    }
    async getVariables() {
        const command = "PLEASE_SEND_VARIABLES";
        const commandNumber = utils_1.frankenCommands[command];
        const varResp = await this.sendMessage(commandNumber);
        const parsedVars = Object.fromEntries(varResp.split("\n").map(l => l.split(" = ")));
        return parsedVars;
    }
    close() {
        const socket = this.socket;
        if (!socket.destroyed)
            socket.destroy();
    }
    static fromSocket(socket, logger) {
        const stream = promise_streams_1.PromiseStreams.toPromise(socket);
        const messageStream = new message_stream_1.MessageStream(stream, SocketFranken.separator);
        return new SocketFranken(stream, messageStream, new sequential_queue_1.SequentialQueue(), socket, logger);
    }
}
exports.SocketFranken = SocketFranken;
SocketFranken.separator = Buffer.from("\n\n");
class SocketFrankenServer {
    constructor(server, logger) {
        this.server = server;
        this.logger = logger;
    }
    async close() {
        await this.server.close();
    }
    async waitForFranken() {
        const socket = await this.server.waitForConnection();
        this.logger.info("franken connected");
        return SocketFranken.fromSocket(socket, this.logger.child({ component: "franken" }));
    }
    static async start(path, logger) {
        logger = logger.child({ component: "franken-server" });
        const unixSocketServer = await unix_socket_server_1.UnixSocketServer.start(path, logger);
        return new SocketFrankenServer(unixSocketServer, logger);
    }
}
exports.SocketFrankenServer = SocketFrankenServer;
//# sourceMappingURL=franken_server.js.map