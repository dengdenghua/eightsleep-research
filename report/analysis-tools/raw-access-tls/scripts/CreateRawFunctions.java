import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
public class CreateRawFunctions extends GhidraScript {
 public void run() throws Exception {
  for(String s:getScriptArgs()) {
   Address a=toAddr(s);Function f=getFunctionAt(a);
   if(f==null){Function c=getFunctionContaining(a);println("CREATE "+s+" existingContainer="+c);if(c!=null)continue;disassemble(a);f=createFunction(a,"Recovered_"+s);}
   println("RESULT "+f);
  }
 }
}
