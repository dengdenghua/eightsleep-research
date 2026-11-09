import ghidra.app.script.GhidraScript;
/** New analyst-owned project setup: RAM mutable; does not change input bytes. */
public class ConfigureLegacy extends GhidraScript { public void run() throws Exception { currentProgram.getMemory().getBlock(toAddr(0x20000000)).setWrite(true); } }
