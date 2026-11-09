import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.symbol.*;
import java.io.*;

/** Reads an existing project only; no analysis, function creation, or target execution. */
public class ExportKeesonSampling extends GhidraScript {
  public void run() throws Exception {
    String[] args=getScriptArgs(); File out=new File(args[0]); out.mkdirs();
    DecompInterface di=new DecompInterface(); DecompileOptions options=new DecompileOptions();
    options.setRespectReadOnly(true);di.setOptions(options);di.openProgram(currentProgram);
    try(PrintWriter index=new PrintWriter(new File(out,"function-index.txt"))) {
      index.println("program="+currentProgram.getName()+" sha256="+currentProgram.getExecutableSHA256()+" language="+currentProgram.getLanguageID()+" base="+currentProgram.getImageBase());
      for(int n=1;n<args.length;n++) {
        Function f=getFunctionAt(toAddr(args[n]));if(f==null)f=getFunctionContaining(toAddr(args[n]));
        if(f==null){index.println("MISSING "+args[n]);continue;}
        String id=f.getEntryPoint().toString();index.println(id+" body="+f.getBody()+" size="+f.getBody().getNumAddresses());
        DecompileResults d=di.decompileFunction(f,60,monitor);
        try(PrintWriter w=new PrintWriter(new File(out,id+".c"))){w.println("/* Static Ghidra pseudocode; not original source. */");w.println(d.decompileCompleted()?d.getDecompiledFunction().getC():d.getErrorMessage());}
        try(PrintWriter w=new PrintWriter(new File(out,id+".asm.tsv"))) {
          InstructionIterator it=currentProgram.getListing().getInstructions(f.getBody(),true);
          while(it.hasNext()) {Instruction i=it.next();StringBuilder h=new StringBuilder();for(byte b:i.getBytes())h.append(String.format("%02x",b&255));w.println(i.getAddress()+"\t"+h+"\t"+i);}
        }
        try(PrintWriter w=new PrintWriter(new File(out,id+".refs.txt"))) {
          for(Reference r:getReferencesTo(f.getEntryPoint()))w.println("IN "+r.getFromAddress()+" "+r.getReferenceType()+" function="+getFunctionContaining(r.getFromAddress()));
          for(Function g:f.getCalledFunctions(monitor))w.println("CALL "+g.getEntryPoint()+" "+g.getName());
        }
      }
    }finally{di.dispose();}
  }
}
