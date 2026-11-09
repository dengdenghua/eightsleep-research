import ghidra.app.script.GhidraScript;
import ghidra.program.model.listing.*;
import ghidra.program.model.symbol.*;
import java.io.*;
public class InventoryLegacy extends GhidraScript {
 public void run() throws Exception {
  File out=new File(getScriptArgs()[0]);out.mkdirs();
  try(PrintWriter w=new PrintWriter(new File(out,"functions.txt"))){for(Function f:currentProgram.getFunctionManager().getFunctions(true)){w.println("FUNCTION "+f.getEntryPoint()+" "+f.getName()+" "+f.getBody());for(Function c:f.getCalledFunctions(monitor))w.println(" CALL "+c.getEntryPoint());}}
  try(PrintWriter w=new PrintWriter(new File(out,"strings.txt"))){for(Data d:currentProgram.getListing().getDefinedData(true)){if(d.hasStringValue()){w.println("STRING "+d.getAddress()+" "+d.getValue());for(Reference r:getReferencesTo(d.getAddress())){Function f=getFunctionContaining(r.getFromAddress());w.println(" REF "+r.getFromAddress()+" "+r.getReferenceType()+" owner="+(f==null?"none":f.getEntryPoint()));}}}}
 }
}
