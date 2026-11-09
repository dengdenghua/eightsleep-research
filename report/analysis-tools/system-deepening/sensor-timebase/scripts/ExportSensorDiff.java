import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.*;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.symbol.*;
import ghidra.program.model.mem.*;
import java.io.*;

// Read-only export: never change disassembly, functions, context or RAM flags.
public class ExportSensorDiff extends GhidraScript {
 private void dump(PrintWriter w,AddressSetView body) throws Exception {
  InstructionIterator it=currentProgram.getListing().getInstructions(body,true);
  while(it.hasNext()){
   Instruction i=it.next();StringBuilder hex=new StringBuilder();
   for(byte b:i.getBytes())hex.append(String.format("%02x",b&255));
   w.print("INSN "+i.getAddress()+" "+hex+" "+i);
   for(Reference r:i.getReferencesFrom()){
    w.print(" REF["+r.getReferenceType()+":"+r.getToAddress());
    if(r.getReferenceType().isData())try{w.print("="+Integer.toHexString(getInt(r.getToAddress())));}catch(Exception e){}
    w.print("]");
   }
   w.println();
  }
 }
 public void run() throws Exception {
  String[] args=getScriptArgs();File out=new File(args[0]);out.mkdirs();
  try(PrintWriter meta=new PrintWriter(new File(out,"program.txt"))){
   meta.println("NAME "+currentProgram.getName());
   meta.println("EXECUTABLE_SHA256 "+currentProgram.getExecutableSHA256());
   meta.println("LANGUAGE "+currentProgram.getLanguageID());
   for(MemoryBlock b:currentProgram.getMemory().getBlocks())
    meta.println("BLOCK "+b.getName()+" "+b.getStart()+" "+b.getEnd()+" initialized="+b.isInitialized()+" write="+b.isWrite());
  }
  DecompInterface dc=new DecompInterface();
  DecompileOptions options=new DecompileOptions();options.setRespectReadOnly(true);dc.setOptions(options);dc.openProgram(currentProgram);
  for(int n=1;n<args.length;n++){
   if(args[n].contains(":")){
    String[] range=args[n].split(":");
    Address start=toAddr(Long.parseLong(range[0],16)),end=toAddr(Long.parseLong(range[1],16));
    try(PrintWriter w=new PrintWriter(new File(out,args[n].replace(':','_')+".txt"))){
     w.println("RANGE "+start+" "+end+" existing decoded instructions only; no disassembly mutation");
     dump(w,new AddressSet(start,end));
    }
    continue;
   }
   Address a=toAddr(Long.parseLong(args[n],16));Function f=getFunctionAt(a);
   if(f==null)f=getFunctionContaining(a);
   try(PrintWriter w=new PrintWriter(new File(out,args[n]+".txt"))){
    w.println("TARGET "+a+" function="+(f==null?"none":f.getEntryPoint()));
    for(Reference r:getReferencesTo(a))w.println("REF_TO "+r.getFromAddress()+" "+r.getReferenceType());
    if(f==null)continue;
    w.println("FUNCTION_BODY "+f.getBody());
    DecompileResults d=dc.decompileFunction(f,60,monitor);
    if(d.decompileCompleted())w.println(d.getDecompiledFunction().getC());else w.println("DECOMPILE_ERROR "+d.getErrorMessage());
    dump(w,f.getBody());
   }
  }
  dc.dispose();
 }
}
