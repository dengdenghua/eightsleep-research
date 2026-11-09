import ghidra.app.script.GhidraScript;
public class DefineSelected extends GhidraScript { public void run() throws Exception { for(String s:getScriptArgs()){var a=toAddr(Long.parseLong(s,16));disassemble(a);if(getFunctionAt(a)==null)createFunction(a,"analyst_selected_"+s);} } }
