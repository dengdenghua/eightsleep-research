import ghidra.app.script.GhidraScript;
/** Explicit normal-entry repair in transient -readOnly session; no analyzeChanges, no saved project. */
public class PrepareLegacy extends GhidraScript {
 public void run() throws Exception {
  for(String s:getScriptArgs()) {
   if(s.startsWith("d:")){var a=toAddr(Long.parseLong(s.substring(2),16));println("TRANSIENT_DISASSEMBLE "+a);disassemble(a);continue;}
   var a=toAddr(Long.parseLong(s,16));
   if(getFunctionAt(a)==null) { println("TRANSIENT_DEFINE "+a);disassemble(a);println(String.valueOf(createFunction(a,"analyst_normal_entry_"+s))); }
  }
 }
}
