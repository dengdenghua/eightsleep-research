import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.*;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.symbol.*;
import java.io.*;
import java.util.*;

public class ExportPrepublish extends GhidraScript {
  public void run() throws Exception {
    String[] args=getScriptArgs();
    File out=new File(args[0]);out.mkdirs();
    if (!currentProgram.getExecutableSHA256().equals("84727b57ef8b226c78618f9fa9257df7d8ae771c78d8a51e6f3cabf0acc0c375"))
      throw new RuntimeException("Unexpected target hash");
    Set<Function> funcs=new LinkedHashSet<>();
    try(PrintWriter refs=new PrintWriter(new File(out,"target-refs.txt"))) {
      for(int i=1;i<args.length;i++) {
        String arg=args[i];
        if(arg.startsWith("xref:")) {
          Address target=toAddr(arg.substring(5));
          for(Reference r:getReferencesTo(target)) {
            Function f=getFunctionContaining(r.getFromAddress());
            refs.println("TARGET "+target+" REF "+r.getFromAddress()+" TYPE "+r.getReferenceType()+" FUNCTION "+(f==null?"none":f.getEntryPoint()));
            if(f!=null)funcs.add(f);
          }
        } else {
          Function f=getFunctionAt(toAddr(arg));
          if(f==null)f=getFunctionContaining(toAddr(arg));
          if(f==null)throw new RuntimeException("No function at "+arg);
          funcs.add(f);
        }
      }
    }
    DecompInterface di=new DecompInterface();di.openProgram(currentProgram);
    try(PrintWriter index=new PrintWriter(new File(out,"function-index.txt"))) {
      index.println("Program "+currentProgram.getName()+" sha256 "+currentProgram.getExecutableSHA256()+" language "+currentProgram.getLanguageID()+" imageBase "+currentProgram.getImageBase());
      for(Function f:funcs) {
        index.println(f.getEntryPoint()+" "+f.getName()+" size="+f.getBody().getNumAddresses());
        DecompileResults result=di.decompileFunction(f,60,monitor);
        try(PrintWriter w=new PrintWriter(new File(out,f.getEntryPoint()+".c"))) {
          w.println("/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */");
          w.println(result.decompileCompleted()?result.getDecompiledFunction().getC():result.getErrorMessage());
        }
        try(PrintWriter w=new PrintWriter(new File(out,f.getEntryPoint()+".asm.txt"))) {
          InstructionIterator it=currentProgram.getListing().getInstructions(f.getBody(),true);
          while(it.hasNext()) {
            Instruction ins=it.next();StringBuilder hex=new StringBuilder();
            for(byte value:ins.getBytes())hex.append(String.format("%02x",value&255));
            w.println(ins.getAddress()+" "+hex+" "+ins.toString());
          }
        }
        try(PrintWriter w=new PrintWriter(new File(out,f.getEntryPoint()+".refs.txt"))) {
          for(Reference r:getReferencesTo(f.getEntryPoint()))w.println("CALLER "+r.getFromAddress()+" "+getFunctionContaining(r.getFromAddress()));
          for(Function called:f.getCalledFunctions(monitor))w.println("CALLEE "+called.getEntryPoint()+" "+called.getName());
        }
      }
    } finally {di.dispose();}
  }
}
