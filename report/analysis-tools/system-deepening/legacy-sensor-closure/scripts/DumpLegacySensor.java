import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.*;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.symbol.*;
import java.io.*;
public class DumpLegacySensor extends GhidraScript {
 public void run() throws Exception {
  File out=new File(getScriptArgs()[0]);out.mkdirs();
  DecompInterface dc=new DecompInterface();DecompileOptions opt=new DecompileOptions();opt.setRespectReadOnly(true);dc.setOptions(opt);dc.openProgram(currentProgram);
  try(PrintWriter index=new PrintWriter(new File(out,"INDEX.tsv"))) {
   for(Function f:currentProgram.getFunctionManager().getFunctions(true)) {
    String a=f.getEntryPoint().toString();index.println(a+"\t"+f.getName()+"\t"+f.getBody().getNumAddresses());
    try(PrintWriter w=new PrintWriter(new File(out,a+".txt"))) {
     w.println("FUNCTION "+a+" "+f.getName()+" BODY "+f.getBody());
     for(Reference r:getReferencesTo(f.getEntryPoint()))w.println("INCOMING "+r.getFromAddress()+" "+r.getReferenceType());
     DecompileResults d=dc.decompileFunction(f,30,monitor);if(d.decompileCompleted())w.println(d.getDecompiledFunction().getC());else w.println("DECOMPILE_ERROR "+d.getErrorMessage());
     w.println("ASSEMBLY");
     for(Instruction i:currentProgram.getListing().getInstructions(f.getBody(),true)) {
      w.print(i.getAddress()+" "+i+" BYTES ");for(byte v:i.getBytes())w.printf("%02x",v&255);
      for(Reference r:i.getReferencesFrom()){w.print(" REF "+r.getReferenceType()+"="+r.getToAddress());if(r.getReferenceType().isData())try{w.print(" WORD="+Integer.toHexString(getInt(r.getToAddress())));}catch(Exception e){}}
      w.println();
     }
    }
   }
  }
  dc.dispose();
 }
}
