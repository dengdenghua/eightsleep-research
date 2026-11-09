import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.*;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.symbol.*;
import java.io.*;
public class ExportRawWire extends GhidraScript {
 public void run() throws Exception {
  String[] a=getScriptArgs(); File out=new File(a[0]);out.mkdirs();
  DecompInterface di=new DecompInterface();di.openProgram(currentProgram);
  try(PrintWriter idx=new PrintWriter(new File(out,"index.txt"))){
   idx.println("Binary SHA256 "+currentProgram.getExecutableSHA256()+" base "+currentProgram.getImageBase());
   for(int n=1;n<a.length;n++) {
    Address addr=toAddr(a[n]);Function f=getFunctionAt(addr);
    if(f==null){idx.println("MISSING "+addr);continue;}
    String id=f.getEntryPoint().toString();idx.println(id+" "+f.getName()+" bytes "+f.getBody().getNumAddresses());
    DecompileResults dr=di.decompileFunction(f,60,monitor);
    try(PrintWriter w=new PrintWriter(new File(out,id+".c"))){w.println("/* Reconstructed Ghidra pseudocode, not vendor source. */");w.println(dr.decompileCompleted()?dr.getDecompiledFunction().getC():dr.getErrorMessage());}
    try(PrintWriter w=new PrintWriter(new File(out,id+".asm"))){
     InstructionIterator it=currentProgram.getListing().getInstructions(f.getBody(),true);
     while(it.hasNext()){Instruction i=it.next();w.print(i.getAddress()+" ");for(byte b:i.getBytes())w.printf("%02x",b&255);w.println(" "+i);}
    }
    try(PrintWriter w=new PrintWriter(new File(out,id+".refs"))){
     for(Reference ref:getReferencesTo(f.getEntryPoint()))w.println("IN "+ref.getFromAddress()+" "+ref.getReferenceType());
     for(Function c:f.getCalledFunctions(monitor))w.println("OUT "+c.getEntryPoint()+" "+c.getName());
    }
   }
  }finally{di.dispose();}
 }
}
