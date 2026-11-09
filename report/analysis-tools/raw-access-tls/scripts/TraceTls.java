import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.*;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.symbol.*;
import java.io.*;
import java.util.*;
import java.util.regex.*;

public class TraceTls extends GhidraScript {
 public void run() throws Exception {
  String[] args=getScriptArgs(); File out=new File(args[0]);out.mkdirs();
  Set<Function> funcs=new LinkedHashSet<>();
  Pattern p=Pattern.compile("could not load platform certs|could not load certs|could not add certificate|rawrs/src/raw/client",Pattern.CASE_INSENSITIVE);
  try(PrintWriter w=new PrintWriter(new File(out,"string-xrefs.txt"))) {
   DataIterator it=currentProgram.getListing().getDefinedData(true);
   while(it.hasNext()) {
    Data d=it.next();Object val=d.getValue();if(!(val instanceof String))continue;
    String s=(String)val;if(!p.matcher(s).find())continue;
    w.println("STRING "+d.getAddress()+" "+s);
    for(Reference r:getReferencesTo(d.getAddress())) {
     Function f=getFunctionContaining(r.getFromAddress());
     w.println(" REF "+r.getFromAddress()+" type="+r.getReferenceType()+" function="+(f==null?"none":f.getEntryPoint()));
     if(f!=null)funcs.add(f);
     if(f==null)for(Reference r2:getReferencesTo(r.getFromAddress())) {Function f2=getFunctionContaining(r2.getFromAddress());w.println(" REF2 "+r2.getFromAddress()+" function="+(f2==null?"none":f2.getEntryPoint()));if(f2!=null)funcs.add(f2);}
    }
   }
  }
  if(args.length>1) {funcs.clear();for(int i=1;i<args.length;i++){Function f=getFunctionAt(toAddr(args[i]));if(f==null)f=getFunctionContaining(toAddr(args[i]));if(f!=null)funcs.add(f);}}
  DecompInterface di=new DecompInterface();di.openProgram(currentProgram);
  try(PrintWriter w=new PrintWriter(new File(out,"function-index.txt"))) {
   w.println("Program "+currentProgram.getName()+" sha256 "+currentProgram.getExecutableSHA256()+" language "+currentProgram.getLanguageID()+" imageBase "+currentProgram.getImageBase());
   w.println("Total functions "+currentProgram.getFunctionManager().getFunctionCount());
   for(Function f:funcs) {
    w.println(f.getEntryPoint()+" "+f.getName()+" size="+f.getBody().getNumAddresses());
    DecompileResults dr=di.decompileFunction(f,60,monitor);
    try(PrintWriter pw=new PrintWriter(new File(out,f.getEntryPoint()+".c"))) {pw.println("/* Ghidra static pseudocode; not original source. */");pw.println(dr.decompileCompleted()?dr.getDecompiledFunction().getC():dr.getErrorMessage());}
    try(PrintWriter pw=new PrintWriter(new File(out,f.getEntryPoint()+".refs.txt"))) {
     for(Reference r:getReferencesTo(f.getEntryPoint()))pw.println("CALLER "+r.getFromAddress()+" "+getFunctionContaining(r.getFromAddress()));
     for(Function called:f.getCalledFunctions(monitor))pw.println("CALLEE "+called.getEntryPoint()+" "+called.getName());
    }
   }
  }
  di.dispose();
 }
}
